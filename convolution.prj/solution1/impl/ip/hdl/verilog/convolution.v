// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.2
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="convolution,hls_ip_2017_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z010clg400-1,HLS_INPUT_CLOCK=8.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=6.912000,HLS_SYN_LAT=52,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=4,HLS_SYN_FF=549,HLS_SYN_LUT=250}" *)

module convolution (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        k_address0,
        k_ce0,
        k_q0,
        wdw_address0,
        wdw_ce0,
        wdw_q0,
        res,
        res_ap_vld
);

parameter    ap_ST_fsm_state1 = 7'd1;
parameter    ap_ST_fsm_state2 = 7'd2;
parameter    ap_ST_fsm_state3 = 7'd4;
parameter    ap_ST_fsm_state4 = 7'd8;
parameter    ap_ST_fsm_state5 = 7'd16;
parameter    ap_ST_fsm_state6 = 7'd32;
parameter    ap_ST_fsm_state7 = 7'd64;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [3:0] k_address0;
output   k_ce0;
input  [31:0] k_q0;
output  [3:0] wdw_address0;
output   wdw_ce0;
input  [31:0] wdw_q0;
output  [31:0] res;
output   res_ap_vld;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg k_ce0;
reg wdw_ce0;
reg[31:0] res;
reg res_ap_vld;

(* fsm_encoding = "none" *) reg   [6:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [4:0] tmp_8_fu_121_p2;
reg   [4:0] tmp_8_reg_238;
wire    ap_CS_fsm_state2;
wire   [1:0] i_1_fu_133_p2;
reg   [1:0] i_1_reg_246;
wire   [4:0] tmp_s_fu_161_p2;
reg   [4:0] tmp_s_reg_251;
wire   [0:0] exitcond1_fu_127_p2;
wire    ap_CS_fsm_state3;
wire   [1:0] j_1_fu_187_p2;
reg   [1:0] j_1_reg_264;
wire   [0:0] exitcond_fu_181_p2;
reg  signed [31:0] k_load_reg_274;
wire    ap_CS_fsm_state4;
reg  signed [31:0] wdw_load_reg_279;
wire   [31:0] grp_fu_213_p2;
reg   [31:0] tmp_5_reg_284;
wire    ap_CS_fsm_state6;
reg   [1:0] i_reg_78;
reg   [1:0] j_reg_89;
wire    ap_CS_fsm_state7;
wire  signed [31:0] tmp_11_cast_fu_176_p1;
wire  signed [31:0] tmp_12_cast_fu_208_p1;
reg   [31:0] tmp_fu_42;
wire   [31:0] tmp_6_fu_220_p2;
wire   [3:0] tmp_7_fu_109_p3;
wire   [4:0] p_shl_cast_fu_117_p1;
wire   [4:0] i_cast2_cast_fu_105_p1;
wire   [1:0] tmp_1_fu_139_p2;
wire   [3:0] tmp_9_fu_149_p3;
wire   [4:0] p_shl1_cast_fu_157_p1;
wire   [4:0] tmp_1_cast_cast_fu_145_p1;
wire   [4:0] j_cast1_cast_fu_167_p1;
wire   [4:0] tmp_2_fu_171_p2;
wire   [1:0] tmp_4_fu_193_p2;
wire   [4:0] tmp_4_cast_cast_fu_199_p1;
wire   [4:0] tmp_10_fu_203_p2;
wire    ap_CS_fsm_state5;
reg   [6:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 7'd1;
end

convolution_mul_3bkb #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
convolution_mul_3bkb_U0(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(k_load_reg_274),
    .din1(wdw_load_reg_279),
    .ce(1'b1),
    .dout(grp_fu_213_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state3) & (exitcond_fu_181_p2 == 1'd1))) begin
        i_reg_78 <= i_1_reg_246;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_reg_78 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        j_reg_89 <= j_1_reg_264;
    end else if (((1'b1 == ap_CS_fsm_state2) & (exitcond1_fu_127_p2 == 1'd0))) begin
        j_reg_89 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        tmp_fu_42 <= tmp_6_fu_220_p2;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        tmp_fu_42 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_1_reg_246 <= i_1_fu_133_p2;
        tmp_8_reg_238 <= tmp_8_fu_121_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        j_1_reg_264 <= j_1_fu_187_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        k_load_reg_274 <= k_q0;
        wdw_load_reg_279 <= wdw_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        tmp_5_reg_284 <= grp_fu_213_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (exitcond1_fu_127_p2 == 1'd0))) begin
        tmp_s_reg_251 <= tmp_s_fu_161_p2;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (exitcond1_fu_127_p2 == 1'd1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_start) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (exitcond1_fu_127_p2 == 1'd1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        k_ce0 = 1'b1;
    end else begin
        k_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        res = tmp_6_fu_220_p2;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        res = 32'd0;
    end else begin
        res = 'bx;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) | (1'b1 == ap_CS_fsm_state7))) begin
        res_ap_vld = 1'b1;
    end else begin
        res_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        wdw_ce0 = 1'b1;
    end else begin
        wdw_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (exitcond1_fu_127_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (exitcond_fu_181_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign exitcond1_fu_127_p2 = ((i_reg_78 == 2'd3) ? 1'b1 : 1'b0);

assign exitcond_fu_181_p2 = ((j_reg_89 == 2'd3) ? 1'b1 : 1'b0);

assign i_1_fu_133_p2 = (i_reg_78 + 2'd1);

assign i_cast2_cast_fu_105_p1 = i_reg_78;

assign j_1_fu_187_p2 = (j_reg_89 + 2'd1);

assign j_cast1_cast_fu_167_p1 = j_reg_89;

assign k_address0 = tmp_12_cast_fu_208_p1;

assign p_shl1_cast_fu_157_p1 = tmp_9_fu_149_p3;

assign p_shl_cast_fu_117_p1 = tmp_7_fu_109_p3;

assign tmp_10_fu_203_p2 = (tmp_s_reg_251 + tmp_4_cast_cast_fu_199_p1);

assign tmp_11_cast_fu_176_p1 = $signed(tmp_2_fu_171_p2);

assign tmp_12_cast_fu_208_p1 = $signed(tmp_10_fu_203_p2);

assign tmp_1_cast_cast_fu_145_p1 = tmp_1_fu_139_p2;

assign tmp_1_fu_139_p2 = ($signed(2'd2) - $signed(i_reg_78));

assign tmp_2_fu_171_p2 = (tmp_8_reg_238 + j_cast1_cast_fu_167_p1);

assign tmp_4_cast_cast_fu_199_p1 = tmp_4_fu_193_p2;

assign tmp_4_fu_193_p2 = ($signed(2'd2) - $signed(j_reg_89));

assign tmp_6_fu_220_p2 = (tmp_fu_42 + tmp_5_reg_284);

assign tmp_7_fu_109_p3 = {{i_reg_78}, {2'd0}};

assign tmp_8_fu_121_p2 = (p_shl_cast_fu_117_p1 - i_cast2_cast_fu_105_p1);

assign tmp_9_fu_149_p3 = {{tmp_1_fu_139_p2}, {2'd0}};

assign tmp_s_fu_161_p2 = (p_shl1_cast_fu_157_p1 - tmp_1_cast_cast_fu_145_p1);

assign wdw_address0 = tmp_11_cast_fu_176_p1;

endmodule //convolution
