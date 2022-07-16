# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\simon\Vitis\workspaces\Sigma_OS\platform_pynq_z2\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\simon\Vitis\workspaces\Sigma_OS\platform_pynq_z2\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {platform_pynq_z2}\
-hw {C:\Users\simon\Vivado\Projects\Sigma_OS_pynq_z2\design_pynq_z2_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {C:/Users/simon/Vitis/workspaces/Sigma_OS}

platform write
platform generate -domains 
platform active {platform_pynq_z2}
