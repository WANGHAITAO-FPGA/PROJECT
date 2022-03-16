// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _VFIBERTXBUFFER_H_
#define _VFIBERTXBUFFER_H_  // guard

#include "verilated.h"

//==========

class VFiberTxBuffer__Syms;
class VFiberTxBuffer_VerilatedVcd;


//----------

VL_MODULE(VFiberTxBuffer) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(pushclk_clk,0,0);
    VL_IN8(pushclk_reset,0,0);
    VL_IN8(popclk_clk,0,0);
    VL_IN8(popclk_reset,0,0);
    VL_IN8(io_push_stream_valid,0,0);
    VL_OUT8(io_push_stream_ready,0,0);
    VL_IN8(io_push_stream_payload_last,0,0);
    VL_IN8(io_push_stream_payload_fragment,7,0);
    VL_OUT8(io_pop_stream_valid,0,0);
    VL_IN8(io_pop_stream_ready,0,0);
    VL_OUT8(io_pop_last,0,0);
    VL_OUT(io_pop_stream_payload,31,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    CData/*0:0*/ FiberTxBuffer__DOT__popToPush_io_input_ready;
    CData/*0:0*/ FiberTxBuffer__DOT__pushToPop_io_input_ready;
    CData/*0:0*/ FiberTxBuffer__DOT___zz_1;
    CData/*6:0*/ FiberTxBuffer__DOT__push_currentPtr;
    CData/*6:0*/ FiberTxBuffer__DOT__push_popPtr;
    CData/*6:0*/ FiberTxBuffer__DOT__push_length;
    CData/*1:0*/ FiberTxBuffer__DOT__push_state;
    CData/*0:0*/ FiberTxBuffer__DOT__push_port_valid;
    CData/*5:0*/ FiberTxBuffer__DOT__push_port_payload_address;
    CData/*0:0*/ FiberTxBuffer__DOT__push_drop;
    CData/*0:0*/ FiberTxBuffer__DOT__push_doWrite;
    CData/*0:0*/ FiberTxBuffer__DOT__io_push_stream_fire;
    CData/*0:0*/ FiberTxBuffer__DOT__push_full;
    CData/*0:0*/ FiberTxBuffer__DOT__push_cleanup;
    CData/*0:0*/ FiberTxBuffer__DOT__push_commit;
    CData/*0:0*/ FiberTxBuffer__DOT__when_FiberTxBuffer_l86;
    CData/*6:0*/ FiberTxBuffer__DOT__pop_currentPtr;
    CData/*6:0*/ FiberTxBuffer__DOT__pop_pushPtr;
    CData/*0:0*/ FiberTxBuffer__DOT__pop_cmd_valid;
    CData/*0:0*/ FiberTxBuffer__DOT__pop_cmd_ready;
    CData/*0:0*/ FiberTxBuffer__DOT___zz_io_pop_stream_valid_1;
    CData/*0:0*/ FiberTxBuffer__DOT__pop_cleanup;
    CData/*0:0*/ FiberTxBuffer__DOT__popToPush__DOT__pushArea_target;
    CData/*6:0*/ FiberTxBuffer__DOT__popToPush__DOT__pushArea_data;
    CData/*0:0*/ FiberTxBuffer__DOT__popToPush__DOT__popArea_stream_valid;
    CData/*0:0*/ FiberTxBuffer__DOT__popToPush__DOT__popArea_hit;
    CData/*0:0*/ FiberTxBuffer__DOT__popToPush__DOT__outHitSignal_buffercc__DOT__buffers_0;
    CData/*0:0*/ FiberTxBuffer__DOT__popToPush__DOT__outHitSignal_buffercc__DOT__buffers_1;
    CData/*0:0*/ FiberTxBuffer__DOT__popToPush__DOT__pushArea_target_buffercc__DOT__buffers_0;
    CData/*0:0*/ FiberTxBuffer__DOT__popToPush__DOT__pushArea_target_buffercc__DOT__buffers_1;
    CData/*0:0*/ FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target;
    CData/*6:0*/ FiberTxBuffer__DOT__pushToPop__DOT__pushArea_data;
    CData/*0:0*/ FiberTxBuffer__DOT__pushToPop__DOT__popArea_stream_valid;
    CData/*0:0*/ FiberTxBuffer__DOT__pushToPop__DOT__popArea_hit;
    CData/*0:0*/ FiberTxBuffer__DOT__pushToPop__DOT__outHitSignal_buffercc__DOT__buffers_0;
    CData/*0:0*/ FiberTxBuffer__DOT__pushToPop__DOT__outHitSignal_buffercc__DOT__buffers_1;
    CData/*0:0*/ FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target_buffercc__DOT__buffers_0;
    CData/*0:0*/ FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target_buffercc__DOT__buffers_1;
    IData/*31:0*/ FiberTxBuffer__DOT___zz_ram_port1;
    IData/*23:0*/ FiberTxBuffer__DOT__push_buffer;
    IData/*31:0*/ FiberTxBuffer__DOT__push_port_payload_data;
    IData/*31:0*/ FiberTxBuffer__DOT__ram[64];
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    CData/*5:0*/ FiberTxBuffer__DOT____Vxrand1;
    CData/*1:0*/ __Vdly__FiberTxBuffer__DOT__push_state;
    CData/*0:0*/ __Vdly__FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target;
    CData/*6:0*/ __Vdly__FiberTxBuffer__DOT__pop_currentPtr;
    CData/*0:0*/ __Vdly__FiberTxBuffer__DOT__popToPush__DOT__pushArea_target;
    CData/*0:0*/ __Vclklast__TOP__popclk_clk;
    CData/*0:0*/ __Vclklast__TOP__popclk_reset;
    CData/*0:0*/ __Vclklast__TOP__pushclk_clk;
    CData/*0:0*/ __Vclklast__TOP__pushclk_reset;
    IData/*31:0*/ FiberTxBuffer__DOT____Vxrand2;
    IData/*31:0*/ __Vm_traceActivity;
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    VFiberTxBuffer__Syms* __VlSymsp;  // Symbol table
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(VFiberTxBuffer);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible with respect to DPI scope names.
    VFiberTxBuffer(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~VFiberTxBuffer();
    /// Trace signals in the model; called by application code
    void trace(VerilatedVcdC* tfp, int levels, int options = 0);
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval() { eval_step(); }
    /// Evaluate when calling multiple units/models per time step.
    void eval_step();
    /// Evaluate at end of a timestep for tracing, when using eval_step().
    /// Application must call after all eval() and before time changes.
    void eval_end_step() {}
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(VFiberTxBuffer__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(VFiberTxBuffer__Syms* symsp, bool first);
  private:
    static QData _change_request(VFiberTxBuffer__Syms* __restrict vlSymsp);
    static QData _change_request_1(VFiberTxBuffer__Syms* __restrict vlSymsp);
  public:
    static void _combo__TOP__11(VFiberTxBuffer__Syms* __restrict vlSymsp);
    static void _combo__TOP__9(VFiberTxBuffer__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset() VL_ATTR_COLD;
  public:
    static void _eval(VFiberTxBuffer__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif  // VL_DEBUG
  public:
    static void _eval_initial(VFiberTxBuffer__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _eval_settle(VFiberTxBuffer__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _initial__TOP__1(VFiberTxBuffer__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _sequent__TOP__10(VFiberTxBuffer__Syms* __restrict vlSymsp);
    static void _sequent__TOP__2(VFiberTxBuffer__Syms* __restrict vlSymsp);
    static void _sequent__TOP__3(VFiberTxBuffer__Syms* __restrict vlSymsp);
    static void _sequent__TOP__4(VFiberTxBuffer__Syms* __restrict vlSymsp);
    static void _sequent__TOP__5(VFiberTxBuffer__Syms* __restrict vlSymsp);
    static void _sequent__TOP__6(VFiberTxBuffer__Syms* __restrict vlSymsp);
    static void _sequent__TOP__8(VFiberTxBuffer__Syms* __restrict vlSymsp);
    static void _settle__TOP__7(VFiberTxBuffer__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void traceChgThis(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__10(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__11(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__12(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__2(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__3(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__4(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__5(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__6(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__7(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__8(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__9(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceFullThis(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceFullThis__1(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInitThis(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInitThis__1(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
