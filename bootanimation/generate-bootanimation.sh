#!/bin/bash

PRODUCT_OUT="$1"
WIDTH="$2"
HEIGHT="$3"
HALF_RES="$4"
INTRO="$5"

SRC="$ANDROID_BUILD_TOP/vendor/mokee/bootanimation"
OUT="$PRODUCT_OUT/obj/BOOTANIMATION"

if [ "$HEIGHT" -lt "$WIDTH" ]; then
    IMAGEWIDTH="$HEIGHT"
    IMAGEHEIGHT="$WIDTH"
else
    IMAGEWIDTH="$WIDTH"
    IMAGEHEIGHT="$HEIGHT"
fi

if [ "$HALF_RES" = "true" ]; then
    IMAGEWIDTH=$(expr $IMAGEWIDTH / 2)
    IMAGEHEIGHT=$(expr $IMAGEHEIGHT / 2)
fi

RESOLUTION=""$IMAGEWIDTH"x"$IMAGEHEIGHT""

if [ -n "$INTRO" ]; then
    INTRO="$ANDROID_BUILD_TOP/$INTRO"
fi

# Create working dir
mkdir -p "$OUT/bootanimation"
cd "$OUT/bootanimation"

# Extract source frames
tar xfp "$SRC/bootanimation.tar"

# Resize
for frame in $OUT/bootanimation/part*/*
do
    convert "$frame" -resize "$RESOLUTION" "$frame"
done

if [ -d "$INTRO" ]; then
    rm -rf "$OUT/bootanimation/intro"
    cp -Rf "$INTRO" "$OUT/bootanimation/intro"
fi

# Create desc.txt
IMAGESCALEWIDTH=$(identify -ping -format '%w' $OUT/bootanimation/part0/$(ls $OUT/bootanimation/part0 | head -1))
IMAGESCALEHEIGHT=$(identify -ping -format '%h' $OUT/bootanimation/part0/$(ls $OUT/bootanimation/part0 | head -1))

if [ "$HALF_RES" = "true" ]; then
    IMAGESCALEWIDTH=$(expr $IMAGESCALEWIDTH \* 2)
    IMAGESCALEHEIGHT=$(expr $IMAGESCALEHEIGHT \* 2)
fi

echo "$IMAGESCALEWIDTH $IMAGESCALEHEIGHT" 30 > "$OUT/bootanimation/desc.txt"
if [ -d "$INTRO" ]; then
    echo "c 1 0 intro" >> "$OUT/bootanimation/desc.txt"
fi
cat "$SRC/desc.txt" >> "$OUT/bootanimation/desc.txt"

# Create bootanimation.zip
zip -qrX0 "$OUT/bootanimation.zip" .
if [ -f $ANDROID_HOST_OUT/bin/ziptime ];then
    $ANDROID_HOST_OUT/bin/ziptime "$OUT/bootanimation.zip"
else
    case `uname -s` in
        Darwin)
            $ANDROID_BUILD_TOP/vendor/mokee/prebuilt/host/darwin-x86/ziptime "$OUT/bootanimation.zip"
            ;;
        *)
            $ANDROID_BUILD_TOP/vendor/mokee/prebuilt/host/linux-x86/ziptime "$OUT/bootanimation.zip"
            ;;
    esac
fi
