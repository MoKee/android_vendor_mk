# Inherit full common MoKee stuff
$(call inherit-product, vendor/mk/config/common_full.mk)

# Inherit MK atv device tree
$(call inherit-product, device/mk/atv/mk_atv.mk)

PRODUCT_PACKAGES += \
    AppDrawer \
    MoKeeCustomizer

DEVICE_PACKAGE_OVERLAYS += vendor/mk/overlay/tv
