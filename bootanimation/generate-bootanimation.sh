#!/bin/bash

PRODUCT_OUT="$1"
WIDTH="$2"
HEIGHT="$3"
HALF_RES="$4"
INTRO="$5"

SRC="$ANDROID_BUILD_TOP/vendor/mk/bootanimation"
OUT="$PRODUCT_OUT/obj/BOOTANIMATION"

if [ "$HEIGHT" -lt "$WIDTH" ]; then
    WIDTH_SIZE="$HEIGHT"
    HEIGHT_SIZE="$WIDTH"
else
    WIDTH_SIZE="$WIDTH"
    HEIGHT_SIZE="$HEIGHT"
fi

if [ "$HALF_RES" = "true" ]; then
    IMAGE_WIDTH_SIZE=$(expr $WIDTH_SIZE / 2)
    IMAGE_HEIGHT_SIZE=$(expr $HEIGHT_SIZE / 2)
else
    IMAGE_WIDTH_SIZE="$WIDTH_SIZE"
    IMAGE_HEIGHT_SIZE="$HEIGHT_SIZE"
fi

RESOLUTION=""$IMAGE_WIDTH_SIZE"x"$IMAGE_HEIGHT_SIZE""

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
RESOLUTION=$(identify -ping -format '%w %h' $OUT/bootanimation/part0/$(ls $OUT/bootanimation/part0 | head -1))
echo "$RESOLUTION" 30 > "$OUT/bootanimation/desc.txt"
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
            $ANDROID_BUILD_TOP/vendor/mk/prebuilt/host/darwin-x86/ziptime "$OUT/bootanimation.zip"
            ;;
        *)
            $ANDROID_BUILD_TOP/vendor/mk/prebuilt/host/linux-x86/ziptime "$OUT/bootanimation.zip"
            ;;
    esac
fi
