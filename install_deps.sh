#!/usr/bin/env bash
set -euo pipefail

brew install bison pkg-config gcenx/wine/cx-llvm freetype gettext gnutls gstreamer sdl2 molten-vk winetricks

curl -L https://raw.githubusercontent.com/Homebrew/homebrew-core/31209a399a7b40bf2cd3abd7aee2715547ccd5bd/Formula/m/mingw-w64.rb > mingw-w64.rb && brew install mingw-w64.rb


port install llvm-cx 