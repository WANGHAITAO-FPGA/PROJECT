// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VTop_Module_Test.h for the primary calling header

#include "VTop_Module_Test.h"
#include "VTop_Module_Test__Syms.h"

//==========

VL_CTOR_IMP(VTop_Module_Test) {
    VTop_Module_Test__Syms* __restrict vlSymsp = __VlSymsp = new VTop_Module_Test__Syms(this, name());
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void VTop_Module_Test::__Vconfigure(VTop_Module_Test__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

VTop_Module_Test::~VTop_Module_Test() {
    delete __VlSymsp; __VlSymsp=NULL;
}

void VTop_Module_Test::_settle__TOP__1(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_settle__TOP__1\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->vme_beer = 0U;
    vlTOPp->vme_retry = 0U;
    vlTOPp->vme_irq = 0x7fU;
    vlTOPp->cyp1401_GSSL_INSEL_A = 1U;
    vlTOPp->cyp1401_GSSL_INSEL_B = 1U;
    vlTOPp->cyp1401_GSSL_INSEL_C = 1U;
    vlTOPp->cyp1401_GSSL_TXOPA = 0U;
    vlTOPp->cyp1401_GSSL_TXOPB = 0U;
    vlTOPp->cyp1401_GSSL_TXOPC = 0U;
    vlTOPp->cyp1401_GSSL_SPDSEL_ABCD = 1U;
    vlTOPp->cyp1401_GSSL_LPEN_ABCD = 0U;
    vlTOPp->cyp1401_GSSL_MODE_A = 0U;
    vlTOPp->cyp1401_GSSL_MODE_B = 0U;
    vlTOPp->cyp1401_GSSL_MODE_C = 0U;
    vlTOPp->vme_iackout = vlTOPp->vme_iackin;
    vlTOPp->cyp1401_GSSL_REFCLK_ABCD = (1U & (~ (IData)(vlTOPp->gssl_clk)));
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_addr_pass_data1 
        = ((((0x39U == (IData)(vlTOPp->vme_am)) | (0x3dU 
                                                   == (IData)(vlTOPp->vme_am))) 
            & (IData)(vlTOPp->vme_lword)) & (IData)(vlTOPp->vme_iack));
    vlTOPp->vme_dtack = vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_dtack;
    vlTOPp->data_write = vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_readData;
    vlTOPp->cyp1401_GSSL_TXD_B = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_data;
    vlTOPp->rx_led = (0xf424U == vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gssl_rx_led__DOT__counter);
    vlTOPp->led = vlTOPp->Top_Module_Test__DOT__gssl_area_ledtemp;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A_io_clear 
        = (0x1388U <= vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__counter);
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B_io_clear 
        = (0x9c4U <= vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__counter);
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__when_CYP1401_l91 
        = (0x3fffffU != vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__GSSL_Reset_Counter);
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT___zz_counter 
        = (0x1388U != vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__counter);
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT___zz_counter 
        = (0x9c4U != vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__counter);
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gssl_rx_led__DOT__when_CYP1401_l208 
        = (0xf424U != vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gssl_rx_led__DOT__counter);
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gssl_rx_led__DOT__when_CYP1401_l208 
        = (0xf424U != vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gssl_rx_led__DOT__counter);
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b_GSSL_TXCT0 
        = (1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b_GSSL_TXCT0));
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b_GSSL_TXCT0 
        = ((6U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b_GSSL_TXCT0)) 
           | (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_k));
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__gsslResetUnbuffered = 1U;
    if ((0x3fffffU != vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__GSSL_Reset_Counter)) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__gsslResetUnbuffered = 0U;
    }
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_ds 
        = ((IData)(vlTOPp->vme_ds0) & (IData)(vlTOPp->vme_ds1));
    vlTOPp->cyp1401_GSSL_TRSTZ_N_ABCD = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__gsslResetUnbuffered_regNext;
    vlTOPp->cyp1401_GSSL_TXD_A = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_data;
    vlTOPp->cyp1401_GSSL_TXD_C = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_data;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A_io_full 
        = (((0x1388U == vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__counter) 
            & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__gsslResetUnbuffered_regNext)) 
           & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__inhibitFull)));
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B_io_full 
        = (((0x9c4U == vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__counter) 
            & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__gsslResetUnbuffered_regNext)) 
           & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__inhibitFull)));
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a_GSSL_TXCT0 
        = (1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a_GSSL_TXCT0));
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a_GSSL_TXCT0 
        = ((6U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a_GSSL_TXCT0)) 
           | (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_k));
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c_GSSL_TXCT0 
        = (1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c_GSSL_TXCT0));
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c_GSSL_TXCT0 
        = ((6U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c_GSSL_TXCT0)) 
           | (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_k));
    vlTOPp->Top_Module_Test__DOT__gssl_area_counter_willClear = 0U;
    if ((0x3b9ac9fU == vlTOPp->Top_Module_Test__DOT__gssl_area_counter_value)) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_counter_willClear = 1U;
    }
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__dff_1_q 
        = ((2U > (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_posarea_counter)) 
           & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__dff_1__DOT__dff_area_buffer));
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_addr_pass_data 
        = ((((((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_addr_pass_data1) 
               & (~ (IData)(vlTOPp->vme_as))) & ((0xfU 
                                                  & (vlTOPp->vme_addr 
                                                     >> 0x10U)) 
                                                 == 
                                                 (0xfU 
                                                  & (~ (IData)(vlTOPp->gap))))) 
             & ((IData)(vlTOPp->gap) == (IData)(vlTOPp->sw))) 
            & (6U == (7U & (vlTOPp->vme_addr >> 0x15U)))) 
           & ((1U & (vlTOPp->vme_addr >> 0x14U)) == 
              (1U & (~ (IData)(vlTOPp->gap4)))));
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr 
        = (((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_addr_pass_data1) 
            & (~ (IData)(vlTOPp->vme_as))) ? (0x7fffU 
                                              & (vlTOPp->vme_addr 
                                                 >> 1U))
            : 0x7fffU);
    vlTOPp->cyp1401_GSSL_TXCT0_B = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b_GSSL_TXCT0;
    vlTOPp->cyp1401_GSSL_TXCT0_A = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a_GSSL_TXCT0;
    vlTOPp->cyp1401_GSSL_TXCT0_C = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c_GSSL_TXCT0;
    vlTOPp->Top_Module_Test__DOT__gssl_area_counter_valueNext 
        = ((0x3b9ac9fU == vlTOPp->Top_Module_Test__DOT__gssl_area_counter_value)
            ? 0U : (0x3ffffffU & ((IData)(1U) + vlTOPp->Top_Module_Test__DOT__gssl_area_counter_value)));
    if (vlTOPp->Top_Module_Test__DOT__gssl_area_counter_willClear) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_counter_valueNext = 0U;
    }
    vlTOPp->datadir = ((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_addr_pass_data) 
                       & (IData)(vlTOPp->vme_write));
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
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_1 
        = ((2U == (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr)) 
           & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_doWrite));
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_3 
        = ((6U == (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr)) 
           & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_doWrite));
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_5 
        = ((0xaU == (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr)) 
           & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_doWrite));
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_7 
        = ((0xeU == (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr)) 
           & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_doWrite));
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_9 
        = ((0x12U == (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr)) 
           & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_doWrite));
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_11 
        = ((0x16U == (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr)) 
           & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_doWrite));
}

