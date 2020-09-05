#!/bin/sh
javac -d . ../GemX/ccfinderx/CCFinderX.java
javah -classpath . ccfinderx.CCFinderX
cp ccfinderx_CCFinderX.h ../GemX
rm ccfinderx/CCFinderX.class
rmdir ccfinderx
