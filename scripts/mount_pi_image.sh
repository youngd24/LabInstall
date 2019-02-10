#!/bin/bash
################################################################################
#
# mount_pi_image.sh
#
# Mounts the 2 partitions inside a Raspbian disk image file
#
# Darren Young <darren@yhlsecurity.com>
#
################################################################################
#
# Copyright (C) 2018 Darren Young <darren@yhlsecurity.com>
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
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
################################################################################
#
# USAGE: mount_pi_image.sh [image_file]
#
################################################################################
#
# EXAMPLE COMMANDS:
#
# mount -v -o offset=4194304 -t vfat 2018-11-13-raspbian-stretch.img /mnt/img/one
# mount -v -o offset=50331648 -t ext4 2018-11-13-raspbian-stretch.img /mnt/img/two
#
################################################################################
#
# NOTES/TODO:
#
#   * Only works for Raspbian images that have 2 partitions in them.
#   * Might have issues, was written at 3AM.
#   * Convert tabs to spaces, my .vimrc didn't have it set.
#   * Make it more dynamic, use the fdisk output to determine the partitions
#   * Convert it to use getopt for args.
#   * Get the multiplier (512) from the fdisk results.
#
################################################################################


################################################################################
#                                V A R I A B L E S 
################################################################################
MYNAME=`basename $0`        # This name
MNTBASE="/mnt/img"          # Base dir to mount up at
IMG1="img1"	                # The name of the first image in the file
IMG2="img2"                 # The name of the second image in the file
IMG1DIR="$MNTBASE/$IMG1"    # Image 1 mount point
IMG2DIR="$MNTBASE/$IMG2"    # Image 2 mount point

################################################################################
#                                    M A I N
################################################################################

#
# Check command line args
#
if [ -z "$1" ]; then
	echo "Usage: $MYNAME: [image_file]"
	exit 1
else
	image_file="$1"
	echo "Mounting image file: $image_file"
fi


#
# Calculate the offset for image 1
#
img1_start=`fdisk -l $image_file | grep $IMG1 | awk '{print $2}'`
echo "Image 1 start: $img1_start"

img1_offset=$(($img1_start * 512))
echo "Image 1 offset: $img1_offset"

#
# Calculate the offset for image 2
#
img2_start=`fdisk -l $image_file | grep $IMG2 | awk '{print $2}'`
echo "Image 2 start: $img2_start"

img2_offset=$(($img2_start * 512))
echo "Image 2 offset: $img2_offset"

#
# Build the mount commands
#
mntcmd1="mount -v -o offset=$img1_offset -t vfat $image_file $IMG1DIR"
mntcmd2="mount -v -o offset=$img2_offset -t ext4 $image_file $IMG2DIR"
echo "Mount cmd1: $mntcmd1"
echo "Mount cmd2: $mntcmd2"

#
# Create the dirs if need be
#
for dir in $MNTBASE $IMG1DIR $IMG2DIR; do
	echo "Checking for directory $dir"
	if [ ! -d $dir ]; then
		echo "Creating dir: $dir"
		mkdir $dir || echo "Failed to create $dir"
	fi
done

#
# Run the mount commands
#
echo "Mounting them up..."
${mntcmd1} > /dev/null && echo "Mounted image 1 at $IMG1DIR"
${mntcmd2} > /dev/null && echo "Mounted image 2 at $IMG2DIR"

# buh bye
exit 0
