#
# MoKee Open Source Audio Files (minified)
#

ALARM_PATH := vendor/mokee/prebuilt/common/media/audio/alarms
NOTIFICATION_PATH := vendor/mokee/prebuilt/common/media/audio/notifications
RINGTONE_PATH := vendor/mokee/prebuilt/common/media/audio/ringtones
UI_PATH := vendor/mokee/prebuilt/common/media/audio/ui

# Alarms
PRODUCT_COPY_FILES += \
    $(ALARM_PATH)/Aegean_Sea.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Aegean_Sea.ogg \
    $(ALARM_PATH)/AngelsHarp.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/AngelsHarp.ogg \
    $(ALARM_PATH)/Awakening.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Awakening.ogg \
    $(ALARM_PATH)/Beep.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Beep.ogg \
    $(ALARM_PATH)/Carina.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Carina.ogg \
    $(ALARM_PATH)/Dalia.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Dalia.ogg \
    $(ALARM_PATH)/DeepOcean.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/DeepOcean.ogg \
    $(ALARM_PATH)/Happy.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Happy.ogg \
    $(ALARM_PATH)/Hurry.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Hurry.ogg \
    $(ALARM_PATH)/Live.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Live.ogg \
    $(ALARM_PATH)/Lux.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Lux.ogg \
    $(ALARM_PATH)/Lyra.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Lyra.ogg \
    $(ALARM_PATH)/Playful.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Playful.ogg \
    $(ALARM_PATH)/Primus.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Primus.ogg \
    $(ALARM_PATH)/Sakura_Drop.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Sakura_Drop.ogg \
    $(ALARM_PATH)/Sky.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Sky.ogg \
    $(ALARM_PATH)/Spica.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Spica.ogg \
    $(ALARM_PATH)/SummerDay.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/SummerDay.ogg \
    $(ALARM_PATH)/Vega.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Vega.ogg

# Notifications
PRODUCT_COPY_FILES += \
    $(NOTIFICATION_PATH)/Ariel.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Ariel.ogg \
    $(NOTIFICATION_PATH)/Bongo.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Bongo.ogg \
    $(NOTIFICATION_PATH)/Carme.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Carme.ogg \
    $(NOTIFICATION_PATH)/Ceres.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Ceres.ogg \
    $(NOTIFICATION_PATH)/Chime.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Chime.ogg \
    $(NOTIFICATION_PATH)/Elara.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Elara.ogg \
    $(NOTIFICATION_PATH)/Europa.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Europa.ogg \
    $(NOTIFICATION_PATH)/Hello.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Hello.ogg \
    $(NOTIFICATION_PATH)/Iapetus.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Iapetus.ogg \
    $(NOTIFICATION_PATH)/Rhea.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Rhea.ogg \
    $(NOTIFICATION_PATH)/Salacia.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Salacia.ogg \
    $(NOTIFICATION_PATH)/Tethys.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Tethys.ogg \
    $(NOTIFICATION_PATH)/Titan.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Titan.ogg

# Ringtones
PRODUCT_COPY_FILES += \
    $(RINGTONE_PATH)/Flipped.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Flipped.ogg \
    $(RINGTONE_PATH)/Ganymede.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Ganymede.ogg \
    $(RINGTONE_PATH)/Hello.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Hello.ogg \
    $(RINGTONE_PATH)/Luna.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Luna.ogg \
    $(RINGTONE_PATH)/Phobos.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Phobos.ogg \
    $(RINGTONE_PATH)/Pyxis.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Pyxis.ogg \
    $(RINGTONE_PATH)/Sailing.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Sailing.ogg \
    $(RINGTONE_PATH)/Sedna.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Sedna.ogg \
    $(RINGTONE_PATH)/Suite.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Suite.ogg \
    $(RINGTONE_PATH)/Titania.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Titania.ogg \
    $(RINGTONE_PATH)/Triton.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Triton.ogg

EFFECT_FILES := Effect_Tick KeypressReturn KeypressInvalid KeypressDelete KeypressSpacebar KeypressStandard \
	camera_focus Dock Undock Lock Unlock Trusted ChargingStarted InCallNotification \
	NFCFailure NFCInitiated NFCSuccess NFCTransferComplete NFCTransferInitiated
MATERIAL_EFFECT_FILES := camera_click VideoRecord WirelessChargingStarted LowBattery VideoStop
PIXEL_EFFECT_FILES := audio_end audio_initiate

PRODUCT_COPY_FILES += $(foreach fn,$(EFFECT_FILES),\
	$(UI_PATH)/$(fn).ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/$(fn).ogg)
PRODUCT_COPY_FILES += $(foreach fn,$(MATERIAL_EFFECT_FILES),\
	$(UI_PATH)/$(fn).ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/$(fn).ogg)
PRODUCT_COPY_FILES += $(foreach fn,$(PIXEL_EFFECT_FILES),\
	$(UI_PATH)/$(fn).ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/$(fn).ogg)