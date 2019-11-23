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

# Default notification/alarm sounds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.notification_sound=Bongo.ogg \
    ro.config.alarm_alert=AngelsHarp.ogg

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.dun.override=0
endif

ifeq ($(TARGET_BUILD_VARIANT),eng)
# Disable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0
else
  ifneq ($(filter true,$(MK_RELEASE) $(MK_HISTORY) $(MK_NIGHTLY) $(MK_PREMIUM)),)
    # Enable ADB authentication
    PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1
  endif
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/mokee/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/mokee/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/mokee/prebuilt/common/bin/50-mokee.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-mokee.sh \
    vendor/mokee/prebuilt/common/bin/blacklist:$(TARGET_COPY_OUT_SYSTEM)/addon.d/blacklist

ifneq ($(AB_OTA_PARTITIONS),)
PRODUCT_COPY_FILES += \
    vendor/mokee/prebuilt/common/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/mokee/prebuilt/common/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/mokee/prebuilt/common/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
endif

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/mokee/config/permissions/backup.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/backup.xml

# MoKee-specific broadcast actions whitelist
PRODUCT_COPY_FILES += \
    vendor/mokee/config/permissions/mokee-sysconfig.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/mokee-sysconfig.xml

# Copy all MoKee-specific init rc files
$(foreach f,$(wildcard vendor/mokee/prebuilt/common/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $f)))

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/mokee/prebuilt/common/lib/content-types.properties:$(TARGET_COPY_OUT_SYSTEM)/lib/content-types.properties

# Enable Android Beam on all targets
PRODUCT_COPY_FILES += \
    vendor/mokee/config/permissions/android.software.nfc.beam.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.nfc.beam.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/Vendor_045e_Product_0719.kl

# This is MoKee!
PRODUCT_COPY_FILES += \
    vendor/mokee/config/permissions/org.mokee.android.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/org.mokee.android.xml \
    vendor/mokee/config/permissions/privapp-permissions-mokee-system.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mokee.xml \
    vendor/mokee/config/permissions/privapp-permissions-mokee-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-mokee.xml

# Enforce privapp-permissions whitelist
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.control_privapp_permissions=log

# Hidden API whitelist
PRODUCT_COPY_FILES += \
    vendor/mokee/config/permissions/mokee-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/mokee-hiddenapi-package-whitelist.xml

# Power whitelist
PRODUCT_COPY_FILES += \
    vendor/mokee/config/permissions/mokee-power-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/mokee-power-whitelist.xml

ifneq ($(TARGET_DISABLE_MOKEE_SDK),true)
# MoKee SDK
include vendor/mokee/config/mokee_sdk_common.mk
endif

# TWRP
ifeq ($(WITH_TWRP),true)
include vendor/mokee/config/twrp.mk
endif

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Disable vendor restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false

# Bootanimation
PRODUCT_PACKAGES += \
    bootanimation.zip

# AOSP packages
PRODUCT_PACKAGES += \
    ExactCalculator \
    Exchange2 \
    Terminal

# MoKee packages
PRODUCT_PACKAGES += \
    Aegis \
    AudioFX \
    Backgrounds \
    LockClock \
    MoKeeCenter \
    MKParts \
    MKSettingsProvider \
    MoKeeSetupWizard \
    Profiles \
    WeatherProvider

# Accents
PRODUCT_PACKAGES += \
    MoKeeBlackTheme \
    MoKeeBlackAccent \
    MoKeeBlueAccent \
    MoKeeBrownAccent \
    MoKeeCyanAccent \
    MoKeeDarkTheme \
    MoKeeGrayAccent \
    MoKeeGreenAccent \
    MoKeeOrangeAccent \
    MoKeePinkAccent \
    MoKeePurpleAccent \
    MoKeeRedAccent \
    MoKeeTealAccent \
    MoKeeYellowAccent

# Themes
PRODUCT_PACKAGES += \
    MoKeeThemesStub \
    ThemePicker

# Extra tools in MoKee
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    getcap \
    htop \
    lib7z \
    libsepol \
    nano \
    pigz \
    powertop \
    setcap \
    unrar \
    unzip \
    wget \
    zip

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
    procmem

# Conditionally build in su
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    adb_root
ifeq ($(WITH_SU),true)
PRODUCT_PACKAGES += \
    su
endif
endif

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/mokee/overlay
DEVICE_PACKAGE_OVERLAYS += vendor/mokee/overlay/common

PRODUCT_VERSION_MAJOR = 100
PRODUCT_VERSION_MINOR = 0

ifneq ($(filter mokee buildbot-0x,$(shell python -c 'import os;print os.uname()[1][:11]')),)
    ifdef MK_NIGHTLY
        MK_BUILDTYPE := NIGHTLY
    else ifdef MK_RELEASE
        MK_BUILDTYPE := RELEASE
    else ifdef MK_HISTORY
        MK_BUILDTYPE := HISTORY
    endif
endif

ifndef MK_BUILDTYPE
    ifdef MK_PREMIUM
        MK_BUILDTYPE := PREMIUM
    else
        MK_BUILDTYPE := EXPERIMENTAL
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

PRODUCT_EXTRA_RECOVERY_KEYS += \
    vendor/mokee/build/target/product/security/mokee

-include vendor/mokee-priv/keys/keys.mk


-include $(WORKSPACE)/build_env/image-auto-bits.mk
-include vendor/mokee/config/partner_gms.mk
-include vendor/mokee/config/mokee_extra.mk
