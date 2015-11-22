# Copyright (C) 2015-2016 The MoKee Open Source Project
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
# Rules for running apicheck to confirm that you haven't broken
# api compatibility or added apis illegally.
#

# skip api check for PDK buid
ifeq (,$(filter true, $(WITHOUT_CHECK_API) $(TARGET_BUILD_PDK)))

.PHONY: checkapi-mk

# Run the checkapi rules by default.
droidcore: checkapi-mk

mk_last_released_sdk_version := $(lastword $(call numerically_sort, \
            $(filter-out current, \
                $(patsubst $(MK_SRC_API_DIR)/%.txt,%, $(wildcard $(MK_SRC_API_DIR)/*.txt)) \
             )\
        ))

.PHONY: check-mk-public-api
checkapi-mk : check-mk-public-api

.PHONY: update-mk-api

# INTERNAL_MK_PLATFORM_API_FILE is the one build by droiddoc.
# Note that since INTERNAL_MK_PLATFORM_API_FILE  is the byproduct of api-stubs module,
# (See vendor/mksdk/Android.mk)
# we need to add api-stubs as additional dependency of the api check.

# Check that the API we're building hasn't broken the last-released
# SDK version.
$(eval $(call check-api, \
    checkpublicapi-mk-last, \
    $(MK_SRC_API_DIR)/$(mk_last_released_sdk_version).txt, \
    $(INTERNAL_MK_PLATFORM_API_FILE), \
    $(FRAMEWORK_MK_PLATFORM_REMOVED_API_FILE), \
    $(INTERNAL_MK_PLATFORM_REMOVED_API_FILE), \
    cat $(BUILD_SYSTEM)/apicheck_msg_last.txt, \
    check-mk-public-api, \
    $(call doc-timestamp-for, mk-api-stubs) \
    ))


# Check that the API we're building hasn't changed from the not-yet-released
# SDK version.
$(eval $(call check-api, \
    checkpublicapi-mk-current, \
    $(FRAMEWORK_MK_PLATFORM_API_FILE), \
    $(INTERNAL_MK_PLATFORM_API_FILE), \
    $(FRAMEWORK_MK_PLATFORM_REMOVED_API_FILE), \
    $(INTERNAL_MK_PLATFORM_REMOVED_API_FILE), \
    cat $(BUILD_SYSTEM)/apicheck_msg_current.txt, \
    check-mk-public-api, \
    $(call doc-timestamp-for, mk-api-stubs) \
    ))

.PHONY: update-mk-public-api
update-mk-public-api: $(INTERNAL_MK_PLATFORM_API_FILE) | $(ACP)
	@echo -e ${CL_GRN}"Copying mk_current.txt"${CL_RST}
	$(hide) $(ACP) $(INTERNAL_MK_PLATFORM_API_FILE) $(FRAMEWORK_MK_PLATFORM_API_FILE)
	@echo -e ${CL_GRN}"Copying mk_removed.txt"${CL_RST}
	$(hide) $(ACP) $(INTERNAL_MK_PLATFORM_REMOVED_API_FILE) $(FRAMEWORK_MK_PLATFORM_REMOVED_API_FILE)

update-mk-api : update-mk-public-api

#####################Check System API#####################
.PHONY: check-mk-system-api
checkapi-mk : check-mk-system-api

# Check that the MoKee System API we're building hasn't broken the last-released
# SDK version.
$(eval $(call check-api, \
    checksystemapi-mk-last, \
    $(MK_SRC_SYSTEM_API_DIR)/$(mk_last_released_sdk_version).txt, \
    $(INTERNAL_MK_PLATFORM_SYSTEM_API_FILE), \
    $(FRAMEWORK_MK_PLATFORM_SYSTEM_REMOVED_API_FILE), \
    $(INTERNAL_MK_PLATFORM_SYSTEM_REMOVED_API_FILE), \
    cat $(BUILD_SYSTEM)/apicheck_msg_last.txt, \
    check-mk-system-api, \
    $(call doc-timestamp-for, mk-system-api-stubs) \
    ))

# Check that the System API we're building hasn't changed from the not-yet-released
# SDK version.
$(eval $(call check-api, \
    checksystemapi-mk-current, \
    $(FRAMEWORK_MK_PLATFORM_SYSTEM_API_FILE), \
    $(INTERNAL_MK_PLATFORM_SYSTEM_API_FILE), \
    $(FRAMEWORK_MK_PLATFORM_SYSTEM_REMOVED_API_FILE), \
    $(INTERNAL_MK_PLATFORM_SYSTEM_REMOVED_API_FILE), \
    cat $(BUILD_SYSTEM)/apicheck_msg_current.txt, \
    check-mk-system-api, \
    $(call doc-timestamp-for, mk-system-api-stubs) \
    ))

.PHONY: update-mk-system-api
update-mk-api : update-mk-system-api

update-mk-system-api: $(INTERNAL_PLATFORM_MK_SYSTEM_API_FILE) | $(ACP)
	@echo Copying mk_system-current.txt
	$(hide) $(ACP) $(INTERNAL_MK_PLATFORM_SYSTEM_API_FILE) $(FRAMEWORK_MK_PLATFORM_SYSTEM_API_FILE)
	@echo Copying mk_system-removed.txt
	$(hide) $(ACP) $(INTERNAL_MK_PLATFORM_SYSTEM_REMOVED_API_FILE) $(FRAMEWORK_MK_PLATFORM_SYSTEM_REMOVED_API_FILE)

.PHONY: update-mk-prebuilts-latest-public-api
current_sdk_release_text_file := $(MK_SRC_API_DIR)/$(mk_last_released_sdk_version).txt

update-mk-prebuilts-latest-public-api: $(FRAMEWORK_MK_PLATFORM_API_FILE) | $(ACP)
	@echo -e ${CL_GRN}"Publishing mk_current.txt as latest API release"${CL_RST}
	$(hide) $(ACP) $(FRAMEWORK_MK_PLATFORM_API_FILE) $(current_sdk_release_text_file)

endif
