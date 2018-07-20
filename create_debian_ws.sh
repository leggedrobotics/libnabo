#!/usr/bin/env bash

PACKAGE="libnabo"

declare -a DIRECTORIES=(
  "debian"
  "examples"
  "experimental"
  "nabo"
  "python"
  "tests"
)

declare -a FILES=(
  "CHANGELOG.rst"
  "cmake_uninstall.cmake.in"
  "CMakeLists.txt"
  "Doxyfile.in"
  "libnaboConfig.cmake.in"
  "libnaboConfigVersion.cmake.in"
  "package.xml"
  "README.md"
  "UseDoxygen.cmake"
)

rm -rf ws

mkdir -p ws/${PACKAGE}

for DIRECTORY in "${DIRECTORIES[@]}"; do
    cp -R ${DIRECTORY} "ws/"${PACKAGE}
done

for FILE in "${FILES[@]}"; do
    cp ${FILE} "ws/"${PACKAGE}
done

cd ws/${PACKAGE}

tar -cJ --exclude='./debian' -f ../libnabo_1.0.7.orig.tar.xz .