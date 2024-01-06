#!/bin/sh -l

clang-format --version

echo "Running clang-format on the following files:"

git diff --name-only HEAD HEAD^

# if check only

if [ "$1" = "true" ]; then
    echo "Checking formatting..."
    git clang-format --diff --style="$2" --extensions="$3" -v HEAD^
    exit 0
fi

# if check and format

if [ "$1" = "false" ]; then
    echo "Formatting files..."
    git clang-format --style="$2" --extensions="$3" -v HEAD^
    exit 0
fi