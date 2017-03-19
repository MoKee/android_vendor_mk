#
# MoKee OpenSource Audio Files
#

LOCAL_PATH := vendor/mk/prebuilt/common/media/audio

define create-copy-media-files
$(strip $(foreach fp,\
  $(patsubst ./%,%, \
    $(shell cd $(LOCAL_PATH) ; \
            find -L -name "*.ogg" -and -not -name ".*") \
  ),\
  $(LOCAL_PATH)/$(fp):system/media/audio/$(fp)\
))
endef

PRODUCT_COPY_FILES += $(call create-copy-media-files)
