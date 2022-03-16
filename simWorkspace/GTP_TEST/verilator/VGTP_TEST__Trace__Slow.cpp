// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VGTP_TEST__Syms.h"


//======================

void VGTP_TEST::trace(VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addCallback(&VGTP_TEST::traceInit, &VGTP_TEST::traceFull, &VGTP_TEST::traceChg, this);
}
void VGTP_TEST::traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->open()
    VGTP_TEST* t = (VGTP_TEST*)userthis;
    VGTP_TEST__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (!Verilated::calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
                        "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vcdp->scopeEscape(' ');
    t->traceInitThis(vlSymsp, vcdp, code);
    vcdp->scopeEscape('.');
}
void VGTP_TEST::traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    VGTP_TEST* t = (VGTP_TEST*)userthis;
    VGTP_TEST__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    t->traceFullThis(vlSymsp, vcdp, code);
}

//======================


void VGTP_TEST::traceInitThis(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    vcdp->module(vlSymsp->name());  // Setup signal names
    // Body
    {
        vlTOPp->traceInitThis__1(vlSymsp, vcdp, code);
    }
}

void VGTP_TEST::traceFullThis(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vlTOPp->traceFullThis__1(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void VGTP_TEST::traceInitThis__1(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->declBit(c+169,"log_rst_q", false,-1);
        vcdp->declBit(c+177,"log_clk", false,-1);
        vcdp->declBus(c+185,"s_axi_tx_tdata", false,-1, 31,0);
        vcdp->declBit(c+193,"s_axi_tx_tlast", false,-1);
        vcdp->declBit(c+201,"s_axi_tx_tvalid", false,-1);
        vcdp->declBit(c+209,"s_axi_tx_tready", false,-1);
        vcdp->declBit(c+169,"GTP_TEST log_rst_q", false,-1);
        vcdp->declBit(c+177,"GTP_TEST log_clk", false,-1);
        vcdp->declBus(c+185,"GTP_TEST s_axi_tx_tdata", false,-1, 31,0);
        vcdp->declBit(c+193,"GTP_TEST s_axi_tx_tlast", false,-1);
        vcdp->declBit(c+201,"GTP_TEST s_axi_tx_tvalid", false,-1);
        vcdp->declBit(c+209,"GTP_TEST s_axi_tx_tready", false,-1);
        vcdp->declBit(c+145,"GTP_TEST gtx_area_timer_B_io_clear", false,-1);
        vcdp->declBit(c+1,"GTP_TEST gtx_area_gtxtest_tx_packet_req", false,-1);
        vcdp->declBus(c+73,"GTP_TEST gtx_area_gtxtest_tx_packet_data", false,-1, 31,0);
        vcdp->declBit(c+65,"GTP_TEST gtx_area_timer_B_io_full", false,-1);
        vcdp->declBus(c+153,"GTP_TEST gtx_area_timer_B_io_value", false,-1, 31,0);
        vcdp->declBus(c+9,"GTP_TEST gtx_area_gtxtest_s_axi_tx_tdata", false,-1, 31,0);
        vcdp->declBus(c+225,"GTP_TEST gtx_area_gtxtest_s_axi_tx_tkeep", false,-1, 3,0);
        vcdp->declBit(c+33,"GTP_TEST gtx_area_gtxtest_s_axi_tx_tlast", false,-1);
        vcdp->declBit(c+41,"GTP_TEST gtx_area_gtxtest_s_axi_tx_tvalid", false,-1);
        vcdp->declBus(c+105,"GTP_TEST gtx_area_gtxtest_crc_data", false,-1, 31,0);
        vcdp->declBus(c+17,"GTP_TEST gtx_area_gtxtest_tx_packet_addra", false,-1, 7,0);
        vcdp->declBit(c+217,"GTP_TEST gtx_area_gtxtest_tx_packet_rden", false,-1);
        vcdp->declBit(c+145,"GTP_TEST when_GTX_TEST_l45", false,-1);
        vcdp->declBit(c+81,"GTP_TEST gtx_area_timer_B_io_full_delay_1", false,-1);
        vcdp->declBit(c+81,"GTP_TEST gtx_area_timer_B_io_full_delay_1_1", false,-1);
        vcdp->declBit(c+89,"GTP_TEST gtx_area_timer_B_io_full_delay_2", false,-1);
        vcdp->declBit(c+81,"GTP_TEST gtx_area_timer_B_io_full_delay_1_2", false,-1);
        vcdp->declBit(c+89,"GTP_TEST gtx_area_timer_B_io_full_delay_2_1", false,-1);
        vcdp->declBit(c+97,"GTP_TEST gtx_area_timer_B_io_full_delay_3", false,-1);
        vcdp->declBit(c+233,"GTP_TEST gtx_area_timer_B io_tick", false,-1);
        vcdp->declBit(c+145,"GTP_TEST gtx_area_timer_B io_clear", false,-1);
        vcdp->declBus(c+241,"GTP_TEST gtx_area_timer_B io_limit", false,-1, 31,0);
        vcdp->declBit(c+65,"GTP_TEST gtx_area_timer_B io_full", false,-1);
        vcdp->declBus(c+153,"GTP_TEST gtx_area_timer_B io_value", false,-1, 31,0);
        vcdp->declBit(c+177,"GTP_TEST gtx_area_timer_B log_clk", false,-1);
        vcdp->declBit(c+169,"GTP_TEST gtx_area_timer_B log_rst_q", false,-1);
        vcdp->declBus(c+153,"GTP_TEST gtx_area_timer_B counter", false,-1, 31,0);
        vcdp->declBit(c+161,"GTP_TEST gtx_area_timer_B limitHit", false,-1);
        vcdp->declBit(c+113,"GTP_TEST gtx_area_timer_B inhibitFull", false,-1);
        vcdp->declBit(c+169,"GTP_TEST gtx_area_gtxtest log_rst_q", false,-1);
        vcdp->declBit(c+177,"GTP_TEST gtx_area_gtxtest log_clk", false,-1);
        vcdp->declBus(c+9,"GTP_TEST gtx_area_gtxtest s_axi_tx_tdata", false,-1, 31,0);
        vcdp->declBus(c+225,"GTP_TEST gtx_area_gtxtest s_axi_tx_tkeep", false,-1, 3,0);
        vcdp->declBit(c+33,"GTP_TEST gtx_area_gtxtest s_axi_tx_tlast", false,-1);
        vcdp->declBit(c+41,"GTP_TEST gtx_area_gtxtest s_axi_tx_tvalid", false,-1);
        vcdp->declBit(c+209,"GTP_TEST gtx_area_gtxtest s_axi_tx_tready", false,-1);
        vcdp->declBus(c+249,"GTP_TEST gtx_area_gtxtest tx_packet_gtxid", false,-1, 31,0);
        vcdp->declBus(c+257,"GTP_TEST gtx_area_gtxtest tx_packet_head", false,-1, 31,0);
        vcdp->declBit(c+1,"GTP_TEST gtx_area_gtxtest tx_packet_req", false,-1);
        vcdp->declBit(c+265,"GTP_TEST gtx_area_gtxtest tx_packet_trigger", false,-1);
        vcdp->declBus(c+105,"GTP_TEST gtx_area_gtxtest crc_data", false,-1, 31,0);
        vcdp->declBus(c+17,"GTP_TEST gtx_area_gtxtest tx_packet_addra", false,-1, 7,0);
        vcdp->declBus(c+73,"GTP_TEST gtx_area_gtxtest tx_packet_data", false,-1, 31,0);
        vcdp->declBit(c+217,"GTP_TEST gtx_area_gtxtest tx_packet_rden", false,-1);
        vcdp->declBus(c+273,"GTP_TEST gtx_area_gtxtest IDLE", false,-1, 8,0);
        vcdp->declBus(c+281,"GTP_TEST gtx_area_gtxtest TX_HEAD", false,-1, 8,0);
        vcdp->declBus(c+289,"GTP_TEST gtx_area_gtxtest TX_GTXID", false,-1, 8,0);
        vcdp->declBus(c+297,"GTP_TEST gtx_area_gtxtest TX_LENGTH", false,-1, 8,0);
        vcdp->declBus(c+305,"GTP_TEST gtx_area_gtxtest TX_DATA", false,-1, 8,0);
        vcdp->declBus(c+313,"GTP_TEST gtx_area_gtxtest TX_CHECK", false,-1, 8,0);
        vcdp->declBus(c+321,"GTP_TEST gtx_area_gtxtest TX_END", false,-1, 8,0);
        vcdp->declBus(c+329,"GTP_TEST gtx_area_gtxtest TX_TRIGGER", false,-1, 8,0);
        vcdp->declBus(c+337,"GTP_TEST gtx_area_gtxtest TX_TRIGGER_END", false,-1, 8,0);
        vcdp->declBus(c+121,"GTP_TEST gtx_area_gtxtest current_state", false,-1, 8,0);
        vcdp->declBus(c+49,"GTP_TEST gtx_area_gtxtest next_state", false,-1, 8,0);
        vcdp->declBit(c+57,"GTP_TEST gtx_area_gtxtest ireq_advance_condition", false,-1);
        vcdp->declBus(c+129,"GTP_TEST gtx_area_gtxtest current_beat_cnt", false,-1, 5,0);
        vcdp->declBus(c+25,"GTP_TEST gtx_area_gtxtest tx_byte_cnt", false,-1, 5,0);
        vcdp->declBus(c+137,"GTP_TEST gtx_area_gtxtest tx_addr_temp", false,-1, 7,0);
    }
}

void VGTP_TEST::traceFullThis__1(VGTP_TEST__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->fullBit(c+1,(((((IData)(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full) 
                              | (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_1)) 
                             | (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_2)) 
                            | (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_3))));
        vcdp->fullBus(c+9,(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tdata),32);
        vcdp->fullBus(c+17,((0xffU & ((IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition)
                                       ? (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp)
                                       : ((IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp) 
                                          - (IData)(1U))))),8);
        vcdp->fullBus(c+25,((0x3fU & ((IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition)
                                       ? ((IData)(1U) 
                                          + (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_beat_cnt))
                                       : (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_beat_cnt)))),6);
        vcdp->fullBit(c+33,(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tlast));
        vcdp->fullBit(c+41,(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tvalid));
        vcdp->fullBus(c+49,(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__next_state),9);
        vcdp->fullBit(c+57,(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition));
        vcdp->fullBit(c+65,(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full));
        vcdp->fullBus(c+73,(vlTOPp->GTP_TEST__DOT___zz_gtx_area_mem_port0),32);
        vcdp->fullBit(c+81,(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_1));
        vcdp->fullBit(c+89,(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_2));
        vcdp->fullBit(c+97,(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_3));
        vcdp->fullBus(c+105,(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_crc_data),32);
        vcdp->fullBit(c+113,(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__inhibitFull));
        vcdp->fullBus(c+121,(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state),9);
        vcdp->fullBus(c+129,(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_beat_cnt),6);
        vcdp->fullBus(c+137,(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp),8);
        vcdp->fullBit(c+145,((0x1f4U <= vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__counter)));
        vcdp->fullBus(c+153,(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__counter),32);
        vcdp->fullBit(c+161,((0x1f4U == vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__counter)));
        vcdp->fullBit(c+169,(vlTOPp->log_rst_q));
        vcdp->fullBit(c+177,(vlTOPp->log_clk));
        vcdp->fullBus(c+185,(vlTOPp->s_axi_tx_tdata),32);
        vcdp->fullBit(c+193,(vlTOPp->s_axi_tx_tlast));
        vcdp->fullBit(c+201,(vlTOPp->s_axi_tx_tvalid));
        vcdp->fullBit(c+209,(vlTOPp->s_axi_tx_tready));
        vcdp->fullBit(c+217,((1U & (~ ((0U != (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state)) 
                                       & (IData)(vlTOPp->s_axi_tx_tready))))));
        vcdp->fullBus(c+225,(0xfU),4);
        vcdp->fullBit(c+233,(1U));
        vcdp->fullBus(c+241,(0x1f4U),32);
        vcdp->fullBus(c+249,(1U),32);
        vcdp->fullBus(c+257,(0x3bU),32);
        vcdp->fullBit(c+265,(0U));
        vcdp->fullBus(c+273,(0U),9);
        vcdp->fullBus(c+281,(1U),9);
        vcdp->fullBus(c+289,(2U),9);
        vcdp->fullBus(c+297,(4U),9);
        vcdp->fullBus(c+305,(8U),9);
        vcdp->fullBus(c+313,(0x10U),9);
        vcdp->fullBus(c+321,(0x40U),9);
        vcdp->fullBus(c+329,(0x80U),9);
        vcdp->fullBus(c+337,(0x100U),9);
    }
}
