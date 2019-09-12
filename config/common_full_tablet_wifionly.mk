# Inherit full common MoKee stuff
$(call inherit-product, vendor/mokee/config/common_full.mk)

# Include MoKee LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/mokee/overlay/dictionaries
