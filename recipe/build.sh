#!/bin/bash
set -e
set -x

./configure --prefix="$PREFIX"

make
## tests hang on `testapp` on osx and linux
# make check
make install
