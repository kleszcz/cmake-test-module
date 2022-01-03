cmake_minimum_required(VERSION 3.22)

project(scenario_02)

add_executable(scenario_02 ../main.cpp)

find_package(TestModule CONFIG REQUIRED)
message(VERBOSE "Subsubdir TestModule_DIR=${TestModule_DIR}")

target_test_me(TARGET scenario_02 TEST boo FILES foo bar baz)