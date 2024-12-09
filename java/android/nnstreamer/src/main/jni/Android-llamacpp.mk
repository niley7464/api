LOCAL_PATH := $(call my-dir)

LLAMACPP_DIR := $(LOCAL_PATH)/llamacpp
LLAMACPP_INCLUDES := $(LLAMACPP_DIR)/include
LLAMACPP_LIB_PATH := $(LLAMACPP_DIR)/lib

#------------------------------------------------------
# Import LLAMA2C_PREBUILT_LIBS
#------------------------------------------------------
include $(LOCAL_PATH)/Android-llamacpp-prebuilt.mk

#------------------------------------------------------
# tensor-filter sub-plugin for llama2.c
#------------------------------------------------------
include $(CLEAR_VARS)
LOCAL_MODULE := llamacpp-subplugin
LOCAL_SRC_FILES := $(NNSTREAMER_FILTER_LLAMA2C_SRCS)
LOCAL_CXXFLAGS := -O3 -fPIC -frtti -fexceptions $(NNS_API_FLAGS)
LOCAL_C_INCLUDES := $(LLAMA2C_INCLUDES) $(NNSTREAMER_INCLUDES) $(GST_HEADERS_COMMON)
LOCAL_STATIC_LIBRARIES := nnstreamer
LOCAL_SHARED_LIBRARIES := $(LLAMA2C_PREBUILT_LIBS)

include $(BUILD_STATIC_LIBRARY)
