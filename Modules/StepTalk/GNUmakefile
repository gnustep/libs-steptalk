#
#  StepTalk module
#
#  Copyright (C)2002 Stefan Urbanek
#
#  This file is part of the StepTalk.
#
#  This library is free software; you can redistribute it and/or
#  modify it under the terms of the GNU Library General Public
#  License as published by the Free Software Foundation; either
#  version 2 of the License, or (at your option) any later version.
#
#  This library is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
#  Library General Public License for more details.
#
#  You should have received a copy of the GNU Library General Public
#  License along with this library; if not, write to the Free
#  Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02111, USA.
#

GNUSTEP_MAKEFILES = $(GNUSTEP_SYSTEM_ROOT)/Makefiles

include $(GNUSTEP_MAKEFILES)/common.make

BUNDLE_NAME = StepTalk
    
StepTalk_OBJC_FILES = \
        StepTalkModule.m 

StepTalk_PRINCIPAL_CLASS = StepTalkModule

StepTalk_RESOURCE_FILES = ScriptingInfo.plist        

StepTalk_BUNDLE_LIBS += -lStepTalk
ADDITIONAL_INCLUDE_DIRS += -I../../Source/Headers
ADDITIONAL_LIB_DIRS += -L../../Source/$(GNUSTEP_OBJ_DIR)
ADDITIONAL_OBJCFLAGS = -Wall -Wno-import

BUNDLE_INSTALL_DIR:=$(GNUSTEP_INSTALLATION_DIR)/Library/StepTalk/Modules

-include GNUmakefile.preamble
include $(GNUSTEP_MAKEFILES)/bundle.make
-include GNUMakefile.postamble
