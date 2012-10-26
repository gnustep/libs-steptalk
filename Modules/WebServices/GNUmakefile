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

include $(GNUSTEP_MAKEFILES)/common.make

BUNDLE_NAME = WebServices
    
WebServices_OBJC_FILES = \
        STWebServicesModule.m \
        WebServicesConstants.m
        
WebServices_PRINCIPAL_CLASS = STWebServicesModule

WebServices_RESOURCE_FILES = ScriptingInfo.plist
        
BUNDLE_INSTALL_DIR:=$(GNUSTEP_LIBRARY)/StepTalk/Modules

ADDITIONAL_OBJCFLAGS = -Wall -Wno-import

BUNDLE_LIBS += -lStepTalk -lWebServices
ADDITIONAL_INCLUDE_DIRS += -I../../Frameworks/
ADDITIONAL_LIB_DIRS += -L../../Frameworks/StepTalk/StepTalk.framework/Versions/Current/$(GNUSTEP_TARGET_LDIR)

-include GNUmakefile.preamble
include $(GNUSTEP_MAKEFILES)/bundle.make
-include GNUMakefile.postamble


WebServicesConstants.m : WebServicesConstants.list

%.m : %.list header.m footer.m
	    @( echo Creating $@ ...; \
	        cat header.m  | sed "s/@@NAME@@/`basename $< .list`/g" > $@;  \
	        cat $< | awk -f create_constants.awk >> $@;\
	        cat footer.m >> $@; )

