#
# This policy configuration will be used by all products that
# inherit from MK
#

BOARD_SEPOLICY_DIRS += \
    vendor/mk/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    seapp_contexts \
    mac_permissions.xml
