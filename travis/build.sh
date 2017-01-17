#!/bin/bash

export OF_ROOT=${PWD}/of

case "$TRAVIS_OS_NAME" in
  linux)
  export CMAKE_BIN=$(readlink -f "$(find cmake/bin -name cmake -type f )")
  ;;
  osx)
  export CMAKE_BIN=$(which cmake)
  ;;
esac

mkdir build
cd build

case "$TRAVIS_OS_NAME" in
  linux)
    export CC=gcc-6
    export CXX=g++-6
    export LD_LIBRARY_PATH="/usr/lib64:$LD_LIBRARY_PATH"
    case "$BUILD_TYPE" in
      Debug)
        $CMAKE_BIN -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DOF_STATIC=$OF_STATIC -DOF_ROOT=$OF_ROOT -DCOTIRE=OFF ..
        $CMAKE_BIN --build . -- -j2
        # export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libasan.so.0
      ;;
      Release)
        $CMAKE_BIN -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DOF_STATIC=$OF_STATIC -DOF_ROOT=$OF_ROOT -DCOTIRE=OFF ..
        $CMAKE_BIN --build . -- -j2
        # export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libasan.so.0
      ;;
      Coverage)
        gem install coveralls-lcov
        $CMAKE_BIN -DCMAKE_BUILD_TYPE=Debug -DOF_COVERAGE=1 -DOF_ROOT=$OF_ROOT -DCOTIRE=OFF ..
        $CMAKE_BIN --build . -- -j2
        $CMAKE_BIN --build . --target of_coverage
        mv coverage.info.cleaned coverage.info
        coveralls-lcov coverage.info
      ;;
    esac
  ;;

  osx)
    export CXX=clang++
    export CMAKE_BIN=$(which cmake)
    $CMAKE_BIN -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
               -DOOF_STATIC=$OF_STATIC \
               -DCMAKE_PREFIX_PATH="$CMAKE_PREFIX_PATH" \
               -DCMAKE_CXX_COMPILER=/usr/bin/clang++ \
               -DOF_ROOT=$OF_ROOT \
               -DCOTIRE=OFF \
               ..

    $CMAKE_BIN --build . -- -j2
  ;;
esac
