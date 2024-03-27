#!/bin/bash

RPC_URLS=(
    "https://rpc.starknet.lava.build/lava-referer-04151628-ae45-4a00-b919-f9700e928085/",
    "https://rpc.starknet-testnet.lava.build/lava-referer-04151628-ae45-4a00-b919-f9700e928085/",
    "https://rpc.starknet.lava.build/lava-referer-7acd10b1-e83d-4cec-b687-d76b91ccde2c/",
    "https://rpc.starknet-testnet.lava.build/lava-referer-7acd10b1-e83d-4cec-b687-d76b91ccde2c/",
    "https://rpc.starknet.lava.build/lava-referer-e66ef502-4c41-4823-a449-f7487461eece/",
    "https://rpc.starknet-testnet.lava.build/lava-referer-e66ef502-4c41-4823-a449-f7487461eece/",
    "https://rpc.starknet.lava.build/lava-referer-596bbb20-0ec3-40d7-a03b-a141fee7018b/",
    "https://rpc.starknet-testnet.lava.build/lava-referer-596bbb20-0ec3-40d7-a03b-a141fee7018b/",        
    "https://rpc.starknet.lava.build/lava-referer-a781dad6-d1c0-4a63-8db4-5fa847767924/",
    "https://rpc.starknet-testnet.lava.build/lava-referer-a781dad6-d1c0-4a63-8db4-5fa847767924/"
)


OUTPUT_DIR="logs"

for RPC_URL in "${RPC_URLS[@]}"; do
    starknet_data=$(curl -s -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","id":"1","method":"starknet_blockNumber"}' "$RPC_URL")

    if [ $? -eq 0 ]; then
        if [ ! -d "$OUTPUT_DIR" ]; then
            mkdir "$OUTPUT_DIR"
        fi
        echo "$starknet_data" >> "$OUTPUT_DIR/starknet.txt"
        echo "StarkNet data fetched from $RPC_URL and saved to $OUTPUT_DIR/starknet.txt."
    else
        echo "Failed to fetch StarkNet data from $RPC_URL."
    fi
done
