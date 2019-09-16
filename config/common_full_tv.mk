# Exclude AudioFX
TARGET_EXCLUDES_AUDIOFX := true

# Inherit full common MoKee stuff
$(call inherit-product, vendor/mokee/config/common_full.mk)

# Inherit MoKee atv device tree
$(call inherit-product, device/mokee/atv/mokee_atv.mk)

PRODUCT_PACKAGES += \
    AppDrawer \
    MoKeeCustomizer

DEVICE_PACKAGE_OVERLAYS += vendor/mokee/overlay/tv
