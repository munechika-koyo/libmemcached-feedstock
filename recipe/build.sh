#!/bin/bash
set -e
set -x

./configure --prefix="$PREFIX"

make -j${CPU_COUNT} ${VERBOSE_AT}
## tests hang on `testapp` on osx and linux
# make check
make install
