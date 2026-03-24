package: CLHEP
version: "2.4.0.1"
tag: CLHEP_2_4_0_1
source: https://gitlab.cern.ch/CLHEP/CLHEP.git
build_requires:
  - CMake
  - bits-recipe-tools
---
#!/bin/bash -e
##############################
# shellcheck source=/dev/null
. $(bits-include CMakeRecipe)
##############################
# SC2034 (warning): MODULE_OPTIONS appears unused. Verify use (or export if used externally)
# MODULE_OPTIONS="--bin --lib --cmake"
##############################
function Configure() {
  cmake "$SOURCEDIR" -DCMAKE_INSTALL_PREFIX="$INSTALLROOT"
}
