// @file      test_lib.cpp
// @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
//
// Copyright (c) 2020 Ignacio Vizzo, all rights reserved
#include <gtest/gtest.h>

#include "lib/example_lib.hpp"

TEST(Testlib, RemoveThisFile) { EXPECT_NO_THROW(delete_this_file::foo()); }
