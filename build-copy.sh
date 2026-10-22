#!/bin/bash

ME="$(readlink -f "$0")"
RAYLIB_ROOT="$(dirname "$ME")"
TARGET_RAYLIB=$RAYLIB_ROOT/../cg-course/lib

pushd $RAYLIB_ROOT/src

make CC=gcc \
     PLATFORM_OS=LINUX \
     PLATFORM=PLATFORM_DESKTOP_GLFW \
     GRAPHICS=GRAPHICS_API_OPENGL_43 \
     RAYLIB_MODULE_AUDIO=FALSE \
     RAYLIB_MODULE_MODELS=FALSE \
     RAYLIB_BUILD_MODE=DEBUG \
     && mv libraylib.a $TARGET_RAYLIB/lib-linux/
make clean

cp raylib.h rlgl.h raygui.h $TARGET_RAYLIB/include
popd
