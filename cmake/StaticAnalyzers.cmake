# ~~~
# @file      StaticAnalyzers.cmake
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
if(ENABLE_CPPCHECK)
  find_program(CPPCHECK cppcheck)
  if(CPPCHECK)
    set(CMAKE_CXX_CPPCHECK
        ${CPPCHECK}
        --enable=all
        --suppress=missingInclude
        --suppress=unusedFunction
        --inconclusive)
  else()
    message(SEND_ERROR "cppcheck requested but executable not found")
  endif()
endif()

if(ENABLE_CLANG_TIDY)
  find_program(CLANGTIDY clang-tidy)
  if(NOT CLANGTIDY)
    message(SEND_ERROR "clang-tidy requested but executable not found")
  endif()

  add_custom_target(clang-tidy
                    COMMENT "Running clang-tidy on all sources"
                    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
                    COMMAND ${CMAKE_SOURCE_DIR}/scripts/clang_tidy.sh)

endif()
