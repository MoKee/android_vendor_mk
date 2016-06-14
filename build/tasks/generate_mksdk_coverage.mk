#
# Copyright (C) 2010 The Android Open Source Project
# Copyright (C) 2016 The CyanogenMod Project
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

# Makefile for producing mksdk coverage reports.
# Run "make mksdk-test-coverage" in the $ANDROID_BUILD_TOP directory.

mksdk_api_coverage_exe := $(HOST_OUT_EXECUTABLES)/mksdk-api-coverage
dexdeps_exe := $(HOST_OUT_EXECUTABLES)/dexdeps

coverage_out := $(HOST_OUT)/mksdk-api-coverage

api_text_description := vendor/mksdk/api/mk_current.txt
api_xml_description := $(coverage_out)/api.xml
$(api_xml_description) : $(api_text_description) $(APICHECK)
	$(hide) echo "Converting API file to XML: $@"
	$(hide) mkdir -p $(dir $@)
	$(hide) $(APICHECK_COMMAND) -convert2xml $< $@

mksdk-test-coverage-report := $(coverage_out)/test-coverage.html

mksdk_tests_apk := $(call intermediates-dir-for,APPS,MKPlatformTests)/package.apk
mksdk_api_coverage_dependencies := $(mksdk_api_coverage_exe) $(dexdeps_exe) $(api_xml_description)

$(mksdk-test-coverage-report): PRIVATE_TEST_CASES := $(mksdk_tests_apk)
$(mksdk-test-coverage-report): PRIVATE_MKSDK_API_COVERAGE_EXE := $(mksdk_api_coverage_exe)
$(mksdk-test-coverage-report): PRIVATE_DEXDEPS_EXE := $(dexdeps_exe)
$(mksdk-test-coverage-report): PRIVATE_API_XML_DESC := $(api_xml_description)
$(mksdk-test-coverage-report): $(mksdk_tests_apk) $(mksdk_api_coverage_dependencies) | $(ACP)
	$(call generate-mk-coverage-report,"mksdk API Coverage Report",\
			$(PRIVATE_TEST_CASES),html)

.PHONY: mksdk-test-coverage
mksdk-test-coverage : $(mksdk-test-coverage-report)

# Put the test coverage report in the dist dir if "mksdk" is among the build goals.
ifneq ($(filter mksdk, $(MAKECMDGOALS)),)
  $(call dist-for-goals, mksdk, $(mksdk-test-coverage-report):mksdk-test-coverage-report.html)
endif

# Arguments;
#  1 - Name of the report printed out on the screen
#  2 - List of apk files that will be scanned to generate the report
#  3 - Format of the report
define generate-mk-coverage-report
	$(hide) mkdir -p $(dir $@)
	$(hide) $(PRIVATE_MKSDK_API_COVERAGE_EXE) -d $(PRIVATE_DEXDEPS_EXE) -a $(PRIVATE_API_XML_DESC) -f $(3) -o $@ $(2) -mk
	@ echo $(1): file://$(ANDROID_BUILD_TOP)/$@
endef

# Reset temp vars
mksdk_api_coverage_dependencies :=
mksdk-combined-coverage-report :=
mksdk-combined-xml-coverage-report :=
mksdk-verifier-coverage-report :=
mksdk-test-coverage-report :=
api_xml_description :=
api_text_description :=
coverage_out :=
dexdeps_exe :=
mksdk_api_coverage_exe :=
mksdk_verifier_apk :=
android_mksdk_zip :=
