# Inherit common MK stuff
$(call inherit-product, vendor/mk/config/common.mk)

PRODUCT_SIZE := full

# Optional MK packages
PRODUCT_PACKAGES += \
    Galaxy4 \
    HoloSpiralWallpaper \
    LiveWallpapers \
    MagicSmokeWallpapers \
    NoiseField \
    PhaseBeam \
    PhotoTable \

# Themes
PRODUCT_PACKAGES += \
    HexoLibre
