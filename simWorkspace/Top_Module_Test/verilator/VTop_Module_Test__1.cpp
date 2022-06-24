// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VTop_Module_Test.h for the primary calling header

#include "VTop_Module_Test.h"
#include "VTop_Module_Test__Syms.h"

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__23(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__23\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf 
        = (1U & (~ ((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_lwr) 
                    & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_lrd))));
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__25(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__25\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_data_0 
        = vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_0_1;
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_data_1 
        = vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_1_1;
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_data_2 
        = vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_2_1;
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_data_3 
        = vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_3_1;
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_data_4 
        = vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_4_1;
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_data_5 
        = vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_5_1;
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count_shot_out_regNext 
        = vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__dff_1_q;
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_ds_regNext 
        = vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_ds;
    vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_11 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_11;
    vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_10 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_10;
    vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_9 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_9;
    vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_8 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_8;
    vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_7 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_7;
    vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_6 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_6;
    vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_5 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_5;
    vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_4 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_4;
    vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_3 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_3;
    vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_2 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_2;
    vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_1 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_1;
    vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_0 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_0;
    if (vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153) {
        vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_0_1 
            = vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_0;
    }
    if (vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_1) {
        vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_1_1 
            = vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_1;
    }
    if (vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_2) {
        vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_2_1 
            = vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_2;
    }
    if (vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_3) {
        vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_3_1 
            = vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_3;
    }
    if (vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_4) {
        vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_4_1 
            = vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_4;
    }
    if (vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_5) {
        vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_5_1 
            = vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_5;
    }
}

