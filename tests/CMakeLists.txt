# ~~~
# @file      CMakeLists.txt
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
set(TEST_BINARY ${PROJECT_NAME}_test)
add_executable(${TEST_BINARY} test_lib.cpp)
target_link_libraries(${TEST_BINARY} lib GTest::Main)
gtest_discover_tests(${TEST_BINARY})
