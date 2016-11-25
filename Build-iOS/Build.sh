#!/bin/bash

ANE=$"FlyMobExtension.ane"
SWC=$"FlyMobANE.swc"
LIB=$"libFlyMobANE.a"

IOS=$"library.swf libFlyMobANE.a FlyMobSDK.framework"
DEFAULT=$"library.swf"

AIRSDK=$"/AIR_SDK/bin/adt"
IOS_OPTIONS=$"iosplatform.xml"

clear
echo ""

DIR=$"$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ADT="$DIR$AIRSDK"
echo "Unpacking swc..."

cd "$DIR/bin/"
unzip -q -o "$SWC"
rm $"catalog.xml"

echo "Compiling..."

"$ADT" -package -target ane $ANE descriptor.xml -swc $SWC -platform iPhone-ARM -platformoptions $IOS_OPTIONS $IOS -platform default $DEFAULT

cd "$DIR/"

echo "Finished!"