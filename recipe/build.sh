#!/bin/bash

set -ex

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .

./configure --prefix=$PREFIX

if [[ "$target_platform" == osx-* ]]; then
  # avoid libc++ conflict with <version>
  rm -rf VERSION
fi

make -j${CPU_COUNT}
make test
make install
