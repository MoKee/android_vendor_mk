# Inherit full common MK stuff
$(call inherit-product, vendor/mk/config/common_full.mk)

PRODUCT_PACKAGES += \
    AppDrawer \
    LineageCustomizer

DEVICE_PACKAGE_OVERLAYS += vendor/mk/overlay/tv
