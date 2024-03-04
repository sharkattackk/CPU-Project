transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu_not.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu_neg.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu_or.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu_and.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/TwoToOneMux.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/ThirtyTwoToOneEncoder.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/ThirtyTwoToFiveEncoder.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/Reg32.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/MDR.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/datapath.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu_mul.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu_rol.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu_ror.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu_div.v}

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/div_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  div_tb

add wave *
view structure
view signals
run 500 ns
