# ccfx-macos
MacOS port of AIST CCFinderX

## How to setup
1. Install Boost libraries if not yet done
```
$ brew install boost
```
2. Install OpenMP runtime library if not yet done
```
$ brew install libomp
```
3. Install C/C++ and Java libraries for Unicode and globalization if not yet done
```
$ brew install icu4c
```
4. Unzip ccfx-src.zip into ccfx-macos directory
```
$ unzip ccfx-src.zip
```
5. Apply patch to the source code
```
$ patch -p1 < macos64/ccfx-macos.diff
```
6. Generate ccfinderx_CCFinderX.h JNI header file
```
$ (cd macos64; ./makeCCFinderXHeader.sh)
```
7. Build Java class library
```
$ (cd macos64; ./buildjar.sh)
```
8. Build and install all the rest
```
$ xcodebuild install ARCHS="x86_64" -alltargets OTHER_CPLUSPLUSFLAGS="-std=c++17 -Wno-register -DOS_MACOS -DLITTLE_ENDIAN -DCXLM_NO_ENC -DCODE_CONVERSION_SUPPORT -DWSTRING_CONVERSION_SUPPORT -DREQUIRE_RNR -I/usr/local/opt/icu4c/include -I$(/usr/libexec/java_home)/include -I$(/usr/libexec/java_home)/include/darwin $(python2.7-config --includes)" OTHER_LDFLAGS="-L/usr/local/opt/icu4c/lib -licuuc -licui18n -lboost_thread -lboost_filesystem $(python2.7-config --ldflags)"

$ sudo cp -r /tmp/ccfx-macos.dst/usr/local/opt/CCFinderX /usr/local/opt/
```
9. Run ccfx-macos
```
$ /usr/local/opt/CCFinderX/gemx.sh
```

## To-Do
CCFinderX is not compatible with Python 3.

## Note
As [the original distribution page for CCFinderX](http://www.ccfinder.net/ccfinderxos-j.html) looks unreacheable, ```ccfx-src.zip``` and ```ccfx-win32-en.zip``` are temporarily included in this repository.
