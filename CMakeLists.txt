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
    # add_subdirectory(tests)
    add_test(NAME scenario_01 COMMAND cmake -B build/tests/scenario_01 -S ../tests/scenario_01 -DCMAKE_PREFIX_PATH=${CMAKE_SOURCE_DIR} --log-level=VERBOSE)
    add_test(NAME scenario_02 COMMAND cmake -B build/tests/scenario_02 -S ../tests/scenario_02 -DCMAKE_PREFIX_PATH=${CMAKE_SOURCE_DIR} --log-level=VERBOSE)

    set_tests_properties(scenario_02 PROPERTIES WILL_FAIL TRUE)
endif()