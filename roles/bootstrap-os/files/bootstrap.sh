#!/bin/bash
set -e

BINDIR="/opt/bin"

mkdir -p $BINDIR

cd $BINDIR

if [[ -e $BINDIR/.bootstrapped-2 ]]; then
  exit 0
fi

rm -rf python pypy3

PYPY_VERSION=7.2.0

wget -O - https://github.com/squeaky-pl/portable-pypy/releases/download/pypy3.6-7.2.0/pypy3.6-$PYPY_VERSION-linux_x86_64-portable.tar.bz2 | tar -xjf -
mv -n pypy3.6-$PYPY_VERSION-linux_x86_64-portable pypy3

ln -s ./pypy3/bin/pypy3 python
$BINDIR/python --version

touch $BINDIR/.bootstrapped