void VTop_Module_Test::_initial__TOP__24(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_initial__TOP__24\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    WData/*575:0*/ __Vtemp2[18];
    // Body
    __Vtemp2[0U] = 0x2e62696eU;
    __Vtemp2[1U] = 0x726f6d73U;
    __Vtemp2[2U] = 0x7265615fU;
    __Vtemp2[3U] = 0x5f747861U;
    __Vtemp2[4U] = 0x6773736cU;
    __Vtemp2[5U] = 0x756c655fU;
    __Vtemp2[6U] = 0x5f6d6f64U;
    __Vtemp2[7U] = 0x6773736cU;
    __Vtemp2[8U] = 0x7265615fU;
    __Vtemp2[9U] = 0x736c5f61U;
    __Vtemp2[0xaU] = 0x6c5f6773U;
    __Vtemp2[0xbU] = 0x6c657665U;
    __Vtemp2[0xcU] = 0x5f746f70U;
    __Vtemp2[0xdU] = 0x73742e76U;
    __Vtemp2[0xeU] = 0x655f5465U;
    __Vtemp2[0xfU] = 0x6f64756cU;
    __Vtemp2[0x10U] = 0x6f705f4dU;
    __Vtemp2[0x11U] = 0x54U;
    VL_READMEM_N(false, 32, 256, 0, VL_CVT_PACK_STR_NW(18, __Vtemp2)
                 , vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_roms
                 , 0, ~VL_ULL(0));
}

