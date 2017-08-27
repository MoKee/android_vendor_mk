PRODUCT_BRAND ?= mokee

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Default notification/alarm sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.notification_sound=Hello.ogg \
    ro.config.alarm_alert=AngelsHarp.ogg

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0
endif

ifneq ($(TARGET_BUILD_VARIANT),eng)
  ifdef MK_EXPERIMENTAL
    # Disable ADB authentication
    PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=0
  else
    # Enable ADB authentication
    PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
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

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/mk/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/mk/prebuilt/common/bin/sysinit:system/bin/sysinit

ifneq ($(TARGET_BUILD_VARIANT),user)
# userinit support
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
endif

# MK-specific init file
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/etc/init.local.rc:root/init.mk.rc

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
    vendor/mk/config/permissions/com.mokee.android.xml:system/etc/permissions/com.mokee.android.xml

# Theme engine
include vendor/mk/config/themes_common.mk

ifneq ($(TARGET_DISABLE_MKSDK), true)
# MKSDK
include vendor/mk/config/mksdk_common.mk
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
    BluetoothExt \
    MKAudioService \
    MKParts \
    Development \
    Profiles \
    WeatherManagerService

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
    Eleven \
    ExactCalculator \
    Jelly \
    LiveLockScreenService \
    LockClock \
    MKCenter \
    MKSettingsProvider \
    MKUpdateVerification \
    MoKeeSetupWizard \
    MoKeeWeatherProvider \
    Venus \
    WallpaperPicker \
    WeatherProvider

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Extra tools in MK
PRODUCT_PACKAGES += \
    7z \
    bash \
    bzip2 \
    curl \
    fsck.ntfs \
    gdbserver \
    htop \
    lib7z \
    libsepol \
    micro_bench \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs \
    oprofiled \
    pigz \
    powertop \
    sqlite3 \
    strace \
    tune2fs \
    unrar \
    unzip \
    wget \
    zip \
    mkchecker

# Custom off-mode charger
ifneq ($(WITH_LINEAGE_CHARGER),false)
PRODUCT_PACKAGES += \
    charger_res_images \
    lineage_charger_res_images \
    font_log.png \
    libhealthd.lineage
endif

# ExFAT support
WITH_EXFAT ?= true
ifeq ($(WITH_EXFAT),true)
TARGET_USES_EXFAT := true
PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
endif

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

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# Storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=true

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    procmem \
    procrank \
    su
endif

DEVICE_PACKAGE_OVERLAYS += vendor/mk/overlay/common

PRODUCT_VERSION_MAJOR = 80
PRODUCT_VERSION_MINOR = 0

# Set MK_BUILDTYPE and WITH_DEXPREOPT support
ifneq ($(filter mokee buildbot-0x,$(shell python -c 'import os;print os.uname()[1][:11]')),)
    ifdef MK_NIGHTLY
        MK_BUILDTYPE := NIGHTLY
    endif
    ifdef MK_RELEASE
        MK_BUILDTYPE := RELEASE
        WITH_DEXPREOPT := true
        DONT_DEXPREOPT_PREBUILTS := true
    endif
    ifdef MK_HISTORY
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

PRODUCT_PROPERTY_OVERRIDES += \
  ro.mk.support=bbs.mfunz.com \
  ro.mk.version=$(MK_VERSION) \
  ro.mk.releasetype=$(MK_BUILDTYPE) \
  ro.modversion=$(MK_VERSION)

ifeq ($(OTA_PACKAGE_SIGNING_KEY),)
    PRODUCT_EXTRA_RECOVERY_KEYS += \
        vendor/mk/build/target/product/security/mokee
endif

-include vendor/mk-priv/keys/keys.mk


-include $(WORKSPACE)/build_env/image-auto-bits.mk
-include vendor/mk/config/partner_gms.mk
-include vendor/mk/config/mk_extra.mk

$(call prepend-product-if-exists, vendor/extra/product.mk)
