INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = snell

snell_FILES = Tweak.x
snell_CFLAGS = -fobjc-arc
snell_PRIVATE_FRAMEWORKS = AppSupport
export TARGET = iphone:12.2:10.0

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += snellprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
