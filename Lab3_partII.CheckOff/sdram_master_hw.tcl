# TCL File Generated by Component Editor 15.0
# Sun Feb 14 13:34:44 PST 2016
# DO NOT MODIFY


# 
# sdram_master "sdram_master_component" v1.0
#  2016.02.14.13:34:44
# 
# 

# 
# request TCL package from ACDS 15.0
# 
package require -exact qsys 15.0


# 
# module sdram_master
# 
set_module_property DESCRIPTION ""
set_module_property NAME sdram_master
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "My Own IP Cores"
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME sdram_master_component
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL sdram_master
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file sdram_master.v VERILOG PATH sdram_master.v TOP_LEVEL_FILE

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL sdram_master
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VERILOG ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file sdram_master.v VERILOG PATH sdram_master.v


# 
# parameters
# 
add_parameter S0 STD_LOGIC_VECTOR 0
set_parameter_property S0 DEFAULT_VALUE 0
set_parameter_property S0 DISPLAY_NAME S0
set_parameter_property S0 TYPE STD_LOGIC_VECTOR
set_parameter_property S0 UNITS None
set_parameter_property S0 ALLOWED_RANGES 0:15
set_parameter_property S0 HDL_PARAMETER true
add_parameter S1 STD_LOGIC_VECTOR 1
set_parameter_property S1 DEFAULT_VALUE 1
set_parameter_property S1 DISPLAY_NAME S1
set_parameter_property S1 TYPE STD_LOGIC_VECTOR
set_parameter_property S1 UNITS None
set_parameter_property S1 ALLOWED_RANGES 0:15
set_parameter_property S1 HDL_PARAMETER true
add_parameter S2 STD_LOGIC_VECTOR 2
set_parameter_property S2 DEFAULT_VALUE 2
set_parameter_property S2 DISPLAY_NAME S2
set_parameter_property S2 TYPE STD_LOGIC_VECTOR
set_parameter_property S2 UNITS None
set_parameter_property S2 ALLOWED_RANGES 0:15
set_parameter_property S2 HDL_PARAMETER true
add_parameter S3 STD_LOGIC_VECTOR 3
set_parameter_property S3 DEFAULT_VALUE 3
set_parameter_property S3 DISPLAY_NAME S3
set_parameter_property S3 TYPE STD_LOGIC_VECTOR
set_parameter_property S3 UNITS None
set_parameter_property S3 ALLOWED_RANGES 0:15
set_parameter_property S3 HDL_PARAMETER true
add_parameter S4 STD_LOGIC_VECTOR 4
set_parameter_property S4 DEFAULT_VALUE 4
set_parameter_property S4 DISPLAY_NAME S4
set_parameter_property S4 TYPE STD_LOGIC_VECTOR
set_parameter_property S4 UNITS None
set_parameter_property S4 ALLOWED_RANGES 0:15
set_parameter_property S4 HDL_PARAMETER true
add_parameter S5 STD_LOGIC_VECTOR 5
set_parameter_property S5 DEFAULT_VALUE 5
set_parameter_property S5 DISPLAY_NAME S5
set_parameter_property S5 TYPE STD_LOGIC_VECTOR
set_parameter_property S5 UNITS None
set_parameter_property S5 ALLOWED_RANGES 0:15
set_parameter_property S5 HDL_PARAMETER true
add_parameter SDRAM_BASE STD_LOGIC_VECTOR 3221225472
set_parameter_property SDRAM_BASE DEFAULT_VALUE 3221225472
set_parameter_property SDRAM_BASE DISPLAY_NAME SDRAM_BASE
set_parameter_property SDRAM_BASE TYPE STD_LOGIC_VECTOR
set_parameter_property SDRAM_BASE UNITS None
set_parameter_property SDRAM_BASE ALLOWED_RANGES 0:17179869183
set_parameter_property SDRAM_BASE HDL_PARAMETER true


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset_n reset_n Input 1


# 
# connection point avalon_master
# 
add_interface avalon_master avalon start
set_interface_property avalon_master addressUnits WORDS
set_interface_property avalon_master associatedClock clock
set_interface_property avalon_master associatedReset reset
set_interface_property avalon_master bitsPerSymbol 8
set_interface_property avalon_master burstOnBurstBoundariesOnly false
set_interface_property avalon_master burstcountUnits WORDS
set_interface_property avalon_master doStreamReads false
set_interface_property avalon_master doStreamWrites false
set_interface_property avalon_master holdTime 0
set_interface_property avalon_master linewrapBursts false
set_interface_property avalon_master maximumPendingReadTransactions 0
set_interface_property avalon_master maximumPendingWriteTransactions 0
set_interface_property avalon_master readLatency 0
set_interface_property avalon_master readWaitTime 1
set_interface_property avalon_master setupTime 0
set_interface_property avalon_master timingUnits Cycles
set_interface_property avalon_master writeWaitTime 0
set_interface_property avalon_master ENABLED true
set_interface_property avalon_master EXPORT_OF ""
set_interface_property avalon_master PORT_NAME_MAP ""
set_interface_property avalon_master CMSIS_SVD_VARIABLES ""
set_interface_property avalon_master SVD_ADDRESS_GROUP ""

add_interface_port avalon_master read_n read_n Output 1
add_interface_port avalon_master write_n write_n Output 1
add_interface_port avalon_master chipselect chipselect Output 1
add_interface_port avalon_master waitrequest waitrequest Input 1
add_interface_port avalon_master address address Output 32
add_interface_port avalon_master byteenable byteenable Output 2
add_interface_port avalon_master readdatavalid readdatavalid Input 1
add_interface_port avalon_master readdata readdata Input 16
add_interface_port avalon_master writedata writedata Output 16

