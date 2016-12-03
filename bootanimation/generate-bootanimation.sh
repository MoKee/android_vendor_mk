#!/bin/bash

WIDTH="$1"
HEIGHT="$2"
HALF_RES="$3"
OUT="$ANDROID_PRODUCT_OUT/obj/BOOTANIMATION"

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

for part_cnt in 0 1 2
do
    mkdir -p $ANDROID_PRODUCT_OUT/obj/BOOTANIMATION/bootanimation/part$part_cnt
done
tar xfp "vendor/mk/bootanimation/bootanimation.tar" --to-command="convert - -resize '$RESOLUTION' \"png8:$OUT/bootanimation/\$TAR_FILENAME\""

# Create desc.txt
echo "$WIDTH_SIZE" "$HEIGHT_SIZE" 30 > "$OUT/bootanimation/desc.txt"
cat "vendor/mk/bootanimation/desc.txt" >> "$OUT/bootanimation/desc.txt"

# Create bootanimation.zip
cd "$OUT/bootanimation"

zip -qr0 "$OUT/bootanimation.zip" .
