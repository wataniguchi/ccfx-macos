#!/bin/bash

JARS=./gemxlib.jar:./pathjson.jar:./trove-2.0.4.jar:./icu4j-4_0_1.jar:./icu4j-charsets-4_0_1.jar:./icu4j-localespi-4_0_1.jar:./swt.jar:.
OPTS='-XstartOnFirstThread'

pushd `dirname $0`

java $OPTS -classpath $JARS GemXMain

popd
