cmake_minimum_required(VERSION 3.22)
project(cmake-test-module LANGUAGES NONE)
enable_testing()

install(
    FILES TestModuleConfig.cmake
    DESTINATION share/cmake/TestModule
    COMPONENT test-module
)