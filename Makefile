################################################################################
#                                   LICENSE                                    #
################################################################################
#   This file is part of asymptote_figures.                                    #
#                                                                              #
#   asymptote_figures is free software: you can redistribute it and/or modify  #
#   it under the terms of the GNU General Public License as published by       #
#   the Free Software Foundation, either version 3 of the License, or          #
#   (at your option) any later version.                                        #
#                                                                              #
#   asymptote_figures is distributed in the hope that it will be useful,       #
#   but WITHOUT ANY WARRANTY; without even the implied warranty of             #
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              #
#   GNU General Public License for more details.                               #
#                                                                              #
#   You should have received a copy of the GNU General Public License          #
#   along with asymptote_figures. If not, see <https://www.gnu.org/licenses/>. #
################################################################################
#   Author:     Ryan Maguire                                                   #
#   Date:       August 31, 2021                                                #
################################################################################
OUT := done.txt
TOOLS_DIR := ~/.asy
BUILD_DIR := build
TWO_SRCS := $(shell find 2d/ -name "*.asy")
THREE_SRCS := $(shell find 3d/ -name "*.asy")
TOOLS_SRCS := $(notdir $(shell find tools/ -name "*.asy"))
TWO_OBJS := $(TWO_SRCS:%.asy=$(BUILD_DIR)/%.pdf)
THREE_OBJS := $(THREE_SRCS:%.asy=$(BUILD_DIR)/%.pdf)
TOOLS_OBJS := $(TOOLS_SRCS:%=$(TOOLS_DIR)/%)

.PHONY: clean all

all: $(TOOLS_OBJS) $(OUT)

$(OUT): $(ASY_DIR) $(TWO_OBJS) # $(THREE_OBJS)
	touch done.txt

$(BUILD_DIR)/%.pdf: %.asy
	@mkdir -p $(@D)
	asy -f "pdf" $< -o $@

$(TOOLS_DIR)/%.asy: tools/%.asy
	@mkdir -p $(TOOLS_DIR)
	cp $< $@

clean:
	rm -rf $(BUILD_DIR)
