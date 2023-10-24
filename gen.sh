# Generates genesis, chain spec, wasm bundle.
# WARNING: LOCAL NODE MUST BE BUILT USING CARGO BUILD --RELEASE!

echo "WARNING: LOCAL NODE MUST BE BUILT USING CARGO BUILD --RELEASE!"

# Build initial chain spec 
./target/release/parachain-template-node build-spec > ./generated/parachain_chain_spec.json  

echo "JSON chain spec built."

# Build the raw chain spec
./target/release/parachain-template-node build-spec --chain ./generated/parachain_chain_spec.json --disable-default-bootnode --raw > ./generated/parachain_chain_spec_raw.json

echo "Raw chain spec built."

# Compile the Wasm bundle
./target/release/parachain-template-node export-genesis-wasm --chain ./generated/parachain_chain_spec_raw.json ./generated/parachain-wasm

echo "Wasm runtime exported."

# Compile the genesis bundle
./target/release/parachain-template-node export-genesis-state --chain ./generated/parachain_chain_spec_raw.json ./generated/parachain-genesis-state 

echo "Genesis state exported."
echo "!!! DONE !!!"
