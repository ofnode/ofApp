ofApp
=====
Build status : https://travis-ci.org/ofnode/ofApp.svg?branch=master

Compiling
---------

Make sure that [of](https://github.com/ofnode/of) and ofApp share the same folder.
If that's not the case, you should use `OF_ROOT` CMake variable to tell cmake where to find `of`.
For example : `cmake .. -DOF_ROOT=~/dev/of -G Ninja`

![ScreenShot](http://i.imgur.com/xTQQYv4.png)

Change directory to ofApp and perform these steps:

```bash
mkdir build
cd build
cmake .. -G Ninja
ninja
```

You can also use your prefered IDE to load the project (Qtcreator for example.)
It's also possible to generate Xcode project with Ninja, this have not been tested though.

See also
--------

### [ofLiveApp](https://github.com/ofnode/ofLiveApp)
