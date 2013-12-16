#Inherit common MK stuff
$(call inherit-product, vendor/mk/config/common.mk)

# Bring in all audio files
include frameworks/base/data/sounds/MK_Audio.mk

# Optional MK packages
PRODUCT_PACKAGES += \
    Galaxy4 \
    HoloSpiralWallpaper \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    NoiseField \
    PhaseBeam \
    VisualizationWallpapers \
    PhotoTable

