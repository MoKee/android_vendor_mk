# Use all private binaries
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/mk/prebuilt/private/bin/$(MK_CPU_ABI),system/bin)

# Use all private libraries
ifeq ($(MK_CPU_ABI),arm64-v8a)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.so,vendor/mk/prebuilt/private/lib/arm64-v8a,system/lib64)
endif
ifeq ($(MK_CPU_ABI),armeabi-v7a)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.so,vendor/mk/prebuilt/private/lib/armeabi-v7a,system/lib)
else
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.so,vendor/mk/prebuilt/private/lib/armeabi,system/lib)
endif

# Use all third-party files
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.apk,vendor/mk/prebuilt/third/app,system/third-app)

# Use all developers-party files
ifneq ($(DEVELOPER_MAINTAINER),)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.apk,vendor/mk/prebuilt/$(DEVELOPER_MAINTAINER)/app,system/third-app)
endif

# Use all common apps
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/mk/prebuilt/common/app,system/app)

# Google apps
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/mk/prebuilt/google/app,system/app)
