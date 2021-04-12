#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .
cp $BUILD_PREFIX/share/gnuconfig/config.* ./misc

set -ex

./configure --prefix=$PREFIX

if [[ "$target_platform" == osx-* ]]; then
  # avoid libc++ conflict with <version>
  rm -rf VERSION
fi

make -j${CPU_COUNT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
make test
fi
make install
