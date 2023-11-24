# Delete the current artifacts
artifacts=./artifacts
rm -rf $artifacts

# Create the new artifacts directories
mkdir $artifacts \

# Generate the artifacts with Forge
FOUNDRY_PROFILE=optimized forge build

# Copy the production artifacts
cp out-optimized/multiStaticcall.sol/multiStaticcall.json $artifacts
cp out-optimized/vaultGetters.sol/vaultGetters.json $artifacts
cp out-optimized/vaultRouter.sol/vaultRouter.json $artifacts

# Format the artifacts with Prettier
pnpm prettier --write ./artifacts