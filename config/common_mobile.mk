# Inherit common mobile MoKee stuff
$(call inherit-product, vendor/mokee/config/common.mk)

ifneq ($(TARGET_EXCLUDES_BLUR),true)
# Blur
PRODUCT_PRODUCT_PROPERTIES += \
    ro.sf.blurs_are_expensive=1
    ro.surface_flinger.supports_background_blur=1
endif

# Default notification/alarm sounds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.notification_sound=Bongo.ogg \
    ro.config.alarm_alert=AngelsHarp.ogg

# AOSP packages
PRODUCT_PACKAGES += \
    Email \
    ExactCalculator \
    Exchange2

# MoKee packages
PRODUCT_PACKAGES += \
    Backgrounds \
    Profiles \
    Seedvault

ifneq ($(TARGET_EXCLUDES_AUDIOFX),true)
PRODUCT_PACKAGES += \
    AudioFX
endif

ifeq ($(PRODUCT_TYPE), go)
PRODUCT_PACKAGES += \
    TrebuchetQuickStepGo \
    Lawnchair

PRODUCT_DEXPREOPT_SPEED_APPS += \
    TrebuchetQuickStepGo \
    Lawnchair
else
PRODUCT_PACKAGES += \
    TrebuchetQuickStep \
    Lawnchair

PRODUCT_DEXPREOPT_SPEED_APPS += \
    TrebuchetQuickStep \
    Lawnchair
endif

# Accents
PRODUCT_PACKAGES += \
    MoKeeBlackTheme \
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

# Customizations
PRODUCT_PACKAGES += \
    IconShapeSquareOverlay \
    MoKeeNavigationBarNoHint \
    NavigationBarMode2ButtonOverlay

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet
