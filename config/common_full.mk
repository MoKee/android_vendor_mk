#Inherit common MK stuff
$(call inherit-product, vendor/mk/config/common.mk)

# Include MK audio files
include vendor/mk/config/mk_audio.mk

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
    PhotoTable \
    SoundRecorder


# Extra tools in MK
PRODUCT_PACKAGES += \
    vim
