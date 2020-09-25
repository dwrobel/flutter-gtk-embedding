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

cmake_minimum_required (VERSION 3.9)
project (flutter_lanucher)
find_package(PkgConfig)

pkg_search_module(GTK gtk+-3.0 REQUIRED)

# If you do not have flutter-linux-gtk.pc file
# just provide all FLUTTER_* variables using -D
pkg_search_module(FLUTTER_GTK flutter-linux-gtk)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(SOURCES
    src/main.cc
    src/my_application.cc
)

link_directories(
    ${GTK_LIBRARY_DIRS}
    ${FLUTTER_GTK_LIBRARY_DIRS}
)

add_executable(flutter-launcher-gtk ${SOURCES})

target_compile_options(flutter-launcher-gtk PRIVATE
    ${GTK_CFLAGS_OTHER}
    ${FLUTTER_GTK_CFLAGS_OTHER}
)

target_include_directories(flutter-launcher-gtk PRIVATE
    ${GTK_INCLUDE_DIRS}
    ${FLUTTER_GTK_INCLUDE_DIRS}
)

target_include_directories(flutter-launcher-gtk PRIVATE
    ${GTK_INCLUDE_DIRS}
    ${FLUTTER_GTK_INCLUDE_DIRS}
)

target_link_libraries(flutter-launcher-gtk
    ${GTK_LIBRARIES}
    ${FLUTTER_GTK_LIBRARIES}
)

install(TARGETS flutter-launcher-gtk DESTINATION bin)
