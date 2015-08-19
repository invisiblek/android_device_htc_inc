# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := false

# inherit from the proprietary version
-include vendor/htc/inc/BoardConfigVendor.mk
# inherit common defines for all qsd8k devices
include device/htc/qsd8k-common/BoardConfigCommon.mk

TARGET_BOOTLOADER_BOARD_NAME := inc

# Legacy support flags
BOARD_USE_LEGACY_TRACKPAD := true

BOARD_HAS_SCREEN_OFF_FLICKER := true

BOARD_KERNEL_CMDLINE := no_console_suspend=1
BOARD_KERNEL_BASE := 0x20000000
BOARD_KERNEL_NEW_PPPOX := true

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := inc
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 1240

TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun%d/file

# cat /proc/mtd
# dev:    size   erasesize  name
# mtd0: 000a0000 00020000 "misc"
# mtd1: 00480000 00020000 "recovery"
# mtd2: 00300000 00020000 "boot"
# mtd3: 0f800000 00020000 "system"  (not anymore)
# mtd4: 000a0000 00020000 "local"
# mtd5: 02800000 00020000 "cache"
# mtd6: 09500000 00020000 "datadata"
#
# mmcblk0p1: system
# mmcblk0p2: cache
# mmcblk0p3: data
#

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00300000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0xffffffff
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 796917760
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x09500000
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_KERNEL_CONFIG    := evervolv_incrediblec_defconfig
TARGET_RECOVERY_FSTAB   := device/htc/inc/prebuilt/root/fstab.inc
