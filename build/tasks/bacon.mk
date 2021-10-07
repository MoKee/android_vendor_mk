# Copyright (C) 2017-2020 The MoKee Open Source Project
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

# -----------------------------------------------------------------
# MoKee OTA update package

MOKEE_TARGET_PACKAGE := $(PRODUCT_OUT)/$(MK_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(MOKEE_TARGET_PACKAGE)
	$(hide) $(SHA256) $(MOKEE_TARGET_PACKAGE) | cut -f1 -d' ' > $(MOKEE_TARGET_PACKAGE).sha256sum
	@echo "Package Complete: $(MOKEE_TARGET_PACKAGE)" >&2
	@echo "Package Size: `ls -lh $(MOKEE_TARGET_PACKAGE) | cut -d ' ' -f 5`" >&2
	$(hide) # Create Release, History, Nightly and Experimental folder Start
ifdef MK_BUILD_PATH
	$(hide) mkdir -p $(MK_BUILD_PATH)/$(MK_BUILDTYPE)/$(MK_BUILD)/sha256
	$(hide) cp $(MOKEE_TARGET_PACKAGE) $(MK_BUILD_PATH)/$(MK_BUILDTYPE)/$(MK_BUILD)
	$(hide) cp $(MOKEE_TARGET_PACKAGE).sha256sum $(MK_BUILD_PATH)/$(MK_BUILDTYPE)/$(MK_BUILD)/sha256
endif
ifdef MK_OTA_INPUT
	$(hide) mkdir -p $(MK_OTA_INPUT)/$(MK_BUILDTYPE)/$(MK_BUILD)
	$(hide) cp $(BUILT_TARGET_FILES_PACKAGE) $(MK_OTA_INPUT)/$(MK_BUILDTYPE)/$(MK_BUILD)/$(MK_VERSION).zip
ifneq ($(AB_OTA_UPDATER),true)
	$(hide) zip -dq $(MK_OTA_INPUT)/$(MK_BUILDTYPE)/$(MK_BUILD)/$(MK_VERSION).zip BOOT/* DATA/* IMAGES/system* IMAGES/vendor* IMAGES/userdata* IMAGES/recovery* IMAGES/cache*
endif
endif
	$(hide) # Create Release, History, Nightly and Experimental folder End
