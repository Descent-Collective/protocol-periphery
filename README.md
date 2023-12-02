## Protocol Periphery

### Deployment address

#### Base Georli

| Contract Name            | Addresses                                  |
| ------------------------ | ------------------------------------------ |
| MultiStaticCall Contract | 0xB8747e5cce01AA5a51021989BA11aE33097db485 |
| VaultGetters Contract    | 0x3d35807343CbF4fDb16E42297F2214f62848D032 |
| VaultRouter Contract     | 0xFBD26B871D55ba56B7a780eF1fF243Db7A3E81f4 |

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
