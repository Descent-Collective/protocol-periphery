// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

//  ==========  External imports    ==========
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Vault} from "descent-collective/protocol-core/vault.sol";

contract VaultRouter {
    error MisMatchedInputsLength(uint256 parameterIndex);

    enum Operations {
        DepositCollateral,
        WithdrawCollateral,
        MintCurrency,
        BurnCurrency
    }

    function multiInteract(
        Vault[] calldata _vaultContracts,
        Operations[] calldata _operations,
        ERC20[] calldata _collateralTokens,
        address[] calldata _tos,
        uint256[] calldata _amounts
    ) external {
        // it is assumed the first parameter's length is the standard
        uint256 _expectedLength = _vaultContracts.length;

        if (_expectedLength != _operations.length) revert MisMatchedInputsLength(1); // input at index `1` is of diff length compared to input at index 0
        if (_expectedLength != _collateralTokens.length) revert MisMatchedInputsLength(2); // input at index `2` is of diff length compared to input at index 0
        if (_expectedLength != _tos.length) revert MisMatchedInputsLength(3); // input at index `3` is of diff length compared to input at index 0
        if (_expectedLength != _amounts.length) revert MisMatchedInputsLength(4); // input at index `4` is of diff length compared to input at index 0

        // cache owner to save gas
        // always send for caller to prevent another user utilizing routers rely priviledges for another user maliciously
        address _owner = msg.sender;

        for (uint256 i; i < _expectedLength; ++i) {
            if (_operations[i] == Operations.DepositCollateral) {
                _vaultContracts[i].depositCollateral(_collateralTokens[i], _owner, _amounts[i]);
            } else if (_operations[i] == Operations.WithdrawCollateral) {
                _vaultContracts[i].withdrawCollateral(_collateralTokens[i], _owner, _tos[i], _amounts[i]);
            } else if (_operations[i] == Operations.MintCurrency) {
                _vaultContracts[i].mintCurrency(_collateralTokens[i], _owner, _tos[i], _amounts[i]);
            } else if (_operations[i] == Operations.BurnCurrency) {
                _vaultContracts[i].burnCurrency(_collateralTokens[i], _owner, _amounts[i]);
            }
        }
    }
}
