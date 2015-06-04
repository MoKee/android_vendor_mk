PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.ipcall.enabled=true

MOKEEHELPER_EMBEDDED := true
MOKEEHELPER_PACKAGE_PREFIX := com.android.settings.mokee.mokeehelper

# Chromium Prebuilt Optimize
ifeq ($(PRODUCT_PREBUILT_WEBVIEWCHROMIUM),yes)
-include prebuilts/chromium/$(MK_BUILD)/chromium_prebuilt.mk
endif

# Use all private binaries
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/private/bin/$(MK_CPU_ABI) && \
    find vendor/mk/prebuilt/private/bin/$(MK_CPU_ABI) -type f \
    -printf '%p:system/bin/%f ')

# Use all private libraries
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/private/lib/$(MK_CPU_ABI) && \
    find vendor/mk/prebuilt/private/lib/$(MK_CPU_ABI) -name '*.so' \
    -printf '%p:system/lib/%f ')

# Use all third-party files
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/third/app && \
    find vendor/mk/prebuilt/third/app -name '*.apk' \
    -printf '%p:system/third-app/%f ')

# Use all developers-party files
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/$(DEVELOPER_MAINTAINER)/app && \
    find vendor/mk/prebuilt/$(DEVELOPER_MAINTAINER)/app -name '*.apk' \
    -printf '%p:system/third-app/%f ')

# AppStats
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/common/app/AppStats && \
    find vendor/mk/prebuilt/common/app/AppStats -name '*.apk' \
    -printf '%p:system/app/AppStats/%f ')
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/common/app/AppStats && \
    find vendor/mk/prebuilt/common/app/AppStats -name '*.so' \
    -printf '%p:system/app/AppStats/lib/arm/%f ')

# Google PinYin
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/google/app/GooglePinYin && \
    find vendor/mk/prebuilt/google/app/GooglePinYin -name '*.apk' \
    -printf '%p:system/app/GooglePinYin/%f ')
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/google/app/GooglePinYin && \
    find vendor/mk/prebuilt/google/app/GooglePinYin -name '*.so' \
    -printf '%p:system/app/GooglePinYin/lib/arm/%f ')

# Google Intl
ifneq ($(TARGET_EXCLUDE_GOOGLE_IME),true)
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/google/app/GoogleIntl && \
    find vendor/mk/prebuilt/google/app/GoogleIntl -name '*.apk' \
    -printf '%p:system/app/GoogleIntl/%f ')
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/google/app/GoogleIntl && \
    find vendor/mk/prebuilt/google/app/GoogleIntl -name '*.so' \
    -printf '%p:system/app/GoogleIntl/lib/arm/%f ')
endif