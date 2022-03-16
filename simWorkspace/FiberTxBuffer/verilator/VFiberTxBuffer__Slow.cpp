// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VFiberTxBuffer.h for the primary calling header

#include "VFiberTxBuffer.h"
#include "VFiberTxBuffer__Syms.h"

//==========

VL_CTOR_IMP(VFiberTxBuffer) {
    VFiberTxBuffer__Syms* __restrict vlSymsp = __VlSymsp = new VFiberTxBuffer__Syms(this, name());
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void VFiberTxBuffer::__Vconfigure(VFiberTxBuffer__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

VFiberTxBuffer::~VFiberTxBuffer() {
    delete __VlSymsp; __VlSymsp=NULL;
}

void VFiberTxBuffer::_initial__TOP__1(VFiberTxBuffer__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VFiberTxBuffer::_initial__TOP__1\n"); );
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->FiberTxBuffer__DOT____Vxrand1 = VL_RAND_RESET_I(6);
    vlTOPp->FiberTxBuffer__DOT____Vxrand2 = VL_RAND_RESET_I(32);
}

void VFiberTxBuffer::_settle__TOP__7(VFiberTxBuffer__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VFiberTxBuffer::_settle__TOP__7\n"); );
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->io_pop_stream_payload = vlTOPp->FiberTxBuffer__DOT___zz_ram_port1;
    vlTOPp->FiberTxBuffer__DOT__pop_cmd_ready = (1U 
                                                 & ((~ (IData)(vlTOPp->FiberTxBuffer__DOT___zz_io_pop_stream_valid_1)) 
                                                    | (IData)(vlTOPp->io_pop_stream_ready)));
    vlTOPp->io_pop_stream_valid = vlTOPp->FiberTxBuffer__DOT___zz_io_pop_stream_valid_1;
    vlTOPp->FiberTxBuffer__DOT__pop_cmd_valid = ((IData)(vlTOPp->FiberTxBuffer__DOT__pop_currentPtr) 
                                                 != (IData)(vlTOPp->FiberTxBuffer__DOT__pop_pushPtr));
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
    vlTOPp->FiberTxBuffer__DOT__when_FiberTxBuffer_l86 
        = ((IData)(vlTOPp->FiberTxBuffer__DOT__push_cleanup) 
           & (0U != (IData)(vlTOPp->FiberTxBuffer__DOT__push_state)));
    vlTOPp->io_push_stream_ready = (1U & ((~ (IData)(vlTOPp->FiberTxBuffer__DOT__push_cleanup)) 
                                          & (~ (IData)(vlTOPp->FiberTxBuffer__DOT__push_commit))));
    vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__popArea_stream_valid 
        = ((IData)(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_target_buffercc__DOT__buffers_1) 
           != (IData)(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__popArea_hit));
    vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__popArea_stream_valid 
        = ((IData)(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target_buffercc__DOT__buffers_1) 
           != (IData)(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__popArea_hit));
    vlTOPp->FiberTxBuffer__DOT__popToPush_io_input_ready 
        = ((IData)(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__outHitSignal_buffercc__DOT__buffers_1) 
           == (IData)(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_target));
    vlTOPp->FiberTxBuffer__DOT__pushToPop_io_input_ready 
        = ((IData)(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__outHitSignal_buffercc__DOT__buffers_1) 
           == (IData)(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target));
    vlTOPp->io_pop_last = ((((IData)(vlTOPp->FiberTxBuffer__DOT__pop_currentPtr) 
                             == (IData)(vlTOPp->FiberTxBuffer__DOT__push_length)) 
                            & (IData)(vlTOPp->io_pop_stream_valid)) 
                           & (~ (IData)(vlTOPp->io_push_stream_valid)));
    vlTOPp->FiberTxBuffer__DOT__io_push_stream_fire 
        = ((IData)(vlTOPp->io_push_stream_valid) & (IData)(vlTOPp->io_push_stream_ready));
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

void VFiberTxBuffer::_eval_initial(VFiberTxBuffer__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VFiberTxBuffer::_eval_initial\n"); );
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_initial__TOP__1(vlSymsp);
    vlTOPp->__Vclklast__TOP__popclk_clk = vlTOPp->popclk_clk;
    vlTOPp->__Vclklast__TOP__popclk_reset = vlTOPp->popclk_reset;
    vlTOPp->__Vclklast__TOP__pushclk_clk = vlTOPp->pushclk_clk;
    vlTOPp->__Vclklast__TOP__pushclk_reset = vlTOPp->pushclk_reset;
}

void VFiberTxBuffer::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VFiberTxBuffer::final\n"); );
    // Variables
    VFiberTxBuffer__Syms* __restrict vlSymsp = this->__VlSymsp;
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void VFiberTxBuffer::_eval_settle(VFiberTxBuffer__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VFiberTxBuffer::_eval_settle\n"); );
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_settle__TOP__7(vlSymsp);
    vlTOPp->__Vm_traceActivity = (1U | vlTOPp->__Vm_traceActivity);
}

void VFiberTxBuffer::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VFiberTxBuffer::_ctor_var_reset\n"); );
    // Body
    io_push_stream_valid = VL_RAND_RESET_I(1);
    io_push_stream_ready = VL_RAND_RESET_I(1);
    io_push_stream_payload_last = VL_RAND_RESET_I(1);
    io_push_stream_payload_fragment = VL_RAND_RESET_I(8);
    io_pop_stream_valid = VL_RAND_RESET_I(1);
    io_pop_stream_ready = VL_RAND_RESET_I(1);
    io_pop_stream_payload = VL_RAND_RESET_I(32);
    io_pop_last = VL_RAND_RESET_I(1);
    pushclk_clk = VL_RAND_RESET_I(1);
    pushclk_reset = VL_RAND_RESET_I(1);
    popclk_clk = VL_RAND_RESET_I(1);
    popclk_reset = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT____Vxrand2 = VL_RAND_RESET_I(32);
    FiberTxBuffer__DOT____Vxrand1 = VL_RAND_RESET_I(6);
    FiberTxBuffer__DOT___zz_ram_port1 = VL_RAND_RESET_I(32);
    FiberTxBuffer__DOT__popToPush_io_input_ready = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__pushToPop_io_input_ready = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT___zz_1 = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__push_currentPtr = VL_RAND_RESET_I(7);
    FiberTxBuffer__DOT__push_popPtr = VL_RAND_RESET_I(7);
    FiberTxBuffer__DOT__push_length = VL_RAND_RESET_I(7);
    FiberTxBuffer__DOT__push_buffer = VL_RAND_RESET_I(24);
    FiberTxBuffer__DOT__push_state = VL_RAND_RESET_I(2);
    FiberTxBuffer__DOT__push_port_valid = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__push_port_payload_address = VL_RAND_RESET_I(6);
    FiberTxBuffer__DOT__push_port_payload_data = VL_RAND_RESET_I(32);
    FiberTxBuffer__DOT__push_drop = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__push_doWrite = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__io_push_stream_fire = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__push_full = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__push_cleanup = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__push_commit = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__when_FiberTxBuffer_l86 = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__pop_currentPtr = VL_RAND_RESET_I(7);
    FiberTxBuffer__DOT__pop_pushPtr = VL_RAND_RESET_I(7);
    FiberTxBuffer__DOT__pop_cmd_valid = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__pop_cmd_ready = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT___zz_io_pop_stream_valid_1 = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__pop_cleanup = VL_RAND_RESET_I(1);
    { int __Vi0=0; for (; __Vi0<64; ++__Vi0) {
            FiberTxBuffer__DOT__ram[__Vi0] = VL_RAND_RESET_I(32);
    }}
    FiberTxBuffer__DOT__popToPush__DOT__pushArea_target = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__popToPush__DOT__pushArea_data = VL_RAND_RESET_I(7);
    FiberTxBuffer__DOT__popToPush__DOT__popArea_stream_valid = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__popToPush__DOT__popArea_hit = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__popToPush__DOT__outHitSignal_buffercc__DOT__buffers_0 = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__popToPush__DOT__outHitSignal_buffercc__DOT__buffers_1 = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__popToPush__DOT__pushArea_target_buffercc__DOT__buffers_0 = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__popToPush__DOT__pushArea_target_buffercc__DOT__buffers_1 = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__pushToPop__DOT__pushArea_data = VL_RAND_RESET_I(7);
    FiberTxBuffer__DOT__pushToPop__DOT__popArea_stream_valid = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__pushToPop__DOT__popArea_hit = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__pushToPop__DOT__outHitSignal_buffercc__DOT__buffers_0 = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__pushToPop__DOT__outHitSignal_buffercc__DOT__buffers_1 = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target_buffercc__DOT__buffers_0 = VL_RAND_RESET_I(1);
    FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target_buffercc__DOT__buffers_1 = VL_RAND_RESET_I(1);
    __Vdly__FiberTxBuffer__DOT__push_state = VL_RAND_RESET_I(2);
    __Vdly__FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target = VL_RAND_RESET_I(1);
    __Vdly__FiberTxBuffer__DOT__pop_currentPtr = VL_RAND_RESET_I(7);
    __Vdly__FiberTxBuffer__DOT__popToPush__DOT__pushArea_target = VL_RAND_RESET_I(1);
    __Vm_traceActivity = 0;
}
