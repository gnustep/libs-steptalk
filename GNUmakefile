#
#  Main Makefile for the StepTalk
#  
#  Copyright (C) 2000 Stefan Urbanek
#
#  Written by:	Stefan Urbanek <urbane@decef.elf.stuba.sk>
#
#  This file is part of the StepTalk
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
#  Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111 USA
#

ifeq ($(GNUSTEP_MAKEFILES),)
 GNUSTEP_MAKEFILES := $(shell gnustep-config --variable=GNUSTEP_MAKEFILES 2>/dev/null)
  ifeq ($(GNUSTEP_MAKEFILES),)
    $(warning )
    $(warning Unable to obtain GNUSTEP_MAKEFILES setting from gnustep-config!)
    $(warning Perhaps gnustep-make is not properly installed,)
    $(warning so gnustep-config is not in your PATH.)
    $(warning )
    $(warning Your PATH is currently $(PATH))
    $(warning )
  endif
endif

ifeq ($(GNUSTEP_MAKEFILES),)
  $(error You need to set GNUSTEP_MAKEFILES before compiling!)
endif

include $(GNUSTEP_MAKEFILES)/common.make
include Version

PACKAGE_NAME = StepTalk
CVS_MODULE_NAME = StepTalk

APPSCRIPT=ApplicationScripting

ifeq ($(appkit),no)
    APPSCRIPT= 
endif

SUBPROJECTS = \
    Frameworks \
    Languages \
    Finders \
    Modules \
    Tools \
    $(APPSCRIPT)

-include GNUMakefile.preamble
include $(GNUSTEP_MAKEFILES)/aggregate.make
-include GNUMakefile.postamble

