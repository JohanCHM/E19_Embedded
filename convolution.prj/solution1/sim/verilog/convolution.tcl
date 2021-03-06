
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set res_group [add_wave_group res(wire) -into $coutputgroup]
add_wave /apatb_convolution_top/AESL_inst_convolution/res_ap_vld -into $res_group -color #ffff00 -radix hex
add_wave /apatb_convolution_top/AESL_inst_convolution/res -into $res_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set wdw_group [add_wave_group wdw(memory) -into $cinputgroup]
add_wave /apatb_convolution_top/AESL_inst_convolution/wdw_q0 -into $wdw_group -radix hex
add_wave /apatb_convolution_top/AESL_inst_convolution/wdw_ce0 -into $wdw_group -color #ffff00 -radix hex
add_wave /apatb_convolution_top/AESL_inst_convolution/wdw_address0 -into $wdw_group -radix hex
set k_group [add_wave_group k(memory) -into $cinputgroup]
add_wave /apatb_convolution_top/AESL_inst_convolution/k_q0 -into $k_group -radix hex
add_wave /apatb_convolution_top/AESL_inst_convolution/k_ce0 -into $k_group -color #ffff00 -radix hex
add_wave /apatb_convolution_top/AESL_inst_convolution/k_address0 -into $k_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake" -into $designtopgroup]
add_wave /apatb_convolution_top/AESL_inst_convolution/ap_start -into $blocksiggroup
add_wave /apatb_convolution_top/AESL_inst_convolution/ap_done -into $blocksiggroup
add_wave /apatb_convolution_top/AESL_inst_convolution/ap_idle -into $blocksiggroup
add_wave /apatb_convolution_top/AESL_inst_convolution/ap_ready -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_convolution_top/AESL_inst_convolution/ap_rst -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_convolution_top/AESL_inst_convolution/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_convolution_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_convolution_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_convolution_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_convolution_top/LENGTH_k -into $tb_portdepth_group -radix hex
add_wave /apatb_convolution_top/LENGTH_wdw -into $tb_portdepth_group -radix hex
add_wave /apatb_convolution_top/LENGTH_res -into $tb_portdepth_group -radix hex
set tbcoutputgroup [add_wave_group "C Outputs" -into $testbenchgroup]
set tb_res_group [add_wave_group res(wire) -into $tbcoutputgroup]
add_wave /apatb_convolution_top/res_ap_vld -into $tb_res_group -color #ffff00 -radix hex
add_wave /apatb_convolution_top/res -into $tb_res_group -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_wdw_group [add_wave_group wdw(memory) -into $tbcinputgroup]
add_wave /apatb_convolution_top/wdw_q0 -into $tb_wdw_group -radix hex
add_wave /apatb_convolution_top/wdw_ce0 -into $tb_wdw_group -color #ffff00 -radix hex
add_wave /apatb_convolution_top/wdw_address0 -into $tb_wdw_group -radix hex
set tb_k_group [add_wave_group k(memory) -into $tbcinputgroup]
add_wave /apatb_convolution_top/k_q0 -into $tb_k_group -radix hex
add_wave /apatb_convolution_top/k_ce0 -into $tb_k_group -color #ffff00 -radix hex
add_wave /apatb_convolution_top/k_address0 -into $tb_k_group -radix hex
save_wave_config convolution.wcfg
run all
quit

