#
# MoKee Open Source Audio Files
#

ALARM_PATH := vendor/mk/prebuilt/common/media/audio/alarms
NOTIFICATION_PATH := vendor/mk/prebuilt/common/media/audio/notifications
RINGTONE_PATH := vendor/mk/prebuilt/common/media/audio/ringtones
UI_PATH := vendor/mk/prebuilt/common/media/audio/ui

# Alarms
PRODUCT_COPY_FILES += \
    $(ALARM_PATH)/AngelsHarp.ogg:system/media/audio/alarms/AngelsHarp.ogg \
    $(ALARM_PATH)/Atlas.ogg:system/media/audio/alarms/Atlas.ogg \
    $(ALARM_PATH)/Atria.ogg:system/media/audio/alarms/Atria.ogg \
    $(ALARM_PATH)/Avior.ogg:system/media/audio/alarms/Avior.ogg \
    $(ALARM_PATH)/Awakening.ogg:system/media/audio/alarms/Awakening.ogg \
    $(ALARM_PATH)/Beep.ogg:system/media/audio/alarms/Beep.ogg \
    $(ALARM_PATH)/Carina.ogg:system/media/audio/alarms/Carina.ogg \
    $(ALARM_PATH)/Church.ogg:system/media/audio/alarms/Church.ogg \
    $(ALARM_PATH)/Crescendo.ogg:system/media/audio/alarms/Crescendo.ogg \
    $(ALARM_PATH)/Dalia.ogg:system/media/audio/alarms/Dalia.ogg \
    $(ALARM_PATH)/DeepOcean.ogg:system/media/audio/alarms/DeepOcean.ogg \
    $(ALARM_PATH)/GentleNight.ogg:system/media/audio/alarms/GentleNight.ogg \
    $(ALARM_PATH)/Happy.ogg:system/media/audio/alarms/Happy.ogg \
    $(ALARM_PATH)/Hurry.ogg:system/media/audio/alarms/Hurry.ogg \
    $(ALARM_PATH)/Lanx.ogg:system/media/audio/alarms/Lanx.ogg \
    $(ALARM_PATH)/Live.ogg:system/media/audio/alarms/Live.ogg \
    $(ALARM_PATH)/Lux.ogg:system/media/audio/alarms/Lux.ogg \
    $(ALARM_PATH)/Lyra.ogg:system/media/audio/alarms/Lyra.ogg \
    $(ALARM_PATH)/Meadow.ogg:system/media/audio/alarms/Meadow.ogg \
    $(ALARM_PATH)/PastTime.ogg:system/media/audio/alarms/PastTime.ogg \
    $(ALARM_PATH)/Playful.ogg:system/media/audio/alarms/Playful.ogg \
    $(ALARM_PATH)/Primus.ogg:system/media/audio/alarms/Primus.ogg \
    $(ALARM_PATH)/Sky.ogg:system/media/audio/alarms/Sky.ogg \
    $(ALARM_PATH)/Spica.ogg:system/media/audio/alarms/Spica.ogg \
    $(ALARM_PATH)/SummerDay.ogg:system/media/audio/alarms/SummerDay.ogg \
    $(ALARM_PATH)/Sunrise.ogg:system/media/audio/alarms/Sunrise.ogg \
    $(ALARM_PATH)/Tribal.ogg:system/media/audio/alarms/Tribal.ogg \
    $(ALARM_PATH)/Vega.ogg:system/media/audio/alarms/Vega.ogg \
    $(ALARM_PATH)/Virgo.ogg:system/media/audio/alarms/Virgo.ogg

