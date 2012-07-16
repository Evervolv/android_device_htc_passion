# Call this first so apn list is actually copied
$(call inherit-product, vendor/ev/config/gsm.mk)

$(call inherit-product, device/htc/passion/full_passion.mk)

# Inherit some common evervolv stuff.
ifeq ($(MINISKIRT),true)
$(call inherit-product, vendor/ev/config/common_small_phone.mk)
else
$(call inherit-product, vendor/ev/config/common_full_phone.mk)
endif

#
# Setup device specific product configuration.
#
PRODUCT_NAME    := ev_passion
PRODUCT_BRAND   := google
PRODUCT_DEVICE  := passion
PRODUCT_MODEL   := Nexus One
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=passion BUILD_FINGERPRINT=google/passion/passion:2.3.6/GRK39F/189904:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.6 GRK39F 189904 release-keys"

#
# Set up the product codename, build version & MOTD.
#
PRODUCT_CODENAME := Perdo
ifeq ($(MINISKIRT),true)
PRODUCT_VERSION_DEVICE_SPECIFIC := p2-StockHBoot
else
PRODUCT_VERSION_DEVICE_SPECIFIC := p2
endif

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing Evervolv for your Google Nexus One\nPlease visit us at \#evervolv on irc.freenode.net\nFollow @preludedrew for the latest Evervolv updates\nGet the latest rom at evervolv.com\n------------------------------------------------\n"

#
# Extra Packages
#
PRODUCT_PACKAGES += \
    Camera

# Copy compatible bootanimation
ifneq ($(MINISKIRT),true)
PRODUCT_COPY_FILES += \
    vendor/ev/prebuilt/wvga/media/bootanimation.zip:system/media/bootanimation.zip
#    device/htc/passion/extras/bootanimation_passion_ics.zip:system/media/bootanimation.zip
endif

# Hot reboot
PRODUCT_PACKAGE_OVERLAYS += vendor/ev/overlay/hot_reboot
