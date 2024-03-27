#!/bin/bash

RPC_URLS=(
    "https://rpc.starknet.lava.build/lava-referer-d169b15b-5984-454f-9b1f-f908bae1443e/",
    "https://rpc.starknet-testnet.lava.build/lava-referer-d169b15b-5984-454f-9b1f-f908bae1443e/",
    "https://rpc.starknet.lava.build/lava-referer-1802659e-6abe-41f5-9ea5-db37d5eb00af/",
    "https://rpc.starknet-testnet.lava.build/lava-referer-1802659e-6abe-41f5-9ea5-db37d5eb00af/",
    "https://rpc.starknet.lava.build/lava-referer-97547cf9-6b48-48ec-aef8-a62bf9a841b4/",
    "https://rpc.starknet-testnet.lava.build/lava-referer-97547cf9-6b48-48ec-aef8-a62bf9a841b4/",
    "https://rpc.starknet.lava.build/lava-referer-1ae8cb7b-9a3d-4b3f-9a02-725e513f6c67/",
    "https://rpc.starknet-testnet.lava.build/lava-referer-1ae8cb7b-9a3d-4b3f-9a02-725e513f6c67/",        
    "https://rpc.starknet.lava.build/lava-referer-f0e1b816-37da-4a4c-86aa-d4082739bb3d/",
    "https://rpc.starknet-testnet.lava.build/lava-referer-f0e1b816-37da-4a4c-86aa-d4082739bb3d/"
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
