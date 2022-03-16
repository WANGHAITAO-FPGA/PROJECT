// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _VGTP_TEST_H_
#define _VGTP_TEST_H_  // guard

#include "verilated_heavy.h"

//==========

class VGTP_TEST__Syms;
class VGTP_TEST_VerilatedVcd;


//----------

VL_MODULE(VGTP_TEST) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(log_rst_q,0,0);
    VL_IN8(log_clk,0,0);
    VL_OUT8(s_axi_tx_tlast,0,0);
    VL_OUT8(s_axi_tx_tvalid,0,0);
    VL_IN8(s_axi_tx_tready,0,0);
    VL_OUT(s_axi_tx_tdata,31,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    CData/*0:0*/ GTP_TEST__DOT__gtx_area_timer_B_io_clear;
    CData/*0:0*/ GTP_TEST__DOT__gtx_area_timer_B_io_full;
    CData/*0:0*/ GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tlast;
    CData/*0:0*/ GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tvalid;
    CData/*0:0*/ GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_1;
    CData/*0:0*/ GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_2;
    CData/*0:0*/ GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_3;
    CData/*0:0*/ GTP_TEST__DOT__gtx_area_timer_B__DOT__inhibitFull;
    CData/*0:0*/ GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition;
    CData/*5:0*/ GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_beat_cnt;
    CData/*7:0*/ GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp;
    SData/*8:0*/ GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state;
    SData/*8:0*/ GTP_TEST__DOT__gtx_area_gtxtest__DOT__next_state;
    IData/*31:0*/ GTP_TEST__DOT___zz_gtx_area_mem_port0;
    IData/*31:0*/ GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tdata;
    IData/*31:0*/ GTP_TEST__DOT__gtx_area_gtxtest_crc_data;
    IData/*31:0*/ GTP_TEST__DOT__gtx_area_timer_B__DOT___zz_counter;
    IData/*31:0*/ GTP_TEST__DOT__gtx_area_timer_B__DOT__counter;
    IData/*31:0*/ GTP_TEST__DOT__gtx_area_mem[256];
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    CData/*5:0*/ __Vdly__GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_beat_cnt;
    CData/*7:0*/ __Vdly__GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp;
    CData/*0:0*/ __Vclklast__TOP__log_clk;
    CData/*0:0*/ __Vclklast__TOP__log_rst_q;
    IData/*31:0*/ __Vdly__GTP_TEST__DOT__gtx_area_timer_B__DOT__counter;
    IData/*31:0*/ __Vm_traceActivity;
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    VGTP_TEST__Syms* __VlSymsp;  // Symbol table
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(VGTP_TEST);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible with respect to DPI scope names.
    VGTP_TEST(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~VGTP_TEST();
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
    static void _eval_initial_loop(VGTP_TEST__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(VGTP_TEST__Syms* symsp, bool first);
  private:
    static QData _change_request(VGTP_TEST__Syms* __restrict vlSymsp);
    static QData _change_request_1(VGTP_TEST__Syms* __restrict vlSymsp);
  public:
    static void _combo__TOP__10(VGTP_TEST__Syms* __restrict vlSymsp);
    static void _combo__TOP__8(VGTP_TEST__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset() VL_ATTR_COLD;
  public:
    static void _eval(VGTP_TEST__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif  // VL_DEBUG
  public:
    static void _eval_initial(VGTP_TEST__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _eval_settle(VGTP_TEST__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _initial__TOP__5(VGTP_TEST__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _sequent__TOP__1(VGTP_TEST__Syms* __restrict vlSymsp);
    static void _sequent__TOP__3(VGTP_TEST__Syms* __restrict vlSymsp);
    static void _sequent__TOP__4(VGTP_TEST__Syms* __restrict vlSymsp);
    static void _sequent__TOP__7(VGTP_TEST__Syms* __restrict vlSymsp);
    static void _sequent__TOP__9(VGTP_TEST__Syms* __restrict vlSymsp);
    static void _settle__TOP__6(VGTP_TEST__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void traceChgThis(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__10(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__2(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__3(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__4(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__5(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__6(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__7(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__8(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__9(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceFullThis(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceFullThis__1(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInitThis(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInitThis__1(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
