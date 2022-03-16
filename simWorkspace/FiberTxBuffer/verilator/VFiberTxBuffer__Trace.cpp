// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VFiberTxBuffer__Syms.h"


//======================

void VFiberTxBuffer::traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    VFiberTxBuffer* t = (VFiberTxBuffer*)userthis;
    VFiberTxBuffer__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (vlSymsp->getClearActivity()) {
        t->traceChgThis(vlSymsp, vcdp, code);
    }
}

//======================


void VFiberTxBuffer::traceChgThis(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
                               | (vlTOPp->__Vm_traceActivity 
                                  >> 2U))))) {
            vlTOPp->traceChgThis__2(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
                               | (vlTOPp->__Vm_traceActivity 
                                  >> 4U))))) {
            vlTOPp->traceChgThis__3(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & ((vlTOPp->__Vm_traceActivity 
                                | (vlTOPp->__Vm_traceActivity 
                                   >> 4U)) | (vlTOPp->__Vm_traceActivity 
                                              >> 5U))))) {
            vlTOPp->traceChgThis__4(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
                               | (vlTOPp->__Vm_traceActivity 
                                  >> 5U))))) {
            vlTOPp->traceChgThis__5(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
                               | (vlTOPp->__Vm_traceActivity 
                                  >> 6U))))) {
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
        if (VL_UNLIKELY((0x10U & vlTOPp->__Vm_traceActivity))) {
            vlTOPp->traceChgThis__10(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((0x40U & vlTOPp->__Vm_traceActivity))) {
            vlTOPp->traceChgThis__11(vlSymsp, vcdp, code);
        }
        vlTOPp->traceChgThis__12(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void VFiberTxBuffer::traceChgThis__2(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(c+1,(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__popArea_stream_valid));
        vcdp->chgBit(c+9,(vlTOPp->FiberTxBuffer__DOT__push_full));
    }
}

void VFiberTxBuffer::traceChgThis__3(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(c+17,(vlTOPp->FiberTxBuffer__DOT__popToPush_io_input_ready));
        vcdp->chgBit(c+25,(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__popArea_stream_valid));
        vcdp->chgBit(c+33,(vlTOPp->FiberTxBuffer__DOT__pop_cmd_valid));
    }
}

void VFiberTxBuffer::traceChgThis__4(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(c+41,(((IData)(vlTOPp->FiberTxBuffer__DOT__pop_cmd_valid) 
                            & (IData)(vlTOPp->FiberTxBuffer__DOT__pop_cmd_ready))));
    }
}

void VFiberTxBuffer::traceChgThis__5(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(c+49,(vlTOPp->FiberTxBuffer__DOT__push_port_valid));
        vcdp->chgBus(c+57,(vlTOPp->FiberTxBuffer__DOT__push_port_payload_address),6);
        vcdp->chgBus(c+65,(vlTOPp->FiberTxBuffer__DOT__push_port_payload_data),32);
        vcdp->chgBit(c+73,(vlTOPp->FiberTxBuffer__DOT__push_doWrite));
        vcdp->chgBit(c+81,(vlTOPp->FiberTxBuffer__DOT__io_push_stream_fire));
        vcdp->chgBit(c+89,(vlTOPp->FiberTxBuffer__DOT__pop_cmd_ready));
    }
}

void VFiberTxBuffer::traceChgThis__6(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(c+97,(vlTOPp->FiberTxBuffer__DOT__pushToPop_io_input_ready));
        vcdp->chgBit(c+105,(vlTOPp->FiberTxBuffer__DOT__when_FiberTxBuffer_l86));
    }
}

void VFiberTxBuffer::traceChgThis__7(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBus(c+113,(vlTOPp->FiberTxBuffer__DOT__pop_pushPtr),7);
        vcdp->chgBit(c+121,(vlTOPp->FiberTxBuffer__DOT__pop_cleanup));
        vcdp->chgBit(c+129,(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__outHitSignal_buffercc__DOT__buffers_1));
        vcdp->chgBit(c+137,(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__outHitSignal_buffercc__DOT__buffers_0));
    }
}