VL_INLINE_OPT void VTop_Module_Test::_combo__TOP__26(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_combo__TOP__26\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr 
        = (((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_addr_pass_data1) 
            & (~ (IData)(vlTOPp->vme_as))) ? (0x7fffU 
                                              & (vlTOPp->vme_addr 
                                                 >> 1U))
            : 0x7fffU);
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_ds 
        = ((IData)(vlTOPp->vme_ds0) & (IData)(vlTOPp->vme_ds1));
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_lrd 
        = (1U & ((~ ((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_addr_pass_data) 
                     & (IData)(vlTOPp->vme_write))) 
                 | (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_ds)));
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_lwr 
        = (1U & ((~ ((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_addr_pass_data) 
                     & (~ (IData)(vlTOPp->vme_write)))) 
                 | (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_ds)));
    vlTOPp->data_writeEnable = (1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_lrd)));
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_apb_apb_PSEL 
        = (1U & ((~ (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_lwr)) 
                 | (~ (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_lrd))));
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_doRead 
        = ((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_apb_apb_PSEL) 
           & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_lwr));
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_doWrite 
        = ((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_apb_apb_PSEL) 
           & (~ (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_lwr)));
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__27(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__27\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__counter 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__counter;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__counter 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__counter;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT___zz_gssl_txarea_roms_port0 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT___zz_gssl_txarea_roms_port0;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B_io_clear 
        = (0x9c4U <= vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__counter);
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT___zz_counter 
        = (0x9c4U != vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__counter);
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A_io_clear 
        = (0x1388U <= vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__counter);
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT___zz_counter 
        = (0x1388U != vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__counter);
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__gsslResetUnbuffered_regNext 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__gsslResetUnbuffered;
    if (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_wr) 
         & (0x2cU == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_waddress)))) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_11 
            = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_data;
    }
    if (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_wr) 
         & (0x2bU == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_waddress)))) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_10 
            = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_data;
    }
    if (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_wr) 
         & (0x2aU == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_waddress)))) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_9 
            = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_data;
    }
    if (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_wr) 
         & (0x29U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_waddress)))) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_8 
            = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_data;
    }
    if (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_wr) 
         & (0x28U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_waddress)))) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_7 
            = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_data;
    }
    if (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_wr) 
         & (0x27U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_waddress)))) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_6 
            = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_data;
    }
    if (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_wr) 
         & (0x26U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_waddress)))) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_5 
            = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_data;
    }
    if (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_wr) 
         & (0x25U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_waddress)))) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_4 
            = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_data;
    }
    if (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_wr) 
         & (0x24U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_waddress)))) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_3 
            = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_data;
    }
    if (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_wr) 
         & (0x23U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_waddress)))) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_2 
            = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_data;
    }
    if (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_wr) 
         & (0x22U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_waddress)))) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_1 
            = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_data;
    }
    if (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_wr) 
         & (0x21U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_waddress)))) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_0 
            = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_data;
    }
    vlTOPp->cyp1401_GSSL_TRSTZ_N_ABCD = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__gsslResetUnbuffered_regNext;
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__28(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__28\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b_rx_frame_done_delay_2 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b_rx_frame_done_delay_1;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b_rx_frame_done_delay_1 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_done;
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__29(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__29\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_2 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_1;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_1 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger;
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__30(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__30\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__dff_1__DOT__dff_area_buffer = 1U;
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__31(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__31\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_0 = 0U;
    } else {
        if (vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153) {
            vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_0 
                = vlTOPp->data_read;
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_1 = 0U;
    } else {
        if (vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_1) {
            vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_1 
                = vlTOPp->data_read;
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_2 = 0U;
    } else {
        if (vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_2) {
            vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_2 
                = vlTOPp->data_read;
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_3 = 0U;
    } else {
        if (vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_3) {
            vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_3 
                = vlTOPp->data_read;
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_4 = 0U;
    } else {
        if (vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_4) {
            vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_4 
                = vlTOPp->data_read;
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_5 = 0U;
    } else {
        if (vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_5) {
            vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_5 
                = vlTOPp->data_read;
        }
    }
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__32(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__32\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__gsslResetUnbuffered = 1U;
    if ((0x3ffU != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__GSSL_Reset_Counter))) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__gsslResetUnbuffered = 0U;
    }
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A_io_full 
        = (((0x1388U == vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__counter) 
            & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__gsslResetUnbuffered_regNext)) 
           & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__inhibitFull)));
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B_io_full 
        = (((0x9c4U == vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__counter) 
            & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__gsslResetUnbuffered_regNext)) 
           & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__inhibitFull)));
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__33(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__33\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_waddress = 0U;
    } else {
        if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_waddress 
                = (0xffU & (((vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data 
                              >> 8U) + (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter)) 
                            - (IData)(1U)));
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_data = 0U;
    } else {
        if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_data 
                = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg;
        }
    }
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__34(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__34\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_wr 
        = ((~ (IData)(vlTOPp->reset)) & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b));
    if (vlTOPp->reset) {
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_status_data = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter = 0U;
    } else {
        if ((8U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_status_data = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter = 0U;
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 0U;
                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data = 0U;
                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_status_data = 0U;
                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 0U;
                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter = 0U;
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_status_data = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter = 0U;
                    } else {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_status_data = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                        } else {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_status_data 
                                = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 1U;
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state 
                                = ((8U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state))
                                    ? 0U : ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state))
                                             ? ((2U 
                                                 & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state))
                                                 ? 
                                                ((1U 
                                                  & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state))
                                                  ? 7U
                                                  : 6U)
                                                 : 
                                                ((1U 
                                                  & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state))
                                                  ? 5U
                                                  : 4U))
                                             : ((2U 
                                                 & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state))
                                                 ? 
                                                ((1U 
                                                  & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state))
                                                  ? 3U
                                                  : 2U)
                                                 : 
                                                ((1U 
                                                  & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state))
                                                  ? 1U
                                                  : 0U))));
                        }
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                    }
                }
            }
        } else {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) {
                            if ((2U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 7U;
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 1U;
                            } else {
                                if ((4U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 8U;
                                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                } else {
                                    if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 7U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    } else {
                                        if ((1U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 1U;
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 1U;
                                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
                                        } else {
                                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                        }
                                    }
                                }
                            }
                        } else {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                        }
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 7U;
                    } else {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) {
                            if ((2U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 6U;
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 1U;
                            } else {
                                if ((4U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 8U;
                                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                } else {
                                    if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state 
                                            = (((0xffU 
                                                 & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter)) 
                                                == 
                                                (0xffU 
                                                 & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data))
                                                ? 7U
                                                : 1U);
                                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag)))) {
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 1U;
                                        }
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 1U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter 
                                            = (0x1ffU 
                                               & ((IData)(1U) 
                                                  + (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter)));
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
                                    } else {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    }
                                }
                            }
                        } else {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                        }
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 6U;
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) {
                            if ((2U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 5U;
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 1U;
                            } else {
                                if ((4U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 8U;
                                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                } else {
                                    if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 5U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    } else {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    }
                                }
                            }
                        } else {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 6U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 1U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                        }
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 5U;
                    } else {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) {
                            if ((2U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 4U;
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 1U;
                            } else {
                                if ((4U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 8U;
                                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                } else {
                                    if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 4U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    } else {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    }
                                }
                            }
                        } else {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 5U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 1U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                            if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag) {
                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data 
                                    = (0xffffU & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg);
                            }
                        }
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 4U;
                    }
                }
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) {
                            if ((2U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 3U;
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 1U;
                            } else {
                                if ((4U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 8U;
                                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                } else {
                                    if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 3U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    } else {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    }
                                }
                            }
                        } else {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 4U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 1U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                        }
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 3U;
                    } else {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) {
                            if ((2U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 2U;
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 1U;
                            } else {
                                if ((4U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 8U;
                                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                } else {
                                    if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 2U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    } else {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    }
                                }
                            }
                        } else {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 3U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 1U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                        }
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 2U;
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) {
                            if ((2U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 1U;
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 1U;
                            } else {
                                if ((4U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 8U;
                                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                } else {
                                    if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 1U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    } else {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    }
                                }
                            }
                        } else {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 2U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 1U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                        }
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 1U;
                    } else {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) {
                            if ((0U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 1U;
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 1U;
                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 1U;
                            } else {
                                if ((2U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 1U;
                                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 0U;
                                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
                                } else {
                                    if ((4U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 8U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 0U;
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
                                    } else {
                                        if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 0U;
                                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
                                        } else {
                                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 0U;
                                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
                                        }
                                    }
                                }
                            }
                        } else {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 0U;
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
                        }
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter = 0U;
                    }
                }
            }
        }
    }
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__35(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__35\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data;
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg = 0U;
    } else {
        if ((8U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg = 0U;
        } else {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) {
                            if ((1U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg = 0U;
                            }
                        }
                    } else {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) {
                            if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg = 0U;
                            }
                        }
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg = 0U;
                        }
                    } else {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg 
                                = ((0xffffffU & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg) 
                                   | ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out) 
                                      << 0x18U));
                        }
                    }
                }
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg 
                                = ((0xff00ffffU & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg) 
                                   | ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out) 
                                      << 0x10U));
                        }
                    } else {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg 
                                = ((0xffff00ffU & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg) 
                                   | ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out) 
                                      << 8U));
                        }
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg 
                                = ((0xffffff00U & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg) 
                                   | (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out));
                        }
                    } else {
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg = 0U;
                    }
                }
            }
        }
    }
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state;
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__36(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__36\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (vlTOPp->reset) {
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_status_data = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter = 0U;
    } else {
        if ((8U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_status_data = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter = 0U;
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 0U;
                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data = 0U;
                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_status_data = 0U;
                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 0U;
                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter = 0U;
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_status_data = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter = 0U;
                    } else {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_status_data = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                        } else {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_status_data 
                                = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 1U;
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state 
                                = ((8U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state))
                                    ? 0U : ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state))
                                             ? ((2U 
                                                 & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state))
                                                 ? 
                                                ((1U 
                                                  & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state))
                                                  ? 7U
                                                  : 6U)
                                                 : 
                                                ((1U 
                                                  & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state))
                                                  ? 5U
                                                  : 4U))
                                             : ((2U 
                                                 & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state))
                                                 ? 
                                                ((1U 
                                                  & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state))
                                                  ? 3U
                                                  : 2U)
                                                 : 
                                                ((1U 
                                                  & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state))
                                                  ? 1U
                                                  : 0U))));
                        }
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                    }
                }
            }
        } else {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) {
                            if ((2U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 7U;
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 1U;
                            } else {
                                if ((4U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 8U;
                                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                } else {
                                    if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 7U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    } else {
                                        if ((1U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 1U;
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 1U;
                                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
                                        } else {
                                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                        }
                                    }
                                }
                            }
                        } else {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                        }
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 7U;
                    } else {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) {
                            if ((2U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 6U;
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 1U;
                            } else {
                                if ((4U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 8U;
                                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                } else {
                                    if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state 
                                            = (((0xffU 
                                                 & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter)) 
                                                == 
                                                (0xffU 
                                                 & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data))
                                                ? 7U
                                                : 1U);
                                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag)))) {
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 1U;
                                        }
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 1U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter 
                                            = (0x1ffU 
                                               & ((IData)(1U) 
                                                  + (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter)));
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
                                    } else {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    }
                                }
                            }
                        } else {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                        }
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 6U;
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) {
                            if ((2U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 5U;
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 1U;
                            } else {
                                if ((4U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 8U;
                                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                } else {
                                    if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 5U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    } else {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    }
                                }
                            }
                        } else {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 6U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 1U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                        }
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 5U;
                    } else {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) {
                            if ((2U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 4U;
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 1U;
                            } else {
                                if ((4U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 8U;
                                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                } else {
                                    if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 4U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    } else {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    }
                                }
                            }
                        } else {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 5U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 1U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                            if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag) {
                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data 
                                    = (0xffffU & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg);
                            }
                        }
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 4U;
                    }
                }
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) {
                            if ((2U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 3U;
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 1U;
                            } else {
                                if ((4U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 8U;
                                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                } else {
                                    if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 3U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    } else {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    }
                                }
                            }
                        } else {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 4U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 1U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                        }
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 3U;
                    } else {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) {
                            if ((2U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 2U;
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 1U;
                            } else {
                                if ((4U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 8U;
                                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                } else {
                                    if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 2U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    } else {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    }
                                }
                            }
                        } else {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 3U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 1U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                        }
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 2U;
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) {
                            if ((2U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 1U;
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 1U;
                            } else {
                                if ((4U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 8U;
                                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                } else {
                                    if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 1U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    } else {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                    }
                                }
                            }
                        } else {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 2U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 1U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                        }
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 1U;
                    } else {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) {
                            if ((0U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 1U;
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 1U;
                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 1U;
                            } else {
                                if ((2U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 1U;
                                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 0U;
                                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
                                } else {
                                    if ((4U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 8U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 0U;
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
                                    } else {
                                        if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 0U;
                                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
                                        } else {
                                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 0U;
                                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
                                        }
                                    }
                                }
                            }
                        } else {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = 0U;
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = 0U;
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = 0U;
                        }
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_done = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter = 0U;
                    }
                }
            }
        }
    }
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__37(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__37\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data;
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg = 0U;
    } else {
        if ((8U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg = 0U;
        } else {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) {
                            if ((1U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg = 0U;
                            }
                        }
                    } else {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) {
                            if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg = 0U;
                            }
                        }
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg = 0U;
                        }
                    } else {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg 
                                = ((0xffffffU & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg) 
                                   | ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out) 
                                      << 0x18U));
                        }
                    }
                }
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg 
                                = ((0xff00ffffU & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg) 
                                   | ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out) 
                                      << 0x10U));
                        }
                    } else {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg 
                                = ((0xffff00ffU & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg) 
                                   | ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out) 
                                      << 8U));
                        }
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg 
                                = ((0xffffff00U & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg) 
                                   | (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out));
                        }
                    } else {
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg = 0U;
                    }
                }
            }
        }
    }
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state;
}

