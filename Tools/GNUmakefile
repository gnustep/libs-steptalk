#
#  StepTalk tools
#
#  Copyright (C) 2000,2001 Stefan Urbanek
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

TOOL_NAME = \
    stexec \
    stalk  \
    stupdate_languages

COMMON_OBJC_FILES = \
        STExecutor.m 
        
stexec_OBJC_FILES = \
        $(COMMON_OBJC_FILES) \
        $(DEBUG_FILES) \
        stexec.m

stalk_OBJC_FILES = \
        $(COMMON_OBJC_FILES) \
        stalk.m

stupdate_languages_OBJC_FILES =  \
        stupdate_languages.m
    
ADDITIONAL_INCLUDE_DIRS += -I../Source/Headers
ADDITIONAL_TOOL_LIBS += -lStepTalk
ADDITIONAL_LIB_DIRS += -L../Source/$(GNUSTEP_OBJ_DIR)

-include GNUmakefile.preamble
include $(GNUSTEP_MAKEFILES)/tool.make
-include GNUMakefile.postamble
