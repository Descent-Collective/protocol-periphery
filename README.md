## Protocol Periphery

### Deployment address

#### Base Georli

| Contract Name            | Addresses                                  |
| ------------------------ | ------------------------------------------ |
| MultiStaticCall Contract | 0xb78A27F2fC100380F074846D79809142C9FA99B9 |
| VaultGetters Contract    | 0xDae34bf80b03a4F77Cd12679b8414088ea9cc5A2 |
| VaultRouter Contract     | 0xe2f47eBEA1942AFCa1F5dC432b86B6b6259E70dC |

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

To run deploy the deploy script, run:

```zsh
forge script script/deploy.s.sol:DeploymentScript --fork-url http://localhost:8545 --broadcast
```
