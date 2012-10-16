# Call this first so apn list is actually copied
$(call inherit-product, vendor/ev/config/gsm.mk)

$(call inherit-product, device/htc/bravo/small_bravo.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/ev/config/common_small_phone.mk)

# Bring in prebuilt gapps
include vendor/napodan/prebuilt/gapps/gapps.mk

# Bring in some prebuilt app
include vendor/napodan/prebuilt/applications.mk

PRODUCT_PACKAGE_OVERLAYS := vendor/napodan/overlay

PRODUCT_LOCALES := en_US fr_FR en_GB sw320dp

#
# Setup device specific product configuration.
#
PRODUCT_NAME    := bravo
PRODUCT_BRAND   := htc_wwe
PRODUCT_DEVICE  := bravo
PRODUCT_MODEL   := HTC Desire
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_bravo BUILD_FINGERPRINT=htc_wwe/htc_bravo/bravo:2.3.3/GRI40/96875.1:user/release-keys TARGET_BUILD_TYPE=userdebug BUILD_VERSION_TAGS=release-keys PRIVATE_BUILD_DESC="3.14.405.1 CL96875 release-keys"

#
# Set up the product codename, build version & MOTD.
#
PRODUCT_CODENAME := Elsa
PRODUCT_VERSION_DEVICE_SPECIFIC := p1

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing this rom based on Evervolv for your HTC Desire\nPlease visit evervolv at \#evervolv on irc.freenode.net\n------------------------------------------------\n"

