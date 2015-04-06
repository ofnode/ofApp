ofApp
=====


Compiling
---------

Make sure that [of][1] and ofApp share the same folder.

![ScreenShot](http://i.imgur.com/xTQQYv4.png)

Change directory to ofApp and perform one of these steps:

For Linux Release build:
```bash
mkdir build
cd build
cmake .. -G Ninja -DCMAKE_CXX_COMPILER=clang++
ninja
```

For Linux Debug build:
```bash
mkdir build
cd build
cmake .. -G Ninja -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_BUILD_TYPE=Debug
ninja
```

For Windows Release build:
```bash
mkdir build
cd build
cmake .. -G Ninja -DCMAKE_TOOLCHAIN_FILE=`find /opt/mxe -name mxe-conf.cmake`
ninja
```

For Windows Debug build:
```bash
mkdir build
cd build
cmake .. -G Ninja -DCMAKE_TOOLCHAIN_FILE=`find /opt/mxe -name mxe-conf.cmake` -DCMAKE_BUILD_TYPE=Debug
ninja
```

[ofTools][2]
------------


  [1]: https://github.com/ofnode/of
  [2]: https://github.com/ofnode/ofTools

