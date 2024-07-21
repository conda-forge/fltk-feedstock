#!/bin/bash

set -ex

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .

# The build uses DSOFLAGS instead of LDFLAGS for shared libraries
export DSOFLAGS=$LDFLAGS

cmake -D CMAKE_BUILD_TYPE=Release     \
      -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_INSTALL_LIBDIR=lib     \
      -D FLTK_BUILD_FLUID=ON          \
      -D FLTK_FLUID_EXECUTABLE=ON     \
      -D FLTK_BUILD_EXAMPLES=OFF      \
      -D FLTK_BUILD_TEST=OFF          \
      -D FLTK_BUILD_SHARED_LIBS=ON    \
      -D GENERATE_EXPORT_HEADERS=ON   \
      -D FLTK_BUILD_FORMS=ON          \
      -D FLTK_USE_GL=ON               \
      $SRC_DIR

make -j${CPU_COUNT} install
