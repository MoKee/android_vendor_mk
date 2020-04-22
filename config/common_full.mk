# Inherit common MoKee stuff
$(call inherit-product, vendor/mokee/config/common_mobile.mk)

PRODUCT_SIZE := full

# Recorder
PRODUCT_PACKAGES += \
    Recorder
