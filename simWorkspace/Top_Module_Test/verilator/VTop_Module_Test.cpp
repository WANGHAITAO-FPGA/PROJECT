// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VTop_Module_Test.h for the primary calling header

#include "VTop_Module_Test.h"
#include "VTop_Module_Test__Syms.h"

//==========

void VTop_Module_Test::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VTop_Module_Test::eval\n"); );
    VTop_Module_Test__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
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
            VL_FATAL_MT("D:/SCALA/SRIO/tmp/job_1/Top_Module_Test.v", 6, "",
                "Verilated model didn't converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

void VTop_Module_Test::_eval_initial_loop(VTop_Module_Test__Syms* __restrict vlSymsp) {
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
            VL_FATAL_MT("D:/SCALA/SRIO/tmp/job_1/Top_Module_Test.v", 6, "",
                "Verilated model didn't DC converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

VL_INLINE_OPT void VTop_Module_Test::_combo__TOP__2(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_combo__TOP__2\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->vme_iackout = vlTOPp->vme_iackin;
    vlTOPp->cyp1401_GSSL_REFCLK_ABCD = (1U & (~ (IData)(vlTOPp->gssl_clk)));
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_addr_pass_data1 
        = ((((0x39U == (IData)(vlTOPp->vme_am)) | (0x3dU 
                                                   == (IData)(vlTOPp->vme_am))) 
            & (IData)(vlTOPp->vme_lword)) & (IData)(vlTOPp->vme_iack));
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
    vlTOPp->datadir = ((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_addr_pass_data) 
                       & (IData)(vlTOPp->vme_write));
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__5(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__5\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_posarea_counter 
        = ((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__dff_1_q)
            ? (0xffU & ((IData)(1U) + (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_posarea_counter)))
            : 0U);
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__6(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__6\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__counter 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__counter;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__counter 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__counter;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT___zz_gssl_txarea_roms_port0 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT___zz_gssl_txarea_roms_port0;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp;
    if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__gsslResetUnbuffered_regNext) {
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__counter 
            = (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__counter 
               + vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT___zz_counter);
    }
    if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B_io_clear) {
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__counter = 0U;
    }
    if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__gsslResetUnbuffered_regNext) {
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__counter 
            = (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__counter 
               + vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT___zz_counter);
    }
    if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A_io_clear) {
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__counter = 0U;
    }
    if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd) {
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT___zz_gssl_txarea_roms_port0 
            = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_roms
            [vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress];
    }
    if (((0x41U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress)) 
         & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd))) {
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp 
            = vlTOPp->Top_Module_Test__DOT__vme_area_vme_data_0;
    } else {
        if (((0x42U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress)) 
             & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd))) {
            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp 
                = vlTOPp->Top_Module_Test__DOT__vme_area_vme_data_1;
        } else {
            if (((0x43U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress)) 
                 & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd))) {
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp 
                    = vlTOPp->Top_Module_Test__DOT__vme_area_vme_data_2;
            } else {
                if (((0x44U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress)) 
                     & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd))) {
                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp 
                        = vlTOPp->Top_Module_Test__DOT__vme_area_vme_data_3;
                } else {
                    if (((0x45U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress)) 
                         & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp 
                            = vlTOPp->Top_Module_Test__DOT__vme_area_vme_data_4;
                    } else {
                        if (((0x46U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress)) 
                             & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd))) {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp 
                                = vlTOPp->Top_Module_Test__DOT__vme_area_vme_data_5;
                        } else {
                            if (((0x47U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress)) 
                                 & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd))) {
                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp 
                                    = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_0;
                            } else {
                                if (((0x48U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress)) 
                                     & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd))) {
                                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp 
                                        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_1;
                                } else {
                                    if (((0x49U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress)) 
                                         & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd))) {
                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp 
                                            = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_2;
                                    } else {
                                        if (((0x4aU 
                                              == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress)) 
                                             & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd))) {
                                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp 
                                                = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_3;
                                        } else {
                                            if (((0x4bU 
                                                  == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress)) 
                                                 & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd))) {
                                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp 
                                                    = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_4;
                                            } else {
                                                if (
                                                    ((0x4cU 
                                                      == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress)) 
                                                     & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd))) {
                                                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp 
                                                        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_5;
                                                } else {
                                                    if (
                                                        ((0x4dU 
                                                          == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress)) 
                                                         & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd))) {
                                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp 
                                                            = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_6;
                                                    } else {
                                                        if (
                                                            ((0x4eU 
                                                              == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress)) 
                                                             & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd))) {
                                                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp 
                                                                = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_7;
                                                        } else {
                                                            if (
                                                                ((0x4fU 
                                                                  == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress)) 
                                                                 & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd))) {
                                                                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp 
                                                                    = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_8;
                                                            } else {
                                                                if (
                                                                    ((0x50U 
                                                                      == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress)) 
                                                                     & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd))) {
                                                                    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp 
                                                                        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_9;
                                                                } else {
                                                                    if (
                                                                        ((0x51U 
                                                                          == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress)) 
                                                                         & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd))) {
                                                                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp 
                                                                            = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_10;
                                                                    } else {
                                                                        if (
                                                                            ((0x52U 
                                                                              == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress)) 
                                                                             & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd))) {
                                                                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp 
                                                                                = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_11;
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__8(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__8\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_readError = 0U;
    } else {
        if (vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_doRead) {
            vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_readError 
                = (1U & (((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr) 
                          >> 0xeU) | (((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr) 
                                       >> 0xdU) | (
                                                   ((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr) 
                                                    >> 0xcU) 
                                                   | (((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr) 
                                                       >> 0xbU) 
                                                      | (((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr) 
                                                          >> 0xaU) 
                                                         | (((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr) 
                                                             >> 9U) 
                                                            | (((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr) 
                                                                >> 8U) 
                                                               | (((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr) 
                                                                   >> 7U) 
                                                                  | ((0x40U 
                                                                      & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                      ? 
                                                                     (((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr) 
                                                                       >> 5U) 
                                                                      | (((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr) 
                                                                          >> 4U) 
                                                                         | (((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr) 
                                                                             >> 3U) 
                                                                            | (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))))
                                                                      : (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr)))))))))));
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_dtack = 1U;
    } else {
        if ((((~ (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__dff_1_q)) 
              & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count_shot_out_regNext)) 
             | ((IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_ds) 
                & (~ (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_ds_regNext))))) {
            vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_dtack 
                = vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_ds;
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_readData = 0U;
    } else {
        if (vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_doRead) {
            vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_readData 
                = ((0x4000U & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                    ? 0U : ((0x2000U & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                             ? 0U : ((0x1000U & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                      ? 0U : ((0x800U 
                                               & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                               ? 0U
                                               : ((0x400U 
                                                   & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                   ? 0U
                                                   : 
                                                  ((0x200U 
                                                    & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                    ? 0U
                                                    : 
                                                   ((0x100U 
                                                     & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                     ? 0U
                                                     : 
                                                    ((0x80U 
                                                      & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                      ? 0U
                                                      : 
                                                     (0xffffU 
                                                      & ((0x40U 
                                                          & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                          ? 
                                                         ((0x20U 
                                                           & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                           ? 0U
                                                           : 
                                                          ((0x10U 
                                                            & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                            ? 0U
                                                            : 
                                                           ((8U 
                                                             & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                             ? 0U
                                                             : 
                                                            ((4U 
                                                              & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                              ? 
                                                             ((2U 
                                                               & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                               ? 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_11)
                                                               : 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : 
                                                               (vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_11 
                                                                >> 0x10U)))
                                                              : 
                                                             ((2U 
                                                               & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                               ? 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_10)
                                                               : 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : 
                                                               (vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_10 
                                                                >> 0x10U)))))))
                                                          : 
                                                         ((0x20U 
                                                           & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                           ? 
                                                          ((0x10U 
                                                            & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                            ? 
                                                           ((8U 
                                                             & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                             ? 
                                                            ((4U 
                                                              & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                              ? 
                                                             ((2U 
                                                               & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                               ? 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_9)
                                                               : 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : 
                                                               (vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_9 
                                                                >> 0x10U)))
                                                              : 
                                                             ((2U 
                                                               & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                               ? 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_8)
                                                               : 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : 
                                                               (vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_8 
                                                                >> 0x10U))))
                                                             : 
                                                            ((4U 
                                                              & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                              ? 
                                                             ((2U 
                                                               & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                               ? 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_7)
                                                               : 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : 
                                                               (vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_7 
                                                                >> 0x10U)))
                                                              : 
                                                             ((2U 
                                                               & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                               ? 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_6)
                                                               : 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : 
                                                               (vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_6 
                                                                >> 0x10U)))))
                                                            : 
                                                           ((8U 
                                                             & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                             ? 
                                                            ((4U 
                                                              & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                              ? 
                                                             ((2U 
                                                               & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                               ? 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_5)
                                                               : 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : 
                                                               (vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_5 
                                                                >> 0x10U)))
                                                              : 
                                                             ((2U 
                                                               & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                               ? 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_4)
                                                               : 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : 
                                                               (vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_4 
                                                                >> 0x10U))))
                                                             : 
                                                            ((4U 
                                                              & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                              ? 
                                                             ((2U 
                                                               & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                               ? 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_3)
                                                               : 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : 
                                                               (vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_3 
                                                                >> 0x10U)))
                                                              : 
                                                             ((2U 
                                                               & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                               ? 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_2)
                                                               : 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : 
                                                               (vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_2 
                                                                >> 0x10U))))))
                                                           : 
                                                          ((0x10U 
                                                            & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                            ? 
                                                           ((8U 
                                                             & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                             ? 
                                                            ((4U 
                                                              & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                              ? 
                                                             ((2U 
                                                               & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                               ? 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_1)
                                                               : 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : 
                                                               (vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_1 
                                                                >> 0x10U)))
                                                              : 
                                                             ((2U 
                                                               & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                               ? 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_0)
                                                               : 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : 
                                                               (vlTOPp->Top_Module_Test__DOT__vme_area_sensor_data_0 
                                                                >> 0x10U))))
                                                             : 
                                                            ((4U 
                                                              & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                              ? 
                                                             ((2U 
                                                               & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                               ? 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg11))
                                                               : 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg10)))
                                                              : 
                                                             ((2U 
                                                               & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                               ? 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg9))
                                                               : 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg8)))))
                                                            : 
                                                           ((8U 
                                                             & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                             ? 
                                                            ((4U 
                                                              & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                              ? 
                                                             ((2U 
                                                               & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                               ? 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg7))
                                                               : 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg6)))
                                                              : 
                                                             ((2U 
                                                               & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                               ? 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg5))
                                                               : 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg4))))
                                                             : 
                                                            ((4U 
                                                              & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                              ? 
                                                             ((2U 
                                                               & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                               ? 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg3))
                                                               : 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg2)))
                                                              : 
                                                             ((2U 
                                                               & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                               ? 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg1))
                                                               : 
                                                              ((1U 
                                                                & (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr))
                                                                ? 0U
                                                                : (IData)(vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg0)))))))))))))))));
        }
    }
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__9(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__9\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->vme_dtack = vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_dtack;
    vlTOPp->data_write = vlTOPp->Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_readData;
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__11(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__11\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_dpram_waddress = 0U;
    } else {
        if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_dpram_waddress 
                = (0xffU & (((vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data 
                              >> 8U) + (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter)) 
                            - (IData)(1U)));
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_dpram_data = 0U;
    } else {
        if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_dpram_data 
                = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg;
        }
    }
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__13(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__13\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__GSSL_Reset_Counter 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__GSSL_Reset_Counter;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_busy 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_busy;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_ledtemp 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_ledtemp;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_busy 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_busy;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_busy 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_busy;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state;
    if (vlTOPp->reset) {
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__GSSL_Reset_Counter = 0U;
    } else {
        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__when_CYP1401_l91) {
            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__GSSL_Reset_Counter 
                = (0x3fffffU & ((IData)(1U) + vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__GSSL_Reset_Counter));
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__inhibitFull = 0U;
    } else {
        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__gsslResetUnbuffered_regNext) {
            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__inhibitFull 
                = (0x9c4U == vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__counter);
        }
        if ((0x9c4U <= vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__counter)) {
            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__inhibitFull = 0U;
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__inhibitFull = 0U;
    } else {
        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__gsslResetUnbuffered_regNext) {
            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__inhibitFull 
                = (0x1388U == vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__counter);
        }
        if ((0x1388U <= vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__counter)) {
            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__inhibitFull = 0U;
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_data = 5U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = 0U;
    } else {
        if ((8U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_data = 5U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = 0U;
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_data = 1U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 1U;
                    } else {
                        if ((0x12U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter))) {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 0xbU;
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 0xbU;
                        } else {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 5U;
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 5U;
                        }
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_data = 5U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter 
                            = ((0x12U > (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter))
                                ? (0x1ffU & ((IData)(1U) 
                                             + (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter)))
                                : 0U);
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 0xaU;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 0xaU;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_k = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_data 
                            = (0xffU & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n));
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
                            = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 9U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 9U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_k = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_data 
                            = (0xffU & (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
                                        >> 0x18U));
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n 
                            = (0x3ffU & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs)));
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = 0U;
                    }
                }
            }
        } else {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs 
                            = (0x3ffU & ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs) 
                                         - (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter)));
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 8U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 8U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_k = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_data 
                            = (0xffU & (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
                                        >> 0x10U));
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                        if ((0x12U > (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = 1U;
                        }
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 7U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 7U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_k = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_data 
                            = (0xffU & (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
                                        >> 8U));
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress 
                            = (0xffU & ((IData)(0x41U) 
                                        + (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter)));
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs 
                            = (0x3ffU & (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs) 
                                          + (0xffU 
                                             & (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
                                                >> 0x10U))) 
                                         + (0xffU & 
                                            (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
                                             >> 0x18U))));
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 6U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 6U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_k = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_data 
                            = (0xffU & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg);
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs 
                            = (0x3ffU & ((IData)(0x12U) 
                                         + ((0xffU 
                                             & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg) 
                                            + (0xffU 
                                               & (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
                                                  >> 8U)))));
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 5U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 5U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_data = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = 0x4112U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = 0U;
                    }
                }
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
                            = ((8U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                ? ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                    ? 0U : ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                             ? ((1U 
                                                 & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                                 ? 0xbU
                                                 : 0xaU)
                                             : ((1U 
                                                 & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                                 ? 9U
                                                 : 8U)))
                                : ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                    ? ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                        ? ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                            ? 7U : 6U)
                                        : ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                            ? 5U : 0U))
                                    : ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                        ? 0U : ((1U 
                                                 & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                                 ? 1U
                                                 : 
                                                ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A_io_full)
                                                  ? 4U
                                                  : 0U)))));
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_k = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_data = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state 
                            = ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_busy)
                                ? (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state)
                                : 0U);
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 3U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_data = 4U;
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
                            = ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A_io_full)
                                ? 4U : 0U);
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_data = 2U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
                            = ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A_io_full)
                                ? 4U : 0U);
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_data = 5U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = 0U;
                    }
                }
            }
        }
    }
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__14(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__14\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (vlTOPp->reset) {
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_ledtemp = 0U;
    } else {
        if ((0x3b9ac9fU == vlTOPp->Top_Module_Test__DOT__gssl_area_counter_value)) {
            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_ledtemp 
                = (1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_ledtemp)));
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_data = 5U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = 0U;
    } else {
        if ((8U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_data = 5U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = 0U;
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_data = 1U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 1U;
                    } else {
                        if ((0xcU == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter))) {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 0xbU;
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 0xbU;
                        } else {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 5U;
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 5U;
                        }
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_data = 5U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter 
                            = ((0xcU > (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter))
                                ? (0x1ffU & ((IData)(1U) 
                                             + (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter)))
                                : 0U);
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 0xaU;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 0xaU;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_k = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_data 
                            = (0xffU & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n));
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
                            = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT___zz_gssl_txarea_roms_port0;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 9U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 9U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_k = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_data 
                            = (0xffU & (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
                                        >> 0x18U));
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n 
                            = (0x3ffU & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs)));
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = 0U;
                    }
                }
            }
        } else {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs 
                            = (0x3ffU & ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs) 
                                         - (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter)));
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 8U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 8U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_k = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_data 
                            = (0xffU & (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
                                        >> 0x10U));
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                        if ((0xcU > (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = 1U;
                        }
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 7U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 7U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_k = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_data 
                            = (0xffU & (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
                                        >> 8U));
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress 
                            = (0xffU & ((IData)(0x21U) 
                                        + (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter)));
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs 
                            = (0x3ffU & (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs) 
                                          + (0xffU 
                                             & (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
                                                >> 0x10U))) 
                                         + (0xffU & 
                                            (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
                                             >> 0x18U))));
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 6U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 6U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_k = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_data 
                            = (0xffU & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg);
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs 
                            = (0x3ffU & ((IData)(0xcU) 
                                         + ((0xffU 
                                             & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg) 
                                            + (0xffU 
                                               & (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
                                                  >> 8U)))));
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 5U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 5U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_data = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = 0x210cU;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = 0U;
                    }
                }
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
                            = ((8U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                ? ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                    ? 0U : ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                             ? ((1U 
                                                 & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                                 ? 0xbU
                                                 : 0xaU)
                                             : ((1U 
                                                 & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                                 ? 9U
                                                 : 8U)))
                                : ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                    ? ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                        ? ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                            ? 7U : 6U)
                                        : ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                            ? 5U : 0U))
                                    : ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                        ? 0U : ((1U 
                                                 & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                                 ? 1U
                                                 : 
                                                ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_rx_b_ttctriger)
                                                  ? 4U
                                                  : 0U)))));
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_k = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_data = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state 
                            = ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_busy)
                                ? (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state)
                                : 0U);
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 3U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_data = 4U;
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
                            = ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_rx_b_ttctriger)
                                ? 4U : 0U);
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_data = 2U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
                            = ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_rx_b_ttctriger)
                                ? 4U : 0U);
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_data = 5U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = 0U;
                    }
                }
            }
        }
    }
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__15(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__15\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (vlTOPp->reset) {
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_data = 5U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress = 0U;
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = 0U;
    } else {
        if ((8U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_data = 5U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress = 0U;
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = 0U;
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_data = 1U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 1U;
                    } else {
                        if ((0U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter))) {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
                                = ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_rx_done_b)
                                    ? 2U : 0xbU);
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 0xbU;
                        } else {
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
                                = ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_rx_done_b)
                                    ? 2U : 5U);
                            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 5U;
                        }
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_data = 5U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = 0U;
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
                            = ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_rx_done_b)
                                ? 2U : 0xaU);
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 0xaU;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_k = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_data 
                            = (0xffU & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n));
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
                            = ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_rx_done_b)
                                ? 2U : 9U);
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 9U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_k = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_data 
                            = (0xffU & (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
                                        >> 0x18U));
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n 
                            = (0x3ffU & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs)));
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = 0U;
                    }
                }
            }
        } else {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs 
                            = (0x3ffU & ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs) 
                                         - (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter)));
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
                            = ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_rx_done_b)
                                ? 2U : 8U);
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 8U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_k = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_data 
                            = (0xffU & (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
                                        >> 0x10U));
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
                            = ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_rx_done_b)
                                ? 2U : 7U);
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 7U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_k = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_data 
                            = (0xffU & (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
                                        >> 8U));
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress 
                            = (0xffU & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter));
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs 
                            = (0x3ffU & (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs) 
                                          + (0xffU 
                                             & (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
                                                >> 0x10U))) 
                                         + (0xffU & 
                                            (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
                                             >> 0x18U))));
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
                            = ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_rx_done_b)
                                ? 2U : 6U);
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 6U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_k = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_data 
                            = (0xffU & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg);
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs 
                            = (0x3ffU & ((0xffU & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg) 
                                         + (0xffU & 
                                            (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
                                             >> 8U))));
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
                            = ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_rx_done_b)
                                ? 2U : 5U);
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 5U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_data = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = 0U;
                    }
                }
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
                            = ((8U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                ? ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                    ? 0U : ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                             ? ((1U 
                                                 & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                                 ? 0xbU
                                                 : 0xaU)
                                             : ((1U 
                                                 & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                                 ? 9U
                                                 : 8U)))
                                : ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                    ? ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                        ? ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                            ? 7U : 6U)
                                        : ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                            ? 5U : 0U))
                                    : ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                        ? 0U : ((1U 
                                                 & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state))
                                                 ? 1U
                                                 : 
                                                ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B_io_full)
                                                  ? 1U
                                                  : 0U)))));
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_k = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_data = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state 
                            = ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_busy)
                                ? (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state)
                                : ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B_io_full)
                                    ? 1U : 0U));
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state = 3U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_data = 4U;
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
                            = ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_rx_done_b)
                                ? 2U : 0U);
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_data = 2U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
                            = ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B_io_full)
                                ? 1U : ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_rx_done_b)
                                         ? 2U : 0U));
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_k = 1U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_data = 5U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress = 0U;
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_busy = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_done = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd = 0U;
                    }
                }
            }
        }
    }
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__16(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__16\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__GSSL_Reset_Counter 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__GSSL_Reset_Counter;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_busy 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_busy;
    vlTOPp->Top_Module_Test__DOT__gssl_area_ledtemp 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_ledtemp;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_busy 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_busy;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_busy 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_busy;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__when_CYP1401_l91 
        = (0x3fffffU != vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__GSSL_Reset_Counter);
    vlTOPp->cyp1401_GSSL_TXD_A = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_data;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a_GSSL_TXCT0 
        = (1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a_GSSL_TXCT0));
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a_GSSL_TXCT0 
        = ((6U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a_GSSL_TXCT0)) 
           | (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_k));
    vlTOPp->led = vlTOPp->Top_Module_Test__DOT__gssl_area_ledtemp;
    vlTOPp->Top_Module_Test__DOT__gssl_area_counter_value 
        = ((IData)(vlTOPp->reset) ? 0U : vlTOPp->Top_Module_Test__DOT__gssl_area_counter_valueNext);
    vlTOPp->cyp1401_GSSL_TXD_C = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_data;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c_GSSL_TXCT0 
        = (1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c_GSSL_TXCT0));
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c_GSSL_TXCT0 
        = ((6U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c_GSSL_TXCT0)) 
           | (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_k));
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_rx_b_ttctriger 
        = ((~ (IData)(vlTOPp->reset)) & (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger) 
                                          | (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_b_ttctriger_delay1)) 
                                         | (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_b_ttctriger_delay2)));
    vlTOPp->cyp1401_GSSL_TXD_B = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_data;
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b_GSSL_TXCT0 
        = (1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b_GSSL_TXCT0));
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b_GSSL_TXCT0 
        = ((6U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b_GSSL_TXCT0)) 
           | (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_k));
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_rx_done_b 
        = ((~ (IData)(vlTOPp->reset)) & (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_done) 
                                          | (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_done_b_delay1)) 
                                         | (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_done_b_delay2)));
    vlTOPp->cyp1401_GSSL_TXCT0_A = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a_GSSL_TXCT0;
    vlTOPp->cyp1401_GSSL_TXCT0_C = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c_GSSL_TXCT0;
    vlTOPp->cyp1401_GSSL_TXCT0_B = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b_GSSL_TXCT0;
    vlTOPp->Top_Module_Test__DOT__gssl_area_counter_willClear = 0U;
    if ((0x3b9ac9fU == vlTOPp->Top_Module_Test__DOT__gssl_area_counter_value)) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_counter_willClear = 1U;
    }
    vlTOPp->Top_Module_Test__DOT__gssl_area_counter_valueNext 
        = ((0x3b9ac9fU == vlTOPp->Top_Module_Test__DOT__gssl_area_counter_value)
            ? 0U : (0x3ffffffU & ((IData)(1U) + vlTOPp->Top_Module_Test__DOT__gssl_area_counter_value)));
    if (vlTOPp->Top_Module_Test__DOT__gssl_area_counter_willClear) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_counter_valueNext = 0U;
    }
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__18(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__18\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gssl_rx_led__DOT__counter 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gssl_rx_led__DOT__counter;
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err = 0U;
    } else {
        if ((8U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err 
                = (1U & ((~ ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state) 
                             >> 2U)) & ((~ ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state) 
                                            >> 1U)) 
                                        & ((~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state)) 
                                           & ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) 
                                              | ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state) 
                                                 >> 3U))))));
        } else {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) {
                            if ((2U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err = 0U;
                            } else {
                                if ((4U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err = 0U;
                                } else {
                                    if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err = 0U;
                                    } else {
                                        if ((1U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err = 1U;
                                        }
                                    }
                                }
                            }
                        } else {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err = 1U;
                        }
                    } else {
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err 
                            = (1U & ((~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out)) 
                                     | ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)) 
                                        & ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)) 
                                           & (5U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))))));
                    }
                } else {
                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err 
                        = ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))
                            ? ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) 
                               & ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)) 
                                  & ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)) 
                                     & (5U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)))))
                            : ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) 
                               & ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)) 
                                  & ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)) 
                                     & (5U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))))));
                }
            } else {
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err 
                    = (1U & ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))
                              ? ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))
                                  ? ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) 
                                     & ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)) 
                                        & ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)) 
                                           & (5U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)))))
                                  : ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) 
                                     & ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)) 
                                        & ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)) 
                                           & (5U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))))))
                              : ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))
                                  ? ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) 
                                     & ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)) 
                                        & ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)) 
                                           & (5U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)))))
                                  : ((~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out)) 
                                     | ((0U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)) 
                                        & ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)) 
                                           & ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)) 
                                              & (5U 
                                                 != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)))))))));
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
    } else {
        if ((8U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
                    }
                }
            }
        } else {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) {
                            if ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                if ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                    if ((5U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                        if ((1U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err 
                                                = (
                                                   (0xffU 
                                                    & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter)) 
                                                   != 
                                                   (0xffU 
                                                    & ((IData)(1U) 
                                                       + vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data)));
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) {
                            if ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                if ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                    if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
                        }
                    } else {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
                        }
                    }
                }
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
                        }
                    } else {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
                        }
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
                        }
                    } else {
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
                    }
                }
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
    } else {
        if ((8U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
                    }
                }
            }
        } else {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) {
                            if ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                if ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                    if ((5U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                        if ((1U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out) {
                            if ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                if ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                    if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err 
                                = ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out) 
                                   != (0xffU & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n)));
                        }
                    } else {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
                        }
                    }
                }
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
                        }
                    } else {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
                        }
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
                        }
                    } else {
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
                    }
                }
            }
        }
    }
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__19(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__19\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_done_b_delay1 
        = ((~ (IData)(vlTOPp->reset)) & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b_rx_frame_done_delay_1));
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_done_b_delay2 
        = ((~ (IData)(vlTOPp->reset)) & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b_rx_frame_done_delay_2));
    if (vlTOPp->reset) {
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gssl_rx_led__DOT__counter = 0U;
    } else {
        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_done) {
            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gssl_rx_led__DOT__counter = 0U;
        } else {
            if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gssl_rx_led__DOT__when_CYP1401_l208) {
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gssl_rx_led__DOT__counter 
                    = ((IData)(1U) + vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gssl_rx_led__DOT__counter);
            }
        }
    }
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gssl_rx_led__DOT__counter 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gssl_rx_led__DOT__counter;
    if (vlTOPp->reset) {
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n = 0U;
    } else {
        if ((8U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs = 0U;
            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n = 0U;
        } else {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n = 0U;
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n = 0U;
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n = 0U;
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs 
                            = (0x3ffU & ((IData)(1U) 
                                         + (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs) 
                                             + (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)) 
                                            - (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter))));
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n 
                            = (0x3ffU & (~ (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs) 
                                             + (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)) 
                                            - (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter))));
                    }
                }
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs 
                            = (0x3ffU & ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs) 
                                         + (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)));
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n = 0U;
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs 
                            = (0x3ffU & ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag)
                                          ? (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs) 
                                              + (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)) 
                                             + (0xffU 
                                                & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg))
                                          : (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs) 
                                              + (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out)) 
                                             + (0xffU 
                                                & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data))));
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n = 0U;
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs 
                            = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n = 0U;
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n = 0U;
                    }
                }
            }
        }
    }
    vlTOPp->rx_led = (0xf424U == vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gssl_rx_led__DOT__counter);
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gssl_rx_led__DOT__when_CYP1401_l208 
        = (0xf424U != vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gssl_rx_led__DOT__counter);
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs;
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__21(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__21\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state;
    vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gssl_rx_led__DOT__counter 
        = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gssl_rx_led__DOT__counter;
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err = 0U;
    } else {
        if ((8U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err 
                = (1U & ((~ ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state) 
                             >> 2U)) & ((~ ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state) 
                                            >> 1U)) 
                                        & ((~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state)) 
                                           & ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) 
                                              | ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state) 
                                                 >> 3U))))));
        } else {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) {
                            if ((2U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err = 0U;
                            } else {
                                if ((4U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err = 0U;
                                } else {
                                    if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err = 0U;
                                    } else {
                                        if ((1U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err = 1U;
                                        }
                                    }
                                }
                            }
                        } else {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err = 1U;
                        }
                    } else {
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err 
                            = (1U & ((~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out)) 
                                     | ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)) 
                                        & ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)) 
                                           & (5U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))))));
                    }
                } else {
                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err 
                        = ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))
                            ? ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) 
                               & ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)) 
                                  & ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)) 
                                     & (5U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)))))
                            : ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) 
                               & ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)) 
                                  & ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)) 
                                     & (5U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))))));
                }
            } else {
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err 
                    = (1U & ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))
                              ? ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))
                                  ? ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) 
                                     & ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)) 
                                        & ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)) 
                                           & (5U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)))))
                                  : ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) 
                                     & ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)) 
                                        & ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)) 
                                           & (5U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))))))
                              : ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))
                                  ? ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) 
                                     & ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)) 
                                        & ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)) 
                                           & (5U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)))))
                                  : ((~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out)) 
                                     | ((0U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)) 
                                        & ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)) 
                                           & ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)) 
                                              & (5U 
                                                 != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)))))))));
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
    } else {
        if ((8U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
                    }
                }
            }
        } else {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) {
                            if ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                if ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                    if ((5U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                        if ((1U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err 
                                                = (
                                                   (0xffU 
                                                    & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter)) 
                                                   != 
                                                   (0xffU 
                                                    & ((IData)(1U) 
                                                       + vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data)));
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) {
                            if ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                if ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                    if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
                        }
                    } else {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
                        }
                    }
                }
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
                        }
                    } else {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
                        }
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
                        }
                    } else {
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err = 0U;
                    }
                }
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
    } else {
        if ((8U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
                    }
                }
            }
        } else {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) {
                            if ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                if ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                    if ((5U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                        if ((1U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out) {
                            if ((2U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                if ((4U != (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                    if ((5U == (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out))) {
                                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err 
                                = ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out) 
                                   != (0xffU & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n)));
                        }
                    } else {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
                        }
                    }
                }
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
                        }
                    } else {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
                        }
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        if ((1U & (~ (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out)))) {
                            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
                        }
                    } else {
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err = 0U;
                    }
                }
            }
        }
    }
}

