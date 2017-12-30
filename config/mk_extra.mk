PRODUCT_PROPERTY_OVERRIDES += \
    ro.opa.eligible_device=true

ifdef MK_EXPERIMENTAL
  BLOCK_BASED_OTA := true
else
  BLOCK_BASED_OTA := false
endif

-include vendor/private/mk_private.mk