# Inherit common mobile MoKee stuff
$(call inherit-product, vendor/mokee/config/common.mk)

# Default notification/alarm sounds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.notification_sound=Bongo.ogg \
    ro.config.alarm_alert=AngelsHarp.ogg

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.dun.override=0
endif

# Optional packages
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    PhotoTable

# AOSP packages
PRODUCT_PACKAGES += \
    Email \
    ExactCalculator \
    Exchange2

# MoKee packages
PRODUCT_PACKAGES += \
    AudioFX \
    Backgrounds \
    Etar \
    LockClock \
    Profiles \
    WeatherProvider

# Accents
PRODUCT_PACKAGES += \
    MoKeeBlackTheme \
    MoKeeDarkTheme \
    MoKeeBlackAccent \
    MoKeeBlueAccent \
    MoKeeBrownAccent \
    MoKeeCyanAccent \
    MoKeeGrayAccent \
    MoKeeGreenAccent \
    MoKeeOrangeAccent \
    MoKeePinkAccent \
    MoKeePurpleAccent \
    MoKeeRedAccent \
    MoKeeTealAccent \
    MoKeeYellowAccent

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Custom off-mode charger
ifeq ($(WITH_MOKEE_CHARGER),true)
PRODUCT_PACKAGES += \
    mokee_charger_res_images \
    font_log.png \
    libhealthd.mokee
endif

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true
