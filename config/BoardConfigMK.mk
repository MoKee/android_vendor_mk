# Charger
ifeq ($(WITH_MOKEE_CHARGER),true)
    BOARD_HAL_STATIC_LIBRARIES := libhealthd.mokee
endif
