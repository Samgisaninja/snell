INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = snell

snell_FILES = Tweak.xm
snell_CFLAGS = -fobjc-arc
snell_PRIVATE_FRAMEWORKS = AppSupport
snell_EXTRA_FRAMEWORKS += Cephei
export TARGET = iphone:11.2:10.0
snell_LDFLAGS += -lCSColorPicker

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += snellprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
