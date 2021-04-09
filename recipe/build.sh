#!/bin/bash

set -ex

./configure --prefix=$PREFIX

if [[ "$target_platform" == osx-* ]]; then
  # avoid libc++ conflict with <version>
  rm -rf VERSION
fi

make -j${CPU_COUNT}
make test
make install
