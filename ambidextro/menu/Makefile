CC = gcc
CFLAGS = -Wall -Wextra -g `sdl2-config --cflags`
LDFLAGS = `sdl2-config --libs` -lSDL2_ttf

SRC = launch_menu.c
ARCH := $(shell uname -m)
TARGET = launch_menu.$(ARCH)

ifeq ($(wildcard $(SRC)),)
$(error Source file '$(SRC)' not found!)
endif

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC) $(LDFLAGS)
