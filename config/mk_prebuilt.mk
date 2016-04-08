# Use all private binaries
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/mk/prebuilt/private/bin/$(MK_CPU_ABI),system/bin)

# Use all private libraries
ifeq ($(MK_CPU_ABI),arm64-v8a)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.so,vendor/mk/prebuilt/private/lib/$(MK_CPU_ABI),system/lib64) \
    $(call find-copy-subdir-files,*.so,vendor/mk/prebuilt/private/lib/armeabi-v7a,system/lib)
else
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.so,vendor/mk/prebuilt/private/lib/$(MK_CPU_ABI),system/lib)
endif

# Use all third-party files
ifneq ($(wildcard vendor/mk/prebuilt/third/app),)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.apk,vendor/mk/prebuilt/third/app,system/third-app)
endif

# Use all developers-party files
ifneq ($(DEVELOPER_MAINTAINER),)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.apk,vendor/mk/prebuilt/$(DEVELOPER_MAINTAINER)/app,system/third-app)
endif

# Google apps
ifneq ($(filter armeabi armeabi-v7a arm64-v8a,$(MK_CPU_ABI)),)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/mk/prebuilt/google/app,system/app)
else
PRODUCT_PACKAGES += \
    LatinIME
endif

# ViPER4Android
ifneq ($(filter armeabi armeabi-v7a x86,$(MK_CPU_ABI)),)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/mk/prebuilt/viper/app,system/priv-app) \
    $(call find-copy-subdir-files,*.so,vendor/mk/prebuilt/viper/lib/$(MK_CPU_ABI)/soundfx,system/lib/soundfx)
endif

# YuBrowser apps
ifeq ($(filter armeabi armeabi-v7a arm64-v8a,$(MK_CPU_ABI)),)
PRODUCT_PACKAGES += \
    Browser
else
ifeq (true,$(BOARD_USE_OUR_OWN_BROWSER))
PRODUCT_PACKAGES += \
    YuBrowser
else
PRODUCT_PACKAGES += \
    Browser
endif
endif