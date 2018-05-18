# MoKee System Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.mk.support=bbs.mfunz.com \
    ro.mk.version=$(MK_VERSION) \
    ro.mk.releasetype=$(MK_BUILDTYPE) \
    ro.modversion=$(MK_VERSION)

# MoKee Platform SDK Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.mk.build.version.plat.sdk=$(MOKEE_PLATFORM_SDK_VERSION)

# MoKee Platform Internal
ADDITIONAL_BUILD_PROPERTIES += \
    ro.mk.build.version.plat.rev=$(MOKEE_PLATFORM_REV)

# MoKee Cloud SDK Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.mk.build.version.cloud.sdk=2