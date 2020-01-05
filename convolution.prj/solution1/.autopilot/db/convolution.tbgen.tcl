set C_TypeInfoList {{ 
"convolution" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"k": [[], {"array": [ {"array": ["0", [3]]}, [3]]}] }, {"wdw": [[], {"array": [ {"array": ["1", [3]]}, [3]]}] }, {"res": [[], {"reference": "2"}] }],[],""], 
"1": [ "wdw_t", {"typedef": [[[], {"scalar": "int"}],""]}], 
"0": [ "k_t", {"typedef": [[[], {"scalar": "int"}],""]}], 
"2": [ "result_t", {"typedef": [[[], {"scalar": "int"}],""]}]
}}
set moduleName convolution
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {convolution}
set C_modelType { void 0 }
set C_modelArgList {
	{ k int 32 regular {array 9 { 1 3 } 1 1 }  }
	{ wdw int 32 regular {array 9 { 1 3 } 1 1 }  }
	{ res int 32 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "k", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "k","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 2,"step" : 1},{"low" : 0,"up" : 2,"step" : 1}]}]}]} , 
 	{ "Name" : "wdw", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "wdw","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 2,"step" : 1},{"low" : 0,"up" : 2,"step" : 1}]}]}]} , 
 	{ "Name" : "res", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "res","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ k_address0 sc_out sc_lv 4 signal 0 } 
	{ k_ce0 sc_out sc_logic 1 signal 0 } 
	{ k_q0 sc_in sc_lv 32 signal 0 } 
	{ wdw_address0 sc_out sc_lv 4 signal 1 } 
	{ wdw_ce0 sc_out sc_logic 1 signal 1 } 
	{ wdw_q0 sc_in sc_lv 32 signal 1 } 
	{ res sc_out sc_lv 32 signal 2 } 
	{ res_ap_vld sc_out sc_logic 1 outvld 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "k_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "k", "role": "address0" }} , 
 	{ "name": "k_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k", "role": "ce0" }} , 
 	{ "name": "k_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k", "role": "q0" }} , 
 	{ "name": "wdw_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "wdw", "role": "address0" }} , 
 	{ "name": "wdw_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "wdw", "role": "ce0" }} , 
 	{ "name": "wdw_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "wdw", "role": "q0" }} , 
 	{ "name": "res", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "res", "role": "default" }} , 
 	{ "name": "res_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "res", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "convolution",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"VariableLatency" : "1",
		"Port" : [
			{"Name" : "k", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "wdw", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "res", "Type" : "Vld", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.convolution_mul_3bkb_U0", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	convolution {
		k {Type I LastRead 2 FirstWrite -1}
		wdw {Type I LastRead 2 FirstWrite -1}
		res {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "52", "Max" : "52"}
	, {"Name" : "Interval", "Min" : "53", "Max" : "53"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	k { ap_memory {  { k_address0 mem_address 1 4 }  { k_ce0 mem_ce 1 1 }  { k_q0 mem_dout 0 32 } } }
	wdw { ap_memory {  { wdw_address0 mem_address 1 4 }  { wdw_ce0 mem_ce 1 1 }  { wdw_q0 mem_dout 0 32 } } }
	res { ap_vld {  { res out_data 1 32 }  { res_ap_vld out_vld 1 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
