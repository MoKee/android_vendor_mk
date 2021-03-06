# Inherit common MoKee stuff
$(call inherit-product, vendor/mk/config/common.mk)

# Inherit MoKee atv device tree
$(call inherit-product, device/mokee/atv/mokee_atv.mk)

# Google source built packages
PRODUCT_PACKAGES += \
    LeanbackIME

# Custom MoKee packages
PRODUCT_PACKAGES += \
    AppDrawer

DEVICE_PACKAGE_OVERLAYS += vendor/mk/overlay/tv
