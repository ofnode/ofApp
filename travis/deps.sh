#!/bin/bash -eux

git clone https://github.com/ofnode/of.git --depth=1

case "$TRAVIS_OS_NAME" in
  linux)
    ./of/dev/install/linux/ubuntu.sh
    sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 1397BC53640DB551
    sudo add-apt-repository --yes ppa:ubuntu-toolchain-r/test
    sudo apt-get update -qq
    sudo apt-get install -qq g++-6 ninja-build gcovr lcov

    wget https://cmake.org/files/v3.7/cmake-3.7.0-Linux-x86_64.tar.gz -O cmake-linux.tgz
    tar xaf cmake-linux.tgz
    mv cmake-*-x86_64 cmake
  ;;
  osx)
    # work around a homebrew bug
    ./of/dev/install/osx/homebrew.sh
    brew install gstreamer
  ;;
esac


# build of
mkdir build-of;
pushd build-of;
if [[ "${TRAVIS_OS_NAME}" == "linux" ]]; then
  export CC=gcc-6
  export CXX=g++-6
fi
case "$BUILD_TYPE" in
  Debug)
    cmake -G Ninja -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DOF_STATIC=$OF_STATIC ../of
    ;;
  Release)
    cmake -G Ninja -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DOF_STATIC=$OF_STATIC ../of
    ;;
  Coverage)
    cmake -G Ninja -DCMAKE_BUILD_TYPE=Debug -DOF_COVERAGE=1 ../of
    ;;
esac
cmake --build . -- -j2
popd
