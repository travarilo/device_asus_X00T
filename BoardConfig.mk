#
# Copyright (C) 2018 The LineageOS Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

DEVICE_PATH := device/asus/X00T

BOARD_VENDOR := asus

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sdm636
TARGET_NO_BOOTLOADER := true

# Build has overriding commands
BUILD_BROKEN_DUP_RULES := true

# Platform
TARGET_BOARD_PLATFORM := sdm660

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a73

# Assert
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt
TARGET_OTA_ASSERT_DEVICE := ASUS_X00TD,X00TD,X00T

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 androidboot.console=ttyMSM0 earlycon=msm_serial_dm,0xc170000 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 sched_enable_hmp=1 sched_enable_power_aware=1 service_locator.enable=1 swiotlb=1 loop.max_part=16
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x01000000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_SOURCE := kernel/asus/sdm660
TARGET_KERNEL_CONFIG := darkonah_defconfig
TARGET_KERNEL_VERSION := 4.4
TARGET_KERNEL_CLANG_COMPILE := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-hidl"

# Audio
BOARD_USES_ALSA_AUDIO := true

ifneq ($(TARGET_USES_AOSP_FOR_AUDIO), true)
USE_CUSTOM_AUDIO_POLICY := 1
BOARD_USES_SRS_TRUEMEDIA := false
DTS_CODEC_M_ := false
MM_AUDIO_ENABLED_SAFX := true
USE_LEGACY_AUDIO_DAEMON := false
USE_LEGACY_AUDIO_MEASUREMENT := false
DOLBY_ENABLE := false
endif

USE_XML_AUDIO_POLICY_CONF := 1
BOARD_SUPPORTS_SOUND_TRIGGER := true
AUDIO_USE_DEEP_AS_PRIMARY_OUTPUT := false
MM_AUDIO_ENABLED_FTM := true
TARGET_USES_QCOM_MM_AUDIO := true
AUDIO_FEATURE_ENABLED_ASUS_TFA98XX := true
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER := true
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
QCOM_BT_USE_BTNV := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
TARGET_USE_QTI_BT_STACK := true
TARGET_FWK_SUPPORTS_FULL_VALUEADDS := true

# Camera
TARGET_USES_QTI_CAMERA_DEVICE := true

# Crypto
TARGET_HW_DISK_ENCRYPTION := true
TARGET_CRYPTFS_HW_PATH ?= vendor/qcom/opensource/cryptfs_hw

# Display
TARGET_SCREEN_DENSITY := 420
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true
TARGET_USES_ION := true

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# FM
BOARD_HAS_QCA_FM_SOC := "cherokee"
BOARD_HAVE_QCOM_FM := true

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml

ODM_MANIFEST_SKUS += X00T
ODM_MANIFEST_X00T_FILES := $(DEVICE_PATH)/manifest_nfc.xml

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 55155080704
BOARD_VENDORIMAGE_PARTITION_SIZE := 838860800
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_VENDOR := vendor
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_ROOT_EXTRA_SYMLINKS := \
    /mnt/vendor/persist:/persist

# Peripheral manager
TARGET_PER_MGR_ENABLED := true

# Power
TARGET_USES_INTERACTION_BOOST := true
TARGET_TAP_TO_WAKE_NODE := "/sys/kernel/touchpanel/dclicknode"

# Properties
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Releasetools
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_X00T
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# RIL
DISABLE_RILD_OEM_HOOK := true
ENABLE_VENDOR_RIL_SERVICE := true

# Seccomp
BOARD_SECCOMP_POLICY := $(DEVICE_PATH)/seccomp

# Security patch level
VENDOR_SECURITY_PATCH := 2020-04-05

# SELinux
include device/qcom/sepolicy-legacy-um/SEPolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Treble
BOARD_VNDK_VERSION := current

# Vendor init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_X00T
TARGET_RECOVERY_DEVICE_MODULES := libinit_X00T

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
QC_WIFI_HIDL_FEATURE_DUAL_AP := true
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_DRIVER_OPERSTATE_PATH := "/sys/class/net/wlan0/operstate"
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
TARGET_HAS_BROKEN_WLAN_SET_INTERFACE := true

# inherit from the proprietary version
include vendor/asus/X00T/BoardConfigVendor.mk
