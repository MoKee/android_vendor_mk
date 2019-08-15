# Inherit full common MoKee stuff
$(call inherit-product, vendor/mk/config/common_full.mk)

# Include MoKee LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/mk/overlay/dictionaries

$(call inherit-product, vendor/mk/config/telephony.mk)
