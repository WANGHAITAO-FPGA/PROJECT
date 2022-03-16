// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VGTP_TEST__Syms.h"


//======================

void VGTP_TEST::traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    VGTP_TEST* t = (VGTP_TEST*)userthis;
    VGTP_TEST__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (vlSymsp->getClearActivity()) {
        t->traceChgThis(vlSymsp, vcdp, code);
    }
}

//======================


void VGTP_TEST::traceChgThis(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        if (VL_UNLIKELY((1U & ((vlTOPp->__Vm_traceActivity 
                                | (vlTOPp->__Vm_traceActivity 
                                   >> 1U)) | (vlTOPp->__Vm_traceActivity 
                                              >> 5U))))) {
            vlTOPp->traceChgThis__2(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
                               | (vlTOPp->__Vm_traceActivity 
                                  >> 2U))))) {
            vlTOPp->traceChgThis__3(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & ((vlTOPp->__Vm_traceActivity 
                                | (vlTOPp->__Vm_traceActivity 
                                   >> 2U)) | (vlTOPp->__Vm_traceActivity 
                                              >> 4U))))) {
            vlTOPp->traceChgThis__4(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
                               | (vlTOPp->__Vm_traceActivity 
                                  >> 4U))))) {
            vlTOPp->traceChgThis__5(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
                               | (vlTOPp->__Vm_traceActivity 
                                  >> 5U))))) {
            vlTOPp->traceChgThis__6(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((2U & vlTOPp->__Vm_traceActivity))) {
            vlTOPp->traceChgThis__7(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((4U & vlTOPp->__Vm_traceActivity))) {
            vlTOPp->traceChgThis__8(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((8U & vlTOPp->__Vm_traceActivity))) {
            vlTOPp->traceChgThis__9(vlSymsp, vcdp, code);
        }
        vlTOPp->traceChgThis__10(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void VGTP_TEST::traceChgThis__2(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(c+1,(((((IData)(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full) 
                             | (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_1)) 
                            | (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_2)) 
                           | (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_3))));
    }
}

void VGTP_TEST::traceChgThis__3(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBus(c+9,(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tdata),32);
    }
}

void VGTP_TEST::traceChgThis__4(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBus(c+17,((0xffU & ((IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition)
                                      ? (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp)
                                      : ((IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp) 
                                         - (IData)(1U))))),8);
        vcdp->chgBus(c+25,((0x3fU & ((IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition)
                                      ? ((IData)(1U) 
                                         + (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_beat_cnt))
                                      : (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_beat_cnt)))),6);
    }
}

void VGTP_TEST::traceChgThis__5(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(c+33,(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tlast));
        vcdp->chgBit(c+41,(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tvalid));
        vcdp->chgBus(c+49,(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__next_state),9);
        vcdp->chgBit(c+57,(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition));
    }
}

void VGTP_TEST::traceChgThis__6(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(c+65,(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full));
    }
}

void VGTP_TEST::traceChgThis__7(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBus(c+73,(vlTOPp->GTP_TEST__DOT___zz_gtx_area_mem_port0),32);
        vcdp->chgBit(c+81,(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_1));
        vcdp->chgBit(c+89,(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_2));
        vcdp->chgBit(c+97,(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_3));
    }
}

void VGTP_TEST::traceChgThis__8(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBus(c+105,(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_crc_data),32);
        vcdp->chgBit(c+113,(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__inhibitFull));
        vcdp->chgBus(c+121,(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state),9);
        vcdp->chgBus(c+129,(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_beat_cnt),6);
        vcdp->chgBus(c+137,(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp),8);
    }
}

void VGTP_TEST::traceChgThis__9(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(c+145,((0x1f4U <= vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__counter)));
        vcdp->chgBus(c+153,(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__counter),32);
        vcdp->chgBit(c+161,((0x1f4U == vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__counter)));
    }
}

void VGTP_TEST::traceChgThis__10(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(c+169,(vlTOPp->log_rst_q));
        vcdp->chgBit(c+177,(vlTOPp->log_clk));
        vcdp->chgBus(c+185,(vlTOPp->s_axi_tx_tdata),32);
        vcdp->chgBit(c+193,(vlTOPp->s_axi_tx_tlast));
        vcdp->chgBit(c+201,(vlTOPp->s_axi_tx_tvalid));
        vcdp->chgBit(c+209,(vlTOPp->s_axi_tx_tready));
        vcdp->chgBit(c+217,((1U & (~ ((0U != (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state)) 
                                      & (IData)(vlTOPp->s_axi_tx_tready))))));
    }
}
