// ***************************************************************************
// ***************************************************************************
// Copyright 2014 - 2017 (c) Analog Devices, Inc. All rights reserved.
//
// In this HDL repository, there are many different and unique modules, consisting
// of various HDL (Verilog or VHDL) components. The individual modules are
// developed independently, and may be accompanied by separate and unique license
// terms.
//
// The user should read each of these license terms, and understand the
// freedoms and responsibilities that he or she has by using this source/core.
//
// This core is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE.
//
// Redistribution and use of source or resulting binaries, with or without modification
// of this file, are permitted under one of the following two license terms:
//
//   1. The GNU General Public License version 2 as published by the
//      Free Software Foundation, which can be found in the top level directory
//      of this repository (LICENSE_GPL2), and also online at:
//      <https://www.gnu.org/licenses/old-licenses/gpl-2.0.html>
//
// OR
//
//   2. An ADI specific BSD license, which can be found in the top level directory
//      of this repository (LICENSE_ADIBSD), and also on-line at:
//      https://github.com/analogdevicesinc/hdl/blob/master/LICENSE_ADIBSD
//      This will allow to generate bit files and not release the source code,
//      as long as it attaches to an ADI device.
//
// ***************************************************************************
// ***************************************************************************

`timescale 1ns/100ps


module system_top #(
    parameter TX_JESD_L = 8,
    parameter TX_NUM_LINKS = 1,
    parameter RX_JESD_L = 8,
    parameter RX_NUM_LINKS = 1
  ) (

  input         sys_rst_n,
  input         sys_clk_p,
  input         sys_clk_n,

  input         uart_sin,
  output        uart_sout,

  output        ddr4_act_n,
  output [16:0] ddr4_adr,
  output [ 1:0] ddr4_ba,
  output [ 1:0] ddr4_bg,
  output [ 0:0] ddr4_ck_t,
  output [ 0:0] ddr4_ck_c,
  output [ 0:0] ddr4_cke,
  output [ 0:0] ddr4_cs_n,
  inout  [ 7:0] ddr4_dm_n,
  inout  [63:0] ddr4_dq,
  inout  [ 7:0] ddr4_dqs_t,
  inout  [ 7:0] ddr4_dqs_c,
  output [ 0:0] ddr4_odt,
  output        ddr4_reset_n,
  output        ddr4_init_calib_complete,

  output [ 0:0] phy_rst_n,
  output        phy_mdc,
  inout         phy_mdio,
  input         phy_rx_clk,
  input         phy_rx_ctrl,
  input  [ 3:0] phy_rx_data,
  output        phy_tx_clk,
  output        phy_tx_ctrl,
  output [ 3:0] phy_tx_data,

  inout  [16:0] gpio_bd,

  output        iic_rstn,
  inout         iic_scl,
  inout         iic_sda,

  //input         vadj_1v8_pgood,

  // FMC HPC IOs
  input  [1:0]  agc0,
  input  [1:0]  agc1,
  input  [1:0]  agc2,
  input  [1:0]  agc3,
  input         clkin8_n,
  input         clkin8_p,
  input         clkin6_n,
  input         clkin6_p,
  input         fpga_refclk_in_n,
  input         fpga_refclk_in_p,
  input         fpga_refclk_in_replica_n,
  input         fpga_refclk_in_replica_p,
  input  [RX_JESD_L*RX_NUM_LINKS-1:0]  rx_data_n,
  input  [RX_JESD_L*RX_NUM_LINKS-1:0]  rx_data_p,
  output [TX_JESD_L*TX_NUM_LINKS-1:0]  tx_data_n,
  output [TX_JESD_L*TX_NUM_LINKS-1:0]  tx_data_p,
  input  [TX_NUM_LINKS-1:0]  fpga_syncin_n,
  input  [TX_NUM_LINKS-1:0]  fpga_syncin_p,
  output [RX_NUM_LINKS-1:0]  fpga_syncout_n,
  output [RX_NUM_LINKS-1:0]  fpga_syncout_p,
//  inout  [10:0] gpio,
  inout         hmc_gpio1,
  output        hmc_sync,
  input  [1:0]  irqb,
  output        rstb,
  output [1:0]  rxen,
  output        spi0_csb,
  input         spi0_miso,
  output        spi0_mosi,
  output        spi0_sclk,
  output        spi1_csb,
  output        spi1_sclk,
  inout         spi1_sdio,
  input         sysref2_n,
  input         sysref2_p,
  output [1:0]  txen

);

  // internal signals

  wire    [63:0]  gpio_i;
  wire    [63:0]  gpio_o;
  wire    [63:0]  gpio_t;
  wire    [ 7:0]  spi_csn;
  wire            spi_mosi;
  wire            spi_miso;
  wire            spi1_miso;

  wire            ref_clk;
  wire            ref_clk_replica;
  wire            sysref;
  wire    [TX_NUM_LINKS-1:0]   tx_syncin;
  wire    [RX_NUM_LINKS-1:0]   rx_syncout;

  wire    [7:0]   tx_data_p_loc;
  wire    [7:0]   tx_data_n_loc;

  wire            clkin6;
  wire            clkin8;
  wire            tx_device_clk;
  wire            rx_device_clk;

  assign iic_rstn = 1'b1;

  // instantiations

  IBUFDS_GTE4 i_ibufds_ref_clk (
    .CEB (1'd0),
    .I (fpga_refclk_in_p),
    .IB (fpga_refclk_in_n),
    .O (ref_clk),
    .ODIV2 ());

  IBUFDS_GTE4 i_ibufds_ref_clk_replica (
    .CEB (1'd0),
    .I (fpga_refclk_in_replica_p),
    .IB (fpga_refclk_in_replica_n),
    .O (ref_clk_replica),
    .ODIV2 ());

  IBUFDS i_ibufds_sysref (
    .I (sysref2_p),
    .IB (sysref2_n),
    .O (sysref));

  IBUFDS i_ibufds_device_clk (
    .I (clkin6_p),
    .IB (clkin6_n),
    .O (clkin6));

  IBUFDS_GTE4 i_ibufds_rx_device_clk (
    .I (clkin8_p),
    .IB (clkin8_n),
    .CEB(1'b0),
    .ODIV2 (clkin8));

  genvar i;
  generate
  for(i=0;i<TX_NUM_LINKS;i=i+1) begin : g_tx_buffers
    IBUFDS i_ibufds_syncin (
      .I (fpga_syncin_p[i]),
      .IB (fpga_syncin_n[i]),
      .O (tx_syncin[i]));
  end

  for(i=0;i<RX_NUM_LINKS;i=i+1) begin : g_rx_buffers
    OBUFDS i_obufds_syncout (
      .I (rx_syncout[i]),
      .O (fpga_syncout_p[i]),
      .OB (fpga_syncout_n[i]));
  end
  endgenerate

  BUFG i_tx_device_clk (
    .I (clkin6),
    .O (tx_device_clk)
  );

  BUFG_GT i_rx_device_clk (
    .I (clkin8),
    .O (rx_device_clk)
  );
  // spi

  assign spi0_csb   = spi_csn[0];
  assign spi0_mosi  = spi_mosi;
  assign spi0_sclk  = spi_clk;

  assign spi1_csb   = spi_csn[1];
  assign spi1_sclk  = spi_clk;

  assign spi_miso = ~spi_csn[0] ? spi0_miso :
                    ~spi_csn[1] ? spi1_miso : 1'b0;

  ad_3w_spi #(.NUM_OF_SLAVES(1)) i_spi (
    .spi_csn (spi_csn[1]),
    .spi_clk (spi_clk),
    .spi_mosi (spi_mosi),
    .spi_miso (spi1_miso),
    .spi_sdio (spi1_sdio),
    .spi_dir ());

  // gpios

  ad_iobuf #(.DATA_WIDTH(1)) i_iobuf (
    .dio_t (gpio_t[43:43]),
    .dio_i (gpio_o[43:43]),
    .dio_o (gpio_i[43:43]),
    .dio_p ({hmc_gpio1 }));   // 43
//             gpio[10:0]}));   // 42-32

  assign gpio_i[44] = agc0[0];
  assign gpio_i[45] = agc0[1];
  assign gpio_i[46] = agc1[0];
  assign gpio_i[47] = agc1[1];
  assign gpio_i[48] = agc2[0];
  assign gpio_i[49] = agc2[1];
  assign gpio_i[50] = agc3[0];
  assign gpio_i[51] = agc3[1];
  assign gpio_i[52] = irqb[0];
  assign gpio_i[53] = irqb[1];

  assign hmc_sync         = gpio_o[54];
  assign rstb             = gpio_o[55];
  assign rxen[0]          = gpio_o[56];
  assign rxen[1]          = gpio_o[57];
  assign txen[0]          = gpio_o[58];
  assign txen[1]          = gpio_o[59];


  ad_iobuf #(.DATA_WIDTH(17)) i_iobuf_bd (
    .dio_t (gpio_t[16:0]),
    .dio_i (gpio_o[16:0]),
    .dio_o (gpio_i[16:0]),
    .dio_p (gpio_bd));

  assign gpio_i[63:54] = gpio_o[63:54];
  assign gpio_i[42:32] = gpio_o[42:32];
  assign gpio_i[31:17] = gpio_o[31:17];


  system_wrapper i_system_wrapper (
    .sys_rst (~sys_rst_n),
    .sys_clk_clk_n (sys_clk_n),
    .sys_clk_clk_p (sys_clk_p),
    .ddr4_act_n (ddr4_act_n),
    .ddr4_adr (ddr4_adr),
    .ddr4_ba (ddr4_ba),
    .ddr4_bg (ddr4_bg),
    .ddr4_ck_c (ddr4_ck_c),
    .ddr4_ck_t (ddr4_ck_t),
    .ddr4_cke (ddr4_cke),
    .ddr4_cs_n (ddr4_cs_n),
    .ddr4_dm_n (ddr4_dm_n),
    .ddr4_dq (ddr4_dq),
    .ddr4_dqs_c (ddr4_dqs_c),
    .ddr4_dqs_t (ddr4_dqs_t),
    .ddr4_odt (ddr4_odt),
    .ddr4_reset_n (ddr4_reset_n),
    .ddr4_init_calib_complete (ddr4_init_calib_complete),
    .phy_rst_n(phy_rst_n),
    .mdio_mdc (phy_mdc),
    .mdio_mdio_io (phy_mdio),
    .rgmii_rd (phy_rx_data),
    .rgmii_rx_ctl (phy_rx_ctrl),
    .rgmii_rxc (phy_rx_clk),
    .rgmii_td (phy_tx_data),
    .rgmii_tx_ctl (phy_tx_ctrl),
    .rgmii_txc (phy_tx_clk),
    .iic_main_scl_io (iic_scl),
    .iic_main_sda_io (iic_sda),
    .uart_sin (uart_sin),
    .uart_sout (uart_sout),
    .spi_clk_i (spi_clk),
    .spi_clk_o (spi_clk),
    .spi_csn_i (spi_csn),
    .spi_csn_o (spi_csn),
    .spi_sdi_i (spi_miso),
    .spi_sdo_i (spi_mosi),
    .spi_sdo_o (spi_mosi),
    .gpio0_i (gpio_i[31:0]),
    .gpio0_o (gpio_o[31:0]),
    .gpio0_t (gpio_t[31:0]),
    .gpio1_i (gpio_i[63:32]),
    .gpio1_o (gpio_o[63:32]),
    .gpio1_t (gpio_t[63:32]),
    // FMC HPC
    .rx_data_0_n (rx_data_n[0]),
    .rx_data_0_p (rx_data_p[0]),
    .rx_data_1_n (rx_data_n[1]),
    .rx_data_1_p (rx_data_p[1]),
    .rx_data_2_n (rx_data_n[2]),
    .rx_data_2_p (rx_data_p[2]),
    .rx_data_3_n (rx_data_n[3]),
    .rx_data_3_p (rx_data_p[3]),
    .rx_data_4_n (rx_data_n[4]),
    .rx_data_4_p (rx_data_p[4]),
    .rx_data_5_n (rx_data_n[5]),
    .rx_data_5_p (rx_data_p[5]),
    .rx_data_6_n (rx_data_n[6]),
    .rx_data_6_p (rx_data_p[6]),
    .rx_data_7_n (rx_data_n[7]),
    .rx_data_7_p (rx_data_p[7]),
    .tx_data_0_n (tx_data_n_loc[0]),
    .tx_data_0_p (tx_data_p_loc[0]),
    .tx_data_1_n (tx_data_n_loc[1]),
    .tx_data_1_p (tx_data_p_loc[1]),
    .tx_data_2_n (tx_data_n_loc[2]),
    .tx_data_2_p (tx_data_p_loc[2]),
    .tx_data_3_n (tx_data_n_loc[3]),
    .tx_data_3_p (tx_data_p_loc[3]),
    .tx_data_4_n (tx_data_n_loc[4]),
    .tx_data_4_p (tx_data_p_loc[4]),
    .tx_data_5_n (tx_data_n_loc[5]),
    .tx_data_5_p (tx_data_p_loc[5]),
    .tx_data_6_n (tx_data_n_loc[6]),
    .tx_data_6_p (tx_data_p_loc[6]),
    .tx_data_7_n (tx_data_n_loc[7]),
    .tx_data_7_p (tx_data_p_loc[7]),
    .ref_clk_q0 (ref_clk),
    .ref_clk_q1 (ref_clk_replica),
    .rx_device_clk (rx_device_clk),
    .tx_device_clk (tx_device_clk),
    .rx_sync_0 (rx_syncout),
    .tx_sync_0 (tx_syncin),
    .rx_sysref_0 (sysref),
    .tx_sysref_0 (sysref)
  );

  assign tx_data_p[TX_JESD_L*TX_NUM_LINKS-1:0] = tx_data_p_loc[TX_JESD_L*TX_NUM_LINKS-1:0];
  assign tx_data_n[TX_JESD_L*TX_NUM_LINKS-1:0] = tx_data_n_loc[TX_JESD_L*TX_NUM_LINKS-1:0];

endmodule

// ***************************************************************************
// ***************************************************************************
