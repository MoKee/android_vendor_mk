# Set MoKee specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit full common MoKee stuff
$(call inherit-product, vendor/mokee/config/common_full_phone.mk)
