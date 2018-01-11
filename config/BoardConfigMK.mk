# Charger
ifneq ($(WITH_MOKEE_CHARGER),false)
    BOARD_HAL_STATIC_LIBRARIES := libhealthd.mokee
endif
