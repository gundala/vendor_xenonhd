# Inherit full common XenonHD stuff
$(call inherit-product, vendor/xenonhd/config/common_full.mk)

PRODUCT_PACKAGES += AppDrawer

DEVICE_PACKAGE_OVERLAYS += vendor/lineage/overlay/tv
