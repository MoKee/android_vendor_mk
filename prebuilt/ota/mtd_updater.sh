#!/sbin/sh
#
# Copyright (C) 2013 The MoKee OpenSource Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Check if we're running on a bml, mtd (old) or mtd (current) device
if /sbin/busybox test -e /dev/block/bml7 ; then
	# We're running on a bml device
	/tmp/flash_image boot /tmp/boot.img
	exit 0
elif /sbin/busybox test `/sbin/busybox cat /sys/class/mtd/mtd2/size` != "$MTD_SIZE" || \
    /sbin/busybox test `/sbin/busybox cat /sys/class/mtd/mtd2/name` != "datadata" ; then
	# We're running on a mtd (old) device
	/tmp/bml_over_mtd.sh boot 72 reservoir 2004 /tmp/boot.img
	exit 0
elif /tmp/busybox test -e /dev/block/mtdblock0 ; then
	# We're running on a mtd (current) device
	/tmp/bml_over_mtd.sh boot 72 reservoir 2004 /tmp/boot.img
	exit 0
else
	# Something weird is going on
	exit 1
fi
