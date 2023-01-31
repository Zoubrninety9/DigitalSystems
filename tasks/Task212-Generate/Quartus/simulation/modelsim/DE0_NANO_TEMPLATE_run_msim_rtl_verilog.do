transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/user/Documents/GitHub/DigitalSystems/tasks/Task212-Generate/Quartus {C:/Users/user/Documents/GitHub/DigitalSystems/tasks/Task212-Generate/Quartus/pll_main.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Documents/GitHub/DigitalSystems/tasks/Task212-Generate/Quartus/db {C:/Users/user/Documents/GitHub/DigitalSystems/tasks/Task212-Generate/Quartus/db/pll_main_altpll.v}
vlog -sv -work work +incdir+C:/Users/user/Documents/GitHub/DigitalSystems/tasks/Task212-Generate {C:/Users/user/Documents/GitHub/DigitalSystems/tasks/Task212-Generate/custom_function.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/GitHub/DigitalSystems/tasks/Task212-Generate {C:/Users/user/Documents/GitHub/DigitalSystems/tasks/Task212-Generate/invN.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/GitHub/DigitalSystems/tasks/Task212-Generate/Quartus {C:/Users/user/Documents/GitHub/DigitalSystems/tasks/Task212-Generate/Quartus/clk_div_N.sv}

