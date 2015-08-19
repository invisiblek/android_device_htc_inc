#
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

# Overlay
DEVICE_PACKAGE_OVERLAYS := device/htc/inc/overlay

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us.mk)

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.inc \
    init.inc.rc \
    init.inc.usb.rc \
    ueventd.inc.rc

PRODUCT_PROPERTY_OVERRIDES += \
	ro.error.receiver.system.apps=com.google.android.feedback \
	ro.setupwizard.enterprise_mode=1 \
	ro.com.google.clientidbase=android-verizon \
	ro.com.google.locationfeatures=1 \
	ro.cdma.home.operator.alpha=Verizon \
	ro.cdma.home.operator.numeric=310012 \
	ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83 \
	ro.cdma.data_retry_config=default_randomization=2000,0,0,120000,180000,540000,960000 \
	ro.telephony.ril.v3=skipdatareg,emptycallchanges \
	ro.config.vc_call_vol_steps=7 \
	ro.cdma.otaspnumschema=SELC,1,80,99 \
	ro.telephony.call_ring.multiple=false \
	ro.telephony.call_ring.delay=3000 \
	ro.setupwizard.enable_bypass=1 \
	ro.media.dec.jpeg.memcap=20000000 \
	ro.media.enc.jpeg.quality=95,85,70

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# Touchscreen
PRODUCT_COPY_FILES += \
    device/htc/inc/prebuilt/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc

# Optical trackball
PRODUCT_COPY_FILES += \
    device/htc/inc/prebuilt/usr/idc/curcial-oj.idc:system/usr/idc/curcial-oj.idc

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/inc/prebuilt/usr/keylayout/incrediblec-keypad.kl:system/usr/keylayout/incrediblec-keypad.kl \
    device/htc/inc/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

# Keymap
PRODUCT_COPY_FILES += \
    device/htc/inc/prebuilt/usr/keychars/incrediblec-keypad.kcm.bin:system/usr/keychars/incrediblec-keypad.kcm.bin

# sysctl parameters
PRODUCT_COPY_FILES += \
    device/htc/inc/prebuilt/etc/sysctl.conf:system/etc/sysctl.conf

# non-rotational init.d script
PRODUCT_COPY_FILES += \
    device/htc/inc/prebuilt/etc/init.d/02nonrot:system/etc/init.d/02nonrot

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/inc/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

# APN list
PRODUCT_COPY_FILES += \
    device/htc/inc/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/inc/prebuilt/etc/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd

# Prebuilt libcamera for HAL
PRODUCT_COPY_FILES += \
    device/htc/inc/prebuilt/lib/libcamera.so:obj/lib/libcamera.so \
    device/htc/inc/prebuilt/lib/libcamera.so:system/lib/libcamera.so

#
# Packages needed for Inc
#
# Sensors
PRODUCT_PACKAGES += \
    gps.inc \
    lights.inc \
    sensors.inc

# USB
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage

# Set dirty_ratio for UMS
PRODUCT_PROPERTY_OVERRIDES += ro.vold.umsdirtyratio=20

# Common qsd8k stuff
$(call inherit-product, device/htc/qsd8k-common/qsd8k.mk)

$(call inherit-product-if-exists, vendor/htc/inc/inc-vendor.mk)

PRODUCT_NAME := full_inc
PRODUCT_DEVICE := inc
PRODUCT_MODEL := Full Android on Inc
