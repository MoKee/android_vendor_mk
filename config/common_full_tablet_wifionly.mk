# Inherit full common MK stuff
$(call inherit-product, vendor/mk/config/common_full.mk)

# Include MK LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/mk/overlay/dictionaries
