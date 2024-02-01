## Protocol Periphery

- MultiStaticCall Contract: Used for batching staticcall requests to reduce rpc calls offchain
- VaultGetters Contract: Custom contract for calculating current data regarding a user's vault info and collateral info
- VaultRouter Contract: Convenience wrapper used for batching calls to the vault contract

  Note on VaultRouter `function multiInteract(bytes calldata _packedOperations, bytes[] calldata _encodedParameters)`:
  An explainer to this is required to clarify how it expects calldata to be sent. - `_packedOperations` is a packed list of the enum Operations. Each byte represents an enum variant. This method is more optimized as using the solidity array data type would encode each enum variant that is 1 byte to 32 bytes meaning that users pay an extra 124 gas per variant. - `_encodedParameters` is an array of bytes that is expected to be abi.encoded.

### Deployment address

#### Base Georli

| Contract Name            | Addresses                                  |
| ------------------------ | ------------------------------------------ |
| MultiStaticCall Contract | 0x5226c32C94acdd44743FC5c376582d6782FA7592 |
| VaultGetters Contract    | 0x63642E2E49922DA2095cFDB0781cFf01a0d69786 |
| VaultRouter Contract     | 0x7FCF3897429Af4e5f3A397330AD638D819e53328 |

#### Base Sepolia

| Contract Name            | Addresses                                  |
| ------------------------ | ------------------------------------------ |
| MultiStaticCall Contract | 0x53D0ec27F7221535e72C11BA85BA1a1De34298c5 |
| VaultGetters Contract    | 0x50fC21F951Bc42421815e104d21C5f094da9e70C |
| VaultRouter Contract     | 0x7F46a4944F9C3ecF4Ea622364132b3fE9aBa1015 |

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
