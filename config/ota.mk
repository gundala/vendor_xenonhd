# OTA default build type
ifeq ($(OTA_TYPE),)
OTA_TYPE=Unofficial
endif

# Make sure the uppercase is used
ifeq ($(OTA_TYPE),experimental)
OTA_TYPE=Experimental
endif
ifeq ($(OTA_TYPE),official)
OTA_TYPE=Official
endif

# XenonHD version
XENONHD_VERSION := XenonHD-$(shell date +"%y%m%d")-$(OTA_TYPE)
DEVICE := $(subst xenonhd_,,$(TARGET_PRODUCT))

# Build.prop overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.xenonhd.version=$(XENONHD_VERSION) \
    ro.xenonhd.type=$(OTA_TYPE)

ifneq ($(OTA_TYPE),Unofficial)
# XenonHD OTA app
PRODUCT_PACKAGES += \
    XenonOTA

$(shell echo -e "# OTA_configuration\n \
ota_experimental=https://mirrors.c0urier.net/android/teamhorizon/O/OTA/ota_$(DEVICE)_experimental.xml\n \
ota_official=https://mirrors.c0urier.net/android/teamhorizon/O/OTA/ota_$(DEVICE)_official.xml\n \
device_name=ro.xenonhd.device\n \
release_type=Oreo\n \
version_source=ro.xenonhd.version\n \
version_delimiter=-\n \
version_position=1\n \
version_format=yyMMdd" > $(ANDROID_BUILD_TOP)/out/ota_conf)
endif
