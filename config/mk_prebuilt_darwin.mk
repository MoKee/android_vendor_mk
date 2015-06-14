# Use all private binaries
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/private/bin/$(MK_CPU_ABI) && \
    gfind vendor/mk/prebuilt/private/bin/$(MK_CPU_ABI) -type f \
    -printf '%p:system/bin/%f ')

# Use all private libraries
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/private/lib/$(MK_CPU_ABI) && \
    gfind vendor/mk/prebuilt/private/lib/$(MK_CPU_ABI) -name '*.so' \
    -printf '%p:system/lib/%f ')

# Use all third-party files
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/third/app && \
    gfind vendor/mk/prebuilt/third/app -name '*.apk' \
    -printf '%p:system/third-app/%f ')

# Use all developers-party files
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/$(DEVELOPER_MAINTAINER)/app && \
    gfind vendor/mk/prebuilt/$(DEVELOPER_MAINTAINER)/app -name '*.apk' \
    -printf '%p:system/third-app/%f ')

# AppStats
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/common/app/AppStats && \
    gfind vendor/mk/prebuilt/common/app/AppStats -name '*.apk' \
    -printf '%p:system/app/AppStats/%f ')
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/common/app/AppStats && \
    gfind vendor/mk/prebuilt/common/app/AppStats -name '*.so' \
    -printf '%p:system/app/AppStats/lib/arm/%f ')

# Google PinYin
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/google/app/GooglePinYin && \
    gfind vendor/mk/prebuilt/google/app/GooglePinYin -name '*.apk' \
    -printf '%p:system/app/GooglePinYin/%f ')
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/google/app/GooglePinYin && \
    gfind vendor/mk/prebuilt/google/app/GooglePinYin -name '*.so' \
    -printf '%p:system/app/GooglePinYin/lib/arm/%f ')

# Google Intl
ifneq ($(TARGET_EXCLUDE_GOOGLE_IME),true)
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/google/app/GoogleIntl && \
    gfind vendor/mk/prebuilt/google/app/GoogleIntl -name '*.apk' \
    -printf '%p:system/app/GoogleIntl/%f ')
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/google/app/GoogleIntl && \
    gfind vendor/mk/prebuilt/google/app/GoogleIntl -name '*.so' \
    -printf '%p:system/app/GoogleIntl/lib/arm/%f ')
endif