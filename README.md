ofApp
=====


Compiling
---------

Make sure that [of][1] and ofApp share the same folder.

![ScreenShot](http://i.imgur.com/xTQQYv4.png)

Change directory to ofApp and perform one of these steps:

For release build:
```bash
mkdir build
cd build
cmake .. -G Ninja
ninja
```

For debug build:
```bash
mkdir build
cd build
cmake .. -G Ninja -DCMAKE_BUILD_TYPE=Debug
ninja
```


[ofTools][2]
------------


  [1]: https://github.com/ofnode/of
  [2]: https://github.com/ofnode/ofTools

