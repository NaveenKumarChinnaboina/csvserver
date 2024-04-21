#!/bin/bash

if [ "$#" -ne 2 ]; then
    exit 1
fi

start_index=$1
end_index=$2

output_file="inputFile"

# Check if outputFile is a directory
if [ -d "$output_file" ]; then
    echo "Error: '$output_file' is a directory."
    exit 1
fi

> "$output_file"

for ((i = start_index; i <= end_index; i++)); do
    random_number=$(( RANDOM % 1000 ))
    echo "$i, $random_number" >> "$output_file"
done

echo "File $output_file generated with indices from $start_index to $end_index."
