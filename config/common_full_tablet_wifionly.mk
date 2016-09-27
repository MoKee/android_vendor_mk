# Inherit common MK stuff
$(call inherit-product, vendor/mk/config/common_full.mk)

# Include MK LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/mk/overlay/dictionaries

ifeq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
    PRODUCT_COPY_FILES += \
        vendor/mk/prebuilt/common/bootanimation/800.zip:system/media/bootanimation.zip
endif
