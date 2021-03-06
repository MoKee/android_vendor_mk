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
    ro.build.selinux=1

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
    vendor/mk/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/mk/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/mk/prebuilt/common/bin/50-mk.sh:system/addon.d/50-mk.sh

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/mk/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/mk/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/mk/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# MoKee-specific broadcast actions whitelist
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

# Copy all MoKee-specific init rc files
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

# This is MoKee!
PRODUCT_COPY_FILES += \
    vendor/mk/config/permissions/com.mokee.android.xml:system/etc/permissions/com.mokee.android.xml \
    vendor/mk/config/permissions/privapp-permissions-lawnchair.xml:system/etc/permissions/privapp-permissions-lawnchair.xml \
    vendor/mk/config/permissions/privapp-permissions-mokee.xml:system/etc/permissions/privapp-permissions-mokee.xml

# Enforce privapp-permissions whitelist
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.control_privapp_permissions=log

# Hidden API whitelist
PRODUCT_COPY_FILES += \
    vendor/mk/config/permissions/lawnchair-hiddenapi-package-whitelist.xml:system/etc/sysconfig/lawnchair-hiddenapi-package-whitelist.xml \
    vendor/mk/config/permissions/mokee-hiddenapi-package-whitelist.xml:system/etc/sysconfig/mokee-hiddenapi-package-whitelist.xml

# Power whitelist
PRODUCT_COPY_FILES += \
    vendor/mk/config/permissions/mokee-power-whitelist.xml:system/etc/sysconfig/mokee-power-whitelist.xml

# Theme engine
include vendor/mk/config/themes_common.mk

ifneq ($(TARGET_DISABLE_MOKEE_SDK),true)
# MoKee SDK
include vendor/mk/config/mokee_sdk_common.mk
endif

# TWRP
ifeq ($(WITH_TWRP),true)
include vendor/mk/config/twrp.mk
endif

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Bootanimation
PRODUCT_PACKAGES += \
    bootanimation.zip

# Required MoKee packages
PRODUCT_PACKAGES += \
    MKParts \
    Development \
    Profiles

# Optional MoKee packages
PRODUCT_PACKAGES += \
    Terminal

# Custom MoKee packages
PRODUCT_PACKAGES += \
    Aegis \
    MoKeeCenter \
    MKSettingsProvider \
    MoKeeSetupWizard

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
    pigz \
    powertop \
    setcap \
    unrar \
    unzip \
    wget \
    zip

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

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/mk/overlay
DEVICE_PACKAGE_OVERLAYS += vendor/mk/overlay/common

PRODUCT_VERSION_MAJOR = 90
PRODUCT_VERSION_MINOR = 0

# Filter out random types, so it'll reset to EXPERIMENTAL
ifeq ($(filter EXPERIMENTAL HISTORY NIGHTLY PREMIUM RELEASE,$(MK_BUILDTYPE)),)
    MK_BUILDTYPE :=
else ifneq ($(filter HISTORY NIGHTLY RELEASE,$(MK_BUILDTYPE)),)
    ifeq ($(filter mokee buildbot-0x,$(shell python -c 'import os;print os.uname()[1][:11]')),)
        MK_BUILDTYPE :=
    endif
endif

ifndef MK_BUILDTYPE
    MK_BUILDTYPE := EXPERIMENTAL
endif

ifndef MK_BUILD_DATE
    ifneq ($(filter HISTORY RELEASE,$(MK_BUILDTYPE)),)
        MK_BUILD_DATE := $(shell date +%y%m%d)
    else
        MK_BUILD_DATE := $(shell date +%Y%m%d%H%M)
    endif
endif

MK_VERSION := MK$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(MK_BUILD)-$(MK_BUILD_DATE)-$(MK_BUILDTYPE)

PRODUCT_EXTRA_RECOVERY_KEYS += \
    vendor/mk/build/target/product/security/mokee

-include vendor/mk-priv/keys/keys.mk


-include $(WORKSPACE)/build_env/image-auto-bits.mk
-include vendor/mk/config/partner_gms.mk
-include vendor/mk/config/mokee_extra.mk
