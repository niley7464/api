#------------------------------------------------------
# Llama2.c: Inference Llama 2 in one file of pure C
#   https://github.com/karpathy/llama2.c (original upstream repository)
#   https://github.com/nnsuite/llama2.c (NNSuite forked repository)
#
# This mk file defines a prebuilt shared library for the llama2.c module.
#------------------------------------------------------
LOCAL_PATH := $(call my-dir)

ifndef LLAMACPP_LIB_PATH
$(error LLAMACPP_LIB_PATH is not defined!)
endif

# Check Target ABI. Only supports arm64 and x86_64.
ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
LLAMACPP_LIB_PATH := $(LLAMACPP_LIB_PATH)/lib/arm64
else ifeq ($(TARGET_ARCH_ABI),x86_64)
LLAMACPP_LIB_PATH := $(LLAMACPP_LIB_PATH)/lib/x86_64
else
$(error Target arch ABI not supported: $(TARGET_ARCH_ABI))
endif

LLAMACPP_PREBUILT_LIBS :=

#------------------------------------------------------
# llamacpp prebuilt shared libraries
#------------------------------------------------------
include $(CLEAR_VARS)
LOCAL_MODULE := llamacpp
LOCAL_SRC_FILES := $(LLAMACPP_LIB_PATH)/libllamacpp.a
LOCAL_EXPORT_LDFLAGS := -Wl,--exclude-libs,libllamacpp.a
include $(PREBUILT_STATIC_LIBRARY)
LLAMACPP_PREBUILT_LIBS += llamacpp
