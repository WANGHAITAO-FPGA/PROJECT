# Verilated -*- Makefile -*-
# DESCRIPTION: Verilator output: Makefile for building Verilated archive or executable
#
# Execute this makefile from the object directory:
#    make -f VNoise_Filter.mk

default: VNoise_Filter

### Constants...
# Perl executable (from $PERL)
PERL = perl
# Path to Verilator kit (from $VERILATOR_ROOT)
VERILATOR_ROOT = /mingw64/share/verilator
# SystemC include directory with systemc.h (from $SYSTEMC_INCLUDE)
SYSTEMC_INCLUDE ?= 
# SystemC library directory with libsystemc.a (from $SYSTEMC_LIBDIR)
SYSTEMC_LIBDIR ?= 

### Switches...
# SystemC output mode?  0/1 (from --sc)
VM_SC = 0
# Legacy or SystemC output mode?  0/1 (from --sc)
VM_SP_OR_SC = $(VM_SC)
# Deprecated
VM_PCLI = 1
# Deprecated: SystemC architecture to find link library path (from $SYSTEMC_ARCH)
VM_SC_TARGET_ARCH = mingw32

### Vars...
# Design prefix (from --prefix)
VM_PREFIX = VNoise_Filter
# Module prefix (from --prefix)
VM_MODPREFIX = VNoise_Filter
# User CFLAGS (from -CFLAGS on Verilator command line)
VM_USER_CFLAGS = \
	-fPIC \
	-m64 \
	-shared \
	-Wno-attributes \
	-IjniIncludes \
	-IjniIncludes/win32 \
	-fvisibility=hidden \
	-std=c++11 \
	-O0 \
	-DTRACE \

# User LDLIBS (from -LDFLAGS on Verilator command line)
VM_USER_LDLIBS = \
	-fPIC \
	-m64 \
	-shared \
	-Wno-attributes \
	-fvisibility=hidden \
	-std=c++11 \

# User .cpp files (from .cpp's on Verilator command line)
VM_USER_CLASSES = \
	VNoise_Filter__spinalWrapper \

# User .cpp directories (from .cpp's on Verilator command line)
VM_USER_DIR = \
	verilator \


### Default rules...
# Include list of all generated classes
include VNoise_Filter_classes.mk
# Include global rules
include $(VERILATOR_ROOT)/include/verilated.mk

### Executable rules... (from --exe)
VPATH += $(VM_USER_DIR)

VNoise_Filter__spinalWrapper.o: verilator/VNoise_Filter__spinalWrapper.cpp
	$(OBJCACHE) $(CXX) $(CXXFLAGS) $(CPPFLAGS) $(OPT_FAST) -c -o $@ $<

### Link rules... (from --exe)
VNoise_Filter: $(VK_USER_OBJS) $(VK_GLOBAL_OBJS) $(VM_PREFIX)__ALL.a
	$(LINK) $(LDFLAGS) $^ $(LOADLIBES) $(LDLIBS) -o $@ $(LIBS) $(SC_LIBS)


# Verilated -*- Makefile -*-
