#!/bin/bash
set -e
set -x

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/libtool/build-aux/config.* .

./configure \
    --prefix=${PREFIX} \
    --host=${HOST} \
    --build=${BUILD} \

make -j${CPU_COUNT} ${VERBOSE_AT}
## tests hang on `testapp` on osx and linux
# make check
make install

# Exclude man pages and other miscellaneous.
rm -rf "${PREFIX}/share"
