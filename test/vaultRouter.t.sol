// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {VaultRouter} from "../src/VaultRouter.sol";

contract VaultRouterTest is Test {
    VaultRouter public vaultRouter;

    function setUp() public {
        vaultRouter = new VaultRouter();
    }
}
