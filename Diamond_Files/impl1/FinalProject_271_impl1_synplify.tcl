#-- Lattice Semiconductor Corporation Ltd.
#-- Synplify OEM project file

#device options
set_option -technology MACHXO3LF
set_option -part LCMXO3LF_6900C
set_option -package BG256C
set_option -speed_grade -5

#compilation/mapping options
set_option -symbolic_fsm_compiler true
set_option -resource_sharing true

#use verilog 2001 standard option
set_option -vlog_std v2001

#map options
set_option -frequency auto
set_option -maxfan 1000
set_option -auto_constrain_io 0
set_option -disable_io_insertion false
set_option -retiming false; set_option -pipe true
set_option -force_gsr false
set_option -compiler_compatible 0
set_option -dup false
set_option -frequency 1
set_option -default_enum_encoding default

#simulation options


#timing analysis options



#automatic place and route (vendor) options
set_option -write_apr_constraint 1

#synplifyPro options
set_option -fix_gated_and_generated_clocks 1
set_option -update_models_cp 0
set_option -resolve_multiple_driver 0


#-- add_file options
set_option -include_path {/home/user/Documents/Classes/ece271/Design Project/Diamond_Files}
add_file -verilog {/home/user/Documents/GitHub/ECE271-DesignProject/sysClk.sv}
add_file -verilog {/home/user/Documents/GitHub/ECE271-DesignProject/buttonLUT1.sv}
add_file -verilog {/home/user/Documents/GitHub/ECE271-DesignProject/buttonLUT2.sv}
add_file -verilog {/home/user/Documents/GitHub/ECE271-DesignProject/KeyDecoder.sv}
add_file -verilog {/home/user/Documents/GitHub/ECE271-DesignProject/keyLUT.sv}
add_file -verilog {/home/user/Documents/GitHub/ECE271-DesignProject/Register.sv}
add_file -verilog {/home/user/Documents/GitHub/ECE271-DesignProject/sync.sv}
add_file -verilog {/home/user/Documents/GitHub/ECE271-DesignProject/Parser.sv}
add_file -verilog {/home/user/Documents/GitHub/ECE271-DesignProject/SignalClockDivider.sv}
add_file -verilog {/home/user/Documents/GitHub/ECE271-DesignProject/SignalLUT.sv}
add_file -verilog {/home/user/Documents/GitHub/ECE271-DesignProject/SignalTOP_LEVEL.sv}
add_file -verilog {/home/user/Documents/GitHub/ECE271-DesignProject/FSM.sv}


#-- set result format/file last
project -result_file {/home/user/Documents/Classes/ece271/Design Project/Diamond_Files/impl1/FinalProject_271_impl1.edi}

#-- error message log file
project -log_file {FinalProject_271_impl1.srf}

#-- set any command lines input by customer


#-- run Synplify with 'arrange HDL file'
project -run
