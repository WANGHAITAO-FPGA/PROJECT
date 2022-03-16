// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VFiberTxBuffer__Syms.h"


//======================

void VFiberTxBuffer::trace(VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addCallback(&VFiberTxBuffer::traceInit, &VFiberTxBuffer::traceFull, &VFiberTxBuffer::traceChg, this);
}
void VFiberTxBuffer::traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->open()
    VFiberTxBuffer* t = (VFiberTxBuffer*)userthis;
    VFiberTxBuffer__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (!Verilated::calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
                        "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vcdp->scopeEscape(' ');
    t->traceInitThis(vlSymsp, vcdp, code);
    vcdp->scopeEscape('.');
}
void VFiberTxBuffer::traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    VFiberTxBuffer* t = (VFiberTxBuffer*)userthis;
    VFiberTxBuffer__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    t->traceFullThis(vlSymsp, vcdp, code);
}

//======================


void VFiberTxBuffer::traceInitThis(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    vcdp->module(vlSymsp->name());  // Setup signal names
    // Body
    {
        vlTOPp->traceInitThis__1(vlSymsp, vcdp, code);
    }
}

void VFiberTxBuffer::traceFullThis(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vlTOPp->traceFullThis__1(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void VFiberTxBuffer::traceInitThis__1(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->declBit(c+353,"io_push_stream_valid", false,-1);
        vcdp->declBit(c+361,"io_push_stream_ready", false,-1);
        vcdp->declBit(c+369,"io_push_stream_payload_last", false,-1);
        vcdp->declBus(c+377,"io_push_stream_payload_fragment", false,-1, 7,0);
        vcdp->declBit(c+385,"io_pop_stream_valid", false,-1);
        vcdp->declBit(c+393,"io_pop_stream_ready", false,-1);
        vcdp->declBus(c+401,"io_pop_stream_payload", false,-1, 31,0);
        vcdp->declBit(c+409,"io_pop_last", false,-1);
        vcdp->declBit(c+417,"pushclk_clk", false,-1);
        vcdp->declBit(c+425,"pushclk_reset", false,-1);
        vcdp->declBit(c+433,"popclk_clk", false,-1);
        vcdp->declBit(c+441,"popclk_reset", false,-1);
        vcdp->declBit(c+353,"FiberTxBuffer io_push_stream_valid", false,-1);
        vcdp->declBit(c+361,"FiberTxBuffer io_push_stream_ready", false,-1);
        vcdp->declBit(c+369,"FiberTxBuffer io_push_stream_payload_last", false,-1);
        vcdp->declBus(c+377,"FiberTxBuffer io_push_stream_payload_fragment", false,-1, 7,0);
        vcdp->declBit(c+385,"FiberTxBuffer io_pop_stream_valid", false,-1);
        vcdp->declBit(c+393,"FiberTxBuffer io_pop_stream_ready", false,-1);
        vcdp->declBus(c+401,"FiberTxBuffer io_pop_stream_payload", false,-1, 31,0);
        vcdp->declBit(c+409,"FiberTxBuffer io_pop_last", false,-1);
        vcdp->declBit(c+417,"FiberTxBuffer pushclk_clk", false,-1);
        vcdp->declBit(c+425,"FiberTxBuffer pushclk_reset", false,-1);
        vcdp->declBit(c+433,"FiberTxBuffer popclk_clk", false,-1);
        vcdp->declBit(c+441,"FiberTxBuffer popclk_reset", false,-1);
        vcdp->declBit(c+17,"FiberTxBuffer popToPush_io_input_ready", false,-1);
        vcdp->declBit(c+1,"FiberTxBuffer popToPush_io_output_valid", false,-1);
        vcdp->declBus(c+249,"FiberTxBuffer popToPush_io_output_payload", false,-1, 6,0);
        vcdp->declBit(c+97,"FiberTxBuffer pushToPop_io_input_ready", false,-1);
        vcdp->declBit(c+25,"FiberTxBuffer pushToPop_io_output_valid", false,-1);
        vcdp->declBus(c+145,"FiberTxBuffer pushToPop_io_output_payload", false,-1, 6,0);
        vcdp->declBus(c+153,"FiberTxBuffer push_currentPtr", false,-1, 6,0);
        vcdp->declBus(c+161,"FiberTxBuffer push_popPtr", false,-1, 6,0);
        vcdp->declBus(c+169,"FiberTxBuffer push_length", false,-1, 6,0);
        vcdp->declBus(c+241,"FiberTxBuffer push_buffer", false,-1, 23,0);
        vcdp->declBus(c+305,"FiberTxBuffer push_state", false,-1, 1,0);
        vcdp->declBit(c+49,"FiberTxBuffer push_port_valid", false,-1);
        vcdp->declBus(c+57,"FiberTxBuffer push_port_payload_address", false,-1, 5,0);
        vcdp->declBus(c+65,"FiberTxBuffer push_port_payload_data", false,-1, 31,0);
        vcdp->declBit(c+177,"FiberTxBuffer push_drop", false,-1);
        vcdp->declBit(c+73,"FiberTxBuffer push_doWrite", false,-1);
        vcdp->declBit(c+81,"FiberTxBuffer io_push_stream_fire", false,-1);
        vcdp->declBit(c+313,"FiberTxBuffer when_FiberTxBuffer_l61", false,-1);
        vcdp->declBit(c+321,"FiberTxBuffer when_FiberTxBuffer_l61_1", false,-1);
        vcdp->declBit(c+329,"FiberTxBuffer when_FiberTxBuffer_l61_2", false,-1);
        vcdp->declBit(c+337,"FiberTxBuffer when_FiberTxBuffer_l64", false,-1);
        vcdp->declBit(c+9,"FiberTxBuffer push_full", false,-1);
        vcdp->declBit(c+449,"FiberTxBuffer io_push_stream_fire_1", false,-1);
        vcdp->declBit(c+185,"FiberTxBuffer push_cleanup", false,-1);
        vcdp->declBit(c+193,"FiberTxBuffer push_commit", false,-1);
        vcdp->declBit(c+105,"FiberTxBuffer when_FiberTxBuffer_l86", false,-1);
        vcdp->declBus(c+257,"FiberTxBuffer pop_currentPtr", false,-1, 6,0);
        vcdp->declBus(c+113,"FiberTxBuffer pop_pushPtr", false,-1, 6,0);
        vcdp->declBit(c+33,"FiberTxBuffer pop_cmd_valid", false,-1);
        vcdp->declBit(c+89,"FiberTxBuffer pop_cmd_ready", false,-1);
        vcdp->declBus(c+265,"FiberTxBuffer pop_cmd_payload", false,-1, 5,0);
        vcdp->declBit(c+121,"FiberTxBuffer pop_cleanup", false,-1);
        vcdp->declBit(c+41,"FiberTxBuffer pop_cmd_fire", false,-1);
        vcdp->declBit(c+457,"FiberTxBuffer popToPush io_input_valid", false,-1);
        vcdp->declBit(c+17,"FiberTxBuffer popToPush io_input_ready", false,-1);
        vcdp->declBus(c+257,"FiberTxBuffer popToPush io_input_payload", false,-1, 6,0);
        vcdp->declBit(c+1,"FiberTxBuffer popToPush io_output_valid", false,-1);
        vcdp->declBit(c+457,"FiberTxBuffer popToPush io_output_ready", false,-1);
        vcdp->declBus(c+249,"FiberTxBuffer popToPush io_output_payload", false,-1, 6,0);
        vcdp->declBit(c+433,"FiberTxBuffer popToPush popclk_clk", false,-1);
        vcdp->declBit(c+441,"FiberTxBuffer popToPush popclk_reset", false,-1);
        vcdp->declBit(c+417,"FiberTxBuffer popToPush pushclk_clk", false,-1);
        vcdp->declBit(c+425,"FiberTxBuffer popToPush pushclk_reset", false,-1);
        vcdp->declBit(c+129,"FiberTxBuffer popToPush outHitSignal_buffercc_io_dataOut", false,-1);
        vcdp->declBit(c+201,"FiberTxBuffer popToPush pushArea_target_buffercc_io_dataOut", false,-1);
        vcdp->declBit(c+209,"FiberTxBuffer popToPush outHitSignal", false,-1);
        vcdp->declBit(c+129,"FiberTxBuffer popToPush pushArea_hit", false,-1);
        vcdp->declBit(c+17,"FiberTxBuffer popToPush pushArea_accept", false,-1);
        vcdp->declBit(c+273,"FiberTxBuffer popToPush pushArea_target", false,-1);
        vcdp->declBus(c+249,"FiberTxBuffer popToPush pushArea_data", false,-1, 6,0);
        vcdp->declBit(c+17,"FiberTxBuffer popToPush io_input_fire", false,-1);
        vcdp->declBit(c+1,"FiberTxBuffer popToPush popArea_stream_valid", false,-1);
        vcdp->declBit(c+457,"FiberTxBuffer popToPush popArea_stream_ready", false,-1);
        vcdp->declBus(c+249,"FiberTxBuffer popToPush popArea_stream_payload", false,-1, 6,0);
        vcdp->declBit(c+201,"FiberTxBuffer popToPush popArea_target", false,-1);
        vcdp->declBit(c+1,"FiberTxBuffer popToPush popArea_stream_fire", false,-1);
        vcdp->declBit(c+209,"FiberTxBuffer popToPush popArea_hit", false,-1);
        vcdp->declBit(c+209,"FiberTxBuffer popToPush outHitSignal_buffercc io_dataIn", false,-1);
        vcdp->declBit(c+129,"FiberTxBuffer popToPush outHitSignal_buffercc io_dataOut", false,-1);
        vcdp->declBit(c+433,"FiberTxBuffer popToPush outHitSignal_buffercc popclk_clk", false,-1);
        vcdp->declBit(c+441,"FiberTxBuffer popToPush outHitSignal_buffercc popclk_reset", false,-1);
        vcdp->declBit(c+137,"FiberTxBuffer popToPush outHitSignal_buffercc buffers_0", false,-1);
        vcdp->declBit(c+129,"FiberTxBuffer popToPush outHitSignal_buffercc buffers_1", false,-1);
        vcdp->declBit(c+273,"FiberTxBuffer popToPush pushArea_target_buffercc io_dataIn", false,-1);
        vcdp->declBit(c+201,"FiberTxBuffer popToPush pushArea_target_buffercc io_dataOut", false,-1);
        vcdp->declBit(c+417,"FiberTxBuffer popToPush pushArea_target_buffercc pushclk_clk", false,-1);
        vcdp->declBit(c+425,"FiberTxBuffer popToPush pushArea_target_buffercc pushclk_reset", false,-1);
        vcdp->declBit(c+217,"FiberTxBuffer popToPush pushArea_target_buffercc buffers_0", false,-1);
        vcdp->declBit(c+201,"FiberTxBuffer popToPush pushArea_target_buffercc buffers_1", false,-1);
        vcdp->declBit(c+457,"FiberTxBuffer pushToPop io_input_valid", false,-1);
        vcdp->declBit(c+97,"FiberTxBuffer pushToPop io_input_ready", false,-1);
        vcdp->declBus(c+153,"FiberTxBuffer pushToPop io_input_payload", false,-1, 6,0);
        vcdp->declBit(c+25,"FiberTxBuffer pushToPop io_output_valid", false,-1);
        vcdp->declBit(c+457,"FiberTxBuffer pushToPop io_output_ready", false,-1);
        vcdp->declBus(c+145,"FiberTxBuffer pushToPop io_output_payload", false,-1, 6,0);
        vcdp->declBit(c+417,"FiberTxBuffer pushToPop pushclk_clk", false,-1);
        vcdp->declBit(c+425,"FiberTxBuffer pushToPop pushclk_reset", false,-1);
        vcdp->declBit(c+433,"FiberTxBuffer pushToPop popclk_clk", false,-1);
        vcdp->declBit(c+441,"FiberTxBuffer pushToPop popclk_reset", false,-1);
        vcdp->declBit(c+225,"FiberTxBuffer pushToPop outHitSignal_buffercc_io_dataOut", false,-1);
        vcdp->declBit(c+281,"FiberTxBuffer pushToPop pushArea_target_buffercc_io_dataOut", false,-1);
        vcdp->declBit(c+289,"FiberTxBuffer pushToPop outHitSignal", false,-1);
        vcdp->declBit(c+225,"FiberTxBuffer pushToPop pushArea_hit", false,-1);
        vcdp->declBit(c+97,"FiberTxBuffer pushToPop pushArea_accept", false,-1);
        vcdp->declBit(c+345,"FiberTxBuffer pushToPop pushArea_target", false,-1);
        vcdp->declBus(c+145,"FiberTxBuffer pushToPop pushArea_data", false,-1, 6,0);
        vcdp->declBit(c+97,"FiberTxBuffer pushToPop io_input_fire", false,-1);
        vcdp->declBit(c+25,"FiberTxBuffer pushToPop popArea_stream_valid", false,-1);
        vcdp->declBit(c+457,"FiberTxBuffer pushToPop popArea_stream_ready", false,-1);
        vcdp->declBus(c+145,"FiberTxBuffer pushToPop popArea_stream_payload", false,-1, 6,0);
        vcdp->declBit(c+281,"FiberTxBuffer pushToPop popArea_target", false,-1);
        vcdp->declBit(c+25,"FiberTxBuffer pushToPop popArea_stream_fire", false,-1);
        vcdp->declBit(c+289,"FiberTxBuffer pushToPop popArea_hit", false,-1);
        vcdp->declBit(c+289,"FiberTxBuffer pushToPop outHitSignal_buffercc io_dataIn", false,-1);
        vcdp->declBit(c+225,"FiberTxBuffer pushToPop outHitSignal_buffercc io_dataOut", false,-1);
        vcdp->declBit(c+417,"FiberTxBuffer pushToPop outHitSignal_buffercc pushclk_clk", false,-1);
        vcdp->declBit(c+425,"FiberTxBuffer pushToPop outHitSignal_buffercc pushclk_reset", false,-1);
        vcdp->declBit(c+233,"FiberTxBuffer pushToPop outHitSignal_buffercc buffers_0", false,-1);
        vcdp->declBit(c+225,"FiberTxBuffer pushToPop outHitSignal_buffercc buffers_1", false,-1);
        vcdp->declBit(c+345,"FiberTxBuffer pushToPop pushArea_target_buffercc io_dataIn", false,-1);
        vcdp->declBit(c+281,"FiberTxBuffer pushToPop pushArea_target_buffercc io_dataOut", false,-1);
        vcdp->declBit(c+433,"FiberTxBuffer pushToPop pushArea_target_buffercc popclk_clk", false,-1);
        vcdp->declBit(c+441,"FiberTxBuffer pushToPop pushArea_target_buffercc popclk_reset", false,-1);
        vcdp->declBit(c+297,"FiberTxBuffer pushToPop pushArea_target_buffercc buffers_0", false,-1);
        vcdp->declBit(c+281,"FiberTxBuffer pushToPop pushArea_target_buffercc buffers_1", false,-1);
    }
}

void VFiberTxBuffer::traceFullThis__1(VFiberTxBuffer__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VFiberTxBuffer* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->fullBit(c+1,(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__popArea_stream_valid));
        vcdp->fullBit(c+9,(vlTOPp->FiberTxBuffer__DOT__push_full));
        vcdp->fullBit(c+17,(vlTOPp->FiberTxBuffer__DOT__popToPush_io_input_ready));
        vcdp->fullBit(c+25,(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__popArea_stream_valid));
        vcdp->fullBit(c+33,(vlTOPp->FiberTxBuffer__DOT__pop_cmd_valid));
        vcdp->fullBit(c+41,(((IData)(vlTOPp->FiberTxBuffer__DOT__pop_cmd_valid) 
                             & (IData)(vlTOPp->FiberTxBuffer__DOT__pop_cmd_ready))));
        vcdp->fullBit(c+49,(vlTOPp->FiberTxBuffer__DOT__push_port_valid));
        vcdp->fullBus(c+57,(vlTOPp->FiberTxBuffer__DOT__push_port_payload_address),6);
        vcdp->fullBus(c+65,(vlTOPp->FiberTxBuffer__DOT__push_port_payload_data),32);
        vcdp->fullBit(c+73,(vlTOPp->FiberTxBuffer__DOT__push_doWrite));
        vcdp->fullBit(c+81,(vlTOPp->FiberTxBuffer__DOT__io_push_stream_fire));
        vcdp->fullBit(c+89,(vlTOPp->FiberTxBuffer__DOT__pop_cmd_ready));
        vcdp->fullBit(c+97,(vlTOPp->FiberTxBuffer__DOT__pushToPop_io_input_ready));
        vcdp->fullBit(c+105,(vlTOPp->FiberTxBuffer__DOT__when_FiberTxBuffer_l86));
        vcdp->fullBus(c+113,(vlTOPp->FiberTxBuffer__DOT__pop_pushPtr),7);
        vcdp->fullBit(c+121,(vlTOPp->FiberTxBuffer__DOT__pop_cleanup));
        vcdp->fullBit(c+129,(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__outHitSignal_buffercc__DOT__buffers_1));
        vcdp->fullBit(c+137,(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__outHitSignal_buffercc__DOT__buffers_0));
        vcdp->fullBus(c+145,(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_data),7);
        vcdp->fullBus(c+153,(vlTOPp->FiberTxBuffer__DOT__push_currentPtr),7);
        vcdp->fullBus(c+161,(vlTOPp->FiberTxBuffer__DOT__push_popPtr),7);
        vcdp->fullBus(c+169,(vlTOPp->FiberTxBuffer__DOT__push_length),7);
        vcdp->fullBit(c+177,(vlTOPp->FiberTxBuffer__DOT__push_drop));
        vcdp->fullBit(c+185,(vlTOPp->FiberTxBuffer__DOT__push_cleanup));
        vcdp->fullBit(c+193,(vlTOPp->FiberTxBuffer__DOT__push_commit));
        vcdp->fullBit(c+201,(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_target_buffercc__DOT__buffers_1));
        vcdp->fullBit(c+209,(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__popArea_hit));
        vcdp->fullBit(c+217,(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_target_buffercc__DOT__buffers_0));
        vcdp->fullBit(c+225,(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__outHitSignal_buffercc__DOT__buffers_1));
        vcdp->fullBit(c+233,(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__outHitSignal_buffercc__DOT__buffers_0));
        vcdp->fullBus(c+241,(vlTOPp->FiberTxBuffer__DOT__push_buffer),24);
        vcdp->fullBus(c+249,(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_data),7);
        vcdp->fullBus(c+257,(vlTOPp->FiberTxBuffer__DOT__pop_currentPtr),7);
        vcdp->fullBus(c+265,((0x3fU & (IData)(vlTOPp->FiberTxBuffer__DOT__pop_currentPtr))),6);
        vcdp->fullBit(c+273,(vlTOPp->FiberTxBuffer__DOT__popToPush__DOT__pushArea_target));
        vcdp->fullBit(c+281,(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target_buffercc__DOT__buffers_1));
        vcdp->fullBit(c+289,(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__popArea_hit));
        vcdp->fullBit(c+297,(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target_buffercc__DOT__buffers_0));
        vcdp->fullBus(c+305,(vlTOPp->FiberTxBuffer__DOT__push_state),2);
        vcdp->fullBit(c+313,((0U == (IData)(vlTOPp->FiberTxBuffer__DOT__push_state))));
        vcdp->fullBit(c+321,((1U == (IData)(vlTOPp->FiberTxBuffer__DOT__push_state))));
        vcdp->fullBit(c+329,((2U == (IData)(vlTOPp->FiberTxBuffer__DOT__push_state))));
        vcdp->fullBit(c+337,((3U == (IData)(vlTOPp->FiberTxBuffer__DOT__push_state))));
        vcdp->fullBit(c+345,(vlTOPp->FiberTxBuffer__DOT__pushToPop__DOT__pushArea_target));
        vcdp->fullBit(c+353,(vlTOPp->io_push_stream_valid));
        vcdp->fullBit(c+361,(vlTOPp->io_push_stream_ready));
        vcdp->fullBit(c+369,(vlTOPp->io_push_stream_payload_last));
        vcdp->fullBus(c+377,(vlTOPp->io_push_stream_payload_fragment),8);
        vcdp->fullBit(c+385,(vlTOPp->io_pop_stream_valid));
        vcdp->fullBit(c+393,(vlTOPp->io_pop_stream_ready));
        vcdp->fullBus(c+401,(vlTOPp->io_pop_stream_payload),32);
        vcdp->fullBit(c+409,(vlTOPp->io_pop_last));
        vcdp->fullBit(c+417,(vlTOPp->pushclk_clk));
        vcdp->fullBit(c+425,(vlTOPp->pushclk_reset));
        vcdp->fullBit(c+433,(vlTOPp->popclk_clk));
        vcdp->fullBit(c+441,(vlTOPp->popclk_reset));
        vcdp->fullBit(c+449,(((IData)(vlTOPp->io_push_stream_valid) 
                              & (IData)(vlTOPp->io_push_stream_ready))));
        vcdp->fullBit(c+457,(1U));
    }
}
