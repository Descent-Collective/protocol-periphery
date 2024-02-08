// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.21;

import {MultiStaticcall} from "../src/multiStaticcall.sol";
import {VaultGetters} from "../src/vaultGetters.sol";
import {VaultRouter} from "../src/vaultRouter.sol";
import {BaseScript} from "./base.s.sol";
import {ERC20Token} from "../src/mocks/ERC20Token.sol";
import {Currency} from "descent-collective/protocol-core/currency.sol";
import {stdJson} from "forge-std/StdJson.sol";

contract DeployScript is BaseScript {
    using stdJson for string;

    ERC20Token usdcAddress = getUsdc();
    Currency xNGNVault = getxNGN();

    function run()
        external
        broadcast
        returns (MultiStaticcall multiStaticcall, VaultGetters vaultGetters, VaultRouter vaultRouter)
    {
        if (address(usdcAddress) == address(0)) {
            revert("USDC address not set, visit the deploy script and set it");
        }
        if (address(xNGNVault) == address(0)) {
            revert("XNGN vault address not set, visit the deploy script and set it");
        }

        if (address(usdcAddress).code.length == 0) {
            revert("USDC address set is not a contract, it has no code deployed to it");
        }
        if (address(xNGNVault).code.length == 0) {
            revert("XNGN vault address set is not a contract, it has no code deployed to it");
        }

        multiStaticcall = new MultiStaticcall();
        vaultGetters = new VaultGetters();
        vaultRouter = new VaultRouter();

        vaultRouter.approveTokenForVault(address(usdcAddress), address(xNGNVault), true);
    }

    function getUsdc() private returns (ERC20Token usdc) {
        if (currentChain == Chains.Localnet) {
            usdc = new ERC20Token("Circle USD", "USDC", 6);
        } else {
            usdc = ERC20Token(getDeployConfigJson().readAddress(".USDC"));
        }
    }

    function getxNGN() private returns (Currency xNGN) {
        if (currentChain == Chains.Localnet) {
            xNGN = new Currency("xNGN", "xNGN");
        } else {
            xNGN = Currency(getDeployConfigJson().readAddress(".xNGN"));
        }
    }
}
