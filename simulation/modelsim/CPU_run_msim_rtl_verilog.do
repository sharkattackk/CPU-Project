transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/select_encode.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/R0reg.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/inputOutputPort.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/ff_logic.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/decoder_4_to_16.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/decoder_2_to_4.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/con_ff.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu_shr.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu_shl.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu_div.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu_ror.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu_not.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu_neg.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu_or.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu_and.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/TwoToOneMux.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/ThirtyTwoToOneEncoder.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/ThirtyTwoToFiveEncoder.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/Reg32.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/datapath.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu_sub.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/fullAdder.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu_add.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu_mul.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu_rol.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/alu_shra.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/mdrreg.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/ram.v}

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project {C:/intelFPGA_lite/18.1/elec374CPUPhase1/CPU-Project/ld_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  ld_tb

add wave *
view structure
view signals
run 500 ns
