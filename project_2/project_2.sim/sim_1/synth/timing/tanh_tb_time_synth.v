// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Sun Jun 07 01:08:17 2020
// Host        : LAPTOP-P1HARJ4K running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               D:/Users/IbrahimWael/Desktop/project_2/project_2.sim/sim_1/synth/timing/tanh_tb_time_synth.v
// Design      : tanh
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module fp_add_2
   (\output_tanh_reg[14] ,
    \output_tanh_reg[13] ,
    \output_tanh_reg[12] ,
    \output_tanh_reg[11] ,
    \output_tanh_reg[15] ,
    \output_tanh_reg[10] ,
    \exponent_reg[0]_0 ,
    \exponent_reg[0]_1 ,
    \mantissa_reg[0]_0 ,
    \mantissa_reg[0]_1 ,
    \mantissa_reg[0]_2 ,
    \mantissa_reg[0]_3 ,
    \mantissa_reg[0]_4 ,
    \mantissa_reg[0]_5 ,
    \mantissa_reg[0]_6 ,
    \mantissa_reg[0]_7 ,
    \mantissa_reg[0]_8 ,
    \mantissa_reg[0]_9 ,
    D,
    \output_tanh_reg[9] ,
    \output_tanh_reg[8] ,
    \output_tanh_reg[5] ,
    \output_tanh_reg[4] ,
    \output_tanh_reg[1] ,
    \output_tanh_reg[0] ,
    \mantissa_reg[0]_10 ,
    clk_IBUF_BUFG,
    output_tanh_OBUF,
    reset,
    reset_0,
    input_x_IBUF,
    \input_x[12] ,
    Q,
    \temp_add_a_reg[15] ,
    CO,
    UNCONN_IN);
  output [4:0]\output_tanh_reg[14] ;
  output \output_tanh_reg[13] ;
  output \output_tanh_reg[12] ;
  output \output_tanh_reg[11] ;
  output \output_tanh_reg[15] ;
  output \output_tanh_reg[10] ;
  output \exponent_reg[0]_0 ;
  output \exponent_reg[0]_1 ;
  output \mantissa_reg[0]_0 ;
  output \mantissa_reg[0]_1 ;
  output \mantissa_reg[0]_2 ;
  output \mantissa_reg[0]_3 ;
  output \mantissa_reg[0]_4 ;
  output \mantissa_reg[0]_5 ;
  output \mantissa_reg[0]_6 ;
  output \mantissa_reg[0]_7 ;
  output \mantissa_reg[0]_8 ;
  output \mantissa_reg[0]_9 ;
  output [15:0]D;
  output \output_tanh_reg[9] ;
  output \output_tanh_reg[8] ;
  output \output_tanh_reg[5] ;
  output \output_tanh_reg[4] ;
  output \output_tanh_reg[1] ;
  output \output_tanh_reg[0] ;
  output \mantissa_reg[0]_10 ;
  input clk_IBUF_BUFG;
  input [4:0]output_tanh_OBUF;
  input reset;
  input reset_0;
  input [1:0]input_x_IBUF;
  input \input_x[12] ;
  input [15:0]Q;
  input [15:0]\temp_add_a_reg[15] ;
  input [0:0]CO;
  input [4:0]UNCONN_IN;

  wire [0:0]CO;
  wire [15:0]D;
  wire [15:0]Q;
  wire [4:0]UNCONN_IN;
  wire clk_IBUF_BUFG;
  wire \exponent[0]_i_10_n_0 ;
  wire \exponent[0]_i_11_n_0 ;
  wire \exponent[0]_i_12_n_0 ;
  wire \exponent[0]_i_13_n_0 ;
  wire \exponent[0]_i_14_n_0 ;
  wire \exponent[0]_i_15_n_0 ;
  wire \exponent[0]_i_16_n_0 ;
  wire \exponent[0]_i_17_n_0 ;
  wire \exponent[0]_i_18_n_0 ;
  wire \exponent[0]_i_19_n_0 ;
  wire \exponent[0]_i_1_n_0 ;
  wire \exponent[0]_i_20_n_0 ;
  wire \exponent[0]_i_21_n_0 ;
  wire \exponent[0]_i_22_n_0 ;
  wire \exponent[0]_i_23_n_0 ;
  wire \exponent[0]_i_24_n_0 ;
  wire \exponent[0]_i_25_n_0 ;
  wire \exponent[0]_i_26_n_0 ;
  wire \exponent[0]_i_27_n_0 ;
  wire \exponent[0]_i_28_n_0 ;
  wire \exponent[0]_i_29_n_0 ;
  wire \exponent[0]_i_2_n_0 ;
  wire \exponent[0]_i_30_n_0 ;
  wire \exponent[0]_i_32_n_0 ;
  wire \exponent[0]_i_34_n_0 ;
  wire \exponent[0]_i_36_n_0 ;
  wire \exponent[0]_i_37_n_0 ;
  wire \exponent[0]_i_38_n_0 ;
  wire \exponent[0]_i_39_n_0 ;
  wire \exponent[0]_i_3_n_0 ;
  wire \exponent[0]_i_44_n_0 ;
  wire \exponent[0]_i_45_n_0 ;
  wire \exponent[0]_i_46_n_0 ;
  wire \exponent[0]_i_47_n_0 ;
  wire \exponent[0]_i_48_n_0 ;
  wire \exponent[0]_i_49_n_0 ;
  wire \exponent[0]_i_50_n_0 ;
  wire \exponent[0]_i_51_n_0 ;
  wire \exponent[0]_i_5_n_0 ;
  wire \exponent[0]_i_6_n_0 ;
  wire \exponent[0]_i_9_n_0 ;
  wire \exponent[1]_i_10_n_0 ;
  wire \exponent[1]_i_11_n_0 ;
  wire \exponent[1]_i_1_n_0 ;
  wire \exponent[1]_i_2_n_0 ;
  wire \exponent[1]_i_3_n_0 ;
  wire \exponent[1]_i_4_n_0 ;
  wire \exponent[1]_i_5_n_0 ;
  wire \exponent[1]_i_6_n_0 ;
  wire \exponent[1]_i_7_n_0 ;
  wire \exponent[1]_i_8_n_0 ;
  wire \exponent[1]_i_9_n_0 ;
  wire \exponent[2]_i_1_n_0 ;
  wire \exponent[2]_i_2_n_0 ;
  wire \exponent[3]_i_1_n_0 ;
  wire \exponent[3]_i_2_n_0 ;
  wire \exponent[3]_i_3_n_0 ;
  wire \exponent[3]_i_4_n_0 ;
  wire \exponent[4]_i_10_n_0 ;
  wire \exponent[4]_i_11_n_0 ;
  wire \exponent[4]_i_12_n_0 ;
  wire \exponent[4]_i_13_n_0 ;
  wire \exponent[4]_i_14_n_0 ;
  wire \exponent[4]_i_16_n_0 ;
  wire \exponent[4]_i_17_n_0 ;
  wire \exponent[4]_i_18_n_0 ;
  wire \exponent[4]_i_19_n_0 ;
  wire \exponent[4]_i_1_n_0 ;
  wire \exponent[4]_i_20_n_0 ;
  wire \exponent[4]_i_21_n_0 ;
  wire \exponent[4]_i_22_n_0 ;
  wire \exponent[4]_i_23_n_0 ;
  wire \exponent[4]_i_24_n_0 ;
  wire \exponent[4]_i_25_n_0 ;
  wire \exponent[4]_i_26_n_0 ;
  wire \exponent[4]_i_27_n_0 ;
  wire \exponent[4]_i_28_n_0 ;
  wire \exponent[4]_i_29_n_0 ;
  wire \exponent[4]_i_2_n_0 ;
  wire \exponent[4]_i_30_n_0 ;
  wire \exponent[4]_i_32_n_0 ;
  wire \exponent[4]_i_34_n_0 ;
  wire \exponent[4]_i_36_n_0 ;
  wire \exponent[4]_i_38_n_0 ;
  wire \exponent[4]_i_39_n_0 ;
  wire \exponent[4]_i_3_n_0 ;
  wire \exponent[4]_i_40_n_0 ;
  wire \exponent[4]_i_41_n_0 ;
  wire \exponent[4]_i_42_n_0 ;
  wire \exponent[4]_i_43_n_0 ;
  wire \exponent[4]_i_44_n_0 ;
  wire \exponent[4]_i_45_n_0 ;
  wire \exponent[4]_i_46_n_0 ;
  wire \exponent[4]_i_47_n_0 ;
  wire \exponent[4]_i_4_n_0 ;
  wire \exponent[4]_i_5_n_0 ;
  wire \exponent[4]_i_6_n_0 ;
  wire \exponent[4]_i_7_n_0 ;
  wire \exponent[4]_i_8_n_0 ;
  wire \exponent[4]_i_9_n_0 ;
  wire \exponent_reg[0]_0 ;
  wire \exponent_reg[0]_1 ;
  wire \exponent_reg[0]_i_4_n_0 ;
  wire \exponent_reg[0]_i_4_n_2 ;
  wire \exponent_reg[0]_i_4_n_3 ;
  wire \exponent_reg[0]_i_4_n_5 ;
  wire \exponent_reg[0]_i_4_n_6 ;
  wire \exponent_reg[0]_i_4_n_7 ;
  wire \exponent_reg[4]_i_15_n_0 ;
  wire \exponent_reg[4]_i_15_n_1 ;
  wire \exponent_reg[4]_i_15_n_2 ;
  wire \exponent_reg[4]_i_15_n_3 ;
  wire \exponent_reg[4]_i_15_n_4 ;
  wire \exponent_reg[4]_i_15_n_5 ;
  wire \exponent_reg[4]_i_15_n_6 ;
  wire \exponent_reg[4]_i_15_n_7 ;
  wire \input_x[12] ;
  wire [1:0]input_x_IBUF;
  wire \mantissa[0]_i_10_n_0 ;
  wire \mantissa[0]_i_11_n_0 ;
  wire \mantissa[0]_i_12_n_0 ;
  wire \mantissa[0]_i_13_n_0 ;
  wire \mantissa[0]_i_15_n_0 ;
  wire \mantissa[0]_i_17_n_0 ;
  wire \mantissa[0]_i_19_n_0 ;
  wire \mantissa[0]_i_1_n_0 ;
  wire \mantissa[0]_i_22_n_0 ;
  wire \mantissa[0]_i_23_n_0 ;
  wire \mantissa[0]_i_24_n_0 ;
  wire \mantissa[0]_i_25_n_0 ;
  wire \mantissa[0]_i_26_n_0 ;
  wire \mantissa[0]_i_27_n_0 ;
  wire \mantissa[0]_i_28_n_0 ;
  wire \mantissa[0]_i_29_n_0 ;
  wire \mantissa[0]_i_2_n_0 ;
  wire \mantissa[0]_i_30_n_0 ;
  wire \mantissa[0]_i_31_n_0 ;
  wire \mantissa[0]_i_32_n_0 ;
  wire \mantissa[0]_i_33_n_0 ;
  wire \mantissa[0]_i_34_n_0 ;
  wire \mantissa[0]_i_35_n_0 ;
  wire \mantissa[0]_i_36_n_0 ;
  wire \mantissa[0]_i_37_n_0 ;
  wire \mantissa[0]_i_38_n_0 ;
  wire \mantissa[0]_i_39_n_0 ;
  wire \mantissa[0]_i_40_n_0 ;
  wire \mantissa[0]_i_41_n_0 ;
  wire \mantissa[0]_i_42_n_0 ;
  wire \mantissa[0]_i_43_n_0 ;
  wire \mantissa[0]_i_4_n_0 ;
  wire \mantissa[0]_i_5_n_0 ;
  wire \mantissa[0]_i_6_n_0 ;
  wire \mantissa[0]_i_7_n_0 ;
  wire \mantissa[0]_i_8_n_0 ;
  wire \mantissa[0]_i_9_n_0 ;
  wire \mantissa[1]_i_1_n_0 ;
  wire \mantissa[1]_i_2_n_0 ;
  wire \mantissa[2]_i_1_n_0 ;
  wire \mantissa[2]_i_2_n_0 ;
  wire \mantissa[2]_i_3_n_0 ;
  wire \mantissa[3]_i_1_n_0 ;
  wire \mantissa[3]_i_2_n_0 ;
  wire \mantissa[3]_i_3_n_0 ;
  wire \mantissa[4]_i_1_n_0 ;
  wire \mantissa[4]_i_2_n_0 ;
  wire \mantissa[4]_i_3_n_0 ;
  wire \mantissa[5]_i_1_n_0 ;
  wire \mantissa[5]_i_2_n_0 ;
  wire \mantissa[5]_i_3_n_0 ;
  wire \mantissa[5]_i_4_n_0 ;
  wire \mantissa[6]_i_1_n_0 ;
  wire \mantissa[6]_i_2_n_0 ;
  wire \mantissa[6]_i_3_n_0 ;
  wire \mantissa[7]_i_1_n_0 ;
  wire \mantissa[7]_i_2_n_0 ;
  wire \mantissa[7]_i_3_n_0 ;
  wire \mantissa[8]_i_1_n_0 ;
  wire \mantissa[8]_i_2_n_0 ;
  wire \mantissa[8]_i_3_n_0 ;
  wire \mantissa[9]_i_1_n_0 ;
  wire \mantissa[9]_i_2_n_0 ;
  wire \mantissa[9]_i_3_n_0 ;
  wire \mantissa[9]_i_4_n_0 ;
  wire \mantissa[9]_i_5_n_0 ;
  wire \mantissa[9]_i_6_n_0 ;
  wire \mantissa[9]_i_7_n_0 ;
  wire \mantissa_reg[0]_0 ;
  wire \mantissa_reg[0]_1 ;
  wire \mantissa_reg[0]_10 ;
  wire \mantissa_reg[0]_2 ;
  wire \mantissa_reg[0]_3 ;
  wire \mantissa_reg[0]_4 ;
  wire \mantissa_reg[0]_5 ;
  wire \mantissa_reg[0]_6 ;
  wire \mantissa_reg[0]_7 ;
  wire \mantissa_reg[0]_8 ;
  wire \mantissa_reg[0]_9 ;
  wire \mantissa_reg[0]_i_3_n_0 ;
  wire \mantissa_reg[0]_i_3_n_1 ;
  wire \mantissa_reg[0]_i_3_n_2 ;
  wire \mantissa_reg[0]_i_3_n_3 ;
  wire \mantissa_reg[0]_i_3_n_4 ;
  wire \mantissa_reg[0]_i_3_n_5 ;
  wire \mantissa_reg[0]_i_3_n_6 ;
  wire \mantissa_reg[0]_i_3_n_7 ;
  wire [4:0]output_tanh_OBUF;
  wire \output_tanh_reg[0] ;
  wire \output_tanh_reg[10] ;
  wire \output_tanh_reg[11] ;
  wire \output_tanh_reg[12] ;
  wire \output_tanh_reg[13] ;
  wire [4:0]\output_tanh_reg[14] ;
  wire \output_tanh_reg[15] ;
  wire \output_tanh_reg[1] ;
  wire \output_tanh_reg[4] ;
  wire \output_tanh_reg[5] ;
  wire \output_tanh_reg[8] ;
  wire \output_tanh_reg[9] ;
  wire [15:0]output_tmp_add;
  wire reset;
  wire reset_0;
  wire sign35_in;
  wire sign_i_10_n_0;
  wire sign_i_11_n_0;
  wire sign_i_12_n_0;
  wire sign_i_13_n_0;
  wire sign_i_14_n_0;
  wire sign_i_15_n_0;
  wire sign_i_16_n_0;
  wire sign_i_17_n_0;
  wire sign_i_18_n_0;
  wire sign_i_1_n_0;
  wire sign_i_20_n_0;
  wire sign_i_21_n_0;
  wire sign_i_22_n_0;
  wire sign_i_23_n_0;
  wire sign_i_24_n_0;
  wire sign_i_25_n_0;
  wire sign_i_26_n_0;
  wire sign_i_27_n_0;
  wire sign_i_28_n_0;
  wire sign_i_29_n_0;
  wire sign_i_30_n_0;
  wire sign_i_31_n_0;
  wire sign_i_32_n_0;
  wire sign_i_33_n_0;
  wire sign_i_34_n_0;
  wire sign_i_35_n_0;
  wire sign_i_36_n_0;
  wire sign_i_3_n_0;
  wire sign_i_4_n_0;
  wire sign_i_5_n_0;
  wire sign_i_7_n_0;
  wire sign_i_8_n_0;
  wire sign_i_9_n_0;
  wire sign_reg_i_19_n_1;
  wire sign_reg_i_19_n_2;
  wire sign_reg_i_19_n_3;
  wire sign_reg_i_2_n_0;
  wire sign_reg_i_2_n_1;
  wire sign_reg_i_2_n_2;
  wire sign_reg_i_2_n_3;
  wire sign_reg_i_6_n_0;
  wire sign_reg_i_6_n_1;
  wire sign_reg_i_6_n_2;
  wire sign_reg_i_6_n_3;
  wire [15:0]\temp_add_a_reg[15] ;
  wire [2:2]\NLW_exponent_reg[0]_i_4_CO_UNCONNECTED ;
  wire [3:3]\NLW_exponent_reg[0]_i_4_O_UNCONNECTED ;
  wire [3:0]NLW_sign_reg_i_19_O_UNCONNECTED;
  wire [3:0]NLW_sign_reg_i_2_O_UNCONNECTED;
  wire [3:0]NLW_sign_reg_i_6_O_UNCONNECTED;

  LUT6 #(
    .INIT(64'hB888B8BBB8BBB888)) 
    \exponent[0]_i_1 
       (.I0(Q[10]),
        .I1(sign_i_5_n_0),
        .I2(\temp_add_a_reg[15] [10]),
        .I3(sign_i_3_n_0),
        .I4(\exponent[0]_i_2_n_0 ),
        .I5(\exponent[0]_i_3_n_0 ),
        .O(\exponent[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE2E2E21D)) 
    \exponent[0]_i_10 
       (.I0(\temp_add_a_reg[15] [9]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[9]),
        .I3(\exponent[0]_i_27_n_0 ),
        .I4(\exponent[0]_i_26_n_0 ),
        .O(\exponent[0]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hE2E2E21D)) 
    \exponent[0]_i_11 
       (.I0(\temp_add_a_reg[15] [8]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[8]),
        .I3(\exponent[0]_i_28_n_0 ),
        .I4(\exponent[0]_i_26_n_0 ),
        .O(\exponent[0]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'h9995666A)) 
    \exponent[0]_i_12 
       (.I0(\exponent[0]_i_9_n_0 ),
        .I1(\exponent[0]_i_29_n_0 ),
        .I2(\exponent[0]_i_30_n_0 ),
        .I3(\mantissa_reg[0]_10 ),
        .I4(\exponent_reg[0]_0 ),
        .O(\exponent[0]_i_12_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \exponent[0]_i_13 
       (.I0(\exponent[0]_i_10_n_0 ),
        .I1(\exponent[0]_i_29_n_0 ),
        .I2(\mantissa_reg[0]_10 ),
        .O(\exponent[0]_i_13_n_0 ));
  LUT3 #(
    .INIT(8'h69)) 
    \exponent[0]_i_14 
       (.I0(\exponent[0]_i_11_n_0 ),
        .I1(\exponent[0]_i_32_n_0 ),
        .I2(\mantissa_reg[0]_3 ),
        .O(\exponent[0]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h5445444404404444)) 
    \exponent[0]_i_15 
       (.I0(sign_i_4_n_0),
        .I1(\exponent_reg[4]_i_15_n_6 ),
        .I2(Q[15]),
        .I3(\temp_add_a_reg[15] [15]),
        .I4(\exponent_reg[0]_i_4_n_0 ),
        .I5(\exponent_reg[4]_i_15_n_5 ),
        .O(\exponent[0]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hF0FFF0F0F0F5FBFB)) 
    \exponent[0]_i_16 
       (.I0(\mantissa_reg[0]_i_3_n_5 ),
        .I1(\mantissa_reg[0]_i_3_n_6 ),
        .I2(sign_i_4_n_0),
        .I3(\exponent_reg[4]_i_15_n_7 ),
        .I4(\exponent[0]_i_5_n_0 ),
        .I5(\mantissa_reg[0]_i_3_n_4 ),
        .O(\exponent[0]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h5445444404404444)) 
    \exponent[0]_i_17 
       (.I0(sign_i_4_n_0),
        .I1(\exponent_reg[4]_i_15_n_7 ),
        .I2(Q[15]),
        .I3(\temp_add_a_reg[15] [15]),
        .I4(\exponent_reg[0]_i_4_n_0 ),
        .I5(\exponent_reg[4]_i_15_n_6 ),
        .O(\exponent[0]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EBAA28AA)) 
    \exponent[0]_i_18 
       (.I0(\exponent_reg[4]_i_15_n_5 ),
        .I1(Q[15]),
        .I2(\temp_add_a_reg[15] [15]),
        .I3(\exponent_reg[0]_i_4_n_0 ),
        .I4(\exponent_reg[4]_i_15_n_4 ),
        .I5(sign_i_4_n_0),
        .O(\exponent[0]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EBAA28AA)) 
    \exponent[0]_i_19 
       (.I0(\exponent_reg[4]_i_15_n_4 ),
        .I1(Q[15]),
        .I2(\temp_add_a_reg[15] [15]),
        .I3(\exponent_reg[0]_i_4_n_0 ),
        .I4(\exponent_reg[0]_i_4_n_7 ),
        .I5(sign_i_4_n_0),
        .O(\exponent[0]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'h0004000400040005)) 
    \exponent[0]_i_2 
       (.I0(sign_i_4_n_0),
        .I1(\exponent_reg[0]_i_4_n_6 ),
        .I2(\exponent[0]_i_5_n_0 ),
        .I3(\exponent_reg[0]_i_4_n_5 ),
        .I4(\exponent_reg[0]_i_4_n_7 ),
        .I5(\exponent[0]_i_6_n_0 ),
        .O(\exponent[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A08AAAA00008A08)) 
    \exponent[0]_i_20 
       (.I0(\exponent[4]_i_17_n_0 ),
        .I1(\exponent[0]_i_25_n_0 ),
        .I2(\temp_add_a_reg[15] [12]),
        .I3(Q[12]),
        .I4(\temp_add_a_reg[15] [13]),
        .I5(Q[13]),
        .O(\exponent[0]_i_20_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h42)) 
    \exponent[0]_i_21 
       (.I0(Q[13]),
        .I1(\exponent_reg[0]_1 ),
        .I2(\temp_add_a_reg[15] [13]),
        .O(\exponent[0]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'h0140415005410140)) 
    \exponent[0]_i_22 
       (.I0(\exponent[0]_i_34_n_0 ),
        .I1(Q[11]),
        .I2(\exponent_reg[0]_1 ),
        .I3(\temp_add_a_reg[15] [11]),
        .I4(\temp_add_a_reg[15] [10]),
        .I5(Q[10]),
        .O(\exponent[0]_i_22_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h2F4422F4)) 
    \exponent[0]_i_23 
       (.I0(Q[13]),
        .I1(\temp_add_a_reg[15] [13]),
        .I2(\temp_add_a_reg[15] [12]),
        .I3(\exponent_reg[0]_1 ),
        .I4(Q[12]),
        .O(\exponent[0]_i_23_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hBB2B)) 
    \exponent[0]_i_24 
       (.I0(\temp_add_a_reg[15] [13]),
        .I1(Q[13]),
        .I2(Q[12]),
        .I3(\temp_add_a_reg[15] [12]),
        .O(\exponent[0]_i_24_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h44D4)) 
    \exponent[0]_i_25 
       (.I0(\temp_add_a_reg[15] [11]),
        .I1(Q[11]),
        .I2(Q[10]),
        .I3(\temp_add_a_reg[15] [10]),
        .O(\exponent[0]_i_25_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hEB)) 
    \exponent[0]_i_26 
       (.I0(CO),
        .I1(\temp_add_a_reg[15] [15]),
        .I2(Q[15]),
        .O(\exponent[0]_i_26_n_0 ));
  LUT6 #(
    .INIT(64'h0000003050500030)) 
    \exponent[0]_i_27 
       (.I0(Q[7]),
        .I1(\temp_add_a_reg[15] [7]),
        .I2(\exponent[4]_i_26_n_0 ),
        .I3(\temp_add_a_reg[15] [8]),
        .I4(\exponent_reg[0]_1 ),
        .I5(Q[8]),
        .O(\exponent[0]_i_27_n_0 ));
  LUT6 #(
    .INIT(64'h0000003050500030)) 
    \exponent[0]_i_28 
       (.I0(Q[6]),
        .I1(\temp_add_a_reg[15] [6]),
        .I2(\exponent[4]_i_27_n_0 ),
        .I3(\temp_add_a_reg[15] [7]),
        .I4(\exponent_reg[0]_1 ),
        .I5(Q[7]),
        .O(\exponent[0]_i_28_n_0 ));
  LUT6 #(
    .INIT(64'h3333000033330020)) 
    \exponent[0]_i_29 
       (.I0(\mantissa_reg[0]_0 ),
        .I1(\exponent[4]_i_34_n_0 ),
        .I2(\mantissa_reg[0]_1 ),
        .I3(\mantissa_reg[0]_2 ),
        .I4(\exponent[0]_i_30_n_0 ),
        .I5(\mantissa_reg[0]_3 ),
        .O(\exponent[0]_i_29_n_0 ));
  LUT6 #(
    .INIT(64'h0104451554511040)) 
    \exponent[0]_i_3 
       (.I0(\exponent[4]_i_4_n_0 ),
        .I1(\exponent_reg[0]_0 ),
        .I2(\temp_add_a_reg[15] [10]),
        .I3(\exponent_reg[0]_1 ),
        .I4(Q[10]),
        .I5(\exponent[0]_i_5_n_0 ),
        .O(\exponent[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h9F)) 
    \exponent[0]_i_30 
       (.I0(\temp_add_a_reg[15] [15]),
        .I1(Q[15]),
        .I2(CO),
        .O(\exponent[0]_i_30_n_0 ));
  LUT6 #(
    .INIT(64'hFFFDFDFFA8A8A8A8)) 
    \exponent[0]_i_31 
       (.I0(\exponent_reg[0]_0 ),
        .I1(\exponent[0]_i_36_n_0 ),
        .I2(\exponent[0]_i_37_n_0 ),
        .I3(Q[10]),
        .I4(\temp_add_a_reg[15] [10]),
        .I5(\exponent[0]_i_38_n_0 ),
        .O(\mantissa_reg[0]_10 ));
  LUT5 #(
    .INIT(32'h0F040F00)) 
    \exponent[0]_i_32 
       (.I0(\mantissa_reg[0]_2 ),
        .I1(\mantissa_reg[0]_1 ),
        .I2(\exponent[4]_i_34_n_0 ),
        .I3(\exponent[0]_i_30_n_0 ),
        .I4(\mantissa_reg[0]_0 ),
        .O(\exponent[0]_i_32_n_0 ));
  LUT6 #(
    .INIT(64'h1F1F1F1010101F10)) 
    \exponent[0]_i_33 
       (.I0(\exponent[0]_i_36_n_0 ),
        .I1(\exponent[0]_i_39_n_0 ),
        .I2(\exponent_reg[0]_0 ),
        .I3(Q[8]),
        .I4(\exponent_reg[0]_1 ),
        .I5(\temp_add_a_reg[15] [8]),
        .O(\mantissa_reg[0]_3 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \exponent[0]_i_34 
       (.I0(\temp_add_a_reg[15] [12]),
        .I1(Q[12]),
        .O(\exponent[0]_i_34_n_0 ));
  LUT6 #(
    .INIT(64'hA6656565A6A6A665)) 
    \exponent[0]_i_36 
       (.I0(\exponent[4]_i_17_n_0 ),
        .I1(\exponent[0]_i_44_n_0 ),
        .I2(\exponent[0]_i_45_n_0 ),
        .I3(\exponent[0]_i_46_n_0 ),
        .I4(\exponent[0]_i_47_n_0 ),
        .I5(\exponent[0]_i_48_n_0 ),
        .O(\exponent[0]_i_36_n_0 ));
  LUT6 #(
    .INIT(64'hBAAEEFFBEFFBBAAE)) 
    \exponent[0]_i_37 
       (.I0(\exponent[0]_i_49_n_0 ),
        .I1(Q[10]),
        .I2(\exponent_reg[0]_1 ),
        .I3(\temp_add_a_reg[15] [10]),
        .I4(\temp_add_a_reg[15] [11]),
        .I5(Q[11]),
        .O(\exponent[0]_i_37_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \exponent[0]_i_38 
       (.I0(\temp_add_a_reg[15] [9]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[9]),
        .O(\exponent[0]_i_38_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF3CBEFFFF3C82)) 
    \exponent[0]_i_39 
       (.I0(\exponent[0]_i_50_n_0 ),
        .I1(Q[10]),
        .I2(\temp_add_a_reg[15] [10]),
        .I3(\exponent[0]_i_51_n_0 ),
        .I4(\exponent[0]_i_49_n_0 ),
        .I5(\exponent[0]_i_38_n_0 ),
        .O(\exponent[0]_i_39_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \exponent[0]_i_44 
       (.I0(\temp_add_a_reg[15] [13]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[13]),
        .O(\exponent[0]_i_44_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \exponent[0]_i_45 
       (.I0(Q[13]),
        .I1(\exponent_reg[0]_1 ),
        .I2(\temp_add_a_reg[15] [13]),
        .O(\exponent[0]_i_45_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h1D)) 
    \exponent[0]_i_46 
       (.I0(\temp_add_a_reg[15] [12]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[12]),
        .O(\exponent[0]_i_46_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \exponent[0]_i_47 
       (.I0(\temp_add_a_reg[15] [12]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[12]),
        .O(\exponent[0]_i_47_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hBD399CBD)) 
    \exponent[0]_i_48 
       (.I0(Q[11]),
        .I1(\exponent_reg[0]_1 ),
        .I2(\temp_add_a_reg[15] [11]),
        .I3(Q[10]),
        .I4(\temp_add_a_reg[15] [10]),
        .O(\exponent[0]_i_48_n_0 ));
  LUT6 #(
    .INIT(64'h3CFFFF69FF963CFF)) 
    \exponent[0]_i_49 
       (.I0(\exponent_reg[0]_1 ),
        .I1(\temp_add_a_reg[15] [13]),
        .I2(Q[13]),
        .I3(\exponent[0]_i_48_n_0 ),
        .I4(\temp_add_a_reg[15] [12]),
        .I5(Q[12]),
        .O(\exponent[0]_i_49_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h82)) 
    \exponent[0]_i_5 
       (.I0(\exponent_reg[0]_i_4_n_0 ),
        .I1(\temp_add_a_reg[15] [15]),
        .I2(Q[15]),
        .O(\exponent[0]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \exponent[0]_i_50 
       (.I0(\temp_add_a_reg[15] [8]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[8]),
        .O(\exponent[0]_i_50_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h66699666)) 
    \exponent[0]_i_51 
       (.I0(Q[11]),
        .I1(\temp_add_a_reg[15] [11]),
        .I2(\temp_add_a_reg[15] [10]),
        .I3(\exponent_reg[0]_1 ),
        .I4(Q[10]),
        .O(\exponent[0]_i_51_n_0 ));
  LUT5 #(
    .INIT(32'h0000FF54)) 
    \exponent[0]_i_6 
       (.I0(\exponent[0]_i_15_n_0 ),
        .I1(\exponent[0]_i_16_n_0 ),
        .I2(\exponent[0]_i_17_n_0 ),
        .I3(\exponent[0]_i_18_n_0 ),
        .I4(\exponent[0]_i_19_n_0 ),
        .O(\exponent[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h35F335F335F305F0)) 
    \exponent[0]_i_7 
       (.I0(\exponent[0]_i_20_n_0 ),
        .I1(\exponent[0]_i_21_n_0 ),
        .I2(Q[14]),
        .I3(\temp_add_a_reg[15] [14]),
        .I4(\exponent[0]_i_22_n_0 ),
        .I5(\exponent[0]_i_23_n_0 ),
        .O(\exponent_reg[0]_0 ));
  LUT5 #(
    .INIT(32'h75FF0075)) 
    \exponent[0]_i_8 
       (.I0(\exponent[0]_i_24_n_0 ),
        .I1(sign_i_17_n_0),
        .I2(\exponent[0]_i_25_n_0 ),
        .I3(\temp_add_a_reg[15] [14]),
        .I4(Q[14]),
        .O(\exponent_reg[0]_1 ));
  LUT5 #(
    .INIT(32'hBABFAAAA)) 
    \exponent[0]_i_9 
       (.I0(\exponent[0]_i_26_n_0 ),
        .I1(Q[9]),
        .I2(\exponent_reg[0]_1 ),
        .I3(\temp_add_a_reg[15] [9]),
        .I4(\exponent[0]_i_27_n_0 ),
        .O(\exponent[0]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hB8BBB888B888B8BB)) 
    \exponent[1]_i_1 
       (.I0(Q[11]),
        .I1(sign_i_5_n_0),
        .I2(\temp_add_a_reg[15] [11]),
        .I3(sign_i_3_n_0),
        .I4(\exponent[1]_i_2_n_0 ),
        .I5(\exponent[1]_i_3_n_0 ),
        .O(\exponent[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFEEFEEEE)) 
    \exponent[1]_i_10 
       (.I0(\exponent_reg[0]_i_4_n_6 ),
        .I1(\exponent_reg[0]_i_4_n_5 ),
        .I2(Q[15]),
        .I3(\temp_add_a_reg[15] [15]),
        .I4(\exponent_reg[0]_i_4_n_0 ),
        .I5(sign_i_4_n_0),
        .O(\exponent[1]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h8A80A808)) 
    \exponent[1]_i_11 
       (.I0(\exponent[0]_i_5_n_0 ),
        .I1(Q[10]),
        .I2(\exponent_reg[0]_1 ),
        .I3(\temp_add_a_reg[15] [10]),
        .I4(\exponent_reg[0]_0 ),
        .O(\exponent[1]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hD2)) 
    \exponent[1]_i_2 
       (.I0(\exponent[0]_i_2_n_0 ),
        .I1(\exponent[0]_i_3_n_0 ),
        .I2(\exponent[1]_i_4_n_0 ),
        .O(\exponent[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000F1FFFF)) 
    \exponent[1]_i_3 
       (.I0(\exponent[1]_i_5_n_0 ),
        .I1(\exponent[1]_i_6_n_0 ),
        .I2(\exponent[1]_i_7_n_0 ),
        .I3(\exponent[1]_i_8_n_0 ),
        .I4(\exponent[1]_i_9_n_0 ),
        .I5(\exponent[1]_i_10_n_0 ),
        .O(\exponent[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFEFBBAEAABAEEFBF)) 
    \exponent[1]_i_4 
       (.I0(\exponent[4]_i_4_n_0 ),
        .I1(\exponent_reg[0]_0 ),
        .I2(\temp_add_a_reg[15] [11]),
        .I3(\exponent_reg[0]_1 ),
        .I4(Q[11]),
        .I5(\exponent[1]_i_11_n_0 ),
        .O(\exponent[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EBAA28AA)) 
    \exponent[1]_i_5 
       (.I0(\mantissa_reg[0]_i_3_n_6 ),
        .I1(Q[15]),
        .I2(\temp_add_a_reg[15] [15]),
        .I3(\exponent_reg[0]_i_4_n_0 ),
        .I4(\mantissa_reg[0]_i_3_n_5 ),
        .I5(sign_i_4_n_0),
        .O(\exponent[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h5555145541000000)) 
    \exponent[1]_i_6 
       (.I0(sign_i_4_n_0),
        .I1(Q[15]),
        .I2(\temp_add_a_reg[15] [15]),
        .I3(\exponent_reg[0]_i_4_n_0 ),
        .I4(\mantissa_reg[0]_i_3_n_4 ),
        .I5(\mantissa_reg[0]_i_3_n_5 ),
        .O(\exponent[1]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h32333230)) 
    \exponent[1]_i_7 
       (.I0(\exponent_reg[4]_i_15_n_6 ),
        .I1(sign_i_4_n_0),
        .I2(\exponent_reg[4]_i_15_n_7 ),
        .I3(\exponent[0]_i_5_n_0 ),
        .I4(\mantissa_reg[0]_i_3_n_4 ),
        .O(\exponent[1]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h0000EFEC)) 
    \exponent[1]_i_8 
       (.I0(\exponent_reg[4]_i_15_n_4 ),
        .I1(\exponent_reg[4]_i_15_n_5 ),
        .I2(\exponent[0]_i_5_n_0 ),
        .I3(\exponent_reg[4]_i_15_n_6 ),
        .I4(sign_i_4_n_0),
        .O(\exponent[1]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hCDCCCDCF)) 
    \exponent[1]_i_9 
       (.I0(\exponent_reg[0]_i_4_n_6 ),
        .I1(sign_i_4_n_0),
        .I2(\exponent_reg[0]_i_4_n_7 ),
        .I3(\exponent[0]_i_5_n_0 ),
        .I4(\exponent_reg[4]_i_15_n_4 ),
        .O(\exponent[1]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \exponent[2]_i_1 
       (.I0(Q[12]),
        .I1(sign_i_5_n_0),
        .I2(\exponent[2]_i_2_n_0 ),
        .O(\exponent[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h8BB8B88B)) 
    \exponent[2]_i_2 
       (.I0(\temp_add_a_reg[15] [12]),
        .I1(sign_i_3_n_0),
        .I2(\exponent[4]_i_9_n_0 ),
        .I3(\exponent[3]_i_4_n_0 ),
        .I4(\exponent[4]_i_8_n_0 ),
        .O(\exponent[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB888B8BBB8BBB888)) 
    \exponent[3]_i_1 
       (.I0(Q[13]),
        .I1(sign_i_5_n_0),
        .I2(\temp_add_a_reg[15] [13]),
        .I3(sign_i_3_n_0),
        .I4(\exponent[3]_i_2_n_0 ),
        .I5(\exponent[3]_i_3_n_0 ),
        .O(\exponent[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \exponent[3]_i_2 
       (.I0(\exponent[3]_i_4_n_0 ),
        .I1(\exponent[4]_i_9_n_0 ),
        .I2(\exponent[4]_i_8_n_0 ),
        .O(\exponent[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \exponent[3]_i_3 
       (.I0(\exponent[4]_i_10_n_0 ),
        .I1(\exponent[4]_i_11_n_0 ),
        .I2(\exponent[4]_i_7_n_0 ),
        .O(\exponent[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \exponent[3]_i_4 
       (.I0(\exponent[4]_i_11_n_0 ),
        .I1(\exponent[4]_i_10_n_0 ),
        .O(\exponent[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hB888B8BBB8BBB888)) 
    \exponent[4]_i_1 
       (.I0(Q[14]),
        .I1(sign_i_5_n_0),
        .I2(\temp_add_a_reg[15] [14]),
        .I3(sign_i_3_n_0),
        .I4(\exponent[4]_i_2_n_0 ),
        .I5(\exponent[4]_i_3_n_0 ),
        .O(\exponent[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FF01FF0D)) 
    \exponent[4]_i_10 
       (.I0(\mantissa_reg[0]_i_3_n_4 ),
        .I1(\exponent[0]_i_5_n_0 ),
        .I2(\exponent_reg[4]_i_15_n_7 ),
        .I3(sign_i_4_n_0),
        .I4(\exponent_reg[4]_i_15_n_6 ),
        .I5(\exponent[1]_i_8_n_0 ),
        .O(\exponent[4]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \exponent[4]_i_11 
       (.I0(\exponent_reg[4]_i_15_n_4 ),
        .I1(\exponent_reg[0]_i_4_n_7 ),
        .I2(sign_i_4_n_0),
        .I3(\exponent[0]_i_5_n_0 ),
        .I4(\exponent_reg[0]_i_4_n_5 ),
        .I5(\exponent_reg[0]_i_4_n_6 ),
        .O(\exponent[4]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFFFFFF)) 
    \exponent[4]_i_12 
       (.I0(Q[11]),
        .I1(\temp_add_a_reg[15] [11]),
        .I2(Q[12]),
        .I3(\temp_add_a_reg[15] [12]),
        .I4(\exponent[4]_i_16_n_0 ),
        .I5(\exponent[4]_i_17_n_0 ),
        .O(\exponent[4]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'h8A80A808)) 
    \exponent[4]_i_13 
       (.I0(\exponent[1]_i_11_n_0 ),
        .I1(Q[11]),
        .I2(\exponent_reg[0]_1 ),
        .I3(\temp_add_a_reg[15] [11]),
        .I4(\exponent_reg[0]_0 ),
        .O(\exponent[4]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h12B7)) 
    \exponent[4]_i_14 
       (.I0(\exponent_reg[0]_0 ),
        .I1(\temp_add_a_reg[15] [12]),
        .I2(\exponent_reg[0]_1 ),
        .I3(Q[12]),
        .O(\exponent[4]_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \exponent[4]_i_16 
       (.I0(Q[10]),
        .I1(\temp_add_a_reg[15] [10]),
        .O(\exponent[4]_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \exponent[4]_i_17 
       (.I0(\temp_add_a_reg[15] [14]),
        .I1(Q[14]),
        .O(\exponent[4]_i_17_n_0 ));
  LUT5 #(
    .INIT(32'hE2E2E21D)) 
    \exponent[4]_i_18 
       (.I0(\temp_add_a_reg[15] [7]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[7]),
        .I3(\exponent[4]_i_26_n_0 ),
        .I4(\exponent[0]_i_26_n_0 ),
        .O(\exponent[4]_i_18_n_0 ));
  LUT5 #(
    .INIT(32'hE2E2E21D)) 
    \exponent[4]_i_19 
       (.I0(\temp_add_a_reg[15] [6]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[6]),
        .I3(\exponent[4]_i_27_n_0 ),
        .I4(\exponent[0]_i_26_n_0 ),
        .O(\exponent[4]_i_19_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hAEAEAEFB)) 
    \exponent[4]_i_2 
       (.I0(\exponent[4]_i_4_n_0 ),
        .I1(\exponent[4]_i_5_n_0 ),
        .I2(\exponent[4]_i_6_n_0 ),
        .I3(\temp_add_a_reg[15] [14]),
        .I4(Q[14]),
        .O(\exponent[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hE2E2E21D)) 
    \exponent[4]_i_20 
       (.I0(\temp_add_a_reg[15] [5]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[5]),
        .I3(\exponent[4]_i_28_n_0 ),
        .I4(\exponent[0]_i_26_n_0 ),
        .O(\exponent[4]_i_20_n_0 ));
  LUT5 #(
    .INIT(32'hE2E2E21D)) 
    \exponent[4]_i_21 
       (.I0(\temp_add_a_reg[15] [4]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[4]),
        .I3(\exponent[4]_i_29_n_0 ),
        .I4(\exponent[0]_i_26_n_0 ),
        .O(\exponent[4]_i_21_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \exponent[4]_i_22 
       (.I0(\exponent[4]_i_18_n_0 ),
        .I1(\exponent[4]_i_30_n_0 ),
        .I2(\mantissa_reg[0]_0 ),
        .O(\exponent[4]_i_22_n_0 ));
  LUT3 #(
    .INIT(8'h69)) 
    \exponent[4]_i_23 
       (.I0(\exponent[4]_i_19_n_0 ),
        .I1(\exponent[4]_i_32_n_0 ),
        .I2(\mantissa_reg[0]_2 ),
        .O(\exponent[4]_i_23_n_0 ));
  LUT3 #(
    .INIT(8'h69)) 
    \exponent[4]_i_24 
       (.I0(\exponent[4]_i_20_n_0 ),
        .I1(\exponent[4]_i_34_n_0 ),
        .I2(\mantissa_reg[0]_1 ),
        .O(\exponent[4]_i_24_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \exponent[4]_i_25 
       (.I0(\exponent[4]_i_21_n_0 ),
        .I1(\exponent[4]_i_36_n_0 ),
        .I2(\mantissa_reg[0]_4 ),
        .O(\exponent[4]_i_25_n_0 ));
  LUT6 #(
    .INIT(64'h0000003050500030)) 
    \exponent[4]_i_26 
       (.I0(Q[5]),
        .I1(\temp_add_a_reg[15] [5]),
        .I2(\exponent[4]_i_28_n_0 ),
        .I3(\temp_add_a_reg[15] [6]),
        .I4(\exponent_reg[0]_1 ),
        .I5(Q[6]),
        .O(\exponent[4]_i_26_n_0 ));
  LUT6 #(
    .INIT(64'h0000003050500030)) 
    \exponent[4]_i_27 
       (.I0(Q[4]),
        .I1(\temp_add_a_reg[15] [4]),
        .I2(\exponent[4]_i_29_n_0 ),
        .I3(\temp_add_a_reg[15] [5]),
        .I4(\exponent_reg[0]_1 ),
        .I5(Q[5]),
        .O(\exponent[4]_i_27_n_0 ));
  LUT6 #(
    .INIT(64'h0000003050500030)) 
    \exponent[4]_i_28 
       (.I0(Q[3]),
        .I1(\temp_add_a_reg[15] [3]),
        .I2(\mantissa[0]_i_12_n_0 ),
        .I3(\temp_add_a_reg[15] [4]),
        .I4(\exponent_reg[0]_1 ),
        .I5(Q[4]),
        .O(\exponent[4]_i_28_n_0 ));
  LUT6 #(
    .INIT(64'h0000003050500030)) 
    \exponent[4]_i_29 
       (.I0(Q[2]),
        .I1(\temp_add_a_reg[15] [2]),
        .I2(\exponent[4]_i_38_n_0 ),
        .I3(\temp_add_a_reg[15] [3]),
        .I4(\exponent_reg[0]_1 ),
        .I5(Q[3]),
        .O(\exponent[4]_i_29_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h2AABBFBF)) 
    \exponent[4]_i_3 
       (.I0(\exponent[4]_i_7_n_0 ),
        .I1(\exponent[4]_i_8_n_0 ),
        .I2(\exponent[4]_i_9_n_0 ),
        .I3(\exponent[4]_i_10_n_0 ),
        .I4(\exponent[4]_i_11_n_0 ),
        .O(\exponent[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h5005555554455555)) 
    \exponent[4]_i_30 
       (.I0(\exponent[4]_i_34_n_0 ),
        .I1(\mantissa_reg[0]_1 ),
        .I2(\temp_add_a_reg[15] [15]),
        .I3(Q[15]),
        .I4(CO),
        .I5(\mantissa_reg[0]_2 ),
        .O(\exponent[4]_i_30_n_0 ));
  LUT6 #(
    .INIT(64'hD8FAD8D8FAFAFAD8)) 
    \exponent[4]_i_31 
       (.I0(\exponent_reg[0]_0 ),
        .I1(\exponent[0]_i_36_n_0 ),
        .I2(\exponent[4]_i_39_n_0 ),
        .I3(\exponent[4]_i_16_n_0 ),
        .I4(\exponent[4]_i_40_n_0 ),
        .I5(\exponent[4]_i_41_n_0 ),
        .O(\mantissa_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h0000FF9F)) 
    \exponent[4]_i_32 
       (.I0(\temp_add_a_reg[15] [15]),
        .I1(Q[15]),
        .I2(CO),
        .I3(\mantissa_reg[0]_1 ),
        .I4(\exponent[4]_i_34_n_0 ),
        .O(\exponent[4]_i_32_n_0 ));
  LUT6 #(
    .INIT(64'h2727270505052705)) 
    \exponent[4]_i_33 
       (.I0(\exponent_reg[0]_0 ),
        .I1(\exponent[0]_i_36_n_0 ),
        .I2(\exponent[4]_i_42_n_0 ),
        .I3(\exponent[4]_i_41_n_0 ),
        .I4(\exponent[4]_i_16_n_0 ),
        .I5(\exponent[4]_i_43_n_0 ),
        .O(\mantissa_reg[0]_2 ));
  LUT6 #(
    .INIT(64'h00FF00FF00FF00FE)) 
    \exponent[4]_i_34 
       (.I0(\mantissa_reg[0]_4 ),
        .I1(\mantissa_reg[0]_5 ),
        .I2(\mantissa_reg[0]_6 ),
        .I3(\exponent[0]_i_30_n_0 ),
        .I4(\mantissa_reg[0]_7 ),
        .I5(\mantissa_reg[0]_8 ),
        .O(\exponent[4]_i_34_n_0 ));
  LUT6 #(
    .INIT(64'hFAFAD8FAD8D8D8FA)) 
    \exponent[4]_i_35 
       (.I0(\exponent_reg[0]_0 ),
        .I1(\exponent[0]_i_36_n_0 ),
        .I2(\exponent[4]_i_44_n_0 ),
        .I3(\exponent[4]_i_43_n_0 ),
        .I4(\exponent[4]_i_16_n_0 ),
        .I5(\exponent[4]_i_45_n_0 ),
        .O(\mantissa_reg[0]_1 ));
  LUT5 #(
    .INIT(32'h0F0F0F0E)) 
    \exponent[4]_i_36 
       (.I0(\mantissa_reg[0]_8 ),
        .I1(\mantissa_reg[0]_7 ),
        .I2(\exponent[0]_i_30_n_0 ),
        .I3(\mantissa_reg[0]_6 ),
        .I4(\mantissa_reg[0]_5 ),
        .O(\exponent[4]_i_36_n_0 ));
  LUT6 #(
    .INIT(64'h0505052727052727)) 
    \exponent[4]_i_37 
       (.I0(\exponent_reg[0]_0 ),
        .I1(\exponent[0]_i_36_n_0 ),
        .I2(\exponent[4]_i_46_n_0 ),
        .I3(\exponent[4]_i_16_n_0 ),
        .I4(\exponent[4]_i_45_n_0 ),
        .I5(\mantissa[0]_i_23_n_0 ),
        .O(\mantissa_reg[0]_4 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h00053305)) 
    \exponent[4]_i_38 
       (.I0(\temp_add_a_reg[15] [1]),
        .I1(Q[1]),
        .I2(\temp_add_a_reg[15] [0]),
        .I3(\exponent_reg[0]_1 ),
        .I4(Q[0]),
        .O(\exponent[4]_i_38_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \exponent[4]_i_39 
       (.I0(\temp_add_a_reg[15] [7]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[7]),
        .O(\exponent[4]_i_39_n_0 ));
  LUT6 #(
    .INIT(64'h0000000060000060)) 
    \exponent[4]_i_4 
       (.I0(\temp_add_a_reg[15] [15]),
        .I1(Q[15]),
        .I2(sign35_in),
        .I3(Q[13]),
        .I4(\temp_add_a_reg[15] [13]),
        .I5(\exponent[4]_i_12_n_0 ),
        .O(\exponent[4]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hCDCCCDDD)) 
    \exponent[4]_i_40 
       (.I0(\exponent[0]_i_51_n_0 ),
        .I1(\exponent[0]_i_49_n_0 ),
        .I2(\temp_add_a_reg[15] [8]),
        .I3(\exponent_reg[0]_1 ),
        .I4(Q[8]),
        .O(\exponent[4]_i_40_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000FFB8B8)) 
    \exponent[4]_i_41 
       (.I0(\temp_add_a_reg[15] [7]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[7]),
        .I3(\exponent[0]_i_38_n_0 ),
        .I4(\exponent[0]_i_51_n_0 ),
        .I5(\exponent[0]_i_49_n_0 ),
        .O(\exponent[4]_i_41_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \exponent[4]_i_42 
       (.I0(\temp_add_a_reg[15] [6]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[6]),
        .O(\exponent[4]_i_42_n_0 ));
  LUT6 #(
    .INIT(64'h0000FC0C55555555)) 
    \exponent[4]_i_43 
       (.I0(\exponent[4]_i_47_n_0 ),
        .I1(Q[8]),
        .I2(\exponent_reg[0]_1 ),
        .I3(\temp_add_a_reg[15] [8]),
        .I4(\exponent[0]_i_49_n_0 ),
        .I5(\exponent[0]_i_51_n_0 ),
        .O(\exponent[4]_i_43_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \exponent[4]_i_44 
       (.I0(\temp_add_a_reg[15] [5]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[5]),
        .O(\exponent[4]_i_44_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFCBBFFFFFC88)) 
    \exponent[4]_i_45 
       (.I0(\exponent[4]_i_39_n_0 ),
        .I1(\exponent[0]_i_51_n_0 ),
        .I2(\exponent[0]_i_38_n_0 ),
        .I3(\mantissa[0]_i_31_n_0 ),
        .I4(\mantissa[0]_i_32_n_0 ),
        .I5(\exponent[4]_i_44_n_0 ),
        .O(\exponent[4]_i_45_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \exponent[4]_i_46 
       (.I0(\temp_add_a_reg[15] [4]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[4]),
        .O(\exponent[4]_i_46_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFFFF1015)) 
    \exponent[4]_i_47 
       (.I0(\mantissa[0]_i_31_n_0 ),
        .I1(\temp_add_a_reg[15] [6]),
        .I2(\exponent_reg[0]_1 ),
        .I3(Q[6]),
        .I4(\mantissa[0]_i_32_n_0 ),
        .O(\exponent[4]_i_47_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h8A80A808)) 
    \exponent[4]_i_5 
       (.I0(\exponent[4]_i_13_n_0 ),
        .I1(Q[12]),
        .I2(\exponent_reg[0]_1 ),
        .I3(\temp_add_a_reg[15] [12]),
        .I4(\exponent_reg[0]_0 ),
        .O(\exponent[4]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h12B7)) 
    \exponent[4]_i_6 
       (.I0(\exponent_reg[0]_0 ),
        .I1(\temp_add_a_reg[15] [13]),
        .I2(\exponent_reg[0]_1 ),
        .I3(Q[13]),
        .O(\exponent[4]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h1141)) 
    \exponent[4]_i_7 
       (.I0(\exponent[4]_i_4_n_0 ),
        .I1(\exponent[4]_i_6_n_0 ),
        .I2(\exponent[4]_i_13_n_0 ),
        .I3(\exponent[4]_i_14_n_0 ),
        .O(\exponent[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFEFBBAEAABAEEFBF)) 
    \exponent[4]_i_8 
       (.I0(\exponent[4]_i_4_n_0 ),
        .I1(\exponent_reg[0]_0 ),
        .I2(\temp_add_a_reg[15] [12]),
        .I3(\exponent_reg[0]_1 ),
        .I4(Q[12]),
        .I5(\exponent[4]_i_13_n_0 ),
        .O(\exponent[4]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hF220)) 
    \exponent[4]_i_9 
       (.I0(\exponent[0]_i_2_n_0 ),
        .I1(\exponent[0]_i_3_n_0 ),
        .I2(\exponent[1]_i_3_n_0 ),
        .I3(\exponent[1]_i_4_n_0 ),
        .O(\exponent[4]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \exponent_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\exponent[0]_i_1_n_0 ),
        .Q(output_tmp_add[10]),
        .R(1'b0));
  CARRY4 \exponent_reg[0]_i_4 
       (.CI(\exponent_reg[4]_i_15_n_0 ),
        .CO({\exponent_reg[0]_i_4_n_0 ,\NLW_exponent_reg[0]_i_4_CO_UNCONNECTED [2],\exponent_reg[0]_i_4_n_2 ,\exponent_reg[0]_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\exponent[0]_i_9_n_0 ,\exponent[0]_i_10_n_0 ,\exponent[0]_i_11_n_0 }),
        .O({\NLW_exponent_reg[0]_i_4_O_UNCONNECTED [3],\exponent_reg[0]_i_4_n_5 ,\exponent_reg[0]_i_4_n_6 ,\exponent_reg[0]_i_4_n_7 }),
        .S({1'b1,\exponent[0]_i_12_n_0 ,\exponent[0]_i_13_n_0 ,\exponent[0]_i_14_n_0 }));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \exponent_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\exponent[1]_i_1_n_0 ),
        .Q(output_tmp_add[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \exponent_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\exponent[2]_i_1_n_0 ),
        .Q(output_tmp_add[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \exponent_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\exponent[3]_i_1_n_0 ),
        .Q(output_tmp_add[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \exponent_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\exponent[4]_i_1_n_0 ),
        .Q(\output_tanh_reg[14] [4]),
        .R(1'b0));
  CARRY4 \exponent_reg[4]_i_15 
       (.CI(\mantissa_reg[0]_i_3_n_0 ),
        .CO({\exponent_reg[4]_i_15_n_0 ,\exponent_reg[4]_i_15_n_1 ,\exponent_reg[4]_i_15_n_2 ,\exponent_reg[4]_i_15_n_3 }),
        .CYINIT(1'b0),
        .DI({\exponent[4]_i_18_n_0 ,\exponent[4]_i_19_n_0 ,\exponent[4]_i_20_n_0 ,\exponent[4]_i_21_n_0 }),
        .O({\exponent_reg[4]_i_15_n_4 ,\exponent_reg[4]_i_15_n_5 ,\exponent_reg[4]_i_15_n_6 ,\exponent_reg[4]_i_15_n_7 }),
        .S({\exponent[4]_i_22_n_0 ,\exponent[4]_i_23_n_0 ,\exponent[4]_i_24_n_0 ,\exponent[4]_i_25_n_0 }));
  LUT6 #(
    .INIT(64'hBBBB88888B888B88)) 
    \mantissa[0]_i_1 
       (.I0(Q[0]),
        .I1(sign_i_5_n_0),
        .I2(\exponent[0]_i_2_n_0 ),
        .I3(\mantissa[0]_i_2_n_0 ),
        .I4(\temp_add_a_reg[15] [0]),
        .I5(sign_i_3_n_0),
        .O(\mantissa[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h1EE1E11E)) 
    \mantissa[0]_i_10 
       (.I0(\mantissa_reg[0]_9 ),
        .I1(\exponent[0]_i_26_n_0 ),
        .I2(\mantissa[0]_i_13_n_0 ),
        .I3(\mantissa[0]_i_19_n_0 ),
        .I4(\mantissa_reg[0]_6 ),
        .O(\mantissa[0]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \mantissa[0]_i_11 
       (.I0(\temp_add_a_reg[15] [0]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[0]),
        .I3(\mantissa_reg[0]_7 ),
        .O(\mantissa[0]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h0000000A2222000A)) 
    \mantissa[0]_i_12 
       (.I0(\mantissa_reg[0]_9 ),
        .I1(Q[1]),
        .I2(\temp_add_a_reg[15] [1]),
        .I3(\temp_add_a_reg[15] [2]),
        .I4(\exponent_reg[0]_1 ),
        .I5(Q[2]),
        .O(\mantissa[0]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \mantissa[0]_i_13 
       (.I0(Q[1]),
        .I1(\exponent_reg[0]_1 ),
        .I2(\temp_add_a_reg[15] [1]),
        .O(\mantissa[0]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \mantissa[0]_i_14 
       (.I0(Q[0]),
        .I1(\exponent_reg[0]_1 ),
        .I2(\temp_add_a_reg[15] [0]),
        .O(\mantissa_reg[0]_9 ));
  LUT6 #(
    .INIT(64'h00F0F00000E0E000)) 
    \mantissa[0]_i_15 
       (.I0(\mantissa_reg[0]_5 ),
        .I1(\mantissa_reg[0]_6 ),
        .I2(CO),
        .I3(Q[15]),
        .I4(\temp_add_a_reg[15] [15]),
        .I5(\mantissa_reg[0]_7 ),
        .O(\mantissa[0]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h0505052727052727)) 
    \mantissa[0]_i_16 
       (.I0(\exponent_reg[0]_0 ),
        .I1(\exponent[0]_i_36_n_0 ),
        .I2(\mantissa[0]_i_22_n_0 ),
        .I3(\exponent[4]_i_16_n_0 ),
        .I4(\mantissa[0]_i_23_n_0 ),
        .I5(\mantissa[0]_i_24_n_0 ),
        .O(\mantissa_reg[0]_8 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h3C002800)) 
    \mantissa[0]_i_17 
       (.I0(\mantissa_reg[0]_7 ),
        .I1(\temp_add_a_reg[15] [15]),
        .I2(Q[15]),
        .I3(CO),
        .I4(\mantissa_reg[0]_6 ),
        .O(\mantissa[0]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'h0505270505272727)) 
    \mantissa[0]_i_18 
       (.I0(\exponent_reg[0]_0 ),
        .I1(\exponent[0]_i_36_n_0 ),
        .I2(\mantissa[0]_i_25_n_0 ),
        .I3(\exponent[4]_i_16_n_0 ),
        .I4(\mantissa[0]_i_26_n_0 ),
        .I5(\mantissa[0]_i_24_n_0 ),
        .O(\mantissa_reg[0]_5 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0880)) 
    \mantissa[0]_i_19 
       (.I0(\mantissa_reg[0]_7 ),
        .I1(CO),
        .I2(Q[15]),
        .I3(\temp_add_a_reg[15] [15]),
        .O(\mantissa[0]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'h0000000011100010)) 
    \mantissa[0]_i_2 
       (.I0(\exponent[4]_i_11_n_0 ),
        .I1(sign_i_4_n_0),
        .I2(\mantissa_reg[0]_i_3_n_7 ),
        .I3(\exponent[0]_i_5_n_0 ),
        .I4(\mantissa_reg[0]_i_3_n_6 ),
        .I5(\exponent[1]_i_3_n_0 ),
        .O(\mantissa[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h015100000151FFFF)) 
    \mantissa[0]_i_20 
       (.I0(\exponent[0]_i_36_n_0 ),
        .I1(\mantissa[0]_i_26_n_0 ),
        .I2(\exponent[4]_i_16_n_0 ),
        .I3(\mantissa[0]_i_27_n_0 ),
        .I4(\exponent_reg[0]_0 ),
        .I5(\mantissa[0]_i_28_n_0 ),
        .O(\mantissa_reg[0]_6 ));
  LUT6 #(
    .INIT(64'h015100000151FFFF)) 
    \mantissa[0]_i_21 
       (.I0(\exponent[0]_i_36_n_0 ),
        .I1(\mantissa[0]_i_27_n_0 ),
        .I2(\exponent[4]_i_16_n_0 ),
        .I3(\mantissa[0]_i_29_n_0 ),
        .I4(\exponent_reg[0]_0 ),
        .I5(\mantissa[0]_i_30_n_0 ),
        .O(\mantissa_reg[0]_7 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \mantissa[0]_i_22 
       (.I0(\temp_add_a_reg[15] [3]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[3]),
        .O(\mantissa[0]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF30BBFFFF3088)) 
    \mantissa[0]_i_23 
       (.I0(\exponent[4]_i_42_n_0 ),
        .I1(\exponent[0]_i_51_n_0 ),
        .I2(\exponent[0]_i_50_n_0 ),
        .I3(\mantissa[0]_i_31_n_0 ),
        .I4(\mantissa[0]_i_32_n_0 ),
        .I5(\exponent[4]_i_46_n_0 ),
        .O(\mantissa[0]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'hB800B800B8FFB800)) 
    \mantissa[0]_i_24 
       (.I0(\mantissa[0]_i_33_n_0 ),
        .I1(\mantissa[0]_i_31_n_0 ),
        .I2(\mantissa[0]_i_34_n_0 ),
        .I3(\exponent[0]_i_51_n_0 ),
        .I4(\mantissa[0]_i_35_n_0 ),
        .I5(\mantissa[0]_i_36_n_0 ),
        .O(\mantissa[0]_i_24_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \mantissa[0]_i_25 
       (.I0(\temp_add_a_reg[15] [2]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[2]),
        .O(\mantissa[0]_i_25_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \mantissa[0]_i_26 
       (.I0(\mantissa[0]_i_37_n_0 ),
        .I1(\mantissa[0]_i_38_n_0 ),
        .I2(\exponent[0]_i_51_n_0 ),
        .I3(\mantissa[0]_i_39_n_0 ),
        .I4(\mantissa[0]_i_31_n_0 ),
        .I5(\mantissa[0]_i_40_n_0 ),
        .O(\mantissa[0]_i_26_n_0 ));
  LUT6 #(
    .INIT(64'h2F202F2F2F202020)) 
    \mantissa[0]_i_27 
       (.I0(\mantissa[0]_i_35_n_0 ),
        .I1(\mantissa[0]_i_36_n_0 ),
        .I2(\exponent[0]_i_51_n_0 ),
        .I3(\mantissa[0]_i_34_n_0 ),
        .I4(\mantissa[0]_i_31_n_0 ),
        .I5(\mantissa[0]_i_41_n_0 ),
        .O(\mantissa[0]_i_27_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \mantissa[0]_i_28 
       (.I0(\temp_add_a_reg[15] [1]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[1]),
        .O(\mantissa[0]_i_28_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \mantissa[0]_i_29 
       (.I0(\mantissa[0]_i_39_n_0 ),
        .I1(\mantissa[0]_i_40_n_0 ),
        .I2(\exponent[0]_i_51_n_0 ),
        .I3(\mantissa[0]_i_38_n_0 ),
        .I4(\mantissa[0]_i_31_n_0 ),
        .I5(\mantissa[0]_i_42_n_0 ),
        .O(\mantissa[0]_i_29_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \mantissa[0]_i_30 
       (.I0(\temp_add_a_reg[15] [0]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[0]),
        .O(\mantissa[0]_i_30_n_0 ));
  LUT6 #(
    .INIT(64'hA6AA9A5555A6AA9A)) 
    \mantissa[0]_i_31 
       (.I0(\exponent[0]_i_34_n_0 ),
        .I1(\temp_add_a_reg[15] [10]),
        .I2(Q[10]),
        .I3(\temp_add_a_reg[15] [11]),
        .I4(\exponent_reg[0]_1 ),
        .I5(Q[11]),
        .O(\mantissa[0]_i_31_n_0 ));
  LUT6 #(
    .INIT(64'h6966669699966999)) 
    \mantissa[0]_i_32 
       (.I0(Q[13]),
        .I1(\temp_add_a_reg[15] [13]),
        .I2(Q[12]),
        .I3(\exponent_reg[0]_1 ),
        .I4(\temp_add_a_reg[15] [12]),
        .I5(\exponent[0]_i_48_n_0 ),
        .O(\mantissa[0]_i_32_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFB82E47D1)) 
    \mantissa[0]_i_33 
       (.I0(\exponent[0]_i_48_n_0 ),
        .I1(\temp_add_a_reg[15] [12]),
        .I2(\exponent_reg[0]_1 ),
        .I3(Q[12]),
        .I4(\mantissa[0]_i_43_n_0 ),
        .I5(\exponent[0]_i_38_n_0 ),
        .O(\mantissa[0]_i_33_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFB82E47D1)) 
    \mantissa[0]_i_34 
       (.I0(\exponent[0]_i_48_n_0 ),
        .I1(\temp_add_a_reg[15] [12]),
        .I2(\exponent_reg[0]_1 ),
        .I3(Q[12]),
        .I4(\mantissa[0]_i_43_n_0 ),
        .I5(\exponent[4]_i_44_n_0 ),
        .O(\mantissa[0]_i_34_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFB6DFD6B)) 
    \mantissa[0]_i_35 
       (.I0(Q[12]),
        .I1(\temp_add_a_reg[15] [12]),
        .I2(\exponent[0]_i_48_n_0 ),
        .I3(\mantissa[0]_i_43_n_0 ),
        .I4(\exponent_reg[0]_1 ),
        .I5(\mantissa[0]_i_22_n_0 ),
        .O(\mantissa[0]_i_35_n_0 ));
  LUT6 #(
    .INIT(64'h1041040004411000)) 
    \mantissa[0]_i_36 
       (.I0(\exponent[4]_i_39_n_0 ),
        .I1(Q[12]),
        .I2(\temp_add_a_reg[15] [12]),
        .I3(\exponent[0]_i_48_n_0 ),
        .I4(\mantissa[0]_i_43_n_0 ),
        .I5(\exponent_reg[0]_1 ),
        .O(\mantissa[0]_i_36_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFB82E47D1)) 
    \mantissa[0]_i_37 
       (.I0(\exponent[0]_i_48_n_0 ),
        .I1(\temp_add_a_reg[15] [12]),
        .I2(\exponent_reg[0]_1 ),
        .I3(Q[12]),
        .I4(\mantissa[0]_i_43_n_0 ),
        .I5(\exponent[0]_i_50_n_0 ),
        .O(\mantissa[0]_i_37_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFB82E47D1)) 
    \mantissa[0]_i_38 
       (.I0(\exponent[0]_i_48_n_0 ),
        .I1(\temp_add_a_reg[15] [12]),
        .I2(\exponent_reg[0]_1 ),
        .I3(Q[12]),
        .I4(\mantissa[0]_i_43_n_0 ),
        .I5(\exponent[4]_i_46_n_0 ),
        .O(\mantissa[0]_i_38_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFB82E47D1)) 
    \mantissa[0]_i_39 
       (.I0(\exponent[0]_i_48_n_0 ),
        .I1(\temp_add_a_reg[15] [12]),
        .I2(\exponent_reg[0]_1 ),
        .I3(Q[12]),
        .I4(\mantissa[0]_i_43_n_0 ),
        .I5(\exponent[4]_i_42_n_0 ),
        .O(\mantissa[0]_i_39_n_0 ));
  LUT5 #(
    .INIT(32'hE2E2E21D)) 
    \mantissa[0]_i_4 
       (.I0(\temp_add_a_reg[15] [3]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[3]),
        .I3(\mantissa[0]_i_12_n_0 ),
        .I4(\exponent[0]_i_26_n_0 ),
        .O(\mantissa[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h202AA2028A8008A8)) 
    \mantissa[0]_i_40 
       (.I0(\mantissa[0]_i_25_n_0 ),
        .I1(\exponent[0]_i_48_n_0 ),
        .I2(\temp_add_a_reg[15] [12]),
        .I3(\exponent_reg[0]_1 ),
        .I4(Q[12]),
        .I5(\mantissa[0]_i_43_n_0 ),
        .O(\mantissa[0]_i_40_n_0 ));
  LUT6 #(
    .INIT(64'hEBBBEEEB28882228)) 
    \mantissa[0]_i_41 
       (.I0(\exponent[0]_i_38_n_0 ),
        .I1(\mantissa[0]_i_43_n_0 ),
        .I2(\exponent[0]_i_46_n_0 ),
        .I3(\exponent[0]_i_47_n_0 ),
        .I4(\exponent[0]_i_48_n_0 ),
        .I5(\mantissa[0]_i_28_n_0 ),
        .O(\mantissa[0]_i_41_n_0 ));
  LUT6 #(
    .INIT(64'hEBBBEEEB28882228)) 
    \mantissa[0]_i_42 
       (.I0(\exponent[0]_i_50_n_0 ),
        .I1(\mantissa[0]_i_43_n_0 ),
        .I2(\exponent[0]_i_46_n_0 ),
        .I3(\exponent[0]_i_47_n_0 ),
        .I4(\exponent[0]_i_48_n_0 ),
        .I5(\mantissa[0]_i_30_n_0 ),
        .O(\mantissa[0]_i_42_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \mantissa[0]_i_43 
       (.I0(\temp_add_a_reg[15] [13]),
        .I1(Q[13]),
        .O(\mantissa[0]_i_43_n_0 ));
  LUT6 #(
    .INIT(64'hE2E2E2E2E21D1D1D)) 
    \mantissa[0]_i_5 
       (.I0(\temp_add_a_reg[15] [2]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[2]),
        .I3(\mantissa[0]_i_13_n_0 ),
        .I4(\mantissa_reg[0]_9 ),
        .I5(\exponent[0]_i_26_n_0 ),
        .O(\mantissa[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hC3CCA5A5C3CCAAAA)) 
    \mantissa[0]_i_6 
       (.I0(\temp_add_a_reg[15] [1]),
        .I1(Q[1]),
        .I2(\exponent[0]_i_26_n_0 ),
        .I3(Q[0]),
        .I4(\exponent_reg[0]_1 ),
        .I5(\temp_add_a_reg[15] [0]),
        .O(\mantissa[0]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hE2)) 
    \mantissa[0]_i_7 
       (.I0(\temp_add_a_reg[15] [0]),
        .I1(\exponent_reg[0]_1 ),
        .I2(Q[0]),
        .O(\mantissa[0]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \mantissa[0]_i_8 
       (.I0(\mantissa[0]_i_4_n_0 ),
        .I1(\mantissa[0]_i_15_n_0 ),
        .I2(\mantissa_reg[0]_8 ),
        .O(\mantissa[0]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \mantissa[0]_i_9 
       (.I0(\mantissa[0]_i_5_n_0 ),
        .I1(\mantissa[0]_i_17_n_0 ),
        .I2(\mantissa_reg[0]_5 ),
        .O(\mantissa[0]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \mantissa[1]_i_1 
       (.I0(Q[1]),
        .I1(sign_i_5_n_0),
        .I2(\temp_add_a_reg[15] [1]),
        .I3(sign_i_3_n_0),
        .I4(\mantissa[1]_i_2_n_0 ),
        .O(\mantissa[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000B08)) 
    \mantissa[1]_i_2 
       (.I0(\mantissa[2]_i_3_n_0 ),
        .I1(\exponent[0]_i_2_n_0 ),
        .I2(\exponent[4]_i_11_n_0 ),
        .I3(\exponent[1]_i_5_n_0 ),
        .I4(\exponent[1]_i_3_n_0 ),
        .O(\mantissa[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \mantissa[2]_i_1 
       (.I0(Q[2]),
        .I1(sign_i_5_n_0),
        .I2(\temp_add_a_reg[15] [2]),
        .I3(sign_i_3_n_0),
        .I4(\mantissa[2]_i_2_n_0 ),
        .O(\mantissa[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000030BB3088)) 
    \mantissa[2]_i_2 
       (.I0(\exponent[1]_i_5_n_0 ),
        .I1(\exponent[0]_i_2_n_0 ),
        .I2(\mantissa[2]_i_3_n_0 ),
        .I3(\exponent[1]_i_3_n_0 ),
        .I4(\exponent[1]_i_6_n_0 ),
        .I5(\exponent[4]_i_11_n_0 ),
        .O(\mantissa[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h5445444404404444)) 
    \mantissa[2]_i_3 
       (.I0(sign_i_4_n_0),
        .I1(\mantissa_reg[0]_i_3_n_7 ),
        .I2(Q[15]),
        .I3(\temp_add_a_reg[15] [15]),
        .I4(\exponent_reg[0]_i_4_n_0 ),
        .I5(\mantissa_reg[0]_i_3_n_6 ),
        .O(\mantissa[2]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \mantissa[3]_i_1 
       (.I0(Q[3]),
        .I1(sign_i_5_n_0),
        .I2(\temp_add_a_reg[15] [3]),
        .I3(sign_i_3_n_0),
        .I4(\mantissa[3]_i_2_n_0 ),
        .O(\mantissa[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88888888B8BBB888)) 
    \mantissa[3]_i_2 
       (.I0(\mantissa[3]_i_3_n_0 ),
        .I1(\exponent[0]_i_2_n_0 ),
        .I2(\exponent[1]_i_5_n_0 ),
        .I3(\exponent[1]_i_3_n_0 ),
        .I4(\mantissa[4]_i_3_n_0 ),
        .I5(\exponent[4]_i_11_n_0 ),
        .O(\mantissa[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \mantissa[3]_i_3 
       (.I0(\mantissa[2]_i_3_n_0 ),
        .I1(\exponent[1]_i_3_n_0 ),
        .I2(\exponent[1]_i_6_n_0 ),
        .I3(\exponent[4]_i_11_n_0 ),
        .O(\mantissa[3]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \mantissa[4]_i_1 
       (.I0(Q[4]),
        .I1(sign_i_5_n_0),
        .I2(\temp_add_a_reg[15] [4]),
        .I3(sign_i_3_n_0),
        .I4(\mantissa[4]_i_2_n_0 ),
        .O(\mantissa[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00B8FFFF00B80000)) 
    \mantissa[4]_i_2 
       (.I0(\exponent[1]_i_5_n_0 ),
        .I1(\exponent[1]_i_3_n_0 ),
        .I2(\mantissa[4]_i_3_n_0 ),
        .I3(\exponent[4]_i_11_n_0 ),
        .I4(\exponent[0]_i_2_n_0 ),
        .I5(\mantissa[5]_i_3_n_0 ),
        .O(\mantissa[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EBAA28AA)) 
    \mantissa[4]_i_3 
       (.I0(\mantissa_reg[0]_i_3_n_4 ),
        .I1(Q[15]),
        .I2(\temp_add_a_reg[15] [15]),
        .I3(\exponent_reg[0]_i_4_n_0 ),
        .I4(\exponent_reg[4]_i_15_n_7 ),
        .I5(sign_i_4_n_0),
        .O(\mantissa[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mantissa[5]_i_1 
       (.I0(Q[5]),
        .I1(sign_i_5_n_0),
        .I2(\mantissa[5]_i_2_n_0 ),
        .O(\mantissa[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \mantissa[5]_i_2 
       (.I0(\temp_add_a_reg[15] [5]),
        .I1(sign_i_3_n_0),
        .I2(\mantissa[5]_i_3_n_0 ),
        .I3(\exponent[0]_i_2_n_0 ),
        .I4(\mantissa[6]_i_3_n_0 ),
        .O(\mantissa[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h2F20)) 
    \mantissa[5]_i_3 
       (.I0(\exponent[1]_i_6_n_0 ),
        .I1(\exponent[4]_i_11_n_0 ),
        .I2(\exponent[1]_i_3_n_0 ),
        .I3(\mantissa[5]_i_4_n_0 ),
        .O(\mantissa[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h5404FFFF54040000)) 
    \mantissa[5]_i_4 
       (.I0(sign_i_4_n_0),
        .I1(\mantissa_reg[0]_i_3_n_7 ),
        .I2(\exponent[0]_i_5_n_0 ),
        .I3(\mantissa_reg[0]_i_3_n_6 ),
        .I4(\exponent[3]_i_4_n_0 ),
        .I5(\exponent[0]_i_17_n_0 ),
        .O(\mantissa[5]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mantissa[6]_i_1 
       (.I0(Q[6]),
        .I1(sign_i_5_n_0),
        .I2(\mantissa[6]_i_2_n_0 ),
        .O(\mantissa[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \mantissa[6]_i_2 
       (.I0(\temp_add_a_reg[15] [6]),
        .I1(sign_i_3_n_0),
        .I2(\mantissa[6]_i_3_n_0 ),
        .I3(\exponent[0]_i_2_n_0 ),
        .I4(\mantissa[7]_i_3_n_0 ),
        .O(\mantissa[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h2F202F2F2F202020)) 
    \mantissa[6]_i_3 
       (.I0(\mantissa[4]_i_3_n_0 ),
        .I1(\exponent[4]_i_11_n_0 ),
        .I2(\exponent[1]_i_3_n_0 ),
        .I3(\exponent[1]_i_5_n_0 ),
        .I4(\exponent[3]_i_4_n_0 ),
        .I5(\exponent[0]_i_15_n_0 ),
        .O(\mantissa[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mantissa[7]_i_1 
       (.I0(Q[7]),
        .I1(sign_i_5_n_0),
        .I2(\mantissa[7]_i_2_n_0 ),
        .O(\mantissa[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \mantissa[7]_i_2 
       (.I0(\temp_add_a_reg[15] [7]),
        .I1(sign_i_3_n_0),
        .I2(\mantissa[7]_i_3_n_0 ),
        .I3(\exponent[0]_i_2_n_0 ),
        .I4(\mantissa[8]_i_3_n_0 ),
        .O(\mantissa[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \mantissa[7]_i_3 
       (.I0(\mantissa[2]_i_3_n_0 ),
        .I1(\exponent[0]_i_17_n_0 ),
        .I2(\exponent[1]_i_3_n_0 ),
        .I3(\exponent[1]_i_6_n_0 ),
        .I4(\exponent[3]_i_4_n_0 ),
        .I5(\exponent[0]_i_18_n_0 ),
        .O(\mantissa[7]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \mantissa[8]_i_1 
       (.I0(Q[8]),
        .I1(sign_i_5_n_0),
        .I2(\mantissa[8]_i_2_n_0 ),
        .O(\mantissa[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \mantissa[8]_i_2 
       (.I0(\temp_add_a_reg[15] [8]),
        .I1(sign_i_3_n_0),
        .I2(\mantissa[8]_i_3_n_0 ),
        .I3(\exponent[0]_i_2_n_0 ),
        .I4(\mantissa[9]_i_5_n_0 ),
        .O(\mantissa[8]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hCFC05555)) 
    \mantissa[8]_i_3 
       (.I0(\mantissa[9]_i_3_n_0 ),
        .I1(\exponent[1]_i_5_n_0 ),
        .I2(\exponent[3]_i_4_n_0 ),
        .I3(\exponent[0]_i_15_n_0 ),
        .I4(\exponent[1]_i_3_n_0 ),
        .O(\mantissa[8]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BB8888)) 
    \mantissa[9]_i_1 
       (.I0(Q[9]),
        .I1(sign_i_5_n_0),
        .I2(\temp_add_a_reg[15] [9]),
        .I3(sign_i_3_n_0),
        .I4(\mantissa[9]_i_2_n_0 ),
        .O(\mantissa[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFF4F004F)) 
    \mantissa[9]_i_2 
       (.I0(\mantissa[9]_i_3_n_0 ),
        .I1(\exponent[1]_i_3_n_0 ),
        .I2(\mantissa[9]_i_4_n_0 ),
        .I3(\exponent[0]_i_2_n_0 ),
        .I4(\mantissa[9]_i_5_n_0 ),
        .I5(sign_i_3_n_0),
        .O(\mantissa[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000BABFBABFBABF)) 
    \mantissa[9]_i_3 
       (.I0(sign_i_4_n_0),
        .I1(\exponent_reg[0]_i_4_n_7 ),
        .I2(\exponent[0]_i_5_n_0 ),
        .I3(\exponent_reg[4]_i_15_n_4 ),
        .I4(\exponent[4]_i_11_n_0 ),
        .I5(\mantissa[4]_i_3_n_0 ),
        .O(\mantissa[9]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h44444777)) 
    \mantissa[9]_i_4 
       (.I0(\exponent[0]_i_15_n_0 ),
        .I1(\exponent[3]_i_4_n_0 ),
        .I2(\exponent[4]_i_11_n_0 ),
        .I3(\exponent[1]_i_5_n_0 ),
        .I4(\mantissa[9]_i_6_n_0 ),
        .O(\mantissa[9]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0C0C0AFA0CFCF)) 
    \mantissa[9]_i_5 
       (.I0(\exponent[1]_i_6_n_0 ),
        .I1(\exponent[0]_i_18_n_0 ),
        .I2(\exponent[1]_i_3_n_0 ),
        .I3(\exponent[0]_i_17_n_0 ),
        .I4(\exponent[3]_i_4_n_0 ),
        .I5(\mantissa[9]_i_7_n_0 ),
        .O(\mantissa[9]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h5445444404404444)) 
    \mantissa[9]_i_6 
       (.I0(sign_i_4_n_0),
        .I1(\exponent_reg[0]_i_4_n_6 ),
        .I2(Q[15]),
        .I3(\temp_add_a_reg[15] [15]),
        .I4(\exponent_reg[0]_i_4_n_0 ),
        .I5(\exponent_reg[0]_i_4_n_5 ),
        .O(\mantissa[9]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000BABFBABFBABF)) 
    \mantissa[9]_i_7 
       (.I0(sign_i_4_n_0),
        .I1(\exponent_reg[0]_i_4_n_6 ),
        .I2(\exponent[0]_i_5_n_0 ),
        .I3(\exponent_reg[0]_i_4_n_7 ),
        .I4(\mantissa[2]_i_3_n_0 ),
        .I5(\exponent[4]_i_11_n_0 ),
        .O(\mantissa[9]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \mantissa_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\mantissa[0]_i_1_n_0 ),
        .Q(output_tmp_add[0]),
        .R(1'b0));
  CARRY4 \mantissa_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\mantissa_reg[0]_i_3_n_0 ,\mantissa_reg[0]_i_3_n_1 ,\mantissa_reg[0]_i_3_n_2 ,\mantissa_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({\mantissa[0]_i_4_n_0 ,\mantissa[0]_i_5_n_0 ,\mantissa[0]_i_6_n_0 ,\mantissa[0]_i_7_n_0 }),
        .O({\mantissa_reg[0]_i_3_n_4 ,\mantissa_reg[0]_i_3_n_5 ,\mantissa_reg[0]_i_3_n_6 ,\mantissa_reg[0]_i_3_n_7 }),
        .S({\mantissa[0]_i_8_n_0 ,\mantissa[0]_i_9_n_0 ,\mantissa[0]_i_10_n_0 ,\mantissa[0]_i_11_n_0 }));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \mantissa_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\mantissa[1]_i_1_n_0 ),
        .Q(output_tmp_add[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \mantissa_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\mantissa[2]_i_1_n_0 ),
        .Q(\output_tanh_reg[14] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \mantissa_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\mantissa[3]_i_1_n_0 ),
        .Q(\output_tanh_reg[14] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \mantissa_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\mantissa[4]_i_1_n_0 ),
        .Q(output_tmp_add[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \mantissa_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\mantissa[5]_i_1_n_0 ),
        .Q(output_tmp_add[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \mantissa_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\mantissa[6]_i_1_n_0 ),
        .Q(\output_tanh_reg[14] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \mantissa_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\mantissa[7]_i_1_n_0 ),
        .Q(\output_tanh_reg[14] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \mantissa_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\mantissa[8]_i_1_n_0 ),
        .Q(output_tmp_add[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \mantissa_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\mantissa[9]_i_1_n_0 ),
        .Q(output_tmp_add[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \output_tanh[0]_i_1 
       (.I0(output_tmp_add[0]),
        .I1(input_x_IBUF[0]),
        .O(\output_tanh_reg[0] ));
  LUT5 #(
    .INIT(32'hF8FFF800)) 
    \output_tanh[10]_i_1 
       (.I0(output_tmp_add[10]),
        .I1(\input_x[12] ),
        .I2(input_x_IBUF[0]),
        .I3(reset),
        .I4(output_tanh_OBUF[0]),
        .O(\output_tanh_reg[10] ));
  LUT4 #(
    .INIT(16'hFFE2)) 
    \output_tanh[11]_i_1 
       (.I0(output_tanh_OBUF[1]),
        .I1(reset),
        .I2(output_tmp_add[11]),
        .I3(reset_0),
        .O(\output_tanh_reg[11] ));
  LUT4 #(
    .INIT(16'hFFE2)) 
    \output_tanh[12]_i_1 
       (.I0(output_tanh_OBUF[2]),
        .I1(reset),
        .I2(output_tmp_add[12]),
        .I3(reset_0),
        .O(\output_tanh_reg[12] ));
  LUT4 #(
    .INIT(16'hFFE2)) 
    \output_tanh[13]_i_1 
       (.I0(output_tanh_OBUF[3]),
        .I1(reset),
        .I2(output_tmp_add[13]),
        .I3(reset_0),
        .O(\output_tanh_reg[13] ));
  LUT6 #(
    .INIT(64'hBA8AFFFFBA8A0000)) 
    \output_tanh[15]_i_1 
       (.I0(input_x_IBUF[1]),
        .I1(input_x_IBUF[0]),
        .I2(\input_x[12] ),
        .I3(output_tmp_add[15]),
        .I4(reset),
        .I5(output_tanh_OBUF[4]),
        .O(\output_tanh_reg[15] ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \output_tanh[1]_i_1 
       (.I0(output_tmp_add[1]),
        .I1(input_x_IBUF[0]),
        .O(\output_tanh_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \output_tanh[4]_i_1 
       (.I0(output_tmp_add[4]),
        .I1(input_x_IBUF[0]),
        .O(\output_tanh_reg[4] ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \output_tanh[5]_i_1 
       (.I0(output_tmp_add[5]),
        .I1(input_x_IBUF[0]),
        .O(\output_tanh_reg[5] ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \output_tanh[8]_i_1 
       (.I0(output_tmp_add[8]),
        .I1(input_x_IBUF[0]),
        .O(\output_tanh_reg[8] ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \output_tanh[9]_i_2 
       (.I0(output_tmp_add[9]),
        .I1(input_x_IBUF[0]),
        .O(\output_tanh_reg[9] ));
  LUT6 #(
    .INIT(64'hFFFF0000A0AEA0A2)) 
    sign_i_1
       (.I0(\temp_add_a_reg[15] [15]),
        .I1(sign_reg_i_2_n_0),
        .I2(sign_i_3_n_0),
        .I3(sign_i_4_n_0),
        .I4(Q[15]),
        .I5(sign_i_5_n_0),
        .O(sign_i_1_n_0));
  LUT4 #(
    .INIT(16'h2B22)) 
    sign_i_10
       (.I0(Q[9]),
        .I1(\temp_add_a_reg[15] [9]),
        .I2(\temp_add_a_reg[15] [8]),
        .I3(Q[8]),
        .O(sign_i_10_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    sign_i_11
       (.I0(\temp_add_a_reg[15] [14]),
        .I1(Q[14]),
        .O(sign_i_11_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sign_i_12
       (.I0(\temp_add_a_reg[15] [12]),
        .I1(Q[12]),
        .I2(\temp_add_a_reg[15] [13]),
        .I3(Q[13]),
        .O(sign_i_12_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sign_i_13
       (.I0(\temp_add_a_reg[15] [10]),
        .I1(Q[10]),
        .I2(Q[11]),
        .I3(\temp_add_a_reg[15] [11]),
        .O(sign_i_13_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sign_i_14
       (.I0(Q[8]),
        .I1(\temp_add_a_reg[15] [8]),
        .I2(\temp_add_a_reg[15] [9]),
        .I3(Q[9]),
        .O(sign_i_14_n_0));
  LUT4 #(
    .INIT(16'hFFF4)) 
    sign_i_15
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[12]),
        .I3(Q[7]),
        .O(sign_i_15_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    sign_i_16
       (.I0(Q[2]),
        .I1(Q[5]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(sign_i_32_n_0),
        .O(sign_i_16_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    sign_i_17
       (.I0(Q[13]),
        .I1(\temp_add_a_reg[15] [13]),
        .I2(Q[12]),
        .I3(\temp_add_a_reg[15] [12]),
        .O(sign_i_17_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    sign_i_18
       (.I0(\temp_add_a_reg[15] [10]),
        .I1(Q[10]),
        .I2(Q[11]),
        .I3(\temp_add_a_reg[15] [11]),
        .O(sign_i_18_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    sign_i_20
       (.I0(Q[15]),
        .I1(\temp_add_a_reg[15] [15]),
        .O(sign_i_20_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    sign_i_21
       (.I0(\temp_add_a_reg[15] [7]),
        .I1(\temp_add_a_reg[15] [1]),
        .I2(\temp_add_a_reg[15] [11]),
        .I3(\temp_add_a_reg[15] [8]),
        .O(sign_i_21_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    sign_i_22
       (.I0(\temp_add_a_reg[15] [12]),
        .I1(\temp_add_a_reg[15] [13]),
        .I2(\temp_add_a_reg[15] [10]),
        .I3(\temp_add_a_reg[15] [5]),
        .O(sign_i_22_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    sign_i_23
       (.I0(\temp_add_a_reg[15] [14]),
        .I1(\temp_add_a_reg[15] [2]),
        .I2(\temp_add_a_reg[15] [9]),
        .I3(\temp_add_a_reg[15] [4]),
        .O(sign_i_23_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    sign_i_24
       (.I0(\temp_add_a_reg[15] [7]),
        .I1(Q[7]),
        .I2(Q[6]),
        .I3(\temp_add_a_reg[15] [6]),
        .O(sign_i_24_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    sign_i_25
       (.I0(\temp_add_a_reg[15] [5]),
        .I1(Q[5]),
        .I2(Q[4]),
        .I3(\temp_add_a_reg[15] [4]),
        .O(sign_i_25_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    sign_i_26
       (.I0(\temp_add_a_reg[15] [3]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(\temp_add_a_reg[15] [2]),
        .O(sign_i_26_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    sign_i_27
       (.I0(\temp_add_a_reg[15] [1]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(\temp_add_a_reg[15] [0]),
        .O(sign_i_27_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sign_i_28
       (.I0(Q[7]),
        .I1(\temp_add_a_reg[15] [7]),
        .I2(Q[6]),
        .I3(\temp_add_a_reg[15] [6]),
        .O(sign_i_28_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sign_i_29
       (.I0(Q[5]),
        .I1(\temp_add_a_reg[15] [5]),
        .I2(Q[4]),
        .I3(\temp_add_a_reg[15] [4]),
        .O(sign_i_29_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    sign_i_3
       (.I0(sign_i_15_n_0),
        .I1(Q[14]),
        .I2(Q[8]),
        .I3(Q[11]),
        .I4(Q[10]),
        .I5(sign_i_16_n_0),
        .O(sign_i_3_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sign_i_30
       (.I0(Q[2]),
        .I1(\temp_add_a_reg[15] [2]),
        .I2(Q[3]),
        .I3(\temp_add_a_reg[15] [3]),
        .O(sign_i_30_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sign_i_31
       (.I0(Q[1]),
        .I1(\temp_add_a_reg[15] [1]),
        .I2(Q[0]),
        .I3(\temp_add_a_reg[15] [0]),
        .O(sign_i_31_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    sign_i_32
       (.I0(Q[4]),
        .I1(Q[9]),
        .I2(Q[13]),
        .I3(Q[6]),
        .O(sign_i_32_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    sign_i_33
       (.I0(\temp_add_a_reg[15] [9]),
        .I1(Q[9]),
        .O(sign_i_33_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    sign_i_34
       (.I0(Q[8]),
        .I1(\temp_add_a_reg[15] [8]),
        .I2(\temp_add_a_reg[15] [6]),
        .I3(Q[6]),
        .I4(\temp_add_a_reg[15] [7]),
        .I5(Q[7]),
        .O(sign_i_34_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    sign_i_35
       (.I0(\temp_add_a_reg[15] [4]),
        .I1(Q[4]),
        .I2(\temp_add_a_reg[15] [5]),
        .I3(Q[5]),
        .I4(Q[3]),
        .I5(\temp_add_a_reg[15] [3]),
        .O(sign_i_35_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    sign_i_36
       (.I0(Q[2]),
        .I1(\temp_add_a_reg[15] [2]),
        .I2(\temp_add_a_reg[15] [0]),
        .I3(Q[0]),
        .I4(\temp_add_a_reg[15] [1]),
        .I5(Q[1]),
        .O(sign_i_36_n_0));
  LUT6 #(
    .INIT(64'h0000000040000040)) 
    sign_i_4
       (.I0(sign_i_17_n_0),
        .I1(sign_i_18_n_0),
        .I2(sign35_in),
        .I3(Q[14]),
        .I4(\temp_add_a_reg[15] [14]),
        .I5(sign_i_20_n_0),
        .O(sign_i_4_n_0));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    sign_i_5
       (.I0(sign_i_21_n_0),
        .I1(sign_i_22_n_0),
        .I2(sign_i_23_n_0),
        .I3(\temp_add_a_reg[15] [0]),
        .I4(\temp_add_a_reg[15] [6]),
        .I5(\temp_add_a_reg[15] [3]),
        .O(sign_i_5_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    sign_i_7
       (.I0(Q[14]),
        .I1(\temp_add_a_reg[15] [14]),
        .O(sign_i_7_n_0));
  LUT4 #(
    .INIT(16'h40F4)) 
    sign_i_8
       (.I0(\temp_add_a_reg[15] [12]),
        .I1(Q[12]),
        .I2(Q[13]),
        .I3(\temp_add_a_reg[15] [13]),
        .O(sign_i_8_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    sign_i_9
       (.I0(\temp_add_a_reg[15] [11]),
        .I1(Q[11]),
        .I2(Q[10]),
        .I3(\temp_add_a_reg[15] [10]),
        .O(sign_i_9_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    sign_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(sign_i_1_n_0),
        .Q(output_tmp_add[15]),
        .R(1'b0));
  CARRY4 sign_reg_i_19
       (.CI(1'b0),
        .CO({sign35_in,sign_reg_i_19_n_1,sign_reg_i_19_n_2,sign_reg_i_19_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_sign_reg_i_19_O_UNCONNECTED[3:0]),
        .S({sign_i_33_n_0,sign_i_34_n_0,sign_i_35_n_0,sign_i_36_n_0}));
  CARRY4 sign_reg_i_2
       (.CI(sign_reg_i_6_n_0),
        .CO({sign_reg_i_2_n_0,sign_reg_i_2_n_1,sign_reg_i_2_n_2,sign_reg_i_2_n_3}),
        .CYINIT(1'b0),
        .DI({sign_i_7_n_0,sign_i_8_n_0,sign_i_9_n_0,sign_i_10_n_0}),
        .O(NLW_sign_reg_i_2_O_UNCONNECTED[3:0]),
        .S({sign_i_11_n_0,sign_i_12_n_0,sign_i_13_n_0,sign_i_14_n_0}));
  CARRY4 sign_reg_i_6
       (.CI(1'b0),
        .CO({sign_reg_i_6_n_0,sign_reg_i_6_n_1,sign_reg_i_6_n_2,sign_reg_i_6_n_3}),
        .CYINIT(1'b0),
        .DI({sign_i_24_n_0,sign_i_25_n_0,sign_i_26_n_0,sign_i_27_n_0}),
        .O(NLW_sign_reg_i_6_O_UNCONNECTED[3:0]),
        .S({sign_i_28_n_0,sign_i_29_n_0,sign_i_30_n_0,sign_i_31_n_0}));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \temp_add_a[0]_i_1 
       (.I0(UNCONN_IN[0]),
        .I1(UNCONN_IN[2]),
        .I2(UNCONN_IN[4]),
        .I3(UNCONN_IN[3]),
        .I4(UNCONN_IN[1]),
        .I5(output_tmp_add[0]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \temp_add_a[10]_i_1 
       (.I0(UNCONN_IN[0]),
        .I1(UNCONN_IN[2]),
        .I2(UNCONN_IN[4]),
        .I3(UNCONN_IN[3]),
        .I4(UNCONN_IN[1]),
        .I5(output_tmp_add[10]),
        .O(D[10]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \temp_add_a[11]_i_1 
       (.I0(UNCONN_IN[0]),
        .I1(UNCONN_IN[2]),
        .I2(UNCONN_IN[4]),
        .I3(UNCONN_IN[3]),
        .I4(UNCONN_IN[1]),
        .I5(output_tmp_add[11]),
        .O(D[11]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \temp_add_a[12]_i_1 
       (.I0(UNCONN_IN[0]),
        .I1(UNCONN_IN[2]),
        .I2(UNCONN_IN[4]),
        .I3(UNCONN_IN[3]),
        .I4(UNCONN_IN[1]),
        .I5(output_tmp_add[12]),
        .O(D[12]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \temp_add_a[13]_i_1 
       (.I0(UNCONN_IN[0]),
        .I1(UNCONN_IN[2]),
        .I2(UNCONN_IN[4]),
        .I3(UNCONN_IN[3]),
        .I4(UNCONN_IN[1]),
        .I5(output_tmp_add[13]),
        .O(D[13]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \temp_add_a[14]_i_1 
       (.I0(UNCONN_IN[0]),
        .I1(UNCONN_IN[2]),
        .I2(UNCONN_IN[4]),
        .I3(UNCONN_IN[3]),
        .I4(UNCONN_IN[1]),
        .I5(\output_tanh_reg[14] [4]),
        .O(D[14]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \temp_add_a[15]_i_3 
       (.I0(UNCONN_IN[0]),
        .I1(UNCONN_IN[2]),
        .I2(UNCONN_IN[4]),
        .I3(UNCONN_IN[3]),
        .I4(UNCONN_IN[1]),
        .I5(output_tmp_add[15]),
        .O(D[15]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \temp_add_a[1]_i_1 
       (.I0(UNCONN_IN[0]),
        .I1(UNCONN_IN[2]),
        .I2(UNCONN_IN[4]),
        .I3(UNCONN_IN[3]),
        .I4(UNCONN_IN[1]),
        .I5(output_tmp_add[1]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \temp_add_a[2]_i_1 
       (.I0(UNCONN_IN[0]),
        .I1(UNCONN_IN[2]),
        .I2(UNCONN_IN[4]),
        .I3(UNCONN_IN[3]),
        .I4(UNCONN_IN[1]),
        .I5(\output_tanh_reg[14] [0]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \temp_add_a[3]_i_1 
       (.I0(UNCONN_IN[0]),
        .I1(UNCONN_IN[2]),
        .I2(UNCONN_IN[4]),
        .I3(UNCONN_IN[3]),
        .I4(UNCONN_IN[1]),
        .I5(\output_tanh_reg[14] [1]),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \temp_add_a[4]_i_1 
       (.I0(UNCONN_IN[0]),
        .I1(UNCONN_IN[2]),
        .I2(UNCONN_IN[4]),
        .I3(UNCONN_IN[3]),
        .I4(UNCONN_IN[1]),
        .I5(output_tmp_add[4]),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \temp_add_a[5]_i_1 
       (.I0(UNCONN_IN[0]),
        .I1(UNCONN_IN[2]),
        .I2(UNCONN_IN[4]),
        .I3(UNCONN_IN[3]),
        .I4(UNCONN_IN[1]),
        .I5(output_tmp_add[5]),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \temp_add_a[6]_i_1 
       (.I0(UNCONN_IN[0]),
        .I1(UNCONN_IN[2]),
        .I2(UNCONN_IN[4]),
        .I3(UNCONN_IN[3]),
        .I4(UNCONN_IN[1]),
        .I5(\output_tanh_reg[14] [2]),
        .O(D[6]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \temp_add_a[7]_i_1 
       (.I0(UNCONN_IN[0]),
        .I1(UNCONN_IN[2]),
        .I2(UNCONN_IN[4]),
        .I3(UNCONN_IN[3]),
        .I4(UNCONN_IN[1]),
        .I5(\output_tanh_reg[14] [3]),
        .O(D[7]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \temp_add_a[8]_i_1 
       (.I0(UNCONN_IN[0]),
        .I1(UNCONN_IN[2]),
        .I2(UNCONN_IN[4]),
        .I3(UNCONN_IN[3]),
        .I4(UNCONN_IN[1]),
        .I5(output_tmp_add[8]),
        .O(D[8]));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \temp_add_a[9]_i_1 
       (.I0(UNCONN_IN[0]),
        .I1(UNCONN_IN[2]),
        .I2(UNCONN_IN[4]),
        .I3(UNCONN_IN[3]),
        .I4(UNCONN_IN[1]),
        .I5(output_tmp_add[9]),
        .O(D[9]));
endmodule

(* DATA_WIDTH = "16" *) (* EXPONENT_WIDTH = "5" *) (* MANTISSA_WIDTH = "10" *) 
(* NotValidForBitStream *)
module tanh
   (input_x,
    clk,
    reset,
    output_tanh);
  input [15:0]input_x;
  input clk;
  input reset;
  output [15:0]output_tanh;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire \exponent[0]_i_41_n_0 ;
  wire \exponent[0]_i_43_n_0 ;
  wire \exponent[0]_i_52_n_0 ;
  wire \exponent[0]_i_53_n_0 ;
  wire \exponent[0]_i_54_n_0 ;
  wire \exponent[0]_i_55_n_0 ;
  wire \exponent[0]_i_56_n_0 ;
  wire \exponent[0]_i_57_n_0 ;
  wire \exponent[0]_i_58_n_0 ;
  wire \exponent[0]_i_59_n_0 ;
  wire \exponent[0]_i_60_n_0 ;
  wire \exponent[0]_i_61_n_0 ;
  wire \exponent[0]_i_62_n_0 ;
  wire \exponent[0]_i_63_n_0 ;
  wire \exponent[0]_i_64_n_0 ;
  wire \exponent[0]_i_65_n_0 ;
  wire \exponent[0]_i_66_n_0 ;
  wire \exponent[0]_i_67_n_0 ;
  wire \exponent[0]_i_68_n_0 ;
  wire \exponent_reg[0]_i_35_n_3 ;
  wire \exponent_reg[0]_i_40_n_0 ;
  wire \exponent_reg[0]_i_40_n_1 ;
  wire \exponent_reg[0]_i_40_n_2 ;
  wire \exponent_reg[0]_i_40_n_3 ;
  wire fadd_n_10;
  wire fadd_n_11;
  wire fadd_n_12;
  wire fadd_n_13;
  wire fadd_n_14;
  wire fadd_n_15;
  wire fadd_n_16;
  wire fadd_n_17;
  wire fadd_n_18;
  wire fadd_n_19;
  wire fadd_n_20;
  wire fadd_n_21;
  wire fadd_n_22;
  wire fadd_n_23;
  wire fadd_n_24;
  wire fadd_n_25;
  wire fadd_n_26;
  wire fadd_n_27;
  wire fadd_n_28;
  wire fadd_n_29;
  wire fadd_n_30;
  wire fadd_n_31;
  wire fadd_n_32;
  wire fadd_n_33;
  wire fadd_n_34;
  wire fadd_n_35;
  wire fadd_n_36;
  wire fadd_n_37;
  wire fadd_n_38;
  wire fadd_n_39;
  wire fadd_n_40;
  wire fadd_n_41;
  wire fadd_n_42;
  wire fadd_n_43;
  wire fadd_n_44;
  wire fadd_n_5;
  wire fadd_n_6;
  wire fadd_n_7;
  wire fadd_n_8;
  wire fadd_n_9;
  wire [4:0]i;
  wire \i[0]_i_1_n_0 ;
  wire \i[1]_i_1_n_0 ;
  wire \i[2]_i_1_n_0 ;
  wire \i[3]_i_1_n_0 ;
  wire \i[4]_i_1_n_0 ;
  wire \i[4]_i_2_n_0 ;
  wire [10:10]in;
  wire [15:0]input_x;
  wire [15:0]input_x_IBUF;
  wire [15:0]output_tanh;
  wire \output_tanh[14]_i_1_n_0 ;
  wire \output_tanh[14]_i_2_n_0 ;
  wire \output_tanh[15]_i_2_n_0 ;
  wire \output_tanh[9]_i_1_n_0 ;
  wire [15:0]output_tanh_OBUF;
  wire [14:2]output_tmp_add;
  wire reset;
  wire reset_IBUF;
  wire sel;
  wire [15:0]temp_add_a;
  wire \temp_add_a[15]_i_1_n_0 ;
  wire \temp_add_a[15]_i_2_n_0 ;
  wire [15:0]temp_add_b;
  wire \temp_add_b[0]_i_1_n_0 ;
  wire \temp_add_b[10]_i_1_n_0 ;
  wire \temp_add_b[11]_i_1_n_0 ;
  wire \temp_add_b[12]_i_1_n_0 ;
  wire \temp_add_b[13]_i_1_n_0 ;
  wire \temp_add_b[14]_i_1_n_0 ;
  wire \temp_add_b[15]_i_1_n_0 ;
  wire \temp_add_b[1]_i_1_n_0 ;
  wire \temp_add_b[2]_i_1_n_0 ;
  wire \temp_add_b[3]_i_1_n_0 ;
  wire \temp_add_b[4]_i_1_n_0 ;
  wire \temp_add_b[5]_i_1_n_0 ;
  wire \temp_add_b[6]_i_1_n_0 ;
  wire \temp_add_b[7]_i_1_n_0 ;
  wire \temp_add_b[8]_i_1_n_0 ;
  wire \temp_add_b[9]_i_1_n_0 ;
  wire [3:2]\NLW_exponent_reg[0]_i_35_CO_UNCONNECTED ;
  wire [3:0]\NLW_exponent_reg[0]_i_35_O_UNCONNECTED ;
  wire [3:0]\NLW_exponent_reg[0]_i_40_O_UNCONNECTED ;

initial begin
 $sdf_annotate("tanh_tb_time_synth.sdf",,,,"tool_control");
end
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  LUT6 #(
    .INIT(64'h22222222BBB222B2)) 
    \exponent[0]_i_41 
       (.I0(fadd_n_44),
        .I1(\exponent[0]_i_60_n_0 ),
        .I2(temp_add_a[8]),
        .I3(fadd_n_11),
        .I4(temp_add_b[8]),
        .I5(fadd_n_15),
        .O(\exponent[0]_i_41_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \exponent[0]_i_42 
       (.I0(fadd_n_10),
        .O(in));
  LUT6 #(
    .INIT(64'h000047B847B80000)) 
    \exponent[0]_i_43 
       (.I0(temp_add_b[9]),
        .I1(fadd_n_11),
        .I2(temp_add_a[9]),
        .I3(fadd_n_44),
        .I4(\exponent[0]_i_61_n_0 ),
        .I5(fadd_n_15),
        .O(\exponent[0]_i_43_n_0 ));
  LUT6 #(
    .INIT(64'h22222222BBB222B2)) 
    \exponent[0]_i_52 
       (.I0(fadd_n_12),
        .I1(\exponent[0]_i_62_n_0 ),
        .I2(temp_add_a[6]),
        .I3(fadd_n_11),
        .I4(temp_add_b[6]),
        .I5(fadd_n_14),
        .O(\exponent[0]_i_52_n_0 ));
  LUT6 #(
    .INIT(64'h22222222BBB222B2)) 
    \exponent[0]_i_53 
       (.I0(fadd_n_13),
        .I1(\exponent[0]_i_63_n_0 ),
        .I2(temp_add_a[4]),
        .I3(fadd_n_11),
        .I4(temp_add_b[4]),
        .I5(fadd_n_16),
        .O(\exponent[0]_i_53_n_0 ));
  LUT6 #(
    .INIT(64'h1111111177711171)) 
    \exponent[0]_i_54 
       (.I0(fadd_n_20),
        .I1(\exponent[0]_i_64_n_0 ),
        .I2(temp_add_a[2]),
        .I3(fadd_n_11),
        .I4(temp_add_b[2]),
        .I5(fadd_n_17),
        .O(\exponent[0]_i_54_n_0 ));
  LUT6 #(
    .INIT(64'h540454045404FD5D)) 
    \exponent[0]_i_55 
       (.I0(fadd_n_18),
        .I1(temp_add_a[1]),
        .I2(fadd_n_11),
        .I3(temp_add_b[1]),
        .I4(fadd_n_21),
        .I5(fadd_n_19),
        .O(\exponent[0]_i_55_n_0 ));
  LUT5 #(
    .INIT(32'h8A80202A)) 
    \exponent[0]_i_56 
       (.I0(\exponent[0]_i_65_n_0 ),
        .I1(temp_add_b[6]),
        .I2(fadd_n_11),
        .I3(temp_add_a[6]),
        .I4(fadd_n_14),
        .O(\exponent[0]_i_56_n_0 ));
  LUT5 #(
    .INIT(32'h8A80202A)) 
    \exponent[0]_i_57 
       (.I0(\exponent[0]_i_66_n_0 ),
        .I1(temp_add_b[4]),
        .I2(fadd_n_11),
        .I3(temp_add_a[4]),
        .I4(fadd_n_16),
        .O(\exponent[0]_i_57_n_0 ));
  LUT5 #(
    .INIT(32'h8A80202A)) 
    \exponent[0]_i_58 
       (.I0(\exponent[0]_i_67_n_0 ),
        .I1(temp_add_b[2]),
        .I2(fadd_n_11),
        .I3(temp_add_a[2]),
        .I4(fadd_n_17),
        .O(\exponent[0]_i_58_n_0 ));
  LUT5 #(
    .INIT(32'h8A80202A)) 
    \exponent[0]_i_59 
       (.I0(\exponent[0]_i_68_n_0 ),
        .I1(temp_add_b[0]),
        .I2(fadd_n_11),
        .I3(temp_add_a[0]),
        .I4(fadd_n_19),
        .O(\exponent[0]_i_59_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \exponent[0]_i_60 
       (.I0(temp_add_b[9]),
        .I1(fadd_n_11),
        .I2(temp_add_a[9]),
        .O(\exponent[0]_i_60_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \exponent[0]_i_61 
       (.I0(temp_add_b[8]),
        .I1(fadd_n_11),
        .I2(temp_add_a[8]),
        .O(\exponent[0]_i_61_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \exponent[0]_i_62 
       (.I0(temp_add_b[7]),
        .I1(fadd_n_11),
        .I2(temp_add_a[7]),
        .O(\exponent[0]_i_62_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \exponent[0]_i_63 
       (.I0(temp_add_b[5]),
        .I1(fadd_n_11),
        .I2(temp_add_a[5]),
        .O(\exponent[0]_i_63_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \exponent[0]_i_64 
       (.I0(temp_add_b[3]),
        .I1(fadd_n_11),
        .I2(temp_add_a[3]),
        .O(\exponent[0]_i_64_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h56A6)) 
    \exponent[0]_i_65 
       (.I0(fadd_n_12),
        .I1(temp_add_a[7]),
        .I2(fadd_n_11),
        .I3(temp_add_b[7]),
        .O(\exponent[0]_i_65_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h56A6)) 
    \exponent[0]_i_66 
       (.I0(fadd_n_13),
        .I1(temp_add_a[5]),
        .I2(fadd_n_11),
        .I3(temp_add_b[5]),
        .O(\exponent[0]_i_66_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'hA959)) 
    \exponent[0]_i_67 
       (.I0(fadd_n_20),
        .I1(temp_add_a[3]),
        .I2(fadd_n_11),
        .I3(temp_add_b[3]),
        .O(\exponent[0]_i_67_n_0 ));
  LUT4 #(
    .INIT(16'hA959)) 
    \exponent[0]_i_68 
       (.I0(fadd_n_18),
        .I1(temp_add_a[1]),
        .I2(fadd_n_11),
        .I3(temp_add_b[1]),
        .O(\exponent[0]_i_68_n_0 ));
  CARRY4 \exponent_reg[0]_i_35 
       (.CI(\exponent_reg[0]_i_40_n_0 ),
        .CO({\NLW_exponent_reg[0]_i_35_CO_UNCONNECTED [3:2],sel,\exponent_reg[0]_i_35_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,fadd_n_10,\exponent[0]_i_41_n_0 }),
        .O(\NLW_exponent_reg[0]_i_35_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,in,\exponent[0]_i_43_n_0 }));
  CARRY4 \exponent_reg[0]_i_40 
       (.CI(1'b0),
        .CO({\exponent_reg[0]_i_40_n_0 ,\exponent_reg[0]_i_40_n_1 ,\exponent_reg[0]_i_40_n_2 ,\exponent_reg[0]_i_40_n_3 }),
        .CYINIT(1'b0),
        .DI({\exponent[0]_i_52_n_0 ,\exponent[0]_i_53_n_0 ,\exponent[0]_i_54_n_0 ,\exponent[0]_i_55_n_0 }),
        .O(\NLW_exponent_reg[0]_i_40_O_UNCONNECTED [3:0]),
        .S({\exponent[0]_i_56_n_0 ,\exponent[0]_i_57_n_0 ,\exponent[0]_i_58_n_0 ,\exponent[0]_i_59_n_0 }));
  fp_add_2 fadd
       (.CO(sel),
        .D({fadd_n_22,fadd_n_23,fadd_n_24,fadd_n_25,fadd_n_26,fadd_n_27,fadd_n_28,fadd_n_29,fadd_n_30,fadd_n_31,fadd_n_32,fadd_n_33,fadd_n_34,fadd_n_35,fadd_n_36,fadd_n_37}),
        .Q(temp_add_b),
        .UNCONN_IN(i),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\exponent_reg[0]_0 (fadd_n_10),
        .\exponent_reg[0]_1 (fadd_n_11),
        .\input_x[12] (\output_tanh[15]_i_2_n_0 ),
        .input_x_IBUF(input_x_IBUF[15:14]),
        .\mantissa_reg[0]_0 (fadd_n_12),
        .\mantissa_reg[0]_1 (fadd_n_13),
        .\mantissa_reg[0]_10 (fadd_n_44),
        .\mantissa_reg[0]_2 (fadd_n_14),
        .\mantissa_reg[0]_3 (fadd_n_15),
        .\mantissa_reg[0]_4 (fadd_n_16),
        .\mantissa_reg[0]_5 (fadd_n_17),
        .\mantissa_reg[0]_6 (fadd_n_18),
        .\mantissa_reg[0]_7 (fadd_n_19),
        .\mantissa_reg[0]_8 (fadd_n_20),
        .\mantissa_reg[0]_9 (fadd_n_21),
        .output_tanh_OBUF({output_tanh_OBUF[15],output_tanh_OBUF[13:10]}),
        .\output_tanh_reg[0] (fadd_n_43),
        .\output_tanh_reg[10] (fadd_n_9),
        .\output_tanh_reg[11] (fadd_n_7),
        .\output_tanh_reg[12] (fadd_n_6),
        .\output_tanh_reg[13] (fadd_n_5),
        .\output_tanh_reg[14] ({output_tmp_add[14],output_tmp_add[7:6],output_tmp_add[3:2]}),
        .\output_tanh_reg[15] (fadd_n_8),
        .\output_tanh_reg[1] (fadd_n_42),
        .\output_tanh_reg[4] (fadd_n_41),
        .\output_tanh_reg[5] (fadd_n_40),
        .\output_tanh_reg[8] (fadd_n_39),
        .\output_tanh_reg[9] (fadd_n_38),
        .reset(\output_tanh[14]_i_2_n_0 ),
        .reset_0(\output_tanh[14]_i_1_n_0 ),
        .\temp_add_a_reg[15] (temp_add_a));
  LUT5 #(
    .INIT(32'h0F0E0F0F)) 
    \i[0]_i_1 
       (.I0(i[2]),
        .I1(i[1]),
        .I2(i[0]),
        .I3(i[4]),
        .I4(i[3]),
        .O(\i[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \i[1]_i_1 
       (.I0(i[1]),
        .I1(i[0]),
        .O(\i[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \i[2]_i_1 
       (.I0(i[2]),
        .I1(i[0]),
        .I2(i[1]),
        .O(\i[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \i[3]_i_1 
       (.I0(i[2]),
        .I1(i[0]),
        .I2(i[1]),
        .I3(i[3]),
        .O(\i[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF7EEEEEEE)) 
    \i[4]_i_1 
       (.I0(i[4]),
        .I1(i[3]),
        .I2(i[2]),
        .I3(i[0]),
        .I4(i[1]),
        .I5(reset_IBUF),
        .O(\i[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \i[4]_i_2 
       (.I0(i[3]),
        .I1(i[4]),
        .I2(i[1]),
        .I3(i[0]),
        .I4(i[2]),
        .O(\i[4]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \i_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\i[0]_i_1_n_0 ),
        .Q(i[0]),
        .R(\i[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[0]__0 
       (.C(clk_IBUF_BUFG),
        .CE(reset_IBUF),
        .D(1'b0),
        .Q(i[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \i_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\i[1]_i_1_n_0 ),
        .Q(i[1]),
        .R(\i[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[1]__0 
       (.C(clk_IBUF_BUFG),
        .CE(reset_IBUF),
        .D(1'b0),
        .Q(i[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \i_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\i[2]_i_1_n_0 ),
        .Q(i[2]),
        .R(\i[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[2]__0 
       (.C(clk_IBUF_BUFG),
        .CE(reset_IBUF),
        .D(1'b0),
        .Q(i[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \i_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\i[3]_i_1_n_0 ),
        .Q(i[3]),
        .R(\i[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[3]__0 
       (.C(clk_IBUF_BUFG),
        .CE(reset_IBUF),
        .D(1'b0),
        .Q(i[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \i_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\i[4]_i_2_n_0 ),
        .Q(i[4]),
        .R(\i[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[4]__0 
       (.C(clk_IBUF_BUFG),
        .CE(reset_IBUF),
        .D(1'b0),
        .Q(i[4]),
        .R(1'b0));
  IBUF \input_x_IBUF[0]_inst 
       (.I(input_x[0]),
        .O(input_x_IBUF[0]));
  IBUF \input_x_IBUF[10]_inst 
       (.I(input_x[10]),
        .O(input_x_IBUF[10]));
  IBUF \input_x_IBUF[11]_inst 
       (.I(input_x[11]),
        .O(input_x_IBUF[11]));
  IBUF \input_x_IBUF[12]_inst 
       (.I(input_x[12]),
        .O(input_x_IBUF[12]));
  IBUF \input_x_IBUF[13]_inst 
       (.I(input_x[13]),
        .O(input_x_IBUF[13]));
  IBUF \input_x_IBUF[14]_inst 
       (.I(input_x[14]),
        .O(input_x_IBUF[14]));
  IBUF \input_x_IBUF[15]_inst 
       (.I(input_x[15]),
        .O(input_x_IBUF[15]));
  IBUF \input_x_IBUF[1]_inst 
       (.I(input_x[1]),
        .O(input_x_IBUF[1]));
  IBUF \input_x_IBUF[2]_inst 
       (.I(input_x[2]),
        .O(input_x_IBUF[2]));
  IBUF \input_x_IBUF[3]_inst 
       (.I(input_x[3]),
        .O(input_x_IBUF[3]));
  IBUF \input_x_IBUF[4]_inst 
       (.I(input_x[4]),
        .O(input_x_IBUF[4]));
  IBUF \input_x_IBUF[5]_inst 
       (.I(input_x[5]),
        .O(input_x_IBUF[5]));
  IBUF \input_x_IBUF[6]_inst 
       (.I(input_x[6]),
        .O(input_x_IBUF[6]));
  IBUF \input_x_IBUF[7]_inst 
       (.I(input_x[7]),
        .O(input_x_IBUF[7]));
  IBUF \input_x_IBUF[8]_inst 
       (.I(input_x[8]),
        .O(input_x_IBUF[8]));
  IBUF \input_x_IBUF[9]_inst 
       (.I(input_x[9]),
        .O(input_x_IBUF[9]));
  LUT6 #(
    .INIT(64'hFFFF800000000000)) 
    \output_tanh[14]_i_1 
       (.I0(input_x_IBUF[11]),
        .I1(input_x_IBUF[10]),
        .I2(input_x_IBUF[13]),
        .I3(input_x_IBUF[12]),
        .I4(input_x_IBUF[14]),
        .I5(\output_tanh[14]_i_2_n_0 ),
        .O(\output_tanh[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0100000000000000)) 
    \output_tanh[14]_i_2 
       (.I0(reset_IBUF),
        .I1(i[3]),
        .I2(i[4]),
        .I3(i[2]),
        .I4(i[0]),
        .I5(i[1]),
        .O(\output_tanh[14]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \output_tanh[15]_i_2 
       (.I0(input_x_IBUF[11]),
        .I1(input_x_IBUF[10]),
        .I2(input_x_IBUF[13]),
        .I3(input_x_IBUF[12]),
        .O(\output_tanh[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    \output_tanh[9]_i_1 
       (.I0(input_x_IBUF[14]),
        .I1(input_x_IBUF[11]),
        .I2(input_x_IBUF[10]),
        .I3(input_x_IBUF[13]),
        .I4(input_x_IBUF[12]),
        .I5(\output_tanh[14]_i_2_n_0 ),
        .O(\output_tanh[9]_i_1_n_0 ));
  OBUF \output_tanh_OBUF[0]_inst 
       (.I(output_tanh_OBUF[0]),
        .O(output_tanh[0]));
  OBUF \output_tanh_OBUF[10]_inst 
       (.I(output_tanh_OBUF[10]),
        .O(output_tanh[10]));
  OBUF \output_tanh_OBUF[11]_inst 
       (.I(output_tanh_OBUF[11]),
        .O(output_tanh[11]));
  OBUF \output_tanh_OBUF[12]_inst 
       (.I(output_tanh_OBUF[12]),
        .O(output_tanh[12]));
  OBUF \output_tanh_OBUF[13]_inst 
       (.I(output_tanh_OBUF[13]),
        .O(output_tanh[13]));
  OBUF \output_tanh_OBUF[14]_inst 
       (.I(output_tanh_OBUF[14]),
        .O(output_tanh[14]));
  OBUF \output_tanh_OBUF[15]_inst 
       (.I(output_tanh_OBUF[15]),
        .O(output_tanh[15]));
  OBUF \output_tanh_OBUF[1]_inst 
       (.I(output_tanh_OBUF[1]),
        .O(output_tanh[1]));
  OBUF \output_tanh_OBUF[2]_inst 
       (.I(output_tanh_OBUF[2]),
        .O(output_tanh[2]));
  OBUF \output_tanh_OBUF[3]_inst 
       (.I(output_tanh_OBUF[3]),
        .O(output_tanh[3]));
  OBUF \output_tanh_OBUF[4]_inst 
       (.I(output_tanh_OBUF[4]),
        .O(output_tanh[4]));
  OBUF \output_tanh_OBUF[5]_inst 
       (.I(output_tanh_OBUF[5]),
        .O(output_tanh[5]));
  OBUF \output_tanh_OBUF[6]_inst 
       (.I(output_tanh_OBUF[6]),
        .O(output_tanh[6]));
  OBUF \output_tanh_OBUF[7]_inst 
       (.I(output_tanh_OBUF[7]),
        .O(output_tanh[7]));
  OBUF \output_tanh_OBUF[8]_inst 
       (.I(output_tanh_OBUF[8]),
        .O(output_tanh[8]));
  OBUF \output_tanh_OBUF[9]_inst 
       (.I(output_tanh_OBUF[9]),
        .O(output_tanh[9]));
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    \output_tanh_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\output_tanh[14]_i_2_n_0 ),
        .D(fadd_n_43),
        .Q(output_tanh_OBUF[0]),
        .S(\output_tanh[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \output_tanh_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(fadd_n_9),
        .Q(output_tanh_OBUF[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \output_tanh_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(fadd_n_7),
        .Q(output_tanh_OBUF[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \output_tanh_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(fadd_n_6),
        .Q(output_tanh_OBUF[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \output_tanh_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(fadd_n_5),
        .Q(output_tanh_OBUF[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \output_tanh_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\output_tanh[14]_i_2_n_0 ),
        .D(output_tmp_add[14]),
        .Q(output_tanh_OBUF[14]),
        .R(\output_tanh[14]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \output_tanh_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(fadd_n_8),
        .Q(output_tanh_OBUF[15]),
        .R(1'b0));
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    \output_tanh_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\output_tanh[14]_i_2_n_0 ),
        .D(fadd_n_42),
        .Q(output_tanh_OBUF[1]),
        .S(\output_tanh[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \output_tanh_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\output_tanh[14]_i_2_n_0 ),
        .D(output_tmp_add[2]),
        .Q(output_tanh_OBUF[2]),
        .R(\output_tanh[14]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \output_tanh_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\output_tanh[14]_i_2_n_0 ),
        .D(output_tmp_add[3]),
        .Q(output_tanh_OBUF[3]),
        .R(\output_tanh[14]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    \output_tanh_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\output_tanh[14]_i_2_n_0 ),
        .D(fadd_n_41),
        .Q(output_tanh_OBUF[4]),
        .S(\output_tanh[9]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    \output_tanh_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\output_tanh[14]_i_2_n_0 ),
        .D(fadd_n_40),
        .Q(output_tanh_OBUF[5]),
        .S(\output_tanh[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \output_tanh_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\output_tanh[14]_i_2_n_0 ),
        .D(output_tmp_add[6]),
        .Q(output_tanh_OBUF[6]),
        .R(\output_tanh[14]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \output_tanh_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\output_tanh[14]_i_2_n_0 ),
        .D(output_tmp_add[7]),
        .Q(output_tanh_OBUF[7]),
        .R(\output_tanh[14]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    \output_tanh_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\output_tanh[14]_i_2_n_0 ),
        .D(fadd_n_39),
        .Q(output_tanh_OBUF[8]),
        .S(\output_tanh[9]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    \output_tanh_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\output_tanh[14]_i_2_n_0 ),
        .D(fadd_n_38),
        .Q(output_tanh_OBUF[9]),
        .S(\output_tanh[9]_i_1_n_0 ));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  LUT6 #(
    .INIT(64'h000000007EEEEEEE)) 
    \temp_add_a[15]_i_1 
       (.I0(i[4]),
        .I1(i[3]),
        .I2(i[2]),
        .I3(i[0]),
        .I4(i[1]),
        .I5(reset_IBUF),
        .O(\temp_add_a[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000001030000)) 
    \temp_add_a[15]_i_2 
       (.I0(i[0]),
        .I1(i[4]),
        .I2(i[3]),
        .I3(i[1]),
        .I4(i[2]),
        .I5(reset_IBUF),
        .O(\temp_add_a[15]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_a_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(fadd_n_37),
        .Q(temp_add_a[0]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_a_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(fadd_n_27),
        .Q(temp_add_a[10]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_a_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(fadd_n_26),
        .Q(temp_add_a[11]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_a_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(fadd_n_25),
        .Q(temp_add_a[12]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_a_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(fadd_n_24),
        .Q(temp_add_a[13]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_a_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(fadd_n_23),
        .Q(temp_add_a[14]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_a_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(fadd_n_22),
        .Q(temp_add_a[15]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_a_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(fadd_n_36),
        .Q(temp_add_a[1]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_a_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(fadd_n_35),
        .Q(temp_add_a[2]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_a_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(fadd_n_34),
        .Q(temp_add_a[3]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_a_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(fadd_n_33),
        .Q(temp_add_a[4]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_a_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(fadd_n_32),
        .Q(temp_add_a[5]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_a_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(fadd_n_31),
        .Q(temp_add_a[6]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_a_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(fadd_n_30),
        .Q(temp_add_a[7]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_a_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(fadd_n_29),
        .Q(temp_add_a[8]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_a_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(fadd_n_28),
        .Q(temp_add_a[9]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \temp_add_b[0]_i_1 
       (.I0(input_x_IBUF[0]),
        .I1(i[0]),
        .I2(i[2]),
        .I3(i[4]),
        .I4(i[3]),
        .I5(i[1]),
        .O(\temp_add_b[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \temp_add_b[10]_i_1 
       (.I0(input_x_IBUF[10]),
        .I1(i[0]),
        .I2(i[2]),
        .I3(i[4]),
        .I4(i[3]),
        .I5(i[1]),
        .O(\temp_add_b[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \temp_add_b[11]_i_1 
       (.I0(input_x_IBUF[11]),
        .I1(i[0]),
        .I2(i[2]),
        .I3(i[4]),
        .I4(i[3]),
        .I5(i[1]),
        .O(\temp_add_b[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \temp_add_b[12]_i_1 
       (.I0(input_x_IBUF[12]),
        .I1(i[0]),
        .I2(i[2]),
        .I3(i[4]),
        .I4(i[3]),
        .I5(i[1]),
        .O(\temp_add_b[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \temp_add_b[13]_i_1 
       (.I0(input_x_IBUF[13]),
        .I1(i[0]),
        .I2(i[2]),
        .I3(i[4]),
        .I4(i[3]),
        .I5(i[1]),
        .O(\temp_add_b[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \temp_add_b[14]_i_1 
       (.I0(input_x_IBUF[14]),
        .I1(i[0]),
        .I2(i[2]),
        .I3(i[4]),
        .I4(i[3]),
        .I5(i[1]),
        .O(\temp_add_b[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \temp_add_b[15]_i_1 
       (.I0(input_x_IBUF[15]),
        .I1(i[0]),
        .I2(i[2]),
        .I3(i[4]),
        .I4(i[3]),
        .I5(i[1]),
        .O(\temp_add_b[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \temp_add_b[1]_i_1 
       (.I0(input_x_IBUF[1]),
        .I1(i[0]),
        .I2(i[2]),
        .I3(i[4]),
        .I4(i[3]),
        .I5(i[1]),
        .O(\temp_add_b[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \temp_add_b[2]_i_1 
       (.I0(input_x_IBUF[2]),
        .I1(i[0]),
        .I2(i[2]),
        .I3(i[4]),
        .I4(i[3]),
        .I5(i[1]),
        .O(\temp_add_b[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \temp_add_b[3]_i_1 
       (.I0(input_x_IBUF[3]),
        .I1(i[0]),
        .I2(i[2]),
        .I3(i[4]),
        .I4(i[3]),
        .I5(i[1]),
        .O(\temp_add_b[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \temp_add_b[4]_i_1 
       (.I0(input_x_IBUF[4]),
        .I1(i[0]),
        .I2(i[2]),
        .I3(i[4]),
        .I4(i[3]),
        .I5(i[1]),
        .O(\temp_add_b[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \temp_add_b[5]_i_1 
       (.I0(input_x_IBUF[5]),
        .I1(i[0]),
        .I2(i[2]),
        .I3(i[4]),
        .I4(i[3]),
        .I5(i[1]),
        .O(\temp_add_b[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \temp_add_b[6]_i_1 
       (.I0(input_x_IBUF[6]),
        .I1(i[0]),
        .I2(i[2]),
        .I3(i[4]),
        .I4(i[3]),
        .I5(i[1]),
        .O(\temp_add_b[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \temp_add_b[7]_i_1 
       (.I0(input_x_IBUF[7]),
        .I1(i[0]),
        .I2(i[2]),
        .I3(i[4]),
        .I4(i[3]),
        .I5(i[1]),
        .O(\temp_add_b[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \temp_add_b[8]_i_1 
       (.I0(input_x_IBUF[8]),
        .I1(i[0]),
        .I2(i[2]),
        .I3(i[4]),
        .I4(i[3]),
        .I5(i[1]),
        .O(\temp_add_b[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \temp_add_b[9]_i_1 
       (.I0(input_x_IBUF[9]),
        .I1(i[0]),
        .I2(i[2]),
        .I3(i[4]),
        .I4(i[3]),
        .I5(i[1]),
        .O(\temp_add_b[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_b_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(\temp_add_b[0]_i_1_n_0 ),
        .Q(temp_add_b[0]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_b_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(\temp_add_b[10]_i_1_n_0 ),
        .Q(temp_add_b[10]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_b_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(\temp_add_b[11]_i_1_n_0 ),
        .Q(temp_add_b[11]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_b_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(\temp_add_b[12]_i_1_n_0 ),
        .Q(temp_add_b[12]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_b_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(\temp_add_b[13]_i_1_n_0 ),
        .Q(temp_add_b[13]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_b_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(\temp_add_b[14]_i_1_n_0 ),
        .Q(temp_add_b[14]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_b_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(\temp_add_b[15]_i_1_n_0 ),
        .Q(temp_add_b[15]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_b_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(\temp_add_b[1]_i_1_n_0 ),
        .Q(temp_add_b[1]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_b_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(\temp_add_b[2]_i_1_n_0 ),
        .Q(temp_add_b[2]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_b_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(\temp_add_b[3]_i_1_n_0 ),
        .Q(temp_add_b[3]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_b_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(\temp_add_b[4]_i_1_n_0 ),
        .Q(temp_add_b[4]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_b_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(\temp_add_b[5]_i_1_n_0 ),
        .Q(temp_add_b[5]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_b_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(\temp_add_b[6]_i_1_n_0 ),
        .Q(temp_add_b[6]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_b_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(\temp_add_b[7]_i_1_n_0 ),
        .Q(temp_add_b[7]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_b_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(\temp_add_b[8]_i_1_n_0 ),
        .Q(temp_add_b[8]),
        .R(\temp_add_a[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \temp_add_b_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\temp_add_a[15]_i_2_n_0 ),
        .D(\temp_add_b[9]_i_1_n_0 ),
        .Q(temp_add_b[9]),
        .R(\temp_add_a[15]_i_1_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
