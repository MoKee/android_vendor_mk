PRODUCT_BRAND ?= mokee

-include vendor/cm-priv/keys.mk
SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.cyanogenmod.superuser

# To deal with CM9 specifications
# TODO: remove once all devices have been switched
ifneq ($(TARGET_BOOTANIMATION_NAME),)
TARGET_SCREEN_DIMENSIONS := $(subst -, $(space), $(subst x, $(space), $(TARGET_BOOTANIMATION_NAME)))
ifeq ($(TARGET_SCREEN_WIDTH),)
TARGET_SCREEN_WIDTH := $(word 2, $(TARGET_SCREEN_DIMENSIONS))
endif
ifeq ($(TARGET_SCREEN_HEIGHT),)
TARGET_SCREEN_HEIGHT := $(word 3, $(TARGET_SCREEN_DIMENSIONS))
endif
endif

ifneq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))

# clear TARGET_BOOTANIMATION_NAME in case it was set for CM9 purposes
TARGET_BOOTANIMATION_NAME :=

# determine the smaller dimension
TARGET_BOOTANIMATION_SIZE := $(shell \
  if [ $(TARGET_SCREEN_WIDTH) -lt $(TARGET_SCREEN_HEIGHT) ]; then \
    echo $(TARGET_SCREEN_WIDTH); \
  else \
    echo $(TARGET_SCREEN_HEIGHT); \
  fi )

# get a sorted list of the sizes
bootanimation_sizes := $(subst .zip,, $(shell ls vendor/mk/prebuilt/common/bootanimation))
bootanimation_sizes := $(shell echo -e $(subst $(space),'\n',$(bootanimation_sizes)) | sort -rn)

# find the appropriate size and set
define check_and_set_bootanimation
$(eval TARGET_BOOTANIMATION_NAME := $(shell \
  if [ -z "$(TARGET_BOOTANIMATION_NAME)" ]; then
    if [ $(1) -le $(TARGET_BOOTANIMATION_SIZE) ]; then \
      echo $(1); \
      exit 0; \
    fi;
  fi;
  echo $(TARGET_BOOTANIMATION_NAME); ))
endef
$(foreach size,$(bootanimation_sizes), $(call check_and_set_bootanimation,$(size)))

PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/bootanimation/$(TARGET_BOOTANIMATION_NAME).zip:system/media/bootanimation.zip
endif

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
    vendor/mk/CHANGELOG.mkdn:system/etc/CHANGELOG-MK.txt

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/mk/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/mk/prebuilt/common/bin/50-mk.sh:system/addon.d/50-mk.sh \
    vendor/mk/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/mk/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# CM-specific init file
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/etc/init.local.rc:root/init.cm.rc

# MoKee-specific init file
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/app/GooglePinYin.apk:system/app/GooglePinYin.apk \
    vendor/mk/prebuilt/common/app/MoKeeMarket.apk:system/app/MoKeeMarket.apk \
    vendor/mk/prebuilt/common/app/GameCenter.apk:system/app/GameCenter.apk \
    vendor/mk/prebuilt/common/lib/libgnustl_shared.so:system/lib/libgnustl_shared.so \
    vendor/mk/prebuilt/common/lib/libjni_delight.so:system/lib/libjni_delight.so \
    vendor/mk/prebuilt/common/lib/libjni_googlepinyinime_5.so:system/lib/libjni_googlepinyinime_5.so \
    vendor/mk/prebuilt/common/lib/libjni_googlepinyinime_latinime_5.so:system/lib/libjni_googlepinyinime_latinime_5.so \
    vendor/mk/prebuilt/common/lib/libjni_hmm_shared_engine.so:system/lib/libjni_hmm_shared_engine.so \
    vendor/mk/prebuilt/common/lib/libpush-socket.so:system/lib/libpush-socket.so

# block stock OTAs
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/bin/otablock:system/bin/otablock

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/mk/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/mk/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/mk/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# This is MK!
PRODUCT_COPY_FILES += \
    vendor/mk/config/permissions/com.mokee.android.xml:system/etc/permissions/com.mokee.android.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/etc/mkshrc:system/etc/mkshrc

# T-Mobile theme engine
include vendor/mk/config/themes_common.mk

# Required CM packages
PRODUCT_PACKAGES += \
    Camera \
    Development \
    Superuser \
    su

# Optional CM packages
PRODUCT_PACKAGES += \
    VoicePlus \
    SoundRecorder \
    Basic

# Custom CM packages
PRODUCT_PACKAGES += \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf \
    Apollo \
    CMFileManager \
    LockClock

PRODUCT_PACKAGES += \
    CellBroadcastReceiver

# Extra tools in CM
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    bash \
    vim \
    nano \
    htop \
    powertop \
    lsof \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

# Custom MoKee packages
PRODUCT_PACKAGES += \
    Halo \
    MoKeeLauncher \
    Notepad \
    PermissionManager

# Mokee PhoneLoc
PRODUCT_COPY_FILES +=  \
    vendor/mk/prebuilt/common/media/mokee-phoneloc.dat:system/media/mokee-phoneloc.dat

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

PRODUCT_PACKAGE_OVERLAYS += vendor/mk/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/mk/overlay/common

PRODUCT_VERSION_MAJOR = 42
PRODUCT_VERSION_MINOR = 2
PRODUCT_VERSION_MAINTENANCE = RC4

# Set MK_BUILDTYPE
ifeq ($(shell hostname),mokee)
MK_BUILDTYPE := EXPERIMENTAL
endif

ifdef MK_NIGHTLY
    MK_BUILDTYPE := NIGHTLY
endif
ifdef MK_EXPERIMENTAL
    MK_BUILDTYPE := EXPERIMENTAL
endif
ifdef MK_RELEASE
    MK_BUILDTYPE := RELEASE
endif

ifdef MK_BUILDTYPE
    ifdef MK_EXTRAVERSION
        # Force build type to EXPERIMENTAL
        MK_BUILDTYPE := EXPERIMENTAL
        # Remove leading dash from MK_EXTRAVERSION
        MK_EXTRAVERSION := $(shell echo $(MK_EXTRAVERSION) | sed 's/-//')
        # Add leading dash to MK_EXTRAVERSION
        MK_EXTRAVERSION := -$(MK_EXTRAVERSION)
    endif
else
    # If MK_BUILDTYPE is not defined, set to UNOFFICIAL
    MK_BUILDTYPE := UNOFFICIAL
    MK_EXTRAVERSION :=
endif

ifdef MK_RELEASE
    MK_VERSION := MK$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(MK_BUILD)-$(shell date +%y%m%d)-RELEASE
else
    MK_VERSION := MK$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(MK_BUILD)-$(shell date +%Y%m%d%H%M)-$(MK_BUILDTYPE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
  ro.mk.support=bbs.mfunz.com \
  ro.mk.version=$(MK_VERSION) \
  ro.modversion=$(MK_VERSION)

-include vendor/mk/sepolicy/sepolicy.mk
-include $(WORKSPACE)/hudson/image-auto-bits.mk
