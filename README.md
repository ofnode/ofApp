ofApp
=====


Compiling
---------

Make sure that [of](https://github.com/ofnode/of) and ofApp share the same folder.

![ScreenShot](http://i.imgur.com/xTQQYv4.png)

Change directory to ofApp and perform these steps:

For release build:
```bash
mkdir build
cd build
cmake .. -G Ninja -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_BUILD_TYPE=Release
ninja
```

See also
--------

[Compiling ofApp with IDE on Linux](https://github.com/ofnode/of/wiki/Compiling-ofApp-with-IDE-on-Linux)
--------------------------------------------------------------------------------------------------------

[ofTools](https://github.com/ofnode/ofTools)
--------------------------------------------
