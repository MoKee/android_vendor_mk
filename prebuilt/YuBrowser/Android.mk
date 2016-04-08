#
# Copyright (C) 2016 The MoKee Open Source Project
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

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := YuBrowser
LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := YuBrowser.apk

LOCAL_MODULE_CLASS := APPS
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := PRESIGNED

LOCAL_MULTILIB := 32
LOCAL_PREBUILT_JNI_LIBS := \
	lib/arm/libc++_shared.so \
	lib/arm/libgiga_client.so \
	lib/arm/libicuuc.cr.so \
	lib/arm/libicui18n.cr.so \
	lib/arm/libswecore.so \
	lib/arm/libsweadrenoext_23_plugin.so \
	lib/arm/libswenetxt_plugin.so \
	lib/arm/libswev8.so \
	lib/arm/libsweskia.so \
	lib/arm/libsta.so \
	lib/arm/libswe.so \
	lib/arm/libsweadrenoext_plugin.so \
	lib/arm/libsweadrenoext_22_plugin.so \
	lib/arm/libswewebrefiner.so \

include $(BUILD_PREBUILT)