# Charger
ifeq ($(WITH_MOKEE_CHARGER),true)
    BOARD_HAL_STATIC_LIBRARIES := libhealthd.mokee
endif

# QCOM HW crypto
ifeq ($(TARGET_HW_DISK_ENCRYPTION),true)
    TARGET_CRYPTFS_HW_PATH ?= vendor/qcom/opensource/cryptfs_hw
endif