VL_INLINE_OPT void VTop_Module_Test::_multiclk__TOP__38(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_multiclk__TOP__38\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__dff_1_q 
        = ((2U > (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_posarea_counter)) 
           & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__dff_1__DOT__dff_area_buffer));
}

VL_INLINE_OPT void VTop_Module_Test::_combo__TOP__39(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_combo__TOP__39\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153 
        = ((0U == (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr)) 
           & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_doWrite));
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_1 
        = ((4U == (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr)) 
           & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_doWrite));
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_2 
        = ((8U == (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr)) 
           & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_doWrite));
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_3 
        = ((0xcU == (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr)) 
           & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_doWrite));
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_4 
        = ((0x10U == (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr)) 
           & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_doWrite));
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_5 
        = ((0x14U == (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr)) 
           & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_doWrite));
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__40(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__40\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out 
        = (1U & (IData)(vlTOPp->cyp1401_GSSL_RXST0_B));
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out 
        = vlTOPp->cyp1401_GSSL_RXD_B;
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__41(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__41\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out 
        = (1U & (IData)(vlTOPp->cyp1401_GSSL_RXST0_C));
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out 
        = vlTOPp->cyp1401_GSSL_RXD_C;
}

void VTop_Module_Test::_eval(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_eval\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_combo__TOP__2(vlSymsp);
    vlTOPp->__Vm_traceActivity = (2U | vlTOPp->__Vm_traceActivity);
    if (((IData)(vlTOPp->vme_clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__vme_clk)))) {
        vlTOPp->_sequent__TOP__5(vlSymsp);
        vlTOPp->__Vm_traceActivity = (4U | vlTOPp->__Vm_traceActivity);
    }
    if (((IData)(vlTOPp->gssl_clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__gssl_clk)))) {
        vlTOPp->_sequent__TOP__6(vlSymsp);
    }
    if ((((IData)(vlTOPp->reset) & (~ (IData)(vlTOPp->__Vclklast__TOP__reset))) 
         | ((IData)(vlTOPp->vme_clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__vme_clk))))) {
        vlTOPp->__Vm_traceActivity = (8U | vlTOPp->__Vm_traceActivity);
        vlTOPp->_sequent__TOP__8(vlSymsp);
        vlTOPp->_sequent__TOP__9(vlSymsp);
    }
    if ((((~ (IData)(vlTOPp->cyp1401_GSSL_RXCLK_C)) 
          & (IData)(vlTOPp->__Vclklast__TOP__cyp1401_GSSL_RXCLK_C)) 
         | ((IData)(vlTOPp->reset) & (~ (IData)(vlTOPp->__Vclklast__TOP__reset))))) {
        vlTOPp->_sequent__TOP__11(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x10U | vlTOPp->__Vm_traceActivity);
    }
    if ((((IData)(vlTOPp->gssl_clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__gssl_clk))) 
         | ((IData)(vlTOPp->reset) & (~ (IData)(vlTOPp->__Vclklast__TOP__reset))))) {
        vlTOPp->__Vm_traceActivity = (0x20U | vlTOPp->__Vm_traceActivity);
        vlTOPp->_sequent__TOP__13(vlSymsp);
        vlTOPp->_sequent__TOP__14(vlSymsp);
        vlTOPp->_sequent__TOP__15(vlSymsp);
        vlTOPp->_sequent__TOP__16(vlSymsp);
    }
    if ((((IData)(vlTOPp->cyp1401_GSSL_RXCLK_B) & (~ (IData)(vlTOPp->__Vclklast__TOP__cyp1401_GSSL_RXCLK_B))) 
         | ((IData)(vlTOPp->reset) & (~ (IData)(vlTOPp->__Vclklast__TOP__reset))))) {
        vlTOPp->__Vm_traceActivity = (0x40U | vlTOPp->__Vm_traceActivity);
        vlTOPp->_sequent__TOP__18(vlSymsp);
        vlTOPp->_sequent__TOP__19(vlSymsp);
    }
    if ((((IData)(vlTOPp->cyp1401_GSSL_RXCLK_C) & (~ (IData)(vlTOPp->__Vclklast__TOP__cyp1401_GSSL_RXCLK_C))) 
         | ((IData)(vlTOPp->reset) & (~ (IData)(vlTOPp->__Vclklast__TOP__reset))))) {
        vlTOPp->__Vm_traceActivity = (0x80U | vlTOPp->__Vm_traceActivity);
        vlTOPp->_sequent__TOP__21(vlSymsp);
        vlTOPp->_sequent__TOP__22(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->vme_clk)) & (IData)(vlTOPp->__Vclklast__TOP__vme_clk))) {
        vlTOPp->_sequent__TOP__23(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x100U | vlTOPp->__Vm_traceActivity);
    }
    if (((IData)(vlTOPp->vme_clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__vme_clk)))) {
        vlTOPp->_sequent__TOP__25(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x200U | vlTOPp->__Vm_traceActivity);
    }
    vlTOPp->_combo__TOP__26(vlSymsp);
    if (((IData)(vlTOPp->gssl_clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__gssl_clk)))) {
        vlTOPp->_sequent__TOP__27(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x400U | vlTOPp->__Vm_traceActivity);
    }
    if (((IData)(vlTOPp->cyp1401_GSSL_RXCLK_B) & (~ (IData)(vlTOPp->__Vclklast__TOP__cyp1401_GSSL_RXCLK_B)))) {
        vlTOPp->_sequent__TOP__28(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x800U | vlTOPp->__Vm_traceActivity);
    }
    if (((IData)(vlTOPp->cyp1401_GSSL_RXCLK_C) & (~ (IData)(vlTOPp->__Vclklast__TOP__cyp1401_GSSL_RXCLK_C)))) {
        vlTOPp->_sequent__TOP__29(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x1000U | vlTOPp->__Vm_traceActivity);
    }
    if (((IData)(vlTOPp->__VinpClk__TOP__Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf) 
         & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf)))) {
        vlTOPp->_sequent__TOP__30(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x2000U | vlTOPp->__Vm_traceActivity);
    }
    if ((((IData)(vlTOPp->reset) & (~ (IData)(vlTOPp->__Vclklast__TOP__reset))) 
         | ((IData)(vlTOPp->vme_clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__vme_clk))))) {
        vlTOPp->_sequent__TOP__31(vlSymsp);
    }
    if ((((IData)(vlTOPp->gssl_clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__gssl_clk))) 
         | ((IData)(vlTOPp->reset) & (~ (IData)(vlTOPp->__Vclklast__TOP__reset))))) {
        vlTOPp->_sequent__TOP__32(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x4000U | vlTOPp->__Vm_traceActivity);
    }
    if ((((~ (IData)(vlTOPp->cyp1401_GSSL_RXCLK_B)) 
          & (IData)(vlTOPp->__Vclklast__TOP__cyp1401_GSSL_RXCLK_B)) 
         | ((IData)(vlTOPp->reset) & (~ (IData)(vlTOPp->__Vclklast__TOP__reset))))) {
        vlTOPp->_sequent__TOP__33(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x8000U | vlTOPp->__Vm_traceActivity);
    }
    if ((((IData)(vlTOPp->cyp1401_GSSL_RXCLK_B) & (~ (IData)(vlTOPp->__Vclklast__TOP__cyp1401_GSSL_RXCLK_B))) 
         | ((IData)(vlTOPp->reset) & (~ (IData)(vlTOPp->__Vclklast__TOP__reset))))) {
        vlTOPp->_sequent__TOP__34(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x10000U | vlTOPp->__Vm_traceActivity);
        vlTOPp->_sequent__TOP__35(vlSymsp);
    }
    if ((((IData)(vlTOPp->cyp1401_GSSL_RXCLK_C) & (~ (IData)(vlTOPp->__Vclklast__TOP__cyp1401_GSSL_RXCLK_C))) 
         | ((IData)(vlTOPp->reset) & (~ (IData)(vlTOPp->__Vclklast__TOP__reset))))) {
        vlTOPp->_sequent__TOP__36(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x20000U | vlTOPp->__Vm_traceActivity);
        vlTOPp->_sequent__TOP__37(vlSymsp);
    }
    if ((((IData)(vlTOPp->__VinpClk__TOP__Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf) 
          & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf))) 
         | ((IData)(vlTOPp->vme_clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__vme_clk))))) {
        vlTOPp->_multiclk__TOP__38(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x40000U | vlTOPp->__Vm_traceActivity);
    }
    vlTOPp->_combo__TOP__39(vlSymsp);
    if (((IData)(vlTOPp->cyp1401_GSSL_RXCLK_B) & (~ (IData)(vlTOPp->__Vclklast__TOP__cyp1401_GSSL_RXCLK_B)))) {
        vlTOPp->_sequent__TOP__40(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x80000U | vlTOPp->__Vm_traceActivity);
    }
    if (((IData)(vlTOPp->cyp1401_GSSL_RXCLK_C) & (~ (IData)(vlTOPp->__Vclklast__TOP__cyp1401_GSSL_RXCLK_C)))) {
        vlTOPp->_sequent__TOP__41(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x100000U | vlTOPp->__Vm_traceActivity);
    }
    // Final
    vlTOPp->__Vclklast__TOP__cyp1401_GSSL_RXCLK_B = vlTOPp->cyp1401_GSSL_RXCLK_B;
    vlTOPp->__Vclklast__TOP__cyp1401_GSSL_RXCLK_C = vlTOPp->cyp1401_GSSL_RXCLK_C;
    vlTOPp->__Vclklast__TOP__vme_clk = vlTOPp->vme_clk;
    vlTOPp->__Vclklast__TOP__gssl_clk = vlTOPp->gssl_clk;
    vlTOPp->__Vclklast__TOP__reset = vlTOPp->reset;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf 
        = vlTOPp->__VinpClk__TOP__Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf;
    vlTOPp->__VinpClk__TOP__Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf 
        = vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf;
}

