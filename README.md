## Protocol Periphery

### Deployment address

#### Base Georli
| Contract Name  | Addresses |
| ------------- | ------------- |
| MultiStaticCall Contract | 0x5d0583Ef20884C0b175046d515Ec227200C12C89  |
| VaultGetters Contract  | 0x18196CCaA8C2844c82B40a8bDCa27349C7466280  |
| VaultRouter Contract  | 0x94D80B2EA3cda86bF350DD7860e1171701F284c8  |


To install libraries needed, run:

```zsh
forge install
```

To run tests, run:

```zsh
forge test -vvv --gas-report
```

To run slither, run:

```zsh
slither .
```

To start a local node, run:

```zsh
anvil
```

To run deploy the deploy script, (be sure to have the parameters in `./deployParameters.json` needed for your script populated and also have an anvil instance running), run:

```zsh
forge script script/deploy.s.sol:DeploymentScript --fork-url http://localhost:8545 --broadcast
```


