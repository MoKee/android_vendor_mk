#!/sbin/sh
#
# Copyright (C) 2013 The MoKee OpenSource Project
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
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
