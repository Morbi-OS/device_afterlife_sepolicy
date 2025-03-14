#
# This policy configuration will be used by all products that
# inherit from afterlife
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    device/afterlife/sepolicy/common/public

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/afterlife/sepolicy/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/afterlife/sepolicy/common/dynamic \
    device/afterlife/sepolicy/common/system
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/afterlife/sepolicy/common/dynamic \
    device/afterlife/sepolicy/common/vendor
endif

# Include atv rules on atv product
ifeq ($(PRODUCT_IS_ATV), true)
include device/afterlife/sepolicy/atv/sepolicy.mk
endif
