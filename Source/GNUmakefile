#
#  GNUmakefile
#
#  Copyright (C) 2000 Stefan Urbanek
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
#  Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111 USA.

GNUSTEP_MAKEFILES = $(GNUSTEP_SYSTEM_ROOT)/Makefiles

include $(GNUSTEP_MAKEFILES)/common.make

include ../Version

LIBRARY_NAME = libStepTalk

libStepTalk_OBJC_FILES = \
    STBehaviourInfo.m \
    STClassInfo.m \
    STEnvironment.m \
    STExterns.m \
    STFunctions.m \
    STLanguage.m \
    STObjectReference.m  \
    STUndefinedObject.m  \
    NSInvocation+additions.m \
    STEnvironmentDescription.m \
    STObjCRuntime.m \
    STStructure.m \
    STEngine.m \
    STModule.m \
    STScripting.m \
    STSelector.m \
    NSNumber+additions.m

STEPTALK_HEADER_FILES = \
    STEnvironment.h \
    STExterns.h \
    STFunctions.h \
    STLanguage.h \
    STObjectReference.h  \
    STUndefinedObject.h   \
    NSInvocation+additions.h \
    STObjCRuntime.h \
    STEngine.h \
    STModule.h \
    STScripting.h  \
    STSelector.h

libStepTalk_HEADER_FILES = $(STEPTALK_HEADER_FILES) \
                            StepTalk.h
libStepTalk_HEADER_FILES_DIR = Headers/StepTalk

libStepTalk_HEADER_FILES_INSTALL_DIR = StepTalk

STEPTALK_LIBRARY_DIR = $(GNUSTEP_INSTALLATION_DIR)/Library/StepTalk
STEPTALK_ENVDEFS_DIR = $(STEPTALK_LIBRARY_DIR)/Environments

ADDITIONAL_INCLUDE_DIRS += -I./Headers

ADDITIONAL_CPPFLAGS += -pipe 

DOCUMENT_NAME = StepTalk

StepTalk_DOC_INSTALL_DIR = Developer

StepTalk_HEADER_FILES_DIR = $(HEADER_DIR)
StepTalk_AGSDOC_FILES = StepTalk.gsdoc $(STEPTALK_HEADER_FILES)
StepTalk_AGSDOC_FLAGS = \
        -HeaderDirectory Headers/StepTalk \
        -Up StepTalk \
        -Declared StepTalk


-include GNUmakefile.preamble

include $(GNUSTEP_MAKEFILES)/library.make

ifeq ($(doc),yes)
include $(GNUSTEP_MAKEFILES)/documentation.make
endif

-include GNUmakefile.postamble
