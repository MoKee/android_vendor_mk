# Inherit common MK stuff
$(call inherit-product, vendor/mk/config/common.mk)

# Include MK audio files
include vendor/mk/config/mk_audio.mk

# Default notification/alarm sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.notification_sound=Alya.ogg \
    ro.config.alarm_alert=Alarm_Buzzer.ogg

ifeq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
    PRODUCT_COPY_FILES += \
        vendor/mk/prebuilt/common/bootanimation/320.zip:system/media/bootanimation.zip
endif

$(call inherit-product, vendor/mk/config/telephony.mk)
