#!/bin/bash

#
# Copyright 2020 Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# An example how to build embedder without having pkgconf(1)
# configuration for flutter-engine-gtk library
# (flutter-engine-gtk.pc file).
#

# Set it to engine output directory, that is where
# libflutter_linux_gtk.so library is located.
ENGINE_OUT_DIR=~/projects/flutter/dw-8/engine/src/out/linux_debug_unopt_x64

mkdir -p ../build
pushd ../build
    cmake .. \
        -DCMAKE_VERBOSE_MAKEFILE=ON \
        -DCMAKE_CXX_FLAGS="-O0 -ggdb3" \
        -DFLUTTER_GTK_LIBRARIES=flutter_linux_gtk \
        -DFLUTTER_GTK_LIBRARY_DIRS=${ENGINE_OUT_DIR} \
        -DFLUTTER_GTK_INCLUDE_DIRS=${ENGINE_OUT_DIR}

    cmake --build . -j$(getconf _NPROCESSORS_ONLN)
popd
