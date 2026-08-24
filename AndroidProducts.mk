#
# Copyright (C) 2022 Team Win Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_samurai.mk \
    $(LOCAL_DIR)/fox_samurai.mk \
    $(LOCAL_DIR)/omni_samurai.mk

COMMON_LUNCH_CHOICES := \
    twrp_samurai-eng \
    twrp_samurai-userdebug \
    fox_samurai-eng \
    fox_samurai-userdebug \
    omni_samurai-eng \
    omni_samurai-userdebug