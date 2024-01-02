# Switcher

A small demo of screen capture, branched off of [Apple's ScreenCaptureKit sample][1]. This is intended to be used to implement a task switcher.

## Building

Before building, replace the codesigning identity (40 hexadecimal digits) in the Makefile with your own. You can use `security find-identity` to find it.

```
make
open Switcher.app
```

[1]: https://developer.apple.com/documentation/screencapturekit/capturing_screen_content_in_macos
