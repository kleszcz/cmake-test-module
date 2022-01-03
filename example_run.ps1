$env:CMAKE_GENERATOR="Ninja"
$env:CMAKE_BUILD_TYPE="Debug"
$env:DESTDIR="./install"

echo "[Configure]"
cmake -B build -S . -DBUILD_TESTS=ON --log-level=VERBOSE
echo "[Build]"
cmake --build build
echo "[Test]"
ctest --test-dir build
echo "[Install]"
cmake --install build --prefix "/" --component test-module