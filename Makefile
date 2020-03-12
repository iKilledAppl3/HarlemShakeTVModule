ARCHS = arm64
TARGET = appletv:clang
FINALPACKAGE = 1
SYSROOT = $(THEOS)/sdks/AppleTVOS12.4.sdk
INSTALL_TARGET_PROCESSES = TVSystemMenuService 

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = HarlemShakeTV

HarlemShakeTV_FILES = HarlemShakeTVModule.m VLMHarlemShake.m
HarlemShakeTV_INSTALL_PATH = /Library/TVSystemMenuModules
HarlemShakeTV_FRAMEWORKS = UIKit AVFoundation AudioToolbox
HarlemShakeTV_PRIVATE_FRAMEWORKS = TVSystemMenuUI PineBoardServices
HarlemShakeTV_CFLAGS = -F. -I.
HarlemShakeTV_LDFLAGS +=  -F. -I.

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/TVSystemMenuModules$(ECHO_END)
	
