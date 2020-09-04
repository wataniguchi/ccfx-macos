#!/bin/sh
#
#  buildjar.sh - MacOS version of buildjar.bat
#
#    author  : Wataru Taniguchi (wataru@taniguchifamily.com)
#    date    : September 4, 2020
#    require : nkf ("brew install nkf" will do)
#

# make local copy of source and resource files
rm -rf GemXMain.java ccfinderx gemx model utility res constants customwidgets resources
cp -p  ../GemX/GemXMain.java .
cp -pr ../GemX/ccfinderx .
cp -pr ../GemX/gemx .
cp -pr ../GemX/model .
cp -pr ../GemX/utility .
cp -pr ../GemX/res .
cp -pr ../GemX/constants .
cp -pr ../GemX/customwidgets .
cp -pr ../GemX/resources .

# convert Japanese characters from Windows to MacOS
find . -name "*.java" -exec sh -c "cat {} | nkf > {}.macos" \;
find . -name "*.java.macos" -exec echo "mv" {} {} \; | sed -E 's/(.*\.java)\.macos$/\1/' | sh 

# ----- below is straightly migrated from the original buildjar.bat -----
find . -name "*.class" -exec rm {} \;

JARS=./swt.jar:./trove-2.0.4.jar:./pathjson.jar:../GemX/icu4j-localespi-4_0_1.jar:../GemX/icu4j-charsets-4_0_1.jar:../GemX/icu4j-4_0_1.jar
OPTS='-g:none -source 1.5'

javac $OPTS -classpath $JARS:. GemXMain.java
javac $OPTS -classpath $JARS:. ccfinderx/*.java
javac $OPTS -classpath $JARS:. gemx/*.java
javac $OPTS -classpath $JARS:. gemx/dialogs/*.java
javac $OPTS -classpath $JARS:. gemx/scatterplothelper/*.java
javac $OPTS -classpath $JARS:. model/*.java
javac $OPTS -classpath $JARS:. utility/*.java
javac $OPTS -classpath $JARS:. res/*.java
javac $OPTS -classpath $JARS:. constants/*.java
javac $OPTS -classpath $JARS:. customwidgets/*.java
javac $OPTS -classpath $JARS:. resources/*.java

rm gemxlib.jar
jar cvf gemxlib.jar ccfinderx/*.class gemx/*.class gemx/*.png gemx/dialogs/*.class gemx/dialogs/*.png gemx/scatterplothelper/*.class model/*.class utility/*.class res/*.class res/messages.properties constants/*.class customwidgets/*.class resources/*.class

mv GemXMain.class GemXMain.xclass
find . -name "*.class" -exec rm {} \;
mv GemXMain.xclass GemXMain.class
# ----- above is straightly migrated from the original buildjar.bat -----

# clean up the duplicated local copy
rm -rf GemXMain.java ccfinderx gemx model utility res constants customwidgets resources
