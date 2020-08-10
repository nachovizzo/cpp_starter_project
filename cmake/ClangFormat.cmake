# ~~~
# @file      ClangFormat.cmake
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
find_program(CLANG_FORMAT "clang-format")
if(NOT CLANG_FORMAT)
  message(SEND_ERROR "clang-format not found on your \$\{PATH\}")
endif()

add_custom_target(clang-format
                  COMMENT "Checking clang-format changes"
                  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
                  COMMAND ${CMAKE_SOURCE_DIR}/scripts/clang_format.sh)
