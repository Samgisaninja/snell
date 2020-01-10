include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = snellprefs

snellprefs_FILES = SNLRootListController.m SNLAppearanceListController.m SNLPresetsListController.m
snellprefs_INSTALL_PATH = /Library/PreferenceBundles
snellprefs_FRAMEWORKS = UIKit
snellprefs_PRIVATE_FRAMEWORKS = Preferences
snellprefs_CFLAGS = -fobjc-arc
snellprefs_EXTRA_FRAMEWORKS += Cephei
snellprefs_LDFLAGS += -lCSColorPicker

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/snellprefs.plist$(ECHO_END)
