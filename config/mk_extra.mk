PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.ipcall.enabled=true

MOKEEHELPER_EMBEDDED := true
MOKEEHELPER_PACKAGE_PREFIX := com.android.settings.mokee.mokeehelper

# Chromium Prebuilt Optimize
ifeq ($(PRODUCT_PREBUILT_WEBVIEWCHROMIUM),yes)
-include prebuilts/chromium/$(MK_BUILD)/chromium_prebuilt.mk
endif

-include vendor/mk/config/mk_prebuilt.mk