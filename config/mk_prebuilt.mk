# Use all private binaries
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/mk/prebuilt/private/bin/$(MK_CPU_ABI),system/bin)

# Use all private libraries
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.so,vendor/mk/prebuilt/private/lib/$(MK_CPU_ABI),system/lib)

# Use all third-party files
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.apk,vendor/mk/prebuilt/third/app,system/third-app)

# Use all developers-party files
ifneq ($(DEVELOPER_MAINTAINER),)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.apk,vendor/mk/prebuilt/$(DEVELOPER_MAINTAINER)/app,system/third-app)
endif

# AppStats
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/mk/prebuilt/common/app/AppStats,system/app/AppStats)

# Google PinYin
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/mk/prebuilt/google/app/GooglePinYin,system/app/GooglePinYin)

# Google Intl
ifneq ($(TARGET_EXCLUDE_GOOGLE_IME),true)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/mk/prebuilt/google/app/GoogleIntl,system/app/GoogleIntl)
endif