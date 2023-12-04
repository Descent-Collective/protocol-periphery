// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {VaultGetters} from "../src/vaultGetters.sol";
import {VaultRouter} from "../src/VaultRouter.sol";
import {MultiStaticcall} from "../src/multiStaticcall.sol";

contract VaultRouterTest is Test {
    VaultRouter public vaultRouter;
    VaultGetters public vaultGetters;
    MultiStaticcall public multiStaticcall;

    function setUp() public {
        vaultRouter = new VaultRouter();
        vaultGetters = new VaultGetters();
        multiStaticcall = new MultiStaticcall();
    }
}
