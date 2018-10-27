# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/etc/sensitive_pn.xml:system/etc/sensitive_pn.xml

# World APN list
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Captcha Provider list
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/etc/captcha-provider-conf.xml:system/etc/captcha-provider-conf.xml

# Selective SPN list for operator number who has the problem.
PRODUCT_COPY_FILES += \
    vendor/mk/prebuilt/common/etc/selective-spn-conf.xml:system/etc/selective-spn-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    messaging \
    Stk \
    CellBroadcastReceiver

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Hello.ogg
