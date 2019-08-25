# Copyright (C) 2017 The Pure Nexus Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Prebuilt Packages
PRODUCT_PACKAGES += \
    AmbientPlayProvider \
    SoundPickerPrebuilt \
    WallpaperPickerGooglePrebuilt \
    NexusLauncherPrebuilt \
    WellbeingPrebuilt \
    MarkupGoogle \
    WeatherClient

ifeq ($(TARGET_GAPPS_ARCH),arm64)
PRODUCT_PACKAGES += \
    MatchmakerPrebuilt
endif

TARGET_MINIMAL_APPS ?= false

ifeq ($(TARGET_MINIMAL_APPS), false)
PRODUCT_PACKAGES += \
    NexusWallpapersStubPrebuilt2018
endif

# build.prop entrys
PRODUCT_PROPERTY_OVERRIDES += \
    ro.wallpapers_loc_request_suw=true

# Bootanimation
ifeq ($(TARGET_BOOT_ANIMATION_RES),720)
     PRODUCT_COPY_FILES += vendor/cesiumstyle/media/bootanimation_720.zip:system/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
     PRODUCT_COPY_FILES += vendor/cesiumstyle/media/bootanimation_1080.zip:system/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
     PRODUCT_COPY_FILES += vendor/cesiumstyle/media/bootanimation_1440.zip:system/media/bootanimation.zip
else
     $(warning "cesiumstyle: TARGET_BOOT_ANIMATION_RES is undefined, assuming 1080p")
     PRODUCT_COPY_FILES += vendor/cesiumstyle/media/bootanimation_1080.zip:system/media/bootanimation.zip
endif

# Fonts
PRODUCT_COPY_FILES += \
    vendor/cesiumstyle/fonts/GoogleSans-Regular.ttf:system/fonts/GoogleSans-Regular.ttf \
    vendor/cesiumstyle/fonts/GoogleSans-Medium.ttf:system/fonts/GoogleSans-Medium.ttf \
    vendor/cesiumstyle/fonts/GoogleSans-MediumItalic.ttf:system/fonts/GoogleSans-MediumItalic.ttf \
    vendor/cesiumstyle/fonts/GoogleSans-Italic.ttf:system/fonts/GoogleSans-Italic.ttf \
    vendor/cesiumstyle/fonts/GoogleSans-Bold.ttf:system/fonts/GoogleSans-Bold.ttf \
    vendor/cesiumstyle/fonts/GoogleSans-BoldItalic.ttf:system/fonts/GoogleSans-BoldItalic.ttf

ADDITIONAL_FONTS_FILE := vendor/cesiumstyle/fonts/google-sans.xml

# Pixel sysconfig
PRODUCT_COPY_FILES += \
    vendor/cesiumstyle/etc/sysconfig/pixel.xml:system/etc/sysconfig/pixel.xml

# Set Pixel blue light theme on Gboard
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.ime.theme_id=5

# Markup libs
PRODUCT_COPY_FILES += \
    vendor/cesiumstyle/lib/libsketchology_native.so:system/lib/libsketchology_native.so

ifeq ($(TARGET_GAPPS_ARCH),arm64)
PRODUCT_COPY_FILES += \
    vendor/cesiumstyle/lib64/libsketchology_native.so:system/lib64/libsketchology_native.so
endif

# Include package overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/cesiumstyle/overlay
DEVICE_PACKAGE_OVERLAYS += \
    vendor/cesiumstyle/overlay/common/

# Weather
PRODUCT_COPY_FILES += \
    vendor/cesiumstyle/etc/permissions/org.cesium.ambient.play.xml:system/etc/permissions/org.cesium.ambient.play.xml \
    vendor/cesiumstyle/etc/permissions/org.cesium.weather.client.xml:system/etc/permissions/org.cesium.weather.client.xml \
    vendor/cesiumstyle/etc/default-permissions/org.cesium.weather.client.xml:system/etc/default-permissions/org.cesium.weather.client.xml \
    vendor/cesiumstyle/etc/default-permissions/org.cesium.ambient.play.provider.xml:system/etc/default-permissions/org.cesium.ambient.play.provider.xml
