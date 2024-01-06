# Clang formatter action

This action runs clang-format on the latest commit.
Many clang-format alternatives exist, I know, but i wanted to learn how to write a github action.
Also, i'll keep this updated with the latest alpine version and will try to add as many options as possible.

## usage

```yml
---
name: "Clang format"

on:
  push:
    branches:
      - main
    pull_request:
      branches:
        - main

jobs:
  format:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          ref: ${{ github.head_ref }}
          fetch-depth: 2

      - uses: jayllyz/clang-format-action@v1
        with:
          check: false # Default: false, if true, will only check if the files are formatted correctly
          style: file # Default: file, can be file, llvm, chromium, google, mozilla, webkit
          extensions: cpp,h,hpp,c # Default: cpp,h,hpp,c (comma separated list of extensions, do not include the dot)

      # commit the changes (if there are any)
      # wip include this in the action
      - name: Commit changes
        uses: stefanzweifel/git-auto-commit-action@v5
        with:
          commit_message: "clang-format ✅"
          branch: ${{ github.head_ref }}
...
```
