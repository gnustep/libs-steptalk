#
#  MyLanguage language bundle
#
#  @COPYRIGHT@
#

GNUSTEP_MAKEFILES = $(GNUSTEP_SYSTEM_ROOT)/Makefiles

include $(GNUSTEP_MAKEFILES)/common.make

###########################################################################
# Language name

BUNDLE_NAME        = MyLanguage
    
MyLanguage_PRINCIPAL_CLASS = MyLanguageEngine

###########################################################################
# Files

MyLanguage_OBJC_FILES = \
        MyLanguageEngine.m
        
        
# MyLanguage_BUNDLE_LIBS += -lmylanguage

###########################################################################

BUNDLE_EXTENSION  := .stlanguage
BUNDLE_INSTALL_DIR:=$(GNUSTEP_INSTALLATION_DIR)/Library/StepTalk/Languages

-include GNUmakefile.preamble
include $(GNUSTEP_MAKEFILES)/bundle.make
-include GNUMakefile.postamble

