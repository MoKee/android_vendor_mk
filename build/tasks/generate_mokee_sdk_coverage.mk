#
# Copyright (C) 2010 The Android Open Source Project
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2016-2017 The MoKee Open Source Project
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

# Makefile for producing mokee sdk coverage reports.
# Run "make mokee-sdk-test-coverage" in the $ANDROID_BUILD_TOP directory.

mokee_sdk_api_coverage_exe := $(HOST_OUT_EXECUTABLES)/mokee-sdk-api-coverage
dexdeps_exe := $(HOST_OUT_EXECUTABLES)/dexdeps

coverage_out := $(HOST_OUT)/mokee-sdk-api-coverage

api_text_description := mokee-sdk/api/mokee_current.txt
api_xml_description := $(coverage_out)/api.xml
$(api_xml_description) : $(api_text_description) $(APICHECK)
	$(hide) echo "Converting API file to XML: $@"
	$(hide) mkdir -p $(dir $@)
	$(hide) $(APICHECK_COMMAND) -convert2xml $< $@

mokee-sdk-test-coverage-report := $(coverage_out)/mokee-sdk-test-coverage.html

mokee_sdk_tests_apk := $(call intermediates-dir-for,APPS,MKPlatformTests)/package.apk
mokee_sdk_api_coverage_dependencies := $(mokee_sdk_api_coverage_exe) $(dexdeps_exe) $(api_xml_description)

$(mokee-sdk-test-coverage-report): PRIVATE_TEST_CASES := $(mokee_sdk_tests_apk)
$(mokee-sdk-test-coverage-report): PRIVATE_MOKEE_SDK_API_COVERAGE_EXE := $(mokee_sdk_api_coverage_exe)
$(mokee-sdk-test-coverage-report): PRIVATE_DEXDEPS_EXE := $(dexdeps_exe)
$(mokee-sdk-test-coverage-report): PRIVATE_API_XML_DESC := $(api_xml_description)
$(mokee-sdk-test-coverage-report): $(mokee_sdk_tests_apk) $(mokee_sdk_api_coverage_dependencies) | $(ACP)
	$(call generate-mokee-coverage-report,"MOKEE-SDK API Coverage Report",\
			$(PRIVATE_TEST_CASES),html)

.PHONY: mokee-sdk-test-coverage
mokee-sdk-test-coverage : $(mokee-sdk-test-coverage-report)

# Put the test coverage report in the dist dir if "mokee-sdk" is among the build goals.
ifneq ($(filter mokee-sdk, $(MAKECMDGOALS)),)
  $(call dist-for-goals, mokee-sdk, $(mokee-sdk-test-coverage-report):mokee-sdk-test-coverage-report.html)
endif

# Arguments;
#  1 - Name of the report printed out on the screen
#  2 - List of apk files that will be scanned to generate the report
#  3 - Format of the report
define generate-mokee-coverage-report
	$(hide) mkdir -p $(dir $@)
	$(hide) $(PRIVATE_MOKEE_SDK_API_COVERAGE_EXE) -d $(PRIVATE_DEXDEPS_EXE) -a $(PRIVATE_API_XML_DESC) -f $(3) -o $@ $(2) -mk
	@ echo $(1): file://$@
endef

# Reset temp vars
mokee_sdk_api_coverage_dependencies :=
mokee-sdk-combined-coverage-report :=
mokee-sdk-combined-xml-coverage-report :=
mokee-sdk-verifier-coverage-report :=
mokee-sdk-test-coverage-report :=
api_xml_description :=
api_text_description :=
coverage_out :=
dexdeps_exe :=
mokee_sdk_api_coverage_exe :=
mokee_sdk_verifier_apk :=
android_mokee_sdk_zip :=
