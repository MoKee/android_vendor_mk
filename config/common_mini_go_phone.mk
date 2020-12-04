# Set MoKee specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit mini common MoKee stuff
$(call inherit-product, vendor/mokee/config/common_mini_phone.mk)
