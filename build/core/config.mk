# Copyright (C) 2015 The CyanogenMod Project
# Copyright (C) 2015-2017 The MoKee Open Source Project
#           (C) 2017-2018 The LineageOS Project
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

MOKEE_SRC_API_DIR := $(TOPDIR)prebuilts/mokee-sdk/api
INTERNAL_MOKEE_PLATFORM_API_FILE := $(TARGET_OUT_COMMON_INTERMEDIATES)/PACKAGING/mk_public_api.txt
INTERNAL_MOKEE_PLATFORM_REMOVED_API_FILE := $(TARGET_OUT_COMMON_INTERMEDIATES)/PACKAGING/mk_removed.txt
FRAMEWORK_MOKEE_PLATFORM_API_FILE := $(TOPDIR)mokee-sdk/api/mk_current.txt
FRAMEWORK_MOKEE_PLATFORM_REMOVED_API_FILE := $(TOPDIR)mokee-sdk/api/mk_removed.txt
FRAMEWORK_MOKEE_API_NEEDS_UPDATE_TEXT := $(TOPDIR)vendor/mokee/build/core/apicheck_msg_current.txt

BUILD_RRO_SYSTEM_PACKAGE := $(TOPDIR)vendor/mokee/build/core/system_rro.mk

# Rules for QCOM targets
include $(TOPDIR)vendor/mokee/build/core/qcom_target.mk
