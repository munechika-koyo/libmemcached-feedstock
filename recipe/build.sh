#!/bin/bash
set -e
set -x

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/libtool/build-aux/config.* .

# Skip ``make check`` when cross-compiling
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR:-}" != "" ]]; then
  make check
fi

./configure --prefix="$PREFIX"

make -j${CPU_COUNT} ${VERBOSE_AT}
## tests hang on `testapp` on osx and linux
# make check
make install

# Exclude man pages and other miscellaneous.
rm -rf "${PREFIX}/share"
