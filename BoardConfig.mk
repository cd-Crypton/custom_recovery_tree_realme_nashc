# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
# SPDX-License-Identifier: Apache-2.0

DEVICE_PATH := device/realme/nashc

# Build Rules
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_PREBUILT_ELF_FILES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Assert
TARGET_OTA_ASSERT_DEVICE += RMX3085
TARGET_OTA_ASSERT_DEVICE += RMX3085L1

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Pre-builts
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

# Kernel Information
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000
BOARD_RAMDISK_OFFSET := 0x07c08000

BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# Board
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_INCLUDE_RECOVERY_DTBO := true

# Kernel (if using Source)
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := $(TARGET_KERNEL_ARCH)
TARGET_KERNEL_SOURCE := kernel/realme/nashc
TARGET_KERNEL_CONFIG := lineage_defconfig
TARGET_KERNEL_CLANG_COMPILE := true

# Platform
TARGET_BOARD_PLATFORM := MT6785
TARGET_NO_BOOTLOADER := true

# Workarounds
TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_PRODUCT := product
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBA_8888
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/properties/system.prop
TARGET_VENDOR_PROP := $(DEVICE_PATH)/properties/vendor.prop

# Versions and Security Patch
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_PREPARE_DATA_MEDIA_EARLY := true

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_VBMETA_VENDOR := vendor
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 2
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 3

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libdmabufheap \
    libhidlmemory \
    libion \
    libnetutils \
    libxml2 \
    ashmemd_aidl_interface-cpp \
    libashmemd_client

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdmabufheap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhidlmemory.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libnetutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/ashmemd_aidl_interface-cpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libashmemd_client.so

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 900
TW_NO_SCREEN_BLANK := true
TW_INCLUDE_FUSE_EXFAT := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_APEX := true

# Property Override
TW_OVERRIDE_SYSTEM_PROPS := "ro.build.version.sdk"

# Version/Maintainer
TW_DEVICE_VERSION := Crypton

# Debugging Configs
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
