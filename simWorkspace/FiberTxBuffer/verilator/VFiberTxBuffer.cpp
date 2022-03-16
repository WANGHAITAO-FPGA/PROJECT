// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VFiberTxBuffer.h for the primary calling header

#include "VFiberTxBuffer.h"
#include "VFiberTxBuffer__Syms.h"

//==========

void VFiberTxBuffer::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VFiberTxBuffer::eval\n"); );
    VFiberTxBuffer__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
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
            VL_FATAL_MT("D:/SCALA/SRIO/tmp/job_1/FiberTxBuffer.v", 6, "",
                "Verilated model didn't converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

void VFiberTxBuffer::_eval_initial_loop(VFiberTxBuffer__Syms* __restrict vlSymsp) {
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
            VL_FATAL_MT("D:/SCALA/SRIO/tmp/job_1/FiberTxBuffer.v", 6, "",
                "Verilated model didn't DC converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

VL_INLINE_OPT void VFiberTxBuffer::_sequent__TOP__2(VFiberTxBuffer__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VFiberTxBuffer::_sequent__TOP__2\n"); );
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__FiberTxBuffer__DOT__popToPush__DOT__pushArea_target 
        = vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_target;
    vlTOPp->__Vdly__FiberTxBuffer__DOT__pop_currentPtr 
        = vlTOPp->FiberTxBuffer__DOT__pop_currentPtr;
    vlTOPp->FiberTxBuffer__DOT__pop_cleanup = ((~ (IData)(vlTOPp->popclk_reset)) 
                                               & (IData)(vlTOPp->io_pop_last));
    if (vlTOPp->popclk_reset) {
        vlTOPp->__Vdly__FiberTxBuffer__DOT__popToPush__DOT__pushArea_target = 0U;
    } else {
        if (vlTOPp->FiberTxBuffer__DOT__popToPush_io_input_ready) {
            vlTOPp->__Vdly__FiberTxBuffer__DOT__popToPush__DOT__pushArea_target 
                = (1U & (~ (IData)(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_target)));
        }
    }
    if (vlTOPp->popclk_reset) {
        vlTOPp->__Vdly__FiberTxBuffer__DOT__pop_currentPtr = 0U;
    } else {
        if (((IData)(vlTOPp->FiberTxBuffer__DOT__pop_cmd_valid) 
             & (IData)(vlTOPp->FiberTxBuffer__DOT__pop_cmd_ready))) {
            vlTOPp->__Vdly__FiberTxBuffer__DOT__pop_currentPtr 
                = (0x7fU & ((IData)(1U) + (IData)(vlTOPp->FiberTxBuffer__DOT__pop_currentPtr)));
        }
    }
    if (vlTOPp->popclk_reset) {
        vlTOPp->FiberTxBuffer__DOT___zz_io_pop_stream_valid_1 = 0U;
    } else {
        if (vlTOPp->io_pop_stream_ready) {
            vlTOPp->FiberTxBuffer__DOT___zz_io_pop_stream_valid_1 = 0U;
        }
        if (vlTOPp->FiberTxBuffer__DOT__pop_cmd_ready) {
            vlTOPp->FiberTxBuffer__DOT___zz_io_pop_stream_valid_1 
                = vlTOPp->FiberTxBuffer__DOT__pop_cmd_valid;
        }
    }
    if (vlTOPp->popclk_reset) {
        vlTOPp->FiberTxBuffer__DOT__pop_pushPtr = 0U;
    } else {
        if (vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__popArea_stream_valid) {
            vlTOPp->FiberTxBuffer__DOT__pop_pushPtr 
                = vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_data;
        }
    }
    vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__outHitSignal_buffercc__DOT__buffers_1 
        = ((~ (IData)(vlTOPp->popclk_reset)) & (IData)(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__outHitSignal_buffercc__DOT__buffers_0));
    vlTOPp->io_pop_stream_valid = vlTOPp->FiberTxBuffer__DOT___zz_io_pop_stream_valid_1;
    vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__outHitSignal_buffercc__DOT__buffers_0 
        = ((~ (IData)(vlTOPp->popclk_reset)) & (IData)(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__popArea_hit));
}

VL_INLINE_OPT void VFiberTxBuffer::_sequent__TOP__3(VFiberTxBuffer__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VFiberTxBuffer::_sequent__TOP__3\n"); );
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    CData/*6:0*/ __Vdly__FiberTxBuffer__DOT__push_currentPtr;
    CData/*6:0*/ __Vdly__FiberTxBuffer__DOT__push_length;
    // Body
    vlTOPp->__Vdly__FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target 
        = vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target;
    __Vdly__FiberTxBuffer__DOT__push_length = vlTOPp->FiberTxBuffer__DOT__push_length;
    __Vdly__FiberTxBuffer__DOT__push_currentPtr = vlTOPp->FiberTxBuffer__DOT__push_currentPtr;
    vlTOPp->__Vdly__FiberTxBuffer__DOT__push_state 
        = vlTOPp->FiberTxBuffer__DOT__push_state;
    if (vlTOPp->pushclk_reset) {
        vlTOPp->__Vdly__FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target = 0U;
    } else {
        if (vlTOPp->FiberTxBuffer__DOT__pushToPop_io_input_ready) {
            vlTOPp->__Vdly__FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target 
                = (1U & (~ (IData)(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target)));
        }
    }
    if (vlTOPp->pushclk_reset) {
        vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_data = 0U;
    } else {
        if (vlTOPp->FiberTxBuffer__DOT__pushToPop_io_input_ready) {
            vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_data 
                = vlTOPp->FiberTxBuffer__DOT__push_currentPtr;
        }
    }
    if (vlTOPp->pushclk_reset) {
        vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__popArea_hit = 0U;
    } else {
        if (vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__popArea_stream_valid) {
            vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__popArea_hit 
                = vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_target_buffercc__DOT__buffers_1;
        }
    }
    if (vlTOPp->pushclk_reset) {
        vlTOPp->FiberTxBuffer__DOT__push_drop = 0U;
    } else {
        if (vlTOPp->FiberTxBuffer__DOT__push_doWrite) {
            if (vlTOPp->FiberTxBuffer__DOT__push_full) {
                vlTOPp->FiberTxBuffer__DOT__push_drop = 1U;
            }
        }
    }
    vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__outHitSignal_buffercc__DOT__buffers_1 
        = ((~ (IData)(vlTOPp->pushclk_reset)) & (IData)(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__outHitSignal_buffercc__DOT__buffers_0));
    if (vlTOPp->pushclk_reset) {
        vlTOPp->FiberTxBuffer__DOT__push_popPtr = 0U;
    } else {
        if (vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__popArea_stream_valid) {
            vlTOPp->FiberTxBuffer__DOT__push_popPtr 
                = vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_data;
        }
        if (vlTOPp->FiberTxBuffer__DOT__when_FiberTxBuffer_l86) {
            vlTOPp->FiberTxBuffer__DOT__push_popPtr = 0U;
        }
    }
    if (vlTOPp->pushclk_reset) {
        __Vdly__FiberTxBuffer__DOT__push_length = 0U;
    } else {
        if (vlTOPp->FiberTxBuffer__DOT__io_push_stream_fire) {
            if ((3U == (IData)(vlTOPp->FiberTxBuffer__DOT__push_state))) {
                __Vdly__FiberTxBuffer__DOT__push_length 
                    = (0x7fU & ((IData)(1U) + (IData)(vlTOPp->FiberTxBuffer__DOT__push_length)));
            }
        }
        if (vlTOPp->FiberTxBuffer__DOT__when_FiberTxBuffer_l86) {
            __Vdly__FiberTxBuffer__DOT__push_length = 0U;
        }
    }
    if (vlTOPp->pushclk_reset) {
        __Vdly__FiberTxBuffer__DOT__push_currentPtr = 0U;
    } else {
        if (vlTOPp->FiberTxBuffer__DOT__push_doWrite) {
            if ((1U & (~ (IData)(vlTOPp->FiberTxBuffer__DOT__push_full)))) {
                __Vdly__FiberTxBuffer__DOT__push_currentPtr 
                    = (0x7fU & ((IData)(1U) + (IData)(vlTOPp->FiberTxBuffer__DOT__push_currentPtr)));
            }
        }
        if (vlTOPp->FiberTxBuffer__DOT__when_FiberTxBuffer_l86) {
            __Vdly__FiberTxBuffer__DOT__push_currentPtr = 0U;
        }
    }
    if (vlTOPp->pushclk_reset) {
        vlTOPp->__Vdly__FiberTxBuffer__DOT__push_state = 0U;
    } else {
        if (vlTOPp->FiberTxBuffer__DOT__io_push_stream_fire) {
            vlTOPp->__Vdly__FiberTxBuffer__DOT__push_state 
                = (3U & ((IData)(1U) + (IData)(vlTOPp->FiberTxBuffer__DOT__push_state)));
        }
    }
    vlTOPp->FiberTxBuffer__DOT__push_commit = ((~ (IData)(vlTOPp->pushclk_reset)) 
                                               & (IData)(vlTOPp->FiberTxBuffer__DOT__push_cleanup));
    vlTOPp->FiberTxBuffer__DOT__push_length = __Vdly__FiberTxBuffer__DOT__push_length;
    vlTOPp->FiberTxBuffer__DOT__push_currentPtr = __Vdly__FiberTxBuffer__DOT__push_currentPtr;
    vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_target_buffercc__DOT__buffers_1 
        = ((~ (IData)(vlTOPp->pushclk_reset)) & (IData)(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_target_buffercc__DOT__buffers_0));
    vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__outHitSignal_buffercc__DOT__buffers_0 
        = ((~ (IData)(vlTOPp->pushclk_reset)) & (IData)(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__popArea_hit));
    vlTOPp->FiberTxBuffer__DOT__push_full = (((1U & 
                                               ((IData)(vlTOPp->FiberTxBuffer__DOT__push_currentPtr) 
                                                >> 6U)) 
                                              != (1U 
                                                  & ((IData)(vlTOPp->FiberTxBuffer__DOT__push_popPtr) 
                                                     >> 6U))) 
                                             & ((0x3fU 
                                                 & (IData)(vlTOPp->FiberTxBuffer__DOT__push_currentPtr)) 
                                                == 
                                                (0x3fU 
                                                 & (IData)(vlTOPp->FiberTxBuffer__DOT__push_popPtr))));
    vlTOPp->FiberTxBuffer__DOT__push_cleanup = ((~ (IData)(vlTOPp->pushclk_reset)) 
                                                & (((IData)(vlTOPp->io_push_stream_valid) 
                                                    & (IData)(vlTOPp->io_push_stream_ready)) 
                                                   & (IData)(vlTOPp->io_push_stream_payload_last)));
}

VL_INLINE_OPT void VFiberTxBuffer::_sequent__TOP__4(VFiberTxBuffer__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VFiberTxBuffer::_sequent__TOP__4\n"); );
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__popArea_stream_valid 
        = ((IData)(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_target_buffercc__DOT__buffers_1) 
           != (IData)(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__popArea_hit));
    vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_target_buffercc__DOT__buffers_0 
        = ((~ (IData)(vlTOPp->pushclk_reset)) & (IData)(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_target));
    vlTOPp->io_push_stream_ready = (1U & ((~ (IData)(vlTOPp->FiberTxBuffer__DOT__push_cleanup)) 
                                          & (~ (IData)(vlTOPp->FiberTxBuffer__DOT__push_commit))));
}

VL_INLINE_OPT void VFiberTxBuffer::_sequent__TOP__5(VFiberTxBuffer__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VFiberTxBuffer::_sequent__TOP__5\n"); );
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (vlTOPp->FiberTxBuffer__DOT__pop_cmd_ready) {
        vlTOPp->FiberTxBuffer__DOT___zz_ram_port1 = 
            vlTOPp->FiberTxBuffer__DOT__ram[(0x3fU 
                                             & (IData)(vlTOPp->FiberTxBuffer__DOT__pop_currentPtr))];
    }
    vlTOPp->io_pop_stream_payload = vlTOPp->FiberTxBuffer__DOT___zz_ram_port1;
}

VL_INLINE_OPT void VFiberTxBuffer::_sequent__TOP__6(VFiberTxBuffer__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VFiberTxBuffer::_sequent__TOP__6\n"); );
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    CData/*5:0*/ __Vdlyvdim0__FiberTxBuffer__DOT__ram__v0;
    CData/*0:0*/ __Vdlyvset__FiberTxBuffer__DOT__ram__v0;
    IData/*31:0*/ __Vdlyvval__FiberTxBuffer__DOT__ram__v0;
    // Body
    __Vdlyvset__FiberTxBuffer__DOT__ram__v0 = 0U;
    if (vlTOPp->FiberTxBuffer__DOT___zz_1) {
        __Vdlyvval__FiberTxBuffer__DOT__ram__v0 = vlTOPp->FiberTxBuffer__DOT__push_port_payload_data;
        __Vdlyvset__FiberTxBuffer__DOT__ram__v0 = 1U;
        __Vdlyvdim0__FiberTxBuffer__DOT__ram__v0 = vlTOPp->FiberTxBuffer__DOT__push_port_payload_address;
    }
    if (vlTOPp->FiberTxBuffer__DOT__io_push_stream_fire) {
        if ((0U == (IData)(vlTOPp->FiberTxBuffer__DOT__push_state))) {
            vlTOPp->FiberTxBuffer__DOT__push_buffer 
                = ((0xffffU & vlTOPp->FiberTxBuffer__DOT__push_buffer) 
                   | ((IData)(vlTOPp->io_push_stream_payload_fragment) 
                      << 0x10U));
        }
        if ((1U == (IData)(vlTOPp->FiberTxBuffer__DOT__push_state))) {
            vlTOPp->FiberTxBuffer__DOT__push_buffer 
                = ((0xff00ffU & vlTOPp->FiberTxBuffer__DOT__push_buffer) 
                   | ((IData)(vlTOPp->io_push_stream_payload_fragment) 
                      << 8U));
        }
        if ((2U == (IData)(vlTOPp->FiberTxBuffer__DOT__push_state))) {
            vlTOPp->FiberTxBuffer__DOT__push_buffer 
                = ((0xffff00U & vlTOPp->FiberTxBuffer__DOT__push_buffer) 
                   | (IData)(vlTOPp->io_push_stream_payload_fragment));
        }
    }
    if (__Vdlyvset__FiberTxBuffer__DOT__ram__v0) {
        vlTOPp->FiberTxBuffer__DOT__ram[__Vdlyvdim0__FiberTxBuffer__DOT__ram__v0] 
            = __Vdlyvval__FiberTxBuffer__DOT__ram__v0;
    }
}

VL_INLINE_OPT void VFiberTxBuffer::_sequent__TOP__8(VFiberTxBuffer__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VFiberTxBuffer::_sequent__TOP__8\n"); );
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_target 
        = vlTOPp->__Vdly__FiberTxBuffer__DOT__popToPush__DOT__pushArea_target;
    if (vlTOPp->popclk_reset) {
        vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_data = 0U;
    } else {
        if (vlTOPp->FiberTxBuffer__DOT__popToPush_io_input_ready) {
            vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_data 
                = vlTOPp->FiberTxBuffer__DOT__pop_currentPtr;
        }
    }
    if (vlTOPp->popclk_reset) {
        vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__popArea_hit = 0U;
    } else {
        if (vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__popArea_stream_valid) {
            vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__popArea_hit 
                = vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target_buffercc__DOT__buffers_1;
        }
    }
    vlTOPp->FiberTxBuffer__DOT__popToPush_io_input_ready 
        = ((IData)(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__outHitSignal_buffercc__DOT__buffers_1) 
           == (IData)(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_target));
    vlTOPp->FiberTxBuffer__DOT__pop_currentPtr = vlTOPp->__Vdly__FiberTxBuffer__DOT__pop_currentPtr;
    vlTOPp->FiberTxBuffer__DOT__pop_cmd_valid = ((IData)(vlTOPp->FiberTxBuffer__DOT__pop_currentPtr) 
                                                 != (IData)(vlTOPp->FiberTxBuffer__DOT__pop_pushPtr));
    vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target_buffercc__DOT__buffers_1 
        = ((~ (IData)(vlTOPp->popclk_reset)) & (IData)(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target_buffercc__DOT__buffers_0));
    vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__popArea_stream_valid 
        = ((IData)(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target_buffercc__DOT__buffers_1) 
           != (IData)(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__popArea_hit));
    vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target_buffercc__DOT__buffers_0 
        = ((~ (IData)(vlTOPp->popclk_reset)) & (IData)(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target));
}

VL_INLINE_OPT void VFiberTxBuffer::_combo__TOP__9(VFiberTxBuffer__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VFiberTxBuffer::_combo__TOP__9\n"); );
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->FiberTxBuffer__DOT__pop_cmd_ready = (1U 
                                                 & ((~ (IData)(vlTOPp->FiberTxBuffer__DOT___zz_io_pop_stream_valid_1)) 
                                                    | (IData)(vlTOPp->io_pop_stream_ready)));
    vlTOPp->FiberTxBuffer__DOT__io_push_stream_fire 
        = ((IData)(vlTOPp->io_push_stream_valid) & (IData)(vlTOPp->io_push_stream_ready));
    vlTOPp->io_pop_last = ((((IData)(vlTOPp->FiberTxBuffer__DOT__pop_currentPtr) 
                             == (IData)(vlTOPp->FiberTxBuffer__DOT__push_length)) 
                            & (IData)(vlTOPp->io_pop_stream_valid)) 
                           & (~ (IData)(vlTOPp->io_push_stream_valid)));
}

VL_INLINE_OPT void VFiberTxBuffer::_sequent__TOP__10(VFiberTxBuffer__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VFiberTxBuffer::_sequent__TOP__10\n"); );
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->FiberTxBuffer__DOT__push_state = vlTOPp->__Vdly__FiberTxBuffer__DOT__push_state;
    vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target 
        = vlTOPp->__Vdly__FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target;
    vlTOPp->FiberTxBuffer__DOT__when_FiberTxBuffer_l86 
        = ((IData)(vlTOPp->FiberTxBuffer__DOT__push_cleanup) 
           & (0U != (IData)(vlTOPp->FiberTxBuffer__DOT__push_state)));
    vlTOPp->FiberTxBuffer__DOT__pushToPop_io_input_ready 
        = ((IData)(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__outHitSignal_buffercc__DOT__buffers_1) 
           == (IData)(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target));
}

VL_INLINE_OPT void VFiberTxBuffer::_combo__TOP__11(VFiberTxBuffer__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VFiberTxBuffer::_combo__TOP__11\n"); );
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->FiberTxBuffer__DOT__push_doWrite = 0U;
    if (vlTOPp->FiberTxBuffer__DOT__io_push_stream_fire) {
        if ((3U == (IData)(vlTOPp->FiberTxBuffer__DOT__push_state))) {
            vlTOPp->FiberTxBuffer__DOT__push_doWrite = 1U;
        }
    }
    if (vlTOPp->FiberTxBuffer__DOT__when_FiberTxBuffer_l86) {
        vlTOPp->FiberTxBuffer__DOT__push_doWrite = 1U;
    }
    vlTOPp->FiberTxBuffer__DOT__push_port_payload_address 
        = vlTOPp->FiberTxBuffer__DOT____Vxrand1;
    if (vlTOPp->FiberTxBuffer__DOT__push_doWrite) {
        if ((1U & (~ (IData)(vlTOPp->FiberTxBuffer__DOT__push_full)))) {
            vlTOPp->FiberTxBuffer__DOT__push_port_payload_address 
                = (0x3fU & (IData)(vlTOPp->FiberTxBuffer__DOT__push_currentPtr));
        }
    }
    vlTOPp->FiberTxBuffer__DOT__push_port_payload_data 
        = vlTOPp->FiberTxBuffer__DOT____Vxrand2;
    if (vlTOPp->FiberTxBuffer__DOT__push_doWrite) {
        if ((1U & (~ (IData)(vlTOPp->FiberTxBuffer__DOT__push_full)))) {
            vlTOPp->FiberTxBuffer__DOT__push_port_payload_data 
                = ((vlTOPp->FiberTxBuffer__DOT__push_buffer 
                    << 8U) | (IData)(vlTOPp->io_push_stream_payload_fragment));
        }
    }
    vlTOPp->FiberTxBuffer__DOT__push_port_valid = 0U;
    if (vlTOPp->FiberTxBuffer__DOT__push_doWrite) {
        if ((1U & (~ (IData)(vlTOPp->FiberTxBuffer__DOT__push_full)))) {
            vlTOPp->FiberTxBuffer__DOT__push_port_valid = 1U;
        }
    }
    vlTOPp->FiberTxBuffer__DOT___zz_1 = 0U;
    if (vlTOPp->FiberTxBuffer__DOT__push_port_valid) {
        vlTOPp->FiberTxBuffer__DOT___zz_1 = 1U;
    }
}

void VFiberTxBuffer::_eval(VFiberTxBuffer__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VFiberTxBuffer::_eval\n"); );
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if ((((IData)(vlTOPp->popclk_clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__popclk_clk))) 
         | ((IData)(vlTOPp->popclk_reset) & (~ (IData)(vlTOPp->__Vclklast__TOP__popclk_reset))))) {
        vlTOPp->_sequent__TOP__2(vlSymsp);
        vlTOPp->__Vm_traceActivity = (2U | vlTOPp->__Vm_traceActivity);
    }
    if ((((IData)(vlTOPp->pushclk_clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__pushclk_clk))) 
         | ((IData)(vlTOPp->pushclk_reset) & (~ (IData)(vlTOPp->__Vclklast__TOP__pushclk_reset))))) {
        vlTOPp->_sequent__TOP__3(vlSymsp);
        vlTOPp->__Vm_traceActivity = (4U | vlTOPp->__Vm_traceActivity);
        vlTOPp->_sequent__TOP__4(vlSymsp);
    }
    if (((IData)(vlTOPp->popclk_clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__popclk_clk)))) {
        vlTOPp->_sequent__TOP__5(vlSymsp);
    }
    if (((IData)(vlTOPp->pushclk_clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__pushclk_clk)))) {
        vlTOPp->_sequent__TOP__6(vlSymsp);
        vlTOPp->__Vm_traceActivity = (8U | vlTOPp->__Vm_traceActivity);
    }
    if ((((IData)(vlTOPp->popclk_clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__popclk_clk))) 
         | ((IData)(vlTOPp->popclk_reset) & (~ (IData)(vlTOPp->__Vclklast__TOP__popclk_reset))))) {
        vlTOPp->_sequent__TOP__8(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x10U | vlTOPp->__Vm_traceActivity);
    }
    vlTOPp->_combo__TOP__9(vlSymsp);
    vlTOPp->__Vm_traceActivity = (0x20U | vlTOPp->__Vm_traceActivity);
    if ((((IData)(vlTOPp->pushclk_clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__pushclk_clk))) 
         | ((IData)(vlTOPp->pushclk_reset) & (~ (IData)(vlTOPp->__Vclklast__TOP__pushclk_reset))))) {
        vlTOPp->_sequent__TOP__10(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x40U | vlTOPp->__Vm_traceActivity);
    }
    vlTOPp->_combo__TOP__11(vlSymsp);
    // Final
    vlTOPp->__Vclklast__TOP__popclk_clk = vlTOPp->popclk_clk;
    vlTOPp->__Vclklast__TOP__popclk_reset = vlTOPp->popclk_reset;
    vlTOPp->__Vclklast__TOP__pushclk_clk = vlTOPp->pushclk_clk;
    vlTOPp->__Vclklast__TOP__pushclk_reset = vlTOPp->pushclk_reset;
}

