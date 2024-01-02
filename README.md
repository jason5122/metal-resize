# MetalResize

A small demo of smooth resizing with Metal, branched off of [trishume/MetalTest][1].

## Building

Before building, replace the codesigning identity (40 hexadecimal digits) in the Makefile with your own. You can use `security find-identity` to find it.

```
make
open MetalResize.app
```

[1]: https://github.com/trishume/MetalTest
