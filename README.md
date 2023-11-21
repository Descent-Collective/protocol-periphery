## Protocol Periphery

### Deployment address

#### Base Georli

| Contract Name            | Addresses                                  |
| ------------------------ | ------------------------------------------ |
| MultiStaticCall Contract | 0x7F46a4944F9C3ecF4Ea622364132b3fE9aBa1015 |
| VaultGetters Contract    | 0xd870EbcfD3bA3652533d303847E55291336072e5 |
| VaultRouter Contract     | 0xEd78389a73Bd77c0A54f5DAcBA2beADbed27A9EC |

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
