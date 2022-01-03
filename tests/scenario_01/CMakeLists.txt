cmake_minimum_required(VERSION 3.22)



add_executable(scenario_01 main.cpp)

find_package(TestModule CONFIG REQUIRED)
message(VERBOSE "Subsubdir TestModule_DIR=${TestModule_DIR}")

target_test_me(TARGET scenario_01 TEST FILES foo bar baz)