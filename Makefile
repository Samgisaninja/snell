export ARCHS = arm64 arm64e

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = snell

snell_FILES = Tweak.xm
snell_CFLAGS = -fobjc-arc
snell_PRIVATE_FRAMEWORKS = AppSupport
snell_EXTRA_FRAMEWORKS += Cephei
export TARGET = iphone:13.0:12.0
snell_LDFLAGS += -lCSColorPicker

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
