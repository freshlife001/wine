#!/usr/bin/env arch -x86_64 bash
set -euo pipefail

export BUILDROOT="$PWD/build"


pushd "$BUILDROOT/wine64"
#make clean
make -j$(sysctl -n hw.ncpu) dlls/user32/user32.dll dlls/user32/user32.so dlls/win32u/win32u.dll dlls/win32u/win32u.dll.so
popd

# pushd "$BUILDROOT/wine32on64"
# #make clean
# make -j$(sysctl -n hw.ncpu) dlls/user32/user32.dll  dlls/user32/user32.so dlls/win32u/win32u.dll dlls/win32u/win32u.dll.so
# popd