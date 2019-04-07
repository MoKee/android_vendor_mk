# Inherit common MK stuff
$(call inherit-product, vendor/mk/config/common.mk)

PRODUCT_SIZE := full

# Recorder
PRODUCT_PACKAGES += \
    Recorder
