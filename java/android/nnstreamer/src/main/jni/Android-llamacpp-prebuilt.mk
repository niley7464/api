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
