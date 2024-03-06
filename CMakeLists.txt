cmake_minimum_required(VERSION 3.13)
project(Stasyan)

if (${PROJECT_SOURCE_DIR} STREQUAL ${PROJECT_BINARY_DIR})
    message(FATAL_ERROR "In-source build is forbidden")
endif()

set(CMAKE_CXX_STANDARD          20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS        OFF)

find_package(BISON REQUIRED)
find_package(FLEX REQUIRED)

set(CMAKE_CXX_FLAGS_DEBUG "-Wall -g -O0")

flex_target(lexer scanner.ll  ${CMAKE_CURRENT_BINARY_DIR}/lexer.cxx)

add_executable(${PROJECT_NAME} ${FLEX_lexer_OUTPUTS})
