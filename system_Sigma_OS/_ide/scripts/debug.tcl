# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\simon\Vitis\workspaces\Sigma_OS\system_Sigma_OS\_ide\scripts\debug.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\simon\Vitis\workspaces\Sigma_OS\system_Sigma_OS\_ide\scripts\debug.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Xilinx TUL 1234-tulA" && level==0 && jtag_device_ctx=="jsn-TUL-1234-tulA-23727093-0"}
fpga -file C:/Users/simon/Vitis/workspaces/Sigma_OS/application_Sigma_OS/_ide/bitstream/design_pynq_z2_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/simon/Vitis/workspaces/Sigma_OS/platform_pynq_z2/export/platform_pynq_z2/hw/design_pynq_z2_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/simon/Vitis/workspaces/Sigma_OS/application_Sigma_OS/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Users/simon/Vitis/workspaces/Sigma_OS/application_Sigma_OS/Debug/application_Sigma_OS.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
