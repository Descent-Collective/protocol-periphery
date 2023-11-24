# Delete the current artifacts
abis=./abis
rm -rf $abis

# Create the new artifacts directories
mkdir $abis \

# Generate the artifacts with Forge
FOUNDRY_PROFILE=optimized forge build

# Copy the production abis
cp out/multiStaticcall.sol/MultiStaticcall.json $abis
cp out/vaultGetters.sol/VaultGetters.json $abis
cp out/src/vaultRouter.sol/VaultRouter.json $abis