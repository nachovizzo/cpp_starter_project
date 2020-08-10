#!/usr/bin/env bash
# @file      clang_format.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
set -e
sources=$(find . -regextype posix-extended -regex \
  ".*\.(cpp|cxx|cc|hpp|hxx|h)" |
  grep -vE "^./(build)/")

echo "Running clang-format on all project sources"
clang-format -Werror --dry-run --ferror-limit=1 -style=file ${sources}
