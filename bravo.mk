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

#
# This is the product configuration for a generic GSM bravo,
# not specialized for any geography.
#

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/bravo/init.bravo.rc:root/init.bravo.rc \
    device/htc/bravo/ueventd.bravo.rc:root/ueventd.bravo.rc

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    rild.libpath=/system/lib/libhtc_ril.so \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=15

# Default network type.
# 0 => WCDMA preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# This is a high density device with more memory, so larger vm heaps for it.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=32m


## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/bravo/bravo-vendor.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.media.dec.jpeg.memcap=20000000

# Don't set /proc/sys/vm/dirty_ratio to 0 when USB mounting
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

DEVICE_PACKAGE_OVERLAYS += device/htc/bravo/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/bravo/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
    sensors.bravo \
    lights.bravo \
    gps.bravo \
    gralloc.qsd8k \
    librs_jni \
    com.android.future.usb.accessory

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Bravo uses high-density artwork where available
PRODUCT_LOCALES := hdpi

PRODUCT_COPY_FILES += \
    device/htc/bravo/bravo-keypad.kl:system/usr/keylayout/bravo-keypad.kl \
    device/htc/bravo/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/bravo/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/bravo/vold.fstab:system/etc/vold.fstab


PRODUCT_COPY_FILES += \
    device/htc/bravo/bcm4329.ko:system/lib/modules/bcm4329.ko

ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_PREBUILT_KERNEL := device/htc/bravo/kernel
endif

$(call inherit-product-if-exists, vendor/htc/bravo/bravo-vendor.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)


PRODUCT_PACKAGES += \
    		file_contexts \
		bluetoothd \
		brcm_patchram_plus \
		hciattach \
		mkyaffs2image \
		omx_tests \
		pand \
		rild \
		sdptool \
		sh \
		wpa_supplicant \
		audio \
		copybit.qsd8k \
		lights.qsd8k \
		libstagefrighthw \
		libttspico \
		libttssynthproxy \
		bravo-keypad.kcm \
		qwerty.kcm \
		qwerty2.kcm \
		fw_bcm4329.bin \
		fw_bcm4329_apsta.bin

# New packages
PRODUCT_PACKAGES += \
		apache-xml

# Host packages
PRODUCT_PACKAGES += \
		fastboot

# Missing packages (to be removed)
PRODUCT_PACKAGES += \
	libaudio \
	liba2dp \
	libacc \
	libaudiopolicy \
	libbluedroid \
	libbluetooth \
	libbluetoothd \
	libcorkscrew \
	libdiskconfig \
	libemoji \
	libexif \
	libgccdemangle \
	librpc \
	libjavacore \
	libskiagl \
	libstagefright_color_conversion \
	wpa_supplicant.conf \
	dhcpcd.conf \
	audio.conf \
	auto_pairing.conf \
	blacklist.conf \
	input.conf \
	main.conf \
	dbus.conf \
	cacerts.bks \

LIBCORE_SKIP_TESTS := true

PRODUCT_PACKAGES += \
	Clockopia.ttf \
	DroidSans-Bold.ttf \
	DroidSans.ttf \
	DroidSansArabic.ttf \
	DroidSansFallback.ttf \
	DroidSansHebrew.ttf \
	DroidSansMono.ttf \
	DroidSansThai.ttf \
	DroidSerif-Bold.ttf \
	DroidSerif-BoldItalic.ttf \
	DroidSerif-Italic.ttf \
	DroidSerif-Regular.ttf \

# For Debbugging
PRODUCT_PACKAGES += \
	gdbserver \


