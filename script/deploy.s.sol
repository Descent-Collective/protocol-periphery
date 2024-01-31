// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.21;

import {MultiStaticcall} from "../src/multiStaticcall.sol";
import {VaultGetters} from "../src/vaultGetters.sol";
import {VaultRouter} from "../src/vaultRouter.sol";
import {BaseScript} from "./base.s.sol";

contract DeployScript is BaseScript {
    address constant usdcAddress = address(0); // put the usdc address on the deployment chain here
    address constant xNGNVault = address(0); // put the xNGN vault address on the deployment chain here

    function run()
        external
        broadcast
        returns (MultiStaticcall multiStaticcall, VaultGetters vaultGetters, VaultRouter vaultRouter)
    {
        if (usdcAddress == address(0)) revert("USDC address not set, visit the deploy script and set it");
        if (xNGNVault == address(0)) revert("XNGN vault address not set, visit the deploy script and set it");

        if (usdcAddress.code.length == 0) revert("USDC address set is not a contract, it has no code deployed to it");
        if (xNGNVault.code.length == 0) {
            revert("XNGN vault address set is not a contract, it has no code deployed to it");
        }

        multiStaticcall = new MultiStaticcall();
        vaultGetters = new VaultGetters();
        vaultRouter = new VaultRouter();

        vaultRouter.approveTokenForVault(usdcAddress, xNGNVault, true);
    }
}
