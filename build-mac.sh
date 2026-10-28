#!/bin/bash

ME="$(readlink -f "$0")"
RAYLIB_ROOT="$(dirname "$ME")"
BUILD_ROOT=$RAYLIB_ROOT/lib/lib-mac-intel/

pushd $RAYLIB_ROOT/src
mkdir -p $RAYLIB_ROOT/lib/lib-mac-intel
mkdir -p $RAYLIB_ROOT/lib/include

make PLATFORM_OS=OSX \
     PLATFORM=PLATFORM_DESKTOP_GLFW \
     GRAPHICS=GRAPHICS_API_OPENGL_33 \
     RAYLIB_MODULE_AUDIO=FALSE \
     RAYLIB_MODULE_MODELS=FALSE \
     RAYLIB_BUILD_MODE=RELEASE \
     && mv libraylib.a $TARGET_RAYLIB/lib-mac-intel/
make clean

cp raylib.h raygui.h $RAYLIB_ROOT/lib/include
popd
