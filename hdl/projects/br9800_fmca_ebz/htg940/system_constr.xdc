#
## mxfe
#

set_property         -dict {PACKAGE_PIN D26  IOSTANDARD LVCMOS18                                     } [get_ports agc0[0]                   ]    ; ## USER_IO20_FMC_A
set_property         -dict {PACKAGE_PIN F25  IOSTANDARD LVCMOS18                                     } [get_ports agc0[1]                   ]    ; ## USER_IO21_FMC_A
set_property         -dict {PACKAGE_PIN K21  IOSTANDARD LVCMOS18                                     } [get_ports agc1[0]                   ]    ; ## USER_IO22_FMC_A
set_property         -dict {PACKAGE_PIN H22  IOSTANDARD LVCMOS18                                     } [get_ports agc1[1]                   ]    ; ## USER_IO23_FMC_A
set_property         -dict {PACKAGE_PIN BB16 IOSTANDARD LVCMOS18                                     } [get_ports agc2[0]                   ]    ; ## USER_IO44_FMC_D
set_property         -dict {PACKAGE_PIN AT14 IOSTANDARD LVCMOS18                                     } [get_ports agc2[1]                   ]    ; ## USER_IO45_FMC_D
set_property         -dict {PACKAGE_PIN M26  IOSTANDARD LVCMOS18                                     } [get_ports agc3[0]                   ]    ; ## USER_IO46_FMC_D
set_property         -dict {PACKAGE_PIN E26  IOSTANDARD LVCMOS18                                     } [get_ports agc3[1]                   ]    ; ## USER_IO47_FMC_D
set_property         -dict {PACKAGE_PIN J18  IOSTANDARD LVDS     DIFF_TERM_ADV TERM_100 DQS_BIAS TRUE} [get_ports clkin6_n                  ]    ; ## FMC_A_CLK[0]_M2C_N
set_property         -dict {PACKAGE_PIN K18  IOSTANDARD LVDS     DIFF_TERM_ADV TERM_100 DQS_BIAS TRUE} [get_ports clkin6_p                  ]    ; ## FMC_A_CLK[0]_M2C_P
set_property         -dict {PACKAGE_PIN B10                                                          } [get_ports clkin8_n                  ]    ; ## GTY_233_REFCLK_N
set_property         -dict {PACKAGE_PIN B11                                                          } [get_ports clkin8_p                  ]    ; ## GTY_233_REFCLK_P 
set_property         -dict {PACKAGE_PIN K10                                                          } [get_ports fpga_refclk_in_n          ]    ; ## GTY_231_REFCLK_N 
set_property         -dict {PACKAGE_PIN K11                                                          } [get_ports fpga_refclk_in_p          ]    ; ## GTY_231_REFCLK_P 
set_property         -dict {PACKAGE_PIN P10                                                          } [get_ports fpga_refclk_in_replica_n  ]    ; ## GTY_230_REFCLK_N 
set_property         -dict {PACKAGE_PIN P11                                                          } [get_ports fpga_refclk_in_replica_p  ]    ; ## GTY_230_REFCLK_P
set_property  -quiet -dict {PACKAGE_PIN L3                                                           } [get_ports rx_data_n[2]              ]    ; ## MGTYRXN2_231               FMC_A_DP[10]_M2C_N
set_property  -quiet -dict {PACKAGE_PIN L4                                                           } [get_ports rx_data_p[2]              ]    ; ## MGTYRXP2_231               FMC_A_DP[10]_M2C_P
set_property  -quiet -dict {PACKAGE_PIN N3                                                           } [get_ports rx_data_n[0]              ]    ; ## MGTYRXN0_231               FMC_A_DP[8]_M2C_N
set_property  -quiet -dict {PACKAGE_PIN N4                                                           } [get_ports rx_data_p[0]              ]    ; ## MGTYRXP0_231               FMC_A_DP[8]_M2C_P
set_property  -quiet -dict {PACKAGE_PIN U3                                                           } [get_ports rx_data_n[7]              ]    ; ## MGTYRXN3_230               FMC_A_DP[15]_M2C_N
set_property  -quiet -dict {PACKAGE_PIN U4                                                           } [get_ports rx_data_p[7]              ]    ; ## MGTYRXP3_230               FMC_A_DP[15]_M2C_P
set_property  -quiet -dict {PACKAGE_PIN R3                                                           } [get_ports rx_data_n[6]              ]    ; ## MGTYRXN2_230               FMC_A_DP[14]_M2C_N
set_property  -quiet -dict {PACKAGE_PIN R4                                                           } [get_ports rx_data_p[6]              ]    ; ## MGTYRXP2_230               FMC_A_DP[14]_M2C_P
set_property  -quiet -dict {PACKAGE_PIN T1                                                           } [get_ports rx_data_n[5]              ]    ; ## MGTYRXN1_230               FMC_A_DP[13]_M2C_N
set_property  -quiet -dict {PACKAGE_PIN T2                                                           } [get_ports rx_data_p[5]              ]    ; ## MGTYRXP1_230               FMC_A_DP[13]_M2C_P
set_property  -quiet -dict {PACKAGE_PIN P1                                                           } [get_ports rx_data_n[4]              ]    ; ## MGTYRXN0_230               FMC_A_DP[12]_M2C_N
set_property  -quiet -dict {PACKAGE_PIN P2                                                           } [get_ports rx_data_p[4]              ]    ; ## MGTYRXP0_230               FMC_A_DP[12]_M2C_P
set_property  -quiet -dict {PACKAGE_PIN M1                                                           } [get_ports rx_data_n[3]              ]    ; ## MGTYRXN3_231               FMC_A_DP[11]_M2C_N
set_property  -quiet -dict {PACKAGE_PIN M2                                                           } [get_ports rx_data_p[3]              ]    ; ## MGTYRXP3_231               FMC_A_DP[11]_M2C_P
set_property  -quiet -dict {PACKAGE_PIN N3                                                           } [get_ports rx_data_n[1]              ]    ; ## MGTYRXN1_231               FMC_A_DP[8]_M2C_N
set_property  -quiet -dict {PACKAGE_PIN N4                                                           } [get_ports rx_data_p[1]              ]    ; ## MGTYRXP1_231               FMC_A_DP[8]_M2C_P
set_property  -quiet -dict {PACKAGE_PIN N8                                                           } [get_ports tx_data_n[0]              ]    ; ## MGTYTXN0_231               FMC_A_DP[8]_C2M_N
set_property  -quiet -dict {PACKAGE_PIN N9                                                           } [get_ports tx_data_p[0]              ]    ; ## MGTYTXP0_231               FMC_A_DP[8]_C2M_P
set_property  -quiet -dict {PACKAGE_PIN L8                                                           } [get_ports tx_data_n[2]              ]    ; ## MGTYTXN2_231               FMC_A_DP[10]_C2M_N
set_property  -quiet -dict {PACKAGE_PIN L9                                                           } [get_ports tx_data_p[2]              ]    ; ## MGTYTXP2_231               FMC_A_DP[10]_C2M_P
set_property  -quiet -dict {PACKAGE_PIN U8                                                           } [get_ports tx_data_n[7]              ]    ; ## MGTYTXN3_230               FMC_A_DP[15]_C2M_N
set_property  -quiet -dict {PACKAGE_PIN U9                                                           } [get_ports tx_data_p[7]              ]    ; ## MGTYTXP3_230               FMC_A_DP[15]_C2M_P
set_property  -quiet -dict {PACKAGE_PIN R8                                                           } [get_ports tx_data_n[6]              ]    ; ## MGTYTXN2_230               FMC_A_DP[14]_C2M_N
set_property  -quiet -dict {PACKAGE_PIN R9                                                           } [get_ports tx_data_p[6]              ]    ; ## MGTYTXP2_230               FMC_A_DP[14]_C2M_P
set_property  -quiet -dict {PACKAGE_PIN K6                                                           } [get_ports tx_data_n[1]              ]    ; ## MGTYTXN1_121               FMC_A_DP[9]_C2M_N
set_property  -quiet -dict {PACKAGE_PIN K7                                                           } [get_ports tx_data_p[1]              ]    ; ## MGTYTXP1_121               FMC_A_DP[9]_C2M_P
set_property  -quiet -dict {PACKAGE_PIN T6                                                           } [get_ports tx_data_n[5]              ]    ; ## MGTYTXN1_230               FMC_A_DP[13]_C2M_N
set_property  -quiet -dict {PACKAGE_PIN T7                                                           } [get_ports tx_data_p[5]              ]    ; ## MGTYTXP1_230               FMC_A_DP[13]_C2M_P
set_property  -quiet -dict {PACKAGE_PIN P6                                                           } [get_ports tx_data_n[4]              ]    ; ## MGTYTXN0_230               FMC_A_DP[12]_C2M_N
set_property  -quiet -dict {PACKAGE_PIN P7                                                           } [get_ports tx_data_p[4]              ]    ; ## MGTYTXP0_230               FMC_A_DP[12]_C2M_P
set_property  -quiet -dict {PACKAGE_PIN M6                                                           } [get_ports tx_data_n[3]              ]    ; ## MGTYTXN3_231               FMC_A_DP[11]_C2M_N
set_property  -quiet -dict {PACKAGE_PIN M7                                                           } [get_ports tx_data_p[3]              ]    ; ## MGTYTXP3_231               FMC_A_DP[11]_C2M_P
set_property  -quiet -dict {PACKAGE_PIN AW19 IOSTANDARD LVDS     DIFF_TERM_ADV TERM_100              } [get_ports fpga_syncin_n[0]          ]    ; ## FMC_D_SYNC_M2C_N       
set_property  -quiet -dict {PACKAGE_PIN AV19 IOSTANDARD LVDS     DIFF_TERM_ADV TERM_100              } [get_ports fpga_syncin_p[0]          ]    ; ## FMC_D_SYNC_M2C_P
set_property  -quiet -dict {PACKAGE_PIN AW23 IOSTANDARD LVDS     DIFF_TERM_ADV TERM_100              } [get_ports fpga_syncin_n[1]          ]    ; ## FMC_C_SYNC_M2C_N
set_property  -quiet -dict {PACKAGE_PIN AV23 IOSTANDARD LVDS     DIFF_TERM_ADV TERM_100              } [get_ports fpga_syncin_p[1]          ]    ; ## FMC_C_SYNC_M2C_P
set_property  -quiet -dict {PACKAGE_PIN BD19 IOSTANDARD LVDS                                         } [get_ports fpga_syncout_n[0]         ]    ; ## FMC_D_SYNC_C2M_N
set_property  -quiet -dict {PACKAGE_PIN BC19 IOSTANDARD LVDS                                         } [get_ports fpga_syncout_p[0]         ]    ; ## FMC_D_SYNC_C2M_P
set_property  -quiet -dict {PACKAGE_PIN BF17 IOSTANDARD LVDS                                         } [get_ports fpga_syncout_n[1]         ]    ; ## FMC_C_SYNC_C2M_N
set_property  -quiet -dict {PACKAGE_PIN BE17 IOSTANDARD LVDS                                         } [get_ports fpga_syncout_p[1]         ]    ; ## FMC_C_SYNC_C2M_P
# set_property         -dict {PACKAGE_PIN AG32 IOSTANDARD LVCMOS18                                     } [get_ports gpio[0]                   ]    ; ## IO_L24P_T3U_N10_43
# set_property         -dict {PACKAGE_PIN AG33 IOSTANDARD LVCMOS18                                     } [get_ports gpio[1]                   ]    ; ## IO_L24N_T3U_N11_43
# set_property         -dict {PACKAGE_PIN N33  IOSTANDARD LVCMOS18                                     } [get_ports gpio[2]                   ]    ; ## IO_L22P_T3U_N6_DBC_AD0P_45
# set_property         -dict {PACKAGE_PIN M33  IOSTANDARD LVCMOS18                                     } [get_ports gpio[3]                   ]    ; ## IO_L22N_T3U_N7_DBC_AD0N_45
# set_property         -dict {PACKAGE_PIN AJ35 IOSTANDARD LVCMOS18                                     } [get_ports gpio[4]                   ]    ; ## IO_L20P_T3L_N2_AD1P_43
# set_property         -dict {PACKAGE_PIN AJ36 IOSTANDARD LVCMOS18                                     } [get_ports gpio[5]                   ]    ; ## IO_L20N_T3L_N3_AD1N_43
# set_property         -dict {PACKAGE_PIN AG31 IOSTANDARD LVCMOS18                                     } [get_ports gpio[6]                   ]    ; ## IO_L23P_T3U_N8_43
# set_property         -dict {PACKAGE_PIN AH31 IOSTANDARD LVCMOS18                                     } [get_ports gpio[7]                   ]    ; ## IO_L23N_T3U_N9_43
# set_property         -dict {PACKAGE_PIN AG34 IOSTANDARD LVCMOS18                                     } [get_ports gpio[8]                   ]    ; ## IO_L22P_T3U_N6_DBC_AD0P_43
# set_property         -dict {PACKAGE_PIN AH35 IOSTANDARD LVCMOS18                                     } [get_ports gpio[9]                   ]    ; ## IO_L22N_T3U_N7_DBC_AD0N_43
# set_property         -dict {PACKAGE_PIN N35  IOSTANDARD LVCMOS18                                     } [get_ports gpio[10]                  ]    ; ## IO_L20N_T3L_N3_AD1N_45
set_property         -dict {PACKAGE_PIN P33  IOSTANDARD LVCMOS18                                     } [get_ports hmc_gpio1                 ]    ; ## USER_IO29_FMC_B
set_property         -dict {PACKAGE_PIN V33  IOSTANDARD LVCMOS18                                     } [get_ports hmc_sync                  ]    ; ## USER_IO30_FMC_B
set_property         -dict {PACKAGE_PIN V32  IOSTANDARD LVCMOS18                                     } [get_ports irqb[0]                   ]    ; ## USER_IO31_FMC_B
set_property         -dict {PACKAGE_PIN V31  IOSTANDARD LVCMOS18                                     } [get_ports irqb[1]                   ]    ; ## USER_IO32_FMC_B
set_property         -dict {PACKAGE_PIN E31  IOSTANDARD LVCMOS18                                     } [get_ports rstb                      ]    ; ## USER_IO33_FMC_B
set_property         -dict {PACKAGE_PIN M30  IOSTANDARD LVCMOS18                                     } [get_ports rxen[0]                   ]    ; ## USER_IO34_FMC_B
set_property         -dict {PACKAGE_PIN E37  IOSTANDARD LVCMOS18                                     } [get_ports rxen[1]                   ]    ; ## USER_IO35_FMC_B
set_property         -dict {PACKAGE_PIN AU21 IOSTANDARD LVCMOS18                                     } [get_ports spi0_csb                  ]    ; ## USER_IO37_FMC_C
set_property         -dict {PACKAGE_PIN BD20 IOSTANDARD LVCMOS18                                     } [get_ports spi0_miso                 ]    ; ## USER_IO38_FMC_C
set_property         -dict {PACKAGE_PIN BE20 IOSTANDARD LVCMOS18                                     } [get_ports spi0_mosi                 ]    ; ## USER_IO39_FMC_C
set_property         -dict {PACKAGE_PIN AR21 IOSTANDARD LVCMOS18                                     } [get_ports spi0_sclk                 ]    ; ## USER_IO40_FMC_C
set_property         -dict {PACKAGE_PIN AP21 IOSTANDARD LVCMOS18                                     } [get_ports spi1_csb                  ]    ; ## USER_IO41_FMC_C
set_property         -dict {PACKAGE_PIN AV17 IOSTANDARD LVCMOS18                                     } [get_ports spi1_sclk                 ]    ; ## USER_IO42_FMC_C
set_property         -dict {PACKAGE_PIN AP16 IOSTANDARD LVCMOS18                                     } [get_ports spi1_sdio                 ]    ; ## USER_IO43_FMC_C
set_property         -dict {PACKAGE_PIN P30  IOSTANDARD LVDS     DIFF_TERM_ADV TERM_100 DQS_BIAS TRUE} [get_ports sysref2_n                 ]    ; ## FMC_B_LA[33]_N
set_property         -dict {PACKAGE_PIN R30  IOSTANDARD LVDS     DIFF_TERM_ADV TERM_100 DQS_BIAS TRUE} [get_ports sysref2_p                 ]    ; ## FMC_B_LA[33]_P
set_property         -dict {PACKAGE_PIN F38  IOSTANDARD LVCMOS18                                     } [get_ports txen[0]                   ]    ; ## USER_IO27_FMC_B
set_property         -dict {PACKAGE_PIN K34  IOSTANDARD LVCMOS18                                     } [get_ports txen[1]                   ]    ; ## USER_IO28_FMC_B

# set_property         -dict {PACKAGE_PIN AK35 IOSTANDARD LVCMOS18 PULLTYPE PULLUP                     } [get_ports vadj_1v8_pgood            ]    ; ## IO_T1U_N12_43_AK35 



