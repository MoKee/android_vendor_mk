#
# This policy configuration will be used by all products that
# inherit from MK
#

BOARD_SEPOLICY_DIRS += \
    vendor/mk/sepolicy

BOARD_SEPOLICY_UNION += \
    file.te \
    file_contexts \
    genfs_contexts \
    property_contexts \
    seapp_contexts \
    service_contexts \
    adbd.te \
    app.te \
    auditd.te \
    bootanim.te \
    healthd.te \
    hostapd.te \
    installd.te \
    mkta.te \
    netd.te \
    property.te \
    recovery.te \
    servicemanager.te \
    shell.te \
    su.te \
    sysinit.te \
    system.te \
    system_app.te \
    system_server.te \
    ueventd.te \
    untrusted_app.te \
    vold.te \
    zygote.te \
    mac_permissions.xml
