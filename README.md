ofApp
=====


Compiling
---------

Make sure that [of][1] and ofApp share the same folder.

![ScreenShot](http://i.imgur.com/xTQQYv4.png)

Change directory to ofApp and perform one of these steps:

For Linux build:
```bash
mkdir build
cd build
cmake .. -G Ninja -DCMAKE_CXX_COMPILER=clang++
ninja
```

For Debug build:
```bash
mkdir build
cd build
cmake .. -G Ninja -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_BUILD_TYPE=Debug
ninja
```

For Windows build:
```bash
mkdir build
cd build
cmake .. -G Ninja -DCMAKE_TOOLCHAIN_FILE=`find /opt/mxe -name mxe-conf.cmake`
ninja
```


[ofTools][2]
------------


  [1]: https://github.com/ofnode/of
  [2]: https://github.com/ofnode/ofTools

