// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VGTP_TEST.h for the primary calling header

#include "VGTP_TEST.h"
#include "VGTP_TEST__Syms.h"

//==========

void VGTP_TEST::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VGTP_TEST::eval\n"); );
    VGTP_TEST__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
#ifdef VL_DEBUG
    // Debug assertions
    _eval_debug_assertions();
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
#ifdef VM_TRACE
    // Tracing
#endif  // VM_TRACE
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        vlSymsp->__Vm_activity = true;
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("D:/SCALA/SRIO/tmp/job_1/GTP_TEST.v", 6, "",
                "Verilated model didn't converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

void VGTP_TEST::_eval_initial_loop(VGTP_TEST__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    _eval_initial(vlSymsp);
    vlSymsp->__Vm_activity = true;
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        _eval_settle(vlSymsp);
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("D:/SCALA/SRIO/tmp/job_1/GTP_TEST.v", 6, "",
                "Verilated model didn't DC converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

VL_INLINE_OPT void VGTP_TEST::_sequent__TOP__1(VGTP_TEST__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGTP_TEST::_sequent__TOP__1\n"); );
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__GTP_TEST__DOT__gtx_area_timer_B__DOT__counter 
        = vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__counter;
    vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_3 
        = vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_2;
    vlTOPp->__Vdly__GTP_TEST__DOT__gtx_area_timer_B__DOT__counter 
        = (vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__counter 
           + vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT___zz_counter);
    if (vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_clear) {
        vlTOPp->__Vdly__GTP_TEST__DOT__gtx_area_timer_B__DOT__counter = 0U;
    }
    if (((0U != (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state)) 
         & (IData)(vlTOPp->s_axi_tx_tready))) {
        vlTOPp->GTP_TEST__DOT___zz_gtx_area_mem_port0 
            = vlTOPp->GTP_TEST__DOT__gtx_area_mem[(0xffU 
                                                   & ((IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition)
                                                       ? (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp)
                                                       : 
                                                      ((IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp) 
                                                       - (IData)(1U))))];
    }
    vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_2 
        = vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_1;
    vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full_delay_1 
        = vlTOPp->GTP_TEST__DOT__gtx_area_timer_B_io_full;
}

VL_INLINE_OPT void VGTP_TEST::_sequent__TOP__3(VGTP_TEST__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGTP_TEST::_sequent__TOP__3\n"); );
    VGTP_TEST* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    IData/*31:0*/ __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__Vfuncout;
    IData/*31:0*/ __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__Data;
    IData/*31:0*/ __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__crc;
    IData/*31:0*/ __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d;
    IData/*31:0*/ __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c;
    IData/*31:0*/ __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc;
    // Body
    vlTOPp->__Vdly__GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_beat_cnt 
        = vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_beat_cnt;
    vlTOPp->__Vdly__GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp 
        = vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp;
    if (vlTOPp->log_rst_q) {
        vlTOPp->__Vdly__GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_beat_cnt = 0U;
    } else {
        if (((IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition) 
             & (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tlast))) {
            vlTOPp->__Vdly__GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_beat_cnt = 0U;
        } else {
            if (vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition) {
                vlTOPp->__Vdly__GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_beat_cnt 
                    = (0x3fU & ((IData)(1U) + (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_beat_cnt)));
            }
        }
    }
    if (vlTOPp->log_rst_q) {
        vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__inhibitFull = 0U;
    } else {
        vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__inhibitFull 
            = (0x1f4U == vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__counter);
        if ((0x1f4U <= vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__counter)) {
            vlTOPp->GTP_TEST__DOT__gtx_area_timer_B__DOT__inhibitFull = 0U;
        }
    }
    if (vlTOPp->log_rst_q) {
        vlTOPp->__Vdly__GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp = 0U;
    } else {
        if (((2U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state)) 
             & (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition))) {
            vlTOPp->__Vdly__GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp = 1U;
        } else {
            if (((4U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state)) 
                 & (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition))) {
                vlTOPp->__Vdly__GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp 
                    = (0xffU & ((IData)(1U) + (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp)));
            } else {
                if (((8U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state)) 
                     & (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition))) {
                    vlTOPp->__Vdly__GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp 
                        = (0xffU & ((IData)(1U) + (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__tx_addr_temp)));
                }
            }
        }
    }
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__crc 
        = vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_crc_data;
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__Data 
        = vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_s_axi_tx_tdata;
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
        = __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__Data;
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
        = __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__crc;
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xfffffffeU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (1U & ((((((((((((((((((((((((((__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                             >> 0x1fU) 
                                            ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                               >> 0x1eU)) 
                                           ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                              >> 0x1dU)) 
                                          ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                             >> 0x1cU)) 
                                         ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                            >> 0x1aU)) 
                                        ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                           >> 0x19U)) 
                                       ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                          >> 0x18U)) 
                                      ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                         >> 0x10U)) 
                                     ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                        >> 0xcU)) ^ 
                                    (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                     >> 0xaU)) ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  >> 9U)) 
                                  ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                     >> 6U)) ^ __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d) 
                                ^ __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c) 
                               ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                  >> 6U)) ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             >> 9U)) 
                             ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                >> 0xaU)) ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             >> 0xcU)) 
                           ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                              >> 0x10U)) ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            >> 0x18U)) 
                         ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                            >> 0x19U)) ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          >> 0x1aU)) 
                       ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                          >> 0x1cU)) ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                        >> 0x1dU)) 
                     ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                        >> 0x1eU)) ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                      >> 0x1fU))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xfffffffdU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (2U & ((((((((((((((((((((((((((0x1eU 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                >> 0x1bU)) 
                                            ^ (0x3eU 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  >> 0x1aU))) 
                                           ^ (0x1feU 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 >> 0x17U))) 
                                          ^ (0xfffeU 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                >> 0x10U))) 
                                         ^ (0x1fffeU 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                               >> 0xfU))) 
                                        ^ (0xffffeU 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                              >> 0xcU))) 
                                       ^ (0x1ffffeU 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                             >> 0xbU))) 
                                      ^ (0x3ffffeU 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                            >> 0xaU))) 
                                     ^ (0xfffffeU & 
                                        (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                         >> 8U))) ^ 
                                    (0x3fffffeU & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   >> 6U))) 
                                   ^ (0x7fffffeU & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                       >> 5U))) ^ (0xfffffffeU 
                                                   & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d)) 
                                 ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                    << 1U)) ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               << 1U)) 
                               ^ (0xfffffffeU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c)) 
                              ^ (0x7fffffeU & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               >> 5U))) 
                             ^ (0x3fffffeU & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              >> 6U))) 
                            ^ (0xfffffeU & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            >> 8U))) 
                           ^ (0x3ffffeU & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           >> 0xaU))) 
                          ^ (0x1ffffeU & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          >> 0xbU))) 
                         ^ (0xffffeU & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                        >> 0xcU))) 
                        ^ (0x1fffeU & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       >> 0xfU))) ^ 
                       (0xfffeU & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                   >> 0x10U))) ^ (0x1feU 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                     >> 0x17U))) 
                     ^ (0x3eU & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                 >> 0x1aU))) ^ (0x1eU 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   >> 0x1bU)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xfffffffbU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (4U & ((((((((((((((((((((((((((((((((4U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 0x1dU)) 
                                                  ^ 
                                                  (0xcU 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 0x1cU))) 
                                                 ^ 
                                                 (0xfcU 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 0x18U))) 
                                                ^ (0x3fcU 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 0x16U))) 
                                               ^ (0xfffcU 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 0x10U))) 
                                              ^ (0x1fffcU 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    >> 0xfU))) 
                                             ^ (0x3fffcU 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   >> 0xeU))) 
                                            ^ (0xffffcU 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  >> 0xcU))) 
                                           ^ (0x1ffffcU 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 >> 0xbU))) 
                                          ^ (0x1fffffcU 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                >> 7U))) 
                                         ^ (0x3fffffcU 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                               >> 6U))) 
                                        ^ (0x7fffffcU 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                              >> 5U))) 
                                       ^ (0xffffffcU 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                             >> 4U))) 
                                      ^ (0xfffffffcU 
                                         & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d)) 
                                     ^ (0xfffffffcU 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                           << 1U))) 
                                    ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                       << 2U)) ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  << 2U)) 
                                  ^ (0xfffffffcU & 
                                     (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                      << 1U))) ^ (0xfffffffcU 
                                                  & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c)) 
                                ^ (0xffffffcU & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 >> 4U))) 
                               ^ (0x7fffffcU & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                >> 5U))) 
                              ^ (0x3fffffcU & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               >> 6U))) 
                             ^ (0x1fffffcU & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              >> 7U))) 
                            ^ (0x1ffffcU & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            >> 0xbU))) 
                           ^ (0xffffcU & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          >> 0xcU))) 
                          ^ (0x3fffcU & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                         >> 0xeU))) 
                         ^ (0x1fffcU & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                        >> 0xfU))) 
                        ^ (0xfffcU & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                      >> 0x10U))) ^ 
                       (0x3fcU & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                  >> 0x16U))) ^ (0xfcU 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                    >> 0x18U))) 
                     ^ (0xcU & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                >> 0x1cU))) ^ (4U & 
                                               (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                >> 0x1dU)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xfffffff7U & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (8U & ((((((((((((((((((((((((((((((8U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    >> 0x1cU)) 
                                                ^ (0xf8U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 0x18U))) 
                                               ^ (0x3f8U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 0x16U))) 
                                              ^ (0xfff8U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    >> 0x10U))) 
                                             ^ (0x1fff8U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   >> 0xfU))) 
                                            ^ (0x3fff8U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  >> 0xeU))) 
                                           ^ (0xffff8U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 >> 0xcU))) 
                                          ^ (0x1ffff8U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                >> 0xbU))) 
                                         ^ (0x1fffff8U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                               >> 7U))) 
                                        ^ (0x3fffff8U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                              >> 6U))) 
                                       ^ (0x7fffff8U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                             >> 5U))) 
                                      ^ (0xffffff8U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                            >> 4U))) 
                                     ^ (0xfffffff8U 
                                        & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d)) 
                                    ^ (0xfffffff8U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                          << 1U))) 
                                   ^ (0xfffffff8U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                       << 2U))) ^ (0xfffffff8U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 2U))) 
                                 ^ (0xfffffff8U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   << 1U))) 
                                ^ (0xfffffff8U & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c)) 
                               ^ (0xffffff8U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                >> 4U))) 
                              ^ (0x7fffff8U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               >> 5U))) 
                             ^ (0x3fffff8U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              >> 6U))) 
                            ^ (0x1fffff8U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             >> 7U))) 
                           ^ (0x1ffff8U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           >> 0xbU))) 
                          ^ (0xffff8U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                         >> 0xcU))) 
                         ^ (0x3fff8U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                        >> 0xeU))) 
                        ^ (0x1fff8U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       >> 0xfU))) ^ 
                       (0xfff8U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                   >> 0x10U))) ^ (0x3f8U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                     >> 0x16U))) 
                     ^ (0xf8U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                 >> 0x18U))) ^ (8U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   >> 0x1cU)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xffffffefU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x10U & (((((((((((((((((((((((((((((
                                                   (((((0x10U 
                                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                           >> 0x1bU)) 
                                                       ^ 
                                                       (0x30U 
                                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                           >> 0x1aU))) 
                                                      ^ 
                                                      (0x70U 
                                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                          >> 0x19U))) 
                                                     ^ 
                                                     (0x7f0U 
                                                      & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                         >> 0x15U))) 
                                                    ^ 
                                                    (0xff0U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        >> 0x14U))) 
                                                   ^ 
                                                   (0xfff0U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       >> 0x10U))) 
                                                  ^ 
                                                  (0x1fff0U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 0xfU))) 
                                                 ^ 
                                                 (0x3fff0U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 0xeU))) 
                                                ^ (0x1ffff0U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 0xbU))) 
                                               ^ (0xfffff0U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 8U))) 
                                              ^ (0x1fffff0U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    >> 7U))) 
                                             ^ (0xffffff0U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   >> 4U))) 
                                            ^ (0x3ffffff0U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  >> 2U))) 
                                           ^ (0xfffffff0U 
                                              & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d)) 
                                          ^ (0xfffffff0U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                << 1U))) 
                                         ^ (0xfffffff0U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                               << 2U))) 
                                        ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                           << 4U)) 
                                       ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 4U)) ^ 
                                      (0xfffffff0U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 2U))) 
                                     ^ (0xfffffff0U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 1U))) 
                                    ^ (0xfffffff0U 
                                       & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c)) 
                                   ^ (0x3ffffff0U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       >> 2U))) ^ (0xffffff0U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      >> 4U))) 
                                 ^ (0x1fffff0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  >> 7U))) 
                                ^ (0xfffff0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                >> 8U))) 
                               ^ (0x1ffff0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               >> 0xbU))) 
                              ^ (0x3fff0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             >> 0xeU))) 
                             ^ (0x1fff0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            >> 0xfU))) 
                            ^ (0xfff0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          >> 0x10U))) 
                           ^ (0xff0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                        >> 0x14U))) 
                          ^ (0x7f0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       >> 0x15U))) 
                         ^ (0x70U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                     >> 0x19U))) ^ 
                        (0x30U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                  >> 0x1aU))) ^ (0x10U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                    >> 0x1bU)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xffffffdfU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x20U & (((((((((((((((((((((((((((((
                                                   (0xe0U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       >> 0x18U)) 
                                                   ^ 
                                                   (0x1e0U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       >> 0x17U))) 
                                                  ^ 
                                                  (0x1fe0U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 0x13U))) 
                                                 ^ 
                                                 (0xffe0U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 0x10U))) 
                                                ^ (0x1ffe0U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 0xfU))) 
                                               ^ (0x3ffe0U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 0xeU))) 
                                              ^ (0xffffe0U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    >> 8U))) 
                                             ^ (0x7ffffe0U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   >> 5U))) 
                                            ^ (0x3fffffe0U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  >> 2U))) 
                                           ^ (0x7fffffe0U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 >> 1U))) 
                                          ^ (0xffffffe0U 
                                             & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d)) 
                                         ^ (0xffffffe0U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                               << 1U))) 
                                        ^ (0xffffffe0U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                              << 2U))) 
                                       ^ (0xffffffe0U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                             << 4U))) 
                                      ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                         << 5U)) ^ 
                                     (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                      << 5U)) ^ (0xffffffe0U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                    << 4U))) 
                                   ^ (0xffffffe0U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 2U))) ^ (0xffffffe0U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 1U))) 
                                 ^ (0xffffffe0U & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c)) 
                                ^ (0x7fffffe0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  >> 1U))) 
                               ^ (0x3fffffe0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 >> 2U))) 
                              ^ (0x7ffffe0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               >> 5U))) 
                             ^ (0xffffe0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             >> 8U))) 
                            ^ (0x3ffe0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           >> 0xeU))) 
                           ^ (0x1ffe0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          >> 0xfU))) 
                          ^ (0xffe0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                        >> 0x10U))) 
                         ^ (0x1fe0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       >> 0x13U))) 
                        ^ (0x1e0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                     >> 0x17U))) ^ 
                       (0xe0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                 >> 0x18U)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xffffffbfU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x40U & (((((((((((((((((((((((((((((
                                                   (0xc0U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       >> 0x18U)) 
                                                   ^ 
                                                   (0x1c0U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       >> 0x17U))) 
                                                  ^ 
                                                  (0x1fc0U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 0x13U))) 
                                                 ^ 
                                                 (0xffc0U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 0x10U))) 
                                                ^ (0x1ffc0U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 0xfU))) 
                                               ^ (0x3ffc0U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 0xeU))) 
                                              ^ (0xffffc0U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    >> 8U))) 
                                             ^ (0x7ffffc0U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   >> 5U))) 
                                            ^ (0x3fffffc0U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  >> 2U))) 
                                           ^ (0x7fffffc0U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 >> 1U))) 
                                          ^ (0xffffffc0U 
                                             & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d)) 
                                         ^ (0xffffffc0U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                               << 1U))) 
                                        ^ (0xffffffc0U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                              << 2U))) 
                                       ^ (0xffffffc0U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                             << 4U))) 
                                      ^ (0xffffffc0U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                            << 5U))) 
                                     ^ (0xffffffc0U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 5U))) 
                                    ^ (0xffffffc0U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 4U))) 
                                   ^ (0xffffffc0U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 2U))) ^ (0xffffffc0U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 1U))) 
                                 ^ (0xffffffc0U & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c)) 
                                ^ (0x7fffffc0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  >> 1U))) 
                               ^ (0x3fffffc0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 >> 2U))) 
                              ^ (0x7ffffc0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               >> 5U))) 
                             ^ (0xffffc0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             >> 8U))) 
                            ^ (0x3ffc0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           >> 0xeU))) 
                           ^ (0x1ffc0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          >> 0xfU))) 
                          ^ (0xffc0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                        >> 0x10U))) 
                         ^ (0x1fc0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       >> 0x13U))) 
                        ^ (0x1c0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                     >> 0x17U))) ^ 
                       (0xc0U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                 >> 0x18U)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xffffff7fU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x80U & (((((((((((((((((((((((((((((
                                                   (((0x380U 
                                                      & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                         >> 0x16U)) 
                                                     ^ 
                                                     (0x780U 
                                                      & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                         >> 0x15U))) 
                                                    ^ 
                                                    (0x3f80U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        >> 0x12U))) 
                                                   ^ 
                                                   (0x7f80U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       >> 0x11U))) 
                                                  ^ 
                                                  (0xff80U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 0x10U))) 
                                                 ^ 
                                                 (0x1ff80U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 0xfU))) 
                                                ^ (0x3ff80U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 0xeU))) 
                                               ^ (0x7fff80U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 9U))) 
                                              ^ (0xffff80U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    >> 8U))) 
                                             ^ (0x1fffff80U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   >> 3U))) 
                                            ^ (0x7fffff80U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  >> 1U))) 
                                           ^ (0xffffff80U 
                                              & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d)) 
                                          ^ (0xffffff80U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                << 2U))) 
                                         ^ (0xffffff80U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                               << 4U))) 
                                        ^ (0xffffff80U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                              << 5U))) 
                                       ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                          << 7U)) ^ 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 7U)) ^ (0xffffff80U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                     << 5U))) 
                                    ^ (0xffffff80U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 4U))) 
                                   ^ (0xffffff80U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 2U))) ^ (0xffffff80U 
                                                   & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c)) 
                                 ^ (0x7fffff80U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   >> 1U))) 
                                ^ (0x1fffff80U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  >> 3U))) 
                               ^ (0xffff80U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               >> 8U))) 
                              ^ (0x7fff80U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              >> 9U))) 
                             ^ (0x3ff80U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            >> 0xeU))) 
                            ^ (0x1ff80U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           >> 0xfU))) 
                           ^ (0xff80U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                         >> 0x10U))) 
                          ^ (0x7f80U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                        >> 0x11U))) 
                         ^ (0x3f80U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       >> 0x12U))) 
                        ^ (0x780U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                     >> 0x15U))) ^ 
                       (0x380U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                  >> 0x16U)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xfffffeffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x100U & ((((((((((((((((((((((((((0x100U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    >> 0x17U)) 
                                                ^ (0xf00U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 0x14U))) 
                                               ^ (0x1ff00U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 0xfU))) 
                                              ^ (0x3ff00U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    >> 0xeU))) 
                                             ^ (0x7fff00U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   >> 9U))) 
                                            ^ (0xfffff00U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  >> 4U))) 
                                           ^ (0x1fffff00U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 >> 3U))) 
                                          ^ (0x3fffff00U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                >> 2U))) 
                                         ^ (0xffffff00U 
                                            & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d)) 
                                        ^ (0xffffff00U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                              << 4U))) 
                                       ^ (0xffffff00U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                             << 5U))) 
                                      ^ (0xffffff00U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                            << 7U))) 
                                     ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                        << 8U)) ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   << 8U)) 
                                   ^ (0xffffff00U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 7U))) ^ (0xffffff00U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 5U))) 
                                 ^ (0xffffff00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   << 4U))) 
                                ^ (0xffffff00U & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c)) 
                               ^ (0x3fffff00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 >> 2U))) 
                              ^ (0x1fffff00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                >> 3U))) 
                             ^ (0xfffff00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              >> 4U))) 
                            ^ (0x7fff00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            >> 9U))) 
                           ^ (0x3ff00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          >> 0xeU))) 
                          ^ (0x1ff00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                         >> 0xfU))) 
                         ^ (0xf00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                      >> 0x14U))) ^ 
                        (0x100U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                   >> 0x17U)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xfffffdffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x200U & ((((((((((((((((((((((((0xe00U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  >> 0x14U)) 
                                              ^ (0x1fe00U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    >> 0xfU))) 
                                             ^ (0x3fe00U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   >> 0xeU))) 
                                            ^ (0x7ffe00U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  >> 9U))) 
                                           ^ (0xffffe00U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 >> 4U))) 
                                          ^ (0x1ffffe00U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                >> 3U))) 
                                         ^ (0x3ffffe00U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                               >> 2U))) 
                                        ^ (0xfffffe00U 
                                           & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d)) 
                                       ^ (0xfffffe00U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                             << 4U))) 
                                      ^ (0xfffffe00U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                            << 5U))) 
                                     ^ (0xfffffe00U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                           << 7U))) 
                                    ^ (0xfffffe00U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                          << 8U))) 
                                   ^ (0xfffffe00U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 8U))) ^ (0xfffffe00U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 7U))) 
                                 ^ (0xfffffe00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   << 5U))) 
                                ^ (0xfffffe00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  << 4U))) 
                               ^ (0xfffffe00U & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c)) 
                              ^ (0x3ffffe00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                >> 2U))) 
                             ^ (0x1ffffe00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               >> 3U))) 
                            ^ (0xffffe00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             >> 4U))) 
                           ^ (0x7ffe00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           >> 9U))) 
                          ^ (0x3fe00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                         >> 0xeU))) 
                         ^ (0x1fe00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                        >> 0xfU))) 
                        ^ (0xe00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                     >> 0x14U)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xfffffbffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x400U & ((((((((((((((((((((((((((0x400U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    >> 0x15U)) 
                                                ^ (0x1c00U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 0x13U))) 
                                               ^ (0x3c00U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 0x12U))) 
                                              ^ (0xfc00U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    >> 0x10U))) 
                                             ^ (0x7ffc00U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   >> 9U))) 
                                            ^ (0x3fffc00U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  >> 6U))) 
                                           ^ (0xffffc00U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 >> 4U))) 
                                          ^ (0x1ffffc00U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                >> 3U))) 
                                         ^ (0xfffffc00U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                               << 1U))) 
                                        ^ (0xfffffc00U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                              << 5U))) 
                                       ^ (0xfffffc00U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                             << 7U))) 
                                      ^ (0xfffffc00U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                            << 8U))) 
                                     ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                        << 0xaU)) ^ 
                                    (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                     << 0xaU)) ^ (0xfffffc00U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                     << 8U))) 
                                  ^ (0xfffffc00U & 
                                     (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                      << 7U))) ^ (0xfffffc00U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                     << 5U))) 
                                ^ (0xfffffc00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  << 1U))) 
                               ^ (0x1ffffc00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 >> 3U))) 
                              ^ (0xffffc00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               >> 4U))) 
                             ^ (0x3fffc00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              >> 6U))) 
                            ^ (0x7ffc00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            >> 9U))) 
                           ^ (0xfc00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                         >> 0x10U))) 
                          ^ (0x3c00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                        >> 0x12U))) 
                         ^ (0x1c00U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       >> 0x13U))) 
                        ^ (0x400U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                     >> 0x15U)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xfffff7ffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x800U & ((((((((((((((((((((((((((((
                                                   ((((((0x800U 
                                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                            >> 0x14U)) 
                                                        ^ 
                                                        (0x7800U 
                                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                            >> 0x11U))) 
                                                       ^ 
                                                       (0xf800U 
                                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                           >> 0x10U))) 
                                                      ^ 
                                                      (0x1f800U 
                                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                          >> 0xfU))) 
                                                     ^ 
                                                     (0x3f800U 
                                                      & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                         >> 0xeU))) 
                                                    ^ 
                                                    (0x7f800U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        >> 0xdU))) 
                                                   ^ 
                                                   (0x7ff800U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       >> 9U))) 
                                                  ^ 
                                                  (0x3fff800U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 6U))) 
                                                 ^ 
                                                 (0x7fff800U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 5U))) 
                                                ^ (0xffff800U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 4U))) 
                                               ^ (0x1ffff800U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 3U))) 
                                              ^ (0x7ffff800U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    >> 1U))) 
                                             ^ (0xfffff800U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   << 2U))) 
                                            ^ (0xfffff800U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  << 7U))) 
                                           ^ (0xfffff800U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 << 8U))) 
                                          ^ (0xfffff800U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                << 0xaU))) 
                                         ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                            << 0xbU)) 
                                        ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 0xbU)) 
                                       ^ (0xfffff800U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             << 0xaU))) 
                                      ^ (0xfffff800U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            << 8U))) 
                                     ^ (0xfffff800U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 7U))) 
                                    ^ (0xfffff800U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 2U))) 
                                   ^ (0x7ffff800U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       >> 1U))) ^ (0x1ffff800U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      >> 3U))) 
                                 ^ (0xffff800U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  >> 4U))) 
                                ^ (0x7fff800U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 >> 5U))) 
                               ^ (0x3fff800U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                >> 6U))) 
                              ^ (0x7ff800U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              >> 9U))) 
                             ^ (0x7f800U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            >> 0xdU))) 
                            ^ (0x3f800U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           >> 0xeU))) 
                           ^ (0x1f800U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          >> 0xfU))) 
                          ^ (0xf800U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                        >> 0x10U))) 
                         ^ (0x7800U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       >> 0x11U))) 
                        ^ (0x800U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                     >> 0x14U)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xffffefffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x1000U & (((((((((((((((((((((((((((
                                                   (((((((0x1000U 
                                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                             >> 0x13U)) 
                                                         ^ 
                                                         (0x3000U 
                                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                             >> 0x12U))) 
                                                        ^ 
                                                        (0x1f000U 
                                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                            >> 0xfU))) 
                                                       ^ 
                                                       (0xff000U 
                                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                           >> 0xcU))) 
                                                      ^ 
                                                      (0x7ff000U 
                                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                          >> 9U))) 
                                                     ^ 
                                                     (0x3fff000U 
                                                      & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                         >> 6U))) 
                                                    ^ 
                                                    (0x7fff000U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        >> 5U))) 
                                                   ^ 
                                                   (0x1ffff000U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       >> 3U))) 
                                                  ^ 
                                                  (0x7ffff000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 1U))) 
                                                 ^ 
                                                 (0xfffff000U 
                                                  & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d)) 
                                                ^ (0xfffff000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      << 3U))) 
                                               ^ (0xfffff000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     << 6U))) 
                                              ^ (0xfffff000U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    << 7U))) 
                                             ^ (0xfffff000U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   << 8U))) 
                                            ^ (0xfffff000U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  << 0xaU))) 
                                           ^ (0xfffff000U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 << 0xbU))) 
                                          ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                             << 0xcU)) 
                                         ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            << 0xcU)) 
                                        ^ (0xfffff000U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              << 0xbU))) 
                                       ^ (0xfffff000U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             << 0xaU))) 
                                      ^ (0xfffff000U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            << 8U))) 
                                     ^ (0xfffff000U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 7U))) 
                                    ^ (0xfffff000U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 6U))) 
                                   ^ (0xfffff000U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 3U))) ^ (0xfffff000U 
                                                   & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c)) 
                                 ^ (0x7ffff000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   >> 1U))) 
                                ^ (0x1ffff000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  >> 3U))) 
                               ^ (0x7fff000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                >> 5U))) 
                              ^ (0x3fff000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               >> 6U))) 
                             ^ (0x7ff000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             >> 9U))) 
                            ^ (0xff000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           >> 0xcU))) 
                           ^ (0x1f000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          >> 0xfU))) 
                          ^ (0x3000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                        >> 0x12U))) 
                         ^ (0x1000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       >> 0x13U)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xffffdfffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x2000U & (((((((((((((((((((((((((((
                                                   (((((0x2000U 
                                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                           >> 0x12U)) 
                                                       ^ 
                                                       (0x1e000U 
                                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                           >> 0xfU))) 
                                                      ^ 
                                                      (0xfe000U 
                                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                          >> 0xcU))) 
                                                     ^ 
                                                     (0x7fe000U 
                                                      & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                         >> 9U))) 
                                                    ^ 
                                                    (0x3ffe000U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        >> 6U))) 
                                                   ^ 
                                                   (0x7ffe000U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       >> 5U))) 
                                                  ^ 
                                                  (0x1fffe000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 3U))) 
                                                 ^ 
                                                 (0x7fffe000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 1U))) 
                                                ^ (0xffffe000U 
                                                   & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d)) 
                                               ^ (0xffffe000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     << 3U))) 
                                              ^ (0xffffe000U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    << 6U))) 
                                             ^ (0xffffe000U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   << 7U))) 
                                            ^ (0xffffe000U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  << 8U))) 
                                           ^ (0xffffe000U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 << 0xaU))) 
                                          ^ (0xffffe000U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                << 0xbU))) 
                                         ^ (0xffffe000U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                               << 0xcU))) 
                                        ^ (0xffffe000U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              << 0xcU))) 
                                       ^ (0xffffe000U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             << 0xbU))) 
                                      ^ (0xffffe000U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            << 0xaU))) 
                                     ^ (0xffffe000U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 8U))) 
                                    ^ (0xffffe000U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 7U))) 
                                   ^ (0xffffe000U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 6U))) ^ (0xffffe000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 3U))) 
                                 ^ (0xffffe000U & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c)) 
                                ^ (0x7fffe000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  >> 1U))) 
                               ^ (0x1fffe000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 >> 3U))) 
                              ^ (0x7ffe000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               >> 5U))) 
                             ^ (0x3ffe000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              >> 6U))) 
                            ^ (0x7fe000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            >> 9U))) 
                           ^ (0xfe000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          >> 0xcU))) 
                          ^ (0x1e000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                         >> 0xfU))) 
                         ^ (0x2000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       >> 0x12U)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xffffbfffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x4000U & (((((((((((((((((((((((((((
                                                   (((0x1c000U 
                                                      & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                         >> 0xfU)) 
                                                     ^ 
                                                     (0xfc000U 
                                                      & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                         >> 0xcU))) 
                                                    ^ 
                                                    (0x7fc000U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        >> 9U))) 
                                                   ^ 
                                                   (0x3ffc000U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       >> 6U))) 
                                                  ^ 
                                                  (0x7ffc000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 5U))) 
                                                 ^ 
                                                 (0x1fffc000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 3U))) 
                                                ^ (0x7fffc000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 1U))) 
                                               ^ (0xffffc000U 
                                                  & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d)) 
                                              ^ (0xffffc000U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    << 3U))) 
                                             ^ (0xffffc000U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   << 6U))) 
                                            ^ (0xffffc000U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  << 7U))) 
                                           ^ (0xffffc000U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 << 8U))) 
                                          ^ (0xffffc000U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                << 0xaU))) 
                                         ^ (0xffffc000U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                               << 0xbU))) 
                                        ^ (0xffffc000U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                              << 0xcU))) 
                                       ^ (0xffffc000U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             << 0xcU))) 
                                      ^ (0xffffc000U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            << 0xbU))) 
                                     ^ (0xffffc000U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 0xaU))) 
                                    ^ (0xffffc000U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 8U))) 
                                   ^ (0xffffc000U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 7U))) ^ (0xffffc000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 6U))) 
                                 ^ (0xffffc000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   << 3U))) 
                                ^ (0xffffc000U & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c)) 
                               ^ (0x7fffc000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 >> 1U))) 
                              ^ (0x1fffc000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                >> 3U))) 
                             ^ (0x7ffc000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              >> 5U))) 
                            ^ (0x3ffc000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             >> 6U))) 
                           ^ (0x7fc000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           >> 9U))) 
                          ^ (0xfc000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                         >> 0xcU))) 
                         ^ (0x1c000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                        >> 0xfU)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xffff7fffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x8000U & (((((((((((((((((((((((((((
                                                   (((0x18000U 
                                                      & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                         >> 0xfU)) 
                                                     ^ 
                                                     (0xf8000U 
                                                      & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                         >> 0xcU))) 
                                                    ^ 
                                                    (0x7f8000U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        >> 9U))) 
                                                   ^ 
                                                   (0x3ff8000U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       >> 6U))) 
                                                  ^ 
                                                  (0x7ff8000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 5U))) 
                                                 ^ 
                                                 (0x1fff8000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 3U))) 
                                                ^ (0x7fff8000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 1U))) 
                                               ^ (0xffff8000U 
                                                  & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d)) 
                                              ^ (0xffff8000U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    << 3U))) 
                                             ^ (0xffff8000U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   << 6U))) 
                                            ^ (0xffff8000U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  << 7U))) 
                                           ^ (0xffff8000U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 << 8U))) 
                                          ^ (0xffff8000U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                << 0xaU))) 
                                         ^ (0xffff8000U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                               << 0xbU))) 
                                        ^ (0xffff8000U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                              << 0xcU))) 
                                       ^ (0xffff8000U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             << 0xcU))) 
                                      ^ (0xffff8000U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            << 0xbU))) 
                                     ^ (0xffff8000U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 0xaU))) 
                                    ^ (0xffff8000U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 8U))) 
                                   ^ (0xffff8000U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 7U))) ^ (0xffff8000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 6U))) 
                                 ^ (0xffff8000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   << 3U))) 
                                ^ (0xffff8000U & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c)) 
                               ^ (0x7fff8000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 >> 1U))) 
                              ^ (0x1fff8000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                >> 3U))) 
                             ^ (0x7ff8000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              >> 5U))) 
                            ^ (0x3ff8000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             >> 6U))) 
                           ^ (0x7f8000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           >> 9U))) 
                          ^ (0xf8000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                         >> 0xcU))) 
                         ^ (0x18000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                        >> 0xfU)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xfffeffffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x10000U & ((((((((((((((((((((((((((
                                                   ((0x30000U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        >> 0xeU)) 
                                                    ^ 
                                                    (0x70000U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        >> 0xdU))) 
                                                   ^ 
                                                   (0x3f0000U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       >> 0xaU))) 
                                                  ^ 
                                                  (0xff0000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 8U))) 
                                                 ^ 
                                                 (0x3ff0000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 6U))) 
                                                ^ (0x7ff0000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 5U))) 
                                               ^ (0x1fff0000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 3U))) 
                                              ^ (0x7fff0000U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    >> 1U))) 
                                             ^ (0xffff0000U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   << 3U))) 
                                            ^ (0xffff0000U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  << 4U))) 
                                           ^ (0xffff0000U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 << 8U))) 
                                          ^ (0xffff0000U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                << 0xbU))) 
                                         ^ (0xffff0000U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                               << 0xcU))) 
                                        ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                           << 0x10U)) 
                                       ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 0x10U)) 
                                      ^ (0xffff0000U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            << 0xcU))) 
                                     ^ (0xffff0000U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 0xbU))) 
                                    ^ (0xffff0000U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 8U))) 
                                   ^ (0xffff0000U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 4U))) ^ (0xffff0000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 3U))) 
                                 ^ (0x7fff0000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   >> 1U))) 
                                ^ (0x1fff0000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  >> 3U))) 
                               ^ (0x7ff0000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                >> 5U))) 
                              ^ (0x3ff0000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               >> 6U))) 
                             ^ (0xff0000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             >> 8U))) 
                            ^ (0x3f0000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            >> 0xaU))) 
                           ^ (0x70000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          >> 0xdU))) 
                          ^ (0x30000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                         >> 0xeU)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xfffdffffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x20000U & ((((((((((((((((((((((((((
                                                   ((0x20000U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        >> 0xeU)) 
                                                    ^ 
                                                    (0x60000U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        >> 0xdU))) 
                                                   ^ 
                                                   (0x3e0000U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       >> 0xaU))) 
                                                  ^ 
                                                  (0xfe0000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 8U))) 
                                                 ^ 
                                                 (0x3fe0000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 6U))) 
                                                ^ (0x7fe0000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 5U))) 
                                               ^ (0x1ffe0000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 3U))) 
                                              ^ (0x7ffe0000U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    >> 1U))) 
                                             ^ (0xfffe0000U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   << 3U))) 
                                            ^ (0xfffe0000U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  << 4U))) 
                                           ^ (0xfffe0000U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 << 8U))) 
                                          ^ (0xfffe0000U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                << 0xbU))) 
                                         ^ (0xfffe0000U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                               << 0xcU))) 
                                        ^ (0xfffe0000U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                              << 0x10U))) 
                                       ^ (0xfffe0000U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             << 0x10U))) 
                                      ^ (0xfffe0000U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            << 0xcU))) 
                                     ^ (0xfffe0000U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 0xbU))) 
                                    ^ (0xfffe0000U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 8U))) 
                                   ^ (0xfffe0000U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 4U))) ^ (0xfffe0000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 3U))) 
                                 ^ (0x7ffe0000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   >> 1U))) 
                                ^ (0x1ffe0000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  >> 3U))) 
                               ^ (0x7fe0000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                >> 5U))) 
                              ^ (0x3fe0000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               >> 6U))) 
                             ^ (0xfe0000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             >> 8U))) 
                            ^ (0x3e0000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            >> 0xaU))) 
                           ^ (0x60000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          >> 0xdU))) 
                          ^ (0x20000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                         >> 0xeU)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xfffbffffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x40000U & ((((((((((((((((((((((((((0x40000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 0xdU)) 
                                                  ^ 
                                                  (0x3c0000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 0xaU))) 
                                                 ^ 
                                                 (0xfc0000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 8U))) 
                                                ^ (0x3fc0000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 6U))) 
                                               ^ (0x7fc0000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 5U))) 
                                              ^ (0x1ffc0000U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    >> 3U))) 
                                             ^ (0x7ffc0000U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   >> 1U))) 
                                            ^ (0xfffc0000U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  << 3U))) 
                                           ^ (0xfffc0000U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 << 4U))) 
                                          ^ (0xfffc0000U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                << 8U))) 
                                         ^ (0xfffc0000U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                               << 0xbU))) 
                                        ^ (0xfffc0000U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                              << 0xcU))) 
                                       ^ (0xfffc0000U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                             << 0x10U))) 
                                      ^ (0xfffc0000U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            << 0x10U))) 
                                     ^ (0xfffc0000U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 0xcU))) 
                                    ^ (0xfffc0000U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 0xbU))) 
                                   ^ (0xfffc0000U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 8U))) ^ (0xfffc0000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 4U))) 
                                 ^ (0xfffc0000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   << 3U))) 
                                ^ (0x7ffc0000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  >> 1U))) 
                               ^ (0x1ffc0000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 >> 3U))) 
                              ^ (0x7fc0000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               >> 5U))) 
                             ^ (0x3fc0000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              >> 6U))) 
                            ^ (0xfc0000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            >> 8U))) 
                           ^ (0x3c0000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           >> 0xaU))) 
                          ^ (0x40000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                         >> 0xdU)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xfff7ffffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x80000U & ((((((((((((((((((((((((0x380000U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    >> 0xaU)) 
                                                ^ (0xf80000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 8U))) 
                                               ^ (0x3f80000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 6U))) 
                                              ^ (0x7f80000U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    >> 5U))) 
                                             ^ (0x1ff80000U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   >> 3U))) 
                                            ^ (0x7ff80000U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  >> 1U))) 
                                           ^ (0xfff80000U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 << 3U))) 
                                          ^ (0xfff80000U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                << 4U))) 
                                         ^ (0xfff80000U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                               << 8U))) 
                                        ^ (0xfff80000U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                              << 0xbU))) 
                                       ^ (0xfff80000U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                             << 0xcU))) 
                                      ^ (0xfff80000U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                            << 0x10U))) 
                                     ^ (0xfff80000U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 0x10U))) 
                                    ^ (0xfff80000U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 0xcU))) 
                                   ^ (0xfff80000U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 0xbU))) ^ 
                                  (0xfff80000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  << 8U))) 
                                 ^ (0xfff80000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   << 4U))) 
                                ^ (0xfff80000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  << 3U))) 
                               ^ (0x7ff80000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 >> 1U))) 
                              ^ (0x1ff80000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                >> 3U))) 
                             ^ (0x7f80000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              >> 5U))) 
                            ^ (0x3f80000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             >> 6U))) 
                           ^ (0xf80000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           >> 8U))) 
                          ^ (0x380000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          >> 0xaU)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xffefffffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x100000U & ((((((((((((((((((((((((0x300000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 0xaU)) 
                                                 ^ 
                                                 (0xf00000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 8U))) 
                                                ^ (0x3f00000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 6U))) 
                                               ^ (0x7f00000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 5U))) 
                                              ^ (0x1ff00000U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    >> 3U))) 
                                             ^ (0x7ff00000U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   >> 1U))) 
                                            ^ (0xfff00000U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  << 3U))) 
                                           ^ (0xfff00000U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 << 4U))) 
                                          ^ (0xfff00000U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                << 8U))) 
                                         ^ (0xfff00000U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                               << 0xbU))) 
                                        ^ (0xfff00000U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                              << 0xcU))) 
                                       ^ (0xfff00000U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                             << 0x10U))) 
                                      ^ (0xfff00000U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            << 0x10U))) 
                                     ^ (0xfff00000U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 0xcU))) 
                                    ^ (0xfff00000U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 0xbU))) 
                                   ^ (0xfff00000U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 8U))) ^ (0xfff00000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 4U))) 
                                 ^ (0xfff00000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   << 3U))) 
                                ^ (0x7ff00000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  >> 1U))) 
                               ^ (0x1ff00000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 >> 3U))) 
                              ^ (0x7f00000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               >> 5U))) 
                             ^ (0x3f00000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              >> 6U))) 
                            ^ (0xf00000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            >> 8U))) 
                           ^ (0x300000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           >> 0xaU)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xffdfffffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x200000U & ((((((((((((((((((((((((0x200000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 0xaU)) 
                                                 ^ 
                                                 (0xe00000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 8U))) 
                                                ^ (0x3e00000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 6U))) 
                                               ^ (0x7e00000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 5U))) 
                                              ^ (0x1fe00000U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    >> 3U))) 
                                             ^ (0x7fe00000U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   >> 1U))) 
                                            ^ (0xffe00000U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  << 3U))) 
                                           ^ (0xffe00000U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 << 4U))) 
                                          ^ (0xffe00000U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                << 8U))) 
                                         ^ (0xffe00000U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                               << 0xbU))) 
                                        ^ (0xffe00000U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                              << 0xcU))) 
                                       ^ (0xffe00000U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                             << 0x10U))) 
                                      ^ (0xffe00000U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            << 0x10U))) 
                                     ^ (0xffe00000U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 0xcU))) 
                                    ^ (0xffe00000U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 0xbU))) 
                                   ^ (0xffe00000U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 8U))) ^ (0xffe00000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 4U))) 
                                 ^ (0xffe00000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   << 3U))) 
                                ^ (0x7fe00000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  >> 1U))) 
                               ^ (0x1fe00000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 >> 3U))) 
                              ^ (0x7e00000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               >> 5U))) 
                             ^ (0x3e00000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              >> 6U))) 
                            ^ (0xe00000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            >> 8U))) 
                           ^ (0x200000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           >> 0xaU)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xffbfffffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x400000U & (((((((((((((((((((((((((
                                                   (((0x400000U 
                                                      & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                         >> 9U)) 
                                                     ^ 
                                                     (0x1c00000U 
                                                      & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                         >> 7U))) 
                                                    ^ 
                                                    (0x7c00000U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        >> 5U))) 
                                                   ^ 
                                                   (0xfc00000U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       >> 4U))) 
                                                  ^ 
                                                  (0x3fc00000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      >> 2U))) 
                                                 ^ 
                                                 (0x7fc00000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     >> 1U))) 
                                                ^ (0xffc00000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      << 3U))) 
                                               ^ (0xffc00000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     << 4U))) 
                                              ^ (0xffc00000U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    << 6U))) 
                                             ^ (0xffc00000U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   << 8U))) 
                                            ^ (0xffc00000U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  << 0xaU))) 
                                           ^ (0xffc00000U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 << 0xbU))) 
                                          ^ (0xffc00000U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                << 0xdU))) 
                                         ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                            << 0x16U)) 
                                        ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 0x16U)) 
                                       ^ (0xffc00000U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             << 0xdU))) 
                                      ^ (0xffc00000U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            << 0xbU))) 
                                     ^ (0xffc00000U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 0xaU))) 
                                    ^ (0xffc00000U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 8U))) 
                                   ^ (0xffc00000U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 6U))) ^ (0xffc00000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 4U))) 
                                 ^ (0xffc00000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   << 3U))) 
                                ^ (0x7fc00000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  >> 1U))) 
                               ^ (0x3fc00000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 >> 2U))) 
                              ^ (0xfc00000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               >> 4U))) 
                             ^ (0x7c00000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              >> 5U))) 
                            ^ (0x1c00000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             >> 7U))) 
                           ^ (0x400000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           >> 9U)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xff7fffffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x800000U & (((((((((((((((((((((((((
                                                   (((0x800000U 
                                                      & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                         >> 8U)) 
                                                     ^ 
                                                     (0x3800000U 
                                                      & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                         >> 6U))) 
                                                    ^ 
                                                    (0xf800000U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        >> 4U))) 
                                                   ^ 
                                                   (0x1f800000U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       >> 3U))) 
                                                  ^ 
                                                  (0xff800000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      << 3U))) 
                                                 ^ 
                                                 (0xff800000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     << 4U))) 
                                                ^ (0xff800000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      << 6U))) 
                                               ^ (0xff800000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     << 7U))) 
                                              ^ (0xff800000U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    << 8U))) 
                                             ^ (0xff800000U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   << 0xaU))) 
                                            ^ (0xff800000U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  << 0xeU))) 
                                           ^ (0xff800000U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 << 0x11U))) 
                                          ^ (0xff800000U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                << 0x16U))) 
                                         ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                            << 0x17U)) 
                                        ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 0x17U)) 
                                       ^ (0xff800000U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             << 0x16U))) 
                                      ^ (0xff800000U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            << 0x11U))) 
                                     ^ (0xff800000U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 0xeU))) 
                                    ^ (0xff800000U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 0xaU))) 
                                   ^ (0xff800000U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 8U))) ^ (0xff800000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 7U))) 
                                 ^ (0xff800000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   << 6U))) 
                                ^ (0xff800000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  << 4U))) 
                               ^ (0xff800000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 << 3U))) 
                              ^ (0x1f800000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                >> 3U))) 
                             ^ (0xf800000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              >> 4U))) 
                            ^ (0x3800000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             >> 6U))) 
                           ^ (0x800000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           >> 8U)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xfeffffffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x1000000U & ((((((((((((((((((((((((
                                                   ((0x3000000U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        >> 6U)) 
                                                    ^ 
                                                    (0xf000000U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        >> 4U))) 
                                                   ^ 
                                                   (0x1f000000U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       >> 3U))) 
                                                  ^ 
                                                  (0xff000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      << 3U))) 
                                                 ^ 
                                                 (0xff000000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     << 4U))) 
                                                ^ (0xff000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      << 6U))) 
                                               ^ (0xff000000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     << 7U))) 
                                              ^ (0xff000000U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    << 8U))) 
                                             ^ (0xff000000U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   << 0xaU))) 
                                            ^ (0xff000000U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  << 0xeU))) 
                                           ^ (0xff000000U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 << 0x11U))) 
                                          ^ (0xff000000U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                << 0x16U))) 
                                         ^ (0xff000000U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                               << 0x17U))) 
                                        ^ (0xff000000U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              << 0x17U))) 
                                       ^ (0xff000000U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             << 0x16U))) 
                                      ^ (0xff000000U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            << 0x11U))) 
                                     ^ (0xff000000U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 0xeU))) 
                                    ^ (0xff000000U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 0xaU))) 
                                   ^ (0xff000000U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 8U))) ^ (0xff000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 7U))) 
                                 ^ (0xff000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   << 6U))) 
                                ^ (0xff000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  << 4U))) 
                               ^ (0xff000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 << 3U))) 
                              ^ (0x1f000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                >> 3U))) 
                             ^ (0xf000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              >> 4U))) 
                            ^ (0x3000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             >> 6U)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xfdffffffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x2000000U & ((((((((((((((((((((((((
                                                   ((0x2000000U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        >> 6U)) 
                                                    ^ 
                                                    (0xe000000U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        >> 4U))) 
                                                   ^ 
                                                   (0x1e000000U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       >> 3U))) 
                                                  ^ 
                                                  (0xfe000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      << 3U))) 
                                                 ^ 
                                                 (0xfe000000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     << 4U))) 
                                                ^ (0xfe000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      << 6U))) 
                                               ^ (0xfe000000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     << 7U))) 
                                              ^ (0xfe000000U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    << 8U))) 
                                             ^ (0xfe000000U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   << 0xaU))) 
                                            ^ (0xfe000000U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  << 0xeU))) 
                                           ^ (0xfe000000U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 << 0x11U))) 
                                          ^ (0xfe000000U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                << 0x16U))) 
                                         ^ (0xfe000000U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                               << 0x17U))) 
                                        ^ (0xfe000000U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              << 0x17U))) 
                                       ^ (0xfe000000U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             << 0x16U))) 
                                      ^ (0xfe000000U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            << 0x11U))) 
                                     ^ (0xfe000000U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 0xeU))) 
                                    ^ (0xfe000000U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 0xaU))) 
                                   ^ (0xfe000000U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 8U))) ^ (0xfe000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 7U))) 
                                 ^ (0xfe000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   << 6U))) 
                                ^ (0xfe000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  << 4U))) 
                               ^ (0xfe000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 << 3U))) 
                              ^ (0x1e000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                >> 3U))) 
                             ^ (0xe000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              >> 4U))) 
                            ^ (0x2000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             >> 6U)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xfbffffffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x4000000U & ((((((((((((((((((((((((
                                                   ((((((0x4000000U 
                                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                            >> 5U)) 
                                                        ^ 
                                                        (0x3c000000U 
                                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                            >> 2U))) 
                                                       ^ 
                                                       (0xfc000000U 
                                                        & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d)) 
                                                      ^ 
                                                      (0xfc000000U 
                                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                          << 1U))) 
                                                     ^ 
                                                     (0xfc000000U 
                                                      & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                         << 2U))) 
                                                    ^ 
                                                    (0xfc000000U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        << 3U))) 
                                                   ^ 
                                                   (0xfc000000U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       << 4U))) 
                                                  ^ 
                                                  (0xfc000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      << 6U))) 
                                                 ^ 
                                                 (0xfc000000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     << 7U))) 
                                                ^ (0xfc000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      << 8U))) 
                                               ^ (0xfc000000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     << 0x10U))) 
                                              ^ (0xfc000000U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    << 0x14U))) 
                                             ^ (0xfc000000U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   << 0x16U))) 
                                            ^ (0xfc000000U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  << 0x17U))) 
                                           ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                              << 0x1aU)) 
                                          ^ (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             << 0x1aU)) 
                                         ^ (0xfc000000U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               << 0x17U))) 
                                        ^ (0xfc000000U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              << 0x16U))) 
                                       ^ (0xfc000000U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             << 0x14U))) 
                                      ^ (0xfc000000U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            << 0x10U))) 
                                     ^ (0xfc000000U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 8U))) 
                                    ^ (0xfc000000U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 7U))) 
                                   ^ (0xfc000000U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 6U))) ^ (0xfc000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 4U))) 
                                 ^ (0xfc000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   << 3U))) 
                                ^ (0xfc000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  << 2U))) 
                               ^ (0xfc000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 << 1U))) 
                              ^ (0xfc000000U & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c)) 
                             ^ (0x3c000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               >> 2U))) 
                            ^ (0x4000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             >> 5U)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xf7ffffffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x8000000U & ((((((((((((((((((((((((
                                                   ((((0x38000000U 
                                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                          >> 2U)) 
                                                      ^ 
                                                      (0xf8000000U 
                                                       & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d)) 
                                                     ^ 
                                                     (0xf8000000U 
                                                      & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                         << 1U))) 
                                                    ^ 
                                                    (0xf8000000U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        << 2U))) 
                                                   ^ 
                                                   (0xf8000000U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       << 3U))) 
                                                  ^ 
                                                  (0xf8000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      << 4U))) 
                                                 ^ 
                                                 (0xf8000000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     << 6U))) 
                                                ^ (0xf8000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      << 7U))) 
                                               ^ (0xf8000000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     << 8U))) 
                                              ^ (0xf8000000U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    << 0x10U))) 
                                             ^ (0xf8000000U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   << 0x14U))) 
                                            ^ (0xf8000000U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  << 0x16U))) 
                                           ^ (0xf8000000U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 << 0x17U))) 
                                          ^ (0xf8000000U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                << 0x1aU))) 
                                         ^ (0xf8000000U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               << 0x1aU))) 
                                        ^ (0xf8000000U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              << 0x17U))) 
                                       ^ (0xf8000000U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             << 0x16U))) 
                                      ^ (0xf8000000U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            << 0x14U))) 
                                     ^ (0xf8000000U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 0x10U))) 
                                    ^ (0xf8000000U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 8U))) 
                                   ^ (0xf8000000U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 7U))) ^ (0xf8000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 6U))) 
                                 ^ (0xf8000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   << 4U))) 
                                ^ (0xf8000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  << 3U))) 
                               ^ (0xf8000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 << 2U))) 
                              ^ (0xf8000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                << 1U))) 
                             ^ (0xf8000000U & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c)) 
                            ^ (0x38000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              >> 2U)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xefffffffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x10000000U & (((((((((((((((((((((((
                                                   (((((0x30000000U 
                                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                           >> 2U)) 
                                                       ^ 
                                                       (0xf0000000U 
                                                        & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d)) 
                                                      ^ 
                                                      (0xf0000000U 
                                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                          << 1U))) 
                                                     ^ 
                                                     (0xf0000000U 
                                                      & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                         << 2U))) 
                                                    ^ 
                                                    (0xf0000000U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        << 3U))) 
                                                   ^ 
                                                   (0xf0000000U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       << 4U))) 
                                                  ^ 
                                                  (0xf0000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      << 6U))) 
                                                 ^ 
                                                 (0xf0000000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     << 7U))) 
                                                ^ (0xf0000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      << 8U))) 
                                               ^ (0xf0000000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     << 0x10U))) 
                                              ^ (0xf0000000U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    << 0x14U))) 
                                             ^ (0xf0000000U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   << 0x16U))) 
                                            ^ (0xf0000000U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  << 0x17U))) 
                                           ^ (0xf0000000U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 << 0x1aU))) 
                                          ^ (0xf0000000U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                << 0x1aU))) 
                                         ^ (0xf0000000U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               << 0x17U))) 
                                        ^ (0xf0000000U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              << 0x16U))) 
                                       ^ (0xf0000000U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             << 0x14U))) 
                                      ^ (0xf0000000U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            << 0x10U))) 
                                     ^ (0xf0000000U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 8U))) 
                                    ^ (0xf0000000U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 7U))) 
                                   ^ (0xf0000000U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 6U))) ^ (0xf0000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 4U))) 
                                 ^ (0xf0000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   << 3U))) 
                                ^ (0xf0000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  << 2U))) 
                               ^ (0xf0000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 << 1U))) 
                              ^ (0xf0000000U & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c)) 
                             ^ (0x30000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               >> 2U)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xdfffffffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x20000000U & (((((((((((((((((((((((
                                                   (((((0x20000000U 
                                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                           >> 2U)) 
                                                       ^ 
                                                       (0xe0000000U 
                                                        & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d)) 
                                                      ^ 
                                                      (0xe0000000U 
                                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                          << 1U))) 
                                                     ^ 
                                                     (0xe0000000U 
                                                      & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                         << 2U))) 
                                                    ^ 
                                                    (0xe0000000U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        << 3U))) 
                                                   ^ 
                                                   (0xe0000000U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       << 4U))) 
                                                  ^ 
                                                  (0xe0000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      << 6U))) 
                                                 ^ 
                                                 (0xe0000000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     << 7U))) 
                                                ^ (0xe0000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      << 8U))) 
                                               ^ (0xe0000000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     << 0x10U))) 
                                              ^ (0xe0000000U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    << 0x14U))) 
                                             ^ (0xe0000000U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   << 0x16U))) 
                                            ^ (0xe0000000U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  << 0x17U))) 
                                           ^ (0xe0000000U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 << 0x1aU))) 
                                          ^ (0xe0000000U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                << 0x1aU))) 
                                         ^ (0xe0000000U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               << 0x17U))) 
                                        ^ (0xe0000000U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              << 0x16U))) 
                                       ^ (0xe0000000U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             << 0x14U))) 
                                      ^ (0xe0000000U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            << 0x10U))) 
                                     ^ (0xe0000000U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 8U))) 
                                    ^ (0xe0000000U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 7U))) 
                                   ^ (0xe0000000U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 6U))) ^ (0xe0000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 4U))) 
                                 ^ (0xe0000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   << 3U))) 
                                ^ (0xe0000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  << 2U))) 
                               ^ (0xe0000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 << 1U))) 
                              ^ (0xe0000000U & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c)) 
                             ^ (0x20000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               >> 2U)))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0xbfffffffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x40000000U & (((((((((((((((((((((((
                                                   (((0xc0000000U 
                                                      & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d) 
                                                     ^ 
                                                     (0xc0000000U 
                                                      & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                         << 1U))) 
                                                    ^ 
                                                    (0xc0000000U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        << 2U))) 
                                                   ^ 
                                                   (0xc0000000U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       << 3U))) 
                                                  ^ 
                                                  (0xc0000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      << 4U))) 
                                                 ^ 
                                                 (0xc0000000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     << 6U))) 
                                                ^ (0xc0000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      << 7U))) 
                                               ^ (0xc0000000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     << 8U))) 
                                              ^ (0xc0000000U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    << 0x10U))) 
                                             ^ (0xc0000000U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   << 0x14U))) 
                                            ^ (0xc0000000U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  << 0x16U))) 
                                           ^ (0xc0000000U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 << 0x17U))) 
                                          ^ (0xc0000000U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                << 0x1aU))) 
                                         ^ (0xc0000000U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               << 0x1aU))) 
                                        ^ (0xc0000000U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              << 0x17U))) 
                                       ^ (0xc0000000U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             << 0x16U))) 
                                      ^ (0xc0000000U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            << 0x14U))) 
                                     ^ (0xc0000000U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 0x10U))) 
                                    ^ (0xc0000000U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 8U))) 
                                   ^ (0xc0000000U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 7U))) ^ (0xc0000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 6U))) 
                                 ^ (0xc0000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   << 4U))) 
                                ^ (0xc0000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  << 3U))) 
                               ^ (0xc0000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 << 2U))) 
                              ^ (0xc0000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                << 1U))) 
                             ^ (0xc0000000U & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc 
        = ((0x7fffffffU & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc) 
           | (0x80000000U & (((((((((((((((((((((((
                                                   (((0x80000000U 
                                                      & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d) 
                                                     ^ 
                                                     (0x80000000U 
                                                      & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                         << 1U))) 
                                                    ^ 
                                                    (0x80000000U 
                                                     & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                        << 2U))) 
                                                   ^ 
                                                   (0x80000000U 
                                                    & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                       << 3U))) 
                                                  ^ 
                                                  (0x80000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      << 4U))) 
                                                 ^ 
                                                 (0x80000000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     << 6U))) 
                                                ^ (0x80000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                      << 7U))) 
                                               ^ (0x80000000U 
                                                  & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                     << 8U))) 
                                              ^ (0x80000000U 
                                                 & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                    << 0x10U))) 
                                             ^ (0x80000000U 
                                                & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                   << 0x14U))) 
                                            ^ (0x80000000U 
                                               & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                  << 0x16U))) 
                                           ^ (0x80000000U 
                                              & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                 << 0x17U))) 
                                          ^ (0x80000000U 
                                             & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__d 
                                                << 0x1aU))) 
                                         ^ (0x80000000U 
                                            & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                               << 0x1aU))) 
                                        ^ (0x80000000U 
                                           & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                              << 0x17U))) 
                                       ^ (0x80000000U 
                                          & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                             << 0x16U))) 
                                      ^ (0x80000000U 
                                         & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                            << 0x14U))) 
                                     ^ (0x80000000U 
                                        & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                           << 0x10U))) 
                                    ^ (0x80000000U 
                                       & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                          << 8U))) 
                                   ^ (0x80000000U & 
                                      (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                       << 7U))) ^ (0x80000000U 
                                                   & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                      << 6U))) 
                                 ^ (0x80000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                   << 4U))) 
                                ^ (0x80000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                  << 3U))) 
                               ^ (0x80000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                 << 2U))) 
                              ^ (0x80000000U & (__Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c 
                                                << 1U))) 
                             ^ (0x80000000U & __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__c))));
    __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__Vfuncout 
        = __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__newcrc;
    vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_crc_data 
        = ((IData)(vlTOPp->log_rst_q) ? 0xffffffffU
            : ((((2U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state)) 
                 | (4U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))) 
                | ((8U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state)) 
                   & (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__ireq_advance_condition)))
                ? __Vfunc_GTP_TEST__DOT__gtx_area_gtxtest__DOT__nextCRC32_D32__0__Vfuncout
                : ((0U == (IData)(vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest__DOT__current_state))
                    ? 0xffffffffU : vlTOPp->GTP_TEST__DOT__gtx_area_gtxtest_crc_data)));
}
