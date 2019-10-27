# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/mokee/prebuilt/common/etc/sensitive_pn.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sensitive_pn.xml

# World APN list
PRODUCT_PACKAGES += \
    apns-conf.xml

# Captcha Provider list
PRODUCT_COPY_FILES += \
    vendor/mokee/prebuilt/common/etc/captcha-provider-conf.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/captcha-provider-conf.xml

# Selective SPN list for operator number who has the problem.
PRODUCT_COPY_FILES += \
    vendor/mokee/prebuilt/common/etc/selective-spn-conf.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/selective-spn-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    messaging \
    Stk \
    CellBroadcastReceiver

# Default ringtone
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.ringtone=Flipped.ogg

# Tethering - allow without requiring a provisioning app
# (for devices that check this)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    net.tethering.noprovisioning=true
