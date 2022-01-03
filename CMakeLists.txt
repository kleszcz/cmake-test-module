cmake_minimum_required(VERSION 3.22)
project(cmake-test-module LANGUAGES NONE)
enable_testing()

option(BUILD_TESTS "If On build tests - TestModuleConfig.cmake path must be provided" OFF)
install(
    FILES TestModuleConfig.cmake
    DESTINATION share/cmake/TestModule
    COMPONENT test-module
)

if(BUILD_TESTS)
    message(VERBOSE "Building tests. ${CMAKE_PREFIX_PATH}")
    add_subdirectory(tests)
endif()