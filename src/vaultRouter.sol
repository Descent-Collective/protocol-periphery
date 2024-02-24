// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

//  ==========  External imports    ==========
import {ERC20Token as ERC20} from "descent-collective/protocol-core/vault.sol";
import {Ownable} from "solady/auth/Ownable.sol";
import {SafeTransferLib} from "solady/utils/SafeTransferLib.sol";
import {Vault} from "descent-collective/protocol-core/vault.sol";
import {IPermit2, ISignatureTransfer, IAllowanceTransfer} from "permit2/interfaces/IPermit2.sol";

contract VaultRouter is Ownable {
    IPermit2 constant permit2 = IPermit2(0x000000000022D473030F116dDEE9F6B43aC78BA3);

    error MisMatchedInputsLength();
    error UnsafeCast();
    error InvalidEncodedParameterLength(uint256 expectedLength, uint256 length);

    constructor() {
        _initializeOwner(msg.sender);
    }

    enum Operations {
        // Invalid operation
        Invalid,
        // Vault operations
        DepositCollateral,
        WithdrawCollateral,
        MintCurrency,
        BurnCurrency,
        // Permit2 operations
        Permit2_PermitTransferFrom,
        Permit2_Permit,
        Permit2_TransferFrom,
        /// ERC20 Operations
        ERC20_Permit,
        ERC20_TransferFrom
    }

    function multiInteract(bytes calldata _packedOperations, bytes[] calldata _encodedParameters) external {
        unchecked {
            if (_packedOperations.length != _encodedParameters.length) revert MisMatchedInputsLength();
            uint8 _operation;
            for (uint256 i; i < _encodedParameters.length; ++i) {
                _operation = uint8(_packedOperations[i]);
                if (Operations(_operation) == Operations.Invalid) {
                    break;
                } else if (Operations(_operation) == Operations.Permit2_PermitTransferFrom) {
                    _requireInputIsRightLength(_encodedParameters[i], 288);
                    (address _token, uint256 _amount, uint256 _nonce, uint256 _deadline, bytes memory _signature) =
                        abi.decode(_encodedParameters[i], (address, uint256, uint256, uint256, bytes));
                    permit2.permitTransferFrom(
                        ISignatureTransfer.PermitTransferFrom({
                            permitted: ISignatureTransfer.TokenPermissions({token: _token, amount: _amount}),
                            nonce: _nonce,
                            deadline: _deadline
                        }),
                        ISignatureTransfer.SignatureTransferDetails({to: address(this), requestedAmount: _amount}),
                        msg.sender,
                        _signature
                    );
                } else if (Operations(_operation) == Operations.Permit2_Permit) {
                    _requireInputIsRightLength(_encodedParameters[i], 320);
                    (
                        address _token,
                        uint256 _amount,
                        uint256 _expiration,
                        uint256 _nonce,
                        uint256 _deadline,
                        bytes memory _signature
                    ) = abi.decode(_encodedParameters[i], (address, uint256, uint256, uint256, uint256, bytes));
                    permit2.permit(
                        msg.sender,
                        IAllowanceTransfer.PermitSingle({
                            details: IAllowanceTransfer.PermitDetails({
                                token: _token,
                                amount: uint160(_ensureSafeToCast(_amount, type(uint160).max)),
                                expiration: uint48(_ensureSafeToCast(_expiration, type(uint48).max)),
                                nonce: uint48(_ensureSafeToCast(_nonce, type(uint48).max))
                            }),
                            spender: address(this),
                            sigDeadline: _deadline
                        }),
                        _signature
                    );
                } else if (Operations(_operation) == Operations.Permit2_TransferFrom) {
                    _requireInputIsRightLength(_encodedParameters[i], 64);
                    (address _token, uint256 _amount) = abi.decode(_encodedParameters[i], (address, uint256));
                    permit2.transferFrom(
                        msg.sender, address(this), uint160(_ensureSafeToCast(_amount, type(uint160).max)), _token
                    );
                } else if (Operations(_operation) == Operations.DepositCollateral) {
                    _requireInputIsRightLength(_encodedParameters[i], 96);
                    (Vault _vaultContract, ERC20 _collateralToken, uint256 _amount) =
                        abi.decode(_encodedParameters[i], (Vault, ERC20, uint256));
                    _vaultContract.depositCollateral(_collateralToken, msg.sender, _amount);
                } else if (Operations(_operation) == Operations.WithdrawCollateral) {
                    _requireInputIsRightLength(_encodedParameters[i], 128);
                    (Vault _vaultContract, ERC20 _collateralToken, address _to, uint256 _amount) =
                        abi.decode(_encodedParameters[i], (Vault, ERC20, address, uint256));
                    _vaultContract.withdrawCollateral(_collateralToken, msg.sender, _to, _amount);
                } else if (Operations(_operation) == Operations.MintCurrency) {
                    _requireInputIsRightLength(_encodedParameters[i], 128);
                    (Vault _vaultContract, ERC20 _collateralToken, address _to, uint256 _amount) =
                        abi.decode(_encodedParameters[i], (Vault, ERC20, address, uint256));
                    _vaultContract.mintCurrency(_collateralToken, msg.sender, _to, _amount);
                } else if (Operations(_operation) == Operations.BurnCurrency) {
                    _requireInputIsRightLength(_encodedParameters[i], 96);
                    (Vault _vaultContract, ERC20 _collateralToken, uint256 _amount) =
                        abi.decode(_encodedParameters[i], (Vault, ERC20, uint256));
                    _vaultContract.burnCurrency(_collateralToken, msg.sender, _amount);
                } else if (Operations(_operation) == Operations.ERC20_Permit) {
                    _requireInputIsRightLength(_encodedParameters[i], 256);
                    (ERC20 _token, uint256 _amount, uint256 _deadline, bytes memory _signature) =
                        abi.decode(_encodedParameters[i], (ERC20, uint256, uint256, bytes));
                    (bytes32 _r, bytes32 _s) = abi.decode(_signature, (bytes32, bytes32));
                    uint8 _v = uint8(_signature[64]);
                    _token.permit(msg.sender, address(this), _amount, _deadline, _v, _r, _s);
                } else if (Operations(_operation) == Operations.ERC20_TransferFrom) {
                    _requireInputIsRightLength(_encodedParameters[i], 64);
                    (address _token, uint256 _amount) = abi.decode(_encodedParameters[i], (address, uint256));
                    if (_token.code.length == 0) revert();
                    SafeTransferLib.safeTransferFrom(_token, msg.sender, address(this), _amount);
                }
            }
        }
    }

    function approveTokenForVault(address _token, address _vaultAddress, bool isMax) external onlyOwner {
        SafeTransferLib.safeApprove(_token, _vaultAddress, isMax ? type(uint256).max : 0);
    }

    function _requireInputIsRightLength(bytes calldata _encodedParameter, uint256 _expectedLength) private pure {
        if (_expectedLength != _encodedParameter.length) {
            revert InvalidEncodedParameterLength(_expectedLength, _encodedParameter.length);
        }
    }

    function _ensureSafeToCast(uint256 num, uint256 maxOfX) private pure returns (uint256) {
        if (maxOfX < num) revert UnsafeCast();
        return num;
    }
}
