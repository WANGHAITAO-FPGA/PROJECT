// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _VX300_SDAC_TOP_H_
#define _VX300_SDAC_TOP_H_  // guard

#include "verilated.h"

//==========

class VX300_SDAC_TOP__Syms;
class VX300_SDAC_TOP_VerilatedVcd;


//----------

VL_MODULE(VX300_SDAC_TOP) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(clk,0,0);
    VL_IN8(reset,0,0);
    VL_IN8(clk_80M,0,0);
    VL_IN8(intput_valid,0,0);
    VL_OUT8(intput_ready,0,0);
    VL_IN8(intput_payload_last,0,0);
    VL_OUT8(output_valid,0,0);
    VL_IN8(output_ready,0,0);
    VL_OUT8(output_payload_last,0,0);
    VL_IN8(AD7606_0_ad_busy,0,0);
    VL_IN8(AD7606_0_first_data,0,0);
    VL_OUT8(AD7606_0_ad_os,2,0);
    VL_OUT8(AD7606_0_ad_cs,0,0);
    VL_OUT8(AD7606_0_ad_rd,0,0);
    VL_OUT8(AD7606_0_ad_reset,0,0);
    VL_OUT8(AD7606_0_ad_convsta,0,0);
    VL_OUT8(AD7606_0_ad_convstb,0,0);
    VL_OUT8(AD7606_0_ad_range,0,0);
    VL_IN8(AD7606_1_ad_busy,0,0);
    VL_IN8(AD7606_1_first_data,0,0);
    VL_OUT8(AD7606_1_ad_os,2,0);
    VL_OUT8(AD7606_1_ad_cs,0,0);
    VL_OUT8(AD7606_1_ad_rd,0,0);
    VL_OUT8(AD7606_1_ad_reset,0,0);
    VL_OUT8(AD7606_1_ad_convsta,0,0);
    VL_OUT8(AD7606_1_ad_convstb,0,0);
    VL_OUT8(AD7606_1_ad_range,0,0);
    VL_IN8(AD7606_2_ad_busy,0,0);
    VL_IN8(AD7606_2_first_data,0,0);
    VL_OUT8(AD7606_2_ad_os,2,0);
    VL_OUT8(AD7606_2_ad_cs,0,0);
    VL_OUT8(AD7606_2_ad_rd,0,0);
    VL_OUT8(AD7606_2_ad_reset,0,0);
    VL_OUT8(AD7606_2_ad_convsta,0,0);
    VL_OUT8(AD7606_2_ad_convstb,0,0);
    VL_OUT8(AD7606_2_ad_range,0,0);
    VL_IN8(tick,0,0);
    VL_IN16(AD7606_0_ad_data,15,0);
    VL_IN16(AD7606_1_ad_data,15,0);
    VL_IN16(AD7606_2_ad_data,15,0);
    VL_IN(intput_payload_fragment,31,0);
    VL_OUT(output_payload_fragment,31,0);
    VL_IN(slaveid,31,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    // Anonymous structures to workaround compiler member-count bugs
    struct {
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0__DOT__clk_out;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1__DOT__clk_out;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2__DOT__clk_out;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacRxPreamble_output_valid;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0_ad_cs;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0_ad_rd;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0_ad_reset;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0_ad_convsta;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0_ad_convstb;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0_ad_data_valid_o;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1_ad_cs;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1_ad_rd;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1_ad_reset;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1_ad_convsta;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1_ad_convstb;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1_ad_data_valid_o;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2_ad_cs;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2_ad_rd;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2_ad_reset;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2_ad_convsta;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2_ad_convstb;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2_ad_data_valid_o;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_tx_tick;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_tick_count_willIncrement;
        CData/*7:0*/ X300_SDAC_TOP__DOT__sdac_area_tick_count_valueNext;
        CData/*7:0*/ X300_SDAC_TOP__DOT__sdac_area_tick_count_value;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_tick_count_willOverflow;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacRxPreamble__DOT___zz_history_1_valid;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacRxPreamble__DOT___zz_history_1_ready;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacRxPreamble__DOT___zz_history_1_payload_last;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacRxPreamble__DOT__inFrame;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacRxPreamble__DOT__when_X300_SDAC_RX_l26;
        CData/*7:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacrxsimplebus__DOT__waddr_1;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacrxsimplebus__DOT__wenable_1;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacrxsimplebus__DOT__flag;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacrxsimplebus__DOT__fsm_wantStart;
        CData/*1:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacrxsimplebus__DOT__fsm_stateReg;
        CData/*1:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacrxsimplebus__DOT__fsm_stateNext;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacrxsimplebus__DOT__when_X300_SDAC_RX_l67;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacrxsimplebus__DOT__when_X300_SDAC_RX_l73;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__timer_1_io_clear;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__timer_1_io_full;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__streamfifo_1_io_pop_valid;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__RENABLE_1;
        CData/*7:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__RADDR_1;
        CData/*7:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__send_length;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__fsm_wantStart;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__RENABLE_1_regNext;
        CData/*1:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__fsm_stateReg;
        CData/*1:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__fsm_stateNext;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__when_X300_SDAC_TX_l54;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__timer_1__DOT__inhibitFull;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__streamfifo_1__DOT___zz_1;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__streamfifo_1__DOT__logic_pushPtr_willIncrement;
        CData/*5:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__streamfifo_1__DOT__logic_pushPtr_valueNext;
        CData/*5:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__streamfifo_1__DOT__logic_pushPtr_value;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__streamfifo_1__DOT__logic_popPtr_willIncrement;
        CData/*5:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__streamfifo_1__DOT__logic_popPtr_valueNext;
        CData/*5:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__streamfifo_1__DOT__logic_popPtr_value;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__streamfifo_1__DOT__logic_ptrMatch;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__streamfifo_1__DOT__logic_risingOccupancy;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__streamfifo_1__DOT__logic_pushing;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__streamfifo_1__DOT__logic_popping;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__streamfifo_1__DOT__logic_full;
    };
    struct {
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__streamfifo_1__DOT___zz_io_pop_valid;
        CData/*0:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacregif__DOT__busslave_readError;
        CData/*7:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0__DOT__i;
        CData/*7:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0__DOT__ad_state;
        CData/*3:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0__DOT__clk_dvidecnt;
        CData/*7:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1__DOT__i;
        CData/*7:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1__DOT__ad_state;
        CData/*3:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1__DOT__clk_dvidecnt;
        CData/*7:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2__DOT__i;
        CData/*7:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2__DOT__ad_state;
        CData/*3:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2__DOT__clk_dvidecnt;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0_ad_ch1_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0_ad_ch2_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0_ad_ch3_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0_ad_ch4_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0_ad_ch5_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0_ad_ch6_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0_ad_ch7_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0_ad_ch8_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1_ad_ch1_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1_ad_ch2_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1_ad_ch3_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1_ad_ch4_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1_ad_ch5_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1_ad_ch6_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1_ad_ch7_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1_ad_ch8_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2_ad_ch1_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2_ad_ch2_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2_ad_ch3_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2_ad_ch4_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2_ad_ch5_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2_ad_ch6_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2_ad_ch7_o;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2_ad_ch8_o;
        SData/*9:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0__DOT__cnt;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0__DOT__cnt5us;
        SData/*9:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1__DOT__cnt;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1__DOT__cnt5us;
        SData/*9:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2__DOT__cnt;
        SData/*15:0*/ X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2__DOT__cnt5us;
        IData/*31:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacRxPreamble__DOT___zz_history_1_payload_fragment;
        IData/*31:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacrxsimplebus__DOT__wdata_1;
        IData/*31:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__RDATA_1;
        WData/*79:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__fsm_stateReg_string[3];
        WData/*79:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__fsm_stateNext_string[3];
        IData/*31:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__timer_1__DOT___zz_counter;
        IData/*31:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__timer_1__DOT__counter;
        IData/*31:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__streamfifo_1__DOT___zz_logic_ram_port0;
        IData/*31:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacregif__DOT__busslave_readData;
        IData/*31:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacregif__DOT__Reserve1;
        IData/*31:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacregif__DOT__Reserve2;
        IData/*31:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacregif__DOT__Reserve3;
        IData/*31:0*/ X300_SDAC_TOP__DOT__sdac_area_sdacregif__DOT__Reserve4;
        IData/*31:0*/ X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__streamfifo_1__DOT__logic_ram[64];
    };
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    CData/*1:0*/ __Vtableidx1;
    CData/*1:0*/ __Vtableidx2;
    CData/*4:0*/ __Vtableidx3;
    CData/*7:0*/ __Vdly__X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__RADDR_1;
    CData/*7:0*/ __Vdly__X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__send_length;
    CData/*7:0*/ __Vdly__X300_SDAC_TOP__DOT__sdac_area_sdacrxsimplebus__DOT__waddr_1;
    CData/*7:0*/ __Vdly__X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0__DOT__i;
    CData/*7:0*/ __Vdly__X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0__DOT__ad_state;
    CData/*7:0*/ __Vdly__X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1__DOT__i;
    CData/*7:0*/ __Vdly__X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1__DOT__ad_state;
    CData/*7:0*/ __Vdly__X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2__DOT__i;
    CData/*7:0*/ __Vdly__X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2__DOT__ad_state;
    CData/*0:0*/ __VinpClk__TOP__X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2__DOT__clk_out;
    CData/*0:0*/ __VinpClk__TOP__X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1__DOT__clk_out;
    CData/*0:0*/ __VinpClk__TOP__X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0__DOT__clk_out;
    CData/*0:0*/ __Vclklast__TOP__clk;
    CData/*0:0*/ __Vclklast__TOP__reset;
    CData/*0:0*/ __Vclklast__TOP__clk_80M;
    CData/*0:0*/ __Vclklast__TOP____VinpClk__TOP__X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2__DOT__clk_out;
    CData/*0:0*/ __Vclklast__TOP____VinpClk__TOP__X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1__DOT__clk_out;
    CData/*0:0*/ __Vclklast__TOP____VinpClk__TOP__X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0__DOT__clk_out;
    CData/*0:0*/ __Vchglast__TOP__X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0__DOT__clk_out;
    CData/*0:0*/ __Vchglast__TOP__X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1__DOT__clk_out;
    CData/*0:0*/ __Vchglast__TOP__X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2__DOT__clk_out;
    SData/*15:0*/ __Vdly__X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_0__DOT__cnt5us;
    SData/*15:0*/ __Vdly__X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_1__DOT__cnt5us;
    SData/*15:0*/ __Vdly__X300_SDAC_TOP__DOT__sdac_area_ad_area_ad7606_2__DOT__cnt5us;
    IData/*31:0*/ __Vdly__X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__timer_1__DOT__counter;
    IData/*31:0*/ __Vm_traceActivity;
    static WData/*79:0*/ __Vtable1_X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__fsm_stateReg_string[4][3];
    static WData/*79:0*/ __Vtable2_X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__fsm_stateNext_string[4][3];
    static CData/*1:0*/ __Vtable3_X300_SDAC_TOP__DOT__sdac_area_sdactxsimplebus__DOT__fsm_stateNext[32];
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    VX300_SDAC_TOP__Syms* __VlSymsp;  // Symbol table
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(VX300_SDAC_TOP);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible with respect to DPI scope names.
    VX300_SDAC_TOP(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~VX300_SDAC_TOP();
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
    static void _eval_initial_loop(VX300_SDAC_TOP__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(VX300_SDAC_TOP__Syms* symsp, bool first);
  private:
    static QData _change_request(VX300_SDAC_TOP__Syms* __restrict vlSymsp);
    static QData _change_request_1(VX300_SDAC_TOP__Syms* __restrict vlSymsp);
  public:
    static void _combo__TOP__10(VX300_SDAC_TOP__Syms* __restrict vlSymsp);
    static void _combo__TOP__21(VX300_SDAC_TOP__Syms* __restrict vlSymsp);
    static void _combo__TOP__3(VX300_SDAC_TOP__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset() VL_ATTR_COLD;
  public:
    static void _eval(VX300_SDAC_TOP__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif  // VL_DEBUG
  public:
    static void _eval_initial(VX300_SDAC_TOP__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _eval_settle(VX300_SDAC_TOP__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _sequent__TOP__12(VX300_SDAC_TOP__Syms* __restrict vlSymsp);
    static void _sequent__TOP__13(VX300_SDAC_TOP__Syms* __restrict vlSymsp);
    static void _sequent__TOP__15(VX300_SDAC_TOP__Syms* __restrict vlSymsp);
    static void _sequent__TOP__16(VX300_SDAC_TOP__Syms* __restrict vlSymsp);
    static void _sequent__TOP__18(VX300_SDAC_TOP__Syms* __restrict vlSymsp);
    static void _sequent__TOP__19(VX300_SDAC_TOP__Syms* __restrict vlSymsp);
    static void _sequent__TOP__2(VX300_SDAC_TOP__Syms* __restrict vlSymsp);
    static void _sequent__TOP__20(VX300_SDAC_TOP__Syms* __restrict vlSymsp);
    static void _sequent__TOP__5(VX300_SDAC_TOP__Syms* __restrict vlSymsp);
    static void _sequent__TOP__6(VX300_SDAC_TOP__Syms* __restrict vlSymsp);
    static void _sequent__TOP__7(VX300_SDAC_TOP__Syms* __restrict vlSymsp);
    static void _sequent__TOP__8(VX300_SDAC_TOP__Syms* __restrict vlSymsp);
    static void _sequent__TOP__9(VX300_SDAC_TOP__Syms* __restrict vlSymsp);
    static void _settle__TOP__1(VX300_SDAC_TOP__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void traceChgThis(VX300_SDAC_TOP__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__10(VX300_SDAC_TOP__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__11(VX300_SDAC_TOP__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__12(VX300_SDAC_TOP__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__13(VX300_SDAC_TOP__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__14(VX300_SDAC_TOP__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__15(VX300_SDAC_TOP__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__2(VX300_SDAC_TOP__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__3(VX300_SDAC_TOP__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__4(VX300_SDAC_TOP__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__5(VX300_SDAC_TOP__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__6(VX300_SDAC_TOP__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__7(VX300_SDAC_TOP__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__8(VX300_SDAC_TOP__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__9(VX300_SDAC_TOP__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceFullThis(VX300_SDAC_TOP__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceFullThis__1(VX300_SDAC_TOP__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceFullThis__16(VX300_SDAC_TOP__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInitThis(VX300_SDAC_TOP__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInitThis__1(VX300_SDAC_TOP__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
