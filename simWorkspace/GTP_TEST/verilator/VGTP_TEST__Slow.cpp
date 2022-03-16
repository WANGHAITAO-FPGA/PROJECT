// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VGTP_TEST.h for the primary calling header

#include "VGTP_TEST.h"
#include "VGTP_TEST__Syms.h"

//==========

VL_CTOR_IMP(VGTP_TEST) {
    VGTP_TEST__Syms* __restrict vlSymsp = __VlSymsp = new VGTP_TEST__Syms(this, name());
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void VGTP_TEST::__Vconfigure(VGTP_TEST__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

VGTP_TEST::~VGTP_TEST() {
    delete __VlSymsp; __VlSymsp=NULL;
}

void VGTP_TEST::_initial__TOP__5(VGTP_TEST__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGTP_TEST::_initial__TOP__5\n"); );
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    WData/*287:0*/ __Vtemp2[9];
    // Body
    __Vtemp2[0U] = 0x2e62696eU;
    __Vtemp2[1U] = 0x5f6d656dU;
    __Vtemp2[2U] = 0x61726561U;
    __Vtemp2[3U] = 0x6774785fU;
    __Vtemp2[4U] = 0x76656c5fU;
    __Vtemp2[5U] = 0x6f706c65U;
    __Vtemp2[6U] = 0x2e765f74U;
    __Vtemp2[7U] = 0x54455354U;
    __Vtemp2[8U] = 0x4754505fU;
    VL_READMEM_N(false, 32, 256, 0, VL_CVT_PACK_STR_NW(9, __Vtemp2)
                 , vlTOPp->GTP_TEST__DOT__gtx_area_mem
                 , 0, ~VL_ULL(0));
}

void VGTP_TEST::_settle__TOP__6(VGTP_TEST__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGTP_TEST::_settle__TOP__6\n"); );
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_clear 
        = (0x1f4U <= vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__counter);
    vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT___zz_counter 
        = (0x1f4U != vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__counter);
    vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tdata = 0U;
    if ((1U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))) {
        vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tdata = 0xffbcU;
    } else {
        if ((2U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))) {
            vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tdata = 1U;
        } else {
            if ((4U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))) {
                vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tdata = 0x3bU;
            } else {
                if ((8U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))) {
                    vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tdata 
                        = vlTOPp->GTP_TEST__DOT___zz_gtx_area_mem_port0;
                } else {
                    if ((0x10U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))) {
                        vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tdata 
                            = vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_crc_data;
                    } else {
                        if ((0x40U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))) {
                            vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tdata = 0xffbdU;
                        } else {
                            if ((0x80U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))) {
                                vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tdata = 0xffbaU;
                            } else {
                                if ((0x100U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))) {
                                    vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tdata = 0xffbbU;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tvalid 
        = ((0U != (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state)) 
           & (IData)(vlTOPp->s_axi_tx_tready));
    vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full 
        = ((0x1f4U == vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__counter) 
           & (~ (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__inhibitFull)));
    vlTOPp->s_axi_tx_tdata = vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tdata;
    vlTOPp->s_axi_tx_tvalid = vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tvalid;
    vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition 
        = ((IData)(vlTOPp->s_axi_tx_tready) & (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tvalid));
    vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__next_state 
        = (((((((((0U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state)) 
                  | (1U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))) 
                 | (2U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))) 
                | (4U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))) 
               | (8U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))) 
              | (0x10U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))) 
             | (0x40U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))) 
            | (0x80U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state)))
            ? ((0U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))
                ? ((((((IData)(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full) 
                       | (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_1)) 
                      | (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_2)) 
                     | (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_3)) 
                    & (IData)(vlTOPp->s_axi_tx_tready))
                    ? 1U : 0U) : ((1U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))
                                   ? ((IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition)
                                       ? 2U : 1U) : 
                                  ((2U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))
                                    ? ((IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition)
                                        ? 4U : 2U) : 
                                   ((4U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))
                                     ? ((IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition)
                                         ? 8U : 4U)
                                     : ((8U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))
                                         ? (((0x3cU 
                                              < (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_beat_cnt)) 
                                             & (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition))
                                             ? 0x10U
                                             : 8U) : 
                                        ((0x10U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))
                                          ? ((IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition)
                                              ? 0x40U
                                              : 0x10U)
                                          : ((0x40U 
                                              == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))
                                              ? ((IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition)
                                                  ? 0U
                                                  : 0x40U)
                                              : ((IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition)
                                                  ? 0x100U
                                                  : 0x80U))))))))
            : ((0x100U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))
                ? ((IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition)
                    ? 0U : 0x100U) : 0U));
    vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tlast 
        = ((0x40U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state)) 
           | ((0x100U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state)) 
              & (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition)));
    vlTOPp->s_axi_tx_tlast = vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tlast;
}