void VTop_Module_Test::_eval_initial(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_eval_initial\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vclklast__TOP__cyp1401_GSSL_RXCLK_B = vlTOPp->cyp1401_GSSL_RXCLK_B;
    vlTOPp->__Vclklast__TOP__cyp1401_GSSL_RXCLK_C = vlTOPp->cyp1401_GSSL_RXCLK_C;
    vlTOPp->__Vclklast__TOP__vme_clk = vlTOPp->vme_clk;
    vlTOPp->__Vclklast__TOP__gssl_clk = vlTOPp->gssl_clk;
    vlTOPp->__Vclklast__TOP__reset = vlTOPp->reset;
    vlTOPp->_initial__TOP__24(vlSymsp);
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf 
        = vlTOPp->__VinpClk__TOP__Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf;
}

void VTop_Module_Test::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::final\n"); );
    // Variables
    VTop_Module_Test__Syms* __restrict vlSymsp = this->__VlSymsp;
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void VTop_Module_Test::_eval_settle(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_eval_settle\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_settle__TOP__1(vlSymsp);
    vlTOPp->__Vm_traceActivity = (1U | vlTOPp->__Vm_traceActivity);
}

void VTop_Module_Test::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_ctor_var_reset\n"); );
    // Body
    vme_clk = VL_RAND_RESET_I(1);
    gssl_clk = VL_RAND_RESET_I(1);
    reset = VL_RAND_RESET_I(1);
    vme_addr = VL_RAND_RESET_I(24);
    vme_am = VL_RAND_RESET_I(6);
    vme_as = VL_RAND_RESET_I(1);
    vme_ds0 = VL_RAND_RESET_I(1);
    vme_ds1 = VL_RAND_RESET_I(1);
    vme_write = VL_RAND_RESET_I(1);
    vme_lword = VL_RAND_RESET_I(1);
    vme_iack = VL_RAND_RESET_I(1);
    vme_dtack = VL_RAND_RESET_I(1);
    vme_beer = VL_RAND_RESET_I(1);
    vme_retry = VL_RAND_RESET_I(1);
    vme_irq = VL_RAND_RESET_I(7);
    vme_iackin = VL_RAND_RESET_I(1);
    vme_iackout = VL_RAND_RESET_I(1);
    data_read = VL_RAND_RESET_I(16);
    data_write = VL_RAND_RESET_I(16);
    data_writeEnable = VL_RAND_RESET_I(1);
    gap = VL_RAND_RESET_I(4);
    sw = VL_RAND_RESET_I(4);
    gap4 = VL_RAND_RESET_I(1);
    datadir = VL_RAND_RESET_I(1);
    cyp1401_GSSL_A_LOS = VL_RAND_RESET_I(1);
    cyp1401_GSSL_B_LOS = VL_RAND_RESET_I(1);
    cyp1401_GSSL_C_LOS = VL_RAND_RESET_I(1);
    cyp1401_GSSL_A_TXFAULT = VL_RAND_RESET_I(1);
    cyp1401_GSSL_B_TXFAULT = VL_RAND_RESET_I(1);
    cyp1401_GSSL_C_TXFAULT = VL_RAND_RESET_I(1);
    cyp1401_GSSL_REFCLK_ABCD = VL_RAND_RESET_I(1);
    cyp1401_GSSL_INSEL_A = VL_RAND_RESET_I(1);
    cyp1401_GSSL_INSEL_B = VL_RAND_RESET_I(1);
    cyp1401_GSSL_INSEL_C = VL_RAND_RESET_I(1);
    cyp1401_GSSL_TXOPA = VL_RAND_RESET_I(1);
    cyp1401_GSSL_TXOPB = VL_RAND_RESET_I(1);
    cyp1401_GSSL_TXOPC = VL_RAND_RESET_I(1);
    cyp1401_GSSL_SPDSEL_ABCD = VL_RAND_RESET_I(1);
    cyp1401_GSSL_LPEN_ABCD = VL_RAND_RESET_I(1);
    cyp1401_GSSL_TRSTZ_N_ABCD = VL_RAND_RESET_I(1);
    cyp1401_GSSL_MODE_A = VL_RAND_RESET_I(3);
    cyp1401_GSSL_MODE_B = VL_RAND_RESET_I(3);
    cyp1401_GSSL_MODE_C = VL_RAND_RESET_I(3);
    cyp1401_GSSL_RXCLK_A = VL_RAND_RESET_I(1);
    cyp1401_GSSL_RXST0_A = VL_RAND_RESET_I(3);
    cyp1401_GSSL_RXD_A = VL_RAND_RESET_I(8);
    cyp1401_GSSL_TXCT0_A = VL_RAND_RESET_I(3);
    cyp1401_GSSL_TXD_A = VL_RAND_RESET_I(8);
    cyp1401_GSSL_RXCLK_B = VL_RAND_RESET_I(1);
    cyp1401_GSSL_RXST0_B = VL_RAND_RESET_I(3);
    cyp1401_GSSL_RXD_B = VL_RAND_RESET_I(8);
    cyp1401_GSSL_TXCT0_B = VL_RAND_RESET_I(3);
    cyp1401_GSSL_TXD_B = VL_RAND_RESET_I(8);
    cyp1401_GSSL_RXCLK_C = VL_RAND_RESET_I(1);
    cyp1401_GSSL_RXST0_C = VL_RAND_RESET_I(3);
    cyp1401_GSSL_RXD_C = VL_RAND_RESET_I(8);
    cyp1401_GSSL_TXCT0_C = VL_RAND_RESET_I(3);
    cyp1401_GSSL_TXD_C = VL_RAND_RESET_I(8);
    rx_led = VL_RAND_RESET_I(1);
    led = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_data_0 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_vme_data_1 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_vme_data_2 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_vme_data_3 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_vme_data_4 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_vme_data_5 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_sensor_data_0 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_sensor_data_1 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_sensor_data_2 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_sensor_data_3 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_sensor_data_4 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_sensor_data_5 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_sensor_data_6 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_sensor_data_7 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_sensor_data_8 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_sensor_data_9 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_sensor_data_10 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_sensor_data_11 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_ledtemp = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_counter_willClear = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_counter_valueNext = VL_RAND_RESET_I(26);
    Top_Module_Test__DOT__gssl_area_counter_value = VL_RAND_RESET_I(26);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_lwr = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_lrd = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr = VL_RAND_RESET_I(15);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_apb_apb_PSEL = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_addr_pass_data1 = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_addr_pass_data = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_ds = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_dtack = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count_shot_out_regNext = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_ds_regNext = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__dff_1_q = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_posarea_counter = VL_RAND_RESET_I(8);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__dff_1__DOT__dff_area_buffer = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_readError = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_readData = VL_RAND_RESET_I(16);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_doWrite = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_doRead = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg0 = VL_RAND_RESET_I(16);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_1 = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg1 = VL_RAND_RESET_I(16);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_0 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg2 = VL_RAND_RESET_I(16);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_3 = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg3 = VL_RAND_RESET_I(16);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_1 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg4 = VL_RAND_RESET_I(16);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_5 = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg5 = VL_RAND_RESET_I(16);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_2 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg6 = VL_RAND_RESET_I(16);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_7 = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg7 = VL_RAND_RESET_I(16);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_3 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg8 = VL_RAND_RESET_I(16);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_9 = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg9 = VL_RAND_RESET_I(16);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_4 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg10 = VL_RAND_RESET_I(16);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_11 = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg11 = VL_RAND_RESET_I(16);
    Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_5 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A_io_clear = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B_io_clear = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT___zz_gssl_txarea_roms_port0 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A_io_full = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a_GSSL_TXCT0 = VL_RAND_RESET_I(3);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B_io_full = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b_GSSL_TXCT0 = VL_RAND_RESET_I(3);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c_GSSL_TXCT0 = VL_RAND_RESET_I(3);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_0 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_1 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_2 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_3 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_4 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_5 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_6 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_7 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_8 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_9 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_10 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_11 = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_rx_done_b = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_rx_b_ttctriger = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_done_b_delay1 = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_done_b_delay2 = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b_rx_frame_done_delay_1 = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b_rx_frame_done_delay_2 = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_b_ttctriger_delay1 = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_b_ttctriger_delay2 = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_1 = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_2 = VL_RAND_RESET_I(1);
    { int __Vi0=0; for (; __Vi0<256; ++__Vi0) {
            Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_roms[__Vi0] = VL_RAND_RESET_I(32);
    }}
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__gsslResetUnbuffered = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__GSSL_Reset_Counter = VL_RAND_RESET_I(22);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__when_CYP1401_l91 = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__gsslResetUnbuffered_regNext = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT___zz_counter = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__counter = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__inhibitFull = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress = VL_RAND_RESET_I(8);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_k = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_data = VL_RAND_RESET_I(8);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_done = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = VL_RAND_RESET_I(4);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state = VL_RAND_RESET_I(4);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = VL_RAND_RESET_I(10);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = VL_RAND_RESET_I(10);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = VL_RAND_RESET_I(9);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT___zz_counter = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__counter = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__inhibitFull = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress = VL_RAND_RESET_I(8);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_k = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_data = VL_RAND_RESET_I(8);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_done = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = VL_RAND_RESET_I(4);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state = VL_RAND_RESET_I(4);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = VL_RAND_RESET_I(10);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = VL_RAND_RESET_I(10);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = VL_RAND_RESET_I(9);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress = VL_RAND_RESET_I(8);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_k = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_data = VL_RAND_RESET_I(8);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_done = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = VL_RAND_RESET_I(4);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state = VL_RAND_RESET_I(4);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = VL_RAND_RESET_I(10);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = VL_RAND_RESET_I(10);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = VL_RAND_RESET_I(9);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_data = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_waddress = VL_RAND_RESET_I(8);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_wr = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_status_data = VL_RAND_RESET_I(8);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_done = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out = VL_RAND_RESET_I(8);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = VL_RAND_RESET_I(4);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state = VL_RAND_RESET_I(4);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs = VL_RAND_RESET_I(10);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n = VL_RAND_RESET_I(10);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter = VL_RAND_RESET_I(9);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gssl_rx_led__DOT__counter = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gssl_rx_led__DOT__when_CYP1401_l208 = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_dpram_data = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_dpram_waddress = VL_RAND_RESET_I(8);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_dpram_wr = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_status_data = VL_RAND_RESET_I(8);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_busy = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_done = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out = VL_RAND_RESET_I(8);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = VL_RAND_RESET_I(4);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state = VL_RAND_RESET_I(4);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs = VL_RAND_RESET_I(10);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n = VL_RAND_RESET_I(10);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = VL_RAND_RESET_I(1);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter = VL_RAND_RESET_I(9);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gssl_rx_led__DOT__counter = VL_RAND_RESET_I(32);
    Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gssl_rx_led__DOT__when_CYP1401_l208 = VL_RAND_RESET_I(1);
    __Vdly__Top_Module_Test__DOT__gssl_area_ledtemp = VL_RAND_RESET_I(1);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__GSSL_Reset_Counter = VL_RAND_RESET_I(22);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = VL_RAND_RESET_I(4);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state = VL_RAND_RESET_I(4);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = VL_RAND_RESET_I(32);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = VL_RAND_RESET_I(10);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = VL_RAND_RESET_I(10);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = VL_RAND_RESET_I(9);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = VL_RAND_RESET_I(1);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = VL_RAND_RESET_I(4);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state = VL_RAND_RESET_I(4);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = VL_RAND_RESET_I(32);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = VL_RAND_RESET_I(10);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = VL_RAND_RESET_I(10);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = VL_RAND_RESET_I(9);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = VL_RAND_RESET_I(1);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = VL_RAND_RESET_I(4);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state = VL_RAND_RESET_I(4);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = VL_RAND_RESET_I(32);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = VL_RAND_RESET_I(10);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = VL_RAND_RESET_I(10);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = VL_RAND_RESET_I(9);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = VL_RAND_RESET_I(1);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT___zz_gssl_txarea_roms_port0 = VL_RAND_RESET_I(32);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp = VL_RAND_RESET_I(32);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__counter = VL_RAND_RESET_I(32);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__counter = VL_RAND_RESET_I(32);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = VL_RAND_RESET_I(4);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state = VL_RAND_RESET_I(4);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data = VL_RAND_RESET_I(32);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = VL_RAND_RESET_I(1);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter = VL_RAND_RESET_I(9);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs = VL_RAND_RESET_I(10);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gssl_rx_led__DOT__counter = VL_RAND_RESET_I(32);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state = VL_RAND_RESET_I(4);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state = VL_RAND_RESET_I(4);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data = VL_RAND_RESET_I(32);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag = VL_RAND_RESET_I(1);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter = VL_RAND_RESET_I(9);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs = VL_RAND_RESET_I(10);
    __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gssl_rx_led__DOT__counter = VL_RAND_RESET_I(32);
    __VinpClk__TOP__Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf = VL_RAND_RESET_I(1);
    __Vchglast__TOP__Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf = VL_RAND_RESET_I(1);
    __Vm_traceActivity = 0;
}
