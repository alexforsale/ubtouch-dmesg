#!/bin/sh
#
#
#  Author: Christian Alexander <alexforsale@yahoo.com>
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License as
#  published by the Free Software Foundation; either version 2 of the
#  License, or (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
#  USA
#

#cleanup last log
data=alternatives.log apport.log bootstrap.log btmp dmesg dmesg.0 dpkg.log fontconfig.log last_kmsg udev apt/* fsck/* lightdm/* lxc/* ubuntu-location-service/* unattended-upgrades/* upstart/*
rm -rf $data

# pull data/system-data
adb pull /data/system-data/var/log/
adb pull /proc/last_kmsg
rm *.gz faillog lastlog wtmp
git add .

NOW=$( date +%Y-%m-%d_%H_%M_%S)

git commit -m "$NOW"
