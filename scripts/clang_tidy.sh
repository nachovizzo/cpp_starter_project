#!/usr/bin/env bash
# @file      clang_tidy.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
set -e

# Don't run clang-tidy on tests/ folder, it will most likely fail
sources=$(find . -regextype posix-extended -regex \
  ".*\.(cpp|cxx|cc|hpp|hxx|h)" |
  grep -vE "^./(build|tests)/")

echo "Running clang-tidy on all project sources, except for the tests/ folder"
run-clang-tidy -quiet -p build/ ${sources} -j$(nproc --all)
