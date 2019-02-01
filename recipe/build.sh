#!/bin/bash

export CPPFLAGS="-I${PREFIX}/include ${CPPFLAGS}"

./configure --prefix=$PREFIX
make -j${CPU_COUNT}
make test
make install
