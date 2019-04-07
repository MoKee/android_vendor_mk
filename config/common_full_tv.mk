# Inherit full common MoKee stuff
$(call inherit-product, vendor/mk/config/common_full.mk)

PRODUCT_PACKAGES += \
    AppDrawer \
    MoKeeCustomizer

DEVICE_PACKAGE_OVERLAYS += vendor/mk/overlay/tv
