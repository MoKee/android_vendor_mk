#
# MoKee Open Source Audio Files
#

ALARM_PATH := vendor/mokee/prebuilt/common/media/audio/alarms
NOTIFICATION_PATH := vendor/mokee/prebuilt/common/media/audio/notifications
RINGTONE_PATH := vendor/mokee/prebuilt/common/media/audio/ringtones
UI_PATH := vendor/mokee/prebuilt/common/media/audio/ui

# Alarms
PRODUCT_COPY_FILES += \
    $(ALARM_PATH)/AngelsHarp.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/AngelsHarp.ogg \
    $(ALARM_PATH)/Atlas.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Atlas.ogg \
    $(ALARM_PATH)/Atria.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Atria.ogg \
    $(ALARM_PATH)/Avior.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Avior.ogg \
    $(ALARM_PATH)/Awakening.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Awakening.ogg \
    $(ALARM_PATH)/Beep.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Beep.ogg \
    $(ALARM_PATH)/Carina.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Carina.ogg \
    $(ALARM_PATH)/Cuckoo.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Cuckoo.ogg \
    $(ALARM_PATH)/Dalia.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Dalia.ogg \
    $(ALARM_PATH)/DeepOcean.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/DeepOcean.ogg \
    $(ALARM_PATH)/GentleNight.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/GentleNight.ogg \
    $(ALARM_PATH)/Happy.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Happy.ogg \
    $(ALARM_PATH)/Hurry.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Hurry.ogg \
    $(ALARM_PATH)/Lanx.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Lanx.ogg \
    $(ALARM_PATH)/Live.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Live.ogg \
    $(ALARM_PATH)/Lux.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Lux.ogg \
    $(ALARM_PATH)/Lyra.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Lyra.ogg \
    $(ALARM_PATH)/Meadow.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Meadow.ogg \
    $(ALARM_PATH)/PastTime.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/PastTime.ogg \
    $(ALARM_PATH)/Playful.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Playful.ogg \
    $(ALARM_PATH)/Primus.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Primus.ogg \
    $(ALARM_PATH)/Sky.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Sky.ogg \
    $(ALARM_PATH)/Spica.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Spica.ogg \
    $(ALARM_PATH)/SummerDay.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/SummerDay.ogg \
    $(ALARM_PATH)/Sunrise.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Sunrise.ogg \
    $(ALARM_PATH)/Tribal.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Tribal.ogg \
    $(ALARM_PATH)/Vega.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Vega.ogg \
    $(ALARM_PATH)/Virgo.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Virgo.ogg

# Notifications
PRODUCT_COPY_FILES += \
    $(NOTIFICATION_PATH)/Ariel.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Ariel.ogg \
    $(NOTIFICATION_PATH)/Blip.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Blip.ogg \
    $(NOTIFICATION_PATH)/Carme.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Carme.ogg \
    $(NOTIFICATION_PATH)/Ceres.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Ceres.ogg \
    $(NOTIFICATION_PATH)/Chime.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Chime.ogg \
    $(NOTIFICATION_PATH)/Elara.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Elara.ogg \
    $(NOTIFICATION_PATH)/Element.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Element.ogg \
    $(NOTIFICATION_PATH)/Europa.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Europa.ogg \
    $(NOTIFICATION_PATH)/Hello.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Hello.ogg \
    $(NOTIFICATION_PATH)/Iapetus.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Iapetus.ogg \
    $(NOTIFICATION_PATH)/Mallet.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Mallet.ogg \
    $(NOTIFICATION_PATH)/Pipes.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Pipes.ogg \
    $(NOTIFICATION_PATH)/Organic.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Organic.ogg \
    $(NOTIFICATION_PATH)/Rhea.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Rhea.ogg \
    $(NOTIFICATION_PATH)/Salacia.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Salacia.ogg \
    $(NOTIFICATION_PATH)/Tethys.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Tethys.ogg \
    $(NOTIFICATION_PATH)/Titan.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Titan.ogg

# Ringtones
PRODUCT_COPY_FILES += \
    $(RINGTONE_PATH)/Awake.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Awake.ogg \
    $(RINGTONE_PATH)/Callisto.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Callisto.ogg \
    $(RINGTONE_PATH)/Complex.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Complex.ogg \
    $(RINGTONE_PATH)/Ganymede.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Ganymede.ogg \
    $(RINGTONE_PATH)/Hello.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Hello.ogg \
    $(RINGTONE_PATH)/Keys.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Keys.ogg \
    $(RINGTONE_PATH)/Luna.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Luna.ogg \
    $(RINGTONE_PATH)/Momentum.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Momentum.ogg \
    $(RINGTONE_PATH)/Organic.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Organic.ogg \
    $(RINGTONE_PATH)/Phobos.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Phobos.ogg \
    $(RINGTONE_PATH)/Pyxis.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Pyxis.ogg \
    $(RINGTONE_PATH)/RobotsforEveryone.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/RobotsforEveryone.ogg \
    $(RINGTONE_PATH)/Sedna.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Sedna.ogg \
    $(RINGTONE_PATH)/TheBigAdventure.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/TheBigAdventure.ogg \
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