VL_INLINE_OPT void VTop_Module_Test::_sequent__TOP__22(VTop_Module_Test__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop_Module_Test::_sequent__TOP__22\n"); );
    VTop_Module_Test* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_dpram_wr 
        = ((~ (IData)(vlTOPp->reset)) & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b));
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_b_ttctriger_delay1 
        = ((~ (IData)(vlTOPp->reset)) & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_1));
    if (vlTOPp->reset) {
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gssl_rx_led__DOT__counter = 0U;
    } else {
        if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_done) {
            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gssl_rx_led__DOT__counter = 0U;
        } else {
            if (vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gssl_rx_led__DOT__when_CYP1401_l208) {
                vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gssl_rx_led__DOT__counter 
                    = ((IData)(1U) + vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gssl_rx_led__DOT__counter);
            }
        }
    }
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_b_ttctriger_delay2 
        = ((~ (IData)(vlTOPp->reset)) & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_2));
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gssl_rx_led__DOT__counter 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gssl_rx_led__DOT__counter;
    if (vlTOPp->reset) {
        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs = 0U;
        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n = 0U;
    } else {
        if ((8U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
            vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs = 0U;
            vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n = 0U;
        } else {
            if ((4U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n = 0U;
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n = 0U;
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n = 0U;
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs 
                            = (0x3ffU & ((IData)(1U) 
                                         + (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs) 
                                             + (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)) 
                                            - (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter))));
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n 
                            = (0x3ffU & (~ (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs) 
                                             + (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)) 
                                            - (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter))));
                    }
                }
            } else {
                if ((2U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs 
                            = (0x3ffU & ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs) 
                                         + (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)));
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n = 0U;
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs 
                            = (0x3ffU & ((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag)
                                          ? (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs) 
                                              + (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)) 
                                             + (0xffU 
                                                & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg))
                                          : (((IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs) 
                                              + (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out)) 
                                             + (0xffU 
                                                & vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data))));
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n = 0U;
                    }
                } else {
                    if ((1U & (IData)(vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state))) {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs 
                            = vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n = 0U;
                    } else {
                        vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs = 0U;
                        vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n = 0U;
                    }
                }
            }
        }
    }
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gssl_rx_led__DOT__when_CYP1401_l208 
        = (0xf424U != vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gssl_rx_led__DOT__counter);
    vlTOPp->Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs 
        = vlTOPp->__Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs;
}
