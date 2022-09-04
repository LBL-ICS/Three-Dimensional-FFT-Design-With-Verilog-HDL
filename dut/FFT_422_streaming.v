module cmplx_adj(
  input  [31:0] io_in_Re,
  input  [31:0] io_in_Im,
  input         io_is_neg,
  input         io_is_flip,
  output [31:0] io_out_Re,
  output [31:0] io_out_Im
);
  wire  sign_0 = io_in_Re[31]; // @[FFTDesigns.scala 3510:24]
  wire  sign_1 = io_in_Im[31]; // @[FFTDesigns.scala 3511:24]
  wire [7:0] exp_0 = io_in_Re[30:23]; // @[FFTDesigns.scala 3513:23]
  wire [7:0] exp_1 = io_in_Im[30:23]; // @[FFTDesigns.scala 3514:23]
  wire [22:0] frac_0 = io_in_Re[22:0]; // @[FFTDesigns.scala 3516:24]
  wire [22:0] frac_1 = io_in_Im[22:0]; // @[FFTDesigns.scala 3517:24]
  wire  new_sign_0 = io_is_neg ? ~sign_0 : sign_0; // @[FFTDesigns.scala 3519:20 3520:19 3523:19]
  wire  new_sign_1 = io_is_neg ? ~sign_1 : sign_1; // @[FFTDesigns.scala 3519:20 3521:19 3524:19]
  wire [7:0] _new_exp_0_T_1 = exp_0 - 8'h0; // @[FFTDesigns.scala 3528:28]
  wire [7:0] new_exp_0 = exp_0 != 8'h0 ? _new_exp_0_T_1 : exp_0; // @[FFTDesigns.scala 3527:25 3528:18 3530:18]
  wire [7:0] _new_exp_1_T_1 = exp_1 - 8'h0; // @[FFTDesigns.scala 3533:28]
  wire [7:0] new_exp_1 = exp_1 != 8'h0 ? _new_exp_1_T_1 : exp_1; // @[FFTDesigns.scala 3532:26 3533:18 3535:18]
  wire  _io_out_Re_T = ~new_sign_1; // @[FFTDesigns.scala 3539:21]
  wire [31:0] _io_out_Re_T_2 = {_io_out_Re_T,new_exp_1,frac_1}; // @[FFTDesigns.scala 3539:49]
  wire [31:0] _io_out_Im_T_1 = {new_sign_0,new_exp_0,frac_0}; // @[FFTDesigns.scala 3540:48]
  wire [31:0] _io_out_Im_T_3 = {new_sign_1,new_exp_1,frac_1}; // @[FFTDesigns.scala 3543:48]
  assign io_out_Re = io_is_flip ? _io_out_Re_T_2 : _io_out_Im_T_1; // @[FFTDesigns.scala 3538:21 3539:17 3542:17]
  assign io_out_Im = io_is_flip ? _io_out_Im_T_1 : _io_out_Im_T_3; // @[FFTDesigns.scala 3538:21 3540:17 3543:17]
endmodule
module full_subber(
  input  [7:0] io_in_a,
  input  [7:0] io_in_b,
  output [7:0] io_out_s,
  output       io_out_c
);
  wire [8:0] _result_T = io_in_a - io_in_b; // @[Arithmetic.scala 72:23]
  wire [9:0] _result_T_2 = _result_T - 9'h0; // @[Arithmetic.scala 72:34]
  wire [8:0] result = _result_T_2[8:0]; // @[Arithmetic.scala 71:22 72:12]
  assign io_out_s = result[7:0]; // @[Arithmetic.scala 73:23]
  assign io_out_c = result[8]; // @[Arithmetic.scala 74:23]
endmodule
module twoscomplement(
  input  [7:0] io_in,
  output [7:0] io_out
);
  wire [7:0] _x_T = ~io_in; // @[Arithmetic.scala 28:16]
  assign io_out = 8'h1 + _x_T; // @[Arithmetic.scala 28:14]
