# Charger
ifeq ($(WITH_MOKEE_CHARGER),true)
    BOARD_HAL_STATIC_LIBRARIES := libhealthd.mokee
endif

include vendor/mokee/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/mokee/config/BoardConfigQcom.mk
endif

include vendor/mokee/config/BoardConfigSoong.mk
