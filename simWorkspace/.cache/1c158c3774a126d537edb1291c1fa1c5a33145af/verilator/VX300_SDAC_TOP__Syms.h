// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef _VX300_SDAC_TOP__SYMS_H_
#define _VX300_SDAC_TOP__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODULE CLASSES
#include "VX300_SDAC_TOP.h"

// SYMS CLASS
class VX300_SDAC_TOP__Syms : public VerilatedSyms {
  public:
    
    // LOCAL STATE
    const char* __Vm_namep;
    bool __Vm_activity;  ///< Used by trace routines to determine change occurred
    bool __Vm_didInit;
    
    // SUBCELL STATE
    VX300_SDAC_TOP*                TOPp;
    
    // CREATORS
    VX300_SDAC_TOP__Syms(VX300_SDAC_TOP* topp, const char* namep);
    ~VX300_SDAC_TOP__Syms() {}
    
    // METHODS
    inline const char* name() { return __Vm_namep; }
    inline bool getClearActivity() { bool r=__Vm_activity; __Vm_activity=false; return r; }
    
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
