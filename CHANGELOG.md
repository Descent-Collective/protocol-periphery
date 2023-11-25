# Changelog

# Version 0.1.0

## Compiler settings

Solidity compiler: [0.8.21]

### contracts
- MultiStaticCall Contract: `0xb78A27F2fC100380F074846D79809142C9FA99B9`
- VaultGetters Contract:    `0xDae34bf80b03a4F77Cd12679b8414088ea9cc5A2`
- VaultRouter Contract     `0xe2f47eBEA1942AFCa1F5dC432b86B6b6259E70dC`

## Changes

### Bugfixes

#### consider `debtCeiling` when calculating `max_borrowable_amount`
Before now, debtCeiling wasn't considered when calculating `max_borrowable_amount` but instead we were just using the value of the max collateral taken.
