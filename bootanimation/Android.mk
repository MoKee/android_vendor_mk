#
# Copyright (C) 2016-2019 The MoKee Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_GENERATED_BOOTANIMATION := $(TARGET_OUT_INTERMEDIATES)/BOOTANIMATION/bootanimation.zip
$(TARGET_GENERATED_BOOTANIMATION): INTERMEDIATES := $(TARGET_OUT_INTERMEDIATES)/BOOTANIMATION/generated
$(TARGET_GENERATED_BOOTANIMATION): $(SOONG_ZIP)
	@echo "Building bootanimation.zip"
	@rm -rf $(dir $@)
	@mkdir -p $(dir $@)
	@mkdir -p $(INTERMEDIATES)
	$(hide) tar xfp vendor/mokee/bootanimation/bootanimation.tar -C $(INTERMEDIATES)
	$(hide) if [ $(TARGET_SCREEN_HEIGHT) -lt $(TARGET_SCREEN_WIDTH) ]; then \
	    IMAGEWIDTH=$(TARGET_SCREEN_HEIGHT); \
	    IMAGEHEIGHT=$(TARGET_SCREEN_WIDTH); \
	else \
	    IMAGEWIDTH=$(TARGET_SCREEN_WIDTH); \
	    IMAGEHEIGHT=$(TARGET_SCREEN_HEIGHT); \
	fi; \
	if [ "$(TARGET_BOOTANIMATION_HALF_RES)" = "true" ]; then \
	    IMAGEWIDTH="$$(expr "$$IMAGEWIDTH" / 2)"; \
	    IMAGEHEIGHT="$$(expr "$$IMAGEHEIGHT" / 2)"; \
	fi; \
	RESOLUTION="$$IMAGEWIDTH"x"$$IMAGEHEIGHT"; \
	for frame in $(INTERMEDIATES)/part*/*; do \
	    prebuilts/tools-mokee/${HOST_OS}-x86/bin/mogrify -resize $$RESOLUTION -colors 250 $$frame; \
	done; \
	IMAGESCALEWIDTH="$$(prebuilts/tools-mokee/${HOST_OS}-x86/bin/identify -ping -format '%w' ${INTERMEDIATES}/part0/$$(ls ${INTERMEDIATES}/part0 | head -1))"; \
	IMAGESCALEHEIGHT="$$(prebuilts/tools-mokee/${HOST_OS}-x86/bin/identify -ping -format '%h' ${INTERMEDIATES}/part0/$$(ls ${INTERMEDIATES}/part0 | head -1))"; \
	if [ "$(TARGET_BOOTANIMATION_HALF_RES)" = "true" ]; then \
	    IMAGESCALEWIDTH="$$(expr "$$IMAGESCALEWIDTH" / 2)"; \
	    IMAGESCALEHEIGHT="$$(expr "$$IMAGESCALEHEIGHT" / 2)"; \
	fi; \
	echo "$$IMAGESCALEWIDTH $$IMAGESCALEHEIGHT 30" > $(INTERMEDIATES)/desc.txt; \
	cat vendor/mokee/bootanimation/desc.txt >> $(INTERMEDIATES)/desc.txt
	$(hide) $(SOONG_ZIP) -L 0 -o $(TARGET_GENERATED_BOOTANIMATION) -C $(INTERMEDIATES) -D $(INTERMEDIATES)

ifeq ($(TARGET_BOOTANIMATION),)
    TARGET_BOOTANIMATION := $(TARGET_GENERATED_BOOTANIMATION)
endif

include $(CLEAR_VARS)
LOCAL_MODULE := bootanimation.zip
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT)/media

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE): $(TARGET_BOOTANIMATION)
	@cp $(TARGET_BOOTANIMATION) $@
