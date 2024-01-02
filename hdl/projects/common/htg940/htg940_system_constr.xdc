
# constraints

# Using Push Button 1 
set_property -dict  {PACKAGE_PIN  AJ34  IOSTANDARD  LVCMOS12} [get_ports sys_rst_n]

# clocks

set_property PACKAGE_PIN BA34 [ get_ports "sys_clk_p" ]
set_property IOSTANDARD DIFF_HSTL_I_12 [ get_ports "sys_clk_p" ]

set_property PACKAGE_PIN BB34 [ get_ports "sys_clk_n" ]
set_property IOSTANDARD DIFF_HSTL_I_12 [ get_ports "sys_clk_n" ]

# ethernet

#.... phy_rst_n is connected to LED2
set_property -dict  {PACKAGE_PIN AN28    IOSTANDARD  LVCMOS18} [get_ports phy_rst_n[0]]
set_false_path -through [get_nets phy_rst_n[0]]

set_property -dict  {PACKAGE_PIN A18    IOSTANDARD  LVCMOS18} [get_ports phy_mdc]
set_property -dict  {PACKAGE_PIN G19    IOSTANDARD  LVCMOS18} [get_ports phy_mdio]

set_property -dict  {PACKAGE_PIN B20    IOSTANDARD  LVCMOS18} [get_ports phy_tx_clk]
set_property -dict  {PACKAGE_PIN G21    IOSTANDARD  LVCMOS18} [get_ports phy_tx_ctrl]
set_property -dict  {PACKAGE_PIN E20    IOSTANDARD  LVCMOS18} [get_ports phy_tx_data[3]]
set_property -dict  {PACKAGE_PIN B19    IOSTANDARD  LVCMOS18} [get_ports phy_tx_data[2]]
set_property -dict  {PACKAGE_PIN A19    IOSTANDARD  LVCMOS18} [get_ports phy_tx_data[1]]
set_property -dict  {PACKAGE_PIN D20    IOSTANDARD  LVCMOS18} [get_ports phy_tx_data[0]]

set_property -dict  {PACKAGE_PIN G20    IOSTANDARD  LVCMOS18} [get_ports phy_rx_clk]
set_property -dict  {PACKAGE_PIN B21    IOSTANDARD  LVCMOS18} [get_ports phy_rx_ctrl]
set_property -dict  {PACKAGE_PIN C21    IOSTANDARD  LVCMOS18} [get_ports phy_rx_data[3]]
set_property -dict  {PACKAGE_PIN E21    IOSTANDARD  LVCMOS18} [get_ports phy_rx_data[2]]
set_property -dict  {PACKAGE_PIN D21    IOSTANDARD  LVCMOS18} [get_ports phy_rx_data[1]]
set_property -dict  {PACKAGE_PIN A20    IOSTANDARD  LVCMOS18} [get_ports phy_rx_data[0]]

# uart

set_property -dict  {PACKAGE_PIN  P15  IOSTANDARD  LVCMOS18} [get_ports uart_sin]
set_property -dict  {PACKAGE_PIN  R15  IOSTANDARD  LVCMOS18} [get_ports uart_sout]

set_property -dict  {PACKAGE_PIN  AV26  IOSTANDARD  LVCMOS18} [get_ports gpio_bd[0]]    ; ## GPIO_DIP_SW0
set_property -dict  {PACKAGE_PIN  AY27  IOSTANDARD  LVCMOS18} [get_ports gpio_bd[1]]    ; ## GPIO_DIP_SW1
set_property -dict  {PACKAGE_PIN  AY26  IOSTANDARD  LVCMOS18} [get_ports gpio_bd[2]]    ; ## GPIO_DIP_SW2
set_property -dict  {PACKAGE_PIN  BA25  IOSTANDARD  LVCMOS18} [get_ports gpio_bd[3]]    ; ## GPIO_DIP_SW3
set_property -dict  {PACKAGE_PIN  BB27  IOSTANDARD  LVCMOS18} [get_ports gpio_bd[4]]    ; ## GPIO_PB_0
set_property -dict  {PACKAGE_PIN  BF28  IOSTANDARD  LVCMOS18} [get_ports gpio_bd[5]]    ; ## GPIO_PB_1
set_property -dict  {PACKAGE_PIN  BA28  IOSTANDARD  LVCMOS18} [get_ports gpio_bd[6]]    ; ## GPIO_PB_2
set_property -dict  {PACKAGE_PIN  BF29  IOSTANDARD  LVCMOS18} [get_ports gpio_bd[7]]    ; ## GPIO_PB_3
set_property -dict  {PACKAGE_PIN  AW25  IOSTANDARD  LVCMOS18} [get_ports gpio_bd[8]]    ; ## GPIO_PB_4
set_property -dict  {PACKAGE_PIN  AW26  IOSTANDARD  LVCMOS18} [get_ports gpio_bd[9]]    ; ## GPIO_LED_0_LS
set_property -dict  {PACKAGE_PIN  AY25  IOSTANDARD  LVCMOS18} [get_ports gpio_bd[10]]   ; ## GPIO_LED_1_LS
set_property -dict  {PACKAGE_PIN  BB25  IOSTANDARD  LVCMOS18} [get_ports gpio_bd[11]]   ; ## GPIO_LED_2_LS
set_property -dict  {PACKAGE_PIN  BA27  IOSTANDARD  LVCMOS18} [get_ports gpio_bd[12]]   ; ## GPIO_LED_3_LS
set_property -dict  {PACKAGE_PIN  BE27  IOSTANDARD  LVCMOS18} [get_ports gpio_bd[13]]   ; ## GPIO_LED_4_LS
set_property -dict  {PACKAGE_PIN  BC28  IOSTANDARD  LVCMOS18} [get_ports gpio_bd[14]]   ; ## GPIO_LED_5_LS
set_property -dict  {PACKAGE_PIN  AE32  IOSTANDARD  LVCMOS12} [get_ports gpio_bd[15]]   ; ## GPIO_LED_6_LS
set_property -dict  {PACKAGE_PIN  AD30  IOSTANDARD  LVCMOS12} [get_ports gpio_bd[16]]   ; ## GPIO_LED_7_LS

# iic

set_property -dict  {PACKAGE_PIN  AV27  IOSTANDARD  LVCMOS18} [get_ports iic_rstn]
set_property -dict  {PACKAGE_PIN  AU27  IOSTANDARD  LVCMOS18  DRIVE 8 SLEW SLOW} [get_ports iic_scl]
set_property -dict  {PACKAGE_PIN  AV28  IOSTANDARD  LVCMOS18  DRIVE 8 SLEW SLOW} [get_ports iic_sda]

# Create SPI clock
create_generated_clock -name spi_clk  \
  -source [get_pins i_system_wrapper/system_i/axi_spi/ext_spi_clk] \
  -divide_by 2 [get_pins i_system_wrapper/system_i/axi_spi/sck_o]


# Balance clocks
#
# Minimize skew on synchronous CDC timing paths between clocks originating 
# from the same MMCM source. (sys_mem_clk and sys_cpu_clk)
# This is required mostly by the smart interconnect.
# Property must be applied directly to the output net of BUFGs.
set_property CLOCK_DELAY_GROUP BALANCE_CLOCKS \
  [list [get_nets [get_property PARENT [get_nets {i_system_wrapper/system_i/sys_cpu_clk}]]] \
        [get_nets [get_property PARENT [get_nets {i_system_wrapper/system_i/sys_mem_clk}]]] \
  ]

