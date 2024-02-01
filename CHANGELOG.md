# Changelog

# Version 0.1.0

## Compiler settings

Solidity compiler: [0.8.21]

### contracts

- MultiStaticCall Contract: `0xb78A27F2fC100380F074846D79809142C9FA99B9`
- VaultGetters Contract: `0xDae34bf80b03a4F77Cd12679b8414088ea9cc5A2`
- VaultRouter Contract `0xe2f47eBEA1942AFCa1F5dC432b86B6b6259E70dC`

## Changes

#### consider `debtCeiling` when calculating `max_borrowable_amount`

Before now, debtCeiling wasn't considered when calculating `max_borrowable_amount` but instead we were just using the value of the max collateral taken.

# Version 0.1.1

## Compiler settings

Solidity compiler: [0.8.21]

### contracts

- MultiStaticCall Contract: `0xB8747e5cce01AA5a51021989BA11aE33097db485`
- VaultGetters Contract: `0x3d35807343CbF4fDb16E42297F2214f62848D032`
- VaultRouter Contract `0xFBD26B871D55ba56B7a780eF1fF243Db7A3E81f4`

## Changes

- Add getter for collateral ratio
- Change get factor to return a boolean

# Version 0.1.2

## Compiler settings

Solidity compiler: [0.8.21]

### contracts

- MultiStaticCall Contract: `0x7E04A2380bF7F024Da53e60686f2e0608E987768`
- VaultGetters Contract: `0x3d8255F39C2DC306C05d2b503e74CCea1fD9F430`
- VaultRouter Contract `0x2d4D7b224294573d02076cea252CbBD8156A4465`

## Changes

- Fix wrong calculation in withdrawable collateral
- Fix typos
- Fix wrong deploy command in readme

# Version 0.1.3

## Compiler settings

Solidity compiler: [0.8.21]

### contracts
- MultiStaticCall Contract: `0x16d8d245188f80081CC1B55Cd662fe37C26953D3`
- VaultGetters Contract:    `0x7e2A9d40F4A580cef62D542beF3a7Cf38A13a76A`
- VaultRouter Contract     `0x3B5137c6f458AfC8Ef02D18Edb213e678e314C54`

## Changes
- Fix wrong calculation in available currency to borrow

# Version 0.1.4

## Compiler settings

Solidity compiler: [0.8.21]

### contracts

- MultiStaticCall Contract: `0x5226c32C94acdd44743FC5c376582d6782FA7592`
- VaultGetters Contract: `0x63642E2E49922DA2095cFDB0781cFf01a0d69786`
- VaultRouter Contract `0x7FCF3897429Af4e5f3A397330AD638D819e53328`

## Changes

- Fix `_getCollateralRatio` not accounting for the user's fees accrued since their accrued fees was last updated
- Make `getCollateralInfo` to return the accumulated (base + collateral rate) rate per annum not collateral rate per second


# Version Sepolia 0.1.0

## Compiler settings

Solidity compiler: [0.8.21]

### contracts

- MultiStaticCall Contract: `0x53D0ec27F7221535e72C11BA85BA1a1De34298c5`
- VaultGetters Contract: `0x50fC21F951Bc42421815e104d21C5f094da9e70C`
- VaultRouter Contract `0x7F46a4944F9C3ecF4Ea622364132b3fE9aBa1015`

## Changes
- Add router support for permit2 transferFrom, permit2 permit, permit2 permitTransferFrom, erc20 permit, erc20 transferFrom. To give more flexibility
- Update protocol-core dependencies
- Update vault-getters