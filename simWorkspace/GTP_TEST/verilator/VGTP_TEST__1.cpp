// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VGTP_TEST.h for the primary calling header

#include "VGTP_TEST.h"
#include "VGTP_TEST__Syms.h"

VL_INLINE_OPT void VGTP_TEST::_sequent__TOP__4(VGTP_TEST__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGTP_TEST::_sequent__TOP__4\n"); );
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_beat_cnt 
        = vlTOPp->__Vdly__GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_beat_cnt;
    vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp 
        = vlTOPp->__Vdly__GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp;
    vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state 
        = ((IData)(vlTOPp->log_rst_q) ? 0U : (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__next_state));
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
    vlTOPp->s_axi_tx_tdata = vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tdata;
}

VL_INLINE_OPT void VGTP_TEST::_sequent__TOP__7(VGTP_TEST__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGTP_TEST::_sequent__TOP__7\n"); );
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__counter 
        = vlTOPp->__Vdly__GTP_TEST__DOT__gtx_area_timer_B__DOT__counter;
    vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_clear 
        = (0x1f4U <= vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__counter);
    vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT___zz_counter 
        = (0x1f4U != vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__counter);
}

VL_INLINE_OPT void VGTP_TEST::_combo__TOP__8(VGTP_TEST__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGTP_TEST::_combo__TOP__8\n"); );
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tvalid 
        = ((0U != (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state)) 
           & (IData)(vlTOPp->s_axi_tx_tready));
    vlTOPp->s_axi_tx_tvalid = vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tvalid;
    vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition 
        = ((IData)(vlTOPp->s_axi_tx_tready) & (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tvalid));
    vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tlast 
        = ((0x40U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state)) 
           | ((0x100U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state)) 
              & (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition)));
    vlTOPp->s_axi_tx_tlast = vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tlast;
}

VL_INLINE_OPT void VGTP_TEST::_sequent__TOP__9(VGTP_TEST__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGTP_TEST::_sequent__TOP__9\n"); );
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full 
        = ((0x1f4U == vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__counter) 
           & (~ (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__inhibitFull)));
}

VL_INLINE_OPT void VGTP_TEST::_combo__TOP__10(VGTP_TEST__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGTP_TEST::_combo__TOP__10\n"); );
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
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
}

void VGTP_TEST::_eval(VGTP_TEST__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGTP_TEST::_eval\n"); );
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (((IData)(vlTOPp->log_clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__log_clk)))) {
        vlTOPp->_sequent__TOP__1(vlSymsp);
        vlTOPp->__Vm_traceActivity = (2U | vlTOPp->__Vm_traceActivity);
    }
    if ((((IData)(vlTOPp->log_clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__log_clk))) 
         | ((IData)(vlTOPp->log_rst_q) & (~ (IData)(vlTOPp->__Vclklast__TOP__log_rst_q))))) {
        vlTOPp->__Vm_traceActivity = (4U | vlTOPp->__Vm_traceActivity);
        vlTOPp->_sequent__TOP__3(vlSymsp);
        vlTOPp->_sequent__TOP__4(vlSymsp);
    }
    if (((IData)(vlTOPp->log_clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__log_clk)))) {
        vlTOPp->_sequent__TOP__7(vlSymsp);
        vlTOPp->__Vm_traceActivity = (8U | vlTOPp->__Vm_traceActivity);
    }
    vlTOPp->_combo__TOP__8(vlSymsp);
    vlTOPp->__Vm_traceActivity = (0x10U | vlTOPp->__Vm_traceActivity);
    if ((((IData)(vlTOPp->log_clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__log_clk))) 
         | ((IData)(vlTOPp->log_rst_q) & (~ (IData)(vlTOPp->__Vclklast__TOP__log_rst_q))))) {
        vlTOPp->_sequent__TOP__9(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x20U | vlTOPp->__Vm_traceActivity);
    }
    vlTOPp->_combo__TOP__10(vlSymsp);
    // Final
    vlTOPp->__Vclklast__TOP__log_clk = vlTOPp->log_clk;
    vlTOPp->__Vclklast__TOP__log_rst_q = vlTOPp->log_rst_q;
}

VL_INLINE_OPT QData VGTP_TEST::_change_request(VGTP_TEST__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGTP_TEST::_change_request\n"); );
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    return (vlTOPp->_change_request_1(vlSymsp));
}

VL_INLINE_OPT QData VGTP_TEST::_change_request_1(VGTP_TEST__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGTP_TEST::_change_request_1\n"); );
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void VGTP_TEST::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGTP_TEST::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((log_rst_q & 0xfeU))) {
        Verilated::overWidthError("log_rst_q");}
    if (VL_UNLIKELY((log_clk & 0xfeU))) {
        Verilated::overWidthError("log_clk");}
    if (VL_UNLIKELY((s_axi_tx_tready & 0xfeU))) {
        Verilated::overWidthError("s_axi_tx_tready");}
}
#endif  // VL_DEBUG
