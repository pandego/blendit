#!/bin/bash

echo "Welcome to the model merger extravaganza! 🎉"

# Ask for the input YAML file
read -p "Enter the path to your input YAML file (e.g., src/config/example_task_arithmetic.yaml): " input_yaml

# Validate the input YAML file exists
if [ ! -f "$input_yaml" ]; then
    echo "The input YAML file does not exist. Please check the path and try again. Exiting... 🚨"
    exit 1
fi

# Ask for the output directory
read -p "Enter the path to your output directory (e.g., models/merged-models/my-first-blend): " output_dir

# Ask directly about CUDA usage
read -p "Do you wish to use CUDA? (yes/no): " use_cuda

cuda_arg="--no-cuda"
if [[ $use_cuda == "yes" ]]; then
    cuda_arg="--cuda"
fi

# Prompt for additional, non-CUDA arguments if needed
echo "Now, enter any additional arguments for the merge command, if any. Please exclude CUDA-related arguments as they have been handled separately."
read -p "Additional arguments: " user_args

# Construct the command without eval, safely incorporating user choices
command_args=(
    "mergekit-yaml" "$input_yaml" "$output_dir"
    "--verbose"
    "--allow-crimes"
    $cuda_arg
    "--copy-tokenizer"
    "--out-shard-size" "1B"
    "--lazy-unpickle"
    "--write-model-card"
    "--low-cpu-memory"
    "--random-seed" "123"
    "--trust-remote-code"
    "--safe-serialization"
    $user_args # Consider parsing and sanitizing this if possible
)

# Execute the command
"${command_args[@]}"

# Check if the command succeeded
if [ $? -eq 0 ]; then
    echo "Models merged successfully! 🚀"
else
    echo "Whoops! Something went wrong with the merge... 🚨"
fi
