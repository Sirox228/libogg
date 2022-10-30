LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libogg

LOCAL_SDK_VERSION := 19

LOCAL_CFLAGS := -DHAVE_CONFIG_H \
    -ffast-math -fsigned-char -O2 -fPIC -DPIC \
    -DBYTE_ORDER=LITTLE_ENDIAN

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/libogg \
    $(LOCAL_PATH)/libogg/include \
    $(LOCAL_PATH)/libogg/src

LOCAL_SRC_FILES := \
    $(LOCAL_PATH)/libogg/src/bitwise.c \
    $(LOCAL_PATH)/libogg/src/framing.c

ifeq ($(strip $(TARGET_ARCH)),arm)
    LOCAL_CFLAGS += -DCPU_ARM -D_ARM_ASSEM_
endif

ifeq ($(strip $(TARGET_ARCH)),x86)
    LOCAL_CFLAGS += -DCPU_X86
endif

ifeq ($(strip $(TARGET_ARCH)),arm64)
    LOCAL_CFLAGS += -DCPU_ARM -D_ARM_ASSEM_
endif

ifeq ($(strip $(TARGET_ARCH)),x86_64)
    LOCAL_CFLAGS += -DCPU_X86
endif

include $(BUILD_STATIC_LIBRARY)