VL_INLINE_OPT QData VTop_Module_Test::_change_request(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_change_request\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    return (vlTOPp->_change_request_1(vlSymsp));
}

VL_INLINE_OPT QData VTop_Module_Test::_change_request_1(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_change_request_1\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    __req |= ((vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf ^ vlTOPp->__Vchglast__TOP__Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf));
    VL_DEBUG_IF( if(__req && ((vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf ^ vlTOPp->__Vchglast__TOP__Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf))) VL_DBG_MSGF("        CHANGE: D:/SCALA/SRIO/tmp/job_1/Top_Module_Test.v:1616: Top_Module_Test.vme_area_vme_module.vme_area_vme_decode.vme_area_os_count.oneshot_negarea_shot_clk_buf\n"); );
    // Final
    vlTOPp->__Vchglast__TOP__Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf 
        = vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf;
    return __req;
}

#ifdef VL_DEBUG
void VTop_Module_Test::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vme_clk & 0xfeU))) {
        Verilated::overWidthError("vme_clk");}
    if (VL_UNLIKELY((gssl_clk & 0xfeU))) {
        Verilated::overWidthError("gssl_clk");}
    if (VL_UNLIKELY((reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
    if (VL_UNLIKELY((vme_addr & 0xff000000U))) {
        Verilated::overWidthError("vme_addr");}
    if (VL_UNLIKELY((vme_am & 0xc0U))) {
        Verilated::overWidthError("vme_am");}
    if (VL_UNLIKELY((vme_as & 0xfeU))) {
        Verilated::overWidthError("vme_as");}
    if (VL_UNLIKELY((vme_ds0 & 0xfeU))) {
        Verilated::overWidthError("vme_ds0");}
    if (VL_UNLIKELY((vme_ds1 & 0xfeU))) {
        Verilated::overWidthError("vme_ds1");}
    if (VL_UNLIKELY((vme_write & 0xfeU))) {
        Verilated::overWidthError("vme_write");}
    if (VL_UNLIKELY((vme_lword & 0xfeU))) {
        Verilated::overWidthError("vme_lword");}
    if (VL_UNLIKELY((vme_iack & 0xfeU))) {
        Verilated::overWidthError("vme_iack");}
    if (VL_UNLIKELY((vme_iackin & 0xfeU))) {
        Verilated::overWidthError("vme_iackin");}
    if (VL_UNLIKELY((gap & 0xf0U))) {
        Verilated::overWidthError("gap");}
    if (VL_UNLIKELY((sw & 0xf0U))) {
        Verilated::overWidthError("sw");}
    if (VL_UNLIKELY((gap4 & 0xfeU))) {
        Verilated::overWidthError("gap4");}
    if (VL_UNLIKELY((cyp1401_GSSL_A_LOS & 0xfeU))) {
        Verilated::overWidthError("cyp1401_GSSL_A_LOS");}
    if (VL_UNLIKELY((cyp1401_GSSL_B_LOS & 0xfeU))) {
        Verilated::overWidthError("cyp1401_GSSL_B_LOS");}
    if (VL_UNLIKELY((cyp1401_GSSL_C_LOS & 0xfeU))) {
        Verilated::overWidthError("cyp1401_GSSL_C_LOS");}
    if (VL_UNLIKELY((cyp1401_GSSL_A_TXFAULT & 0xfeU))) {
        Verilated::overWidthError("cyp1401_GSSL_A_TXFAULT");}
    if (VL_UNLIKELY((cyp1401_GSSL_B_TXFAULT & 0xfeU))) {
        Verilated::overWidthError("cyp1401_GSSL_B_TXFAULT");}
    if (VL_UNLIKELY((cyp1401_GSSL_C_TXFAULT & 0xfeU))) {
        Verilated::overWidthError("cyp1401_GSSL_C_TXFAULT");}
    if (VL_UNLIKELY((cyp1401_GSSL_RXCLK_A & 0xfeU))) {
        Verilated::overWidthError("cyp1401_GSSL_RXCLK_A");}
    if (VL_UNLIKELY((cyp1401_GSSL_RXST0_A & 0xf8U))) {
        Verilated::overWidthError("cyp1401_GSSL_RXST0_A");}
    if (VL_UNLIKELY((cyp1401_GSSL_RXCLK_B & 0xfeU))) {
        Verilated::overWidthError("cyp1401_GSSL_RXCLK_B");}
    if (VL_UNLIKELY((cyp1401_GSSL_RXST0_B & 0xf8U))) {
        Verilated::overWidthError("cyp1401_GSSL_RXST0_B");}
    if (VL_UNLIKELY((cyp1401_GSSL_RXCLK_C & 0xfeU))) {
        Verilated::overWidthError("cyp1401_GSSL_RXCLK_C");}
    if (VL_UNLIKELY((cyp1401_GSSL_RXST0_C & 0xf8U))) {
        Verilated::overWidthError("cyp1401_GSSL_RXST0_C");}
}
#endif  // VL_DEBUG
