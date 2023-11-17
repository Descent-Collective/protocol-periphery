// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {MultiStaticcall} from "../src/mutliStaticcall.sol";
import {VaultGetters} from "../src/vaultGetters.sol";
import {VaultRouter} from "../src/vaultRouter.sol";

contract DeploymentScript is Script {
    function run()
        public
        returns (
            MultiStaticcall multiStaticCallContract,
            VaultGetters vaultGettersContract,
            VaultRouter vaultRouterContract
        )
    {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        multiStaticCallContract = new MultiStaticcall();
        vaultGettersContract = new VaultGetters();
        vaultRouterContract = new VaultRouter();

        vm.stopBroadcast();
    }
}
