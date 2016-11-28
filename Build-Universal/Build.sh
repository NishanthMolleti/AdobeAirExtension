#!/bin/bash

ANE=$"FlyMobExtension.ane"
SWC=$"FlyMobANE.swc"

IOS=$"library.swf libFlyMobANE.a FlyMobSDK.framework"
Android=$"library.swf ANEFlyMobSdk.jar FlyMobSdk.jar google-play-services.jar"
DEFAULT=$"library.swf"

AIRSDK=$"/AIR_SDK/bin/adt"
IOS_OPTIONS=$"iosplatform.xml"
ANDROID_OPTIONS=$"androidplatform.xml"

# Clear old build
clear
rm $ANE

echo ""

DIR=$"$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ADT="$DIR$AIRSDK"
echo "Unpacking swc..."

cd "$DIR/bin/"
unzip -q -o "$SWC"
rm $"catalog.xml"

echo "Compiling..."

"$ADT" -package -target ane $ANE descriptor.xml -swc $SWC \
				-platform iPhone-ARM -platformoptions $IOS_OPTIONS $IOS \
				-platform Android-ARM -platformoptions $ANDROID_OPTIONS $Android \
				-platform Android-x86 -platformoptions $ANDROID_OPTIONS $Android \
				-platform default $DEFAULT

cp $ANE $DIR
cd $DIR

echo "Finished!"