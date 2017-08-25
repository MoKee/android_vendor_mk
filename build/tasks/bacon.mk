# Copyright (C) 2017 The MoKee Open Source Project
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

MK_TARGET_PACKAGE := $(PRODUCT_OUT)/$(MK_VERSION).zip

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(MK_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(MK_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(MK_TARGET_PACKAGE).md5sum
	@echo "Package Complete: $(MK_TARGET_PACKAGE)" >&2
