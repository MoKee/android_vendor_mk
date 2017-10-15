# Permissions for mokee sdk services
PRODUCT_COPY_FILES += \
    vendor/mk/config/permissions/org.mokee.audio.xml:system/etc/permissions/org.mokee.audio.xml \
    vendor/mk/config/permissions/org.mokee.livedisplay.xml:system/etc/permissions/org.mokee.livedisplay.xml \
    vendor/mk/config/permissions/org.mokee.performance.xml:system/etc/permissions/org.mokee.performance.xml \
    vendor/mk/config/permissions/org.mokee.profiles.xml:system/etc/permissions/org.mokee.profiles.xml \
    vendor/mk/config/permissions/org.mokee.statusbar.xml:system/etc/permissions/org.mokee.statusbar.xml \
    vendor/mk/config/permissions/org.mokee.telephony.xml:system/etc/permissions/org.mokee.telephony.xml \
    vendor/mk/config/permissions/org.mokee.weather.xml:system/etc/permissions/org.mokee.weather.xml

# MK Platform Library
PRODUCT_PACKAGES += \
    org.mokee.platform-res \
    org.mokee.platform \
    org.mokee.platform.xml

# MK Hardware Abstraction Framework
PRODUCT_PACKAGES += \
    org.mokee.hardware \
    org.mokee.hardware.xml

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
  MOKEE_PLATFORM_SDK_VERSION := 7
endif

ifndef MOKEE_PLATFORM_REV
  # For internal SDK revisions that are hotfixed/patched
  # Reset after each MOKEE_PLATFORM_SDK_VERSION release
  # If you are doing a release and this is NOT 0, you are almost certainly doing it wrong
  MOKEE_PLATFORM_REV := 0
endif

# MoKee Platform SDK Version
PRODUCT_PROPERTY_OVERRIDES += \
  ro.mk.build.version.plat.sdk=$(MOKEE_PLATFORM_SDK_VERSION)

# MoKee Platform Internal
PRODUCT_PROPERTY_OVERRIDES += \
  ro.mk.build.version.plat.rev=$(MOKEE_PLATFORM_REV)

# MoKee Cloud SDK Version
PRODUCT_PROPERTY_OVERRIDES += \
  ro.mk.build.version.cloud.sdk=2
