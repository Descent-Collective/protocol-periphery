## Protocol Periphery

### Deployment address

#### Base Georli

| Contract Name            | Addresses                                  |
| ------------------------ | ------------------------------------------ |
| MultiStaticCall Contract | 0x16d8d245188f80081CC1B55Cd662fe37C26953D3 |
| VaultGetters Contract    | 0x7e2A9d40F4A580cef62D542beF3a7Cf38A13a76A |
| VaultRouter Contract     | 0x3B5137c6f458AfC8Ef02D18Edb213e678e314C54 |

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
