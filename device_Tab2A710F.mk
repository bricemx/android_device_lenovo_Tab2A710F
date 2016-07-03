$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lenovo/Tab2A710F/Tab2A710F-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lenovo/Tab2A710F/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lenovo/Tab2A710F/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_Tab2A710F
PRODUCT_DEVICE := Tab2A710F


TARGET_BUILD_VARIANT := eng
TARGET_BUILD_TYPE := debug


# sh	# Is there an other way of avoiding - exec '/system/bin/sh' failed: No such file or directory (2) - ?
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/system/bin/sh:root/system/bin/sh \

# fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/fstab:root/fstab \
    $(LOCAL_PATH)/ramdisk/fstab.mt8127:root/fstab.mt8127

# init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/init.mt8127.rc:root/init.mt8127.rc \
    $(LOCAL_PATH)/ramdisk/init.mt8127usb.rc:root/init.mt8127usb.rc
#    $(LOCAL_PATH)/ramdisk/init.mt8127usb.rc:root/init.aee.rc \
#    $(LOCAL_PATH)/ramdisk/init.mt8127usb.rc:root/init.charging.rc \
#    $(LOCAL_PATH)/ramdisk/init.mt8127usb.rc:root/init.environ.rc \
#    $(LOCAL_PATH)/ramdisk/init.mt8127usb.rc:root/init.project.rc \
#    $(LOCAL_PATH)/ramdisk/init.mt8127usb.rc:root/init.ssd.rc \
#    $(LOCAL_PATH)/ramdisk/ueventd.mt8127.rc:root/ueventd.mt8127.rc \

PRODUCT_PACKAGES += \
    libxlog
#    libion

