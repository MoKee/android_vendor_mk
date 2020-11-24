# Inherit common MoKee stuff
$(call inherit-product, vendor/mokee/config/common.mk)

# Inherit MoKee atv device tree
$(call inherit-product, device/mokee/atv/mokee_atv.mk)

# AOSP packages
PRODUCT_PACKAGES += \
    LeanbackIME


DEVICE_PACKAGE_OVERLAYS += vendor/mokee/overlay/tv
