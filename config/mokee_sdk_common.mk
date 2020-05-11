# Permissions for mokee sdk services
PRODUCT_COPY_FILES += \
    vendor/mokee/config/permissions/org.mokee.audio.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/org.mokee.audio.xml \
    vendor/mokee/config/permissions/org.mokee.hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/org.mokee.hardware.xml \
    vendor/mokee/config/permissions/org.mokee.license.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/org.mokee.license.xml \
    vendor/mokee/config/permissions/org.mokee.livedisplay.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/org.mokee.livedisplay.xml \
    vendor/mokee/config/permissions/org.mokee.performance.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/org.mokee.performance.xml \
    vendor/mokee/config/permissions/org.mokee.profiles.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/org.mokee.profiles.xml \
    vendor/mokee/config/permissions/org.mokee.settings.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/org.mokee.settings.xml \
    vendor/mokee/config/permissions/org.mokee.trust.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/org.mokee.trust.xml

# MoKee Platform Library
PRODUCT_PACKAGES += \
    org.mokee.platform-res \
    org.mokee.platform \
    org.mokee.platform.xml

# JNI Libraries
PRODUCT_PACKAGES += \
    libmokee-sdk_platform_jni

ifndef MOKEE_PLATFORM_SDK_VERSION
  # This is the canonical definition of the SDK version, which defines
  # the set of APIs and functionality available in the platform.  It
  # is a single integer that increases monotonically as updates to
  # the SDK are released.  It should only be incremented when the APIs for
  # the new release are frozen (so that developers don't write apps against
  # intermediate builds).
  MOKEE_PLATFORM_SDK_VERSION := 9
endif

ifndef MOKEE_PLATFORM_REV
  # For internal SDK revisions that are hotfixed/patched
  # Reset after each MOKEE_PLATFORM_SDK_VERSION release
  # If you are doing a release and this is NOT 0, you are almost certainly doing it wrong
  MOKEE_PLATFORM_REV := 0
endif
