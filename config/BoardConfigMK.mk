# Charger
ifeq ($(WITH_MOKEE_CHARGER),true)
    BOARD_HAL_STATIC_LIBRARIES := libhealthd.mokee
endif

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/mk/config/BoardConfigQcom.mk
endif
