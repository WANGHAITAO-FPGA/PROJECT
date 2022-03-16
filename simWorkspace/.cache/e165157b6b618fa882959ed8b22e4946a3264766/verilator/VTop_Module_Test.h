// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _VTOP_MODULE_TEST_H_
#define _VTOP_MODULE_TEST_H_  // guard

#include "verilated_heavy.h"

//==========

class VTop_Module_Test__Syms;
class VTop_Module_Test_VerilatedVcd;


//----------

VL_MODULE(VTop_Module_Test) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(vme_clk,0,0);
    VL_IN8(gssl_clk,0,0);
    VL_IN8(reset,0,0);
    VL_IN8(cyp1401_GSSL_RXCLK_B,0,0);
    VL_IN8(cyp1401_GSSL_RXCLK_C,0,0);
    VL_IN8(vme_am,5,0);
    VL_IN8(vme_as,0,0);
    VL_IN8(vme_ds0,0,0);
    VL_IN8(vme_ds1,0,0);
    VL_IN8(vme_write,0,0);
    VL_IN8(vme_lword,0,0);
    VL_IN8(vme_iack,0,0);
    VL_OUT8(vme_dtack,0,0);
    VL_OUT8(vme_beer,0,0);
    VL_OUT8(vme_retry,0,0);
    VL_OUT8(vme_irq,6,0);
    VL_IN8(vme_iackin,0,0);
    VL_OUT8(vme_iackout,0,0);
    VL_OUT8(data_writeEnable,0,0);
    VL_IN8(gap,3,0);
    VL_IN8(sw,3,0);
    VL_IN8(gap4,0,0);
    VL_OUT8(datadir,0,0);
    VL_IN8(cyp1401_GSSL_A_LOS,0,0);
    VL_IN8(cyp1401_GSSL_B_LOS,0,0);
    VL_IN8(cyp1401_GSSL_C_LOS,0,0);
    VL_IN8(cyp1401_GSSL_A_TXFAULT,0,0);
    VL_IN8(cyp1401_GSSL_B_TXFAULT,0,0);
    VL_IN8(cyp1401_GSSL_C_TXFAULT,0,0);
    VL_OUT8(cyp1401_GSSL_REFCLK_ABCD,0,0);
    VL_OUT8(cyp1401_GSSL_INSEL_A,0,0);
    VL_OUT8(cyp1401_GSSL_INSEL_B,0,0);
    VL_OUT8(cyp1401_GSSL_INSEL_C,0,0);
    VL_OUT8(cyp1401_GSSL_TXOPA,0,0);
    VL_OUT8(cyp1401_GSSL_TXOPB,0,0);
    VL_OUT8(cyp1401_GSSL_TXOPC,0,0);
    VL_OUT8(cyp1401_GSSL_SPDSEL_ABCD,0,0);
    VL_OUT8(cyp1401_GSSL_LPEN_ABCD,0,0);
    VL_OUT8(cyp1401_GSSL_TRSTZ_N_ABCD,0,0);
    VL_OUT8(cyp1401_GSSL_MODE_A,2,0);
    VL_OUT8(cyp1401_GSSL_MODE_B,2,0);
    VL_OUT8(cyp1401_GSSL_MODE_C,2,0);
    VL_IN8(cyp1401_GSSL_RXCLK_A,0,0);
    VL_IN8(cyp1401_GSSL_RXST0_A,2,0);
    VL_IN8(cyp1401_GSSL_RXD_A,7,0);
    VL_OUT8(cyp1401_GSSL_TXCT0_A,2,0);
    VL_OUT8(cyp1401_GSSL_TXD_A,7,0);
    VL_IN8(cyp1401_GSSL_RXST0_B,2,0);
    VL_IN8(cyp1401_GSSL_RXD_B,7,0);
    VL_OUT8(cyp1401_GSSL_TXCT0_B,2,0);
    VL_OUT8(cyp1401_GSSL_TXD_B,7,0);
    VL_IN8(cyp1401_GSSL_RXST0_C,2,0);
    VL_IN8(cyp1401_GSSL_RXD_C,7,0);
    VL_OUT8(cyp1401_GSSL_TXCT0_C,2,0);
    VL_OUT8(cyp1401_GSSL_TXD_C,7,0);
    VL_OUT8(rx_led,0,0);
    VL_OUT8(led,0,0);
    VL_IN16(data_read,15,0);
    VL_OUT16(data_write,15,0);
    VL_IN(vme_addr,23,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    // Anonymous structures to workaround compiler member-count bugs
    struct {
        CData/*0:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_ledtemp;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_counter_willClear;
        CData/*0:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_lwr;
        CData/*0:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_lrd;
        CData/*0:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_apb_apb_PSEL;
        CData/*0:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_addr_pass_data1;
        CData/*0:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_addr_pass_data;
        CData/*0:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_ds;
        CData/*0:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_dtack;
        CData/*0:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count_shot_out_regNext;
        CData/*0:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_ds_regNext;
        CData/*0:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__dff_1_q;
        CData/*7:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_posarea_counter;
        CData/*0:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__dff_1__DOT__dff_area_buffer;
        CData/*0:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_readError;
        CData/*0:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_doWrite;
        CData/*0:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_doRead;
        CData/*0:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_1;
        CData/*0:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_3;
        CData/*0:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_5;
        CData/*0:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_7;
        CData/*0:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_9;
        CData/*0:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__when_RegInst_l153_11;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A_io_clear;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B_io_clear;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A_io_full;
        CData/*2:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a_GSSL_TXCT0;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B_io_full;
        CData/*2:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b_GSSL_TXCT0;
        CData/*2:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c_GSSL_TXCT0;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_rx_done_b;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_rx_b_ttctriger;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_done_b_delay1;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_done_b_delay2;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b_rx_frame_done_delay_1;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b_rx_frame_done_delay_2;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_b_ttctriger_delay1;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_b_ttctriger_delay2;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_1;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_2;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__gsslResetUnbuffered;
        CData/*7:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__GSSL_Reset_Counter;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__when_CYP1401_l91;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__gsslResetUnbuffered_regNext;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__inhibitFull;
        CData/*7:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_k;
        CData/*7:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_encode_data;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_busy;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_done;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd;
        CData/*3:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state;
        CData/*3:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__inhibitFull;
        CData/*7:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_k;
        CData/*7:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_encode_data;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_busy;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_done;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd;
        CData/*3:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state;
        CData/*3:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state;
        CData/*7:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_dpram_raddress;
    };
    struct {
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_k;
        CData/*7:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_encode_data;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_busy;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_done;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_dpram_rd;
        CData/*3:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state;
        CData/*3:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state;
        CData/*7:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_waddress;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_wr;
        CData/*7:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_status_data;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_busy;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_done;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXST0_out;
        CData/*7:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_RXD_out;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b;
        CData/*3:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state;
        CData/*3:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gssl_rx_led__DOT__when_CYP1401_l208;
        CData/*7:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_dpram_waddress;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_dpram_wr;
        CData/*7:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_status_data;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_ttc_trigger;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_atc_trigger;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_busy;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_done;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_len_err;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_chs_err;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_scd_err;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXST0_out;
        CData/*7:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_RXD_out;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_dpram_wr_b;
        CData/*3:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state;
        CData/*3:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag;
        CData/*0:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gssl_rx_led__DOT__when_CYP1401_l208;
        SData/*14:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode_laddr;
        SData/*15:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__busslave_readData;
        SData/*15:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg0;
        SData/*15:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg1;
        SData/*15:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg2;
        SData/*15:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg3;
        SData/*15:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg4;
        SData/*15:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg5;
        SData/*15:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg6;
        SData/*15:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg7;
        SData/*15:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg8;
        SData/*15:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg9;
        SData/*15:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg10;
        SData/*15:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT__VME_Reg11;
        SData/*9:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs;
        SData/*9:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n;
        SData/*8:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter;
        SData/*9:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs;
        SData/*9:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n;
        SData/*8:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter;
        SData/*9:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs;
        SData/*9:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n;
        SData/*8:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter;
    };
    struct {
        SData/*9:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs;
        SData/*9:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n;
        SData/*8:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter;
        SData/*9:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs;
        SData/*9:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs_n;
        SData/*8:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_vme_data_0;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_vme_data_1;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_vme_data_2;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_vme_data_3;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_vme_data_4;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_vme_data_5;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_sensor_data_0;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_sensor_data_1;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_sensor_data_2;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_sensor_data_3;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_sensor_data_4;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_sensor_data_5;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_sensor_data_6;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_sensor_data_7;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_sensor_data_8;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_sensor_data_9;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_sensor_data_10;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_sensor_data_11;
        IData/*25:0*/ Top_Module_Test__DOT__gssl_area_counter_valueNext;
        IData/*25:0*/ Top_Module_Test__DOT__gssl_area_counter_value;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_0;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_1;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_2;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_3;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_4;
        IData/*31:0*/ Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_reg__DOT___zz_vme_data_5;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT___zz_gssl_txarea_roms_port0;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_0;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_1;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_2;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_3;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_4;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_5;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_6;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_7;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_8;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_9;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_10;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_sensor_regs_11;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT___zz_counter;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__counter;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT___zz_counter;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__counter;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_dpram_data;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gssl_rx_led__DOT__counter;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_dpram_data;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_reg;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gssl_rx_led__DOT__counter;
        IData/*31:0*/ Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_roms[256];
    };
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    CData/*0:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_ledtemp;
    CData/*7:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_cyp1401_init__DOT__GSSL_Reset_Counter;
    CData/*3:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_state;
    CData/*3:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__next_state;
    CData/*0:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter_tx_frame_busy;
    CData/*3:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_state;
    CData/*3:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__next_state;
    CData/*0:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter_tx_frame_busy;
    CData/*3:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_state;
    CData/*3:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__next_state;
    CData/*0:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter_tx_frame_busy;
    CData/*3:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_state;
    CData/*3:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__next_state;
    CData/*0:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag;
    CData/*3:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_state;
    CData/*3:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__next_state;
    CData/*0:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_frame_head_flag;
    CData/*0:0*/ __VinpClk__TOP__Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf;
    CData/*0:0*/ __Vclklast__TOP__cyp1401_GSSL_RXCLK_B;
    CData/*0:0*/ __Vclklast__TOP__cyp1401_GSSL_RXCLK_C;
    CData/*0:0*/ __Vclklast__TOP__vme_clk;
    CData/*0:0*/ __Vclklast__TOP__gssl_clk;
    CData/*0:0*/ __Vclklast__TOP__reset;
    CData/*0:0*/ __Vclklast__TOP____VinpClk__TOP__Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf;
    CData/*0:0*/ __Vchglast__TOP__Top_Module_Test__DOT__vme_area_vme_module__DOT__vme_area_vme_decode__DOT__vme_area_os_count__DOT__oneshot_negarea_shot_clk_buf;
    SData/*9:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs;
    SData/*9:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n;
    SData/*8:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter;
    SData/*9:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs;
    SData/*9:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n;
    SData/*8:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter;
    SData/*9:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs;
    SData/*9:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_byte_chs_n;
    SData/*8:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_counter;
    SData/*8:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter;
    SData/*9:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs;
    SData/*8:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_word_counter;
    SData/*9:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver__DOT__rx_byte_chs;
    IData/*31:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_a__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg;
    IData/*31:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_b__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg;
    IData/*31:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_gssl_tx_c__DOT__gssl_area_gssltxtransmitter__DOT__tx_word_reg;
    IData/*31:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT___zz_gssl_txarea_roms_port0;
    IData/*31:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_tx_temp;
    IData/*31:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_A__DOT__counter;
    IData/*31:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_txarea_timer_B__DOT__counter;
    IData/*31:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data;
    IData/*31:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_b_rx_module_b__DOT__gssl_area_gssl_rx_led__DOT__counter;
    IData/*31:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gsslrxreceiver_rx_frame_head_data;
    IData/*31:0*/ __Vdly__Top_Module_Test__DOT__gssl_area_gssl_module__DOT__gssl_rxarea_c_rx_module_C__DOT__gssl_area_gssl_rx_led__DOT__counter;
    IData/*31:0*/ __Vm_traceActivity;
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    VTop_Module_Test__Syms* __VlSymsp;  // Symbol table
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(VTop_Module_Test);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible with respect to DPI scope names.
    VTop_Module_Test(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~VTop_Module_Test();
    /// Trace signals in the model; called by application code
    void trace(VerilatedVcdC* tfp, int levels, int options = 0);
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval() { eval_step(); }
    /// Evaluate when calling multiple units/models per time step.
    void eval_step();
    /// Evaluate at end of a timestep for tracing, when using eval_step().
    /// Application must call after all eval() and before time changes.
    void eval_end_step() {}
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(VTop_Module_Test__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(VTop_Module_Test__Syms* symsp, bool first);
  private:
    static QData _change_request(VTop_Module_Test__Syms* __restrict vlSymsp);
    static QData _change_request_1(VTop_Module_Test__Syms* __restrict vlSymsp);
  public:
    static void _combo__TOP__2(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _combo__TOP__30(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _combo__TOP__39(VTop_Module_Test__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset() VL_ATTR_COLD;
  public:
    static void _eval(VTop_Module_Test__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif  // VL_DEBUG
  public:
    static void _eval_initial(VTop_Module_Test__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _eval_settle(VTop_Module_Test__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _initial__TOP__24(VTop_Module_Test__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _multiclk__TOP__38(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__11(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__13(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__14(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__15(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__16(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__18(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__19(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__21(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__22(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__23(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__25(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__26(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__27(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__28(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__29(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__31(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__32(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__33(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__34(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__35(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__36(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__37(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__40(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__41(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__5(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__6(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__8(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _sequent__TOP__9(VTop_Module_Test__Syms* __restrict vlSymsp);
    static void _settle__TOP__1(VTop_Module_Test__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void traceChgThis(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__10(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__11(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__12(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__13(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__14(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__16(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__17(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__18(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__19(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__2(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__20(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__21(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__22(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__23(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__24(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__25(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__26(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__27(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__3(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__4(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__5(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__6(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__7(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__8(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__9(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceFullThis(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceFullThis__1(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceFullThis__15(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceFullThis__28(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInitThis(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInitThis__1(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInitThis__2(VTop_Module_Test__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
