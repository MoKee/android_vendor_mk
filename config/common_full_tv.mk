# Inherit common MK stuff
$(call inherit-product, vendor/mk/config/common_full.mk)

PRODUCT_PACKAGES += TvSettings

DEVICE_PACKAGE_OVERLAYS += vendor/mk/overlay/tv
