$env:CMAKE_GENERATOR="Ninja"
$env:CMAKE_BUILD_TYPE="Debug"
$env:DESTDIR="./install"

cmake -B build -S .
cmake --build build
ctest --test-dir build
cmake --install build --prefix "/install-prefix" --component test-module
