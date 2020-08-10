#!/usr/bin/env bash
# @file      test_coverage.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved

set -e

BUILD_DIR=$(pwd)
TEST_DIR=$(ctest --show-only=json-v1 | jq '.tests[0].properties[0].value' | tr -d '"')
TEST_COMMAND="$(ctest -V -N | grep -oP "(Test command:\s)\K([^\s]+)" | tail -n1 | tr -d '\n')"

# Change directory to where ctest expect to be the running
cd ${TEST_DIR}

# Run the coverage profiler
LLVM_PROFILE_FILE="TestCoverage.profraw" ${TEST_COMMAND}
llvm-profdata merge -sparse TestCoverage.profraw -o TestCoverage.profdata

# Create the html report
llvm-cov show ${TEST_COMMAND} \
    -instr-profile=TestCoverage.profdata \
    -show-line-counts-or-regions \
    -output-dir=${BUILD_DIR}/coverage/ \
    -ignore-filename-regex="tests/" \
    -format="html"

# Print to the standrad out the coverage report summary
llvm-cov report ${TEST_COMMAND} \
    -instr-profile=TestCoverage.profdata \
    -ignore-filename-regex="tests/"

# Go back to build directory
cd "${BUILD_DIR}"
