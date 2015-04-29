#
# MoKee OpenSource Audio Files
#

ALARM_PATH := vendor/mk/prebuilt/common/media/audio/alarms
NOTIFICATION_PATH := vendor/mk/prebuilt/common/media/audio/notifications
RINGTONE_PATH := vendor/mk/prebuilt/common/media/audio/ringtones
UI_PATH := vendor/mk/prebuilt/common/media/audio/ui

# Alarms
PRODUCT_COPY_FILES += \
    $(ALARM_PATH)/angels_harp.ogg:system/media/audio/alarms/angels_harp.ogg \
    $(ALARM_PATH)/awakening.ogg:system/media/audio/alarms/awakening.ogg \
    $(ALARM_PATH)/belling.ogg:system/media/audio/alarms/belling.ogg \
    $(ALARM_PATH)/dong.ogg:system/media/audio/alarms/dong.ogg \
    $(ALARM_PATH)/dream_is_over.ogg:system/media/audio/alarms/dream_is_over.ogg \
    $(ALARM_PATH)/get_up.ogg:system/media/audio/alarms/get_up.ogg \
    $(ALARM_PATH)/glockenspiel_6.ogg:system/media/audio/alarms/glockenspiel_6.ogg \
    $(ALARM_PATH)/good_morning.ogg:system/media/audio/alarms/good_morning.ogg \
    $(ALARM_PATH)/hurry.ogg:system/media/audio/alarms/hurry.ogg \
    $(ALARM_PATH)/keep_it_simple.ogg:system/media/audio/alarms/keep_it_simple.ogg \
    $(ALARM_PATH)/la_gitar.ogg:system/media/audio/alarms/la_gitar.ogg \
    $(ALARM_PATH)/live.ogg:system/media/audio/alarms/live.ogg \
    $(ALARM_PATH)/past_time.ogg:system/media/audio/alarms/past_time.ogg \
    $(ALARM_PATH)/smart1.ogg:system/media/audio/alarms/smart1.ogg \
    $(ALARM_PATH)/smart2.ogg:system/media/audio/alarms/smart2.ogg \
    $(ALARM_PATH)/smart3.ogg:system/media/audio/alarms/smart3.ogg \
    $(ALARM_PATH)/smartforestcall.ogg:system/media/audio/alarms/smartforestcall.ogg \
    $(ALARM_PATH)/smartnature.ogg:system/media/audio/alarms/smartnature.ogg \
    $(ALARM_PATH)/smartnight5.ogg:system/media/audio/alarms/smartnight5.ogg \
    $(ALARM_PATH)/smartwater2.ogg:system/media/audio/alarms/smartwater2.ogg \
    $(ALARM_PATH)/still_dreamin.ogg:system/media/audio/alarms/still_dreamin.ogg \
    $(ALARM_PATH)/summerday.ogg:system/media/audio/alarms/summerday.ogg \
    $(ALARM_PATH)/sunrise1.ogg:system/media/audio/alarms/sunrise1.ogg \
    $(ALARM_PATH)/timer_sound.ogg:system/media/audio/alarms/timer_sound.ogg \
    $(ALARM_PATH)/to_late.ogg:system/media/audio/alarms/to_late.ogg \
    $(ALARM_PATH)/vib_7.ogg:system/media/audio/alarms/vib_7.ogg \
    $(ALARM_PATH)/wake_me_soft.ogg:system/media/audio/alarms/wake_me_soft.ogg \
    $(ALARM_PATH)/wecksong_1.ogg:system/media/audio/alarms/wecksong_1.ogg \
    $(ALARM_PATH)/xylo_3.ogg:system/media/audio/alarms/xylo_3.ogg \

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
    $(RINGTONE_PATH)/RobotsforEveryone.ogg:system/media/audio/ringtones/RobotsforEveryone.ogg \
    $(RINGTONE_PATH)/Sedna.ogg:system/media/audio/ringtones/Sedna.ogg \
    $(RINGTONE_PATH)/Simple.ogg:system/media/audio/ringtones/Simple.ogg \
    $(RINGTONE_PATH)/Strings.ogg:system/media/audio/ringtones/Strings.ogg \
    $(RINGTONE_PATH)/Titania.ogg:system/media/audio/ringtones/Titania.ogg \
    $(RINGTONE_PATH)/Triton.ogg:system/media/audio/ringtones/Triton.ogg \
    $(RINGTONE_PATH)/Umbriel.ogg:system/media/audio/ringtones/Umbriel.ogg

# UI
PRODUCT_COPY_FILES += \
    $(UI_PATH)/audio_end.ogg:system/media/audio/ui/audio_end.ogg \
    $(UI_PATH)/audio_initiate.ogg:system/media/audio/ui/audio_initiate.ogg \
    $(UI_PATH)/camera_click.ogg:system/media/audio/ui/camera_click.ogg \
    $(UI_PATH)/camera_focus.ogg:system/media/audio/ui/camera_focus.ogg \
    $(UI_PATH)/Dock.ogg:system/media/audio/ui/Dock.ogg \
    $(UI_PATH)/Effect_Tick.ogg:system/media/audio/ui/Effect_Tick.ogg \
    $(UI_PATH)/KeypressDelete.ogg:system/media/audio/ui/KeypressDelete.ogg \
    $(UI_PATH)/KeypressInvalid.ogg:system/media/audio/ui/KeypressInvalid.ogg \
    $(UI_PATH)/KeypressReturn.ogg:system/media/audio/ui/KeypressReturn.ogg \
    $(UI_PATH)/KeypressSpacebar.ogg:system/media/audio/ui/KeypressSpacebar.ogg \
    $(UI_PATH)/KeypressStandard.ogg:system/media/audio/ui/KeypressStandard.ogg \
    $(UI_PATH)/Lock.ogg:system/media/audio/ui/Lock.ogg \
    $(UI_PATH)/LowBattery.ogg:system/media/audio/ui/LowBattery.ogg \
    $(UI_PATH)/NFCFailure.ogg:system/media/audio/ui/NFCFailure.ogg \
    $(UI_PATH)/NFCInitiated.ogg:system/media/audio/ui/NFCInitiated.ogg \
    $(UI_PATH)/NFCSuccess.ogg:system/media/audio/ui/NFCSuccess.ogg \
    $(UI_PATH)/NFCTransferComplete.ogg:system/media/audio/ui/NFCTransferComplete.ogg \
    $(UI_PATH)/NFCTransferInitiated.ogg:system/media/audio/ui/NFCTransferInitiated.ogg \
    $(UI_PATH)/Trusted.ogg:system/media/audio/ui/Trusted.ogg \
    $(UI_PATH)/Undock.ogg:system/media/audio/ui/Undock.ogg \
    $(UI_PATH)/Unlock.ogg:system/media/audio/ui/Unlock.ogg \
    $(UI_PATH)/VideoRecord.ogg:system/media/audio/ui/VideoRecord.ogg \
    $(UI_PATH)/VideoStop.ogg:system/media/audio/ui/VideoStop.ogg \
    $(UI_PATH)/WirelessChargingStarted.ogg:system/media/audio/ui/WirelessChargingStarted.ogg
