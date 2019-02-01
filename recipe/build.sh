#!/bin/bash

./configure --prefix=$PREFIX --enable-shared
make -j${CPU_COUNT}
make test
make install
