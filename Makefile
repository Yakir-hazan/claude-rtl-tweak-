THEOS_PACKAGE_SCHEME = rootless
TARGET := iphone:clang:16.5:15.0
INSTALL_TARGET_PROCESSES = SpringBoard
include $(THEOS)/makefiles/common.mk
TWEAK_NAME = ClaudeRTL
ClaudeRTL_FILES = Tweak.x
ClaudeRTL_CFLAGS = -fobjc-arc
ClaudeRTL_FRAMEWORKS = WebKit
ClaudeRTL_FILTER = com.apple.WebKit.WebContent
include $(THEOS_MAKE_PATH)/tweak.mk
