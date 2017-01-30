# Inherit common MK stuff
$(call inherit-product, vendor/mk/config/common.mk)

PRODUCT_SIZE := full

# Themes
PRODUCT_PACKAGES += \
    HexoLibre

# Recorder
PRODUCT_PACKAGES += \
    Recorder