# Notifications
PRODUCT_COPY_FILES += \
    $(NOTIFICATION_PATH)/Ariel.ogg:system/media/audio/notifications/Ariel.ogg \
    $(NOTIFICATION_PATH)/Blip.ogg:system/media/audio/notifications/Blip.ogg \
    $(NOTIFICATION_PATH)/Carme.ogg:system/media/audio/notifications/Carme.ogg \
    $(NOTIFICATION_PATH)/Ceres.ogg:system/media/audio/notifications/Ceres.ogg \
    $(NOTIFICATION_PATH)/Chime.ogg:system/media/audio/notifications/Chime.ogg \
    $(NOTIFICATION_PATH)/Elara.ogg:system/media/audio/notifications/Elara.ogg \
    $(NOTIFICATION_PATH)/Element.ogg:system/media/audio/notifications/Element.ogg \
    $(NOTIFICATION_PATH)/Europa.ogg:system/media/audio/notifications/Europa.ogg \
    $(NOTIFICATION_PATH)/Hello.ogg:system/media/audio/notifications/Hello.ogg \
    $(NOTIFICATION_PATH)/Iapetus.ogg:system/media/audio/notifications/Iapetus.ogg \
    $(NOTIFICATION_PATH)/Organic.ogg:system/media/audio/notifications/Organic.ogg \
    $(NOTIFICATION_PATH)/Rhea.ogg:system/media/audio/notifications/Rhea.ogg \
    $(NOTIFICATION_PATH)/Salacia.ogg:system/media/audio/notifications/Salacia.ogg \
    $(NOTIFICATION_PATH)/Tethys.ogg:system/media/audio/notifications/Tethys.ogg \
    $(NOTIFICATION_PATH)/Titan.ogg:system/media/audio/notifications/Titan.ogg

# Ringtones
PRODUCT_COPY_FILES += \
    $(RINGTONE_PATH)/Awake.ogg:system/media/audio/ringtones/Awake.ogg \
    $(RINGTONE_PATH)/Callisto.ogg:system/media/audio/ringtones/Callisto.ogg \
    $(RINGTONE_PATH)/Complex.ogg:system/media/audio/ringtones/Complex.ogg \
    $(RINGTONE_PATH)/Ganymede.ogg:system/media/audio/ringtones/Ganymede.ogg \
    $(RINGTONE_PATH)/Hello.ogg:system/media/audio/ringtones/Hello.ogg \
    $(RINGTONE_PATH)/Keys.ogg:system/media/audio/ringtones/Keys.ogg \
    $(RINGTONE_PATH)/Luna.ogg:system/media/audio/ringtones/Luna.ogg \
    $(RINGTONE_PATH)/Momentum.ogg:system/media/audio/ringtones/Momentum.ogg \
    $(RINGTONE_PATH)/Natural.ogg:system/media/audio/ringtones/Natural.ogg \
    $(RINGTONE_PATH)/Onward.ogg:system/media/audio/ringtones/Onward.ogg \
    $(RINGTONE_PATH)/Organic.ogg:system/media/audio/ringtones/Organic.ogg \
    $(RINGTONE_PATH)/Phobos.ogg:system/media/audio/ringtones/Phobos.ogg \
    $(RINGTONE_PATH)/Pyxis.ogg:system/media/audio/ringtones/Pyxis.ogg \
    $(RINGTONE_PATH)/RobotsforEveryone.ogg:system/media/audio/ringtones/RobotsforEveryone.ogg \
    $(RINGTONE_PATH)/Sedna.ogg:system/media/audio/ringtones/Sedna.ogg \
    $(RINGTONE_PATH)/Simple.ogg:system/media/audio/ringtones/Simple.ogg \
    $(RINGTONE_PATH)/Strings.ogg:system/media/audio/ringtones/Strings.ogg \
    $(RINGTONE_PATH)/Titania.ogg:system/media/audio/ringtones/Titania.ogg \
    $(RINGTONE_PATH)/Triton.ogg:system/media/audio/ringtones/Triton.ogg \
    $(RINGTONE_PATH)/Umbriel.ogg:system/media/audio/ringtones/Umbriel.ogg

EFFECT_FILES := Effect_Tick KeypressReturn KeypressInvalid KeypressDelete KeypressSpacebar KeypressStandard \
	camera_focus Dock Undock Lock Unlock Trusted ChargingStarted InCallNotification \
	NFCFailure NFCInitiated NFCSuccess NFCTransferComplete NFCTransferInitiated
MATERIAL_EFFECT_FILES := camera_click VideoRecord WirelessChargingStarted LowBattery VideoStop
PIXEL_EFFECT_FILES := audio_end audio_initiate

PRODUCT_COPY_FILES += $(foreach fn,$(EFFECT_FILES),\
	$(UI_PATH)/$(fn).ogg:system/media/audio/ui/$(fn).ogg)
PRODUCT_COPY_FILES += $(foreach fn,$(MATERIAL_EFFECT_FILES),\
	$(UI_PATH)/$(fn).ogg:system/media/audio/ui/$(fn).ogg)
PRODUCT_COPY_FILES += $(foreach fn,$(PIXEL_EFFECT_FILES),\
	$(UI_PATH)/$(fn).ogg:system/media/audio/ui/$(fn).ogg)