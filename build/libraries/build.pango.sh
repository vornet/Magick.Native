#!/bin/bash
set -e

cd pango
rm pango/config.h
rm pango/pango-features.h
rm pango/pango-enum-types.c
rm pango/pango-enum-types.h

mkdir __build
cd __build
meson .. --prefix=/usr/local --default-library=static -Dgtk_doc=false -Dintrospection=false -DCMAKE_C_FLAGS="$FLAGS"
ninja install

if [ -d /usr/local/lib/x86_64-linux-gnu ]; then
  cp /usr/local/lib/x86_64-linux-gnu/*.a /usr/local/lib/
fi
if [ -d /usr/local/lib/aarch64-linux-gnu ]; then
  cp /usr/local/lib/aarch64-linux-gnu/*.a /usr/local/lib/
fi