void VGTP_TEST::_eval_initial(VGTP_TEST__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGTP_TEST::_eval_initial\n"); );
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vclklast__TOP__log_clk = vlTOPp->log_clk;
    vlTOPp->__Vclklast__TOP__log_rst_q = vlTOPp->log_rst_q;
    vlTOPp->_initial__TOP__5(vlSymsp);
}

void VGTP_TEST::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGTP_TEST::final\n"); );
    // Variables
    VGTP_TEST__Syms* __restrict vlSymsp = this->__VlSymsp;
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void VGTP_TEST::_eval_settle(VGTP_TEST__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGTP_TEST::_eval_settle\n"); );
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_settle__TOP__6(vlSymsp);
    vlTOPp->__Vm_traceActivity = (1U | vlTOPp->__Vm_traceActivity);
}

void VGTP_TEST::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGTP_TEST::_ctor_var_reset\n"); );
    // Body
    log_rst_q = VL_RAND_RESET_I(1);
    log_clk = VL_RAND_RESET_I(1);
    s_axi_tx_tdata = VL_RAND_RESET_I(32);
    s_axi_tx_tlast = VL_RAND_RESET_I(1);
    s_axi_tx_tvalid = VL_RAND_RESET_I(1);
    s_axi_tx_tready = VL_RAND_RESET_I(1);
    GTP_TEST__DOT__gtx_area_timer_B_io_clear = VL_RAND_RESET_I(1);
    GTP_TEST__DOT___zz_gtx_area_mem_port0 = VL_RAND_RESET_I(32);
    GTP_TEST__DOT__gtx_area_timer_B_io_full = VL_RAND_RESET_I(1);
    GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tdata = VL_RAND_RESET_I(32);
    GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tlast = VL_RAND_RESET_I(1);
    GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tvalid = VL_RAND_RESET_I(1);
    GTP_TEST__DOT__gtx_area_gtxtest_crc_data = VL_RAND_RESET_I(32);
    GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_1 = VL_RAND_RESET_I(1);
    GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_2 = VL_RAND_RESET_I(1);
    GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_3 = VL_RAND_RESET_I(1);
    { int __Vi0=0; for (; __Vi0<256; ++__Vi0) {
            GTP_TEST__DOT__gtx_area_mem[__Vi0] = VL_RAND_RESET_I(32);
    }}
    GTP_TEST__DOT__gtx_area_timer_B__DOT___zz_counter = VL_RAND_RESET_I(32);
    GTP_TEST__DOT__gtx_area_timer_B__DOT__counter = VL_RAND_RESET_I(32);
    GTP_TEST__DOT__gtx_area_timer_B__DOT__inhibitFull = VL_RAND_RESET_I(1);
    GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state = VL_RAND_RESET_I(9);
    GTP_TEST__DOT__gtx_area_gtxtest__DOT__next_state = VL_RAND_RESET_I(9);
    GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition = VL_RAND_RESET_I(1);
    GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_beat_cnt = VL_RAND_RESET_I(6);
    GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp = VL_RAND_RESET_I(8);
    __Vdly__GTP_TEST__DOT__gtx_area_timer_B__DOT__counter = VL_RAND_RESET_I(32);
    __Vdly__GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_beat_cnt = VL_RAND_RESET_I(6);
    __Vdly__GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp = VL_RAND_RESET_I(8);
    __Vm_traceActivity = 0;
}
