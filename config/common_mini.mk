# Inherit common MK stuff
$(call inherit-product, vendor/mk/config/common.mk)

PRODUCT_SIZE := mini

# Include MK audio files
include vendor/mk/config/mk_audio.mk

# Default notification/alarm sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.notification_sound=Hello.ogg \
    ro.config.alarm_alert=AngelsHarp.ogg

