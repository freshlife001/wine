#!/usr/bin/env arch -x86_64 bash
set -euo pipefail

# === 环境变量 ===
export CC=clang
export CXX=clang++
export i386_CC="ccache i686-w64-mingw32-gcc"
export x86_64_CC="ccache x86_64-w64-mingw32-gcc"
export CPATH=/usr/local/include
export LIBRARY_PATH=/usr/local/lib
export CFLAGS="-O3"
export CROSSCFLAGS="-O3 -Wno-error=incompatible-pointer-types -Wno-error=int-conversion"
export LDFLAGS="-Wl,-ld_classic -Wl,-headerpad_max_install_names -Wl,-rpath,@loader_path/../../ -Wl,-rpath,/usr/local/lib"
export MACOSX_DEPLOYMENT_TARGET=10.15.4

export WINE_CONFIGURE="$PWD/configure"
export BUILDROOT="$PWD/build"
export WINE_INSTALLROOT="install"
export WINE_MONO="https://github.com/madewokherd/wine-mono/releases/download/wine-mono-7.4.1/wine-mono-7.4.1-x86.tar.xz"

export PATH="$(brew --prefix bison)/bin:/opt/local/libexec/llvm-cx/bin:$PATH"
export ac_cv_lib_soname_MoltenVK="libMoltenVK.dylib"
export ac_cv_lib_soname_vulkan=""


mkdir -p "$BUILDROOT/wine64"
pushd "$BUILDROOT/wine64"
$WINE_CONFIGURE \
  --prefix= \
  --disable-tests \
  --disable-winedbg \
  --enable-win64 \
  --without-alsa \
  --without-capi \
  --with-coreaudio \
  --with-cups \
  --without-dbus \
  --without-fontconfig \
  --without-freetype \
  --with-gettext \
  --without-gettextpo \
  --without-gphoto \
  --without-gnutls \
  --without-gssapi \
  --without-krb5 \
  --with-mingw \
  --without-gstreamer \
  --without-netapi \
  --with-opencl \
  --with-opengl \
  --without-oss \
  --with-pcap \
  --with-pthread \
  --without-pulse \
  --without-sane \
  --without-sdl \
  --without-udev \
  --with-unwind \
  --without-usb \
  --without-v4l2 \
  --with-vulkan \
  --without-x 
popd


mkdir -p "$BUILDROOT/wine32on64"
pushd "$BUILDROOT/wine32on64"
$WINE_CONFIGURE \
  --prefix= \
  --disable-loader \
  --disable-tests \
  --disable-winedbg \
  --enable-win32on64 \
  --without-alsa \
  --without-capi \
  --with-coreaudio \
  --with-cups \
  --without-dbus \
  --without-fontconfig \
  --without-freetype \
  --with-gettext \
  --without-gettextpo \
  --without-gphoto \
  --without-gnutls \
  --without-gssapi \
  --without-gstreamer \
  --without-inotify \
  --without-krb5 \
  --with-mingw \
  --without-netapi \
  --without-openal \
  --with-opencl \
  --with-opengl \
  --without-oss \
  --with-pcap \
  --with-pthread \
  --without-pulse \
  --without-sane \
  --without-sdl \
  --without-udev \
  --with-unwind \
  --without-usb \
  --without-v4l2 \
  --with-vulkan \
  --with-wine64="$BUILDROOT/wine64" \
  --without-x
popd