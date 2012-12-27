# Inherit common CM stuff
<<<<<<< HEAD
$(call inherit-product, vendor/mk/config/common.mk)
=======
$(call inherit-product, vendor/cm/config/common.mk)
>>>>>>> ee35e66f6c5cd7251ffb8e2bbc1fedc44f7eb69c

# Bring in all audio files
include frameworks/base/data/sounds/NewAudio.mk

# Include CM audio files
<<<<<<< HEAD
include vendor/mk/config/mk_audio.mk
=======
include vendor/cm/config/cm_audio.mk
>>>>>>> ee35e66f6c5cd7251ffb8e2bbc1fedc44f7eb69c

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Orion.ogg \
    ro.config.notification_sound=Deneb.ogg \
    ro.config.alarm_alert=Hassium.ogg

# BT config
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf

ifeq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
    PRODUCT_COPY_FILES += \
<<<<<<< HEAD
        vendor/mk/prebuilt/common/bootanimation/800.zip:system/media/bootanimation.zip
=======
        vendor/cm/prebuilt/common/bootanimation/800.zip:system/media/bootanimation.zip
>>>>>>> ee35e66f6c5cd7251ffb8e2bbc1fedc44f7eb69c
endif