endmodule
module full_adder(
  input  [23:0] io_in_a,
  input  [23:0] io_in_b,
  output [23:0] io_out_s,
  output        io_out_c
);
  wire [24:0] _result_T = io_in_a + io_in_b; // @[Arithmetic.scala 58:23]
  wire [25:0] _result_T_1 = {{1'd0}, _result_T}; // @[Arithmetic.scala 58:34]
  wire [24:0] result = _result_T_1[24:0]; // @[Arithmetic.scala 57:22 58:12]
  assign io_out_s = result[23:0]; // @[Arithmetic.scala 59:23]
  assign io_out_c = result[24]; // @[Arithmetic.scala 60:23]
endmodule
module twoscomplement_1(
  input  [23:0] io_in,
  output [23:0] io_out
);
  wire [23:0] _x_T = ~io_in; // @[Arithmetic.scala 28:16]
  assign io_out = 24'h1 + _x_T; // @[Arithmetic.scala 28:14]
endmodule
module shifter(
  input  [23:0] io_in_a,
  input  [4:0]  io_in_b,
  output [23:0] io_out_s
);
  wire [23:0] _result_T = io_in_a >> io_in_b; // @[Arithmetic.scala 42:25]
  wire [54:0] _GEN_0 = {{31'd0}, _result_T}; // @[Arithmetic.scala 41:26 42:14 44:14]
  assign io_out_s = _GEN_0[23:0]; // @[Arithmetic.scala 39:22]
endmodule
module leadingOneDetector(
  input  [23:0] io_in,
  output [4:0]  io_out
);
  wire [1:0] _hotValue_T = io_in[1] ? 2'h2 : 2'h1; // @[Mux.scala 47:70]
  wire [1:0] _hotValue_T_1 = io_in[2] ? 2'h3 : _hotValue_T; // @[Mux.scala 47:70]
  wire [2:0] _hotValue_T_2 = io_in[3] ? 3'h4 : {{1'd0}, _hotValue_T_1}; // @[Mux.scala 47:70]
  wire [2:0] _hotValue_T_3 = io_in[4] ? 3'h5 : _hotValue_T_2; // @[Mux.scala 47:70]
  wire [2:0] _hotValue_T_4 = io_in[5] ? 3'h6 : _hotValue_T_3; // @[Mux.scala 47:70]
  wire [2:0] _hotValue_T_5 = io_in[6] ? 3'h7 : _hotValue_T_4; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_6 = io_in[7] ? 4'h8 : {{1'd0}, _hotValue_T_5}; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_7 = io_in[8] ? 4'h9 : _hotValue_T_6; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_8 = io_in[9] ? 4'ha : _hotValue_T_7; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_9 = io_in[10] ? 4'hb : _hotValue_T_8; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_10 = io_in[11] ? 4'hc : _hotValue_T_9; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_11 = io_in[12] ? 4'hd : _hotValue_T_10; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_12 = io_in[13] ? 4'he : _hotValue_T_11; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_13 = io_in[14] ? 4'hf : _hotValue_T_12; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_14 = io_in[15] ? 5'h10 : {{1'd0}, _hotValue_T_13}; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_15 = io_in[16] ? 5'h11 : _hotValue_T_14; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_16 = io_in[17] ? 5'h12 : _hotValue_T_15; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_17 = io_in[18] ? 5'h13 : _hotValue_T_16; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_18 = io_in[19] ? 5'h14 : _hotValue_T_17; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_19 = io_in[20] ? 5'h15 : _hotValue_T_18; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_20 = io_in[21] ? 5'h16 : _hotValue_T_19; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_21 = io_in[22] ? 5'h17 : _hotValue_T_20; // @[Mux.scala 47:70]
  assign io_out = io_in[23] ? 5'h18 : _hotValue_T_21; // @[Mux.scala 47:70]
endmodule
module FP_adder(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
  output [31:0] io_out_s
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [7:0] subber_io_in_a; // @[FPArithmetic.scala 76:24]
  wire [7:0] subber_io_in_b; // @[FPArithmetic.scala 76:24]
  wire [7:0] subber_io_out_s; // @[FPArithmetic.scala 76:24]
  wire  subber_io_out_c; // @[FPArithmetic.scala 76:24]
  wire [7:0] complement_io_in; // @[FPArithmetic.scala 82:28]
  wire [7:0] complement_io_out; // @[FPArithmetic.scala 82:28]
  wire [23:0] adder_io_in_a; // @[FPArithmetic.scala 86:23]
  wire [23:0] adder_io_in_b; // @[FPArithmetic.scala 86:23]
  wire [23:0] adder_io_out_s; // @[FPArithmetic.scala 86:23]
  wire  adder_io_out_c; // @[FPArithmetic.scala 86:23]
  wire [23:0] complementN_0_io_in; // @[FPArithmetic.scala 92:31]
  wire [23:0] complementN_0_io_out; // @[FPArithmetic.scala 92:31]
  wire [23:0] complementN_1_io_in; // @[FPArithmetic.scala 94:31]
  wire [23:0] complementN_1_io_out; // @[FPArithmetic.scala 94:31]
  wire [23:0] shifter_io_in_a; // @[FPArithmetic.scala 98:25]
  wire [4:0] shifter_io_in_b; // @[FPArithmetic.scala 98:25]
  wire [23:0] shifter_io_out_s; // @[FPArithmetic.scala 98:25]
  wire [23:0] complementN_2_io_in; // @[FPArithmetic.scala 143:31]
  wire [23:0] complementN_2_io_out; // @[FPArithmetic.scala 143:31]
  wire [23:0] leadingOneFinder_io_in; // @[FPArithmetic.scala 163:34]
  wire [4:0] leadingOneFinder_io_out; // @[FPArithmetic.scala 163:34]
  wire [7:0] subber2_io_in_a; // @[FPArithmetic.scala 165:25]
  wire [7:0] subber2_io_in_b; // @[FPArithmetic.scala 165:25]
  wire [7:0] subber2_io_out_s; // @[FPArithmetic.scala 165:25]
  wire  subber2_io_out_c; // @[FPArithmetic.scala 165:25]
  wire  sign_0 = io_in_a[31]; // @[FPArithmetic.scala 38:23]
  wire  sign_1 = io_in_b[31]; // @[FPArithmetic.scala 39:23]
  wire [8:0] _T_2 = 9'h100 - 9'h2; // @[FPArithmetic.scala 43:62]
  wire [8:0] _GEN_31 = {{1'd0}, io_in_a[30:23]}; // @[FPArithmetic.scala 43:34]
  wire [8:0] _GEN_0 = _GEN_31 > _T_2 ? _T_2 : {{1'd0}, io_in_a[30:23]}; // @[FPArithmetic.scala 43:68 44:14 46:14]
  wire [8:0] _GEN_32 = {{1'd0}, io_in_b[30:23]}; // @[FPArithmetic.scala 48:34]
  wire [8:0] _GEN_1 = _GEN_32 > _T_2 ? _T_2 : {{1'd0}, io_in_b[30:23]}; // @[FPArithmetic.scala 48:68 49:14 51:14]
  wire [22:0] frac_0 = io_in_a[22:0]; // @[FPArithmetic.scala 56:23]
  wire [22:0] frac_1 = io_in_b[22:0]; // @[FPArithmetic.scala 57:23]
  wire [23:0] whole_frac_0 = {1'h1,frac_0}; // @[FPArithmetic.scala 61:26]
  wire [23:0] whole_frac_1 = {1'h1,frac_1}; // @[FPArithmetic.scala 62:26]
  wire [7:0] exp_1 = _GEN_1[7:0]; // @[FPArithmetic.scala 42:19]
  wire [7:0] exp_0 = _GEN_0[7:0]; // @[FPArithmetic.scala 42:19]
  wire [7:0] out_exp = subber_io_out_c ? exp_1 : exp_0; // @[FPArithmetic.scala 104:34 105:15 115:15]
  wire [7:0] sub_exp = subber_io_out_c ? complement_io_out : subber_io_out_s; // @[FPArithmetic.scala 104:34 106:15 116:15]
  wire  out_s = subber_io_out_c ? sign_1 : sign_0; // @[FPArithmetic.scala 104:34 107:13 117:13]
  wire [22:0] out_frac = subber_io_out_c ? frac_1 : frac_0; // @[FPArithmetic.scala 104:34 108:16 118:16]
  wire [23:0] _GEN_8 = subber_io_out_c ? shifter_io_out_s : whole_frac_0; // @[FPArithmetic.scala 104:34 112:21 87:19]
  wire [23:0] _GEN_9 = subber_io_out_c ? whole_frac_1 : shifter_io_out_s; // @[FPArithmetic.scala 104:34 88:19 122:21]
  wire  _new_s_T = ~adder_io_out_c; // @[FPArithmetic.scala 138:15]
  wire  _D_T_1 = sign_0 ^ sign_1; // @[FPArithmetic.scala 151:39]
  wire  D = _new_s_T | sign_0 ^ sign_1; // @[FPArithmetic.scala 151:28]
  wire  E = _new_s_T & ~adder_io_out_s[23] | _new_s_T & ~_D_T_1 | adder_io_out_c & adder_io_out_s[23] & _D_T_1; // @[FPArithmetic.scala 154:99]
  wire  _GEN_25 = sub_exp >= 8'h17 ? out_s : ~adder_io_out_c & sign_0 | sign_0 & sign_1 | ~adder_io_out_c & sign_1; // @[FPArithmetic.scala 138:11 173:39 174:13]
  wire  new_s = io_in_a[30:0] == 31'h0 & io_in_b[30:0] == 31'h0 ? 1'h0 : _GEN_25; // @[FPArithmetic.scala 169:62 170:13]
  wire [23:0] adder_result = new_s & sign_0 != sign_1 ? complementN_2_io_out : adder_io_out_s; // @[FPArithmetic.scala 157:18 158:47 159:20]
  wire [4:0] _subber2_io_in_b_T_1 = 5'h18 - leadingOneFinder_io_out; // @[FPArithmetic.scala 167:42]
  wire [8:0] _GEN_33 = {{1'd0}, out_exp}; // @[FPArithmetic.scala 181:20]
  wire [23:0] _new_out_frac_T_2 = 24'h800000 - 24'h1; // @[FPArithmetic.scala 183:51]
  wire [7:0] _new_out_exp_T_3 = out_exp + 8'h1; // @[FPArithmetic.scala 185:32]
  wire [8:0] _GEN_13 = _GEN_33 == _T_2 ? _T_2 : {{1'd0}, _new_out_exp_T_3}; // @[FPArithmetic.scala 181:56 182:21 185:21]
  wire [23:0] _GEN_14 = _GEN_33 == _T_2 ? _new_out_frac_T_2 : {{1'd0}, adder_result[23:1]}; // @[FPArithmetic.scala 181:56 183:22 186:22]
  wire [53:0] _GEN_2 = {{31'd0}, adder_result[22:0]}; // @[FPArithmetic.scala 197:57]
  wire [53:0] _new_out_frac_T_7 = _GEN_2 << _subber2_io_in_b_T_1; // @[FPArithmetic.scala 197:57]
  wire [7:0] _GEN_15 = subber2_io_out_c ? 8'h1 : subber2_io_out_s; // @[FPArithmetic.scala 192:39 193:23 196:23]
  wire [53:0] _GEN_16 = subber2_io_out_c ? 54'h400000 : _new_out_frac_T_7; // @[FPArithmetic.scala 192:39 194:24 197:24]
  wire [7:0] _GEN_17 = leadingOneFinder_io_out == 5'h1 & adder_result == 24'h0 & (_D_T_1 & io_in_a[30:0] == io_in_b[30:0
    ]) ? 8'h0 : _GEN_15; // @[FPArithmetic.scala 189:141 190:21]
  wire [53:0] _GEN_18 = leadingOneFinder_io_out == 5'h1 & adder_result == 24'h0 & (_D_T_1 & io_in_a[30:0] == io_in_b[30:
    0]) ? 54'h0 : _GEN_16; // @[FPArithmetic.scala 189:141 139:18]
  wire [7:0] _GEN_19 = D ? _GEN_17 : 8'h0; // @[FPArithmetic.scala 140:17 188:26]
  wire [53:0] _GEN_20 = D ? _GEN_18 : 54'h0; // @[FPArithmetic.scala 139:18 188:26]
  wire [8:0] _GEN_21 = ~D ? _GEN_13 : {{1'd0}, _GEN_19}; // @[FPArithmetic.scala 180:26]
  wire [53:0] _GEN_22 = ~D ? {{30'd0}, _GEN_14} : _GEN_20; // @[FPArithmetic.scala 180:26]
  wire [8:0] _GEN_23 = E ? {{1'd0}, out_exp} : _GEN_21; // @[FPArithmetic.scala 177:26 178:19]
  wire [53:0] _GEN_24 = E ? {{31'd0}, adder_result[22:0]} : _GEN_22; // @[FPArithmetic.scala 177:26 179:20]
  wire [53:0] _GEN_26 = sub_exp >= 8'h17 ? {{31'd0}, out_frac} : _GEN_24; // @[FPArithmetic.scala 173:39 175:20]
  wire [8:0] _GEN_27 = sub_exp >= 8'h17 ? {{1'd0}, out_exp} : _GEN_23; // @[FPArithmetic.scala 173:39 176:19]
  wire [8:0] _GEN_29 = io_in_a[30:0] == 31'h0 & io_in_b[30:0] == 31'h0 ? 9'h0 : _GEN_27; // @[FPArithmetic.scala 169:62 171:19]
  wire [53:0] _GEN_30 = io_in_a[30:0] == 31'h0 & io_in_b[30:0] == 31'h0 ? 54'h0 : _GEN_26; // @[FPArithmetic.scala 169:62 172:20]
  reg [31:0] reg_out_s; // @[FPArithmetic.scala 201:28]
  wire [7:0] new_out_exp = _GEN_29[7:0]; // @[FPArithmetic.scala 137:27]
  wire [22:0] new_out_frac = _GEN_30[22:0]; // @[FPArithmetic.scala 136:28]
  wire [31:0] _reg_out_s_T_1 = {new_s,new_out_exp,new_out_frac}; // @[FPArithmetic.scala 203:39]
  full_subber subber ( // @[FPArithmetic.scala 76:24]
    .io_in_a(subber_io_in_a),
    .io_in_b(subber_io_in_b),
    .io_out_s(subber_io_out_s),
    .io_out_c(subber_io_out_c)
  );
  twoscomplement complement ( // @[FPArithmetic.scala 82:28]
    .io_in(complement_io_in),
    .io_out(complement_io_out)
  );
  full_adder adder ( // @[FPArithmetic.scala 86:23]
    .io_in_a(adder_io_in_a),
    .io_in_b(adder_io_in_b),
    .io_out_s(adder_io_out_s),
    .io_out_c(adder_io_out_c)
  );
  twoscomplement_1 complementN_0 ( // @[FPArithmetic.scala 92:31]
    .io_in(complementN_0_io_in),
    .io_out(complementN_0_io_out)
  );
  twoscomplement_1 complementN_1 ( // @[FPArithmetic.scala 94:31]
    .io_in(complementN_1_io_in),
    .io_out(complementN_1_io_out)
  );
  shifter shifter ( // @[FPArithmetic.scala 98:25]
    .io_in_a(shifter_io_in_a),
    .io_in_b(shifter_io_in_b),
    .io_out_s(shifter_io_out_s)
  );
  twoscomplement_1 complementN_2 ( // @[FPArithmetic.scala 143:31]
    .io_in(complementN_2_io_in),
    .io_out(complementN_2_io_out)
  );
  leadingOneDetector leadingOneFinder ( // @[FPArithmetic.scala 163:34]
    .io_in(leadingOneFinder_io_in),
    .io_out(leadingOneFinder_io_out)
  );
  full_subber subber2 ( // @[FPArithmetic.scala 165:25]
    .io_in_a(subber2_io_in_a),
    .io_in_b(subber2_io_in_b),
    .io_out_s(subber2_io_out_s),
    .io_out_c(subber2_io_out_c)
  );
  assign io_out_s = reg_out_s; // @[FPArithmetic.scala 205:14]
  assign subber_io_in_a = _GEN_0[7:0]; // @[FPArithmetic.scala 42:19]
  assign subber_io_in_b = _GEN_1[7:0]; // @[FPArithmetic.scala 42:19]
  assign complement_io_in = subber_io_out_s; // @[FPArithmetic.scala 83:22]
  assign adder_io_in_a = sign_0 & ~sign_1 ? complementN_0_io_out : _GEN_8; // @[FPArithmetic.scala 127:45 128:21]
  assign adder_io_in_b = sign_1 & ~sign_0 ? complementN_1_io_out : _GEN_9; // @[FPArithmetic.scala 131:45 132:21]
  assign complementN_0_io_in = subber_io_out_c ? shifter_io_out_s : whole_frac_0; // @[FPArithmetic.scala 104:34 112:21 87:19]
  assign complementN_1_io_in = subber_io_out_c ? whole_frac_1 : shifter_io_out_s; // @[FPArithmetic.scala 104:34 88:19 122:21]
  assign shifter_io_in_a = subber_io_out_c ? whole_frac_0 : whole_frac_1; // @[FPArithmetic.scala 104:34 109:23 119:23]
  assign shifter_io_in_b = sub_exp[4:0];
  assign complementN_2_io_in = adder_io_out_s; // @[FPArithmetic.scala 144:25]
  assign leadingOneFinder_io_in = new_s & sign_0 != sign_1 ? complementN_2_io_out : adder_io_out_s; // @[FPArithmetic.scala 157:18 158:47 159:20]
  assign subber2_io_in_a = subber_io_out_c ? exp_1 : exp_0; // @[FPArithmetic.scala 104:34 105:15 115:15]
  assign subber2_io_in_b = {{3'd0}, _subber2_io_in_b_T_1}; // @[FPArithmetic.scala 167:21]
  always @(posedge clock) begin
    if (reset) begin // @[FPArithmetic.scala 201:28]
      reg_out_s <= 32'h0; // @[FPArithmetic.scala 201:28]
    end else begin
      reg_out_s <= _reg_out_s_T_1; // @[FPArithmetic.scala 203:15]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_out_s = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FPComplexAdder(
  input         clock,
  input         reset,
  input  [31:0] io_in_a_Re,
  input  [31:0] io_in_a_Im,
  input  [31:0] io_in_b_Re,
  input  [31:0] io_in_b_Im,
  output [31:0] io_out_s_Re,
  output [31:0] io_out_s_Im
);
  wire  FP_adder_clock; // @[FPComplex.scala 21:25]
  wire  FP_adder_reset; // @[FPComplex.scala 21:25]
  wire [31:0] FP_adder_io_in_a; // @[FPComplex.scala 21:25]
  wire [31:0] FP_adder_io_in_b; // @[FPComplex.scala 21:25]
  wire [31:0] FP_adder_io_out_s; // @[FPComplex.scala 21:25]
  wire  FP_adder_1_clock; // @[FPComplex.scala 21:25]
  wire  FP_adder_1_reset; // @[FPComplex.scala 21:25]
  wire [31:0] FP_adder_1_io_in_a; // @[FPComplex.scala 21:25]
  wire [31:0] FP_adder_1_io_in_b; // @[FPComplex.scala 21:25]
  wire [31:0] FP_adder_1_io_out_s; // @[FPComplex.scala 21:25]
  FP_adder FP_adder ( // @[FPComplex.scala 21:25]
    .clock(FP_adder_clock),
    .reset(FP_adder_reset),
    .io_in_a(FP_adder_io_in_a),
    .io_in_b(FP_adder_io_in_b),
    .io_out_s(FP_adder_io_out_s)
  );
  FP_adder FP_adder_1 ( // @[FPComplex.scala 21:25]
    .clock(FP_adder_1_clock),
    .reset(FP_adder_1_reset),
    .io_in_a(FP_adder_1_io_in_a),
    .io_in_b(FP_adder_1_io_in_b),
    .io_out_s(FP_adder_1_io_out_s)
  );
  assign io_out_s_Re = FP_adder_io_out_s; // @[FPComplex.scala 28:17]
  assign io_out_s_Im = FP_adder_1_io_out_s; // @[FPComplex.scala 29:17]
  assign FP_adder_clock = clock;
  assign FP_adder_reset = reset;
  assign FP_adder_io_in_a = io_in_a_Re; // @[FPComplex.scala 24:23]
  assign FP_adder_io_in_b = io_in_b_Re; // @[FPComplex.scala 25:23]
  assign FP_adder_1_clock = clock;
  assign FP_adder_1_reset = reset;
  assign FP_adder_1_io_in_a = io_in_a_Im; // @[FPComplex.scala 26:23]
  assign FP_adder_1_io_in_b = io_in_b_Im; // @[FPComplex.scala 27:23]
endmodule
module FPComplexMultiAdder(
  input         clock,
  input         reset,
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  output [31:0] io_out_Re,
  output [31:0] io_out_Im
);
  wire  FPComplexAdder_clock; // @[FPComplex.scala 477:30]
  wire  FPComplexAdder_reset; // @[FPComplex.scala 477:30]
  wire [31:0] FPComplexAdder_io_in_a_Re; // @[FPComplex.scala 477:30]
  wire [31:0] FPComplexAdder_io_in_a_Im; // @[FPComplex.scala 477:30]
  wire [31:0] FPComplexAdder_io_in_b_Re; // @[FPComplex.scala 477:30]
  wire [31:0] FPComplexAdder_io_in_b_Im; // @[FPComplex.scala 477:30]
  wire [31:0] FPComplexAdder_io_out_s_Re; // @[FPComplex.scala 477:30]
  wire [31:0] FPComplexAdder_io_out_s_Im; // @[FPComplex.scala 477:30]
  FPComplexAdder FPComplexAdder ( // @[FPComplex.scala 477:30]
    .clock(FPComplexAdder_clock),
    .reset(FPComplexAdder_reset),
    .io_in_a_Re(FPComplexAdder_io_in_a_Re),
    .io_in_a_Im(FPComplexAdder_io_in_a_Im),
    .io_in_b_Re(FPComplexAdder_io_in_b_Re),
    .io_in_b_Im(FPComplexAdder_io_in_b_Im),
    .io_out_s_Re(FPComplexAdder_io_out_s_Re),
    .io_out_s_Im(FPComplexAdder_io_out_s_Im)
  );
  assign io_out_Re = FPComplexAdder_io_out_s_Re; // @[FPComplex.scala 595:16]
  assign io_out_Im = FPComplexAdder_io_out_s_Im; // @[FPComplex.scala 595:16]
  assign FPComplexAdder_clock = clock;
  assign FPComplexAdder_reset = reset;
  assign FPComplexAdder_io_in_a_Re = io_in_0_Re; // @[FPComplex.scala 557:42]
  assign FPComplexAdder_io_in_a_Im = io_in_0_Im; // @[FPComplex.scala 557:42]
  assign FPComplexAdder_io_in_b_Re = io_in_1_Re; // @[FPComplex.scala 558:42]
  assign FPComplexAdder_io_in_b_Im = io_in_1_Im; // @[FPComplex.scala 558:42]
endmodule
module DFT_r_V1_nonregout(
  input         clock,
  input         reset,
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im
);
  wire [31:0] cmplx_adj_io_in_Re; // @[FFTDesigns.scala 1808:22]
  wire [31:0] cmplx_adj_io_in_Im; // @[FFTDesigns.scala 1808:22]
  wire  cmplx_adj_io_is_neg; // @[FFTDesigns.scala 1808:22]
  wire  cmplx_adj_io_is_flip; // @[FFTDesigns.scala 1808:22]
  wire [31:0] cmplx_adj_io_out_Re; // @[FFTDesigns.scala 1808:22]
  wire [31:0] cmplx_adj_io_out_Im; // @[FFTDesigns.scala 1808:22]
  wire  FPComplexMultiAdder_clock; // @[FFTDesigns.scala 1839:26]
  wire  FPComplexMultiAdder_reset; // @[FFTDesigns.scala 1839:26]
  wire [31:0] FPComplexMultiAdder_io_in_0_Re; // @[FFTDesigns.scala 1839:26]
  wire [31:0] FPComplexMultiAdder_io_in_0_Im; // @[FFTDesigns.scala 1839:26]
  wire [31:0] FPComplexMultiAdder_io_in_1_Re; // @[FFTDesigns.scala 1839:26]
  wire [31:0] FPComplexMultiAdder_io_in_1_Im; // @[FFTDesigns.scala 1839:26]
  wire [31:0] FPComplexMultiAdder_io_out_Re; // @[FFTDesigns.scala 1839:26]
  wire [31:0] FPComplexMultiAdder_io_out_Im; // @[FFTDesigns.scala 1839:26]
  wire  FPComplexMultiAdder_1_clock; // @[FFTDesigns.scala 1839:26]
  wire  FPComplexMultiAdder_1_reset; // @[FFTDesigns.scala 1839:26]
  wire [31:0] FPComplexMultiAdder_1_io_in_0_Re; // @[FFTDesigns.scala 1839:26]
  wire [31:0] FPComplexMultiAdder_1_io_in_0_Im; // @[FFTDesigns.scala 1839:26]
  wire [31:0] FPComplexMultiAdder_1_io_in_1_Re; // @[FFTDesigns.scala 1839:26]
  wire [31:0] FPComplexMultiAdder_1_io_in_1_Im; // @[FFTDesigns.scala 1839:26]
  wire [31:0] FPComplexMultiAdder_1_io_out_Re; // @[FFTDesigns.scala 1839:26]
  wire [31:0] FPComplexMultiAdder_1_io_out_Im; // @[FFTDesigns.scala 1839:26]
  cmplx_adj cmplx_adj ( // @[FFTDesigns.scala 1808:22]
    .io_in_Re(cmplx_adj_io_in_Re),
    .io_in_Im(cmplx_adj_io_in_Im),
    .io_is_neg(cmplx_adj_io_is_neg),
    .io_is_flip(cmplx_adj_io_is_flip),
    .io_out_Re(cmplx_adj_io_out_Re),
    .io_out_Im(cmplx_adj_io_out_Im)
  );
  FPComplexMultiAdder FPComplexMultiAdder ( // @[FFTDesigns.scala 1839:26]
    .clock(FPComplexMultiAdder_clock),
    .reset(FPComplexMultiAdder_reset),
    .io_in_0_Re(FPComplexMultiAdder_io_in_0_Re),
    .io_in_0_Im(FPComplexMultiAdder_io_in_0_Im),
    .io_in_1_Re(FPComplexMultiAdder_io_in_1_Re),
    .io_in_1_Im(FPComplexMultiAdder_io_in_1_Im),
    .io_out_Re(FPComplexMultiAdder_io_out_Re),
    .io_out_Im(FPComplexMultiAdder_io_out_Im)
  );
  FPComplexMultiAdder FPComplexMultiAdder_1 ( // @[FFTDesigns.scala 1839:26]
    .clock(FPComplexMultiAdder_1_clock),
    .reset(FPComplexMultiAdder_1_reset),
    .io_in_0_Re(FPComplexMultiAdder_1_io_in_0_Re),
    .io_in_0_Im(FPComplexMultiAdder_1_io_in_0_Im),
    .io_in_1_Re(FPComplexMultiAdder_1_io_in_1_Re),
    .io_in_1_Im(FPComplexMultiAdder_1_io_in_1_Im),
    .io_out_Re(FPComplexMultiAdder_1_io_out_Re),
    .io_out_Im(FPComplexMultiAdder_1_io_out_Im)
  );
  assign io_out_0_Re = FPComplexMultiAdder_io_out_Re; // @[FFTDesigns.scala 1911:17]
  assign io_out_0_Im = FPComplexMultiAdder_io_out_Im; // @[FFTDesigns.scala 1911:17]
  assign io_out_1_Re = FPComplexMultiAdder_1_io_out_Re; // @[FFTDesigns.scala 1911:17]
  assign io_out_1_Im = FPComplexMultiAdder_1_io_out_Im; // @[FFTDesigns.scala 1911:17]
  assign cmplx_adj_io_in_Re = io_in_1_Re; // @[FFTDesigns.scala 1820:27]
  assign cmplx_adj_io_in_Im = io_in_1_Im; // @[FFTDesigns.scala 1820:27]
  assign cmplx_adj_io_is_neg = 1'h1; // @[FFTDesigns.scala 1822:31]
  assign cmplx_adj_io_is_flip = 1'h0; // @[FFTDesigns.scala 1823:32]
  assign FPComplexMultiAdder_clock = clock;
  assign FPComplexMultiAdder_reset = reset;
  assign FPComplexMultiAdder_io_in_0_Re = io_in_0_Re; // @[FFTDesigns.scala 1891:30]
  assign FPComplexMultiAdder_io_in_0_Im = io_in_0_Im; // @[FFTDesigns.scala 1891:30]
  assign FPComplexMultiAdder_io_in_1_Re = io_in_1_Re; // @[FFTDesigns.scala 1891:30]
  assign FPComplexMultiAdder_io_in_1_Im = io_in_1_Im; // @[FFTDesigns.scala 1891:30]
  assign FPComplexMultiAdder_1_clock = clock;
  assign FPComplexMultiAdder_1_reset = reset;
  assign FPComplexMultiAdder_1_io_in_0_Re = io_in_0_Re; // @[FFTDesigns.scala 1896:32]
  assign FPComplexMultiAdder_1_io_in_0_Im = io_in_0_Im; // @[FFTDesigns.scala 1896:32]
  assign FPComplexMultiAdder_1_io_in_1_Re = cmplx_adj_io_out_Re; // @[FFTDesigns.scala 1818:24 1824:42]
  assign FPComplexMultiAdder_1_io_in_1_Im = cmplx_adj_io_out_Im; // @[FFTDesigns.scala 1818:24 1824:42]
endmodule
module DFT_r_v2(
  input         clock,
  input         reset,
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im
);
  wire  DFT_r_V1_nonregout_clock; // @[FFTDesigns.scala 169:24]
  wire  DFT_r_V1_nonregout_reset; // @[FFTDesigns.scala 169:24]
  wire [31:0] DFT_r_V1_nonregout_io_in_0_Re; // @[FFTDesigns.scala 169:24]
  wire [31:0] DFT_r_V1_nonregout_io_in_0_Im; // @[FFTDesigns.scala 169:24]
  wire [31:0] DFT_r_V1_nonregout_io_in_1_Re; // @[FFTDesigns.scala 169:24]
  wire [31:0] DFT_r_V1_nonregout_io_in_1_Im; // @[FFTDesigns.scala 169:24]
  wire [31:0] DFT_r_V1_nonregout_io_out_0_Re; // @[FFTDesigns.scala 169:24]
  wire [31:0] DFT_r_V1_nonregout_io_out_0_Im; // @[FFTDesigns.scala 169:24]
  wire [31:0] DFT_r_V1_nonregout_io_out_1_Re; // @[FFTDesigns.scala 169:24]
  wire [31:0] DFT_r_V1_nonregout_io_out_1_Im; // @[FFTDesigns.scala 169:24]
  DFT_r_V1_nonregout DFT_r_V1_nonregout ( // @[FFTDesigns.scala 169:24]
    .clock(DFT_r_V1_nonregout_clock),
    .reset(DFT_r_V1_nonregout_reset),
    .io_in_0_Re(DFT_r_V1_nonregout_io_in_0_Re),
    .io_in_0_Im(DFT_r_V1_nonregout_io_in_0_Im),
    .io_in_1_Re(DFT_r_V1_nonregout_io_in_1_Re),
    .io_in_1_Im(DFT_r_V1_nonregout_io_in_1_Im),
    .io_out_0_Re(DFT_r_V1_nonregout_io_out_0_Re),
    .io_out_0_Im(DFT_r_V1_nonregout_io_out_0_Im),
    .io_out_1_Re(DFT_r_V1_nonregout_io_out_1_Re),
    .io_out_1_Im(DFT_r_V1_nonregout_io_out_1_Im)
  );
  assign io_out_0_Re = DFT_r_V1_nonregout_io_out_0_Re; // @[FFTDesigns.scala 171:14]
  assign io_out_0_Im = DFT_r_V1_nonregout_io_out_0_Im; // @[FFTDesigns.scala 171:14]
  assign io_out_1_Re = DFT_r_V1_nonregout_io_out_1_Re; // @[FFTDesigns.scala 171:14]
  assign io_out_1_Im = DFT_r_V1_nonregout_io_out_1_Im; // @[FFTDesigns.scala 171:14]
  assign DFT_r_V1_nonregout_clock = clock;
  assign DFT_r_V1_nonregout_reset = reset;
  assign DFT_r_V1_nonregout_io_in_0_Re = io_in_0_Re; // @[FFTDesigns.scala 170:15]
  assign DFT_r_V1_nonregout_io_in_0_Im = io_in_0_Im; // @[FFTDesigns.scala 170:15]
  assign DFT_r_V1_nonregout_io_in_1_Re = io_in_1_Re; // @[FFTDesigns.scala 170:15]
  assign DFT_r_V1_nonregout_io_in_1_Im = io_in_1_Im; // @[FFTDesigns.scala 170:15]
endmodule
module RAM_Block(
  input         clock,
  input  [1:0]  io_in_raddr,
  input  [1:0]  io_in_waddr,
  input  [31:0] io_in_data_Re,
  input  [31:0] io_in_data_Im,
  input         io_re,
  input         io_wr,
  input         io_en,
  output [31:0] io_out_data_Re,
  output [31:0] io_out_data_Im
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem_0_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_0_Im; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_1_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_1_Im; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_2_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_2_Im; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_3_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_3_Im; // @[FFTDesigns.scala 2659:18]
  wire [31:0] _GEN_17 = 2'h1 == io_in_raddr ? mem_1_Im : mem_0_Im; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_18 = 2'h2 == io_in_raddr ? mem_2_Im : _GEN_17; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_19 = 2'h3 == io_in_raddr ? mem_3_Im : _GEN_18; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_21 = 2'h1 == io_in_raddr ? mem_1_Re : mem_0_Re; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_22 = 2'h2 == io_in_raddr ? mem_2_Re : _GEN_21; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_23 = 2'h3 == io_in_raddr ? mem_3_Re : _GEN_22; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_24 = io_re ? _GEN_19 : 32'h0; // @[FFTDesigns.scala 2664:18 2665:21 2668:24]
  wire [31:0] _GEN_25 = io_re ? _GEN_23 : 32'h0; // @[FFTDesigns.scala 2664:18 2665:21 2667:24]
  assign io_out_data_Re = io_en ? _GEN_25 : 32'h0; // @[FFTDesigns.scala 2660:16 2671:22]
  assign io_out_data_Im = io_en ? _GEN_24 : 32'h0; // @[FFTDesigns.scala 2660:16 2672:22]
  always @(posedge clock) begin
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (2'h0 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_0_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (2'h0 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_0_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (2'h1 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_1_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (2'h1 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_1_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (2'h2 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_2_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (2'h2 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_2_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (2'h3 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_3_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (2'h3 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_3_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  mem_0_Re = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  mem_0_Im = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  mem_1_Re = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  mem_1_Im = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  mem_2_Re = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  mem_2_Im = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  mem_3_Re = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  mem_3_Im = _RAND_7[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PermutationModuleStreamed(
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  input         io_in_config_0,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im
);
  wire  _T = ~io_in_config_0; // @[FFTDesigns.scala 2567:35]
  wire  pms_0 = _T ? 1'h0 : 1'h1; // @[Mux.scala 47:70]
  wire  pms_1 = io_in_config_0 ? 1'h0 : 1'h1; // @[Mux.scala 47:70]
  assign io_out_0_Re = pms_0 ? io_in_1_Re : io_in_0_Re; // @[FFTDesigns.scala 2576:{17,17}]
  assign io_out_0_Im = pms_0 ? io_in_1_Im : io_in_0_Im; // @[FFTDesigns.scala 2576:{17,17}]
  assign io_out_1_Re = pms_1 ? io_in_1_Re : io_in_0_Re; // @[FFTDesigns.scala 2576:{17,17}]
  assign io_out_1_Im = pms_1 ? io_in_1_Im : io_in_0_Im; // @[FFTDesigns.scala 2576:{17,17}]
endmodule
module M0_Config_ROM(
  input        io_in_cnt,
  output [1:0] io_out_0,
  output [1:0] io_out_1
);
  assign io_out_0 = io_in_cnt ? 2'h1 : 2'h0; // @[FFTDesigns.scala 2600:{17,17}]
  assign io_out_1 = io_in_cnt ? 2'h0 : 2'h1; // @[FFTDesigns.scala 2600:{17,17}]
endmodule
module M1_Config_ROM(
  input        io_in_cnt,
  output [1:0] io_out_0,
  output [1:0] io_out_1
);
  assign io_out_0 = io_in_cnt ? 2'h1 : 2'h0; // @[FFTDesigns.scala 2623:{17,17}]
  assign io_out_1 = io_in_cnt ? 2'h0 : 2'h1; // @[FFTDesigns.scala 2623:{17,17}]
endmodule
module Streaming_Permute_Config(
  input   io_in_cnt,
  output  io_out_0
);
  assign io_out_0 = io_in_cnt; // @[FFTDesigns.scala 2646:{17,17}]
endmodule
module PermutationsWithStreaming(
  input         clock,
  input         reset,
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  input         io_in_en_0,
  input         io_in_en_1,
  input         io_in_en_2,
  input         io_in_en_3,
  input         io_in_en_4,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  RAM_Block_clock; // @[FFTDesigns.scala 2334:24]
  wire [1:0] RAM_Block_io_in_raddr; // @[FFTDesigns.scala 2334:24]
  wire [1:0] RAM_Block_io_in_waddr; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_io_in_data_Re; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_io_in_data_Im; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_io_re; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_io_wr; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_io_en; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_io_out_data_Re; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_io_out_data_Im; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_1_clock; // @[FFTDesigns.scala 2334:24]
  wire [1:0] RAM_Block_1_io_in_raddr; // @[FFTDesigns.scala 2334:24]
  wire [1:0] RAM_Block_1_io_in_waddr; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_1_io_in_data_Re; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_1_io_in_data_Im; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_1_io_re; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_1_io_wr; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_1_io_en; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_1_io_out_data_Re; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_1_io_out_data_Im; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_2_clock; // @[FFTDesigns.scala 2338:24]
  wire [1:0] RAM_Block_2_io_in_raddr; // @[FFTDesigns.scala 2338:24]
  wire [1:0] RAM_Block_2_io_in_waddr; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_2_io_in_data_Re; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_2_io_in_data_Im; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_2_io_re; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_2_io_wr; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_2_io_en; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_2_io_out_data_Re; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_2_io_out_data_Im; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_3_clock; // @[FFTDesigns.scala 2338:24]
  wire [1:0] RAM_Block_3_io_in_raddr; // @[FFTDesigns.scala 2338:24]
  wire [1:0] RAM_Block_3_io_in_waddr; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_3_io_in_data_Re; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_3_io_in_data_Im; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_3_io_re; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_3_io_wr; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_3_io_en; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_3_io_out_data_Re; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_3_io_out_data_Im; // @[FFTDesigns.scala 2338:24]
  wire [31:0] PermutationModuleStreamed_io_in_0_Re; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_in_0_Im; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_in_1_Re; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_in_1_Im; // @[FFTDesigns.scala 2341:26]
  wire  PermutationModuleStreamed_io_in_config_0; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_out_0_Re; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_out_0_Im; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_out_1_Re; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_out_1_Im; // @[FFTDesigns.scala 2341:26]
  wire  M0_Config_ROM_io_in_cnt; // @[FFTDesigns.scala 2342:27]
  wire [1:0] M0_Config_ROM_io_out_0; // @[FFTDesigns.scala 2342:27]
  wire [1:0] M0_Config_ROM_io_out_1; // @[FFTDesigns.scala 2342:27]
  wire  M1_Config_ROM_io_in_cnt; // @[FFTDesigns.scala 2343:27]
  wire [1:0] M1_Config_ROM_io_out_0; // @[FFTDesigns.scala 2343:27]
  wire [1:0] M1_Config_ROM_io_out_1; // @[FFTDesigns.scala 2343:27]
  wire  Streaming_Permute_Config_io_in_cnt; // @[FFTDesigns.scala 2344:29]
  wire  Streaming_Permute_Config_io_out_0; // @[FFTDesigns.scala 2344:29]
  reg  offset_switch; // @[FFTDesigns.scala 2327:28]
  wire [4:0] _T = {io_in_en_4,io_in_en_3,io_in_en_2,io_in_en_1,io_in_en_0}; // @[FFTDesigns.scala 2328:19]
  wire  _T_1 = |_T; // @[FFTDesigns.scala 2328:26]
  reg  cnt; // @[FFTDesigns.scala 2345:22]
  wire  _offset_switch_T = ~offset_switch; // @[FFTDesigns.scala 2349:26]
  wire  _GEN_2 = cnt ? ~offset_switch : offset_switch; // @[FFTDesigns.scala 2347:32 2349:23 2352:23]
  wire [2:0] _T_6 = 2'h2 * _offset_switch_T; // @[FFTDesigns.scala 2361:54]
  wire [2:0] _GEN_32 = {{1'd0}, M0_Config_ROM_io_out_0}; // @[FFTDesigns.scala 2361:44]
  wire [2:0] _T_8 = _GEN_32 + _T_6; // @[FFTDesigns.scala 2361:44]
  wire [2:0] _T_9 = 2'h2 * offset_switch; // @[FFTDesigns.scala 2362:41]
  wire [2:0] _GEN_33 = {{2'd0}, cnt}; // @[FFTDesigns.scala 2362:31]
  wire [2:0] _T_11 = _GEN_33 + _T_9; // @[FFTDesigns.scala 2362:31]
  wire [2:0] _T_15 = _GEN_33 + _T_6; // @[FFTDesigns.scala 2364:31]
  wire [2:0] _GEN_35 = {{1'd0}, M1_Config_ROM_io_out_0}; // @[FFTDesigns.scala 2365:44]
  wire [2:0] _T_18 = _GEN_35 + _T_9; // @[FFTDesigns.scala 2365:44]
  wire [2:0] _GEN_36 = {{1'd0}, M0_Config_ROM_io_out_1}; // @[FFTDesigns.scala 2361:44]
  wire [2:0] _T_22 = _GEN_36 + _T_6; // @[FFTDesigns.scala 2361:44]
  wire [2:0] _GEN_39 = {{1'd0}, M1_Config_ROM_io_out_1}; // @[FFTDesigns.scala 2365:44]
  wire [2:0] _T_32 = _GEN_39 + _T_9; // @[FFTDesigns.scala 2365:44]
  wire [2:0] _GEN_6 = _T_1 ? _T_8 : 3'h0; // @[FFTDesigns.scala 2346:30 2361:24 2380:24]
  wire [2:0] _GEN_7 = _T_1 ? _T_11 : 3'h0; // @[FFTDesigns.scala 2346:30 2362:24 2381:24]
  wire [2:0] _GEN_10 = _T_1 ? _T_15 : 3'h0; // @[FFTDesigns.scala 2346:30 2364:24 2383:24]
  wire [2:0] _GEN_11 = _T_1 ? _T_18 : 3'h0; // @[FFTDesigns.scala 2346:30 2365:24 2384:24]
  wire [2:0] _GEN_19 = _T_1 ? _T_22 : 3'h0; // @[FFTDesigns.scala 2346:30 2361:24 2380:24]
  wire [2:0] _GEN_24 = _T_1 ? _T_32 : 3'h0; // @[FFTDesigns.scala 2346:30 2365:24 2384:24]
  RAM_Block RAM_Block ( // @[FFTDesigns.scala 2334:24]
    .clock(RAM_Block_clock),
    .io_in_raddr(RAM_Block_io_in_raddr),
    .io_in_waddr(RAM_Block_io_in_waddr),
    .io_in_data_Re(RAM_Block_io_in_data_Re),
    .io_in_data_Im(RAM_Block_io_in_data_Im),
    .io_re(RAM_Block_io_re),
    .io_wr(RAM_Block_io_wr),
    .io_en(RAM_Block_io_en),
    .io_out_data_Re(RAM_Block_io_out_data_Re),
    .io_out_data_Im(RAM_Block_io_out_data_Im)
  );
  RAM_Block RAM_Block_1 ( // @[FFTDesigns.scala 2334:24]
    .clock(RAM_Block_1_clock),
    .io_in_raddr(RAM_Block_1_io_in_raddr),
    .io_in_waddr(RAM_Block_1_io_in_waddr),
    .io_in_data_Re(RAM_Block_1_io_in_data_Re),
    .io_in_data_Im(RAM_Block_1_io_in_data_Im),
    .io_re(RAM_Block_1_io_re),
    .io_wr(RAM_Block_1_io_wr),
    .io_en(RAM_Block_1_io_en),
    .io_out_data_Re(RAM_Block_1_io_out_data_Re),
    .io_out_data_Im(RAM_Block_1_io_out_data_Im)
  );
  RAM_Block RAM_Block_2 ( // @[FFTDesigns.scala 2338:24]
    .clock(RAM_Block_2_clock),
    .io_in_raddr(RAM_Block_2_io_in_raddr),
    .io_in_waddr(RAM_Block_2_io_in_waddr),
    .io_in_data_Re(RAM_Block_2_io_in_data_Re),
    .io_in_data_Im(RAM_Block_2_io_in_data_Im),
    .io_re(RAM_Block_2_io_re),
    .io_wr(RAM_Block_2_io_wr),
    .io_en(RAM_Block_2_io_en),
    .io_out_data_Re(RAM_Block_2_io_out_data_Re),
    .io_out_data_Im(RAM_Block_2_io_out_data_Im)
  );
  RAM_Block RAM_Block_3 ( // @[FFTDesigns.scala 2338:24]
    .clock(RAM_Block_3_clock),
    .io_in_raddr(RAM_Block_3_io_in_raddr),
    .io_in_waddr(RAM_Block_3_io_in_waddr),
    .io_in_data_Re(RAM_Block_3_io_in_data_Re),
    .io_in_data_Im(RAM_Block_3_io_in_data_Im),
    .io_re(RAM_Block_3_io_re),
    .io_wr(RAM_Block_3_io_wr),
    .io_en(RAM_Block_3_io_en),
    .io_out_data_Re(RAM_Block_3_io_out_data_Re),
    .io_out_data_Im(RAM_Block_3_io_out_data_Im)
  );
  PermutationModuleStreamed PermutationModuleStreamed ( // @[FFTDesigns.scala 2341:26]
    .io_in_0_Re(PermutationModuleStreamed_io_in_0_Re),
    .io_in_0_Im(PermutationModuleStreamed_io_in_0_Im),
    .io_in_1_Re(PermutationModuleStreamed_io_in_1_Re),
    .io_in_1_Im(PermutationModuleStreamed_io_in_1_Im),
    .io_in_config_0(PermutationModuleStreamed_io_in_config_0),
    .io_out_0_Re(PermutationModuleStreamed_io_out_0_Re),
    .io_out_0_Im(PermutationModuleStreamed_io_out_0_Im),
    .io_out_1_Re(PermutationModuleStreamed_io_out_1_Re),
    .io_out_1_Im(PermutationModuleStreamed_io_out_1_Im)
  );
  M0_Config_ROM M0_Config_ROM ( // @[FFTDesigns.scala 2342:27]
    .io_in_cnt(M0_Config_ROM_io_in_cnt),
    .io_out_0(M0_Config_ROM_io_out_0),
    .io_out_1(M0_Config_ROM_io_out_1)
  );
  M1_Config_ROM M1_Config_ROM ( // @[FFTDesigns.scala 2343:27]
    .io_in_cnt(M1_Config_ROM_io_in_cnt),
    .io_out_0(M1_Config_ROM_io_out_0),
    .io_out_1(M1_Config_ROM_io_out_1)
  );
  Streaming_Permute_Config Streaming_Permute_Config ( // @[FFTDesigns.scala 2344:29]
    .io_in_cnt(Streaming_Permute_Config_io_in_cnt),
    .io_out_0(Streaming_Permute_Config_io_out_0)
  );
  assign io_out_0_Re = RAM_Block_2_io_out_data_Re; // @[FFTDesigns.scala 2346:30 2370:19 2389:19]
  assign io_out_0_Im = RAM_Block_2_io_out_data_Im; // @[FFTDesigns.scala 2346:30 2370:19 2389:19]
  assign io_out_1_Re = RAM_Block_3_io_out_data_Re; // @[FFTDesigns.scala 2346:30 2370:19 2389:19]
  assign io_out_1_Im = RAM_Block_3_io_out_data_Im; // @[FFTDesigns.scala 2346:30 2370:19 2389:19]
  assign RAM_Block_clock = clock;
  assign RAM_Block_io_in_raddr = _GEN_6[1:0];
  assign RAM_Block_io_in_waddr = _GEN_7[1:0];
  assign RAM_Block_io_in_data_Re = io_in_0_Re; // @[FFTDesigns.scala 2346:30 2363:23 2382:23]
  assign RAM_Block_io_in_data_Im = io_in_0_Im; // @[FFTDesigns.scala 2346:30 2363:23 2382:23]
  assign RAM_Block_io_re = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_io_wr = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_io_en = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_1_clock = clock;
  assign RAM_Block_1_io_in_raddr = _GEN_19[1:0];
  assign RAM_Block_1_io_in_waddr = _GEN_7[1:0];
  assign RAM_Block_1_io_in_data_Re = io_in_1_Re; // @[FFTDesigns.scala 2346:30 2363:23 2382:23]
  assign RAM_Block_1_io_in_data_Im = io_in_1_Im; // @[FFTDesigns.scala 2346:30 2363:23 2382:23]
  assign RAM_Block_1_io_re = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_1_io_wr = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_1_io_en = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_2_clock = clock;
  assign RAM_Block_2_io_in_raddr = _GEN_10[1:0];
  assign RAM_Block_2_io_in_waddr = _GEN_11[1:0];
  assign RAM_Block_2_io_in_data_Re = PermutationModuleStreamed_io_out_0_Re; // @[FFTDesigns.scala 2346:30 2366:23 2385:23]
  assign RAM_Block_2_io_in_data_Im = PermutationModuleStreamed_io_out_0_Im; // @[FFTDesigns.scala 2346:30 2366:23 2385:23]
  assign RAM_Block_2_io_re = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_2_io_wr = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_2_io_en = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_3_clock = clock;
  assign RAM_Block_3_io_in_raddr = _GEN_10[1:0];
  assign RAM_Block_3_io_in_waddr = _GEN_24[1:0];
  assign RAM_Block_3_io_in_data_Re = PermutationModuleStreamed_io_out_1_Re; // @[FFTDesigns.scala 2346:30 2366:23 2385:23]
  assign RAM_Block_3_io_in_data_Im = PermutationModuleStreamed_io_out_1_Im; // @[FFTDesigns.scala 2346:30 2366:23 2385:23]
  assign RAM_Block_3_io_re = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_3_io_wr = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_3_io_en = |_T; // @[FFTDesigns.scala 2346:26]
  assign PermutationModuleStreamed_io_in_0_Re = RAM_Block_io_out_data_Re; // @[FFTDesigns.scala 2346:30 2368:24 2387:24]
  assign PermutationModuleStreamed_io_in_0_Im = RAM_Block_io_out_data_Im; // @[FFTDesigns.scala 2346:30 2368:24 2387:24]
  assign PermutationModuleStreamed_io_in_1_Re = RAM_Block_1_io_out_data_Re; // @[FFTDesigns.scala 2346:30 2368:24 2387:24]
  assign PermutationModuleStreamed_io_in_1_Im = RAM_Block_1_io_out_data_Im; // @[FFTDesigns.scala 2346:30 2368:24 2387:24]
  assign PermutationModuleStreamed_io_in_config_0 = Streaming_Permute_Config_io_out_0; // @[FFTDesigns.scala 2346:30 2367:31 2386:31]
  assign M0_Config_ROM_io_in_cnt = cnt; // @[FFTDesigns.scala 2394:22]
  assign M1_Config_ROM_io_in_cnt = cnt; // @[FFTDesigns.scala 2395:22]
  assign Streaming_Permute_Config_io_in_cnt = cnt; // @[FFTDesigns.scala 2396:24]
  always @(posedge clock) begin
    offset_switch <= _T_1 & _GEN_2; // @[FFTDesigns.scala 2346:30 2391:21]
    if (reset) begin // @[FFTDesigns.scala 2345:22]
      cnt <= 1'h0; // @[FFTDesigns.scala 2345:22]
    end else if (_T_1) begin // @[FFTDesigns.scala 2346:30]
      if (cnt) begin // @[FFTDesigns.scala 2347:32]
        cnt <= 1'h0; // @[FFTDesigns.scala 2348:13]
      end else begin
        cnt <= cnt + 1'h1; // @[FFTDesigns.scala 2351:13]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  offset_switch = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  cnt = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TwiddleFactorROM(
  input  [1:0]  io_in_addr,
  output [31:0] io_out_data_1_Re,
  output [31:0] io_out_data_1_Im
);
  assign io_out_data_1_Re = io_in_addr[0] ? 32'h248d3131 : 32'h3f800000; // @[FFTDesigns.scala 2058:{25,25}]
  assign io_out_data_1_Im = io_in_addr[0] ? 32'hbf800000 : 32'h80800000; // @[FFTDesigns.scala 2059:{25,25}]
endmodule
module TwiddleFactorsStreamed(
  input         clock,
  input         reset,
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  input         io_in_en_0,
  input         io_in_en_1,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  wire [1:0] TwiddleFactorROM_io_in_addr; // @[FFTDesigns.scala 2072:26]
  wire [31:0] TwiddleFactorROM_io_out_data_1_Re; // @[FFTDesigns.scala 2072:26]
  wire [31:0] TwiddleFactorROM_io_out_data_1_Im; // @[FFTDesigns.scala 2072:26]
  wire [31:0] cmplx_adj_io_in_Re; // @[FFTDesigns.scala 2120:30]
  wire [31:0] cmplx_adj_io_in_Im; // @[FFTDesigns.scala 2120:30]
  wire  cmplx_adj_io_is_neg; // @[FFTDesigns.scala 2120:30]
  wire  cmplx_adj_io_is_flip; // @[FFTDesigns.scala 2120:30]
  wire [31:0] cmplx_adj_io_out_Re; // @[FFTDesigns.scala 2120:30]
  wire [31:0] cmplx_adj_io_out_Im; // @[FFTDesigns.scala 2120:30]
  wire [31:0] cmplx_adj_1_io_in_Re; // @[FFTDesigns.scala 2120:30]
  wire [31:0] cmplx_adj_1_io_in_Im; // @[FFTDesigns.scala 2120:30]
  wire  cmplx_adj_1_io_is_neg; // @[FFTDesigns.scala 2120:30]
  wire  cmplx_adj_1_io_is_flip; // @[FFTDesigns.scala 2120:30]
  wire [31:0] cmplx_adj_1_io_out_Re; // @[FFTDesigns.scala 2120:30]
  wire [31:0] cmplx_adj_1_io_out_Im; // @[FFTDesigns.scala 2120:30]
  reg  cnt; // @[FFTDesigns.scala 2113:24]
  wire [1:0] _T = {io_in_en_1,io_in_en_0}; // @[FFTDesigns.scala 2114:21]
  wire  _T_1 = |_T; // @[FFTDesigns.scala 2114:28]
  wire  _GEN_1 = cnt ? 1'h0 : cnt + 1'h1; // @[FFTDesigns.scala 2124:34 2125:15 2127:15]
  wire  _GEN_8 = TwiddleFactorROM_io_out_data_1_Re[30:0] == 31'h3f800000 ? 1'h0 : 1'h1; // @[FFTDesigns.scala 2132:92 2133:36 2140:36]
  wire  _GEN_9 = TwiddleFactorROM_io_out_data_1_Re[30:0] == 31'h3f800000 ? TwiddleFactorROM_io_out_data_1_Re[31] :
    TwiddleFactorROM_io_out_data_1_Im[31]; // @[FFTDesigns.scala 2132:92]
  wire  _GEN_10 = _T_1 & _GEN_1; // @[FFTDesigns.scala 2123:32 2149:13]
  reg [31:0] result_regs_0_0_Re; // @[FFTDesigns.scala 2157:32]
  reg [31:0] result_regs_0_0_Im; // @[FFTDesigns.scala 2157:32]
  reg [31:0] result_regs_0_1_Re; // @[FFTDesigns.scala 2157:32]
  reg [31:0] result_regs_0_1_Im; // @[FFTDesigns.scala 2157:32]
  reg [31:0] result_regs_1_0_Re; // @[FFTDesigns.scala 2157:32]
  reg [31:0] result_regs_1_0_Im; // @[FFTDesigns.scala 2157:32]
  reg [31:0] result_regs_1_1_Re; // @[FFTDesigns.scala 2157:32]
  reg [31:0] result_regs_1_1_Im; // @[FFTDesigns.scala 2157:32]
  TwiddleFactorROM TwiddleFactorROM ( // @[FFTDesigns.scala 2072:26]
    .io_in_addr(TwiddleFactorROM_io_in_addr),
    .io_out_data_1_Re(TwiddleFactorROM_io_out_data_1_Re),
    .io_out_data_1_Im(TwiddleFactorROM_io_out_data_1_Im)
  );
  cmplx_adj cmplx_adj ( // @[FFTDesigns.scala 2120:30]
    .io_in_Re(cmplx_adj_io_in_Re),
    .io_in_Im(cmplx_adj_io_in_Im),
    .io_is_neg(cmplx_adj_io_is_neg),
    .io_is_flip(cmplx_adj_io_is_flip),
    .io_out_Re(cmplx_adj_io_out_Re),
    .io_out_Im(cmplx_adj_io_out_Im)
  );
  cmplx_adj cmplx_adj_1 ( // @[FFTDesigns.scala 2120:30]
    .io_in_Re(cmplx_adj_1_io_in_Re),
    .io_in_Im(cmplx_adj_1_io_in_Im),
    .io_is_neg(cmplx_adj_1_io_is_neg),
    .io_is_flip(cmplx_adj_1_io_is_flip),
    .io_out_Re(cmplx_adj_1_io_out_Re),
    .io_out_Im(cmplx_adj_1_io_out_Im)
  );
  assign io_out_0_Re = result_regs_1_0_Re; // @[FFTDesigns.scala 2167:14]
  assign io_out_0_Im = result_regs_1_0_Im; // @[FFTDesigns.scala 2167:14]
  assign io_out_1_Re = result_regs_1_1_Re; // @[FFTDesigns.scala 2167:14]
  assign io_out_1_Im = result_regs_1_1_Im; // @[FFTDesigns.scala 2167:14]
  assign TwiddleFactorROM_io_in_addr = {{1'd0}, cnt}; // @[FFTDesigns.scala 2168:24]
  assign cmplx_adj_io_in_Re = _T_1 ? io_in_0_Re : 32'h0; // @[FFTDesigns.scala 2123:32 2130:29 2151:29]
  assign cmplx_adj_io_in_Im = _T_1 ? io_in_0_Im : 32'h0; // @[FFTDesigns.scala 2123:32 2130:29 2151:29]
  assign cmplx_adj_io_is_neg = 1'h0; // @[FFTDesigns.scala 2123:32 2154:33]
  assign cmplx_adj_io_is_flip = 1'h0; // @[FFTDesigns.scala 2123:32 2153:34]
  assign cmplx_adj_1_io_in_Re = _T_1 ? io_in_1_Re : 32'h0; // @[FFTDesigns.scala 2123:32 2130:29 2151:29]
  assign cmplx_adj_1_io_in_Im = _T_1 ? io_in_1_Im : 32'h0; // @[FFTDesigns.scala 2123:32 2130:29 2151:29]
  assign cmplx_adj_1_io_is_neg = _T_1 & _GEN_9; // @[FFTDesigns.scala 2123:32 2154:33]
  assign cmplx_adj_1_io_is_flip = _T_1 & _GEN_8; // @[FFTDesigns.scala 2123:32 2153:34]
  always @(posedge clock) begin
    if (reset) begin // @[FFTDesigns.scala 2113:24]
      cnt <= 1'h0; // @[FFTDesigns.scala 2113:24]
    end else begin
      cnt <= _GEN_10;
    end
    if (reset) begin // @[FFTDesigns.scala 2157:32]
      result_regs_0_0_Re <= 32'h0; // @[FFTDesigns.scala 2157:32]
    end else begin
      result_regs_0_0_Re <= cmplx_adj_io_out_Re; // @[FFTDesigns.scala 2161:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2157:32]
      result_regs_0_0_Im <= 32'h0; // @[FFTDesigns.scala 2157:32]
    end else begin
      result_regs_0_0_Im <= cmplx_adj_io_out_Im; // @[FFTDesigns.scala 2161:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2157:32]
      result_regs_0_1_Re <= 32'h0; // @[FFTDesigns.scala 2157:32]
    end else begin
      result_regs_0_1_Re <= cmplx_adj_1_io_out_Re; // @[FFTDesigns.scala 2161:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2157:32]
      result_regs_0_1_Im <= 32'h0; // @[FFTDesigns.scala 2157:32]
    end else begin
      result_regs_0_1_Im <= cmplx_adj_1_io_out_Im; // @[FFTDesigns.scala 2161:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2157:32]
      result_regs_1_0_Re <= 32'h0; // @[FFTDesigns.scala 2157:32]
    end else begin
      result_regs_1_0_Re <= result_regs_0_0_Re; // @[FFTDesigns.scala 2164:26]
    end
    if (reset) begin // @[FFTDesigns.scala 2157:32]
      result_regs_1_0_Im <= 32'h0; // @[FFTDesigns.scala 2157:32]
    end else begin
      result_regs_1_0_Im <= result_regs_0_0_Im; // @[FFTDesigns.scala 2164:26]
    end
    if (reset) begin // @[FFTDesigns.scala 2157:32]
      result_regs_1_1_Re <= 32'h0; // @[FFTDesigns.scala 2157:32]
    end else begin
      result_regs_1_1_Re <= result_regs_0_1_Re; // @[FFTDesigns.scala 2164:26]
    end
    if (reset) begin // @[FFTDesigns.scala 2157:32]
      result_regs_1_1_Im <= 32'h0; // @[FFTDesigns.scala 2157:32]
    end else begin
      result_regs_1_1_Im <= result_regs_0_1_Im; // @[FFTDesigns.scala 2164:26]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cnt = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  result_regs_0_0_Re = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  result_regs_0_0_Im = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  result_regs_0_1_Re = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  result_regs_0_1_Im = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  result_regs_1_0_Re = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  result_regs_1_0_Im = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  result_regs_1_1_Re = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  result_regs_1_1_Im = _RAND_8[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE

end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FFT_422_streaming(
  input         clock,
  input         reset,
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  input         io_in_ready,
  output        io_out_validate,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im
  //output [31:0] io_out_test_0_Re,
  //output [31:0] io_out_test_0_Im,
  //output [31:0] io_out_test_1_Re,
  //output [31:0] io_out_test_1_Im
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
`endif // RANDOMIZE_REG_INIT
  wire  DFT_r_v2_clock; // @[FFTDesigns.scala 3669:30]
  wire  DFT_r_v2_reset; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_io_in_0_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_io_in_0_Im; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_io_in_1_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_io_in_1_Im; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_io_out_0_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_io_out_0_Im; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_io_out_1_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_io_out_1_Im; // @[FFTDesigns.scala 3669:30]
  wire  DFT_r_v2_1_clock; // @[FFTDesigns.scala 3669:30]
  wire  DFT_r_v2_1_reset; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_1_io_in_0_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_1_io_in_0_Im; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_1_io_in_1_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_1_io_in_1_Im; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_1_io_out_0_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_1_io_out_0_Im; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_1_io_out_1_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_1_io_out_1_Im; // @[FFTDesigns.scala 3669:30]
  wire  PermutationsWithStreaming_clock; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_reset; // @[FFTDesigns.scala 3676:30]
  wire [31:0] PermutationsWithStreaming_io_in_0_Re; // @[FFTDesigns.scala 3676:30]
  wire [31:0] PermutationsWithStreaming_io_in_0_Im; // @[FFTDesigns.scala 3676:30]
  wire [31:0] PermutationsWithStreaming_io_in_1_Re; // @[FFTDesigns.scala 3676:30]
  wire [31:0] PermutationsWithStreaming_io_in_1_Im; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_0; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_1; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_2; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_3; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_4; // @[FFTDesigns.scala 3676:30]
  wire [31:0] PermutationsWithStreaming_io_out_0_Re; // @[FFTDesigns.scala 3676:30]
  wire [31:0] PermutationsWithStreaming_io_out_0_Im; // @[FFTDesigns.scala 3676:30]
  wire [31:0] PermutationsWithStreaming_io_out_1_Re; // @[FFTDesigns.scala 3676:30]
  wire [31:0] PermutationsWithStreaming_io_out_1_Im; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_1_clock; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_reset; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_1_io_in_0_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_1_io_in_0_Im; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_1_io_in_1_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_1_io_in_1_Im; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_0; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_1; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_2; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_3; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_4; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_1_io_out_0_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_1_io_out_0_Im; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_1_io_out_1_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_1_io_out_1_Im; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_clock; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_reset; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_2_io_in_0_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_2_io_in_0_Im; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_2_io_in_1_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_2_io_in_1_Im; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_0; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_1; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_2; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_3; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_4; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_2_io_out_0_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_2_io_out_0_Im; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_2_io_out_1_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_2_io_out_1_Im; // @[FFTDesigns.scala 3679:30]
  wire  TwiddleFactorsStreamed_clock; // @[FFTDesigns.scala 3684:28]
  wire  TwiddleFactorsStreamed_reset; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_io_in_0_Re; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_io_in_0_Im; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_io_in_1_Re; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_io_in_1_Im; // @[FFTDesigns.scala 3684:28]
  wire  TwiddleFactorsStreamed_io_in_en_0; // @[FFTDesigns.scala 3684:28]
  wire  TwiddleFactorsStreamed_io_in_en_1; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_io_out_0_Re; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_io_out_0_Im; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_io_out_1_Re; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_io_out_1_Im; // @[FFTDesigns.scala 3684:28]
  reg  DFT_regdelays_0_0; // @[FFTDesigns.scala 3663:32]
  reg  DFT_regdelays_1_0; // @[FFTDesigns.scala 3663:32]
  reg  Twid_regdelays_0_0; // @[FFTDesigns.scala 3664:33]
  reg  Twid_regdelays_0_1; // @[FFTDesigns.scala 3664:33]
  reg  Perm_regdelays_0_0; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_0_1; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_0_2; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_0_3; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_0; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_1; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_2; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_3; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_0; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_1; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_2; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_3; // @[FFTDesigns.scala 3665:33]
  reg  out_regdelay; // @[FFTDesigns.scala 3666:31]
  reg [31:0] results_0_Re; // @[FFTDesigns.scala 3753:26]
  reg [31:0] results_0_Im; // @[FFTDesigns.scala 3753:26]
  reg [31:0] results_1_Re; // @[FFTDesigns.scala 3753:26]
  reg [31:0] results_1_Im; // @[FFTDesigns.scala 3753:26]
  DFT_r_v2 DFT_r_v2 ( // @[FFTDesigns.scala 3669:30]
    .clock(DFT_r_v2_clock),
    .reset(DFT_r_v2_reset),
    .io_in_0_Re(DFT_r_v2_io_in_0_Re),
    .io_in_0_Im(DFT_r_v2_io_in_0_Im),
    .io_in_1_Re(DFT_r_v2_io_in_1_Re),
    .io_in_1_Im(DFT_r_v2_io_in_1_Im),
    .io_out_0_Re(DFT_r_v2_io_out_0_Re),
    .io_out_0_Im(DFT_r_v2_io_out_0_Im),
    .io_out_1_Re(DFT_r_v2_io_out_1_Re),
    .io_out_1_Im(DFT_r_v2_io_out_1_Im)
  );
  DFT_r_v2 DFT_r_v2_1 ( // @[FFTDesigns.scala 3669:30]
    .clock(DFT_r_v2_1_clock),
    .reset(DFT_r_v2_1_reset),
    .io_in_0_Re(DFT_r_v2_1_io_in_0_Re),
    .io_in_0_Im(DFT_r_v2_1_io_in_0_Im),
    .io_in_1_Re(DFT_r_v2_1_io_in_1_Re),
    .io_in_1_Im(DFT_r_v2_1_io_in_1_Im),
    .io_out_0_Re(DFT_r_v2_1_io_out_0_Re),
    .io_out_0_Im(DFT_r_v2_1_io_out_0_Im),
    .io_out_1_Re(DFT_r_v2_1_io_out_1_Re),
    .io_out_1_Im(DFT_r_v2_1_io_out_1_Im)
  );
  PermutationsWithStreaming PermutationsWithStreaming ( // @[FFTDesigns.scala 3676:30]
    .clock(PermutationsWithStreaming_clock),
    .reset(PermutationsWithStreaming_reset),
    .io_in_0_Re(PermutationsWithStreaming_io_in_0_Re),
    .io_in_0_Im(PermutationsWithStreaming_io_in_0_Im),
    .io_in_1_Re(PermutationsWithStreaming_io_in_1_Re),
    .io_in_1_Im(PermutationsWithStreaming_io_in_1_Im),
    .io_in_en_0(PermutationsWithStreaming_io_in_en_0),
    .io_in_en_1(PermutationsWithStreaming_io_in_en_1),
    .io_in_en_2(PermutationsWithStreaming_io_in_en_2),
    .io_in_en_3(PermutationsWithStreaming_io_in_en_3),
    .io_in_en_4(PermutationsWithStreaming_io_in_en_4),
    .io_out_0_Re(PermutationsWithStreaming_io_out_0_Re),
    .io_out_0_Im(PermutationsWithStreaming_io_out_0_Im),
    .io_out_1_Re(PermutationsWithStreaming_io_out_1_Re),
    .io_out_1_Im(PermutationsWithStreaming_io_out_1_Im)
  );
  PermutationsWithStreaming PermutationsWithStreaming_1 ( // @[FFTDesigns.scala 3679:30]
    .clock(PermutationsWithStreaming_1_clock),
    .reset(PermutationsWithStreaming_1_reset),
    .io_in_0_Re(PermutationsWithStreaming_1_io_in_0_Re),
    .io_in_0_Im(PermutationsWithStreaming_1_io_in_0_Im),
    .io_in_1_Re(PermutationsWithStreaming_1_io_in_1_Re),
    .io_in_1_Im(PermutationsWithStreaming_1_io_in_1_Im),
    .io_in_en_0(PermutationsWithStreaming_1_io_in_en_0),
    .io_in_en_1(PermutationsWithStreaming_1_io_in_en_1),
    .io_in_en_2(PermutationsWithStreaming_1_io_in_en_2),
    .io_in_en_3(PermutationsWithStreaming_1_io_in_en_3),
    .io_in_en_4(PermutationsWithStreaming_1_io_in_en_4),
    .io_out_0_Re(PermutationsWithStreaming_1_io_out_0_Re),
    .io_out_0_Im(PermutationsWithStreaming_1_io_out_0_Im),
    .io_out_1_Re(PermutationsWithStreaming_1_io_out_1_Re),
    .io_out_1_Im(PermutationsWithStreaming_1_io_out_1_Im)
  );
  PermutationsWithStreaming PermutationsWithStreaming_2 ( // @[FFTDesigns.scala 3679:30]
    .clock(PermutationsWithStreaming_2_clock),
    .reset(PermutationsWithStreaming_2_reset),
    .io_in_0_Re(PermutationsWithStreaming_2_io_in_0_Re),
    .io_in_0_Im(PermutationsWithStreaming_2_io_in_0_Im),
    .io_in_1_Re(PermutationsWithStreaming_2_io_in_1_Re),
    .io_in_1_Im(PermutationsWithStreaming_2_io_in_1_Im),
    .io_in_en_0(PermutationsWithStreaming_2_io_in_en_0),
    .io_in_en_1(PermutationsWithStreaming_2_io_in_en_1),
    .io_in_en_2(PermutationsWithStreaming_2_io_in_en_2),
    .io_in_en_3(PermutationsWithStreaming_2_io_in_en_3),
    .io_in_en_4(PermutationsWithStreaming_2_io_in_en_4),
    .io_out_0_Re(PermutationsWithStreaming_2_io_out_0_Re),
    .io_out_0_Im(PermutationsWithStreaming_2_io_out_0_Im),
    .io_out_1_Re(PermutationsWithStreaming_2_io_out_1_Re),
    .io_out_1_Im(PermutationsWithStreaming_2_io_out_1_Im)
  );
  TwiddleFactorsStreamed TwiddleFactorsStreamed ( // @[FFTDesigns.scala 3684:28]
    .clock(TwiddleFactorsStreamed_clock),
    .reset(TwiddleFactorsStreamed_reset),
    .io_in_0_Re(TwiddleFactorsStreamed_io_in_0_Re),
    .io_in_0_Im(TwiddleFactorsStreamed_io_in_0_Im),
    .io_in_1_Re(TwiddleFactorsStreamed_io_in_1_Re),
    .io_in_1_Im(TwiddleFactorsStreamed_io_in_1_Im),
    .io_in_en_0(TwiddleFactorsStreamed_io_in_en_0),
    .io_in_en_1(TwiddleFactorsStreamed_io_in_en_1),
    .io_out_0_Re(TwiddleFactorsStreamed_io_out_0_Re),
    .io_out_0_Im(TwiddleFactorsStreamed_io_out_0_Im),
    .io_out_1_Re(TwiddleFactorsStreamed_io_out_1_Re),
    .io_out_1_Im(TwiddleFactorsStreamed_io_out_1_Im)
  );
  assign io_out_validate = out_regdelay; // @[FFTDesigns.scala 3762:21]
  assign io_out_0_Re = results_0_Re; // @[FFTDesigns.scala 3763:12]
  assign io_out_0_Im = results_0_Im; // @[FFTDesigns.scala 3763:12]
  assign io_out_1_Re = results_1_Re; // @[FFTDesigns.scala 3763:12]
  assign io_out_1_Im = results_1_Im; // @[FFTDesigns.scala 3763:12]
  assign io_out_test_0_Re = PermutationsWithStreaming_io_out_0_Re; // @[FFTDesigns.scala 3764:17]
  assign io_out_test_0_Im = PermutationsWithStreaming_io_out_0_Im; // @[FFTDesigns.scala 3764:17]
  assign io_out_test_1_Re = PermutationsWithStreaming_io_out_1_Re; // @[FFTDesigns.scala 3764:17]
  assign io_out_test_1_Im = PermutationsWithStreaming_io_out_1_Im; // @[FFTDesigns.scala 3764:17]
  assign DFT_r_v2_clock = clock;
  assign DFT_r_v2_reset = reset;
  assign DFT_r_v2_io_in_0_Re = PermutationsWithStreaming_io_out_0_Re; // @[FFTDesigns.scala 3719:41]
  assign DFT_r_v2_io_in_0_Im = PermutationsWithStreaming_io_out_0_Im; // @[FFTDesigns.scala 3719:41]
  assign DFT_r_v2_io_in_1_Re = PermutationsWithStreaming_io_out_1_Re; // @[FFTDesigns.scala 3719:41]
  assign DFT_r_v2_io_in_1_Im = PermutationsWithStreaming_io_out_1_Im; // @[FFTDesigns.scala 3719:41]
  assign DFT_r_v2_1_clock = clock;
  assign DFT_r_v2_1_reset = reset;
  assign DFT_r_v2_1_io_in_0_Re = TwiddleFactorsStreamed_io_out_0_Re; // @[FFTDesigns.scala 3726:41]
  assign DFT_r_v2_1_io_in_0_Im = TwiddleFactorsStreamed_io_out_0_Im; // @[FFTDesigns.scala 3726:41]
  assign DFT_r_v2_1_io_in_1_Re = TwiddleFactorsStreamed_io_out_1_Re; // @[FFTDesigns.scala 3726:41]
  assign DFT_r_v2_1_io_in_1_Im = TwiddleFactorsStreamed_io_out_1_Im; // @[FFTDesigns.scala 3726:41]
  assign PermutationsWithStreaming_clock = clock;
  assign PermutationsWithStreaming_reset = reset;
  assign PermutationsWithStreaming_io_in_0_Re = io_in_0_Re; // @[FFTDesigns.scala 3693:32]
  assign PermutationsWithStreaming_io_in_0_Im = io_in_0_Im; // @[FFTDesigns.scala 3693:32]
  assign PermutationsWithStreaming_io_in_1_Re = io_in_1_Re; // @[FFTDesigns.scala 3693:32]
  assign PermutationsWithStreaming_io_in_1_Im = io_in_1_Im; // @[FFTDesigns.scala 3693:32]
  assign PermutationsWithStreaming_io_in_en_0 = io_in_ready; // @[FFTDesigns.scala 3692:38]
  assign PermutationsWithStreaming_io_in_en_1 = Perm_regdelays_0_0; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_io_in_en_2 = Perm_regdelays_0_1; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_io_in_en_3 = Perm_regdelays_0_2; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_io_in_en_4 = Perm_regdelays_0_3; // @[FFTDesigns.scala 3707:44]
  assign PermutationsWithStreaming_1_clock = clock;
  assign PermutationsWithStreaming_1_reset = reset;
  assign PermutationsWithStreaming_1_io_in_0_Re = DFT_r_v2_io_out_0_Re; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_1_io_in_0_Im = DFT_r_v2_io_out_0_Im; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_1_io_in_1_Re = DFT_r_v2_io_out_1_Re; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_1_io_in_1_Im = DFT_r_v2_io_out_1_Im; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_1_io_in_en_0 = DFT_regdelays_0_0; // @[FFTDesigns.scala 3696:38]
  assign PermutationsWithStreaming_1_io_in_en_1 = Perm_regdelays_1_0; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_1_io_in_en_2 = Perm_regdelays_1_1; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_1_io_in_en_3 = Perm_regdelays_1_2; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_1_io_in_en_4 = Perm_regdelays_1_3; // @[FFTDesigns.scala 3707:44]
  assign PermutationsWithStreaming_2_clock = clock;
  assign PermutationsWithStreaming_2_reset = reset;
  assign PermutationsWithStreaming_2_io_in_0_Re = DFT_r_v2_1_io_out_0_Re; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_2_io_in_0_Im = DFT_r_v2_1_io_out_0_Im; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_2_io_in_1_Re = DFT_r_v2_1_io_out_1_Re; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_2_io_in_1_Im = DFT_r_v2_1_io_out_1_Im; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_2_io_in_en_0 = DFT_regdelays_1_0; // @[FFTDesigns.scala 3696:38]
  assign PermutationsWithStreaming_2_io_in_en_1 = Perm_regdelays_2_0; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_2_io_in_en_2 = Perm_regdelays_2_1; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_2_io_in_en_3 = Perm_regdelays_2_2; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_2_io_in_en_4 = Perm_regdelays_2_3; // @[FFTDesigns.scala 3707:44]
  assign TwiddleFactorsStreamed_clock = clock;
  assign TwiddleFactorsStreamed_reset = reset;
  assign TwiddleFactorsStreamed_io_in_0_Re = PermutationsWithStreaming_1_io_out_0_Re; // @[FFTDesigns.scala 3741:32]
  assign TwiddleFactorsStreamed_io_in_0_Im = PermutationsWithStreaming_1_io_out_0_Im; // @[FFTDesigns.scala 3741:32]
  assign TwiddleFactorsStreamed_io_in_1_Re = PermutationsWithStreaming_1_io_out_1_Re; // @[FFTDesigns.scala 3741:32]
  assign TwiddleFactorsStreamed_io_in_1_Im = PermutationsWithStreaming_1_io_out_1_Im; // @[FFTDesigns.scala 3741:32]
  assign TwiddleFactorsStreamed_io_in_en_0 = Perm_regdelays_1_3; // @[FFTDesigns.scala 3740:38]
  assign TwiddleFactorsStreamed_io_in_en_1 = Twid_regdelays_0_0; // @[FFTDesigns.scala 3749:36]
  always @(posedge clock) begin
    if (reset) begin // @[FFTDesigns.scala 3663:32]
      DFT_regdelays_0_0 <= 1'h0; // @[FFTDesigns.scala 3663:32]
    end else begin
      DFT_regdelays_0_0 <= Perm_regdelays_0_3; // @[FFTDesigns.scala 3716:33]
    end
    if (reset) begin // @[FFTDesigns.scala 3663:32]
      DFT_regdelays_1_0 <= 1'h0; // @[FFTDesigns.scala 3663:32]
    end else begin
      DFT_regdelays_1_0 <= Twid_regdelays_0_1; // @[FFTDesigns.scala 3723:33]
    end
    if (reset) begin // @[FFTDesigns.scala 3664:33]
      Twid_regdelays_0_0 <= 1'h0; // @[FFTDesigns.scala 3664:33]
    end else begin
      Twid_regdelays_0_0 <= Perm_regdelays_1_3; // @[FFTDesigns.scala 3739:34]
    end
    if (reset) begin // @[FFTDesigns.scala 3664:33]
      Twid_regdelays_0_1 <= 1'h0; // @[FFTDesigns.scala 3664:33]
    end else begin
      Twid_regdelays_0_1 <= Twid_regdelays_0_0; // @[FFTDesigns.scala 3748:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_0_0 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_0_0 <= io_in_ready; // @[FFTDesigns.scala 3691:34]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_0_1 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_0_1 <= Perm_regdelays_0_0; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_0_2 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_0_2 <= Perm_regdelays_0_1; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_0_3 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_0_3 <= Perm_regdelays_0_2; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_1_0 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_1_0 <= DFT_regdelays_0_0; // @[FFTDesigns.scala 3695:34]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_1_1 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_1_1 <= Perm_regdelays_1_0; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_1_2 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_1_2 <= Perm_regdelays_1_1; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_1_3 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_1_3 <= Perm_regdelays_1_2; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_2_0 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_2_0 <= DFT_regdelays_1_0; // @[FFTDesigns.scala 3695:34]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_2_1 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_2_1 <= Perm_regdelays_2_0; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_2_2 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_2_2 <= Perm_regdelays_2_1; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_2_3 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_2_3 <= Perm_regdelays_2_2; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3666:31]
      out_regdelay <= 1'h0; // @[FFTDesigns.scala 3666:31]
    end else begin
      out_regdelay <= Perm_regdelays_2_3; // @[FFTDesigns.scala 3761:18]
    end
    if (reset) begin // @[FFTDesigns.scala 3753:26]
      results_0_Re <= 32'h0; // @[FFTDesigns.scala 3753:26]
    end else if (Perm_regdelays_2_3) begin // @[FFTDesigns.scala 3754:59]
      results_0_Re <= PermutationsWithStreaming_2_io_out_0_Re; // @[FFTDesigns.scala 3755:15]
    end else begin
      results_0_Re <= 32'h0; // @[FFTDesigns.scala 3758:20]
    end
    if (reset) begin // @[FFTDesigns.scala 3753:26]
      results_0_Im <= 32'h0; // @[FFTDesigns.scala 3753:26]
    end else if (Perm_regdelays_2_3) begin // @[FFTDesigns.scala 3754:59]
      results_0_Im <= PermutationsWithStreaming_2_io_out_0_Im; // @[FFTDesigns.scala 3755:15]
    end else begin
      results_0_Im <= 32'h0; // @[FFTDesigns.scala 3758:20]
    end
    if (reset) begin // @[FFTDesigns.scala 3753:26]
      results_1_Re <= 32'h0; // @[FFTDesigns.scala 3753:26]
    end else if (Perm_regdelays_2_3) begin // @[FFTDesigns.scala 3754:59]
      results_1_Re <= PermutationsWithStreaming_2_io_out_1_Re; // @[FFTDesigns.scala 3755:15]
    end else begin
      results_1_Re <= 32'h0; // @[FFTDesigns.scala 3758:20]
    end
    if (reset) begin // @[FFTDesigns.scala 3753:26]
      results_1_Im <= 32'h0; // @[FFTDesigns.scala 3753:26]
    end else if (Perm_regdelays_2_3) begin // @[FFTDesigns.scala 3754:59]
      results_1_Im <= PermutationsWithStreaming_2_io_out_1_Im; // @[FFTDesigns.scala 3755:15]
    end else begin
      results_1_Im <= 32'h0; // @[FFTDesigns.scala 3758:20]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  DFT_regdelays_0_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  DFT_regdelays_1_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  Twid_regdelays_0_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  Twid_regdelays_0_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  Perm_regdelays_0_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  Perm_regdelays_0_1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  Perm_regdelays_0_2 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  Perm_regdelays_0_3 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  Perm_regdelays_1_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  Perm_regdelays_1_1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  Perm_regdelays_1_2 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  Perm_regdelays_1_3 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  Perm_regdelays_2_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  Perm_regdelays_2_1 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  Perm_regdelays_2_2 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  Perm_regdelays_2_3 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  out_regdelay = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  results_0_Re = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  results_0_Im = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  results_1_Re = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  results_1_Im = _RAND_20[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
