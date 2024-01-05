## Protocol Periphery

### Deployment address

#### Base Georli

| Contract Name            | Addresses                                  |
| ------------------------ | ------------------------------------------ |
| MultiStaticCall Contract | 0x5226c32C94acdd44743FC5c376582d6782FA7592 |
| VaultGetters Contract    | 0x63642E2E49922DA2095cFDB0781cFf01a0d69786 |
| VaultRouter Contract     | 0x7FCF3897429Af4e5f3A397330AD638D819e53328 |

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
