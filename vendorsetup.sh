#!/usr/bin/env bash
#
# Copyright (C) 2022-2026 The OrangeFox Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export FOX_BUILD_DEVICE="samurai"
export FOX_TARGET_DEVICES="samurai,RMX1931,RMX1931L1,RMX1931CN"
export OF_MAINTAINER="NAYEM"
export FOX_BUILD_TYPE="Stable"
export FOX_MAINTAINER_PATCH_VERSION="1"
export FOX_BUILD_TYPE="Unofficial"

# Screen / Display Settings (Realme X2 Pro: 1080x2400, teardrop notch at center)
export OF_SCREEN_H=2400
export OF_STATUS_H=80
export OF_STATUS_INDENT_LEFT=48
export OF_STATUS_INDENT_RIGHT=48
export OF_CLOCK_POS=1
export OF_ALLOW_DISABLE_NAVBAR=0
export OF_USE_GREEN_LED=0

# Shell & Utilities
export FOX_USE_BASH_SHELL=1
export FOX_ASH_IS_BASH=1
export FOX_USE_NANO_EDITOR=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_SED_BINARY=1
export FOX_USE_XZ_UTILS=1
export FOX_REPLACE_BUSYBOX_CAT=1
export FOX_REPLACE_TOOLBOX_GETPROP=1

# Magisk & Flashing Features
export OF_USE_MAGISKBOOT=1
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
export OF_PATCH_AVB20=1
export FOX_DELETE_AROMAFM=1
export FOX_BUGGED_AOSP_ARB_WORKAROUND="1546300800"
export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
export OF_ENABLE_LPTOOLS=0

# Backup Settings
export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1
export OF_QUICK_BACKUP_LIST="/boot;/data;/system_root;/vendor;/modem;"

# Realme / OZIP Decryption Support
export OF_SUPPORT_OZIP=1
export OF_OZIP_DECRYPT_KEY="1c4c1ea3a12531ae491b21bb31613c11"

# Keymaster & Decryption (fixes: TW_FORCE_KEYMASTER_VER requires OF_DEFAULT_KEYMASTER_VERSION)
export OF_DEFAULT_KEYMASTER_VERSION =4.0
export OF_KEEP_FORCED_KEYMASTER =true

# Flashlight (disabled by default)
export OF_FLASHLIGHT_ENABLE=0
