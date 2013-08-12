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
# This file is the build configuration for a full Android
# build for bravo hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

WITH_HOST_DALVIK := false
# Inherit from those products. Most specific first.
#$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)
# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# The rest of the configuration is inherited from a generic config
# aosp add his PRODUCT_LOCALES here
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
# bravo add his PRODUCT_LOCALES here
$(call inherit-product, device/htc/bravo/bravo.mk)

# We erase all PRODUCT_LOCALES here
PRODUCT_LOCALES := en_US en_GB fr_FR hdpi

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_bravo
PRODUCT_DEVICE := bravo
PRODUCT_MODEL := Full Android on Bravo
