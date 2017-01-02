# Copyright (C) 2015-2017 The MoKee Open Source Project
#           (C) 2017 The LineageOS Project
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

MK_SRC_API_DIR := $(TOPDIR)prebuilts/mksdk/api
MK_SRC_SYSTEM_API_DIR := $(TOPDIR)prebuilts/mksdk/system-api
INTERNAL_MK_PLATFORM_API_FILE := $(TARGET_OUT_COMMON_INTERMEDIATES)/PACKAGING/mk_public_api.txt
INTERNAL_MK_PLATFORM_REMOVED_API_FILE := $(TARGET_OUT_COMMON_INTERMEDIATES)/PACKAGING/mk_removed.txt
INTERNAL_MK_PLATFORM_SYSTEM_API_FILE := $(TARGET_OUT_COMMON_INTERMEDIATES)/PACKAGING/mk_system-api.txt
INTERNAL_MK_PLATFORM_SYSTEM_REMOVED_API_FILE := $(TARGET_OUT_COMMON_INTERMEDIATES)/PACKAGING/mk_system-removed.txt
FRAMEWORK_MK_PLATFORM_API_FILE := $(TOPDIR)vendor/mksdk/api/mk_current.txt
FRAMEWORK_MK_PLATFORM_REMOVED_API_FILE := $(TOPDIR)vendor/mksdk/api/mk_removed.txt
FRAMEWORK_MK_PLATFORM_SYSTEM_API_FILE := $(TOPDIR)vendor/mksdk/system-api/mk_system-current.txt
FRAMEWORK_MK_PLATFORM_SYSTEM_REMOVED_API_FILE := $(TOPDIR)vendor/mksdk/system-api/mk_system-removed.txt
FRAMEWORK_MK_API_NEEDS_UPDATE_TEXT := $(TOPDIR)vendor/mk/build/core/apicheck_msg_current.txt

BUILD_MAVEN_PREBUILT := $(TOP)/vendor/mk/build/core/maven_artifact.mk
PUBLISH_MAVEN_PREBUILT := $(TOP)/vendor/mk/build/core/maven_artifact_publish.mk

BUILD_HTTP_PREBUILT := $(TOP)/vendor/mk/build/core/http_prebuilt.mk
