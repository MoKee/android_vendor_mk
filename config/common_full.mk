# Inherit common MoKee stuff
$(call inherit-product, vendor/mokee/config/common_mobile.mk)

PRODUCT_SIZE := full

# Include {Lato,Rubik} fonts
$(call inherit-product-if-exists, external/google-fonts/lato/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/rubik/fonts.mk)

# Fonts
PRODUCT_PACKAGES += \
    fonts_customization.xml \
    MoKeeLatoFont \
    MoKeeRubikFont

# Recorder
PRODUCT_PACKAGES += \
    Recorder