void VFiberTxBuffer::traceChgThis__8(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBus(c+145,(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_data),7);
        vcdp->chgBus(c+153,(vlTOPp->FiberTxBuffer__DOT__push_currentPtr),7);
        vcdp->chgBus(c+161,(vlTOPp->FiberTxBuffer__DOT__push_popPtr),7);
        vcdp->chgBus(c+169,(vlTOPp->FiberTxBuffer__DOT__push_length),7);
        vcdp->chgBit(c+177,(vlTOPp->FiberTxBuffer__DOT__push_drop));
        vcdp->chgBit(c+185,(vlTOPp->FiberTxBuffer__DOT__push_cleanup));
        vcdp->chgBit(c+193,(vlTOPp->FiberTxBuffer__DOT__push_commit));
        vcdp->chgBit(c+201,(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_target_buffercc__DOT__buffers_1));
        vcdp->chgBit(c+209,(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__popArea_hit));
        vcdp->chgBit(c+217,(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_target_buffercc__DOT__buffers_0));
        vcdp->chgBit(c+225,(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__outHitSignal_buffercc__DOT__buffers_1));
        vcdp->chgBit(c+233,(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__outHitSignal_buffercc__DOT__buffers_0));
    }
}

void VFiberTxBuffer::traceChgThis__9(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBus(c+241,(vlTOPp->FiberTxBuffer__DOT__push_buffer),24);
    }
}

void VFiberTxBuffer::traceChgThis__10(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBus(c+249,(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_data),7);
        vcdp->chgBus(c+257,(vlTOPp->FiberTxBuffer__DOT__pop_currentPtr),7);
        vcdp->chgBus(c+265,((0x3fU & (IData)(vlTOPp->FiberTxBuffer__DOT__pop_currentPtr))),6);
        vcdp->chgBit(c+273,(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_target));
        vcdp->chgBit(c+281,(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target_buffercc__DOT__buffers_1));
        vcdp->chgBit(c+289,(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__popArea_hit));
        vcdp->chgBit(c+297,(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target_buffercc__DOT__buffers_0));
    }
}

void VFiberTxBuffer::traceChgThis__11(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBus(c+305,(vlTOPp->FiberTxBuffer__DOT__push_state),2);
        vcdp->chgBit(c+313,((0U == (IData)(vlTOPp->FiberTxBuffer__DOT__push_state))));
        vcdp->chgBit(c+321,((1U == (IData)(vlTOPp->FiberTxBuffer__DOT__push_state))));
        vcdp->chgBit(c+329,((2U == (IData)(vlTOPp->FiberTxBuffer__DOT__push_state))));
        vcdp->chgBit(c+337,((3U == (IData)(vlTOPp->FiberTxBuffer__DOT__push_state))));
        vcdp->chgBit(c+345,(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target));
    }
}

void VFiberTxBuffer::traceChgThis__12(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(c+353,(vlTOPp->io_push_stream_valid));
        vcdp->chgBit(c+361,(vlTOPp->io_push_stream_ready));
        vcdp->chgBit(c+369,(vlTOPp->io_push_stream_payload_last));
        vcdp->chgBus(c+377,(vlTOPp->io_push_stream_payload_fragment),8);
        vcdp->chgBit(c+385,(vlTOPp->io_pop_stream_valid));
        vcdp->chgBit(c+393,(vlTOPp->io_pop_stream_ready));
        vcdp->chgBus(c+401,(vlTOPp->io_pop_stream_payload),32);
        vcdp->chgBit(c+409,(vlTOPp->io_pop_last));
        vcdp->chgBit(c+417,(vlTOPp->pushclk_clk));
        vcdp->chgBit(c+425,(vlTOPp->pushclk_reset));
        vcdp->chgBit(c+433,(vlTOPp->popclk_clk));
        vcdp->chgBit(c+441,(vlTOPp->popclk_reset));
        vcdp->chgBit(c+449,(((IData)(vlTOPp->io_push_stream_valid) 
                             & (IData)(vlTOPp->io_push_stream_ready))));
    }
}
