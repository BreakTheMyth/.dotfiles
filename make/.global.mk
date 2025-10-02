ifeq ($(wildcard Makefile),)

.PHONY: all clean debug

.DEFAULT_GOAL := all

DB     = gdb
CC     = gcc
CXX    = g++
CFLAGS = -Wall -Wextra -g -O0

SRCS_C   := $(wildcard *.c)
SRCS_CPP := $(wildcard *.cpp)
TARGET   := $(SRCS_C:.c=.out) $(SRCS_CPP:.cpp=.out)

all: $(TARGET)
	@echo -e "\nfile: "$<"\n----------------\e[36m"
	@./$<
	@echo -e "\n\e[0m----------------"

%.out: %.c
	$(CC) $< -o $@ $(CFLAGS)

%.out: %.cpp
	$(CXX) $< -o $@ $(CFLAGS)

debug: $(TARGET)
	$(DB) $<

clean:
	rm -rf $(TARGET)

endif