VL_INLINE_OPT QData VFiberTxBuffer::_change_request(VFiberTxBuffer__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VFiberTxBuffer::_change_request\n"); );
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    return (vlTOPp->_change_request_1(vlSymsp));
}

VL_INLINE_OPT QData VFiberTxBuffer::_change_request_1(VFiberTxBuffer__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VFiberTxBuffer::_change_request_1\n"); );
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void VFiberTxBuffer::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VFiberTxBuffer::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((io_push_stream_valid & 0xfeU))) {
        Verilated::overWidthError("io_push_stream_valid");}
    if (VL_UNLIKELY((io_push_stream_payload_last & 0xfeU))) {
        Verilated::overWidthError("io_push_stream_payload_last");}
    if (VL_UNLIKELY((io_pop_stream_ready & 0xfeU))) {
        Verilated::overWidthError("io_pop_stream_ready");}
    if (VL_UNLIKELY((pushclk_clk & 0xfeU))) {
        Verilated::overWidthError("pushclk_clk");}
    if (VL_UNLIKELY((pushclk_reset & 0xfeU))) {
        Verilated::overWidthError("pushclk_reset");}
    if (VL_UNLIKELY((popclk_clk & 0xfeU))) {
        Verilated::overWidthError("popclk_clk");}
    if (VL_UNLIKELY((popclk_reset & 0xfeU))) {
        Verilated::overWidthError("popclk_reset");}
}
#endif  // VL_DEBUG
