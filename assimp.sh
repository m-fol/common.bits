package: assimp
version: "%(tag_basename)s"
tag: "v6.0.2"
source: https://github.com/assimp/assimp.git
requires:
  - "GCC-Toolchain:(?!osx)"
build_requires:
  - bits-recipe-tools
  - CMake
prefer_system: (?!slc5)
prefer_system_check:
---
#!/bin/bash -e
##############################
# Source set as null. File outside of scope. Review if error.
# shellcheck source=/dev/null
. "$(bits-include CMakeRecipe)"
##############################
# Module_options is unused (SC2034 warning)
# MODULE_OPTIONS="--bin --lib"
##############################
function Prepare() {
    rsync -av --delete --delete-excluded "$SOURCEDIR"/ ./
}

function Configure() {
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX="$INSTALLROOT"  -DASSIMP_BUILD_ASSIMP_TOOLS=ON
 }

function Make() {
     cmake --build . -- "${CMAKE_OPTIONS}" ${JOBS:+-j$JOBS}
}

function MakeInstall() {
        cmake --install . 
}
