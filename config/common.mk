PRODUCT_BRAND ?= mokee

# Odex support for official releases 
ifdef MK_RELEASE
WITH_DEXPREOPT := true
endif

SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.cyanogenmod.superuser

MOKEEHELPER_EMBEDDED := true
MOKEEHELPER_PACKAGE_PREFIX := com.android.settings.mokee.mokeehelper

ifneq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
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

ifeq ($(TARGET_BOOTANIMATION_HALF_RES),true)
PRODUCT_BOOTANIMATION := vendor/mk/prebuilt/common/bootanimation/halfres/$(TARGET_BOOTANIMATION_NAME).zip
else
PRODUCT_BOOTANIMATION := vendor/mk/prebuilt/common/bootanimation/$(TARGET_BOOTANIMATION_NAME).zip
endif
endif

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Disable multithreaded dexopt by default
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.dalvik.multithread=false

# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
    vendor/mk/CHANGELOG.mkdn:system/etc/CHANGELOG-MK.txt

# Copy over the translator to the device
PRODUCT_COPY_FILES += \
    vendor/mk/TRANSLATOR.mkdn:system/etc/TRANSLATOR-MK.txt

# Backup Tool
ifneq ($(WITH_GMS),true)
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/mk/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/mk/prebuilt/common/bin/50-mk.sh:system/addon.d/50-mk.sh \
    vendor/mk/prebuilt/common/bin/blacklist:system/addon.d/blacklist
endif

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/bin/otasigcheck.sh:system/bin/otasigcheck.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/mk/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# MK-specific init file
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/etc/init.local.rc:root/init.mk.rc

# MoKee prebuilt
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/ota/verifier:system/bin/verifier \
    vendor/mk/prebuilt/common/etc/init.d/88preinstall:system/etc/init.d/88preinstall \
    vendor/mk/prebuilt/common/app/iFlyIME.apk:system/app/iFlyIME.apk

# Use all prebuilt lib files
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/common/lib && \
    find vendor/mk/prebuilt/common/lib -name '*.so' \
    -printf '%p:system/lib/%f ')

# Use all developers-party apk
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/$(DEVELOPER_MAINTAINER)/app && \
    find vendor/mk/prebuilt/$(DEVELOPER_MAINTAINER)/app -name '*.apk' \
    -printf '%p:system/third-app/%f ')

# Use all third-party apk
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/third/app && \
    find vendor/mk/prebuilt/third/app -name '*.apk' \
    -printf '%p:system/third-app/%f ')

# Google IME
ifneq ($(TARGET_EXCLUDE_GOOGLE_IME),true)
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/app/GoogleIME.apk:system/app/GoogleIME.apk
endif

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

# Chromium Prebuilt
ifeq ($(PRODUCT_PREBUILT_WEBVIEWCHROMIUM),yes)
-include prebuilts/chromium/$(TARGET_DEVICE)/chromium_prebuilt.mk
endif

# This is MK!
PRODUCT_COPY_FILES += \
    vendor/mk/config/permissions/com.mokee.android.xml:system/etc/permissions/com.mokee.android.xml

# T-Mobile theme engine
include vendor/mk/config/themes_common.mk

# Required MK packages
PRODUCT_PACKAGES += \
    Development \
    BluetoothExt

# Optional MK packages
PRODUCT_PACKAGES += \
    VoicePlus \
    Basic \
    libemoji

# Custom MK packages

PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.ipcall.enabled=true

# MoKee PhoneLoc Database
PRODUCT_COPY_FILES +=  \
    vendor/mk/prebuilt/common/media/mokee-phoneloc.dat:system/media/mokee-phoneloc.dat

PRODUCT_PACKAGES += \
    Launcher3 \
    MoKeeLauncher \
    DSPManager \
    libcyanogen-dsp \
    libscreenrecorder \
    audio_effects.conf \
    Apollo \
    CMFileManager \
    LockClock \
    MoKeeHelper \
    MoKeeHome \
    MoKeeScreenRecorder \
    MoKeeSetupWizard

# MK Hardware Abstraction Framework
PRODUCT_PACKAGES += \
    org.mokee.hardware \
    org.mokee.hardware.xml

# Extra tools in MK
PRODUCT_PACKAGES += \
    libsepol \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    bash \
    nano \
    htop \
    powertop \
    lsof \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs \
    ntfsfix \
    ntfs-3g \
    gdbserver \
    micro_bench \
    oprofiled \
    sqlite3 \
    strace

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
    libstagefright_soft_ffmpegadec \
    libstagefright_soft_ffmpegvdec \
    libFFmpegExtractor \
    libnamparser

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)

PRODUCT_PACKAGES += \
    procmem \
    procrank \
    Superuser \
    su

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=1
else

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=0

endif

PRODUCT_PACKAGE_OVERLAYS += vendor/mk/overlay/common

PRODUCT_VERSION_MAJOR = 44
PRODUCT_VERSION_MINOR = 4
PRODUCT_VERSION_MAINTENANCE = 0

# Set MK_BUILDTYPE
ifneq ($(filter mokee buildbot-0x,$(shell python -c 'import os;print os.uname()[1][:11]')),)

    ifdef MK_NIGHTLY
        MK_BUILDTYPE := NIGHTLY
    endif
    ifdef MK_EXPERIMENTAL
        MK_BUILDTYPE := EXPERIMENTAL
    endif
    ifdef MK_RELEASE
        MK_BUILDTYPE := RELEASE
    endif
    ifdef MK_HISTORY
        MK_BUILDTYPE := HISTORY
    endif
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

ifneq ($(filter RELEASE HISTORY,$(MK_BUILDTYPE)),)
    ifdef MK_BUILD_DATE
        MK_VERSION := MK$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(MK_BUILD)-$(MK_BUILD_DATE)-$(MK_BUILDTYPE)
    else
        MK_VERSION := MK$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(MK_BUILD)-$(shell date +%y%m%d)-$(MK_BUILDTYPE)
    endif
else
    MK_VERSION := MK$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(MK_BUILD)-$(shell date +%Y%m%d%H%M)-$(MK_BUILDTYPE)
endif

# by default, do not update the recovery with system updates
PRODUCT_PROPERTY_OVERRIDES += persist.sys.recovery_update=false

PRODUCT_PROPERTY_OVERRIDES += \
  ro.mk.support=bbs.mfunz.com \
  ro.mk.version=$(MK_VERSION) \
  ro.mk.releasetype=$(MK_BUILDTYPE) \
  ro.modversion=$(MK_VERSION)

-include vendor/mk-priv/keys/keys.mk


-include $(WORKSPACE)/build-env/image-auto-bits.mk

$(call inherit-product-if-exists, vendor/extra/product.mk)
