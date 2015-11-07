PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.ipcall.enabled=true

MOKEEHELPER_EMBEDDED := true
MOKEEHELPER_PACKAGE_PREFIX := com.android.settings.mokee.mokeehelper

BLOCK_BASED_OTA := false

-include vendor/mk/config/mk_prebuilt.mk