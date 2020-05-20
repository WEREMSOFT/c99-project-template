# Define some usefull variables

# Vars for binary build
CC := gcc
SRC_D := src/
BLD_D := bin/
OBJ_D := obj/
ASST_D := assets/
LIBS_D := libs/
HTML_D := html/
INCLUDE_D := -I$(LIBS_D)include/
STATIC_LIBS_D := -L$(LIBS_D)static/
CFLAGS := -O0 -Wpedantic -g -Wall -std=c99
DEBUGGER := kdbg # Other options: cgdb gdb

# Vars for emscripten build
RAYLIB_PATH := /Users/pabloweremczuk/Documents/Proyectos/c/raylib
EMSC_CFLAGS := -O2 -s -Wall -std=c99 -D_DEFAULT_SOURCE -Wno-missing-braces -s DISABLE_DEPRECATED_FIND_EVENT_TARGET_BEHAVIOR=0 -g4 -s USE_GLFW=3 -s TOTAL_MEMORY=67108864 -v -D PLATFORM_WEB
EMSC_CC := emcc
EMSC_STATIC_LIBS_D :=
# EMSC_STATIC_LIBS_D := $(LIBS_D)static/libraylib.bc

# Call to compilers / linkers
CC_COMMAND := $(CC) $(CFLAGS) $(INCLUDE_D) $(STATIC_LIBS_D)
EMSC_CC_COMMAND := $(EMSC_CC) $(EMSC_CFLAGS) $(INCLUDE_D) $(STATIC_LIBS_D)
