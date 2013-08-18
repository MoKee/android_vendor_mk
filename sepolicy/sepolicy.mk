#
# This policy configuration will be used by all products that
# inherit from MK
#

BOARD_SEPOLICY_DIRS := \
    vendor/mk/sepolicy

BOARD_SEPOLICY_UNION := \
    mac_permissions.xml
