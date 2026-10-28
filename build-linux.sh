#!/bin/bash

ME="$(readlink -f "$0")"
RAYLIB_ROOT="$(dirname "$ME")"
BUILD_ROOT=$RAYLIB_ROOT/lib/lib-linux/

pushd $RAYLIB_ROOT/src
mkdir -p $RAYLIB_ROOT/lib/lib-linux
mkdir -p $RAYLIB_ROOT/lib/include

make CC=gcc \
     PLATFORM_OS=LINUX \
     PLATFORM=PLATFORM_DESKTOP_GLFW \
     GRAPHICS=GRAPHICS_API_OPENGL_33 \
     RAYLIB_MODULE_AUDIO=FALSE \
     RAYLIB_MODULE_MODELS=FALSE \
     RAYLIB_BUILD_MODE=RELEASE \
     && mv libraylib.a $RAYLIB_ROOT/lib/lib-linux
make clean

cp raylib.h raygui.h $RAYLIB_ROOT/lib/include
popd
