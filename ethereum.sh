#!/bin/bash

RPC_URLS=(
    "https://eth1.lava.build/lava-referer-04151628-ae45-4a00-b919-f9700e928085/",
    "https://eth1.lava.build/lava-referer-7acd10b1-e83d-4cec-b687-d76b91ccde2c/",
    "https://eth1.lava.build/lava-referer-e66ef502-4c41-4823-a449-f7487461eece/",
    "https://eth1.lava.build/lava-referer-596bbb20-0ec3-40d7-a03b-a141fee7018b/",
    "https://eth1.lava.build/lava-referer-a781dad6-d1c0-4a63-8db4-5fa847767924/"
)

OUTPUT_DIR="logs"

for RPC_URL in "${RPC_URLS[@]}"; do
    eth_data=$(curl -s -H "Content-type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_gasPrice","id":1}' "$RPC_URL")

    if [ $? -eq 0 ]; then
        if [ ! -d "$OUTPUT_DIR" ]; then
            mkdir "$OUTPUT_DIR"
        fi
        
        echo "$eth_data" >> "$OUTPUT_DIR/ethereum.txt"
        
        echo "Ethereum data fetched and saved to $OUTPUT_DIR/ethereum.txt."
    else
        echo "Failed to fetch Ethereum data."
    fi
done