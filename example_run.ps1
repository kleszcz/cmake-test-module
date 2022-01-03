$env:CMAKE_GENERATOR="Ninja"
$env:CMAKE_BUILD_TYPE="Debug"
$env:DESTDIR="./install"

echo "[Configure]..."
cmake -B build -S . -DBUILD_TESTS=OFF --log-level=VERBOSE
echo "[Build]..."
cmake --build build
# ctest --test-dir build
echo "[Install]..."
cmake --install build --prefix "/" --component test-module
echo "[Build tests]..."
cmake -B build -S . -DCMAKE_PREFIX_PATH="$pwd/install" -DBUILD_TESTS=ON --log-level=VERBOSE