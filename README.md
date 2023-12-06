## Protocol Periphery

### Deployment address

#### Base Georli

| Contract Name            | Addresses                                  |
| ------------------------ | ------------------------------------------ |
| MultiStaticCall Contract | 0x7E04A2380bF7F024Da53e60686f2e0608E987768 |
| VaultGetters Contract    | 0x3d8255F39C2DC306C05d2b503e74CCea1fD9F430 |
| VaultRouter Contract     | 0x2d4D7b224294573d02076cea252CbBD8156A4465 |

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
forge script script/deploy.s.sol:DeployScript --fork-url http://localhost:8545 --broadcast
```
