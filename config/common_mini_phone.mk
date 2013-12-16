# Inherit common MK stuff
$(call inherit-product, vendor/mk/config/common.mk)

# Bring in all audio files
include frameworks/base/data/sounds/MK_Audio.mk

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Orion.ogg \
    ro.config.notification_sound=Alya.ogg \
    ro.config.alarm_alert=Alarm_Buzzer.ogg

ifeq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
    PRODUCT_COPY_FILES += \
        vendor/mk/prebuilt/common/bootanimation/320.zip:system/media/bootanimation.zip
endif

$(call inherit-product, vendor/mk/config/telephony.mk)
