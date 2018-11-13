# Allow vendor/extra to override any property by setting it first
$(call inherit-product-if-exists, vendor/extra/product.mk)

PRODUCT_BRAND ?= mokee

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    keyguard.no_require_sim=true

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.selinux=1

# Default notification/alarm sounds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.notification_sound=Hello.ogg \
    ro.config.alarm_alert=AngelsHarp.ogg

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.dun.override=0
endif

ifneq ($(TARGET_BUILD_VARIANT),eng)
  ifdef MK_EXPERIMENTAL
    # Disable ADB authentication
    PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0
  else
    # Enable ADB authentication
    PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1
  endif
endif

ifeq ($(BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE),)
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.device.cache_dir=/data/cache
else
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.device.cache_dir=/cache
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/mk/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/mk/prebuilt/common/bin/50-mk.sh:system/addon.d/50-mk.sh \
    vendor/mk/prebuilt/common/bin/blacklist:system/addon.d/blacklist

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/mk/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/mk/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/mk/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# MK-specific broadcast actions whitelist
PRODUCT_COPY_FILES += \
    vendor/mk/config/permissions/mokee-sysconfig.xml:system/etc/sysconfig/mokee-sysconfig.xml

# init.d support
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/mk/prebuilt/common/bin/sysinit:system/bin/sysinit

ifneq ($(TARGET_BUILD_VARIANT),user)
# userinit support
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
endif

# Copy all MK-specific init rc files
$(foreach f,$(wildcard vendor/mk/prebuilt/common/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):system/etc/init/$(notdir $f)))

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# This is MK!
PRODUCT_COPY_FILES += \
    vendor/mk/config/permissions/com.mokee.android.xml:system/etc/permissions/com.mokee.android.xml \
    vendor/mk/config/permissions/privapp-permissions-mokee.xml:system/etc/permissions/privapp-permissions-mokee.xml

# Theme engine
include vendor/mk/config/themes_common.mk

ifneq ($(TARGET_DISABLE_MOKEE_SDK), true)
# MoKee SDK
include vendor/mk/config/mokee_sdk_common.mk
endif

# TWRP
ifeq ($(WITH_TWRP),true)
include vendor/mk/config/twrp.mk
endif

# Bootanimation
PRODUCT_PACKAGES += \
    bootanimation.zip

# Required MK packages
PRODUCT_PACKAGES += \
    MKParts \
    Development \
    Profiles

# Optional MK packages
PRODUCT_PACKAGES += \
    libemoji \
    LiveWallpapersPicker \
    PhotoTable \
    Terminal

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# Custom MK packages
PRODUCT_PACKAGES += \
    Aegis \
    AudioFX \
    ExactCalculator \
    LockClock \
    MKCenter \
    MKSettingsProvider \
    MKUpdateVerification \
    MoKeeSetupWizard \
    MoKeeWeatherProvider \
    WallpaperPicker \
    WeatherProvider

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Berry styles
PRODUCT_PACKAGES += \
    MoKeeBlackTheme \
    MoKeeDarkTheme \
    MoKeeBlackAccent \
    MoKeeBlueAccent \
    MoKeeBrownAccent \
    MoKeeCyanAccent \
    MoKeeGreenAccent \
    MoKeeOrangeAccent \
    MoKeePinkAccent \
    MoKeePurpleAccent \
    MoKeeRedAccent \
    MoKeeYellowAccent

# Extra tools in MK
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    htop \
    lib7z \
    libsepol \
    pigz \
    powertop \
    unrar \
    unzip \
    wget \
    zip \
    mkchecker

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Custom off-mode charger
ifeq ($(WITH_MOKEE_CHARGER),true)
PRODUCT_PACKAGES += \
    mokee_charger_res_images \
    font_log.png \
    libhealthd.mokee
endif

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    mkfs.ntfs \
    mount.ntfs

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# These packages are excluded from user builds
PRODUCT_PACKAGES_DEBUG += \
    micro_bench \
    procmem \
    procrank \
    strace

# Conditionally build in su
ifneq ($(TARGET_BUILD_VARIANT),user)
ifeq ($(WITH_SU),true)
PRODUCT_PACKAGES += \
    su
endif
endif

DEVICE_PACKAGE_OVERLAYS += vendor/mk/overlay/common

PRODUCT_VERSION_MAJOR = 81
PRODUCT_VERSION_MINOR = 0

# Set MK_BUILDTYPE and WITH_DEXPREOPT support
ifneq ($(filter mokee buildbot-0x,$(shell python -c 'import os;print os.uname()[1][:11]')),)
    ifdef MK_NIGHTLY
        MK_BUILDTYPE := NIGHTLY
    else ifdef MK_RELEASE
        MK_BUILDTYPE := RELEASE
        WITH_DEXPREOPT := true
        DONT_DEXPREOPT_PREBUILTS := true
    else ifdef MK_HISTORY
        MK_BUILDTYPE := HISTORY
        WITH_DEXPREOPT := true
        DONT_DEXPREOPT_PREBUILTS := true
    endif
endif

ifndef MK_BUILDTYPE
    ifdef MK_EXPERIMENTAL
        MK_BUILDTYPE := EXPERIMENTAL
    else
        MK_BUILDTYPE := UNOFFICIAL
    endif
endif

ifneq ($(filter RELEASE HISTORY,$(MK_BUILDTYPE)),)
    ifdef MK_BUILD_DATE
        MK_VERSION := MK$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(MK_BUILD)-$(MK_BUILD_DATE)-$(MK_BUILDTYPE)
    else
        MK_VERSION := MK$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(MK_BUILD)-$(shell date +%y%m%d)-$(MK_BUILDTYPE)
    endif
else
    MK_VERSION := MK$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(MK_BUILD)-$(shell date +%Y%m%d%H%M)-$(MK_BUILDTYPE)
endif

ifeq ($(OTA_PACKAGE_SIGNING_KEY),)
    PRODUCT_EXTRA_RECOVERY_KEYS += \
        vendor/mk/build/target/product/security/mokee
endif

-include vendor/mk-priv/keys/keys.mk


-include $(WORKSPACE)/build_env/image-auto-bits.mk
-include vendor/mk/config/partner_gms.mk
-include vendor/mk/config/mk_extra.mk
