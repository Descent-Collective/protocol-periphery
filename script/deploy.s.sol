// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.21;

import {MultiStaticcall} from "../src/mutliStaticcall.sol";
import {VaultGetters} from "../src/vaultGetters.sol";
import {VaultRouter} from "../src/vaultRouter.sol";

import {BaseScript, stdJson, console2} from "./base.s.sol";

contract DeployScript is BaseScript {
    using stdJson for string;

    function run()
        external
        broadcast
        returns (MultiStaticcall multiStaticcall, VaultGetters vaultGetters, VaultRouter vaultRouters)
    {
        multiStaticcall = new MultiStaticcall();
        vaultGetters = new VaultGetters();
        vaultRouters = new VaultRouter();
    }
}
