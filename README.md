# ccfx-macos
MacOS port of AIST CCFinderX

How to setup:
1.  Install Boost libraries if not yet done, i.e., $ brew install boost
2.  Install OpenMP runtime library if not yet done, i.e., $ brew install libomp
3.  Install C/C++ and Java libraries for Unicode and globalization if not yet done, i.e., $ brew install icu4c
4.  Unzip ccfx-src.zip into ccfx-macos directory
5.  Apply patch to the source code, i.e., $ patch -p1 < macos64/ccfx-macos.diff
6.  Generate ccfinderx_CCFinderX.h JNI header file, i.e., $ cd macos64; ./makeCCFinderXHeader.sh
7.  Build Java class library, i.e., $ cd macos64; ./buildjar.sh
8.  Build and install all the rest, i.e., $ xcodebuild install -alltargets
