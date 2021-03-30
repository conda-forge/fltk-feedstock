#!/bin/bash

set -ex

./configure --prefix=$PREFIX
cat config.log
# avoid libc++ conflict with <version>
rm -rf VERSION

make -j${CPU_COUNT}
make test
make install
