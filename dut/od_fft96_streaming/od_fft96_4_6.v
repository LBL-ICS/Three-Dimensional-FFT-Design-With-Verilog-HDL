module cmplx_adj(
  input  [31:0] io_in_Re,
  input  [31:0] io_in_Im,
  input  [7:0]  io_in_adj,
  input         io_is_neg,
  input         io_is_flip,
  output [31:0] io_out_Re,
  output [31:0] io_out_Im
);
  wire  sign_0 = io_in_Re[31]; // @[FFTDesigns.scala 4716:24]
  wire  sign_1 = io_in_Im[31]; // @[FFTDesigns.scala 4717:24]
  wire [7:0] exp_0 = io_in_Re[30:23]; // @[FFTDesigns.scala 4719:23]
  wire [7:0] exp_1 = io_in_Im[30:23]; // @[FFTDesigns.scala 4720:23]
  wire [22:0] frac_0 = io_in_Re[22:0]; // @[FFTDesigns.scala 4722:24]
  wire [22:0] frac_1 = io_in_Im[22:0]; // @[FFTDesigns.scala 4723:24]
  wire  new_sign_0 = io_is_neg ? ~sign_0 : sign_0; // @[FFTDesigns.scala 4725:20 4726:19 4729:19]
  wire  new_sign_1 = io_is_neg ? ~sign_1 : sign_1; // @[FFTDesigns.scala 4725:20 4727:19 4730:19]
  wire [7:0] _new_exp_0_T_1 = exp_0 - io_in_adj; // @[FFTDesigns.scala 4734:28]
  wire [7:0] new_exp_0 = exp_0 != 8'h0 ? _new_exp_0_T_1 : exp_0; // @[FFTDesigns.scala 4733:25 4734:18 4736:18]
  wire [7:0] _new_exp_1_T_1 = exp_1 - io_in_adj; // @[FFTDesigns.scala 4739:28]
  wire [7:0] new_exp_1 = exp_1 != 8'h0 ? _new_exp_1_T_1 : exp_1; // @[FFTDesigns.scala 4738:26 4739:18 4741:18]
  wire  _io_out_Re_T = ~new_sign_1; // @[FFTDesigns.scala 4745:21]
  wire [31:0] _io_out_Re_T_2 = {_io_out_Re_T,new_exp_1,frac_1}; // @[FFTDesigns.scala 4745:49]
  wire [31:0] _io_out_Im_T_1 = {new_sign_0,new_exp_0,frac_0}; // @[FFTDesigns.scala 4746:48]
  wire [31:0] _io_out_Im_T_3 = {new_sign_1,new_exp_1,frac_1}; // @[FFTDesigns.scala 4749:48]
  assign io_out_Re = io_is_flip ? _io_out_Re_T_2 : _io_out_Im_T_1; // @[FFTDesigns.scala 4744:21 4745:17 4748:17]
  assign io_out_Im = io_is_flip ? _io_out_Im_T_1 : _io_out_Im_T_3; // @[FFTDesigns.scala 4744:21 4746:17 4749:17]
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
  wire  FPComplexAdder_clock; // @[FPComplex.scala 524:30]
  wire  FPComplexAdder_reset; // @[FPComplex.scala 524:30]
  wire [31:0] FPComplexAdder_io_in_a_Re; // @[FPComplex.scala 524:30]
  wire [31:0] FPComplexAdder_io_in_a_Im; // @[FPComplex.scala 524:30]
  wire [31:0] FPComplexAdder_io_in_b_Re; // @[FPComplex.scala 524:30]
  wire [31:0] FPComplexAdder_io_in_b_Im; // @[FPComplex.scala 524:30]
  wire [31:0] FPComplexAdder_io_out_s_Re; // @[FPComplex.scala 524:30]
  wire [31:0] FPComplexAdder_io_out_s_Im; // @[FPComplex.scala 524:30]
  FPComplexAdder FPComplexAdder ( // @[FPComplex.scala 524:30]
    .clock(FPComplexAdder_clock),
    .reset(FPComplexAdder_reset),
    .io_in_a_Re(FPComplexAdder_io_in_a_Re),
    .io_in_a_Im(FPComplexAdder_io_in_a_Im),
    .io_in_b_Re(FPComplexAdder_io_in_b_Re),
    .io_in_b_Im(FPComplexAdder_io_in_b_Im),
    .io_out_s_Re(FPComplexAdder_io_out_s_Re),
    .io_out_s_Im(FPComplexAdder_io_out_s_Im)
  );
  assign io_out_Re = FPComplexAdder_io_out_s_Re; // @[FPComplex.scala 642:16]
  assign io_out_Im = FPComplexAdder_io_out_s_Im; // @[FPComplex.scala 642:16]
  assign FPComplexAdder_clock = clock;
  assign FPComplexAdder_reset = reset;
  assign FPComplexAdder_io_in_a_Re = io_in_0_Re; // @[FPComplex.scala 604:42]
  assign FPComplexAdder_io_in_a_Im = io_in_0_Im; // @[FPComplex.scala 604:42]
  assign FPComplexAdder_io_in_b_Re = io_in_1_Re; // @[FPComplex.scala 605:42]
  assign FPComplexAdder_io_in_b_Im = io_in_1_Im; // @[FPComplex.scala 605:42]
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
  wire [7:0] cmplx_adj_io_in_adj; // @[FFTDesigns.scala 1808:22]
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
    .io_in_adj(cmplx_adj_io_in_adj),
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
  assign cmplx_adj_io_in_adj = 8'h0; // @[FFTDesigns.scala 1821:31]
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
  input  [3:0]  io_in_raddr,
  input  [3:0]  io_in_waddr,
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
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem_0_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_0_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_1_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_1_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_2_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_2_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_3_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_3_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_4_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_4_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_5_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_5_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_6_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_6_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_7_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_7_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_8_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_8_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_9_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_9_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_10_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_10_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_11_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_11_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_12_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_12_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_13_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_13_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_14_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_14_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_15_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_15_Im; // @[FFTDesigns.scala 3286:18]
  wire [31:0] _GEN_65 = 4'h1 == io_in_raddr ? mem_1_Im : mem_0_Im; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_66 = 4'h2 == io_in_raddr ? mem_2_Im : _GEN_65; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_67 = 4'h3 == io_in_raddr ? mem_3_Im : _GEN_66; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_68 = 4'h4 == io_in_raddr ? mem_4_Im : _GEN_67; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_69 = 4'h5 == io_in_raddr ? mem_5_Im : _GEN_68; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_70 = 4'h6 == io_in_raddr ? mem_6_Im : _GEN_69; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_71 = 4'h7 == io_in_raddr ? mem_7_Im : _GEN_70; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_72 = 4'h8 == io_in_raddr ? mem_8_Im : _GEN_71; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_73 = 4'h9 == io_in_raddr ? mem_9_Im : _GEN_72; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_74 = 4'ha == io_in_raddr ? mem_10_Im : _GEN_73; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_75 = 4'hb == io_in_raddr ? mem_11_Im : _GEN_74; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_76 = 4'hc == io_in_raddr ? mem_12_Im : _GEN_75; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_77 = 4'hd == io_in_raddr ? mem_13_Im : _GEN_76; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_78 = 4'he == io_in_raddr ? mem_14_Im : _GEN_77; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_79 = 4'hf == io_in_raddr ? mem_15_Im : _GEN_78; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_81 = 4'h1 == io_in_raddr ? mem_1_Re : mem_0_Re; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_82 = 4'h2 == io_in_raddr ? mem_2_Re : _GEN_81; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_83 = 4'h3 == io_in_raddr ? mem_3_Re : _GEN_82; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_84 = 4'h4 == io_in_raddr ? mem_4_Re : _GEN_83; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_85 = 4'h5 == io_in_raddr ? mem_5_Re : _GEN_84; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_86 = 4'h6 == io_in_raddr ? mem_6_Re : _GEN_85; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_87 = 4'h7 == io_in_raddr ? mem_7_Re : _GEN_86; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_88 = 4'h8 == io_in_raddr ? mem_8_Re : _GEN_87; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_89 = 4'h9 == io_in_raddr ? mem_9_Re : _GEN_88; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_90 = 4'ha == io_in_raddr ? mem_10_Re : _GEN_89; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_91 = 4'hb == io_in_raddr ? mem_11_Re : _GEN_90; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_92 = 4'hc == io_in_raddr ? mem_12_Re : _GEN_91; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_93 = 4'hd == io_in_raddr ? mem_13_Re : _GEN_92; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_94 = 4'he == io_in_raddr ? mem_14_Re : _GEN_93; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_95 = 4'hf == io_in_raddr ? mem_15_Re : _GEN_94; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_96 = io_re ? _GEN_79 : 32'h0; // @[FFTDesigns.scala 3291:18 3292:21 3295:24]
  wire [31:0] _GEN_97 = io_re ? _GEN_95 : 32'h0; // @[FFTDesigns.scala 3291:18 3292:21 3294:24]
  assign io_out_data_Re = io_en ? _GEN_97 : 32'h0; // @[FFTDesigns.scala 3287:16 3298:22]
  assign io_out_data_Im = io_en ? _GEN_96 : 32'h0; // @[FFTDesigns.scala 3287:16 3299:22]
  always @(posedge clock) begin
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'h0 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_0_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'h0 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_0_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'h1 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_1_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'h1 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_1_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'h2 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_2_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'h2 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_2_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'h3 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_3_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'h3 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_3_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'h4 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_4_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'h4 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_4_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'h5 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_5_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'h5 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_5_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'h6 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_6_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'h6 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_6_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'h7 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_7_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'h7 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_7_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'h8 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_8_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'h8 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_8_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'h9 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_9_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'h9 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_9_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'ha == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_10_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'ha == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_10_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'hb == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_11_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'hb == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_11_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'hc == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_12_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'hc == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_12_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'hd == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_13_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'hd == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_13_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'he == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_14_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'he == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_14_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'hf == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_15_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (4'hf == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_15_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
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
  _RAND_8 = {1{`RANDOM}};
  mem_4_Re = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  mem_4_Im = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  mem_5_Re = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  mem_5_Im = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  mem_6_Re = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  mem_6_Im = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  mem_7_Re = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  mem_7_Im = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  mem_8_Re = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  mem_8_Im = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  mem_9_Re = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  mem_9_Im = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  mem_10_Re = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  mem_10_Im = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  mem_11_Re = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  mem_11_Im = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  mem_12_Re = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  mem_12_Im = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  mem_13_Re = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  mem_13_Im = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  mem_14_Re = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  mem_14_Im = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  mem_15_Re = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  mem_15_Im = _RAND_31[31:0];
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
  input  [31:0] io_in_2_Re,
  input  [31:0] io_in_2_Im,
  input  [31:0] io_in_3_Re,
  input  [31:0] io_in_3_Im,
  input  [1:0]  io_in_config_0,
  input  [1:0]  io_in_config_1,
  input  [1:0]  io_in_config_2,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im,
  output [31:0] io_out_2_Re,
  output [31:0] io_out_2_Im,
  output [31:0] io_out_3_Re,
  output [31:0] io_out_3_Im
);
  wire  _T = io_in_config_0 == 2'h0; // @[FFTDesigns.scala 3194:35]
  wire  _T_1 = io_in_config_1 == 2'h0; // @[FFTDesigns.scala 3194:35]
  wire  _T_2 = io_in_config_2 == 2'h0; // @[FFTDesigns.scala 3194:35]
  wire  _T_4 = io_in_config_0 == 2'h1; // @[FFTDesigns.scala 3194:35]
  wire  _T_5 = io_in_config_1 == 2'h1; // @[FFTDesigns.scala 3194:35]
  wire  _T_6 = io_in_config_2 == 2'h1; // @[FFTDesigns.scala 3194:35]
  wire  _T_8 = io_in_config_0 == 2'h2; // @[FFTDesigns.scala 3194:35]
  wire  _T_9 = io_in_config_1 == 2'h2; // @[FFTDesigns.scala 3194:35]
  wire  _T_10 = io_in_config_2 == 2'h2; // @[FFTDesigns.scala 3194:35]
  wire  _T_12 = io_in_config_0 == 2'h3; // @[FFTDesigns.scala 3194:35]
  wire  _T_13 = io_in_config_1 == 2'h3; // @[FFTDesigns.scala 3194:35]
  wire  _T_14 = io_in_config_2 == 2'h3; // @[FFTDesigns.scala 3194:35]
  wire [1:0] _pms_pmx_T = _T_2 ? 2'h2 : 2'h3; // @[Mux.scala 47:70]
  wire [1:0] _pms_pmx_T_1 = _T_1 ? 2'h1 : _pms_pmx_T; // @[Mux.scala 47:70]
  wire [1:0] pms_0 = _T ? 2'h0 : _pms_pmx_T_1; // @[Mux.scala 47:70]
  wire [1:0] _pms_pmx_T_2 = _T_6 ? 2'h2 : 2'h3; // @[Mux.scala 47:70]
  wire [1:0] _pms_pmx_T_3 = _T_5 ? 2'h1 : _pms_pmx_T_2; // @[Mux.scala 47:70]
  wire [1:0] pms_1 = _T_4 ? 2'h0 : _pms_pmx_T_3; // @[Mux.scala 47:70]
  wire [1:0] _pms_pmx_T_4 = _T_10 ? 2'h2 : 2'h3; // @[Mux.scala 47:70]
  wire [1:0] _pms_pmx_T_5 = _T_9 ? 2'h1 : _pms_pmx_T_4; // @[Mux.scala 47:70]
  wire [1:0] pms_2 = _T_8 ? 2'h0 : _pms_pmx_T_5; // @[Mux.scala 47:70]
  wire [1:0] _pms_pmx_T_6 = _T_14 ? 2'h2 : 2'h3; // @[Mux.scala 47:70]
  wire [1:0] _pms_pmx_T_7 = _T_13 ? 2'h1 : _pms_pmx_T_6; // @[Mux.scala 47:70]
  wire [1:0] pms_3 = _T_12 ? 2'h0 : _pms_pmx_T_7; // @[Mux.scala 47:70]
  wire [31:0] _GEN_1 = 2'h1 == pms_0 ? io_in_1_Im : io_in_0_Im; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_2 = 2'h2 == pms_0 ? io_in_2_Im : _GEN_1; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_5 = 2'h1 == pms_0 ? io_in_1_Re : io_in_0_Re; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_6 = 2'h2 == pms_0 ? io_in_2_Re : _GEN_5; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_9 = 2'h1 == pms_1 ? io_in_1_Im : io_in_0_Im; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_10 = 2'h2 == pms_1 ? io_in_2_Im : _GEN_9; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_13 = 2'h1 == pms_1 ? io_in_1_Re : io_in_0_Re; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_14 = 2'h2 == pms_1 ? io_in_2_Re : _GEN_13; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_17 = 2'h1 == pms_2 ? io_in_1_Im : io_in_0_Im; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_18 = 2'h2 == pms_2 ? io_in_2_Im : _GEN_17; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_21 = 2'h1 == pms_2 ? io_in_1_Re : io_in_0_Re; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_22 = 2'h2 == pms_2 ? io_in_2_Re : _GEN_21; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_25 = 2'h1 == pms_3 ? io_in_1_Im : io_in_0_Im; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_26 = 2'h2 == pms_3 ? io_in_2_Im : _GEN_25; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_29 = 2'h1 == pms_3 ? io_in_1_Re : io_in_0_Re; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_30 = 2'h2 == pms_3 ? io_in_2_Re : _GEN_29; // @[FFTDesigns.scala 3203:{17,17}]
  assign io_out_0_Re = 2'h3 == pms_0 ? io_in_3_Re : _GEN_6; // @[FFTDesigns.scala 3203:{17,17}]
  assign io_out_0_Im = 2'h3 == pms_0 ? io_in_3_Im : _GEN_2; // @[FFTDesigns.scala 3203:{17,17}]
  assign io_out_1_Re = 2'h3 == pms_1 ? io_in_3_Re : _GEN_14; // @[FFTDesigns.scala 3203:{17,17}]
  assign io_out_1_Im = 2'h3 == pms_1 ? io_in_3_Im : _GEN_10; // @[FFTDesigns.scala 3203:{17,17}]
  assign io_out_2_Re = 2'h3 == pms_2 ? io_in_3_Re : _GEN_22; // @[FFTDesigns.scala 3203:{17,17}]
  assign io_out_2_Im = 2'h3 == pms_2 ? io_in_3_Im : _GEN_18; // @[FFTDesigns.scala 3203:{17,17}]
  assign io_out_3_Re = 2'h3 == pms_3 ? io_in_3_Re : _GEN_30; // @[FFTDesigns.scala 3203:{17,17}]
  assign io_out_3_Im = 2'h3 == pms_3 ? io_in_3_Im : _GEN_26; // @[FFTDesigns.scala 3203:{17,17}]
endmodule
module M0_Config_ROM(
  input  [2:0] io_in_cnt,
  output [3:0] io_out_0,
  output [3:0] io_out_1,
  output [3:0] io_out_2,
  output [3:0] io_out_3
);
  wire [3:0] _GEN_1 = 3'h1 == io_in_cnt ? 4'h1 : 4'h0; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_2 = 3'h2 == io_in_cnt ? 4'h2 : _GEN_1; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_3 = 3'h3 == io_in_cnt ? 4'h3 : _GEN_2; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_4 = 3'h4 == io_in_cnt ? 4'h4 : _GEN_3; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_5 = 3'h5 == io_in_cnt ? 4'h5 : _GEN_4; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_6 = 3'h6 == io_in_cnt ? 4'h6 : _GEN_5; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_9 = 3'h1 == io_in_cnt ? 4'h3 : 4'h2; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_10 = 3'h2 == io_in_cnt ? 4'h4 : _GEN_9; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_11 = 3'h3 == io_in_cnt ? 4'h5 : _GEN_10; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_12 = 3'h4 == io_in_cnt ? 4'h6 : _GEN_11; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_13 = 3'h5 == io_in_cnt ? 4'h7 : _GEN_12; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_14 = 3'h6 == io_in_cnt ? 4'h0 : _GEN_13; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_17 = 3'h1 == io_in_cnt ? 4'h5 : 4'h4; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_18 = 3'h2 == io_in_cnt ? 4'h6 : _GEN_17; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_19 = 3'h3 == io_in_cnt ? 4'h7 : _GEN_18; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_20 = 3'h4 == io_in_cnt ? 4'h0 : _GEN_19; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_21 = 3'h5 == io_in_cnt ? 4'h1 : _GEN_20; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_22 = 3'h6 == io_in_cnt ? 4'h2 : _GEN_21; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_25 = 3'h1 == io_in_cnt ? 4'h7 : 4'h6; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_26 = 3'h2 == io_in_cnt ? 4'h0 : _GEN_25; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_27 = 3'h3 == io_in_cnt ? 4'h1 : _GEN_26; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_28 = 3'h4 == io_in_cnt ? 4'h2 : _GEN_27; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_29 = 3'h5 == io_in_cnt ? 4'h3 : _GEN_28; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_30 = 3'h6 == io_in_cnt ? 4'h4 : _GEN_29; // @[FFTDesigns.scala 3227:{17,17}]
  assign io_out_0 = 3'h7 == io_in_cnt ? 4'h7 : _GEN_6; // @[FFTDesigns.scala 3227:{17,17}]
  assign io_out_1 = 3'h7 == io_in_cnt ? 4'h1 : _GEN_14; // @[FFTDesigns.scala 3227:{17,17}]
  assign io_out_2 = 3'h7 == io_in_cnt ? 4'h3 : _GEN_22; // @[FFTDesigns.scala 3227:{17,17}]
  assign io_out_3 = 3'h7 == io_in_cnt ? 4'h5 : _GEN_30; // @[FFTDesigns.scala 3227:{17,17}]
endmodule
module M1_Config_ROM(
  input  [2:0] io_in_cnt,
  output [3:0] io_out_0,
  output [3:0] io_out_1,
  output [3:0] io_out_2,
  output [3:0] io_out_3
);
  wire [3:0] _GEN_1 = 3'h1 == io_in_cnt ? 4'h1 : 4'h0; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_2 = 3'h2 == io_in_cnt ? 4'h6 : _GEN_1; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_3 = 3'h3 == io_in_cnt ? 4'h7 : _GEN_2; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_4 = 3'h4 == io_in_cnt ? 4'h2 : _GEN_3; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_5 = 3'h5 == io_in_cnt ? 4'h3 : _GEN_4; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_6 = 3'h6 == io_in_cnt ? 4'h4 : _GEN_5; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_9 = 3'h1 == io_in_cnt ? 4'h3 : 4'h2; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_10 = 3'h2 == io_in_cnt ? 4'h4 : _GEN_9; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_11 = 3'h3 == io_in_cnt ? 4'h5 : _GEN_10; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_12 = 3'h4 == io_in_cnt ? 4'h0 : _GEN_11; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_13 = 3'h5 == io_in_cnt ? 4'h1 : _GEN_12; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_14 = 3'h6 == io_in_cnt ? 4'h6 : _GEN_13; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_17 = 3'h1 == io_in_cnt ? 4'h5 : 4'h4; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_18 = 3'h2 == io_in_cnt ? 4'h0 : _GEN_17; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_19 = 3'h3 == io_in_cnt ? 4'h1 : _GEN_18; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_20 = 3'h4 == io_in_cnt ? 4'h6 : _GEN_19; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_21 = 3'h5 == io_in_cnt ? 4'h7 : _GEN_20; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_22 = 3'h6 == io_in_cnt ? 4'h2 : _GEN_21; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_25 = 3'h1 == io_in_cnt ? 4'h7 : 4'h6; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_26 = 3'h2 == io_in_cnt ? 4'h2 : _GEN_25; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_27 = 3'h3 == io_in_cnt ? 4'h3 : _GEN_26; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_28 = 3'h4 == io_in_cnt ? 4'h4 : _GEN_27; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_29 = 3'h5 == io_in_cnt ? 4'h5 : _GEN_28; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_30 = 3'h6 == io_in_cnt ? 4'h0 : _GEN_29; // @[FFTDesigns.scala 3250:{17,17}]
  assign io_out_0 = 3'h7 == io_in_cnt ? 4'h5 : _GEN_6; // @[FFTDesigns.scala 3250:{17,17}]
  assign io_out_1 = 3'h7 == io_in_cnt ? 4'h7 : _GEN_14; // @[FFTDesigns.scala 3250:{17,17}]
  assign io_out_2 = 3'h7 == io_in_cnt ? 4'h3 : _GEN_22; // @[FFTDesigns.scala 3250:{17,17}]
  assign io_out_3 = 3'h7 == io_in_cnt ? 4'h1 : _GEN_30; // @[FFTDesigns.scala 3250:{17,17}]
endmodule
module Streaming_Permute_Config(
  input  [2:0] io_in_cnt,
  output [1:0] io_out_0,
  output [1:0] io_out_1,
  output [1:0] io_out_2
);
  wire [1:0] _GEN_2 = 3'h2 == io_in_cnt ? 2'h2 : 2'h0; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_3 = 3'h3 == io_in_cnt ? 2'h2 : _GEN_2; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_4 = 3'h4 == io_in_cnt ? 2'h1 : _GEN_3; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_5 = 3'h5 == io_in_cnt ? 2'h1 : _GEN_4; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_6 = 3'h6 == io_in_cnt ? 2'h3 : _GEN_5; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_10 = 3'h2 == io_in_cnt ? 2'h1 : 2'h2; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_11 = 3'h3 == io_in_cnt ? 2'h1 : _GEN_10; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_12 = 3'h4 == io_in_cnt ? 2'h3 : _GEN_11; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_13 = 3'h5 == io_in_cnt ? 2'h3 : _GEN_12; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_14 = 3'h6 == io_in_cnt ? 2'h0 : _GEN_13; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_18 = 3'h2 == io_in_cnt ? 2'h3 : 2'h1; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_19 = 3'h3 == io_in_cnt ? 2'h3 : _GEN_18; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_20 = 3'h4 == io_in_cnt ? 2'h0 : _GEN_19; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_21 = 3'h5 == io_in_cnt ? 2'h0 : _GEN_20; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_22 = 3'h6 == io_in_cnt ? 2'h2 : _GEN_21; // @[FFTDesigns.scala 3273:{17,17}]
  assign io_out_0 = 3'h7 == io_in_cnt ? 2'h3 : _GEN_6; // @[FFTDesigns.scala 3273:{17,17}]
  assign io_out_1 = 3'h7 == io_in_cnt ? 2'h0 : _GEN_14; // @[FFTDesigns.scala 3273:{17,17}]
  assign io_out_2 = 3'h7 == io_in_cnt ? 2'h2 : _GEN_22; // @[FFTDesigns.scala 3273:{17,17}]
endmodule
module PermutationsWithStreaming(
  input         clock,
  input         reset,
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  input  [31:0] io_in_2_Re,
  input  [31:0] io_in_2_Im,
  input  [31:0] io_in_3_Re,
  input  [31:0] io_in_3_Im,
  input         io_in_en_0,
  input         io_in_en_1,
  input         io_in_en_2,
  input         io_in_en_3,
  input         io_in_en_4,
  input         io_in_en_5,
  input         io_in_en_6,
  input         io_in_en_7,
  input         io_in_en_8,
  input         io_in_en_9,
  input         io_in_en_10,
  input         io_in_en_11,
  input         io_in_en_12,
  input         io_in_en_13,
  input         io_in_en_14,
  input         io_in_en_15,
  input         io_in_en_16,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im,
  output [31:0] io_out_2_Re,
  output [31:0] io_out_2_Im,
  output [31:0] io_out_3_Re,
  output [31:0] io_out_3_Im
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  RAM_Block_clock; // @[FFTDesigns.scala 2634:24]
  wire [3:0] RAM_Block_io_in_raddr; // @[FFTDesigns.scala 2634:24]
  wire [3:0] RAM_Block_io_in_waddr; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_io_in_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_io_in_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_io_re; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_io_wr; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_io_en; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_io_out_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_io_out_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_1_clock; // @[FFTDesigns.scala 2634:24]
  wire [3:0] RAM_Block_1_io_in_raddr; // @[FFTDesigns.scala 2634:24]
  wire [3:0] RAM_Block_1_io_in_waddr; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_1_io_in_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_1_io_in_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_1_io_re; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_1_io_wr; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_1_io_en; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_1_io_out_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_1_io_out_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_2_clock; // @[FFTDesigns.scala 2634:24]
  wire [3:0] RAM_Block_2_io_in_raddr; // @[FFTDesigns.scala 2634:24]
  wire [3:0] RAM_Block_2_io_in_waddr; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_2_io_in_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_2_io_in_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_2_io_re; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_2_io_wr; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_2_io_en; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_2_io_out_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_2_io_out_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_3_clock; // @[FFTDesigns.scala 2634:24]
  wire [3:0] RAM_Block_3_io_in_raddr; // @[FFTDesigns.scala 2634:24]
  wire [3:0] RAM_Block_3_io_in_waddr; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_3_io_in_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_3_io_in_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_3_io_re; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_3_io_wr; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_3_io_en; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_3_io_out_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_3_io_out_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_4_clock; // @[FFTDesigns.scala 2638:24]
  wire [3:0] RAM_Block_4_io_in_raddr; // @[FFTDesigns.scala 2638:24]
  wire [3:0] RAM_Block_4_io_in_waddr; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_4_io_in_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_4_io_in_data_Im; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_4_io_re; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_4_io_wr; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_4_io_en; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_4_io_out_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_4_io_out_data_Im; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_5_clock; // @[FFTDesigns.scala 2638:24]
  wire [3:0] RAM_Block_5_io_in_raddr; // @[FFTDesigns.scala 2638:24]
  wire [3:0] RAM_Block_5_io_in_waddr; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_5_io_in_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_5_io_in_data_Im; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_5_io_re; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_5_io_wr; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_5_io_en; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_5_io_out_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_5_io_out_data_Im; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_6_clock; // @[FFTDesigns.scala 2638:24]
  wire [3:0] RAM_Block_6_io_in_raddr; // @[FFTDesigns.scala 2638:24]
  wire [3:0] RAM_Block_6_io_in_waddr; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_6_io_in_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_6_io_in_data_Im; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_6_io_re; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_6_io_wr; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_6_io_en; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_6_io_out_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_6_io_out_data_Im; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_7_clock; // @[FFTDesigns.scala 2638:24]
  wire [3:0] RAM_Block_7_io_in_raddr; // @[FFTDesigns.scala 2638:24]
  wire [3:0] RAM_Block_7_io_in_waddr; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_7_io_in_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_7_io_in_data_Im; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_7_io_re; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_7_io_wr; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_7_io_en; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_7_io_out_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_7_io_out_data_Im; // @[FFTDesigns.scala 2638:24]
  wire [31:0] PermutationModuleStreamed_io_in_0_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_in_0_Im; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_in_1_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_in_1_Im; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_in_2_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_in_2_Im; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_in_3_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_in_3_Im; // @[FFTDesigns.scala 2641:26]
  wire [1:0] PermutationModuleStreamed_io_in_config_0; // @[FFTDesigns.scala 2641:26]
  wire [1:0] PermutationModuleStreamed_io_in_config_1; // @[FFTDesigns.scala 2641:26]
  wire [1:0] PermutationModuleStreamed_io_in_config_2; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_0_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_0_Im; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_1_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_1_Im; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_2_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_2_Im; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_3_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_3_Im; // @[FFTDesigns.scala 2641:26]
  wire [2:0] M0_Config_ROM_io_in_cnt; // @[FFTDesigns.scala 2642:27]
  wire [3:0] M0_Config_ROM_io_out_0; // @[FFTDesigns.scala 2642:27]
  wire [3:0] M0_Config_ROM_io_out_1; // @[FFTDesigns.scala 2642:27]
  wire [3:0] M0_Config_ROM_io_out_2; // @[FFTDesigns.scala 2642:27]
  wire [3:0] M0_Config_ROM_io_out_3; // @[FFTDesigns.scala 2642:27]
  wire [2:0] M1_Config_ROM_io_in_cnt; // @[FFTDesigns.scala 2643:27]
  wire [3:0] M1_Config_ROM_io_out_0; // @[FFTDesigns.scala 2643:27]
  wire [3:0] M1_Config_ROM_io_out_1; // @[FFTDesigns.scala 2643:27]
  wire [3:0] M1_Config_ROM_io_out_2; // @[FFTDesigns.scala 2643:27]
  wire [3:0] M1_Config_ROM_io_out_3; // @[FFTDesigns.scala 2643:27]
  wire [2:0] Streaming_Permute_Config_io_in_cnt; // @[FFTDesigns.scala 2644:29]
  wire [1:0] Streaming_Permute_Config_io_out_0; // @[FFTDesigns.scala 2644:29]
  wire [1:0] Streaming_Permute_Config_io_out_1; // @[FFTDesigns.scala 2644:29]
  wire [1:0] Streaming_Permute_Config_io_out_2; // @[FFTDesigns.scala 2644:29]
  reg  offset_switch; // @[FFTDesigns.scala 2627:28]
  wire [7:0] lo = {io_in_en_7,io_in_en_6,io_in_en_5,io_in_en_4,io_in_en_3,io_in_en_2,io_in_en_1,io_in_en_0}; // @[FFTDesigns.scala 2628:19]
  wire [16:0] _T = {io_in_en_16,io_in_en_15,io_in_en_14,io_in_en_13,io_in_en_12,io_in_en_11,io_in_en_10,io_in_en_9,
    io_in_en_8,lo}; // @[FFTDesigns.scala 2628:19]
  wire  _T_1 = |_T; // @[FFTDesigns.scala 2628:26]
  reg [2:0] cnt; // @[FFTDesigns.scala 2645:22]
  wire  _offset_switch_T = ~offset_switch; // @[FFTDesigns.scala 2649:26]
  wire [2:0] _cnt_T_1 = cnt + 3'h1; // @[FFTDesigns.scala 2651:20]
  wire  _GEN_2 = cnt == 3'h7 ? ~offset_switch : offset_switch; // @[FFTDesigns.scala 2647:32 2649:23 2652:23]
  wire [4:0] _T_6 = 4'h8 * _offset_switch_T; // @[FFTDesigns.scala 2661:54]
  wire [4:0] _GEN_58 = {{1'd0}, M0_Config_ROM_io_out_0}; // @[FFTDesigns.scala 2661:44]
  wire [4:0] _T_8 = _GEN_58 + _T_6; // @[FFTDesigns.scala 2661:44]
  wire [4:0] _T_9 = 4'h8 * offset_switch; // @[FFTDesigns.scala 2662:41]
  wire [4:0] _GEN_59 = {{2'd0}, cnt}; // @[FFTDesigns.scala 2662:31]
  wire [4:0] _T_11 = _GEN_59 + _T_9; // @[FFTDesigns.scala 2662:31]
  wire [4:0] _T_15 = _GEN_59 + _T_6; // @[FFTDesigns.scala 2664:31]
  wire [4:0] _GEN_61 = {{1'd0}, M1_Config_ROM_io_out_0}; // @[FFTDesigns.scala 2665:44]
  wire [4:0] _T_18 = _GEN_61 + _T_9; // @[FFTDesigns.scala 2665:44]
  wire [4:0] _GEN_62 = {{1'd0}, M0_Config_ROM_io_out_1}; // @[FFTDesigns.scala 2661:44]
  wire [4:0] _T_22 = _GEN_62 + _T_6; // @[FFTDesigns.scala 2661:44]
  wire [4:0] _GEN_65 = {{1'd0}, M1_Config_ROM_io_out_1}; // @[FFTDesigns.scala 2665:44]
  wire [4:0] _T_32 = _GEN_65 + _T_9; // @[FFTDesigns.scala 2665:44]
  wire [4:0] _GEN_66 = {{1'd0}, M0_Config_ROM_io_out_2}; // @[FFTDesigns.scala 2661:44]
  wire [4:0] _T_36 = _GEN_66 + _T_6; // @[FFTDesigns.scala 2661:44]
  wire [4:0] _GEN_69 = {{1'd0}, M1_Config_ROM_io_out_2}; // @[FFTDesigns.scala 2665:44]
  wire [4:0] _T_46 = _GEN_69 + _T_9; // @[FFTDesigns.scala 2665:44]
  wire [4:0] _GEN_70 = {{1'd0}, M0_Config_ROM_io_out_3}; // @[FFTDesigns.scala 2661:44]
  wire [4:0] _T_50 = _GEN_70 + _T_6; // @[FFTDesigns.scala 2661:44]
  wire [4:0] _GEN_73 = {{1'd0}, M1_Config_ROM_io_out_3}; // @[FFTDesigns.scala 2665:44]
  wire [4:0] _T_60 = _GEN_73 + _T_9; // @[FFTDesigns.scala 2665:44]
  wire [4:0] _GEN_6 = _T_1 ? _T_8 : 5'h0; // @[FFTDesigns.scala 2646:30 2661:24 2680:24]
  wire [4:0] _GEN_7 = _T_1 ? _T_11 : 5'h0; // @[FFTDesigns.scala 2646:30 2662:24 2681:24]
  wire [4:0] _GEN_10 = _T_1 ? _T_15 : 5'h0; // @[FFTDesigns.scala 2646:30 2664:24 2683:24]
  wire [4:0] _GEN_11 = _T_1 ? _T_18 : 5'h0; // @[FFTDesigns.scala 2646:30 2665:24 2684:24]
  wire [4:0] _GEN_19 = _T_1 ? _T_22 : 5'h0; // @[FFTDesigns.scala 2646:30 2661:24 2680:24]
  wire [4:0] _GEN_24 = _T_1 ? _T_32 : 5'h0; // @[FFTDesigns.scala 2646:30 2665:24 2684:24]
  wire [4:0] _GEN_32 = _T_1 ? _T_36 : 5'h0; // @[FFTDesigns.scala 2646:30 2661:24 2680:24]
  wire [4:0] _GEN_37 = _T_1 ? _T_46 : 5'h0; // @[FFTDesigns.scala 2646:30 2665:24 2684:24]
  wire [4:0] _GEN_45 = _T_1 ? _T_50 : 5'h0; // @[FFTDesigns.scala 2646:30 2661:24 2680:24]
  wire [4:0] _GEN_50 = _T_1 ? _T_60 : 5'h0; // @[FFTDesigns.scala 2646:30 2665:24 2684:24]
  RAM_Block RAM_Block ( // @[FFTDesigns.scala 2634:24]
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
  RAM_Block RAM_Block_1 ( // @[FFTDesigns.scala 2634:24]
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
  RAM_Block RAM_Block_2 ( // @[FFTDesigns.scala 2634:24]
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
  RAM_Block RAM_Block_3 ( // @[FFTDesigns.scala 2634:24]
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
  RAM_Block RAM_Block_4 ( // @[FFTDesigns.scala 2638:24]
    .clock(RAM_Block_4_clock),
    .io_in_raddr(RAM_Block_4_io_in_raddr),
    .io_in_waddr(RAM_Block_4_io_in_waddr),
    .io_in_data_Re(RAM_Block_4_io_in_data_Re),
    .io_in_data_Im(RAM_Block_4_io_in_data_Im),
    .io_re(RAM_Block_4_io_re),
    .io_wr(RAM_Block_4_io_wr),
    .io_en(RAM_Block_4_io_en),
    .io_out_data_Re(RAM_Block_4_io_out_data_Re),
    .io_out_data_Im(RAM_Block_4_io_out_data_Im)
  );
  RAM_Block RAM_Block_5 ( // @[FFTDesigns.scala 2638:24]
    .clock(RAM_Block_5_clock),
    .io_in_raddr(RAM_Block_5_io_in_raddr),
    .io_in_waddr(RAM_Block_5_io_in_waddr),
    .io_in_data_Re(RAM_Block_5_io_in_data_Re),
    .io_in_data_Im(RAM_Block_5_io_in_data_Im),
    .io_re(RAM_Block_5_io_re),
    .io_wr(RAM_Block_5_io_wr),
    .io_en(RAM_Block_5_io_en),
    .io_out_data_Re(RAM_Block_5_io_out_data_Re),
    .io_out_data_Im(RAM_Block_5_io_out_data_Im)
  );
  RAM_Block RAM_Block_6 ( // @[FFTDesigns.scala 2638:24]
    .clock(RAM_Block_6_clock),
    .io_in_raddr(RAM_Block_6_io_in_raddr),
    .io_in_waddr(RAM_Block_6_io_in_waddr),
    .io_in_data_Re(RAM_Block_6_io_in_data_Re),
    .io_in_data_Im(RAM_Block_6_io_in_data_Im),
    .io_re(RAM_Block_6_io_re),
    .io_wr(RAM_Block_6_io_wr),
    .io_en(RAM_Block_6_io_en),
    .io_out_data_Re(RAM_Block_6_io_out_data_Re),
    .io_out_data_Im(RAM_Block_6_io_out_data_Im)
  );
  RAM_Block RAM_Block_7 ( // @[FFTDesigns.scala 2638:24]
    .clock(RAM_Block_7_clock),
    .io_in_raddr(RAM_Block_7_io_in_raddr),
    .io_in_waddr(RAM_Block_7_io_in_waddr),
    .io_in_data_Re(RAM_Block_7_io_in_data_Re),
    .io_in_data_Im(RAM_Block_7_io_in_data_Im),
    .io_re(RAM_Block_7_io_re),
    .io_wr(RAM_Block_7_io_wr),
    .io_en(RAM_Block_7_io_en),
    .io_out_data_Re(RAM_Block_7_io_out_data_Re),
    .io_out_data_Im(RAM_Block_7_io_out_data_Im)
  );
  PermutationModuleStreamed PermutationModuleStreamed ( // @[FFTDesigns.scala 2641:26]
    .io_in_0_Re(PermutationModuleStreamed_io_in_0_Re),
    .io_in_0_Im(PermutationModuleStreamed_io_in_0_Im),
    .io_in_1_Re(PermutationModuleStreamed_io_in_1_Re),
    .io_in_1_Im(PermutationModuleStreamed_io_in_1_Im),
    .io_in_2_Re(PermutationModuleStreamed_io_in_2_Re),
    .io_in_2_Im(PermutationModuleStreamed_io_in_2_Im),
    .io_in_3_Re(PermutationModuleStreamed_io_in_3_Re),
    .io_in_3_Im(PermutationModuleStreamed_io_in_3_Im),
    .io_in_config_0(PermutationModuleStreamed_io_in_config_0),
    .io_in_config_1(PermutationModuleStreamed_io_in_config_1),
    .io_in_config_2(PermutationModuleStreamed_io_in_config_2),
    .io_out_0_Re(PermutationModuleStreamed_io_out_0_Re),
    .io_out_0_Im(PermutationModuleStreamed_io_out_0_Im),
    .io_out_1_Re(PermutationModuleStreamed_io_out_1_Re),
    .io_out_1_Im(PermutationModuleStreamed_io_out_1_Im),
    .io_out_2_Re(PermutationModuleStreamed_io_out_2_Re),
    .io_out_2_Im(PermutationModuleStreamed_io_out_2_Im),
    .io_out_3_Re(PermutationModuleStreamed_io_out_3_Re),
    .io_out_3_Im(PermutationModuleStreamed_io_out_3_Im)
  );
  M0_Config_ROM M0_Config_ROM ( // @[FFTDesigns.scala 2642:27]
    .io_in_cnt(M0_Config_ROM_io_in_cnt),
    .io_out_0(M0_Config_ROM_io_out_0),
    .io_out_1(M0_Config_ROM_io_out_1),
    .io_out_2(M0_Config_ROM_io_out_2),
    .io_out_3(M0_Config_ROM_io_out_3)
  );
  M1_Config_ROM M1_Config_ROM ( // @[FFTDesigns.scala 2643:27]
    .io_in_cnt(M1_Config_ROM_io_in_cnt),
    .io_out_0(M1_Config_ROM_io_out_0),
    .io_out_1(M1_Config_ROM_io_out_1),
    .io_out_2(M1_Config_ROM_io_out_2),
    .io_out_3(M1_Config_ROM_io_out_3)
  );
  Streaming_Permute_Config Streaming_Permute_Config ( // @[FFTDesigns.scala 2644:29]
    .io_in_cnt(Streaming_Permute_Config_io_in_cnt),
    .io_out_0(Streaming_Permute_Config_io_out_0),
    .io_out_1(Streaming_Permute_Config_io_out_1),
    .io_out_2(Streaming_Permute_Config_io_out_2)
  );
  assign io_out_0_Re = RAM_Block_4_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign io_out_0_Im = RAM_Block_4_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign io_out_1_Re = RAM_Block_5_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign io_out_1_Im = RAM_Block_5_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign io_out_2_Re = RAM_Block_6_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign io_out_2_Im = RAM_Block_6_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign io_out_3_Re = RAM_Block_7_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign io_out_3_Im = RAM_Block_7_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign RAM_Block_clock = clock;
  assign RAM_Block_io_in_raddr = _GEN_6[3:0];
  assign RAM_Block_io_in_waddr = _GEN_7[3:0];
  assign RAM_Block_io_in_data_Re = io_in_0_Re; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_io_in_data_Im = io_in_0_Im; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_1_clock = clock;
  assign RAM_Block_1_io_in_raddr = _GEN_19[3:0];
  assign RAM_Block_1_io_in_waddr = _GEN_7[3:0];
  assign RAM_Block_1_io_in_data_Re = io_in_1_Re; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_1_io_in_data_Im = io_in_1_Im; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_1_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_1_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_1_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_2_clock = clock;
  assign RAM_Block_2_io_in_raddr = _GEN_32[3:0];
  assign RAM_Block_2_io_in_waddr = _GEN_7[3:0];
  assign RAM_Block_2_io_in_data_Re = io_in_2_Re; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_2_io_in_data_Im = io_in_2_Im; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_2_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_2_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_2_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_3_clock = clock;
  assign RAM_Block_3_io_in_raddr = _GEN_45[3:0];
  assign RAM_Block_3_io_in_waddr = _GEN_7[3:0];
  assign RAM_Block_3_io_in_data_Re = io_in_3_Re; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_3_io_in_data_Im = io_in_3_Im; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_3_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_3_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_3_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_4_clock = clock;
  assign RAM_Block_4_io_in_raddr = _GEN_10[3:0];
  assign RAM_Block_4_io_in_waddr = _GEN_11[3:0];
  assign RAM_Block_4_io_in_data_Re = PermutationModuleStreamed_io_out_0_Re; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_4_io_in_data_Im = PermutationModuleStreamed_io_out_0_Im; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_4_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_4_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_4_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_5_clock = clock;
  assign RAM_Block_5_io_in_raddr = _GEN_10[3:0];
  assign RAM_Block_5_io_in_waddr = _GEN_24[3:0];
  assign RAM_Block_5_io_in_data_Re = PermutationModuleStreamed_io_out_1_Re; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_5_io_in_data_Im = PermutationModuleStreamed_io_out_1_Im; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_5_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_5_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_5_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_6_clock = clock;
  assign RAM_Block_6_io_in_raddr = _GEN_10[3:0];
  assign RAM_Block_6_io_in_waddr = _GEN_37[3:0];
  assign RAM_Block_6_io_in_data_Re = PermutationModuleStreamed_io_out_2_Re; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_6_io_in_data_Im = PermutationModuleStreamed_io_out_2_Im; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_6_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_6_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_6_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_7_clock = clock;
  assign RAM_Block_7_io_in_raddr = _GEN_10[3:0];
  assign RAM_Block_7_io_in_waddr = _GEN_50[3:0];
  assign RAM_Block_7_io_in_data_Re = PermutationModuleStreamed_io_out_3_Re; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_7_io_in_data_Im = PermutationModuleStreamed_io_out_3_Im; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_7_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_7_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_7_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign PermutationModuleStreamed_io_in_0_Re = RAM_Block_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_0_Im = RAM_Block_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_1_Re = RAM_Block_1_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_1_Im = RAM_Block_1_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_2_Re = RAM_Block_2_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_2_Im = RAM_Block_2_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_3_Re = RAM_Block_3_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_3_Im = RAM_Block_3_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_config_0 = Streaming_Permute_Config_io_out_0; // @[FFTDesigns.scala 2646:30 2667:31 2686:31]
  assign PermutationModuleStreamed_io_in_config_1 = Streaming_Permute_Config_io_out_1; // @[FFTDesigns.scala 2646:30 2667:31 2686:31]
  assign PermutationModuleStreamed_io_in_config_2 = Streaming_Permute_Config_io_out_2; // @[FFTDesigns.scala 2646:30 2667:31 2686:31]
  assign M0_Config_ROM_io_in_cnt = cnt; // @[FFTDesigns.scala 2694:22]
  assign M1_Config_ROM_io_in_cnt = cnt; // @[FFTDesigns.scala 2695:22]
  assign Streaming_Permute_Config_io_in_cnt = cnt; // @[FFTDesigns.scala 2696:24]
  always @(posedge clock) begin
    offset_switch <= _T_1 & _GEN_2; // @[FFTDesigns.scala 2646:30 2691:21]
    if (reset) begin // @[FFTDesigns.scala 2645:22]
      cnt <= 3'h0; // @[FFTDesigns.scala 2645:22]
    end else if (_T_1) begin // @[FFTDesigns.scala 2646:30]
      if (cnt == 3'h7) begin // @[FFTDesigns.scala 2647:32]
        cnt <= 3'h0; // @[FFTDesigns.scala 2648:13]
      end else begin
        cnt <= _cnt_T_1; // @[FFTDesigns.scala 2651:13]
      end
    end else begin
      cnt <= 3'h0; // @[FFTDesigns.scala 2692:11]
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
  cnt = _RAND_1[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module M0_Config_ROM_1(
  input  [2:0] io_in_cnt,
  output [3:0] io_out_0,
  output [3:0] io_out_1,
  output [3:0] io_out_2,
  output [3:0] io_out_3
);
  wire [3:0] _GEN_1 = 3'h1 == io_in_cnt ? 4'h1 : 4'h0; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_2 = 3'h2 == io_in_cnt ? 4'h2 : _GEN_1; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_3 = 3'h3 == io_in_cnt ? 4'h3 : _GEN_2; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_4 = 3'h4 == io_in_cnt ? 4'h4 : _GEN_3; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_5 = 3'h5 == io_in_cnt ? 4'h5 : _GEN_4; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_6 = 3'h6 == io_in_cnt ? 4'h6 : _GEN_5; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_9 = 3'h1 == io_in_cnt ? 4'h2 : 4'h1; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_10 = 3'h2 == io_in_cnt ? 4'h3 : _GEN_9; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_11 = 3'h3 == io_in_cnt ? 4'h4 : _GEN_10; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_12 = 3'h4 == io_in_cnt ? 4'h5 : _GEN_11; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_13 = 3'h5 == io_in_cnt ? 4'h6 : _GEN_12; // @[FFTDesigns.scala 3227:{17,17}]
  wire [3:0] _GEN_14 = 3'h6 == io_in_cnt ? 4'h7 : _GEN_13; // @[FFTDesigns.scala 3227:{17,17}]
  assign io_out_0 = 3'h7 == io_in_cnt ? 4'h7 : _GEN_6; // @[FFTDesigns.scala 3227:{17,17}]
  assign io_out_1 = 3'h7 == io_in_cnt ? 4'h0 : _GEN_14; // @[FFTDesigns.scala 3227:{17,17}]
  assign io_out_2 = 3'h7 == io_in_cnt ? 4'h7 : _GEN_6; // @[FFTDesigns.scala 3227:{17,17}]
  assign io_out_3 = 3'h7 == io_in_cnt ? 4'h0 : _GEN_14; // @[FFTDesigns.scala 3227:{17,17}]
endmodule
module M1_Config_ROM_1(
  input  [2:0] io_in_cnt,
  output [3:0] io_out_0,
  output [3:0] io_out_1,
  output [3:0] io_out_2,
  output [3:0] io_out_3
);
  wire [3:0] _GEN_1 = 3'h1 == io_in_cnt ? 4'h5 : 4'h0; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_2 = 3'h2 == io_in_cnt ? 4'h1 : _GEN_1; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_3 = 3'h3 == io_in_cnt ? 4'h6 : _GEN_2; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_4 = 3'h4 == io_in_cnt ? 4'h2 : _GEN_3; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_5 = 3'h5 == io_in_cnt ? 4'h7 : _GEN_4; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_6 = 3'h6 == io_in_cnt ? 4'h3 : _GEN_5; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_17 = 3'h1 == io_in_cnt ? 4'h0 : 4'h4; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_18 = 3'h2 == io_in_cnt ? 4'h5 : _GEN_17; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_19 = 3'h3 == io_in_cnt ? 4'h1 : _GEN_18; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_20 = 3'h4 == io_in_cnt ? 4'h6 : _GEN_19; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_21 = 3'h5 == io_in_cnt ? 4'h2 : _GEN_20; // @[FFTDesigns.scala 3250:{17,17}]
  wire [3:0] _GEN_22 = 3'h6 == io_in_cnt ? 4'h7 : _GEN_21; // @[FFTDesigns.scala 3250:{17,17}]
  assign io_out_0 = 3'h7 == io_in_cnt ? 4'h4 : _GEN_6; // @[FFTDesigns.scala 3250:{17,17}]
  assign io_out_1 = 3'h7 == io_in_cnt ? 4'h4 : _GEN_6; // @[FFTDesigns.scala 3250:{17,17}]
  assign io_out_2 = 3'h7 == io_in_cnt ? 4'h3 : _GEN_22; // @[FFTDesigns.scala 3250:{17,17}]
  assign io_out_3 = 3'h7 == io_in_cnt ? 4'h3 : _GEN_22; // @[FFTDesigns.scala 3250:{17,17}]
endmodule
module Streaming_Permute_Config_1(
  input  [2:0] io_in_cnt,
  output [1:0] io_out_0,
  output [1:0] io_out_1,
  output [1:0] io_out_2
);
  wire [1:0] _GEN_1 = 3'h1 == io_in_cnt ? 2'h2 : 2'h0; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_2 = 3'h2 == io_in_cnt ? 2'h0 : _GEN_1; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_3 = 3'h3 == io_in_cnt ? 2'h2 : _GEN_2; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_4 = 3'h4 == io_in_cnt ? 2'h0 : _GEN_3; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_5 = 3'h5 == io_in_cnt ? 2'h2 : _GEN_4; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_6 = 3'h6 == io_in_cnt ? 2'h0 : _GEN_5; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_9 = 3'h1 == io_in_cnt ? 2'h0 : 2'h2; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_10 = 3'h2 == io_in_cnt ? 2'h2 : _GEN_9; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_11 = 3'h3 == io_in_cnt ? 2'h0 : _GEN_10; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_12 = 3'h4 == io_in_cnt ? 2'h2 : _GEN_11; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_13 = 3'h5 == io_in_cnt ? 2'h0 : _GEN_12; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_14 = 3'h6 == io_in_cnt ? 2'h2 : _GEN_13; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_17 = 3'h1 == io_in_cnt ? 2'h3 : 2'h1; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_18 = 3'h2 == io_in_cnt ? 2'h1 : _GEN_17; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_19 = 3'h3 == io_in_cnt ? 2'h3 : _GEN_18; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_20 = 3'h4 == io_in_cnt ? 2'h1 : _GEN_19; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_21 = 3'h5 == io_in_cnt ? 2'h3 : _GEN_20; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_22 = 3'h6 == io_in_cnt ? 2'h1 : _GEN_21; // @[FFTDesigns.scala 3273:{17,17}]
  assign io_out_0 = 3'h7 == io_in_cnt ? 2'h2 : _GEN_6; // @[FFTDesigns.scala 3273:{17,17}]
  assign io_out_1 = 3'h7 == io_in_cnt ? 2'h0 : _GEN_14; // @[FFTDesigns.scala 3273:{17,17}]
  assign io_out_2 = 3'h7 == io_in_cnt ? 2'h3 : _GEN_22; // @[FFTDesigns.scala 3273:{17,17}]
endmodule
module PermutationsWithStreaming_1(
  input         clock,
  input         reset,
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  input  [31:0] io_in_2_Re,
  input  [31:0] io_in_2_Im,
  input  [31:0] io_in_3_Re,
  input  [31:0] io_in_3_Im,
  input         io_in_en_0,
  input         io_in_en_1,
  input         io_in_en_2,
  input         io_in_en_3,
  input         io_in_en_4,
  input         io_in_en_5,
  input         io_in_en_6,
  input         io_in_en_7,
  input         io_in_en_8,
  input         io_in_en_9,
  input         io_in_en_10,
  input         io_in_en_11,
  input         io_in_en_12,
  input         io_in_en_13,
  input         io_in_en_14,
  input         io_in_en_15,
  input         io_in_en_16,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im,
  output [31:0] io_out_2_Re,
  output [31:0] io_out_2_Im,
  output [31:0] io_out_3_Re,
  output [31:0] io_out_3_Im
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  RAM_Block_clock; // @[FFTDesigns.scala 2634:24]
  wire [3:0] RAM_Block_io_in_raddr; // @[FFTDesigns.scala 2634:24]
  wire [3:0] RAM_Block_io_in_waddr; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_io_in_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_io_in_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_io_re; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_io_wr; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_io_en; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_io_out_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_io_out_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_1_clock; // @[FFTDesigns.scala 2634:24]
  wire [3:0] RAM_Block_1_io_in_raddr; // @[FFTDesigns.scala 2634:24]
  wire [3:0] RAM_Block_1_io_in_waddr; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_1_io_in_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_1_io_in_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_1_io_re; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_1_io_wr; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_1_io_en; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_1_io_out_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_1_io_out_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_2_clock; // @[FFTDesigns.scala 2634:24]
  wire [3:0] RAM_Block_2_io_in_raddr; // @[FFTDesigns.scala 2634:24]
  wire [3:0] RAM_Block_2_io_in_waddr; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_2_io_in_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_2_io_in_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_2_io_re; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_2_io_wr; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_2_io_en; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_2_io_out_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_2_io_out_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_3_clock; // @[FFTDesigns.scala 2634:24]
  wire [3:0] RAM_Block_3_io_in_raddr; // @[FFTDesigns.scala 2634:24]
  wire [3:0] RAM_Block_3_io_in_waddr; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_3_io_in_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_3_io_in_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_3_io_re; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_3_io_wr; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_3_io_en; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_3_io_out_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_3_io_out_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_4_clock; // @[FFTDesigns.scala 2638:24]
  wire [3:0] RAM_Block_4_io_in_raddr; // @[FFTDesigns.scala 2638:24]
  wire [3:0] RAM_Block_4_io_in_waddr; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_4_io_in_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_4_io_in_data_Im; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_4_io_re; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_4_io_wr; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_4_io_en; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_4_io_out_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_4_io_out_data_Im; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_5_clock; // @[FFTDesigns.scala 2638:24]
  wire [3:0] RAM_Block_5_io_in_raddr; // @[FFTDesigns.scala 2638:24]
  wire [3:0] RAM_Block_5_io_in_waddr; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_5_io_in_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_5_io_in_data_Im; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_5_io_re; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_5_io_wr; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_5_io_en; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_5_io_out_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_5_io_out_data_Im; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_6_clock; // @[FFTDesigns.scala 2638:24]
  wire [3:0] RAM_Block_6_io_in_raddr; // @[FFTDesigns.scala 2638:24]
  wire [3:0] RAM_Block_6_io_in_waddr; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_6_io_in_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_6_io_in_data_Im; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_6_io_re; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_6_io_wr; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_6_io_en; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_6_io_out_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_6_io_out_data_Im; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_7_clock; // @[FFTDesigns.scala 2638:24]
  wire [3:0] RAM_Block_7_io_in_raddr; // @[FFTDesigns.scala 2638:24]
  wire [3:0] RAM_Block_7_io_in_waddr; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_7_io_in_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_7_io_in_data_Im; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_7_io_re; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_7_io_wr; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_7_io_en; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_7_io_out_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_7_io_out_data_Im; // @[FFTDesigns.scala 2638:24]
  wire [31:0] PermutationModuleStreamed_io_in_0_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_in_0_Im; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_in_1_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_in_1_Im; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_in_2_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_in_2_Im; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_in_3_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_in_3_Im; // @[FFTDesigns.scala 2641:26]
  wire [1:0] PermutationModuleStreamed_io_in_config_0; // @[FFTDesigns.scala 2641:26]
  wire [1:0] PermutationModuleStreamed_io_in_config_1; // @[FFTDesigns.scala 2641:26]
  wire [1:0] PermutationModuleStreamed_io_in_config_2; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_0_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_0_Im; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_1_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_1_Im; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_2_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_2_Im; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_3_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_3_Im; // @[FFTDesigns.scala 2641:26]
  wire [2:0] M0_Config_ROM_io_in_cnt; // @[FFTDesigns.scala 2642:27]
  wire [3:0] M0_Config_ROM_io_out_0; // @[FFTDesigns.scala 2642:27]
  wire [3:0] M0_Config_ROM_io_out_1; // @[FFTDesigns.scala 2642:27]
  wire [3:0] M0_Config_ROM_io_out_2; // @[FFTDesigns.scala 2642:27]
  wire [3:0] M0_Config_ROM_io_out_3; // @[FFTDesigns.scala 2642:27]
  wire [2:0] M1_Config_ROM_io_in_cnt; // @[FFTDesigns.scala 2643:27]
  wire [3:0] M1_Config_ROM_io_out_0; // @[FFTDesigns.scala 2643:27]
  wire [3:0] M1_Config_ROM_io_out_1; // @[FFTDesigns.scala 2643:27]
  wire [3:0] M1_Config_ROM_io_out_2; // @[FFTDesigns.scala 2643:27]
  wire [3:0] M1_Config_ROM_io_out_3; // @[FFTDesigns.scala 2643:27]
  wire [2:0] Streaming_Permute_Config_io_in_cnt; // @[FFTDesigns.scala 2644:29]
  wire [1:0] Streaming_Permute_Config_io_out_0; // @[FFTDesigns.scala 2644:29]
  wire [1:0] Streaming_Permute_Config_io_out_1; // @[FFTDesigns.scala 2644:29]
  wire [1:0] Streaming_Permute_Config_io_out_2; // @[FFTDesigns.scala 2644:29]
  reg  offset_switch; // @[FFTDesigns.scala 2627:28]
  wire [7:0] lo = {io_in_en_7,io_in_en_6,io_in_en_5,io_in_en_4,io_in_en_3,io_in_en_2,io_in_en_1,io_in_en_0}; // @[FFTDesigns.scala 2628:19]
  wire [16:0] _T = {io_in_en_16,io_in_en_15,io_in_en_14,io_in_en_13,io_in_en_12,io_in_en_11,io_in_en_10,io_in_en_9,
    io_in_en_8,lo}; // @[FFTDesigns.scala 2628:19]
  wire  _T_1 = |_T; // @[FFTDesigns.scala 2628:26]
  reg [2:0] cnt; // @[FFTDesigns.scala 2645:22]
  wire  _offset_switch_T = ~offset_switch; // @[FFTDesigns.scala 2649:26]
  wire [2:0] _cnt_T_1 = cnt + 3'h1; // @[FFTDesigns.scala 2651:20]
  wire  _GEN_2 = cnt == 3'h7 ? ~offset_switch : offset_switch; // @[FFTDesigns.scala 2647:32 2649:23 2652:23]
  wire [4:0] _T_6 = 4'h8 * _offset_switch_T; // @[FFTDesigns.scala 2661:54]
  wire [4:0] _GEN_58 = {{1'd0}, M0_Config_ROM_io_out_0}; // @[FFTDesigns.scala 2661:44]
  wire [4:0] _T_8 = _GEN_58 + _T_6; // @[FFTDesigns.scala 2661:44]
  wire [4:0] _T_9 = 4'h8 * offset_switch; // @[FFTDesigns.scala 2662:41]
  wire [4:0] _GEN_59 = {{2'd0}, cnt}; // @[FFTDesigns.scala 2662:31]
  wire [4:0] _T_11 = _GEN_59 + _T_9; // @[FFTDesigns.scala 2662:31]
  wire [4:0] _T_15 = _GEN_59 + _T_6; // @[FFTDesigns.scala 2664:31]
  wire [4:0] _GEN_61 = {{1'd0}, M1_Config_ROM_io_out_0}; // @[FFTDesigns.scala 2665:44]
  wire [4:0] _T_18 = _GEN_61 + _T_9; // @[FFTDesigns.scala 2665:44]
  wire [4:0] _GEN_62 = {{1'd0}, M0_Config_ROM_io_out_1}; // @[FFTDesigns.scala 2661:44]
  wire [4:0] _T_22 = _GEN_62 + _T_6; // @[FFTDesigns.scala 2661:44]
  wire [4:0] _GEN_65 = {{1'd0}, M1_Config_ROM_io_out_1}; // @[FFTDesigns.scala 2665:44]
  wire [4:0] _T_32 = _GEN_65 + _T_9; // @[FFTDesigns.scala 2665:44]
  wire [4:0] _GEN_66 = {{1'd0}, M0_Config_ROM_io_out_2}; // @[FFTDesigns.scala 2661:44]
  wire [4:0] _T_36 = _GEN_66 + _T_6; // @[FFTDesigns.scala 2661:44]
  wire [4:0] _GEN_69 = {{1'd0}, M1_Config_ROM_io_out_2}; // @[FFTDesigns.scala 2665:44]
  wire [4:0] _T_46 = _GEN_69 + _T_9; // @[FFTDesigns.scala 2665:44]
  wire [4:0] _GEN_70 = {{1'd0}, M0_Config_ROM_io_out_3}; // @[FFTDesigns.scala 2661:44]
  wire [4:0] _T_50 = _GEN_70 + _T_6; // @[FFTDesigns.scala 2661:44]
  wire [4:0] _GEN_73 = {{1'd0}, M1_Config_ROM_io_out_3}; // @[FFTDesigns.scala 2665:44]
  wire [4:0] _T_60 = _GEN_73 + _T_9; // @[FFTDesigns.scala 2665:44]
  wire [4:0] _GEN_6 = _T_1 ? _T_8 : 5'h0; // @[FFTDesigns.scala 2646:30 2661:24 2680:24]
  wire [4:0] _GEN_7 = _T_1 ? _T_11 : 5'h0; // @[FFTDesigns.scala 2646:30 2662:24 2681:24]
  wire [4:0] _GEN_10 = _T_1 ? _T_15 : 5'h0; // @[FFTDesigns.scala 2646:30 2664:24 2683:24]
  wire [4:0] _GEN_11 = _T_1 ? _T_18 : 5'h0; // @[FFTDesigns.scala 2646:30 2665:24 2684:24]
  wire [4:0] _GEN_19 = _T_1 ? _T_22 : 5'h0; // @[FFTDesigns.scala 2646:30 2661:24 2680:24]
  wire [4:0] _GEN_24 = _T_1 ? _T_32 : 5'h0; // @[FFTDesigns.scala 2646:30 2665:24 2684:24]
  wire [4:0] _GEN_32 = _T_1 ? _T_36 : 5'h0; // @[FFTDesigns.scala 2646:30 2661:24 2680:24]
  wire [4:0] _GEN_37 = _T_1 ? _T_46 : 5'h0; // @[FFTDesigns.scala 2646:30 2665:24 2684:24]
  wire [4:0] _GEN_45 = _T_1 ? _T_50 : 5'h0; // @[FFTDesigns.scala 2646:30 2661:24 2680:24]
  wire [4:0] _GEN_50 = _T_1 ? _T_60 : 5'h0; // @[FFTDesigns.scala 2646:30 2665:24 2684:24]
  RAM_Block RAM_Block ( // @[FFTDesigns.scala 2634:24]
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
  RAM_Block RAM_Block_1 ( // @[FFTDesigns.scala 2634:24]
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
  RAM_Block RAM_Block_2 ( // @[FFTDesigns.scala 2634:24]
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
  RAM_Block RAM_Block_3 ( // @[FFTDesigns.scala 2634:24]
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
  RAM_Block RAM_Block_4 ( // @[FFTDesigns.scala 2638:24]
    .clock(RAM_Block_4_clock),
    .io_in_raddr(RAM_Block_4_io_in_raddr),
    .io_in_waddr(RAM_Block_4_io_in_waddr),
    .io_in_data_Re(RAM_Block_4_io_in_data_Re),
    .io_in_data_Im(RAM_Block_4_io_in_data_Im),
    .io_re(RAM_Block_4_io_re),
    .io_wr(RAM_Block_4_io_wr),
    .io_en(RAM_Block_4_io_en),
    .io_out_data_Re(RAM_Block_4_io_out_data_Re),
    .io_out_data_Im(RAM_Block_4_io_out_data_Im)
  );
  RAM_Block RAM_Block_5 ( // @[FFTDesigns.scala 2638:24]
    .clock(RAM_Block_5_clock),
    .io_in_raddr(RAM_Block_5_io_in_raddr),
    .io_in_waddr(RAM_Block_5_io_in_waddr),
    .io_in_data_Re(RAM_Block_5_io_in_data_Re),
    .io_in_data_Im(RAM_Block_5_io_in_data_Im),
    .io_re(RAM_Block_5_io_re),
    .io_wr(RAM_Block_5_io_wr),
    .io_en(RAM_Block_5_io_en),
    .io_out_data_Re(RAM_Block_5_io_out_data_Re),
    .io_out_data_Im(RAM_Block_5_io_out_data_Im)
  );
  RAM_Block RAM_Block_6 ( // @[FFTDesigns.scala 2638:24]
    .clock(RAM_Block_6_clock),
    .io_in_raddr(RAM_Block_6_io_in_raddr),
    .io_in_waddr(RAM_Block_6_io_in_waddr),
    .io_in_data_Re(RAM_Block_6_io_in_data_Re),
    .io_in_data_Im(RAM_Block_6_io_in_data_Im),
    .io_re(RAM_Block_6_io_re),
    .io_wr(RAM_Block_6_io_wr),
    .io_en(RAM_Block_6_io_en),
    .io_out_data_Re(RAM_Block_6_io_out_data_Re),
    .io_out_data_Im(RAM_Block_6_io_out_data_Im)
  );
  RAM_Block RAM_Block_7 ( // @[FFTDesigns.scala 2638:24]
    .clock(RAM_Block_7_clock),
    .io_in_raddr(RAM_Block_7_io_in_raddr),
    .io_in_waddr(RAM_Block_7_io_in_waddr),
    .io_in_data_Re(RAM_Block_7_io_in_data_Re),
    .io_in_data_Im(RAM_Block_7_io_in_data_Im),
    .io_re(RAM_Block_7_io_re),
    .io_wr(RAM_Block_7_io_wr),
    .io_en(RAM_Block_7_io_en),
    .io_out_data_Re(RAM_Block_7_io_out_data_Re),
    .io_out_data_Im(RAM_Block_7_io_out_data_Im)
  );
  PermutationModuleStreamed PermutationModuleStreamed ( // @[FFTDesigns.scala 2641:26]
    .io_in_0_Re(PermutationModuleStreamed_io_in_0_Re),
    .io_in_0_Im(PermutationModuleStreamed_io_in_0_Im),
    .io_in_1_Re(PermutationModuleStreamed_io_in_1_Re),
    .io_in_1_Im(PermutationModuleStreamed_io_in_1_Im),
    .io_in_2_Re(PermutationModuleStreamed_io_in_2_Re),
    .io_in_2_Im(PermutationModuleStreamed_io_in_2_Im),
    .io_in_3_Re(PermutationModuleStreamed_io_in_3_Re),
    .io_in_3_Im(PermutationModuleStreamed_io_in_3_Im),
    .io_in_config_0(PermutationModuleStreamed_io_in_config_0),
    .io_in_config_1(PermutationModuleStreamed_io_in_config_1),
    .io_in_config_2(PermutationModuleStreamed_io_in_config_2),
    .io_out_0_Re(PermutationModuleStreamed_io_out_0_Re),
    .io_out_0_Im(PermutationModuleStreamed_io_out_0_Im),
    .io_out_1_Re(PermutationModuleStreamed_io_out_1_Re),
    .io_out_1_Im(PermutationModuleStreamed_io_out_1_Im),
    .io_out_2_Re(PermutationModuleStreamed_io_out_2_Re),
    .io_out_2_Im(PermutationModuleStreamed_io_out_2_Im),
    .io_out_3_Re(PermutationModuleStreamed_io_out_3_Re),
    .io_out_3_Im(PermutationModuleStreamed_io_out_3_Im)
  );
  M0_Config_ROM_1 M0_Config_ROM ( // @[FFTDesigns.scala 2642:27]
    .io_in_cnt(M0_Config_ROM_io_in_cnt),
    .io_out_0(M0_Config_ROM_io_out_0),
    .io_out_1(M0_Config_ROM_io_out_1),
    .io_out_2(M0_Config_ROM_io_out_2),
    .io_out_3(M0_Config_ROM_io_out_3)
  );
  M1_Config_ROM_1 M1_Config_ROM ( // @[FFTDesigns.scala 2643:27]
    .io_in_cnt(M1_Config_ROM_io_in_cnt),
    .io_out_0(M1_Config_ROM_io_out_0),
    .io_out_1(M1_Config_ROM_io_out_1),
    .io_out_2(M1_Config_ROM_io_out_2),
    .io_out_3(M1_Config_ROM_io_out_3)
  );
  Streaming_Permute_Config_1 Streaming_Permute_Config ( // @[FFTDesigns.scala 2644:29]
    .io_in_cnt(Streaming_Permute_Config_io_in_cnt),
    .io_out_0(Streaming_Permute_Config_io_out_0),
    .io_out_1(Streaming_Permute_Config_io_out_1),
    .io_out_2(Streaming_Permute_Config_io_out_2)
  );
  assign io_out_0_Re = RAM_Block_4_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign io_out_0_Im = RAM_Block_4_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign io_out_1_Re = RAM_Block_5_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign io_out_1_Im = RAM_Block_5_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign io_out_2_Re = RAM_Block_6_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign io_out_2_Im = RAM_Block_6_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign io_out_3_Re = RAM_Block_7_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign io_out_3_Im = RAM_Block_7_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign RAM_Block_clock = clock;
  assign RAM_Block_io_in_raddr = _GEN_6[3:0];
  assign RAM_Block_io_in_waddr = _GEN_7[3:0];
  assign RAM_Block_io_in_data_Re = io_in_0_Re; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_io_in_data_Im = io_in_0_Im; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_1_clock = clock;
  assign RAM_Block_1_io_in_raddr = _GEN_19[3:0];
  assign RAM_Block_1_io_in_waddr = _GEN_7[3:0];
  assign RAM_Block_1_io_in_data_Re = io_in_1_Re; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_1_io_in_data_Im = io_in_1_Im; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_1_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_1_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_1_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_2_clock = clock;
  assign RAM_Block_2_io_in_raddr = _GEN_32[3:0];
  assign RAM_Block_2_io_in_waddr = _GEN_7[3:0];
  assign RAM_Block_2_io_in_data_Re = io_in_2_Re; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_2_io_in_data_Im = io_in_2_Im; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_2_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_2_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_2_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_3_clock = clock;
  assign RAM_Block_3_io_in_raddr = _GEN_45[3:0];
  assign RAM_Block_3_io_in_waddr = _GEN_7[3:0];
  assign RAM_Block_3_io_in_data_Re = io_in_3_Re; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_3_io_in_data_Im = io_in_3_Im; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_3_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_3_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_3_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_4_clock = clock;
  assign RAM_Block_4_io_in_raddr = _GEN_10[3:0];
  assign RAM_Block_4_io_in_waddr = _GEN_11[3:0];
  assign RAM_Block_4_io_in_data_Re = PermutationModuleStreamed_io_out_0_Re; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_4_io_in_data_Im = PermutationModuleStreamed_io_out_0_Im; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_4_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_4_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_4_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_5_clock = clock;
  assign RAM_Block_5_io_in_raddr = _GEN_10[3:0];
  assign RAM_Block_5_io_in_waddr = _GEN_24[3:0];
  assign RAM_Block_5_io_in_data_Re = PermutationModuleStreamed_io_out_1_Re; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_5_io_in_data_Im = PermutationModuleStreamed_io_out_1_Im; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_5_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_5_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_5_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_6_clock = clock;
  assign RAM_Block_6_io_in_raddr = _GEN_10[3:0];
  assign RAM_Block_6_io_in_waddr = _GEN_37[3:0];
  assign RAM_Block_6_io_in_data_Re = PermutationModuleStreamed_io_out_2_Re; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_6_io_in_data_Im = PermutationModuleStreamed_io_out_2_Im; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_6_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_6_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_6_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_7_clock = clock;
  assign RAM_Block_7_io_in_raddr = _GEN_10[3:0];
  assign RAM_Block_7_io_in_waddr = _GEN_50[3:0];
  assign RAM_Block_7_io_in_data_Re = PermutationModuleStreamed_io_out_3_Re; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_7_io_in_data_Im = PermutationModuleStreamed_io_out_3_Im; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_7_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_7_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_7_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign PermutationModuleStreamed_io_in_0_Re = RAM_Block_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_0_Im = RAM_Block_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_1_Re = RAM_Block_1_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_1_Im = RAM_Block_1_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_2_Re = RAM_Block_2_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_2_Im = RAM_Block_2_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_3_Re = RAM_Block_3_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_3_Im = RAM_Block_3_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_config_0 = Streaming_Permute_Config_io_out_0; // @[FFTDesigns.scala 2646:30 2667:31 2686:31]
  assign PermutationModuleStreamed_io_in_config_1 = Streaming_Permute_Config_io_out_1; // @[FFTDesigns.scala 2646:30 2667:31 2686:31]
  assign PermutationModuleStreamed_io_in_config_2 = Streaming_Permute_Config_io_out_2; // @[FFTDesigns.scala 2646:30 2667:31 2686:31]
  assign M0_Config_ROM_io_in_cnt = cnt; // @[FFTDesigns.scala 2694:22]
  assign M1_Config_ROM_io_in_cnt = cnt; // @[FFTDesigns.scala 2695:22]
  assign Streaming_Permute_Config_io_in_cnt = cnt; // @[FFTDesigns.scala 2696:24]
  always @(posedge clock) begin
    offset_switch <= _T_1 & _GEN_2; // @[FFTDesigns.scala 2646:30 2691:21]
    if (reset) begin // @[FFTDesigns.scala 2645:22]
      cnt <= 3'h0; // @[FFTDesigns.scala 2645:22]
    end else if (_T_1) begin // @[FFTDesigns.scala 2646:30]
      if (cnt == 3'h7) begin // @[FFTDesigns.scala 2647:32]
        cnt <= 3'h0; // @[FFTDesigns.scala 2648:13]
      end else begin
        cnt <= _cnt_T_1; // @[FFTDesigns.scala 2651:13]
      end
    end else begin
      cnt <= 3'h0; // @[FFTDesigns.scala 2692:11]
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
  cnt = _RAND_1[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TwiddleFactorROM(
  input  [4:0]  io_in_addr,
  output [31:0] io_out_data_1_Re,
  output [31:0] io_out_data_1_Im,
  output [31:0] io_out_data_3_Re,
  output [31:0] io_out_data_3_Im
);
  wire [31:0] _GEN_20 = 3'h4 == io_in_addr[2:0] ? 32'h248d3131 : 32'h3f800000; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_21 = 3'h5 == io_in_addr[2:0] ? 32'h248d3131 : _GEN_20; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_22 = 3'h6 == io_in_addr[2:0] ? 32'h248d3131 : _GEN_21; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_28 = 3'h4 == io_in_addr[2:0] ? 32'hbf800000 : 32'h80800000; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_29 = 3'h5 == io_in_addr[2:0] ? 32'hbf800000 : _GEN_28; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_30 = 3'h6 == io_in_addr[2:0] ? 32'hbf800000 : _GEN_29; // @[FFTDesigns.scala 2059:{25,25}]
  assign io_out_data_1_Re = 3'h7 == io_in_addr[2:0] ? 32'h248d3131 : _GEN_22; // @[FFTDesigns.scala 2058:{25,25}]
  assign io_out_data_1_Im = 3'h7 == io_in_addr[2:0] ? 32'hbf800000 : _GEN_30; // @[FFTDesigns.scala 2059:{25,25}]
  assign io_out_data_3_Re = 3'h7 == io_in_addr[2:0] ? 32'h248d3131 : _GEN_22; // @[FFTDesigns.scala 2058:{25,25}]
  assign io_out_data_3_Im = 3'h7 == io_in_addr[2:0] ? 32'hbf800000 : _GEN_30; // @[FFTDesigns.scala 2059:{25,25}]
endmodule
module TwiddleFactorsStreamed(
  input         clock,
  input         reset,
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  input  [31:0] io_in_2_Re,
  input  [31:0] io_in_2_Im,
  input  [31:0] io_in_3_Re,
  input  [31:0] io_in_3_Im,
  input         io_in_en_0,
  input         io_in_en_1,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im,
  output [31:0] io_out_2_Re,
  output [31:0] io_out_2_Im,
  output [31:0] io_out_3_Re,
  output [31:0] io_out_3_Im
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
`endif // RANDOMIZE_REG_INIT
  wire [4:0] TwiddleFactorROM_io_in_addr; // @[FFTDesigns.scala 2098:26]
  wire [31:0] TwiddleFactorROM_io_out_data_1_Re; // @[FFTDesigns.scala 2098:26]
  wire [31:0] TwiddleFactorROM_io_out_data_1_Im; // @[FFTDesigns.scala 2098:26]
  wire [31:0] TwiddleFactorROM_io_out_data_3_Re; // @[FFTDesigns.scala 2098:26]
  wire [31:0] TwiddleFactorROM_io_out_data_3_Im; // @[FFTDesigns.scala 2098:26]
  wire [31:0] cmplx_adj_io_in_Re; // @[FFTDesigns.scala 2146:30]
  wire [31:0] cmplx_adj_io_in_Im; // @[FFTDesigns.scala 2146:30]
  wire [7:0] cmplx_adj_io_in_adj; // @[FFTDesigns.scala 2146:30]
  wire  cmplx_adj_io_is_neg; // @[FFTDesigns.scala 2146:30]
  wire  cmplx_adj_io_is_flip; // @[FFTDesigns.scala 2146:30]
  wire [31:0] cmplx_adj_io_out_Re; // @[FFTDesigns.scala 2146:30]
  wire [31:0] cmplx_adj_io_out_Im; // @[FFTDesigns.scala 2146:30]
  wire [31:0] cmplx_adj_1_io_in_Re; // @[FFTDesigns.scala 2146:30]
  wire [31:0] cmplx_adj_1_io_in_Im; // @[FFTDesigns.scala 2146:30]
  wire [7:0] cmplx_adj_1_io_in_adj; // @[FFTDesigns.scala 2146:30]
  wire  cmplx_adj_1_io_is_neg; // @[FFTDesigns.scala 2146:30]
  wire  cmplx_adj_1_io_is_flip; // @[FFTDesigns.scala 2146:30]
  wire [31:0] cmplx_adj_1_io_out_Re; // @[FFTDesigns.scala 2146:30]
  wire [31:0] cmplx_adj_1_io_out_Im; // @[FFTDesigns.scala 2146:30]
  wire [31:0] cmplx_adj_2_io_in_Re; // @[FFTDesigns.scala 2146:30]
  wire [31:0] cmplx_adj_2_io_in_Im; // @[FFTDesigns.scala 2146:30]
  wire [7:0] cmplx_adj_2_io_in_adj; // @[FFTDesigns.scala 2146:30]
  wire  cmplx_adj_2_io_is_neg; // @[FFTDesigns.scala 2146:30]
  wire  cmplx_adj_2_io_is_flip; // @[FFTDesigns.scala 2146:30]
  wire [31:0] cmplx_adj_2_io_out_Re; // @[FFTDesigns.scala 2146:30]
  wire [31:0] cmplx_adj_2_io_out_Im; // @[FFTDesigns.scala 2146:30]
  wire [31:0] cmplx_adj_3_io_in_Re; // @[FFTDesigns.scala 2146:30]
  wire [31:0] cmplx_adj_3_io_in_Im; // @[FFTDesigns.scala 2146:30]
  wire [7:0] cmplx_adj_3_io_in_adj; // @[FFTDesigns.scala 2146:30]
  wire  cmplx_adj_3_io_is_neg; // @[FFTDesigns.scala 2146:30]
  wire  cmplx_adj_3_io_is_flip; // @[FFTDesigns.scala 2146:30]
  wire [31:0] cmplx_adj_3_io_out_Re; // @[FFTDesigns.scala 2146:30]
  wire [31:0] cmplx_adj_3_io_out_Im; // @[FFTDesigns.scala 2146:30]
  reg [2:0] cnt; // @[FFTDesigns.scala 2139:24]
  wire [1:0] _T = {io_in_en_1,io_in_en_0}; // @[FFTDesigns.scala 2140:21]
  wire  _T_1 = |_T; // @[FFTDesigns.scala 2140:28]
  wire [2:0] _cnt_T_1 = cnt + 3'h1; // @[FFTDesigns.scala 2153:22]
  wire  _GEN_8 = TwiddleFactorROM_io_out_data_1_Re[30:0] == 31'h3f800000 ? 1'h0 : 1'h1; // @[FFTDesigns.scala 2158:92 2159:36 2166:36]
  wire  _GEN_9 = TwiddleFactorROM_io_out_data_1_Re[30:0] == 31'h3f800000 ? TwiddleFactorROM_io_out_data_1_Re[31] :
    TwiddleFactorROM_io_out_data_1_Im[31]; // @[FFTDesigns.scala 2158:92]
  wire  _GEN_16 = TwiddleFactorROM_io_out_data_3_Re[30:0] == 31'h3f800000 ? 1'h0 : 1'h1; // @[FFTDesigns.scala 2158:92 2159:36 2166:36]
  wire  _GEN_17 = TwiddleFactorROM_io_out_data_3_Re[30:0] == 31'h3f800000 ? TwiddleFactorROM_io_out_data_3_Re[31] :
    TwiddleFactorROM_io_out_data_3_Im[31]; // @[FFTDesigns.scala 2158:92]
  reg [31:0] result_regs_0_0_Re; // @[FFTDesigns.scala 2183:32]
  reg [31:0] result_regs_0_0_Im; // @[FFTDesigns.scala 2183:32]
  reg [31:0] result_regs_0_1_Re; // @[FFTDesigns.scala 2183:32]
  reg [31:0] result_regs_0_1_Im; // @[FFTDesigns.scala 2183:32]
  reg [31:0] result_regs_0_2_Re; // @[FFTDesigns.scala 2183:32]
  reg [31:0] result_regs_0_2_Im; // @[FFTDesigns.scala 2183:32]
  reg [31:0] result_regs_0_3_Re; // @[FFTDesigns.scala 2183:32]
  reg [31:0] result_regs_0_3_Im; // @[FFTDesigns.scala 2183:32]
  reg [31:0] result_regs_1_0_Re; // @[FFTDesigns.scala 2183:32]
  reg [31:0] result_regs_1_0_Im; // @[FFTDesigns.scala 2183:32]
  reg [31:0] result_regs_1_1_Re; // @[FFTDesigns.scala 2183:32]
  reg [31:0] result_regs_1_1_Im; // @[FFTDesigns.scala 2183:32]
  reg [31:0] result_regs_1_2_Re; // @[FFTDesigns.scala 2183:32]
  reg [31:0] result_regs_1_2_Im; // @[FFTDesigns.scala 2183:32]
  reg [31:0] result_regs_1_3_Re; // @[FFTDesigns.scala 2183:32]
  reg [31:0] result_regs_1_3_Im; // @[FFTDesigns.scala 2183:32]
  TwiddleFactorROM TwiddleFactorROM ( // @[FFTDesigns.scala 2098:26]
    .io_in_addr(TwiddleFactorROM_io_in_addr),
    .io_out_data_1_Re(TwiddleFactorROM_io_out_data_1_Re),
    .io_out_data_1_Im(TwiddleFactorROM_io_out_data_1_Im),
    .io_out_data_3_Re(TwiddleFactorROM_io_out_data_3_Re),
    .io_out_data_3_Im(TwiddleFactorROM_io_out_data_3_Im)
  );
  cmplx_adj cmplx_adj ( // @[FFTDesigns.scala 2146:30]
    .io_in_Re(cmplx_adj_io_in_Re),
    .io_in_Im(cmplx_adj_io_in_Im),
    .io_in_adj(cmplx_adj_io_in_adj),
    .io_is_neg(cmplx_adj_io_is_neg),
    .io_is_flip(cmplx_adj_io_is_flip),
    .io_out_Re(cmplx_adj_io_out_Re),
    .io_out_Im(cmplx_adj_io_out_Im)
  );
  cmplx_adj cmplx_adj_1 ( // @[FFTDesigns.scala 2146:30]
    .io_in_Re(cmplx_adj_1_io_in_Re),
    .io_in_Im(cmplx_adj_1_io_in_Im),
    .io_in_adj(cmplx_adj_1_io_in_adj),
    .io_is_neg(cmplx_adj_1_io_is_neg),
    .io_is_flip(cmplx_adj_1_io_is_flip),
    .io_out_Re(cmplx_adj_1_io_out_Re),
    .io_out_Im(cmplx_adj_1_io_out_Im)
  );
  cmplx_adj cmplx_adj_2 ( // @[FFTDesigns.scala 2146:30]
    .io_in_Re(cmplx_adj_2_io_in_Re),
    .io_in_Im(cmplx_adj_2_io_in_Im),
    .io_in_adj(cmplx_adj_2_io_in_adj),
    .io_is_neg(cmplx_adj_2_io_is_neg),
    .io_is_flip(cmplx_adj_2_io_is_flip),
    .io_out_Re(cmplx_adj_2_io_out_Re),
    .io_out_Im(cmplx_adj_2_io_out_Im)
  );
  cmplx_adj cmplx_adj_3 ( // @[FFTDesigns.scala 2146:30]
    .io_in_Re(cmplx_adj_3_io_in_Re),
    .io_in_Im(cmplx_adj_3_io_in_Im),
    .io_in_adj(cmplx_adj_3_io_in_adj),
    .io_is_neg(cmplx_adj_3_io_is_neg),
    .io_is_flip(cmplx_adj_3_io_is_flip),
    .io_out_Re(cmplx_adj_3_io_out_Re),
    .io_out_Im(cmplx_adj_3_io_out_Im)
  );
  assign io_out_0_Re = result_regs_1_0_Re; // @[FFTDesigns.scala 2193:14]
  assign io_out_0_Im = result_regs_1_0_Im; // @[FFTDesigns.scala 2193:14]
  assign io_out_1_Re = result_regs_1_1_Re; // @[FFTDesigns.scala 2193:14]
  assign io_out_1_Im = result_regs_1_1_Im; // @[FFTDesigns.scala 2193:14]
  assign io_out_2_Re = result_regs_1_2_Re; // @[FFTDesigns.scala 2193:14]
  assign io_out_2_Im = result_regs_1_2_Im; // @[FFTDesigns.scala 2193:14]
  assign io_out_3_Re = result_regs_1_3_Re; // @[FFTDesigns.scala 2193:14]
  assign io_out_3_Im = result_regs_1_3_Im; // @[FFTDesigns.scala 2193:14]
  assign TwiddleFactorROM_io_in_addr = {{2'd0}, cnt}; // @[FFTDesigns.scala 2194:24]
  assign cmplx_adj_io_in_Re = _T_1 ? io_in_0_Re : 32'h0; // @[FFTDesigns.scala 2149:32 2156:29 2177:29]
  assign cmplx_adj_io_in_Im = _T_1 ? io_in_0_Im : 32'h0; // @[FFTDesigns.scala 2149:32 2156:29 2177:29]
  assign cmplx_adj_io_in_adj = 8'h0;
  assign cmplx_adj_io_is_neg = 1'h0; // @[FFTDesigns.scala 2149:32 2180:33]
  assign cmplx_adj_io_is_flip = 1'h0; // @[FFTDesigns.scala 2149:32 2179:34]
  assign cmplx_adj_1_io_in_Re = _T_1 ? io_in_1_Re : 32'h0; // @[FFTDesigns.scala 2149:32 2156:29 2177:29]
  assign cmplx_adj_1_io_in_Im = _T_1 ? io_in_1_Im : 32'h0; // @[FFTDesigns.scala 2149:32 2156:29 2177:29]
  assign cmplx_adj_1_io_in_adj = 8'h0;
  assign cmplx_adj_1_io_is_neg = _T_1 & _GEN_9; // @[FFTDesigns.scala 2149:32 2180:33]
  assign cmplx_adj_1_io_is_flip = _T_1 & _GEN_8; // @[FFTDesigns.scala 2149:32 2179:34]
  assign cmplx_adj_2_io_in_Re = _T_1 ? io_in_2_Re : 32'h0; // @[FFTDesigns.scala 2149:32 2156:29 2177:29]
  assign cmplx_adj_2_io_in_Im = _T_1 ? io_in_2_Im : 32'h0; // @[FFTDesigns.scala 2149:32 2156:29 2177:29]
  assign cmplx_adj_2_io_in_adj = 8'h0;
  assign cmplx_adj_2_io_is_neg = 1'h0; // @[FFTDesigns.scala 2149:32 2180:33]
  assign cmplx_adj_2_io_is_flip = 1'h0; // @[FFTDesigns.scala 2149:32 2179:34]
  assign cmplx_adj_3_io_in_Re = _T_1 ? io_in_3_Re : 32'h0; // @[FFTDesigns.scala 2149:32 2156:29 2177:29]
  assign cmplx_adj_3_io_in_Im = _T_1 ? io_in_3_Im : 32'h0; // @[FFTDesigns.scala 2149:32 2156:29 2177:29]
  assign cmplx_adj_3_io_in_adj = 8'h0;
  assign cmplx_adj_3_io_is_neg = _T_1 & _GEN_17; // @[FFTDesigns.scala 2149:32 2180:33]
  assign cmplx_adj_3_io_is_flip = _T_1 & _GEN_16; // @[FFTDesigns.scala 2149:32 2179:34]
  always @(posedge clock) begin
    if (reset) begin // @[FFTDesigns.scala 2139:24]
      cnt <= 3'h0; // @[FFTDesigns.scala 2139:24]
    end else if (_T_1) begin // @[FFTDesigns.scala 2149:32]
      if (cnt == 3'h7) begin // @[FFTDesigns.scala 2150:34]
        cnt <= 3'h0; // @[FFTDesigns.scala 2151:15]
      end else begin
        cnt <= _cnt_T_1; // @[FFTDesigns.scala 2153:15]
      end
    end else begin
      cnt <= 3'h0; // @[FFTDesigns.scala 2175:13]
    end
    if (reset) begin // @[FFTDesigns.scala 2183:32]
      result_regs_0_0_Re <= 32'h0; // @[FFTDesigns.scala 2183:32]
    end else begin
      result_regs_0_0_Re <= cmplx_adj_io_out_Re; // @[FFTDesigns.scala 2187:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2183:32]
      result_regs_0_0_Im <= 32'h0; // @[FFTDesigns.scala 2183:32]
    end else begin
      result_regs_0_0_Im <= cmplx_adj_io_out_Im; // @[FFTDesigns.scala 2187:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2183:32]
      result_regs_0_1_Re <= 32'h0; // @[FFTDesigns.scala 2183:32]
    end else begin
      result_regs_0_1_Re <= cmplx_adj_1_io_out_Re; // @[FFTDesigns.scala 2187:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2183:32]
      result_regs_0_1_Im <= 32'h0; // @[FFTDesigns.scala 2183:32]
    end else begin
      result_regs_0_1_Im <= cmplx_adj_1_io_out_Im; // @[FFTDesigns.scala 2187:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2183:32]
      result_regs_0_2_Re <= 32'h0; // @[FFTDesigns.scala 2183:32]
    end else begin
      result_regs_0_2_Re <= cmplx_adj_2_io_out_Re; // @[FFTDesigns.scala 2187:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2183:32]
      result_regs_0_2_Im <= 32'h0; // @[FFTDesigns.scala 2183:32]
    end else begin
      result_regs_0_2_Im <= cmplx_adj_2_io_out_Im; // @[FFTDesigns.scala 2187:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2183:32]
      result_regs_0_3_Re <= 32'h0; // @[FFTDesigns.scala 2183:32]
    end else begin
      result_regs_0_3_Re <= cmplx_adj_3_io_out_Re; // @[FFTDesigns.scala 2187:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2183:32]
      result_regs_0_3_Im <= 32'h0; // @[FFTDesigns.scala 2183:32]
    end else begin
      result_regs_0_3_Im <= cmplx_adj_3_io_out_Im; // @[FFTDesigns.scala 2187:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2183:32]
      result_regs_1_0_Re <= 32'h0; // @[FFTDesigns.scala 2183:32]
    end else begin
      result_regs_1_0_Re <= result_regs_0_0_Re; // @[FFTDesigns.scala 2190:26]
    end
    if (reset) begin // @[FFTDesigns.scala 2183:32]
      result_regs_1_0_Im <= 32'h0; // @[FFTDesigns.scala 2183:32]
    end else begin
      result_regs_1_0_Im <= result_regs_0_0_Im; // @[FFTDesigns.scala 2190:26]
    end
    if (reset) begin // @[FFTDesigns.scala 2183:32]
      result_regs_1_1_Re <= 32'h0; // @[FFTDesigns.scala 2183:32]
    end else begin
      result_regs_1_1_Re <= result_regs_0_1_Re; // @[FFTDesigns.scala 2190:26]
    end
    if (reset) begin // @[FFTDesigns.scala 2183:32]
      result_regs_1_1_Im <= 32'h0; // @[FFTDesigns.scala 2183:32]
    end else begin
      result_regs_1_1_Im <= result_regs_0_1_Im; // @[FFTDesigns.scala 2190:26]
    end
    if (reset) begin // @[FFTDesigns.scala 2183:32]
      result_regs_1_2_Re <= 32'h0; // @[FFTDesigns.scala 2183:32]
    end else begin
      result_regs_1_2_Re <= result_regs_0_2_Re; // @[FFTDesigns.scala 2190:26]
    end
    if (reset) begin // @[FFTDesigns.scala 2183:32]
      result_regs_1_2_Im <= 32'h0; // @[FFTDesigns.scala 2183:32]
    end else begin
      result_regs_1_2_Im <= result_regs_0_2_Im; // @[FFTDesigns.scala 2190:26]
    end
    if (reset) begin // @[FFTDesigns.scala 2183:32]
      result_regs_1_3_Re <= 32'h0; // @[FFTDesigns.scala 2183:32]
    end else begin
      result_regs_1_3_Re <= result_regs_0_3_Re; // @[FFTDesigns.scala 2190:26]
    end
    if (reset) begin // @[FFTDesigns.scala 2183:32]
      result_regs_1_3_Im <= 32'h0; // @[FFTDesigns.scala 2183:32]
    end else begin
      result_regs_1_3_Im <= result_regs_0_3_Im; // @[FFTDesigns.scala 2190:26]
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
  cnt = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  result_regs_0_0_Re = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  result_regs_0_0_Im = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  result_regs_0_1_Re = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  result_regs_0_1_Im = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  result_regs_0_2_Re = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  result_regs_0_2_Im = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  result_regs_0_3_Re = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  result_regs_0_3_Im = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  result_regs_1_0_Re = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  result_regs_1_0_Im = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  result_regs_1_1_Re = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  result_regs_1_1_Im = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  result_regs_1_2_Re = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  result_regs_1_2_Im = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  result_regs_1_3_Re = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  result_regs_1_3_Im = _RAND_16[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TwiddleFactorROM_1(
  input  [4:0]  io_in_addr,
  output [31:0] io_out_data_1_Re,
  output [31:0] io_out_data_1_Im,
  output [31:0] io_out_data_3_Re,
  output [31:0] io_out_data_3_Im
);
  wire [31:0] _GEN_18 = 3'h2 == io_in_addr[2:0] ? 32'h3f3504f2 : 32'h3f800000; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_19 = 3'h3 == io_in_addr[2:0] ? 32'h3f3504f2 : _GEN_18; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_20 = 3'h4 == io_in_addr[2:0] ? 32'h248d3131 : _GEN_19; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_21 = 3'h5 == io_in_addr[2:0] ? 32'h248d3131 : _GEN_20; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_22 = 3'h6 == io_in_addr[2:0] ? 32'hbf3504f2 : _GEN_21; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_26 = 3'h2 == io_in_addr[2:0] ? 32'hbf3504f2 : 32'h80800000; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_27 = 3'h3 == io_in_addr[2:0] ? 32'hbf3504f2 : _GEN_26; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_28 = 3'h4 == io_in_addr[2:0] ? 32'hbf800000 : _GEN_27; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_29 = 3'h5 == io_in_addr[2:0] ? 32'hbf800000 : _GEN_28; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_30 = 3'h6 == io_in_addr[2:0] ? 32'hbf3504f2 : _GEN_29; // @[FFTDesigns.scala 2059:{25,25}]
  assign io_out_data_1_Re = 3'h7 == io_in_addr[2:0] ? 32'hbf3504f2 : _GEN_22; // @[FFTDesigns.scala 2058:{25,25}]
  assign io_out_data_1_Im = 3'h7 == io_in_addr[2:0] ? 32'hbf3504f2 : _GEN_30; // @[FFTDesigns.scala 2059:{25,25}]
  assign io_out_data_3_Re = 3'h7 == io_in_addr[2:0] ? 32'hbf3504f2 : _GEN_22; // @[FFTDesigns.scala 2058:{25,25}]
  assign io_out_data_3_Im = 3'h7 == io_in_addr[2:0] ? 32'hbf3504f2 : _GEN_30; // @[FFTDesigns.scala 2059:{25,25}]
endmodule
module FP_subber(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
  output [31:0] io_out_s
);
  wire  FP_adder_clock; // @[FPArithmetic.scala 414:26]
  wire  FP_adder_reset; // @[FPArithmetic.scala 414:26]
  wire [31:0] FP_adder_io_in_a; // @[FPArithmetic.scala 414:26]
  wire [31:0] FP_adder_io_in_b; // @[FPArithmetic.scala 414:26]
  wire [31:0] FP_adder_io_out_s; // @[FPArithmetic.scala 414:26]
  wire  _adjusted_in_b_T_1 = ~io_in_b[31]; // @[FPArithmetic.scala 417:23]
  FP_adder FP_adder ( // @[FPArithmetic.scala 414:26]
    .clock(FP_adder_clock),
    .reset(FP_adder_reset),
    .io_in_a(FP_adder_io_in_a),
    .io_in_b(FP_adder_io_in_b),
    .io_out_s(FP_adder_io_out_s)
  );
  assign io_out_s = FP_adder_io_out_s; // @[FPArithmetic.scala 420:14]
  assign FP_adder_clock = clock;
  assign FP_adder_reset = reset;
  assign FP_adder_io_in_a = io_in_a; // @[FPArithmetic.scala 418:22]
  assign FP_adder_io_in_b = {_adjusted_in_b_T_1,io_in_b[30:0]}; // @[FPArithmetic.scala 417:39]
endmodule
module multiplier(
  input  [23:0] io_in_a,
  input  [23:0] io_in_b,
  output [47:0] io_out_s
);
  assign io_out_s = io_in_a * io_in_b; // @[Arithmetic.scala 84:23]
endmodule
module full_adder_42(
  input  [7:0] io_in_a,
  input  [7:0] io_in_b,
  output [7:0] io_out_s
);
  wire [8:0] _result_T = io_in_a + io_in_b; // @[Arithmetic.scala 58:23]
  wire [9:0] _result_T_1 = {{1'd0}, _result_T}; // @[Arithmetic.scala 58:34]
  wire [8:0] result = _result_T_1[8:0]; // @[Arithmetic.scala 57:22 58:12]
  assign io_out_s = result[7:0]; // @[Arithmetic.scala 59:23]
endmodule
module FP_multiplier(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
  output [31:0] io_out_s
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [23:0] multiplier_io_in_a; // @[FPArithmetic.scala 488:28]
  wire [23:0] multiplier_io_in_b; // @[FPArithmetic.scala 488:28]
  wire [47:0] multiplier_io_out_s; // @[FPArithmetic.scala 488:28]
  wire [7:0] subber_io_in_a; // @[FPArithmetic.scala 493:24]
  wire [7:0] subber_io_in_b; // @[FPArithmetic.scala 493:24]
  wire [7:0] subber_io_out_s; // @[FPArithmetic.scala 493:24]
  wire  subber_io_out_c; // @[FPArithmetic.scala 493:24]
  wire [7:0] complementN_io_in; // @[FPArithmetic.scala 499:29]
  wire [7:0] complementN_io_out; // @[FPArithmetic.scala 499:29]
  wire [7:0] adderN_io_in_a; // @[FPArithmetic.scala 503:24]
  wire [7:0] adderN_io_in_b; // @[FPArithmetic.scala 503:24]
  wire [7:0] adderN_io_out_s; // @[FPArithmetic.scala 503:24]
  wire  s_0 = io_in_a[31]; // @[FPArithmetic.scala 453:20]
  wire  s_1 = io_in_b[31]; // @[FPArithmetic.scala 454:20]
  wire [8:0] _T_2 = 9'h100 - 9'h2; // @[FPArithmetic.scala 458:62]
  wire [8:0] _GEN_13 = {{1'd0}, io_in_a[30:23]}; // @[FPArithmetic.scala 458:34]
  wire [8:0] _GEN_0 = _GEN_13 > _T_2 ? _T_2 : {{1'd0}, io_in_a[30:23]}; // @[FPArithmetic.scala 458:68 459:14 461:14]
  wire [8:0] _GEN_14 = {{1'd0}, io_in_b[30:23]}; // @[FPArithmetic.scala 463:34]
  wire [8:0] _GEN_1 = _GEN_14 > _T_2 ? _T_2 : {{1'd0}, io_in_b[30:23]}; // @[FPArithmetic.scala 463:68 464:14 466:14]
  wire [22:0] exp_check_0 = {{15'd0}, io_in_a[30:23]}; // @[FPArithmetic.scala 469:25 470:18]
  wire [22:0] _cond_holder_T_1 = exp_check_0 + 23'h1; // @[FPArithmetic.scala 474:34]
  wire [22:0] exp_check_1 = {{15'd0}, io_in_b[30:23]}; // @[FPArithmetic.scala 469:25 471:18]
  wire [22:0] _cond_holder_T_3 = 23'h7f - exp_check_1; // @[FPArithmetic.scala 474:80]
  wire [22:0] _cond_holder_T_4 = ~_cond_holder_T_3; // @[FPArithmetic.scala 474:42]
  wire [22:0] _cond_holder_T_6 = _cond_holder_T_1 + _cond_holder_T_4; // @[FPArithmetic.scala 474:40]
  wire [22:0] frac_0 = io_in_a[22:0]; // @[FPArithmetic.scala 478:23]
  wire [22:0] frac_1 = io_in_b[22:0]; // @[FPArithmetic.scala 479:23]
  wire  new_s = s_0 ^ s_1; // @[FPArithmetic.scala 510:19]
  wire [7:0] _new_exp_T_1 = adderN_io_out_s + 8'h1; // @[FPArithmetic.scala 521:34]
  wire [22:0] _cond_holder_T_8 = exp_check_0 + 23'h2; // @[FPArithmetic.scala 523:36]
  wire [22:0] _cond_holder_T_13 = _cond_holder_T_8 + _cond_holder_T_4; // @[FPArithmetic.scala 523:42]
  wire [23:0] _new_mant_T_2 = {multiplier_io_out_s[46:24], 1'h0}; // @[FPArithmetic.scala 529:73]
  wire [7:0] _GEN_2 = multiplier_io_out_s[47] ? _new_exp_T_1 : adderN_io_out_s; // @[FPArithmetic.scala 520:60 521:15 526:15]
  wire [22:0] cond_holder = multiplier_io_out_s[47] ? _cond_holder_T_13 : _cond_holder_T_6; // @[FPArithmetic.scala 520:60 523:19 528:19]
  wire [23:0] _GEN_5 = multiplier_io_out_s[47] ? {{1'd0}, multiplier_io_out_s[46:24]} : _new_mant_T_2; // @[FPArithmetic.scala 520:60 524:16 529:16]
  reg [31:0] reg_out_s; // @[FPArithmetic.scala 531:28]
  wire [22:0] _T_12 = ~cond_holder; // @[FPArithmetic.scala 533:51]
  wire [22:0] _T_14 = 23'h1 + _T_12; // @[FPArithmetic.scala 533:49]
  wire [22:0] _GEN_15 = {{14'd0}, _T_2}; // @[FPArithmetic.scala 533:42]
  wire [8:0] _GEN_6 = cond_holder > _GEN_15 ? _T_2 : {{1'd0}, _GEN_2}; // @[FPArithmetic.scala 538:61 539:15]
  wire [8:0] _GEN_9 = _GEN_15 >= _T_14 ? 9'h1 : _GEN_6; // @[FPArithmetic.scala 533:67 534:15]
  wire [7:0] new_exp = _GEN_9[7:0]; // @[FPArithmetic.scala 513:23]
  wire [23:0] _new_mant_T_4 = 24'h800000 - 24'h1; // @[FPArithmetic.scala 540:45]
  wire [23:0] _GEN_7 = cond_holder > _GEN_15 ? _new_mant_T_4 : _GEN_5; // @[FPArithmetic.scala 538:61 540:16]
  wire [23:0] _GEN_10 = _GEN_15 >= _T_14 ? 24'h400000 : _GEN_7; // @[FPArithmetic.scala 533:67 535:16]
  wire [22:0] new_mant = _GEN_10[22:0]; // @[FPArithmetic.scala 515:24]
  wire [31:0] _reg_out_s_T_1 = {new_s,new_exp,new_mant}; // @[FPArithmetic.scala 536:37]
  wire [7:0] exp_0 = _GEN_0[7:0]; // @[FPArithmetic.scala 457:19]
  wire [7:0] exp_1 = _GEN_1[7:0]; // @[FPArithmetic.scala 457:19]
  multiplier multiplier ( // @[FPArithmetic.scala 488:28]
    .io_in_a(multiplier_io_in_a),
    .io_in_b(multiplier_io_in_b),
    .io_out_s(multiplier_io_out_s)
  );
  full_subber subber ( // @[FPArithmetic.scala 493:24]
    .io_in_a(subber_io_in_a),
    .io_in_b(subber_io_in_b),
    .io_out_s(subber_io_out_s),
    .io_out_c(subber_io_out_c)
  );
  twoscomplement complementN ( // @[FPArithmetic.scala 499:29]
    .io_in(complementN_io_in),
    .io_out(complementN_io_out)
  );
  full_adder_42 adderN ( // @[FPArithmetic.scala 503:24]
    .io_in_a(adderN_io_in_a),
    .io_in_b(adderN_io_in_b),
    .io_out_s(adderN_io_out_s)
  );
  assign io_out_s = reg_out_s; // @[FPArithmetic.scala 548:14]
  assign multiplier_io_in_a = {1'h1,frac_0}; // @[FPArithmetic.scala 483:24]
  assign multiplier_io_in_b = {1'h1,frac_1}; // @[FPArithmetic.scala 484:24]
  assign subber_io_in_a = 8'h7f; // @[FPArithmetic.scala 494:20]
  assign subber_io_in_b = _GEN_1[7:0]; // @[FPArithmetic.scala 457:19]
  assign complementN_io_in = subber_io_out_s; // @[FPArithmetic.scala 500:23]
  assign adderN_io_in_a = _GEN_0[7:0]; // @[FPArithmetic.scala 457:19]
  assign adderN_io_in_b = complementN_io_out; // @[FPArithmetic.scala 505:20]
  always @(posedge clock) begin
    if (reset) begin // @[FPArithmetic.scala 531:28]
      reg_out_s <= 32'h0; // @[FPArithmetic.scala 531:28]
    end else if (exp_0 == 8'h0 | exp_1 == 8'h0) begin // @[FPArithmetic.scala 543:43]
      reg_out_s <= 32'h0; // @[FPArithmetic.scala 544:17]
    end else begin
      reg_out_s <= _reg_out_s_T_1; // @[FPArithmetic.scala 546:17]
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
module FPComplexMult(
  input         clock,
  input         reset,
  input  [31:0] io_in_a_Re,
  input  [31:0] io_in_a_Im,
  input  [31:0] io_in_b_Re,
  input  [31:0] io_in_b_Im,
  output [31:0] io_out_s_Re,
  output [31:0] io_out_s_Im
);
  wire  FP_subber_clock; // @[FPComplex.scala 123:24]
  wire  FP_subber_reset; // @[FPComplex.scala 123:24]
  wire [31:0] FP_subber_io_in_a; // @[FPComplex.scala 123:24]
  wire [31:0] FP_subber_io_in_b; // @[FPComplex.scala 123:24]
  wire [31:0] FP_subber_io_out_s; // @[FPComplex.scala 123:24]
  wire  FP_adder_clock; // @[FPComplex.scala 124:24]
  wire  FP_adder_reset; // @[FPComplex.scala 124:24]
  wire [31:0] FP_adder_io_in_a; // @[FPComplex.scala 124:24]
  wire [31:0] FP_adder_io_in_b; // @[FPComplex.scala 124:24]
  wire [31:0] FP_adder_io_out_s; // @[FPComplex.scala 124:24]
  wire  FP_multiplier_clock; // @[FPComplex.scala 126:26]
  wire  FP_multiplier_reset; // @[FPComplex.scala 126:26]
  wire [31:0] FP_multiplier_io_in_a; // @[FPComplex.scala 126:26]
  wire [31:0] FP_multiplier_io_in_b; // @[FPComplex.scala 126:26]
  wire [31:0] FP_multiplier_io_out_s; // @[FPComplex.scala 126:26]
  wire  FP_multiplier_1_clock; // @[FPComplex.scala 126:26]
  wire  FP_multiplier_1_reset; // @[FPComplex.scala 126:26]
  wire [31:0] FP_multiplier_1_io_in_a; // @[FPComplex.scala 126:26]
  wire [31:0] FP_multiplier_1_io_in_b; // @[FPComplex.scala 126:26]
  wire [31:0] FP_multiplier_1_io_out_s; // @[FPComplex.scala 126:26]
  wire  FP_multiplier_2_clock; // @[FPComplex.scala 126:26]
  wire  FP_multiplier_2_reset; // @[FPComplex.scala 126:26]
  wire [31:0] FP_multiplier_2_io_in_a; // @[FPComplex.scala 126:26]
  wire [31:0] FP_multiplier_2_io_in_b; // @[FPComplex.scala 126:26]
  wire [31:0] FP_multiplier_2_io_out_s; // @[FPComplex.scala 126:26]
  wire  FP_multiplier_3_clock; // @[FPComplex.scala 126:26]
  wire  FP_multiplier_3_reset; // @[FPComplex.scala 126:26]
  wire [31:0] FP_multiplier_3_io_in_a; // @[FPComplex.scala 126:26]
  wire [31:0] FP_multiplier_3_io_in_b; // @[FPComplex.scala 126:26]
  wire [31:0] FP_multiplier_3_io_out_s; // @[FPComplex.scala 126:26]
  FP_subber FP_subber ( // @[FPComplex.scala 123:24]
    .clock(FP_subber_clock),
    .reset(FP_subber_reset),
    .io_in_a(FP_subber_io_in_a),
    .io_in_b(FP_subber_io_in_b),
    .io_out_s(FP_subber_io_out_s)
  );
  FP_adder FP_adder ( // @[FPComplex.scala 124:24]
    .clock(FP_adder_clock),
    .reset(FP_adder_reset),
    .io_in_a(FP_adder_io_in_a),
    .io_in_b(FP_adder_io_in_b),
    .io_out_s(FP_adder_io_out_s)
  );
  FP_multiplier FP_multiplier ( // @[FPComplex.scala 126:26]
    .clock(FP_multiplier_clock),
    .reset(FP_multiplier_reset),
    .io_in_a(FP_multiplier_io_in_a),
    .io_in_b(FP_multiplier_io_in_b),
    .io_out_s(FP_multiplier_io_out_s)
  );
  FP_multiplier FP_multiplier_1 ( // @[FPComplex.scala 126:26]
    .clock(FP_multiplier_1_clock),
    .reset(FP_multiplier_1_reset),
    .io_in_a(FP_multiplier_1_io_in_a),
    .io_in_b(FP_multiplier_1_io_in_b),
    .io_out_s(FP_multiplier_1_io_out_s)
  );
  FP_multiplier FP_multiplier_2 ( // @[FPComplex.scala 126:26]
    .clock(FP_multiplier_2_clock),
    .reset(FP_multiplier_2_reset),
    .io_in_a(FP_multiplier_2_io_in_a),
    .io_in_b(FP_multiplier_2_io_in_b),
    .io_out_s(FP_multiplier_2_io_out_s)
  );
  FP_multiplier FP_multiplier_3 ( // @[FPComplex.scala 126:26]
    .clock(FP_multiplier_3_clock),
    .reset(FP_multiplier_3_reset),
    .io_in_a(FP_multiplier_3_io_in_a),
    .io_in_b(FP_multiplier_3_io_in_b),
    .io_out_s(FP_multiplier_3_io_out_s)
  );
  assign io_out_s_Re = FP_subber_io_out_s; // @[FPComplex.scala 141:17]
  assign io_out_s_Im = FP_adder_io_out_s; // @[FPComplex.scala 142:17]
  assign FP_subber_clock = clock;
  assign FP_subber_reset = reset;
  assign FP_subber_io_in_a = FP_multiplier_io_out_s; // @[FPComplex.scala 137:17]
  assign FP_subber_io_in_b = FP_multiplier_1_io_out_s; // @[FPComplex.scala 138:17]
  assign FP_adder_clock = clock;
  assign FP_adder_reset = reset;
  assign FP_adder_io_in_a = FP_multiplier_2_io_out_s; // @[FPComplex.scala 139:17]
  assign FP_adder_io_in_b = FP_multiplier_3_io_out_s; // @[FPComplex.scala 140:17]
  assign FP_multiplier_clock = clock;
  assign FP_multiplier_reset = reset;
  assign FP_multiplier_io_in_a = io_in_a_Re; // @[FPComplex.scala 129:28]
  assign FP_multiplier_io_in_b = io_in_b_Re; // @[FPComplex.scala 130:28]
  assign FP_multiplier_1_clock = clock;
  assign FP_multiplier_1_reset = reset;
  assign FP_multiplier_1_io_in_a = io_in_a_Im; // @[FPComplex.scala 131:28]
  assign FP_multiplier_1_io_in_b = io_in_b_Im; // @[FPComplex.scala 132:28]
  assign FP_multiplier_2_clock = clock;
  assign FP_multiplier_2_reset = reset;
  assign FP_multiplier_2_io_in_a = io_in_a_Re; // @[FPComplex.scala 133:28]
  assign FP_multiplier_2_io_in_b = io_in_b_Im; // @[FPComplex.scala 134:28]
  assign FP_multiplier_3_clock = clock;
  assign FP_multiplier_3_reset = reset;
  assign FP_multiplier_3_io_in_a = io_in_a_Im; // @[FPComplex.scala 135:28]
  assign FP_multiplier_3_io_in_b = io_in_b_Re; // @[FPComplex.scala 136:28]
endmodule
module TwiddleFactorsStreamed_1(
  input         clock,
  input         reset,
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  input  [31:0] io_in_2_Re,
  input  [31:0] io_in_2_Im,
  input  [31:0] io_in_3_Re,
  input  [31:0] io_in_3_Im,
  input         io_in_en_0,
  input         io_in_en_1,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im,
  output [31:0] io_out_2_Re,
  output [31:0] io_out_2_Im,
  output [31:0] io_out_3_Re,
  output [31:0] io_out_3_Im
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [4:0] TwiddleFactorROM_io_in_addr; // @[FFTDesigns.scala 2098:26]
  wire [31:0] TwiddleFactorROM_io_out_data_1_Re; // @[FFTDesigns.scala 2098:26]
  wire [31:0] TwiddleFactorROM_io_out_data_1_Im; // @[FFTDesigns.scala 2098:26]
  wire [31:0] TwiddleFactorROM_io_out_data_3_Re; // @[FFTDesigns.scala 2098:26]
  wire [31:0] TwiddleFactorROM_io_out_data_3_Im; // @[FFTDesigns.scala 2098:26]
  wire  FPComplexMult_clock; // @[FFTDesigns.scala 2113:30]
  wire  FPComplexMult_reset; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_io_in_a_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_io_in_a_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_io_in_b_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_io_in_b_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_io_out_s_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_io_out_s_Im; // @[FFTDesigns.scala 2113:30]
  wire  FPComplexMult_1_clock; // @[FFTDesigns.scala 2113:30]
  wire  FPComplexMult_1_reset; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_1_io_in_a_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_1_io_in_a_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_1_io_in_b_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_1_io_in_b_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_1_io_out_s_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_1_io_out_s_Im; // @[FFTDesigns.scala 2113:30]
  wire  FPComplexMult_2_clock; // @[FFTDesigns.scala 2113:30]
  wire  FPComplexMult_2_reset; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_2_io_in_a_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_2_io_in_a_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_2_io_in_b_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_2_io_in_b_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_2_io_out_s_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_2_io_out_s_Im; // @[FFTDesigns.scala 2113:30]
  wire  FPComplexMult_3_clock; // @[FFTDesigns.scala 2113:30]
  wire  FPComplexMult_3_reset; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_3_io_in_a_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_3_io_in_a_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_3_io_in_b_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_3_io_in_b_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_3_io_out_s_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_3_io_out_s_Im; // @[FFTDesigns.scala 2113:30]
  reg [2:0] cnt; // @[FFTDesigns.scala 2106:24]
  wire [1:0] _T = {io_in_en_1,io_in_en_0}; // @[FFTDesigns.scala 2107:21]
  wire  _T_1 = |_T; // @[FFTDesigns.scala 2107:28]
  wire [2:0] _cnt_T_1 = cnt + 3'h1; // @[FFTDesigns.scala 2120:22]
  TwiddleFactorROM_1 TwiddleFactorROM ( // @[FFTDesigns.scala 2098:26]
    .io_in_addr(TwiddleFactorROM_io_in_addr),
    .io_out_data_1_Re(TwiddleFactorROM_io_out_data_1_Re),
    .io_out_data_1_Im(TwiddleFactorROM_io_out_data_1_Im),
    .io_out_data_3_Re(TwiddleFactorROM_io_out_data_3_Re),
    .io_out_data_3_Im(TwiddleFactorROM_io_out_data_3_Im)
  );
  FPComplexMult FPComplexMult ( // @[FFTDesigns.scala 2113:30]
    .clock(FPComplexMult_clock),
    .reset(FPComplexMult_reset),
    .io_in_a_Re(FPComplexMult_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_io_out_s_Im)
  );
  FPComplexMult FPComplexMult_1 ( // @[FFTDesigns.scala 2113:30]
    .clock(FPComplexMult_1_clock),
    .reset(FPComplexMult_1_reset),
    .io_in_a_Re(FPComplexMult_1_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_1_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_1_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_1_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_1_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_1_io_out_s_Im)
  );
  FPComplexMult FPComplexMult_2 ( // @[FFTDesigns.scala 2113:30]
    .clock(FPComplexMult_2_clock),
    .reset(FPComplexMult_2_reset),
    .io_in_a_Re(FPComplexMult_2_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_2_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_2_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_2_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_2_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_2_io_out_s_Im)
  );
  FPComplexMult FPComplexMult_3 ( // @[FFTDesigns.scala 2113:30]
    .clock(FPComplexMult_3_clock),
    .reset(FPComplexMult_3_reset),
    .io_in_a_Re(FPComplexMult_3_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_3_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_3_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_3_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_3_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_3_io_out_s_Im)
  );
  assign io_out_0_Re = FPComplexMult_io_out_s_Re; // @[FFTDesigns.scala 2134:19]
  assign io_out_0_Im = FPComplexMult_io_out_s_Im; // @[FFTDesigns.scala 2134:19]
  assign io_out_1_Re = FPComplexMult_1_io_out_s_Re; // @[FFTDesigns.scala 2134:19]
  assign io_out_1_Im = FPComplexMult_1_io_out_s_Im; // @[FFTDesigns.scala 2134:19]
  assign io_out_2_Re = FPComplexMult_2_io_out_s_Re; // @[FFTDesigns.scala 2134:19]
  assign io_out_2_Im = FPComplexMult_2_io_out_s_Im; // @[FFTDesigns.scala 2134:19]
  assign io_out_3_Re = FPComplexMult_3_io_out_s_Re; // @[FFTDesigns.scala 2134:19]
  assign io_out_3_Im = FPComplexMult_3_io_out_s_Im; // @[FFTDesigns.scala 2134:19]
  assign TwiddleFactorROM_io_in_addr = {{2'd0}, cnt}; // @[FFTDesigns.scala 2136:24]
  assign FPComplexMult_clock = clock;
  assign FPComplexMult_reset = reset;
  assign FPComplexMult_io_in_a_Re = _T_1 ? io_in_0_Re : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_io_in_a_Im = _T_1 ? io_in_0_Im : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_io_in_b_Re = _T_1 ? 32'h3f800000 : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  assign FPComplexMult_io_in_b_Im = _T_1 ? 32'h80800000 : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  assign FPComplexMult_1_clock = clock;
  assign FPComplexMult_1_reset = reset;
  assign FPComplexMult_1_io_in_a_Re = _T_1 ? io_in_1_Re : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_1_io_in_a_Im = _T_1 ? io_in_1_Im : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_1_io_in_b_Re = _T_1 ? TwiddleFactorROM_io_out_data_1_Re : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  assign FPComplexMult_1_io_in_b_Im = _T_1 ? TwiddleFactorROM_io_out_data_1_Im : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  assign FPComplexMult_2_clock = clock;
  assign FPComplexMult_2_reset = reset;
  assign FPComplexMult_2_io_in_a_Re = _T_1 ? io_in_2_Re : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_2_io_in_a_Im = _T_1 ? io_in_2_Im : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_2_io_in_b_Re = _T_1 ? 32'h3f800000 : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  assign FPComplexMult_2_io_in_b_Im = _T_1 ? 32'h80800000 : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  assign FPComplexMult_3_clock = clock;
  assign FPComplexMult_3_reset = reset;
  assign FPComplexMult_3_io_in_a_Re = _T_1 ? io_in_3_Re : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_3_io_in_a_Im = _T_1 ? io_in_3_Im : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_3_io_in_b_Re = _T_1 ? TwiddleFactorROM_io_out_data_3_Re : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  assign FPComplexMult_3_io_in_b_Im = _T_1 ? TwiddleFactorROM_io_out_data_3_Im : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  always @(posedge clock) begin
    if (reset) begin // @[FFTDesigns.scala 2106:24]
      cnt <= 3'h0; // @[FFTDesigns.scala 2106:24]
    end else if (_T_1) begin // @[FFTDesigns.scala 2116:32]
      if (cnt == 3'h7) begin // @[FFTDesigns.scala 2117:34]
        cnt <= 3'h0; // @[FFTDesigns.scala 2118:15]
      end else begin
        cnt <= _cnt_T_1; // @[FFTDesigns.scala 2120:15]
      end
    end else begin
      cnt <= 3'h0; // @[FFTDesigns.scala 2131:13]
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
  cnt = _RAND_0[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TwiddleFactorROM_2(
  input  [4:0]  io_in_addr,
  output [31:0] io_out_data_1_Re,
  output [31:0] io_out_data_1_Im,
  output [31:0] io_out_data_3_Re,
  output [31:0] io_out_data_3_Im
);
  wire [31:0] _GEN_17 = 3'h1 == io_in_addr[2:0] ? 32'h3f6c835e : 32'h3f800000; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_18 = 3'h2 == io_in_addr[2:0] ? 32'h3f3504f2 : _GEN_17; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_19 = 3'h3 == io_in_addr[2:0] ? 32'h3ec3ef14 : _GEN_18; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_20 = 3'h4 == io_in_addr[2:0] ? 32'h248d3131 : _GEN_19; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_21 = 3'h5 == io_in_addr[2:0] ? 32'hbec3ef14 : _GEN_20; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_22 = 3'h6 == io_in_addr[2:0] ? 32'hbf3504f2 : _GEN_21; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_25 = 3'h1 == io_in_addr[2:0] ? 32'hbec3ef14 : 32'h80800000; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_26 = 3'h2 == io_in_addr[2:0] ? 32'hbf3504f2 : _GEN_25; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_27 = 3'h3 == io_in_addr[2:0] ? 32'hbf6c835e : _GEN_26; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_28 = 3'h4 == io_in_addr[2:0] ? 32'hbf800000 : _GEN_27; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_29 = 3'h5 == io_in_addr[2:0] ? 32'hbf6c835e : _GEN_28; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_30 = 3'h6 == io_in_addr[2:0] ? 32'hbf3504f2 : _GEN_29; // @[FFTDesigns.scala 2059:{25,25}]
  assign io_out_data_1_Re = 3'h7 == io_in_addr[2:0] ? 32'hbf6c835e : _GEN_22; // @[FFTDesigns.scala 2058:{25,25}]
  assign io_out_data_1_Im = 3'h7 == io_in_addr[2:0] ? 32'hbec3ef14 : _GEN_30; // @[FFTDesigns.scala 2059:{25,25}]
  assign io_out_data_3_Re = 3'h7 == io_in_addr[2:0] ? 32'hbf6c835e : _GEN_22; // @[FFTDesigns.scala 2058:{25,25}]
  assign io_out_data_3_Im = 3'h7 == io_in_addr[2:0] ? 32'hbec3ef14 : _GEN_30; // @[FFTDesigns.scala 2059:{25,25}]
endmodule
module TwiddleFactorsStreamed_2(
  input         clock,
  input         reset,
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  input  [31:0] io_in_2_Re,
  input  [31:0] io_in_2_Im,
  input  [31:0] io_in_3_Re,
  input  [31:0] io_in_3_Im,
  input         io_in_en_0,
  input         io_in_en_1,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im,
  output [31:0] io_out_2_Re,
  output [31:0] io_out_2_Im,
  output [31:0] io_out_3_Re,
  output [31:0] io_out_3_Im
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [4:0] TwiddleFactorROM_io_in_addr; // @[FFTDesigns.scala 2098:26]
  wire [31:0] TwiddleFactorROM_io_out_data_1_Re; // @[FFTDesigns.scala 2098:26]
  wire [31:0] TwiddleFactorROM_io_out_data_1_Im; // @[FFTDesigns.scala 2098:26]
  wire [31:0] TwiddleFactorROM_io_out_data_3_Re; // @[FFTDesigns.scala 2098:26]
  wire [31:0] TwiddleFactorROM_io_out_data_3_Im; // @[FFTDesigns.scala 2098:26]
  wire  FPComplexMult_clock; // @[FFTDesigns.scala 2113:30]
  wire  FPComplexMult_reset; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_io_in_a_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_io_in_a_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_io_in_b_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_io_in_b_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_io_out_s_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_io_out_s_Im; // @[FFTDesigns.scala 2113:30]
  wire  FPComplexMult_1_clock; // @[FFTDesigns.scala 2113:30]
  wire  FPComplexMult_1_reset; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_1_io_in_a_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_1_io_in_a_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_1_io_in_b_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_1_io_in_b_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_1_io_out_s_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_1_io_out_s_Im; // @[FFTDesigns.scala 2113:30]
  wire  FPComplexMult_2_clock; // @[FFTDesigns.scala 2113:30]
  wire  FPComplexMult_2_reset; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_2_io_in_a_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_2_io_in_a_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_2_io_in_b_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_2_io_in_b_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_2_io_out_s_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_2_io_out_s_Im; // @[FFTDesigns.scala 2113:30]
  wire  FPComplexMult_3_clock; // @[FFTDesigns.scala 2113:30]
  wire  FPComplexMult_3_reset; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_3_io_in_a_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_3_io_in_a_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_3_io_in_b_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_3_io_in_b_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_3_io_out_s_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_3_io_out_s_Im; // @[FFTDesigns.scala 2113:30]
  reg [2:0] cnt; // @[FFTDesigns.scala 2106:24]
  wire [1:0] _T = {io_in_en_1,io_in_en_0}; // @[FFTDesigns.scala 2107:21]
  wire  _T_1 = |_T; // @[FFTDesigns.scala 2107:28]
  wire [2:0] _cnt_T_1 = cnt + 3'h1; // @[FFTDesigns.scala 2120:22]
  TwiddleFactorROM_2 TwiddleFactorROM ( // @[FFTDesigns.scala 2098:26]
    .io_in_addr(TwiddleFactorROM_io_in_addr),
    .io_out_data_1_Re(TwiddleFactorROM_io_out_data_1_Re),
    .io_out_data_1_Im(TwiddleFactorROM_io_out_data_1_Im),
    .io_out_data_3_Re(TwiddleFactorROM_io_out_data_3_Re),
    .io_out_data_3_Im(TwiddleFactorROM_io_out_data_3_Im)
  );
  FPComplexMult FPComplexMult ( // @[FFTDesigns.scala 2113:30]
    .clock(FPComplexMult_clock),
    .reset(FPComplexMult_reset),
    .io_in_a_Re(FPComplexMult_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_io_out_s_Im)
  );
  FPComplexMult FPComplexMult_1 ( // @[FFTDesigns.scala 2113:30]
    .clock(FPComplexMult_1_clock),
    .reset(FPComplexMult_1_reset),
    .io_in_a_Re(FPComplexMult_1_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_1_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_1_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_1_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_1_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_1_io_out_s_Im)
  );
  FPComplexMult FPComplexMult_2 ( // @[FFTDesigns.scala 2113:30]
    .clock(FPComplexMult_2_clock),
    .reset(FPComplexMult_2_reset),
    .io_in_a_Re(FPComplexMult_2_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_2_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_2_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_2_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_2_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_2_io_out_s_Im)
  );
  FPComplexMult FPComplexMult_3 ( // @[FFTDesigns.scala 2113:30]
    .clock(FPComplexMult_3_clock),
    .reset(FPComplexMult_3_reset),
    .io_in_a_Re(FPComplexMult_3_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_3_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_3_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_3_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_3_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_3_io_out_s_Im)
  );
  assign io_out_0_Re = FPComplexMult_io_out_s_Re; // @[FFTDesigns.scala 2134:19]
  assign io_out_0_Im = FPComplexMult_io_out_s_Im; // @[FFTDesigns.scala 2134:19]
  assign io_out_1_Re = FPComplexMult_1_io_out_s_Re; // @[FFTDesigns.scala 2134:19]
  assign io_out_1_Im = FPComplexMult_1_io_out_s_Im; // @[FFTDesigns.scala 2134:19]
  assign io_out_2_Re = FPComplexMult_2_io_out_s_Re; // @[FFTDesigns.scala 2134:19]
  assign io_out_2_Im = FPComplexMult_2_io_out_s_Im; // @[FFTDesigns.scala 2134:19]
  assign io_out_3_Re = FPComplexMult_3_io_out_s_Re; // @[FFTDesigns.scala 2134:19]
  assign io_out_3_Im = FPComplexMult_3_io_out_s_Im; // @[FFTDesigns.scala 2134:19]
  assign TwiddleFactorROM_io_in_addr = {{2'd0}, cnt}; // @[FFTDesigns.scala 2136:24]
  assign FPComplexMult_clock = clock;
  assign FPComplexMult_reset = reset;
  assign FPComplexMult_io_in_a_Re = _T_1 ? io_in_0_Re : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_io_in_a_Im = _T_1 ? io_in_0_Im : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_io_in_b_Re = _T_1 ? 32'h3f800000 : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  assign FPComplexMult_io_in_b_Im = _T_1 ? 32'h80800000 : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  assign FPComplexMult_1_clock = clock;
  assign FPComplexMult_1_reset = reset;
  assign FPComplexMult_1_io_in_a_Re = _T_1 ? io_in_1_Re : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_1_io_in_a_Im = _T_1 ? io_in_1_Im : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_1_io_in_b_Re = _T_1 ? TwiddleFactorROM_io_out_data_1_Re : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  assign FPComplexMult_1_io_in_b_Im = _T_1 ? TwiddleFactorROM_io_out_data_1_Im : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  assign FPComplexMult_2_clock = clock;
  assign FPComplexMult_2_reset = reset;
  assign FPComplexMult_2_io_in_a_Re = _T_1 ? io_in_2_Re : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_2_io_in_a_Im = _T_1 ? io_in_2_Im : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_2_io_in_b_Re = _T_1 ? 32'h3f800000 : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  assign FPComplexMult_2_io_in_b_Im = _T_1 ? 32'h80800000 : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  assign FPComplexMult_3_clock = clock;
  assign FPComplexMult_3_reset = reset;
  assign FPComplexMult_3_io_in_a_Re = _T_1 ? io_in_3_Re : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_3_io_in_a_Im = _T_1 ? io_in_3_Im : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_3_io_in_b_Re = _T_1 ? TwiddleFactorROM_io_out_data_3_Re : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  assign FPComplexMult_3_io_in_b_Im = _T_1 ? TwiddleFactorROM_io_out_data_3_Im : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  always @(posedge clock) begin
    if (reset) begin // @[FFTDesigns.scala 2106:24]
      cnt <= 3'h0; // @[FFTDesigns.scala 2106:24]
    end else if (_T_1) begin // @[FFTDesigns.scala 2116:32]
      if (cnt == 3'h7) begin // @[FFTDesigns.scala 2117:34]
        cnt <= 3'h0; // @[FFTDesigns.scala 2118:15]
      end else begin
        cnt <= _cnt_T_1; // @[FFTDesigns.scala 2120:15]
      end
    end else begin
      cnt <= 3'h0; // @[FFTDesigns.scala 2131:13]
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
  cnt = _RAND_0[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TwiddleFactorROM_3(
  input  [4:0]  io_in_addr,
  output [31:0] io_out_data_1_Re,
  output [31:0] io_out_data_1_Im,
  output [31:0] io_out_data_3_Re,
  output [31:0] io_out_data_3_Im
);
  wire [31:0] _GEN_17 = 3'h1 == io_in_addr[2:0] ? 32'h3f6c835e : 32'h3f800000; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_18 = 3'h2 == io_in_addr[2:0] ? 32'h3f3504f2 : _GEN_17; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_19 = 3'h3 == io_in_addr[2:0] ? 32'h3ec3ef14 : _GEN_18; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_20 = 3'h4 == io_in_addr[2:0] ? 32'h248d3131 : _GEN_19; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_21 = 3'h5 == io_in_addr[2:0] ? 32'hbec3ef14 : _GEN_20; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_22 = 3'h6 == io_in_addr[2:0] ? 32'hbf3504f2 : _GEN_21; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_25 = 3'h1 == io_in_addr[2:0] ? 32'hbec3ef14 : 32'h80800000; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_26 = 3'h2 == io_in_addr[2:0] ? 32'hbf3504f2 : _GEN_25; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_27 = 3'h3 == io_in_addr[2:0] ? 32'hbf6c835e : _GEN_26; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_28 = 3'h4 == io_in_addr[2:0] ? 32'hbf800000 : _GEN_27; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_29 = 3'h5 == io_in_addr[2:0] ? 32'hbf6c835e : _GEN_28; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_30 = 3'h6 == io_in_addr[2:0] ? 32'hbf3504f2 : _GEN_29; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_49 = 3'h1 == io_in_addr[2:0] ? 32'h3f54db30 : 32'h3f7b14be; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_50 = 3'h2 == io_in_addr[2:0] ? 32'h3f0e39d8 : _GEN_49; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_51 = 3'h3 == io_in_addr[2:0] ? 32'h3e47c5c0 : _GEN_50; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_52 = 3'h4 == io_in_addr[2:0] ? 32'hbe47c5c0 : _GEN_51; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_53 = 3'h5 == io_in_addr[2:0] ? 32'hbf0e39d8 : _GEN_52; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_54 = 3'h6 == io_in_addr[2:0] ? 32'hbf54db30 : _GEN_53; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_57 = 3'h1 == io_in_addr[2:0] ? 32'hbf0e39d8 : 32'hbe47c5c0; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_58 = 3'h2 == io_in_addr[2:0] ? 32'hbf54db30 : _GEN_57; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_59 = 3'h3 == io_in_addr[2:0] ? 32'hbf7b14be : _GEN_58; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_60 = 3'h4 == io_in_addr[2:0] ? 32'hbf7b14be : _GEN_59; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_61 = 3'h5 == io_in_addr[2:0] ? 32'hbf54db30 : _GEN_60; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_62 = 3'h6 == io_in_addr[2:0] ? 32'hbf0e39d8 : _GEN_61; // @[FFTDesigns.scala 2059:{25,25}]
  assign io_out_data_1_Re = 3'h7 == io_in_addr[2:0] ? 32'hbf6c835e : _GEN_22; // @[FFTDesigns.scala 2058:{25,25}]
  assign io_out_data_1_Im = 3'h7 == io_in_addr[2:0] ? 32'hbec3ef14 : _GEN_30; // @[FFTDesigns.scala 2059:{25,25}]
  assign io_out_data_3_Re = 3'h7 == io_in_addr[2:0] ? 32'hbf7b14be : _GEN_54; // @[FFTDesigns.scala 2058:{25,25}]
  assign io_out_data_3_Im = 3'h7 == io_in_addr[2:0] ? 32'hbe47c5c0 : _GEN_62; // @[FFTDesigns.scala 2059:{25,25}]
endmodule
module TwiddleFactorsStreamed_3(
  input         clock,
  input         reset,
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  input  [31:0] io_in_2_Re,
  input  [31:0] io_in_2_Im,
  input  [31:0] io_in_3_Re,
  input  [31:0] io_in_3_Im,
  input         io_in_en_0,
  input         io_in_en_1,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im,
  output [31:0] io_out_2_Re,
  output [31:0] io_out_2_Im,
  output [31:0] io_out_3_Re,
  output [31:0] io_out_3_Im
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [4:0] TwiddleFactorROM_io_in_addr; // @[FFTDesigns.scala 2098:26]
  wire [31:0] TwiddleFactorROM_io_out_data_1_Re; // @[FFTDesigns.scala 2098:26]
  wire [31:0] TwiddleFactorROM_io_out_data_1_Im; // @[FFTDesigns.scala 2098:26]
  wire [31:0] TwiddleFactorROM_io_out_data_3_Re; // @[FFTDesigns.scala 2098:26]
  wire [31:0] TwiddleFactorROM_io_out_data_3_Im; // @[FFTDesigns.scala 2098:26]
  wire  FPComplexMult_clock; // @[FFTDesigns.scala 2113:30]
  wire  FPComplexMult_reset; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_io_in_a_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_io_in_a_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_io_in_b_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_io_in_b_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_io_out_s_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_io_out_s_Im; // @[FFTDesigns.scala 2113:30]
  wire  FPComplexMult_1_clock; // @[FFTDesigns.scala 2113:30]
  wire  FPComplexMult_1_reset; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_1_io_in_a_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_1_io_in_a_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_1_io_in_b_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_1_io_in_b_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_1_io_out_s_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_1_io_out_s_Im; // @[FFTDesigns.scala 2113:30]
  wire  FPComplexMult_2_clock; // @[FFTDesigns.scala 2113:30]
  wire  FPComplexMult_2_reset; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_2_io_in_a_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_2_io_in_a_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_2_io_in_b_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_2_io_in_b_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_2_io_out_s_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_2_io_out_s_Im; // @[FFTDesigns.scala 2113:30]
  wire  FPComplexMult_3_clock; // @[FFTDesigns.scala 2113:30]
  wire  FPComplexMult_3_reset; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_3_io_in_a_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_3_io_in_a_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_3_io_in_b_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_3_io_in_b_Im; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_3_io_out_s_Re; // @[FFTDesigns.scala 2113:30]
  wire [31:0] FPComplexMult_3_io_out_s_Im; // @[FFTDesigns.scala 2113:30]
  reg [2:0] cnt; // @[FFTDesigns.scala 2106:24]
  wire [1:0] _T = {io_in_en_1,io_in_en_0}; // @[FFTDesigns.scala 2107:21]
  wire  _T_1 = |_T; // @[FFTDesigns.scala 2107:28]
  wire [2:0] _cnt_T_1 = cnt + 3'h1; // @[FFTDesigns.scala 2120:22]
  TwiddleFactorROM_3 TwiddleFactorROM ( // @[FFTDesigns.scala 2098:26]
    .io_in_addr(TwiddleFactorROM_io_in_addr),
    .io_out_data_1_Re(TwiddleFactorROM_io_out_data_1_Re),
    .io_out_data_1_Im(TwiddleFactorROM_io_out_data_1_Im),
    .io_out_data_3_Re(TwiddleFactorROM_io_out_data_3_Re),
    .io_out_data_3_Im(TwiddleFactorROM_io_out_data_3_Im)
  );
  FPComplexMult FPComplexMult ( // @[FFTDesigns.scala 2113:30]
    .clock(FPComplexMult_clock),
    .reset(FPComplexMult_reset),
    .io_in_a_Re(FPComplexMult_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_io_out_s_Im)
  );
  FPComplexMult FPComplexMult_1 ( // @[FFTDesigns.scala 2113:30]
    .clock(FPComplexMult_1_clock),
    .reset(FPComplexMult_1_reset),
    .io_in_a_Re(FPComplexMult_1_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_1_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_1_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_1_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_1_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_1_io_out_s_Im)
  );
  FPComplexMult FPComplexMult_2 ( // @[FFTDesigns.scala 2113:30]
    .clock(FPComplexMult_2_clock),
    .reset(FPComplexMult_2_reset),
    .io_in_a_Re(FPComplexMult_2_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_2_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_2_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_2_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_2_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_2_io_out_s_Im)
  );
  FPComplexMult FPComplexMult_3 ( // @[FFTDesigns.scala 2113:30]
    .clock(FPComplexMult_3_clock),
    .reset(FPComplexMult_3_reset),
    .io_in_a_Re(FPComplexMult_3_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_3_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_3_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_3_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_3_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_3_io_out_s_Im)
  );
  assign io_out_0_Re = FPComplexMult_io_out_s_Re; // @[FFTDesigns.scala 2134:19]
  assign io_out_0_Im = FPComplexMult_io_out_s_Im; // @[FFTDesigns.scala 2134:19]
  assign io_out_1_Re = FPComplexMult_1_io_out_s_Re; // @[FFTDesigns.scala 2134:19]
  assign io_out_1_Im = FPComplexMult_1_io_out_s_Im; // @[FFTDesigns.scala 2134:19]
  assign io_out_2_Re = FPComplexMult_2_io_out_s_Re; // @[FFTDesigns.scala 2134:19]
  assign io_out_2_Im = FPComplexMult_2_io_out_s_Im; // @[FFTDesigns.scala 2134:19]
  assign io_out_3_Re = FPComplexMult_3_io_out_s_Re; // @[FFTDesigns.scala 2134:19]
  assign io_out_3_Im = FPComplexMult_3_io_out_s_Im; // @[FFTDesigns.scala 2134:19]
  assign TwiddleFactorROM_io_in_addr = {{2'd0}, cnt}; // @[FFTDesigns.scala 2136:24]
  assign FPComplexMult_clock = clock;
  assign FPComplexMult_reset = reset;
  assign FPComplexMult_io_in_a_Re = _T_1 ? io_in_0_Re : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_io_in_a_Im = _T_1 ? io_in_0_Im : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_io_in_b_Re = _T_1 ? 32'h3f800000 : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  assign FPComplexMult_io_in_b_Im = _T_1 ? 32'h80800000 : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  assign FPComplexMult_1_clock = clock;
  assign FPComplexMult_1_reset = reset;
  assign FPComplexMult_1_io_in_a_Re = _T_1 ? io_in_1_Re : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_1_io_in_a_Im = _T_1 ? io_in_1_Im : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_1_io_in_b_Re = _T_1 ? TwiddleFactorROM_io_out_data_1_Re : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  assign FPComplexMult_1_io_in_b_Im = _T_1 ? TwiddleFactorROM_io_out_data_1_Im : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  assign FPComplexMult_2_clock = clock;
  assign FPComplexMult_2_reset = reset;
  assign FPComplexMult_2_io_in_a_Re = _T_1 ? io_in_2_Re : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_2_io_in_a_Im = _T_1 ? io_in_2_Im : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_2_io_in_b_Re = _T_1 ? 32'h3f800000 : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  assign FPComplexMult_2_io_in_b_Im = _T_1 ? 32'h80800000 : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  assign FPComplexMult_3_clock = clock;
  assign FPComplexMult_3_reset = reset;
  assign FPComplexMult_3_io_in_a_Re = _T_1 ? io_in_3_Re : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_3_io_in_a_Im = _T_1 ? io_in_3_Im : 32'h0; // @[FFTDesigns.scala 2116:32 2123:31 2128:31]
  assign FPComplexMult_3_io_in_b_Re = _T_1 ? TwiddleFactorROM_io_out_data_3_Re : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  assign FPComplexMult_3_io_in_b_Im = _T_1 ? TwiddleFactorROM_io_out_data_3_Im : 32'h0; // @[FFTDesigns.scala 2116:32 2124:31 2129:31]
  always @(posedge clock) begin
    if (reset) begin // @[FFTDesigns.scala 2106:24]
      cnt <= 3'h0; // @[FFTDesigns.scala 2106:24]
    end else if (_T_1) begin // @[FFTDesigns.scala 2116:32]
      if (cnt == 3'h7) begin // @[FFTDesigns.scala 2117:34]
        cnt <= 3'h0; // @[FFTDesigns.scala 2118:15]
      end else begin
        cnt <= _cnt_T_1; // @[FFTDesigns.scala 2120:15]
      end
    end else begin
      cnt <= 3'h0; // @[FFTDesigns.scala 2131:13]
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
  cnt = _RAND_0[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FFT_sr_v2_streaming_nrv(
  input         clock,
  input         reset,
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  input  [31:0] io_in_2_Re,
  input  [31:0] io_in_2_Im,
  input  [31:0] io_in_3_Re,
  input  [31:0] io_in_3_Im,
  input         io_in_ready,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im,
  output [31:0] io_out_2_Re,
  output [31:0] io_out_2_Im,
  output [31:0] io_out_3_Re,
  output [31:0] io_out_3_Im
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
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
`endif // RANDOMIZE_REG_INIT
  wire  DFT_r_v2_clock; // @[FFTDesigns.scala 5100:30]
  wire  DFT_r_v2_reset; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_io_in_0_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_io_in_0_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_io_in_1_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_io_in_1_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_io_out_0_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_io_out_0_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_io_out_1_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_io_out_1_Im; // @[FFTDesigns.scala 5100:30]
  wire  DFT_r_v2_1_clock; // @[FFTDesigns.scala 5100:30]
  wire  DFT_r_v2_1_reset; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_1_io_in_0_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_1_io_in_0_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_1_io_in_1_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_1_io_in_1_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_1_io_out_0_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_1_io_out_0_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_1_io_out_1_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_1_io_out_1_Im; // @[FFTDesigns.scala 5100:30]
  wire  DFT_r_v2_2_clock; // @[FFTDesigns.scala 5100:30]
  wire  DFT_r_v2_2_reset; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_2_io_in_0_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_2_io_in_0_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_2_io_in_1_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_2_io_in_1_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_2_io_out_0_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_2_io_out_0_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_2_io_out_1_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_2_io_out_1_Im; // @[FFTDesigns.scala 5100:30]
  wire  DFT_r_v2_3_clock; // @[FFTDesigns.scala 5100:30]
  wire  DFT_r_v2_3_reset; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_3_io_in_0_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_3_io_in_0_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_3_io_in_1_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_3_io_in_1_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_3_io_out_0_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_3_io_out_0_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_3_io_out_1_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_3_io_out_1_Im; // @[FFTDesigns.scala 5100:30]
  wire  DFT_r_v2_4_clock; // @[FFTDesigns.scala 5100:30]
  wire  DFT_r_v2_4_reset; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_4_io_in_0_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_4_io_in_0_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_4_io_in_1_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_4_io_in_1_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_4_io_out_0_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_4_io_out_0_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_4_io_out_1_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_4_io_out_1_Im; // @[FFTDesigns.scala 5100:30]
  wire  DFT_r_v2_5_clock; // @[FFTDesigns.scala 5100:30]
  wire  DFT_r_v2_5_reset; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_5_io_in_0_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_5_io_in_0_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_5_io_in_1_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_5_io_in_1_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_5_io_out_0_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_5_io_out_0_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_5_io_out_1_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_5_io_out_1_Im; // @[FFTDesigns.scala 5100:30]
  wire  DFT_r_v2_6_clock; // @[FFTDesigns.scala 5100:30]
  wire  DFT_r_v2_6_reset; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_6_io_in_0_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_6_io_in_0_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_6_io_in_1_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_6_io_in_1_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_6_io_out_0_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_6_io_out_0_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_6_io_out_1_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_6_io_out_1_Im; // @[FFTDesigns.scala 5100:30]
  wire  DFT_r_v2_7_clock; // @[FFTDesigns.scala 5100:30]
  wire  DFT_r_v2_7_reset; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_7_io_in_0_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_7_io_in_0_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_7_io_in_1_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_7_io_in_1_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_7_io_out_0_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_7_io_out_0_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_7_io_out_1_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_7_io_out_1_Im; // @[FFTDesigns.scala 5100:30]
  wire  DFT_r_v2_8_clock; // @[FFTDesigns.scala 5100:30]
  wire  DFT_r_v2_8_reset; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_8_io_in_0_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_8_io_in_0_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_8_io_in_1_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_8_io_in_1_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_8_io_out_0_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_8_io_out_0_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_8_io_out_1_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_8_io_out_1_Im; // @[FFTDesigns.scala 5100:30]
  wire  DFT_r_v2_9_clock; // @[FFTDesigns.scala 5100:30]
  wire  DFT_r_v2_9_reset; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_9_io_in_0_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_9_io_in_0_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_9_io_in_1_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_9_io_in_1_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_9_io_out_0_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_9_io_out_0_Im; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_9_io_out_1_Re; // @[FFTDesigns.scala 5100:30]
  wire [31:0] DFT_r_v2_9_io_out_1_Im; // @[FFTDesigns.scala 5100:30]
  wire  PermutationsWithStreaming_clock; // @[FFTDesigns.scala 5107:30]
  wire  PermutationsWithStreaming_reset; // @[FFTDesigns.scala 5107:30]
  wire [31:0] PermutationsWithStreaming_io_in_0_Re; // @[FFTDesigns.scala 5107:30]
  wire [31:0] PermutationsWithStreaming_io_in_0_Im; // @[FFTDesigns.scala 5107:30]
  wire [31:0] PermutationsWithStreaming_io_in_1_Re; // @[FFTDesigns.scala 5107:30]
  wire [31:0] PermutationsWithStreaming_io_in_1_Im; // @[FFTDesigns.scala 5107:30]
  wire [31:0] PermutationsWithStreaming_io_in_2_Re; // @[FFTDesigns.scala 5107:30]
  wire [31:0] PermutationsWithStreaming_io_in_2_Im; // @[FFTDesigns.scala 5107:30]
  wire [31:0] PermutationsWithStreaming_io_in_3_Re; // @[FFTDesigns.scala 5107:30]
  wire [31:0] PermutationsWithStreaming_io_in_3_Im; // @[FFTDesigns.scala 5107:30]
  wire  PermutationsWithStreaming_io_in_en_0; // @[FFTDesigns.scala 5107:30]
  wire  PermutationsWithStreaming_io_in_en_1; // @[FFTDesigns.scala 5107:30]
  wire  PermutationsWithStreaming_io_in_en_2; // @[FFTDesigns.scala 5107:30]
  wire  PermutationsWithStreaming_io_in_en_3; // @[FFTDesigns.scala 5107:30]
  wire  PermutationsWithStreaming_io_in_en_4; // @[FFTDesigns.scala 5107:30]
  wire  PermutationsWithStreaming_io_in_en_5; // @[FFTDesigns.scala 5107:30]
  wire  PermutationsWithStreaming_io_in_en_6; // @[FFTDesigns.scala 5107:30]
  wire  PermutationsWithStreaming_io_in_en_7; // @[FFTDesigns.scala 5107:30]
  wire  PermutationsWithStreaming_io_in_en_8; // @[FFTDesigns.scala 5107:30]
  wire  PermutationsWithStreaming_io_in_en_9; // @[FFTDesigns.scala 5107:30]
  wire  PermutationsWithStreaming_io_in_en_10; // @[FFTDesigns.scala 5107:30]
  wire  PermutationsWithStreaming_io_in_en_11; // @[FFTDesigns.scala 5107:30]
  wire  PermutationsWithStreaming_io_in_en_12; // @[FFTDesigns.scala 5107:30]
  wire  PermutationsWithStreaming_io_in_en_13; // @[FFTDesigns.scala 5107:30]
  wire  PermutationsWithStreaming_io_in_en_14; // @[FFTDesigns.scala 5107:30]
  wire  PermutationsWithStreaming_io_in_en_15; // @[FFTDesigns.scala 5107:30]
  wire  PermutationsWithStreaming_io_in_en_16; // @[FFTDesigns.scala 5107:30]
  wire [31:0] PermutationsWithStreaming_io_out_0_Re; // @[FFTDesigns.scala 5107:30]
  wire [31:0] PermutationsWithStreaming_io_out_0_Im; // @[FFTDesigns.scala 5107:30]
  wire [31:0] PermutationsWithStreaming_io_out_1_Re; // @[FFTDesigns.scala 5107:30]
  wire [31:0] PermutationsWithStreaming_io_out_1_Im; // @[FFTDesigns.scala 5107:30]
  wire [31:0] PermutationsWithStreaming_io_out_2_Re; // @[FFTDesigns.scala 5107:30]
  wire [31:0] PermutationsWithStreaming_io_out_2_Im; // @[FFTDesigns.scala 5107:30]
  wire [31:0] PermutationsWithStreaming_io_out_3_Re; // @[FFTDesigns.scala 5107:30]
  wire [31:0] PermutationsWithStreaming_io_out_3_Im; // @[FFTDesigns.scala 5107:30]
  wire  PermutationsWithStreaming_1_clock; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_1_reset; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_1_io_in_0_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_1_io_in_0_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_1_io_in_1_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_1_io_in_1_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_1_io_in_2_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_1_io_in_2_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_1_io_in_3_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_1_io_in_3_Im; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_1_io_in_en_0; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_1_io_in_en_1; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_1_io_in_en_2; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_1_io_in_en_3; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_1_io_in_en_4; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_1_io_in_en_5; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_1_io_in_en_6; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_1_io_in_en_7; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_1_io_in_en_8; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_1_io_in_en_9; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_1_io_in_en_10; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_1_io_in_en_11; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_1_io_in_en_12; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_1_io_in_en_13; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_1_io_in_en_14; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_1_io_in_en_15; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_1_io_in_en_16; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_1_io_out_0_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_1_io_out_0_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_1_io_out_1_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_1_io_out_1_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_1_io_out_2_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_1_io_out_2_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_1_io_out_3_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_1_io_out_3_Im; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_2_clock; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_2_reset; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_2_io_in_0_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_2_io_in_0_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_2_io_in_1_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_2_io_in_1_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_2_io_in_2_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_2_io_in_2_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_2_io_in_3_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_2_io_in_3_Im; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_2_io_in_en_0; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_2_io_in_en_1; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_2_io_in_en_2; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_2_io_in_en_3; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_2_io_in_en_4; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_2_io_in_en_5; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_2_io_in_en_6; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_2_io_in_en_7; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_2_io_in_en_8; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_2_io_in_en_9; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_2_io_in_en_10; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_2_io_in_en_11; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_2_io_in_en_12; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_2_io_in_en_13; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_2_io_in_en_14; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_2_io_in_en_15; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_2_io_in_en_16; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_2_io_out_0_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_2_io_out_0_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_2_io_out_1_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_2_io_out_1_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_2_io_out_2_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_2_io_out_2_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_2_io_out_3_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_2_io_out_3_Im; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_3_clock; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_3_reset; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_3_io_in_0_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_3_io_in_0_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_3_io_in_1_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_3_io_in_1_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_3_io_in_2_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_3_io_in_2_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_3_io_in_3_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_3_io_in_3_Im; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_3_io_in_en_0; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_3_io_in_en_1; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_3_io_in_en_2; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_3_io_in_en_3; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_3_io_in_en_4; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_3_io_in_en_5; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_3_io_in_en_6; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_3_io_in_en_7; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_3_io_in_en_8; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_3_io_in_en_9; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_3_io_in_en_10; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_3_io_in_en_11; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_3_io_in_en_12; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_3_io_in_en_13; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_3_io_in_en_14; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_3_io_in_en_15; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_3_io_in_en_16; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_3_io_out_0_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_3_io_out_0_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_3_io_out_1_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_3_io_out_1_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_3_io_out_2_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_3_io_out_2_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_3_io_out_3_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_3_io_out_3_Im; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_4_clock; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_4_reset; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_4_io_in_0_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_4_io_in_0_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_4_io_in_1_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_4_io_in_1_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_4_io_in_2_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_4_io_in_2_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_4_io_in_3_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_4_io_in_3_Im; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_4_io_in_en_0; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_4_io_in_en_1; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_4_io_in_en_2; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_4_io_in_en_3; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_4_io_in_en_4; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_4_io_in_en_5; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_4_io_in_en_6; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_4_io_in_en_7; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_4_io_in_en_8; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_4_io_in_en_9; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_4_io_in_en_10; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_4_io_in_en_11; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_4_io_in_en_12; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_4_io_in_en_13; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_4_io_in_en_14; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_4_io_in_en_15; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_4_io_in_en_16; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_4_io_out_0_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_4_io_out_0_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_4_io_out_1_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_4_io_out_1_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_4_io_out_2_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_4_io_out_2_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_4_io_out_3_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_4_io_out_3_Im; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_5_clock; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_5_reset; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_5_io_in_0_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_5_io_in_0_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_5_io_in_1_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_5_io_in_1_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_5_io_in_2_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_5_io_in_2_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_5_io_in_3_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_5_io_in_3_Im; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_5_io_in_en_0; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_5_io_in_en_1; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_5_io_in_en_2; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_5_io_in_en_3; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_5_io_in_en_4; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_5_io_in_en_5; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_5_io_in_en_6; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_5_io_in_en_7; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_5_io_in_en_8; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_5_io_in_en_9; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_5_io_in_en_10; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_5_io_in_en_11; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_5_io_in_en_12; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_5_io_in_en_13; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_5_io_in_en_14; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_5_io_in_en_15; // @[FFTDesigns.scala 5110:30]
  wire  PermutationsWithStreaming_5_io_in_en_16; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_5_io_out_0_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_5_io_out_0_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_5_io_out_1_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_5_io_out_1_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_5_io_out_2_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_5_io_out_2_Im; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_5_io_out_3_Re; // @[FFTDesigns.scala 5110:30]
  wire [31:0] PermutationsWithStreaming_5_io_out_3_Im; // @[FFTDesigns.scala 5110:30]
  wire  TwiddleFactorsStreamed_clock; // @[FFTDesigns.scala 5115:28]
  wire  TwiddleFactorsStreamed_reset; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_io_in_0_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_io_in_0_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_io_in_1_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_io_in_1_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_io_in_2_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_io_in_2_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_io_in_3_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_io_in_3_Im; // @[FFTDesigns.scala 5115:28]
  wire  TwiddleFactorsStreamed_io_in_en_0; // @[FFTDesigns.scala 5115:28]
  wire  TwiddleFactorsStreamed_io_in_en_1; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_io_out_0_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_io_out_0_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_io_out_1_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_io_out_1_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_io_out_2_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_io_out_2_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_io_out_3_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_io_out_3_Im; // @[FFTDesigns.scala 5115:28]
  wire  TwiddleFactorsStreamed_1_clock; // @[FFTDesigns.scala 5115:28]
  wire  TwiddleFactorsStreamed_1_reset; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_in_0_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_in_0_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_in_1_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_in_1_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_in_2_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_in_2_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_in_3_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_in_3_Im; // @[FFTDesigns.scala 5115:28]
  wire  TwiddleFactorsStreamed_1_io_in_en_0; // @[FFTDesigns.scala 5115:28]
  wire  TwiddleFactorsStreamed_1_io_in_en_1; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_out_0_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_out_0_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_out_1_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_out_1_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_out_2_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_out_2_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_out_3_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_out_3_Im; // @[FFTDesigns.scala 5115:28]
  wire  TwiddleFactorsStreamed_2_clock; // @[FFTDesigns.scala 5115:28]
  wire  TwiddleFactorsStreamed_2_reset; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_2_io_in_0_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_2_io_in_0_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_2_io_in_1_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_2_io_in_1_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_2_io_in_2_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_2_io_in_2_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_2_io_in_3_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_2_io_in_3_Im; // @[FFTDesigns.scala 5115:28]
  wire  TwiddleFactorsStreamed_2_io_in_en_0; // @[FFTDesigns.scala 5115:28]
  wire  TwiddleFactorsStreamed_2_io_in_en_1; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_2_io_out_0_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_2_io_out_0_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_2_io_out_1_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_2_io_out_1_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_2_io_out_2_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_2_io_out_2_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_2_io_out_3_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_2_io_out_3_Im; // @[FFTDesigns.scala 5115:28]
  wire  TwiddleFactorsStreamed_3_clock; // @[FFTDesigns.scala 5115:28]
  wire  TwiddleFactorsStreamed_3_reset; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_3_io_in_0_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_3_io_in_0_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_3_io_in_1_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_3_io_in_1_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_3_io_in_2_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_3_io_in_2_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_3_io_in_3_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_3_io_in_3_Im; // @[FFTDesigns.scala 5115:28]
  wire  TwiddleFactorsStreamed_3_io_in_en_0; // @[FFTDesigns.scala 5115:28]
  wire  TwiddleFactorsStreamed_3_io_in_en_1; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_3_io_out_0_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_3_io_out_0_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_3_io_out_1_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_3_io_out_1_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_3_io_out_2_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_3_io_out_2_Im; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_3_io_out_3_Re; // @[FFTDesigns.scala 5115:28]
  wire [31:0] TwiddleFactorsStreamed_3_io_out_3_Im; // @[FFTDesigns.scala 5115:28]
  reg  DFT_regdelays_0_0; // @[FFTDesigns.scala 5094:32]
  reg  DFT_regdelays_1_0; // @[FFTDesigns.scala 5094:32]
  reg  DFT_regdelays_2_0; // @[FFTDesigns.scala 5094:32]
  reg  DFT_regdelays_3_0; // @[FFTDesigns.scala 5094:32]
  reg  DFT_regdelays_4_0; // @[FFTDesigns.scala 5094:32]
  reg  Twid_regdelays_0_0; // @[FFTDesigns.scala 5095:33]
  reg  Twid_regdelays_0_1; // @[FFTDesigns.scala 5095:33]
  reg  Twid_regdelays_1_0; // @[FFTDesigns.scala 5095:33]
  reg  Twid_regdelays_1_1; // @[FFTDesigns.scala 5095:33]
  reg  Twid_regdelays_2_0; // @[FFTDesigns.scala 5095:33]
  reg  Twid_regdelays_2_1; // @[FFTDesigns.scala 5095:33]
  reg  Twid_regdelays_3_0; // @[FFTDesigns.scala 5095:33]
  reg  Twid_regdelays_3_1; // @[FFTDesigns.scala 5095:33]
  reg  Perm_regdelays_0_0; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_0_1; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_0_2; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_0_3; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_0_4; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_0_5; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_0_6; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_0_7; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_0_8; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_0_9; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_0_10; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_0_11; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_0_12; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_0_13; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_0_14; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_0_15; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_1_0; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_1_1; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_1_2; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_1_3; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_1_4; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_1_5; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_1_6; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_1_7; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_1_8; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_1_9; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_1_10; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_1_11; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_1_12; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_1_13; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_1_14; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_1_15; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_2_0; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_2_1; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_2_2; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_2_3; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_2_4; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_2_5; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_2_6; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_2_7; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_2_8; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_2_9; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_2_10; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_2_11; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_2_12; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_2_13; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_2_14; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_2_15; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_3_0; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_3_1; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_3_2; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_3_3; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_3_4; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_3_5; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_3_6; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_3_7; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_3_8; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_3_9; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_3_10; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_3_11; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_3_12; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_3_13; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_3_14; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_3_15; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_4_0; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_4_1; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_4_2; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_4_3; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_4_4; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_4_5; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_4_6; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_4_7; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_4_8; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_4_9; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_4_10; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_4_11; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_4_12; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_4_13; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_4_14; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_4_15; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_5_0; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_5_1; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_5_2; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_5_3; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_5_4; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_5_5; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_5_6; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_5_7; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_5_8; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_5_9; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_5_10; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_5_11; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_5_12; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_5_13; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_5_14; // @[FFTDesigns.scala 5096:33]
  reg  Perm_regdelays_5_15; // @[FFTDesigns.scala 5096:33]
  DFT_r_v2 DFT_r_v2 ( // @[FFTDesigns.scala 5100:30]
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
  DFT_r_v2 DFT_r_v2_1 ( // @[FFTDesigns.scala 5100:30]
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
  DFT_r_v2 DFT_r_v2_2 ( // @[FFTDesigns.scala 5100:30]
    .clock(DFT_r_v2_2_clock),
    .reset(DFT_r_v2_2_reset),
    .io_in_0_Re(DFT_r_v2_2_io_in_0_Re),
    .io_in_0_Im(DFT_r_v2_2_io_in_0_Im),
    .io_in_1_Re(DFT_r_v2_2_io_in_1_Re),
    .io_in_1_Im(DFT_r_v2_2_io_in_1_Im),
    .io_out_0_Re(DFT_r_v2_2_io_out_0_Re),
    .io_out_0_Im(DFT_r_v2_2_io_out_0_Im),
    .io_out_1_Re(DFT_r_v2_2_io_out_1_Re),
    .io_out_1_Im(DFT_r_v2_2_io_out_1_Im)
  );
  DFT_r_v2 DFT_r_v2_3 ( // @[FFTDesigns.scala 5100:30]
    .clock(DFT_r_v2_3_clock),
    .reset(DFT_r_v2_3_reset),
    .io_in_0_Re(DFT_r_v2_3_io_in_0_Re),
    .io_in_0_Im(DFT_r_v2_3_io_in_0_Im),
    .io_in_1_Re(DFT_r_v2_3_io_in_1_Re),
    .io_in_1_Im(DFT_r_v2_3_io_in_1_Im),
    .io_out_0_Re(DFT_r_v2_3_io_out_0_Re),
    .io_out_0_Im(DFT_r_v2_3_io_out_0_Im),
    .io_out_1_Re(DFT_r_v2_3_io_out_1_Re),
    .io_out_1_Im(DFT_r_v2_3_io_out_1_Im)
  );
  DFT_r_v2 DFT_r_v2_4 ( // @[FFTDesigns.scala 5100:30]
    .clock(DFT_r_v2_4_clock),
    .reset(DFT_r_v2_4_reset),
    .io_in_0_Re(DFT_r_v2_4_io_in_0_Re),
    .io_in_0_Im(DFT_r_v2_4_io_in_0_Im),
    .io_in_1_Re(DFT_r_v2_4_io_in_1_Re),
    .io_in_1_Im(DFT_r_v2_4_io_in_1_Im),
    .io_out_0_Re(DFT_r_v2_4_io_out_0_Re),
    .io_out_0_Im(DFT_r_v2_4_io_out_0_Im),
    .io_out_1_Re(DFT_r_v2_4_io_out_1_Re),
    .io_out_1_Im(DFT_r_v2_4_io_out_1_Im)
  );
  DFT_r_v2 DFT_r_v2_5 ( // @[FFTDesigns.scala 5100:30]
    .clock(DFT_r_v2_5_clock),
    .reset(DFT_r_v2_5_reset),
    .io_in_0_Re(DFT_r_v2_5_io_in_0_Re),
    .io_in_0_Im(DFT_r_v2_5_io_in_0_Im),
    .io_in_1_Re(DFT_r_v2_5_io_in_1_Re),
    .io_in_1_Im(DFT_r_v2_5_io_in_1_Im),
    .io_out_0_Re(DFT_r_v2_5_io_out_0_Re),
    .io_out_0_Im(DFT_r_v2_5_io_out_0_Im),
    .io_out_1_Re(DFT_r_v2_5_io_out_1_Re),
    .io_out_1_Im(DFT_r_v2_5_io_out_1_Im)
  );
  DFT_r_v2 DFT_r_v2_6 ( // @[FFTDesigns.scala 5100:30]
    .clock(DFT_r_v2_6_clock),
    .reset(DFT_r_v2_6_reset),
    .io_in_0_Re(DFT_r_v2_6_io_in_0_Re),
    .io_in_0_Im(DFT_r_v2_6_io_in_0_Im),
    .io_in_1_Re(DFT_r_v2_6_io_in_1_Re),
    .io_in_1_Im(DFT_r_v2_6_io_in_1_Im),
    .io_out_0_Re(DFT_r_v2_6_io_out_0_Re),
    .io_out_0_Im(DFT_r_v2_6_io_out_0_Im),
    .io_out_1_Re(DFT_r_v2_6_io_out_1_Re),
    .io_out_1_Im(DFT_r_v2_6_io_out_1_Im)
  );
  DFT_r_v2 DFT_r_v2_7 ( // @[FFTDesigns.scala 5100:30]
    .clock(DFT_r_v2_7_clock),
    .reset(DFT_r_v2_7_reset),
    .io_in_0_Re(DFT_r_v2_7_io_in_0_Re),
    .io_in_0_Im(DFT_r_v2_7_io_in_0_Im),
    .io_in_1_Re(DFT_r_v2_7_io_in_1_Re),
    .io_in_1_Im(DFT_r_v2_7_io_in_1_Im),
    .io_out_0_Re(DFT_r_v2_7_io_out_0_Re),
    .io_out_0_Im(DFT_r_v2_7_io_out_0_Im),
    .io_out_1_Re(DFT_r_v2_7_io_out_1_Re),
    .io_out_1_Im(DFT_r_v2_7_io_out_1_Im)
  );
  DFT_r_v2 DFT_r_v2_8 ( // @[FFTDesigns.scala 5100:30]
    .clock(DFT_r_v2_8_clock),
    .reset(DFT_r_v2_8_reset),
    .io_in_0_Re(DFT_r_v2_8_io_in_0_Re),
    .io_in_0_Im(DFT_r_v2_8_io_in_0_Im),
    .io_in_1_Re(DFT_r_v2_8_io_in_1_Re),
    .io_in_1_Im(DFT_r_v2_8_io_in_1_Im),
    .io_out_0_Re(DFT_r_v2_8_io_out_0_Re),
    .io_out_0_Im(DFT_r_v2_8_io_out_0_Im),
    .io_out_1_Re(DFT_r_v2_8_io_out_1_Re),
    .io_out_1_Im(DFT_r_v2_8_io_out_1_Im)
  );
  DFT_r_v2 DFT_r_v2_9 ( // @[FFTDesigns.scala 5100:30]
    .clock(DFT_r_v2_9_clock),
    .reset(DFT_r_v2_9_reset),
    .io_in_0_Re(DFT_r_v2_9_io_in_0_Re),
    .io_in_0_Im(DFT_r_v2_9_io_in_0_Im),
    .io_in_1_Re(DFT_r_v2_9_io_in_1_Re),
    .io_in_1_Im(DFT_r_v2_9_io_in_1_Im),
    .io_out_0_Re(DFT_r_v2_9_io_out_0_Re),
    .io_out_0_Im(DFT_r_v2_9_io_out_0_Im),
    .io_out_1_Re(DFT_r_v2_9_io_out_1_Re),
    .io_out_1_Im(DFT_r_v2_9_io_out_1_Im)
  );
  PermutationsWithStreaming PermutationsWithStreaming ( // @[FFTDesigns.scala 5107:30]
    .clock(PermutationsWithStreaming_clock),
    .reset(PermutationsWithStreaming_reset),
    .io_in_0_Re(PermutationsWithStreaming_io_in_0_Re),
    .io_in_0_Im(PermutationsWithStreaming_io_in_0_Im),
    .io_in_1_Re(PermutationsWithStreaming_io_in_1_Re),
    .io_in_1_Im(PermutationsWithStreaming_io_in_1_Im),
    .io_in_2_Re(PermutationsWithStreaming_io_in_2_Re),
    .io_in_2_Im(PermutationsWithStreaming_io_in_2_Im),
    .io_in_3_Re(PermutationsWithStreaming_io_in_3_Re),
    .io_in_3_Im(PermutationsWithStreaming_io_in_3_Im),
    .io_in_en_0(PermutationsWithStreaming_io_in_en_0),
    .io_in_en_1(PermutationsWithStreaming_io_in_en_1),
    .io_in_en_2(PermutationsWithStreaming_io_in_en_2),
    .io_in_en_3(PermutationsWithStreaming_io_in_en_3),
    .io_in_en_4(PermutationsWithStreaming_io_in_en_4),
    .io_in_en_5(PermutationsWithStreaming_io_in_en_5),
    .io_in_en_6(PermutationsWithStreaming_io_in_en_6),
    .io_in_en_7(PermutationsWithStreaming_io_in_en_7),
    .io_in_en_8(PermutationsWithStreaming_io_in_en_8),
    .io_in_en_9(PermutationsWithStreaming_io_in_en_9),
    .io_in_en_10(PermutationsWithStreaming_io_in_en_10),
    .io_in_en_11(PermutationsWithStreaming_io_in_en_11),
    .io_in_en_12(PermutationsWithStreaming_io_in_en_12),
    .io_in_en_13(PermutationsWithStreaming_io_in_en_13),
    .io_in_en_14(PermutationsWithStreaming_io_in_en_14),
    .io_in_en_15(PermutationsWithStreaming_io_in_en_15),
    .io_in_en_16(PermutationsWithStreaming_io_in_en_16),
    .io_out_0_Re(PermutationsWithStreaming_io_out_0_Re),
    .io_out_0_Im(PermutationsWithStreaming_io_out_0_Im),
    .io_out_1_Re(PermutationsWithStreaming_io_out_1_Re),
    .io_out_1_Im(PermutationsWithStreaming_io_out_1_Im),
    .io_out_2_Re(PermutationsWithStreaming_io_out_2_Re),
    .io_out_2_Im(PermutationsWithStreaming_io_out_2_Im),
    .io_out_3_Re(PermutationsWithStreaming_io_out_3_Re),
    .io_out_3_Im(PermutationsWithStreaming_io_out_3_Im)
  );
  PermutationsWithStreaming_1 PermutationsWithStreaming_1 ( // @[FFTDesigns.scala 5110:30]
    .clock(PermutationsWithStreaming_1_clock),
    .reset(PermutationsWithStreaming_1_reset),
    .io_in_0_Re(PermutationsWithStreaming_1_io_in_0_Re),
    .io_in_0_Im(PermutationsWithStreaming_1_io_in_0_Im),
    .io_in_1_Re(PermutationsWithStreaming_1_io_in_1_Re),
    .io_in_1_Im(PermutationsWithStreaming_1_io_in_1_Im),
    .io_in_2_Re(PermutationsWithStreaming_1_io_in_2_Re),
    .io_in_2_Im(PermutationsWithStreaming_1_io_in_2_Im),
    .io_in_3_Re(PermutationsWithStreaming_1_io_in_3_Re),
    .io_in_3_Im(PermutationsWithStreaming_1_io_in_3_Im),
    .io_in_en_0(PermutationsWithStreaming_1_io_in_en_0),
    .io_in_en_1(PermutationsWithStreaming_1_io_in_en_1),
    .io_in_en_2(PermutationsWithStreaming_1_io_in_en_2),
    .io_in_en_3(PermutationsWithStreaming_1_io_in_en_3),
    .io_in_en_4(PermutationsWithStreaming_1_io_in_en_4),
    .io_in_en_5(PermutationsWithStreaming_1_io_in_en_5),
    .io_in_en_6(PermutationsWithStreaming_1_io_in_en_6),
    .io_in_en_7(PermutationsWithStreaming_1_io_in_en_7),
    .io_in_en_8(PermutationsWithStreaming_1_io_in_en_8),
    .io_in_en_9(PermutationsWithStreaming_1_io_in_en_9),
    .io_in_en_10(PermutationsWithStreaming_1_io_in_en_10),
    .io_in_en_11(PermutationsWithStreaming_1_io_in_en_11),
    .io_in_en_12(PermutationsWithStreaming_1_io_in_en_12),
    .io_in_en_13(PermutationsWithStreaming_1_io_in_en_13),
    .io_in_en_14(PermutationsWithStreaming_1_io_in_en_14),
    .io_in_en_15(PermutationsWithStreaming_1_io_in_en_15),
    .io_in_en_16(PermutationsWithStreaming_1_io_in_en_16),
    .io_out_0_Re(PermutationsWithStreaming_1_io_out_0_Re),
    .io_out_0_Im(PermutationsWithStreaming_1_io_out_0_Im),
    .io_out_1_Re(PermutationsWithStreaming_1_io_out_1_Re),
    .io_out_1_Im(PermutationsWithStreaming_1_io_out_1_Im),
    .io_out_2_Re(PermutationsWithStreaming_1_io_out_2_Re),
    .io_out_2_Im(PermutationsWithStreaming_1_io_out_2_Im),
    .io_out_3_Re(PermutationsWithStreaming_1_io_out_3_Re),
    .io_out_3_Im(PermutationsWithStreaming_1_io_out_3_Im)
  );
  PermutationsWithStreaming_1 PermutationsWithStreaming_2 ( // @[FFTDesigns.scala 5110:30]
    .clock(PermutationsWithStreaming_2_clock),
    .reset(PermutationsWithStreaming_2_reset),
    .io_in_0_Re(PermutationsWithStreaming_2_io_in_0_Re),
    .io_in_0_Im(PermutationsWithStreaming_2_io_in_0_Im),
    .io_in_1_Re(PermutationsWithStreaming_2_io_in_1_Re),
    .io_in_1_Im(PermutationsWithStreaming_2_io_in_1_Im),
    .io_in_2_Re(PermutationsWithStreaming_2_io_in_2_Re),
    .io_in_2_Im(PermutationsWithStreaming_2_io_in_2_Im),
    .io_in_3_Re(PermutationsWithStreaming_2_io_in_3_Re),
    .io_in_3_Im(PermutationsWithStreaming_2_io_in_3_Im),
    .io_in_en_0(PermutationsWithStreaming_2_io_in_en_0),
    .io_in_en_1(PermutationsWithStreaming_2_io_in_en_1),
    .io_in_en_2(PermutationsWithStreaming_2_io_in_en_2),
    .io_in_en_3(PermutationsWithStreaming_2_io_in_en_3),
    .io_in_en_4(PermutationsWithStreaming_2_io_in_en_4),
    .io_in_en_5(PermutationsWithStreaming_2_io_in_en_5),
    .io_in_en_6(PermutationsWithStreaming_2_io_in_en_6),
    .io_in_en_7(PermutationsWithStreaming_2_io_in_en_7),
    .io_in_en_8(PermutationsWithStreaming_2_io_in_en_8),
    .io_in_en_9(PermutationsWithStreaming_2_io_in_en_9),
    .io_in_en_10(PermutationsWithStreaming_2_io_in_en_10),
    .io_in_en_11(PermutationsWithStreaming_2_io_in_en_11),
    .io_in_en_12(PermutationsWithStreaming_2_io_in_en_12),
    .io_in_en_13(PermutationsWithStreaming_2_io_in_en_13),
    .io_in_en_14(PermutationsWithStreaming_2_io_in_en_14),
    .io_in_en_15(PermutationsWithStreaming_2_io_in_en_15),
    .io_in_en_16(PermutationsWithStreaming_2_io_in_en_16),
    .io_out_0_Re(PermutationsWithStreaming_2_io_out_0_Re),
    .io_out_0_Im(PermutationsWithStreaming_2_io_out_0_Im),
    .io_out_1_Re(PermutationsWithStreaming_2_io_out_1_Re),
    .io_out_1_Im(PermutationsWithStreaming_2_io_out_1_Im),
    .io_out_2_Re(PermutationsWithStreaming_2_io_out_2_Re),
    .io_out_2_Im(PermutationsWithStreaming_2_io_out_2_Im),
    .io_out_3_Re(PermutationsWithStreaming_2_io_out_3_Re),
    .io_out_3_Im(PermutationsWithStreaming_2_io_out_3_Im)
  );
  PermutationsWithStreaming_1 PermutationsWithStreaming_3 ( // @[FFTDesigns.scala 5110:30]
    .clock(PermutationsWithStreaming_3_clock),
    .reset(PermutationsWithStreaming_3_reset),
    .io_in_0_Re(PermutationsWithStreaming_3_io_in_0_Re),
    .io_in_0_Im(PermutationsWithStreaming_3_io_in_0_Im),
    .io_in_1_Re(PermutationsWithStreaming_3_io_in_1_Re),
    .io_in_1_Im(PermutationsWithStreaming_3_io_in_1_Im),
    .io_in_2_Re(PermutationsWithStreaming_3_io_in_2_Re),
    .io_in_2_Im(PermutationsWithStreaming_3_io_in_2_Im),
    .io_in_3_Re(PermutationsWithStreaming_3_io_in_3_Re),
    .io_in_3_Im(PermutationsWithStreaming_3_io_in_3_Im),
    .io_in_en_0(PermutationsWithStreaming_3_io_in_en_0),
    .io_in_en_1(PermutationsWithStreaming_3_io_in_en_1),
    .io_in_en_2(PermutationsWithStreaming_3_io_in_en_2),
    .io_in_en_3(PermutationsWithStreaming_3_io_in_en_3),
    .io_in_en_4(PermutationsWithStreaming_3_io_in_en_4),
    .io_in_en_5(PermutationsWithStreaming_3_io_in_en_5),
    .io_in_en_6(PermutationsWithStreaming_3_io_in_en_6),
    .io_in_en_7(PermutationsWithStreaming_3_io_in_en_7),
    .io_in_en_8(PermutationsWithStreaming_3_io_in_en_8),
    .io_in_en_9(PermutationsWithStreaming_3_io_in_en_9),
    .io_in_en_10(PermutationsWithStreaming_3_io_in_en_10),
    .io_in_en_11(PermutationsWithStreaming_3_io_in_en_11),
    .io_in_en_12(PermutationsWithStreaming_3_io_in_en_12),
    .io_in_en_13(PermutationsWithStreaming_3_io_in_en_13),
    .io_in_en_14(PermutationsWithStreaming_3_io_in_en_14),
    .io_in_en_15(PermutationsWithStreaming_3_io_in_en_15),
    .io_in_en_16(PermutationsWithStreaming_3_io_in_en_16),
    .io_out_0_Re(PermutationsWithStreaming_3_io_out_0_Re),
    .io_out_0_Im(PermutationsWithStreaming_3_io_out_0_Im),
    .io_out_1_Re(PermutationsWithStreaming_3_io_out_1_Re),
    .io_out_1_Im(PermutationsWithStreaming_3_io_out_1_Im),
    .io_out_2_Re(PermutationsWithStreaming_3_io_out_2_Re),
    .io_out_2_Im(PermutationsWithStreaming_3_io_out_2_Im),
    .io_out_3_Re(PermutationsWithStreaming_3_io_out_3_Re),
    .io_out_3_Im(PermutationsWithStreaming_3_io_out_3_Im)
  );
  PermutationsWithStreaming_1 PermutationsWithStreaming_4 ( // @[FFTDesigns.scala 5110:30]
    .clock(PermutationsWithStreaming_4_clock),
    .reset(PermutationsWithStreaming_4_reset),
    .io_in_0_Re(PermutationsWithStreaming_4_io_in_0_Re),
    .io_in_0_Im(PermutationsWithStreaming_4_io_in_0_Im),
    .io_in_1_Re(PermutationsWithStreaming_4_io_in_1_Re),
    .io_in_1_Im(PermutationsWithStreaming_4_io_in_1_Im),
    .io_in_2_Re(PermutationsWithStreaming_4_io_in_2_Re),
    .io_in_2_Im(PermutationsWithStreaming_4_io_in_2_Im),
    .io_in_3_Re(PermutationsWithStreaming_4_io_in_3_Re),
    .io_in_3_Im(PermutationsWithStreaming_4_io_in_3_Im),
    .io_in_en_0(PermutationsWithStreaming_4_io_in_en_0),
    .io_in_en_1(PermutationsWithStreaming_4_io_in_en_1),
    .io_in_en_2(PermutationsWithStreaming_4_io_in_en_2),
    .io_in_en_3(PermutationsWithStreaming_4_io_in_en_3),
    .io_in_en_4(PermutationsWithStreaming_4_io_in_en_4),
    .io_in_en_5(PermutationsWithStreaming_4_io_in_en_5),
    .io_in_en_6(PermutationsWithStreaming_4_io_in_en_6),
    .io_in_en_7(PermutationsWithStreaming_4_io_in_en_7),
    .io_in_en_8(PermutationsWithStreaming_4_io_in_en_8),
    .io_in_en_9(PermutationsWithStreaming_4_io_in_en_9),
    .io_in_en_10(PermutationsWithStreaming_4_io_in_en_10),
    .io_in_en_11(PermutationsWithStreaming_4_io_in_en_11),
    .io_in_en_12(PermutationsWithStreaming_4_io_in_en_12),
    .io_in_en_13(PermutationsWithStreaming_4_io_in_en_13),
    .io_in_en_14(PermutationsWithStreaming_4_io_in_en_14),
    .io_in_en_15(PermutationsWithStreaming_4_io_in_en_15),
    .io_in_en_16(PermutationsWithStreaming_4_io_in_en_16),
    .io_out_0_Re(PermutationsWithStreaming_4_io_out_0_Re),
    .io_out_0_Im(PermutationsWithStreaming_4_io_out_0_Im),
    .io_out_1_Re(PermutationsWithStreaming_4_io_out_1_Re),
    .io_out_1_Im(PermutationsWithStreaming_4_io_out_1_Im),
    .io_out_2_Re(PermutationsWithStreaming_4_io_out_2_Re),
    .io_out_2_Im(PermutationsWithStreaming_4_io_out_2_Im),
    .io_out_3_Re(PermutationsWithStreaming_4_io_out_3_Re),
    .io_out_3_Im(PermutationsWithStreaming_4_io_out_3_Im)
  );
  PermutationsWithStreaming_1 PermutationsWithStreaming_5 ( // @[FFTDesigns.scala 5110:30]
    .clock(PermutationsWithStreaming_5_clock),
    .reset(PermutationsWithStreaming_5_reset),
    .io_in_0_Re(PermutationsWithStreaming_5_io_in_0_Re),
    .io_in_0_Im(PermutationsWithStreaming_5_io_in_0_Im),
    .io_in_1_Re(PermutationsWithStreaming_5_io_in_1_Re),
    .io_in_1_Im(PermutationsWithStreaming_5_io_in_1_Im),
    .io_in_2_Re(PermutationsWithStreaming_5_io_in_2_Re),
    .io_in_2_Im(PermutationsWithStreaming_5_io_in_2_Im),
    .io_in_3_Re(PermutationsWithStreaming_5_io_in_3_Re),
    .io_in_3_Im(PermutationsWithStreaming_5_io_in_3_Im),
    .io_in_en_0(PermutationsWithStreaming_5_io_in_en_0),
    .io_in_en_1(PermutationsWithStreaming_5_io_in_en_1),
    .io_in_en_2(PermutationsWithStreaming_5_io_in_en_2),
    .io_in_en_3(PermutationsWithStreaming_5_io_in_en_3),
    .io_in_en_4(PermutationsWithStreaming_5_io_in_en_4),
    .io_in_en_5(PermutationsWithStreaming_5_io_in_en_5),
    .io_in_en_6(PermutationsWithStreaming_5_io_in_en_6),
    .io_in_en_7(PermutationsWithStreaming_5_io_in_en_7),
    .io_in_en_8(PermutationsWithStreaming_5_io_in_en_8),
    .io_in_en_9(PermutationsWithStreaming_5_io_in_en_9),
    .io_in_en_10(PermutationsWithStreaming_5_io_in_en_10),
    .io_in_en_11(PermutationsWithStreaming_5_io_in_en_11),
    .io_in_en_12(PermutationsWithStreaming_5_io_in_en_12),
    .io_in_en_13(PermutationsWithStreaming_5_io_in_en_13),
    .io_in_en_14(PermutationsWithStreaming_5_io_in_en_14),
    .io_in_en_15(PermutationsWithStreaming_5_io_in_en_15),
    .io_in_en_16(PermutationsWithStreaming_5_io_in_en_16),
    .io_out_0_Re(PermutationsWithStreaming_5_io_out_0_Re),
    .io_out_0_Im(PermutationsWithStreaming_5_io_out_0_Im),
    .io_out_1_Re(PermutationsWithStreaming_5_io_out_1_Re),
    .io_out_1_Im(PermutationsWithStreaming_5_io_out_1_Im),
    .io_out_2_Re(PermutationsWithStreaming_5_io_out_2_Re),
    .io_out_2_Im(PermutationsWithStreaming_5_io_out_2_Im),
    .io_out_3_Re(PermutationsWithStreaming_5_io_out_3_Re),
    .io_out_3_Im(PermutationsWithStreaming_5_io_out_3_Im)
  );
  TwiddleFactorsStreamed TwiddleFactorsStreamed ( // @[FFTDesigns.scala 5115:28]
    .clock(TwiddleFactorsStreamed_clock),
    .reset(TwiddleFactorsStreamed_reset),
    .io_in_0_Re(TwiddleFactorsStreamed_io_in_0_Re),
    .io_in_0_Im(TwiddleFactorsStreamed_io_in_0_Im),
    .io_in_1_Re(TwiddleFactorsStreamed_io_in_1_Re),
    .io_in_1_Im(TwiddleFactorsStreamed_io_in_1_Im),
    .io_in_2_Re(TwiddleFactorsStreamed_io_in_2_Re),
    .io_in_2_Im(TwiddleFactorsStreamed_io_in_2_Im),
    .io_in_3_Re(TwiddleFactorsStreamed_io_in_3_Re),
    .io_in_3_Im(TwiddleFactorsStreamed_io_in_3_Im),
    .io_in_en_0(TwiddleFactorsStreamed_io_in_en_0),
    .io_in_en_1(TwiddleFactorsStreamed_io_in_en_1),
    .io_out_0_Re(TwiddleFactorsStreamed_io_out_0_Re),
    .io_out_0_Im(TwiddleFactorsStreamed_io_out_0_Im),
    .io_out_1_Re(TwiddleFactorsStreamed_io_out_1_Re),
    .io_out_1_Im(TwiddleFactorsStreamed_io_out_1_Im),
    .io_out_2_Re(TwiddleFactorsStreamed_io_out_2_Re),
    .io_out_2_Im(TwiddleFactorsStreamed_io_out_2_Im),
    .io_out_3_Re(TwiddleFactorsStreamed_io_out_3_Re),
    .io_out_3_Im(TwiddleFactorsStreamed_io_out_3_Im)
  );
  TwiddleFactorsStreamed_1 TwiddleFactorsStreamed_1 ( // @[FFTDesigns.scala 5115:28]
    .clock(TwiddleFactorsStreamed_1_clock),
    .reset(TwiddleFactorsStreamed_1_reset),
    .io_in_0_Re(TwiddleFactorsStreamed_1_io_in_0_Re),
    .io_in_0_Im(TwiddleFactorsStreamed_1_io_in_0_Im),
    .io_in_1_Re(TwiddleFactorsStreamed_1_io_in_1_Re),
    .io_in_1_Im(TwiddleFactorsStreamed_1_io_in_1_Im),
    .io_in_2_Re(TwiddleFactorsStreamed_1_io_in_2_Re),
    .io_in_2_Im(TwiddleFactorsStreamed_1_io_in_2_Im),
    .io_in_3_Re(TwiddleFactorsStreamed_1_io_in_3_Re),
    .io_in_3_Im(TwiddleFactorsStreamed_1_io_in_3_Im),
    .io_in_en_0(TwiddleFactorsStreamed_1_io_in_en_0),
    .io_in_en_1(TwiddleFactorsStreamed_1_io_in_en_1),
    .io_out_0_Re(TwiddleFactorsStreamed_1_io_out_0_Re),
    .io_out_0_Im(TwiddleFactorsStreamed_1_io_out_0_Im),
    .io_out_1_Re(TwiddleFactorsStreamed_1_io_out_1_Re),
    .io_out_1_Im(TwiddleFactorsStreamed_1_io_out_1_Im),
    .io_out_2_Re(TwiddleFactorsStreamed_1_io_out_2_Re),
    .io_out_2_Im(TwiddleFactorsStreamed_1_io_out_2_Im),
    .io_out_3_Re(TwiddleFactorsStreamed_1_io_out_3_Re),
    .io_out_3_Im(TwiddleFactorsStreamed_1_io_out_3_Im)
  );
  TwiddleFactorsStreamed_2 TwiddleFactorsStreamed_2 ( // @[FFTDesigns.scala 5115:28]
    .clock(TwiddleFactorsStreamed_2_clock),
    .reset(TwiddleFactorsStreamed_2_reset),
    .io_in_0_Re(TwiddleFactorsStreamed_2_io_in_0_Re),
    .io_in_0_Im(TwiddleFactorsStreamed_2_io_in_0_Im),
    .io_in_1_Re(TwiddleFactorsStreamed_2_io_in_1_Re),
    .io_in_1_Im(TwiddleFactorsStreamed_2_io_in_1_Im),
    .io_in_2_Re(TwiddleFactorsStreamed_2_io_in_2_Re),
    .io_in_2_Im(TwiddleFactorsStreamed_2_io_in_2_Im),
    .io_in_3_Re(TwiddleFactorsStreamed_2_io_in_3_Re),
    .io_in_3_Im(TwiddleFactorsStreamed_2_io_in_3_Im),
    .io_in_en_0(TwiddleFactorsStreamed_2_io_in_en_0),
    .io_in_en_1(TwiddleFactorsStreamed_2_io_in_en_1),
    .io_out_0_Re(TwiddleFactorsStreamed_2_io_out_0_Re),
    .io_out_0_Im(TwiddleFactorsStreamed_2_io_out_0_Im),
    .io_out_1_Re(TwiddleFactorsStreamed_2_io_out_1_Re),
    .io_out_1_Im(TwiddleFactorsStreamed_2_io_out_1_Im),
    .io_out_2_Re(TwiddleFactorsStreamed_2_io_out_2_Re),
    .io_out_2_Im(TwiddleFactorsStreamed_2_io_out_2_Im),
    .io_out_3_Re(TwiddleFactorsStreamed_2_io_out_3_Re),
    .io_out_3_Im(TwiddleFactorsStreamed_2_io_out_3_Im)
  );
  TwiddleFactorsStreamed_3 TwiddleFactorsStreamed_3 ( // @[FFTDesigns.scala 5115:28]
    .clock(TwiddleFactorsStreamed_3_clock),
    .reset(TwiddleFactorsStreamed_3_reset),
    .io_in_0_Re(TwiddleFactorsStreamed_3_io_in_0_Re),
    .io_in_0_Im(TwiddleFactorsStreamed_3_io_in_0_Im),
    .io_in_1_Re(TwiddleFactorsStreamed_3_io_in_1_Re),
    .io_in_1_Im(TwiddleFactorsStreamed_3_io_in_1_Im),
    .io_in_2_Re(TwiddleFactorsStreamed_3_io_in_2_Re),
    .io_in_2_Im(TwiddleFactorsStreamed_3_io_in_2_Im),
    .io_in_3_Re(TwiddleFactorsStreamed_3_io_in_3_Re),
    .io_in_3_Im(TwiddleFactorsStreamed_3_io_in_3_Im),
    .io_in_en_0(TwiddleFactorsStreamed_3_io_in_en_0),
    .io_in_en_1(TwiddleFactorsStreamed_3_io_in_en_1),
    .io_out_0_Re(TwiddleFactorsStreamed_3_io_out_0_Re),
    .io_out_0_Im(TwiddleFactorsStreamed_3_io_out_0_Im),
    .io_out_1_Re(TwiddleFactorsStreamed_3_io_out_1_Re),
    .io_out_1_Im(TwiddleFactorsStreamed_3_io_out_1_Im),
    .io_out_2_Re(TwiddleFactorsStreamed_3_io_out_2_Re),
    .io_out_2_Im(TwiddleFactorsStreamed_3_io_out_2_Im),
    .io_out_3_Re(TwiddleFactorsStreamed_3_io_out_3_Re),
    .io_out_3_Im(TwiddleFactorsStreamed_3_io_out_3_Im)
  );
  assign io_out_0_Re = PermutationsWithStreaming_5_io_out_0_Re; // @[FFTDesigns.scala 5201:12]
  assign io_out_0_Im = PermutationsWithStreaming_5_io_out_0_Im; // @[FFTDesigns.scala 5201:12]
  assign io_out_1_Re = PermutationsWithStreaming_5_io_out_1_Re; // @[FFTDesigns.scala 5201:12]
  assign io_out_1_Im = PermutationsWithStreaming_5_io_out_1_Im; // @[FFTDesigns.scala 5201:12]
  assign io_out_2_Re = PermutationsWithStreaming_5_io_out_2_Re; // @[FFTDesigns.scala 5201:12]
  assign io_out_2_Im = PermutationsWithStreaming_5_io_out_2_Im; // @[FFTDesigns.scala 5201:12]
  assign io_out_3_Re = PermutationsWithStreaming_5_io_out_3_Re; // @[FFTDesigns.scala 5201:12]
  assign io_out_3_Im = PermutationsWithStreaming_5_io_out_3_Im; // @[FFTDesigns.scala 5201:12]
  assign DFT_r_v2_clock = clock;
  assign DFT_r_v2_reset = reset;
  assign DFT_r_v2_io_in_0_Re = PermutationsWithStreaming_io_out_0_Re; // @[FFTDesigns.scala 5156:41]
  assign DFT_r_v2_io_in_0_Im = PermutationsWithStreaming_io_out_0_Im; // @[FFTDesigns.scala 5156:41]
  assign DFT_r_v2_io_in_1_Re = PermutationsWithStreaming_io_out_1_Re; // @[FFTDesigns.scala 5156:41]
  assign DFT_r_v2_io_in_1_Im = PermutationsWithStreaming_io_out_1_Im; // @[FFTDesigns.scala 5156:41]
  assign DFT_r_v2_1_clock = clock;
  assign DFT_r_v2_1_reset = reset;
  assign DFT_r_v2_1_io_in_0_Re = PermutationsWithStreaming_io_out_2_Re; // @[FFTDesigns.scala 5156:41]
  assign DFT_r_v2_1_io_in_0_Im = PermutationsWithStreaming_io_out_2_Im; // @[FFTDesigns.scala 5156:41]
  assign DFT_r_v2_1_io_in_1_Re = PermutationsWithStreaming_io_out_3_Re; // @[FFTDesigns.scala 5156:41]
  assign DFT_r_v2_1_io_in_1_Im = PermutationsWithStreaming_io_out_3_Im; // @[FFTDesigns.scala 5156:41]
  assign DFT_r_v2_2_clock = clock;
  assign DFT_r_v2_2_reset = reset;
  assign DFT_r_v2_2_io_in_0_Re = TwiddleFactorsStreamed_io_out_0_Re; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_2_io_in_0_Im = TwiddleFactorsStreamed_io_out_0_Im; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_2_io_in_1_Re = TwiddleFactorsStreamed_io_out_1_Re; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_2_io_in_1_Im = TwiddleFactorsStreamed_io_out_1_Im; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_3_clock = clock;
  assign DFT_r_v2_3_reset = reset;
  assign DFT_r_v2_3_io_in_0_Re = TwiddleFactorsStreamed_io_out_2_Re; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_3_io_in_0_Im = TwiddleFactorsStreamed_io_out_2_Im; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_3_io_in_1_Re = TwiddleFactorsStreamed_io_out_3_Re; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_3_io_in_1_Im = TwiddleFactorsStreamed_io_out_3_Im; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_4_clock = clock;
  assign DFT_r_v2_4_reset = reset;
  assign DFT_r_v2_4_io_in_0_Re = TwiddleFactorsStreamed_1_io_out_0_Re; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_4_io_in_0_Im = TwiddleFactorsStreamed_1_io_out_0_Im; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_4_io_in_1_Re = TwiddleFactorsStreamed_1_io_out_1_Re; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_4_io_in_1_Im = TwiddleFactorsStreamed_1_io_out_1_Im; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_5_clock = clock;
  assign DFT_r_v2_5_reset = reset;
  assign DFT_r_v2_5_io_in_0_Re = TwiddleFactorsStreamed_1_io_out_2_Re; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_5_io_in_0_Im = TwiddleFactorsStreamed_1_io_out_2_Im; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_5_io_in_1_Re = TwiddleFactorsStreamed_1_io_out_3_Re; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_5_io_in_1_Im = TwiddleFactorsStreamed_1_io_out_3_Im; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_6_clock = clock;
  assign DFT_r_v2_6_reset = reset;
  assign DFT_r_v2_6_io_in_0_Re = TwiddleFactorsStreamed_2_io_out_0_Re; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_6_io_in_0_Im = TwiddleFactorsStreamed_2_io_out_0_Im; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_6_io_in_1_Re = TwiddleFactorsStreamed_2_io_out_1_Re; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_6_io_in_1_Im = TwiddleFactorsStreamed_2_io_out_1_Im; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_7_clock = clock;
  assign DFT_r_v2_7_reset = reset;
  assign DFT_r_v2_7_io_in_0_Re = TwiddleFactorsStreamed_2_io_out_2_Re; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_7_io_in_0_Im = TwiddleFactorsStreamed_2_io_out_2_Im; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_7_io_in_1_Re = TwiddleFactorsStreamed_2_io_out_3_Re; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_7_io_in_1_Im = TwiddleFactorsStreamed_2_io_out_3_Im; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_8_clock = clock;
  assign DFT_r_v2_8_reset = reset;
  assign DFT_r_v2_8_io_in_0_Re = TwiddleFactorsStreamed_3_io_out_0_Re; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_8_io_in_0_Im = TwiddleFactorsStreamed_3_io_out_0_Im; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_8_io_in_1_Re = TwiddleFactorsStreamed_3_io_out_1_Re; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_8_io_in_1_Im = TwiddleFactorsStreamed_3_io_out_1_Im; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_9_clock = clock;
  assign DFT_r_v2_9_reset = reset;
  assign DFT_r_v2_9_io_in_0_Re = TwiddleFactorsStreamed_3_io_out_2_Re; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_9_io_in_0_Im = TwiddleFactorsStreamed_3_io_out_2_Im; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_9_io_in_1_Re = TwiddleFactorsStreamed_3_io_out_3_Re; // @[FFTDesigns.scala 5163:41]
  assign DFT_r_v2_9_io_in_1_Im = TwiddleFactorsStreamed_3_io_out_3_Im; // @[FFTDesigns.scala 5163:41]
  assign PermutationsWithStreaming_clock = clock;
  assign PermutationsWithStreaming_reset = reset;
  assign PermutationsWithStreaming_io_in_0_Re = io_in_ready ? io_in_0_Re : 32'h0; // @[FFTDesigns.scala 5124:30 5125:34 5128:39]
  assign PermutationsWithStreaming_io_in_0_Im = io_in_ready ? io_in_0_Im : 32'h0; // @[FFTDesigns.scala 5124:30 5125:34 5128:39]
  assign PermutationsWithStreaming_io_in_1_Re = io_in_ready ? io_in_1_Re : 32'h0; // @[FFTDesigns.scala 5124:30 5125:34 5128:39]
  assign PermutationsWithStreaming_io_in_1_Im = io_in_ready ? io_in_1_Im : 32'h0; // @[FFTDesigns.scala 5124:30 5125:34 5128:39]
  assign PermutationsWithStreaming_io_in_2_Re = io_in_ready ? io_in_2_Re : 32'h0; // @[FFTDesigns.scala 5124:30 5125:34 5128:39]
  assign PermutationsWithStreaming_io_in_2_Im = io_in_ready ? io_in_2_Im : 32'h0; // @[FFTDesigns.scala 5124:30 5125:34 5128:39]
  assign PermutationsWithStreaming_io_in_3_Re = io_in_ready ? io_in_3_Re : 32'h0; // @[FFTDesigns.scala 5124:30 5125:34 5128:39]
  assign PermutationsWithStreaming_io_in_3_Im = io_in_ready ? io_in_3_Im : 32'h0; // @[FFTDesigns.scala 5124:30 5125:34 5128:39]
  assign PermutationsWithStreaming_io_in_en_0 = io_in_ready; // @[FFTDesigns.scala 5123:38]
  assign PermutationsWithStreaming_io_in_en_1 = Perm_regdelays_0_0; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_io_in_en_2 = Perm_regdelays_0_1; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_io_in_en_3 = Perm_regdelays_0_2; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_io_in_en_4 = Perm_regdelays_0_3; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_io_in_en_5 = Perm_regdelays_0_4; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_io_in_en_6 = Perm_regdelays_0_5; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_io_in_en_7 = Perm_regdelays_0_6; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_io_in_en_8 = Perm_regdelays_0_7; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_io_in_en_9 = Perm_regdelays_0_8; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_io_in_en_10 = Perm_regdelays_0_9; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_io_in_en_11 = Perm_regdelays_0_10; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_io_in_en_12 = Perm_regdelays_0_11; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_io_in_en_13 = Perm_regdelays_0_12; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_io_in_en_14 = Perm_regdelays_0_13; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_io_in_en_15 = Perm_regdelays_0_14; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_io_in_en_16 = Perm_regdelays_0_15; // @[FFTDesigns.scala 5144:44]
  assign PermutationsWithStreaming_1_clock = clock;
  assign PermutationsWithStreaming_1_reset = reset;
  assign PermutationsWithStreaming_1_io_in_0_Re = DFT_r_v2_io_out_0_Re; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_1_io_in_0_Im = DFT_r_v2_io_out_0_Im; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_1_io_in_1_Re = DFT_r_v2_io_out_1_Re; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_1_io_in_1_Im = DFT_r_v2_io_out_1_Im; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_1_io_in_2_Re = DFT_r_v2_1_io_out_0_Re; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_1_io_in_2_Im = DFT_r_v2_1_io_out_0_Im; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_1_io_in_3_Re = DFT_r_v2_1_io_out_1_Re; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_1_io_in_3_Im = DFT_r_v2_1_io_out_1_Im; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_1_io_in_en_0 = DFT_regdelays_0_0; // @[FFTDesigns.scala 5133:38]
  assign PermutationsWithStreaming_1_io_in_en_1 = Perm_regdelays_1_0; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_1_io_in_en_2 = Perm_regdelays_1_1; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_1_io_in_en_3 = Perm_regdelays_1_2; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_1_io_in_en_4 = Perm_regdelays_1_3; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_1_io_in_en_5 = Perm_regdelays_1_4; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_1_io_in_en_6 = Perm_regdelays_1_5; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_1_io_in_en_7 = Perm_regdelays_1_6; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_1_io_in_en_8 = Perm_regdelays_1_7; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_1_io_in_en_9 = Perm_regdelays_1_8; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_1_io_in_en_10 = Perm_regdelays_1_9; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_1_io_in_en_11 = Perm_regdelays_1_10; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_1_io_in_en_12 = Perm_regdelays_1_11; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_1_io_in_en_13 = Perm_regdelays_1_12; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_1_io_in_en_14 = Perm_regdelays_1_13; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_1_io_in_en_15 = Perm_regdelays_1_14; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_1_io_in_en_16 = Perm_regdelays_1_15; // @[FFTDesigns.scala 5144:44]
  assign PermutationsWithStreaming_2_clock = clock;
  assign PermutationsWithStreaming_2_reset = reset;
  assign PermutationsWithStreaming_2_io_in_0_Re = DFT_r_v2_2_io_out_0_Re; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_2_io_in_0_Im = DFT_r_v2_2_io_out_0_Im; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_2_io_in_1_Re = DFT_r_v2_2_io_out_1_Re; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_2_io_in_1_Im = DFT_r_v2_2_io_out_1_Im; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_2_io_in_2_Re = DFT_r_v2_3_io_out_0_Re; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_2_io_in_2_Im = DFT_r_v2_3_io_out_0_Im; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_2_io_in_3_Re = DFT_r_v2_3_io_out_1_Re; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_2_io_in_3_Im = DFT_r_v2_3_io_out_1_Im; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_2_io_in_en_0 = DFT_regdelays_1_0; // @[FFTDesigns.scala 5133:38]
  assign PermutationsWithStreaming_2_io_in_en_1 = Perm_regdelays_2_0; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_2_io_in_en_2 = Perm_regdelays_2_1; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_2_io_in_en_3 = Perm_regdelays_2_2; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_2_io_in_en_4 = Perm_regdelays_2_3; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_2_io_in_en_5 = Perm_regdelays_2_4; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_2_io_in_en_6 = Perm_regdelays_2_5; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_2_io_in_en_7 = Perm_regdelays_2_6; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_2_io_in_en_8 = Perm_regdelays_2_7; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_2_io_in_en_9 = Perm_regdelays_2_8; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_2_io_in_en_10 = Perm_regdelays_2_9; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_2_io_in_en_11 = Perm_regdelays_2_10; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_2_io_in_en_12 = Perm_regdelays_2_11; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_2_io_in_en_13 = Perm_regdelays_2_12; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_2_io_in_en_14 = Perm_regdelays_2_13; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_2_io_in_en_15 = Perm_regdelays_2_14; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_2_io_in_en_16 = Perm_regdelays_2_15; // @[FFTDesigns.scala 5144:44]
  assign PermutationsWithStreaming_3_clock = clock;
  assign PermutationsWithStreaming_3_reset = reset;
  assign PermutationsWithStreaming_3_io_in_0_Re = DFT_r_v2_4_io_out_0_Re; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_3_io_in_0_Im = DFT_r_v2_4_io_out_0_Im; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_3_io_in_1_Re = DFT_r_v2_4_io_out_1_Re; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_3_io_in_1_Im = DFT_r_v2_4_io_out_1_Im; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_3_io_in_2_Re = DFT_r_v2_5_io_out_0_Re; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_3_io_in_2_Im = DFT_r_v2_5_io_out_0_Im; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_3_io_in_3_Re = DFT_r_v2_5_io_out_1_Re; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_3_io_in_3_Im = DFT_r_v2_5_io_out_1_Im; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_3_io_in_en_0 = DFT_regdelays_2_0; // @[FFTDesigns.scala 5133:38]
  assign PermutationsWithStreaming_3_io_in_en_1 = Perm_regdelays_3_0; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_3_io_in_en_2 = Perm_regdelays_3_1; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_3_io_in_en_3 = Perm_regdelays_3_2; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_3_io_in_en_4 = Perm_regdelays_3_3; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_3_io_in_en_5 = Perm_regdelays_3_4; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_3_io_in_en_6 = Perm_regdelays_3_5; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_3_io_in_en_7 = Perm_regdelays_3_6; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_3_io_in_en_8 = Perm_regdelays_3_7; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_3_io_in_en_9 = Perm_regdelays_3_8; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_3_io_in_en_10 = Perm_regdelays_3_9; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_3_io_in_en_11 = Perm_regdelays_3_10; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_3_io_in_en_12 = Perm_regdelays_3_11; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_3_io_in_en_13 = Perm_regdelays_3_12; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_3_io_in_en_14 = Perm_regdelays_3_13; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_3_io_in_en_15 = Perm_regdelays_3_14; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_3_io_in_en_16 = Perm_regdelays_3_15; // @[FFTDesigns.scala 5144:44]
  assign PermutationsWithStreaming_4_clock = clock;
  assign PermutationsWithStreaming_4_reset = reset;
  assign PermutationsWithStreaming_4_io_in_0_Re = DFT_r_v2_6_io_out_0_Re; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_4_io_in_0_Im = DFT_r_v2_6_io_out_0_Im; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_4_io_in_1_Re = DFT_r_v2_6_io_out_1_Re; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_4_io_in_1_Im = DFT_r_v2_6_io_out_1_Im; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_4_io_in_2_Re = DFT_r_v2_7_io_out_0_Re; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_4_io_in_2_Im = DFT_r_v2_7_io_out_0_Im; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_4_io_in_3_Re = DFT_r_v2_7_io_out_1_Re; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_4_io_in_3_Im = DFT_r_v2_7_io_out_1_Im; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_4_io_in_en_0 = DFT_regdelays_3_0; // @[FFTDesigns.scala 5133:38]
  assign PermutationsWithStreaming_4_io_in_en_1 = Perm_regdelays_4_0; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_4_io_in_en_2 = Perm_regdelays_4_1; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_4_io_in_en_3 = Perm_regdelays_4_2; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_4_io_in_en_4 = Perm_regdelays_4_3; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_4_io_in_en_5 = Perm_regdelays_4_4; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_4_io_in_en_6 = Perm_regdelays_4_5; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_4_io_in_en_7 = Perm_regdelays_4_6; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_4_io_in_en_8 = Perm_regdelays_4_7; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_4_io_in_en_9 = Perm_regdelays_4_8; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_4_io_in_en_10 = Perm_regdelays_4_9; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_4_io_in_en_11 = Perm_regdelays_4_10; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_4_io_in_en_12 = Perm_regdelays_4_11; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_4_io_in_en_13 = Perm_regdelays_4_12; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_4_io_in_en_14 = Perm_regdelays_4_13; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_4_io_in_en_15 = Perm_regdelays_4_14; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_4_io_in_en_16 = Perm_regdelays_4_15; // @[FFTDesigns.scala 5144:44]
  assign PermutationsWithStreaming_5_clock = clock;
  assign PermutationsWithStreaming_5_reset = reset;
  assign PermutationsWithStreaming_5_io_in_0_Re = DFT_r_v2_8_io_out_0_Re; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_5_io_in_0_Im = DFT_r_v2_8_io_out_0_Im; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_5_io_in_1_Re = DFT_r_v2_8_io_out_1_Re; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_5_io_in_1_Im = DFT_r_v2_8_io_out_1_Im; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_5_io_in_2_Re = DFT_r_v2_9_io_out_0_Re; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_5_io_in_2_Im = DFT_r_v2_9_io_out_0_Im; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_5_io_in_3_Re = DFT_r_v2_9_io_out_1_Re; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_5_io_in_3_Im = DFT_r_v2_9_io_out_1_Im; // @[FFTDesigns.scala 5136:45]
  assign PermutationsWithStreaming_5_io_in_en_0 = DFT_regdelays_4_0; // @[FFTDesigns.scala 5133:38]
  assign PermutationsWithStreaming_5_io_in_en_1 = Perm_regdelays_5_0; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_5_io_in_en_2 = Perm_regdelays_5_1; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_5_io_in_en_3 = Perm_regdelays_5_2; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_5_io_in_en_4 = Perm_regdelays_5_3; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_5_io_in_en_5 = Perm_regdelays_5_4; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_5_io_in_en_6 = Perm_regdelays_5_5; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_5_io_in_en_7 = Perm_regdelays_5_6; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_5_io_in_en_8 = Perm_regdelays_5_7; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_5_io_in_en_9 = Perm_regdelays_5_8; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_5_io_in_en_10 = Perm_regdelays_5_9; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_5_io_in_en_11 = Perm_regdelays_5_10; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_5_io_in_en_12 = Perm_regdelays_5_11; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_5_io_in_en_13 = Perm_regdelays_5_12; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_5_io_in_en_14 = Perm_regdelays_5_13; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_5_io_in_en_15 = Perm_regdelays_5_14; // @[FFTDesigns.scala 5142:36]
  assign PermutationsWithStreaming_5_io_in_en_16 = Perm_regdelays_5_15; // @[FFTDesigns.scala 5144:44]
  assign TwiddleFactorsStreamed_clock = clock;
  assign TwiddleFactorsStreamed_reset = reset;
  assign TwiddleFactorsStreamed_io_in_0_Re = PermutationsWithStreaming_1_io_out_0_Re; // @[FFTDesigns.scala 5178:32]
  assign TwiddleFactorsStreamed_io_in_0_Im = PermutationsWithStreaming_1_io_out_0_Im; // @[FFTDesigns.scala 5178:32]
  assign TwiddleFactorsStreamed_io_in_1_Re = PermutationsWithStreaming_1_io_out_1_Re; // @[FFTDesigns.scala 5178:32]
  assign TwiddleFactorsStreamed_io_in_1_Im = PermutationsWithStreaming_1_io_out_1_Im; // @[FFTDesigns.scala 5178:32]
  assign TwiddleFactorsStreamed_io_in_2_Re = PermutationsWithStreaming_1_io_out_2_Re; // @[FFTDesigns.scala 5178:32]
  assign TwiddleFactorsStreamed_io_in_2_Im = PermutationsWithStreaming_1_io_out_2_Im; // @[FFTDesigns.scala 5178:32]
  assign TwiddleFactorsStreamed_io_in_3_Re = PermutationsWithStreaming_1_io_out_3_Re; // @[FFTDesigns.scala 5178:32]
  assign TwiddleFactorsStreamed_io_in_3_Im = PermutationsWithStreaming_1_io_out_3_Im; // @[FFTDesigns.scala 5178:32]
  assign TwiddleFactorsStreamed_io_in_en_0 = Perm_regdelays_1_15; // @[FFTDesigns.scala 5177:38]
  assign TwiddleFactorsStreamed_io_in_en_1 = Twid_regdelays_0_0; // @[FFTDesigns.scala 5186:36]
  assign TwiddleFactorsStreamed_1_clock = clock;
  assign TwiddleFactorsStreamed_1_reset = reset;
  assign TwiddleFactorsStreamed_1_io_in_0_Re = PermutationsWithStreaming_2_io_out_0_Re; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_1_io_in_0_Im = PermutationsWithStreaming_2_io_out_0_Im; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_1_io_in_1_Re = PermutationsWithStreaming_2_io_out_1_Re; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_1_io_in_1_Im = PermutationsWithStreaming_2_io_out_1_Im; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_1_io_in_2_Re = PermutationsWithStreaming_2_io_out_2_Re; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_1_io_in_2_Im = PermutationsWithStreaming_2_io_out_2_Im; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_1_io_in_3_Re = PermutationsWithStreaming_2_io_out_3_Re; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_1_io_in_3_Im = PermutationsWithStreaming_2_io_out_3_Im; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_1_io_in_en_0 = Perm_regdelays_2_15; // @[FFTDesigns.scala 5181:38]
  assign TwiddleFactorsStreamed_1_io_in_en_1 = Twid_regdelays_1_0; // @[FFTDesigns.scala 5186:36]
  assign TwiddleFactorsStreamed_2_clock = clock;
  assign TwiddleFactorsStreamed_2_reset = reset;
  assign TwiddleFactorsStreamed_2_io_in_0_Re = PermutationsWithStreaming_3_io_out_0_Re; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_2_io_in_0_Im = PermutationsWithStreaming_3_io_out_0_Im; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_2_io_in_1_Re = PermutationsWithStreaming_3_io_out_1_Re; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_2_io_in_1_Im = PermutationsWithStreaming_3_io_out_1_Im; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_2_io_in_2_Re = PermutationsWithStreaming_3_io_out_2_Re; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_2_io_in_2_Im = PermutationsWithStreaming_3_io_out_2_Im; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_2_io_in_3_Re = PermutationsWithStreaming_3_io_out_3_Re; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_2_io_in_3_Im = PermutationsWithStreaming_3_io_out_3_Im; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_2_io_in_en_0 = Perm_regdelays_3_15; // @[FFTDesigns.scala 5181:38]
  assign TwiddleFactorsStreamed_2_io_in_en_1 = Twid_regdelays_2_0; // @[FFTDesigns.scala 5186:36]
  assign TwiddleFactorsStreamed_3_clock = clock;
  assign TwiddleFactorsStreamed_3_reset = reset;
  assign TwiddleFactorsStreamed_3_io_in_0_Re = PermutationsWithStreaming_4_io_out_0_Re; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_3_io_in_0_Im = PermutationsWithStreaming_4_io_out_0_Im; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_3_io_in_1_Re = PermutationsWithStreaming_4_io_out_1_Re; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_3_io_in_1_Im = PermutationsWithStreaming_4_io_out_1_Im; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_3_io_in_2_Re = PermutationsWithStreaming_4_io_out_2_Re; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_3_io_in_2_Im = PermutationsWithStreaming_4_io_out_2_Im; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_3_io_in_3_Re = PermutationsWithStreaming_4_io_out_3_Re; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_3_io_in_3_Im = PermutationsWithStreaming_4_io_out_3_Im; // @[FFTDesigns.scala 5182:32]
  assign TwiddleFactorsStreamed_3_io_in_en_0 = Perm_regdelays_4_15; // @[FFTDesigns.scala 5181:38]
  assign TwiddleFactorsStreamed_3_io_in_en_1 = Twid_regdelays_3_0; // @[FFTDesigns.scala 5186:36]
  always @(posedge clock) begin
    if (reset) begin // @[FFTDesigns.scala 5094:32]
      DFT_regdelays_0_0 <= 1'h0; // @[FFTDesigns.scala 5094:32]
    end else begin
      DFT_regdelays_0_0 <= Perm_regdelays_0_15; // @[FFTDesigns.scala 5153:33]
    end
    if (reset) begin // @[FFTDesigns.scala 5094:32]
      DFT_regdelays_1_0 <= 1'h0; // @[FFTDesigns.scala 5094:32]
    end else begin
      DFT_regdelays_1_0 <= Twid_regdelays_0_1; // @[FFTDesigns.scala 5160:33]
    end
    if (reset) begin // @[FFTDesigns.scala 5094:32]
      DFT_regdelays_2_0 <= 1'h0; // @[FFTDesigns.scala 5094:32]
    end else begin
      DFT_regdelays_2_0 <= Twid_regdelays_1_1; // @[FFTDesigns.scala 5160:33]
    end
    if (reset) begin // @[FFTDesigns.scala 5094:32]
      DFT_regdelays_3_0 <= 1'h0; // @[FFTDesigns.scala 5094:32]
    end else begin
      DFT_regdelays_3_0 <= Twid_regdelays_2_1; // @[FFTDesigns.scala 5160:33]
    end
    if (reset) begin // @[FFTDesigns.scala 5094:32]
      DFT_regdelays_4_0 <= 1'h0; // @[FFTDesigns.scala 5094:32]
    end else begin
      DFT_regdelays_4_0 <= Twid_regdelays_3_1; // @[FFTDesigns.scala 5160:33]
    end
    if (reset) begin // @[FFTDesigns.scala 5095:33]
      Twid_regdelays_0_0 <= 1'h0; // @[FFTDesigns.scala 5095:33]
    end else begin
      Twid_regdelays_0_0 <= Perm_regdelays_1_15; // @[FFTDesigns.scala 5176:34]
    end
    if (reset) begin // @[FFTDesigns.scala 5095:33]
      Twid_regdelays_0_1 <= 1'h0; // @[FFTDesigns.scala 5095:33]
    end else begin
      Twid_regdelays_0_1 <= Twid_regdelays_0_0; // @[FFTDesigns.scala 5185:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5095:33]
      Twid_regdelays_1_0 <= 1'h0; // @[FFTDesigns.scala 5095:33]
    end else begin
      Twid_regdelays_1_0 <= Perm_regdelays_2_15; // @[FFTDesigns.scala 5180:34]
    end
    if (reset) begin // @[FFTDesigns.scala 5095:33]
      Twid_regdelays_1_1 <= 1'h0; // @[FFTDesigns.scala 5095:33]
    end else begin
      Twid_regdelays_1_1 <= Twid_regdelays_1_0; // @[FFTDesigns.scala 5185:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5095:33]
      Twid_regdelays_2_0 <= 1'h0; // @[FFTDesigns.scala 5095:33]
    end else begin
      Twid_regdelays_2_0 <= Perm_regdelays_3_15; // @[FFTDesigns.scala 5180:34]
    end
    if (reset) begin // @[FFTDesigns.scala 5095:33]
      Twid_regdelays_2_1 <= 1'h0; // @[FFTDesigns.scala 5095:33]
    end else begin
      Twid_regdelays_2_1 <= Twid_regdelays_2_0; // @[FFTDesigns.scala 5185:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5095:33]
      Twid_regdelays_3_0 <= 1'h0; // @[FFTDesigns.scala 5095:33]
    end else begin
      Twid_regdelays_3_0 <= Perm_regdelays_4_15; // @[FFTDesigns.scala 5180:34]
    end
    if (reset) begin // @[FFTDesigns.scala 5095:33]
      Twid_regdelays_3_1 <= 1'h0; // @[FFTDesigns.scala 5095:33]
    end else begin
      Twid_regdelays_3_1 <= Twid_regdelays_3_0; // @[FFTDesigns.scala 5185:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_0_0 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_0_0 <= io_in_ready; // @[FFTDesigns.scala 5122:34]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_0_1 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_0_1 <= Perm_regdelays_0_0; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_0_2 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_0_2 <= Perm_regdelays_0_1; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_0_3 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_0_3 <= Perm_regdelays_0_2; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_0_4 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_0_4 <= Perm_regdelays_0_3; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_0_5 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_0_5 <= Perm_regdelays_0_4; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_0_6 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_0_6 <= Perm_regdelays_0_5; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_0_7 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_0_7 <= Perm_regdelays_0_6; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_0_8 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_0_8 <= Perm_regdelays_0_7; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_0_9 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_0_9 <= Perm_regdelays_0_8; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_0_10 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_0_10 <= Perm_regdelays_0_9; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_0_11 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_0_11 <= Perm_regdelays_0_10; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_0_12 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_0_12 <= Perm_regdelays_0_11; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_0_13 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_0_13 <= Perm_regdelays_0_12; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_0_14 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_0_14 <= Perm_regdelays_0_13; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_0_15 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_0_15 <= Perm_regdelays_0_14; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_1_0 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_1_0 <= DFT_regdelays_0_0; // @[FFTDesigns.scala 5132:34]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_1_1 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_1_1 <= Perm_regdelays_1_0; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_1_2 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_1_2 <= Perm_regdelays_1_1; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_1_3 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_1_3 <= Perm_regdelays_1_2; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_1_4 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_1_4 <= Perm_regdelays_1_3; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_1_5 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_1_5 <= Perm_regdelays_1_4; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_1_6 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_1_6 <= Perm_regdelays_1_5; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_1_7 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_1_7 <= Perm_regdelays_1_6; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_1_8 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_1_8 <= Perm_regdelays_1_7; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_1_9 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_1_9 <= Perm_regdelays_1_8; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_1_10 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_1_10 <= Perm_regdelays_1_9; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_1_11 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_1_11 <= Perm_regdelays_1_10; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_1_12 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_1_12 <= Perm_regdelays_1_11; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_1_13 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_1_13 <= Perm_regdelays_1_12; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_1_14 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_1_14 <= Perm_regdelays_1_13; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_1_15 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_1_15 <= Perm_regdelays_1_14; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_2_0 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_2_0 <= DFT_regdelays_1_0; // @[FFTDesigns.scala 5132:34]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_2_1 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_2_1 <= Perm_regdelays_2_0; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_2_2 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_2_2 <= Perm_regdelays_2_1; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_2_3 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_2_3 <= Perm_regdelays_2_2; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_2_4 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_2_4 <= Perm_regdelays_2_3; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_2_5 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_2_5 <= Perm_regdelays_2_4; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_2_6 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_2_6 <= Perm_regdelays_2_5; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_2_7 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_2_7 <= Perm_regdelays_2_6; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_2_8 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_2_8 <= Perm_regdelays_2_7; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_2_9 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_2_9 <= Perm_regdelays_2_8; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_2_10 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_2_10 <= Perm_regdelays_2_9; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_2_11 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_2_11 <= Perm_regdelays_2_10; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_2_12 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_2_12 <= Perm_regdelays_2_11; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_2_13 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_2_13 <= Perm_regdelays_2_12; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_2_14 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_2_14 <= Perm_regdelays_2_13; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_2_15 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_2_15 <= Perm_regdelays_2_14; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_3_0 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_3_0 <= DFT_regdelays_2_0; // @[FFTDesigns.scala 5132:34]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_3_1 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_3_1 <= Perm_regdelays_3_0; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_3_2 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_3_2 <= Perm_regdelays_3_1; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_3_3 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_3_3 <= Perm_regdelays_3_2; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_3_4 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_3_4 <= Perm_regdelays_3_3; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_3_5 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_3_5 <= Perm_regdelays_3_4; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_3_6 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_3_6 <= Perm_regdelays_3_5; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_3_7 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_3_7 <= Perm_regdelays_3_6; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_3_8 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_3_8 <= Perm_regdelays_3_7; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_3_9 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_3_9 <= Perm_regdelays_3_8; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_3_10 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_3_10 <= Perm_regdelays_3_9; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_3_11 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_3_11 <= Perm_regdelays_3_10; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_3_12 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_3_12 <= Perm_regdelays_3_11; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_3_13 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_3_13 <= Perm_regdelays_3_12; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_3_14 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_3_14 <= Perm_regdelays_3_13; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_3_15 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_3_15 <= Perm_regdelays_3_14; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_4_0 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_4_0 <= DFT_regdelays_3_0; // @[FFTDesigns.scala 5132:34]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_4_1 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_4_1 <= Perm_regdelays_4_0; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_4_2 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_4_2 <= Perm_regdelays_4_1; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_4_3 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_4_3 <= Perm_regdelays_4_2; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_4_4 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_4_4 <= Perm_regdelays_4_3; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_4_5 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_4_5 <= Perm_regdelays_4_4; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_4_6 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_4_6 <= Perm_regdelays_4_5; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_4_7 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_4_7 <= Perm_regdelays_4_6; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_4_8 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_4_8 <= Perm_regdelays_4_7; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_4_9 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_4_9 <= Perm_regdelays_4_8; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_4_10 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_4_10 <= Perm_regdelays_4_9; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_4_11 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_4_11 <= Perm_regdelays_4_10; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_4_12 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_4_12 <= Perm_regdelays_4_11; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_4_13 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_4_13 <= Perm_regdelays_4_12; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_4_14 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_4_14 <= Perm_regdelays_4_13; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_4_15 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_4_15 <= Perm_regdelays_4_14; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_5_0 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_5_0 <= DFT_regdelays_4_0; // @[FFTDesigns.scala 5132:34]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_5_1 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_5_1 <= Perm_regdelays_5_0; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_5_2 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_5_2 <= Perm_regdelays_5_1; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_5_3 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_5_3 <= Perm_regdelays_5_2; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_5_4 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_5_4 <= Perm_regdelays_5_3; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_5_5 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_5_5 <= Perm_regdelays_5_4; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_5_6 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_5_6 <= Perm_regdelays_5_5; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_5_7 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_5_7 <= Perm_regdelays_5_6; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_5_8 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_5_8 <= Perm_regdelays_5_7; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_5_9 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_5_9 <= Perm_regdelays_5_8; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_5_10 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_5_10 <= Perm_regdelays_5_9; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_5_11 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_5_11 <= Perm_regdelays_5_10; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_5_12 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_5_12 <= Perm_regdelays_5_11; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_5_13 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_5_13 <= Perm_regdelays_5_12; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_5_14 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_5_14 <= Perm_regdelays_5_13; // @[FFTDesigns.scala 5141:32]
    end
    if (reset) begin // @[FFTDesigns.scala 5096:33]
      Perm_regdelays_5_15 <= 1'h0; // @[FFTDesigns.scala 5096:33]
    end else begin
      Perm_regdelays_5_15 <= Perm_regdelays_5_14; // @[FFTDesigns.scala 5141:32]
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
  DFT_regdelays_2_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  DFT_regdelays_3_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  DFT_regdelays_4_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  Twid_regdelays_0_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  Twid_regdelays_0_1 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  Twid_regdelays_1_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  Twid_regdelays_1_1 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  Twid_regdelays_2_0 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  Twid_regdelays_2_1 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  Twid_regdelays_3_0 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  Twid_regdelays_3_1 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  Perm_regdelays_0_0 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  Perm_regdelays_0_1 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  Perm_regdelays_0_2 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  Perm_regdelays_0_3 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  Perm_regdelays_0_4 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  Perm_regdelays_0_5 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  Perm_regdelays_0_6 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  Perm_regdelays_0_7 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  Perm_regdelays_0_8 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  Perm_regdelays_0_9 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  Perm_regdelays_0_10 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  Perm_regdelays_0_11 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  Perm_regdelays_0_12 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  Perm_regdelays_0_13 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  Perm_regdelays_0_14 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  Perm_regdelays_0_15 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  Perm_regdelays_1_0 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  Perm_regdelays_1_1 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  Perm_regdelays_1_2 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  Perm_regdelays_1_3 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  Perm_regdelays_1_4 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  Perm_regdelays_1_5 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  Perm_regdelays_1_6 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  Perm_regdelays_1_7 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  Perm_regdelays_1_8 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  Perm_regdelays_1_9 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  Perm_regdelays_1_10 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  Perm_regdelays_1_11 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  Perm_regdelays_1_12 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  Perm_regdelays_1_13 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  Perm_regdelays_1_14 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  Perm_regdelays_1_15 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  Perm_regdelays_2_0 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  Perm_regdelays_2_1 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  Perm_regdelays_2_2 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  Perm_regdelays_2_3 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  Perm_regdelays_2_4 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  Perm_regdelays_2_5 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  Perm_regdelays_2_6 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  Perm_regdelays_2_7 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  Perm_regdelays_2_8 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  Perm_regdelays_2_9 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  Perm_regdelays_2_10 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  Perm_regdelays_2_11 = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  Perm_regdelays_2_12 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  Perm_regdelays_2_13 = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  Perm_regdelays_2_14 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  Perm_regdelays_2_15 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  Perm_regdelays_3_0 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  Perm_regdelays_3_1 = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  Perm_regdelays_3_2 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  Perm_regdelays_3_3 = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  Perm_regdelays_3_4 = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  Perm_regdelays_3_5 = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  Perm_regdelays_3_6 = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  Perm_regdelays_3_7 = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  Perm_regdelays_3_8 = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  Perm_regdelays_3_9 = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  Perm_regdelays_3_10 = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  Perm_regdelays_3_11 = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  Perm_regdelays_3_12 = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  Perm_regdelays_3_13 = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  Perm_regdelays_3_14 = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  Perm_regdelays_3_15 = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  Perm_regdelays_4_0 = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  Perm_regdelays_4_1 = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  Perm_regdelays_4_2 = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  Perm_regdelays_4_3 = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  Perm_regdelays_4_4 = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  Perm_regdelays_4_5 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  Perm_regdelays_4_6 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  Perm_regdelays_4_7 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  Perm_regdelays_4_8 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  Perm_regdelays_4_9 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  Perm_regdelays_4_10 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  Perm_regdelays_4_11 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  Perm_regdelays_4_12 = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  Perm_regdelays_4_13 = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  Perm_regdelays_4_14 = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  Perm_regdelays_4_15 = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  Perm_regdelays_5_0 = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  Perm_regdelays_5_1 = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  Perm_regdelays_5_2 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  Perm_regdelays_5_3 = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  Perm_regdelays_5_4 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  Perm_regdelays_5_5 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  Perm_regdelays_5_6 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  Perm_regdelays_5_7 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  Perm_regdelays_5_8 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  Perm_regdelays_5_9 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  Perm_regdelays_5_10 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  Perm_regdelays_5_11 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  Perm_regdelays_5_12 = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  Perm_regdelays_5_13 = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  Perm_regdelays_5_14 = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  Perm_regdelays_5_15 = _RAND_108[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FPComplexSub(
  input         clock,
  input         reset,
  input  [31:0] io_in_a_Re,
  input  [31:0] io_in_a_Im,
  input  [31:0] io_in_b_Re,
  input  [31:0] io_in_b_Im,
  output [31:0] io_out_s_Re,
  output [31:0] io_out_s_Im
);
  wire  FP_subber_clock; // @[FPComplex.scala 78:25]
  wire  FP_subber_reset; // @[FPComplex.scala 78:25]
  wire [31:0] FP_subber_io_in_a; // @[FPComplex.scala 78:25]
  wire [31:0] FP_subber_io_in_b; // @[FPComplex.scala 78:25]
  wire [31:0] FP_subber_io_out_s; // @[FPComplex.scala 78:25]
  wire  FP_subber_1_clock; // @[FPComplex.scala 78:25]
  wire  FP_subber_1_reset; // @[FPComplex.scala 78:25]
  wire [31:0] FP_subber_1_io_in_a; // @[FPComplex.scala 78:25]
  wire [31:0] FP_subber_1_io_in_b; // @[FPComplex.scala 78:25]
  wire [31:0] FP_subber_1_io_out_s; // @[FPComplex.scala 78:25]
  FP_subber FP_subber ( // @[FPComplex.scala 78:25]
    .clock(FP_subber_clock),
    .reset(FP_subber_reset),
    .io_in_a(FP_subber_io_in_a),
    .io_in_b(FP_subber_io_in_b),
    .io_out_s(FP_subber_io_out_s)
  );
  FP_subber FP_subber_1 ( // @[FPComplex.scala 78:25]
    .clock(FP_subber_1_clock),
    .reset(FP_subber_1_reset),
    .io_in_a(FP_subber_1_io_in_a),
    .io_in_b(FP_subber_1_io_in_b),
    .io_out_s(FP_subber_1_io_out_s)
  );
  assign io_out_s_Re = FP_subber_io_out_s; // @[FPComplex.scala 85:17]
  assign io_out_s_Im = FP_subber_1_io_out_s; // @[FPComplex.scala 86:17]
  assign FP_subber_clock = clock;
  assign FP_subber_reset = reset;
  assign FP_subber_io_in_a = io_in_a_Re; // @[FPComplex.scala 81:24]
  assign FP_subber_io_in_b = io_in_b_Re; // @[FPComplex.scala 82:24]
  assign FP_subber_1_clock = clock;
  assign FP_subber_1_reset = reset;
  assign FP_subber_1_io_in_a = io_in_a_Im; // @[FPComplex.scala 83:24]
  assign FP_subber_1_io_in_b = io_in_b_Im; // @[FPComplex.scala 84:24]
endmodule
module FPComplexMultiAdder_20(
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  output [31:0] io_out_Re,
  output [31:0] io_out_Im
);
  assign io_out_Re = io_in_0_Re; // @[FPComplex.scala 521:14]
  assign io_out_Im = io_in_0_Im; // @[FPComplex.scala 521:14]
endmodule
module FPComplexMult_reducable_v2(
  input         clock,
  input         reset,
  input  [31:0] io_in_a_Re,
  input  [31:0] io_in_a_Im,
  output [31:0] io_out_s_Re,
  output [31:0] io_out_s_Im
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] cmplx_adj_io_in_Re; // @[FPComplex.scala 380:33]
  wire [31:0] cmplx_adj_io_in_Im; // @[FPComplex.scala 380:33]
  wire [7:0] cmplx_adj_io_in_adj; // @[FPComplex.scala 380:33]
  wire  cmplx_adj_io_is_neg; // @[FPComplex.scala 380:33]
  wire  cmplx_adj_io_is_flip; // @[FPComplex.scala 380:33]
  wire [31:0] cmplx_adj_io_out_Re; // @[FPComplex.scala 380:33]
  wire [31:0] cmplx_adj_io_out_Im; // @[FPComplex.scala 380:33]
  reg [31:0] result_0_Re; // @[FPComplex.scala 391:31]
  reg [31:0] result_0_Im; // @[FPComplex.scala 391:31]
  cmplx_adj cmplx_adj ( // @[FPComplex.scala 380:33]
    .io_in_Re(cmplx_adj_io_in_Re),
    .io_in_Im(cmplx_adj_io_in_Im),
    .io_in_adj(cmplx_adj_io_in_adj),
    .io_is_neg(cmplx_adj_io_is_neg),
    .io_is_flip(cmplx_adj_io_is_flip),
    .io_out_Re(cmplx_adj_io_out_Re),
    .io_out_Im(cmplx_adj_io_out_Im)
  );
  assign io_out_s_Re = result_0_Re; // @[FPComplex.scala 400:20]
  assign io_out_s_Im = result_0_Im; // @[FPComplex.scala 400:20]
  assign cmplx_adj_io_in_Re = io_in_a_Re; // @[FPComplex.scala 381:24]
  assign cmplx_adj_io_in_Im = io_in_a_Im; // @[FPComplex.scala 381:24]
  assign cmplx_adj_io_in_adj = 8'h1; // @[FPComplex.scala 384:30]
  assign cmplx_adj_io_is_neg = 1'h1; // @[FPComplex.scala 386:32]
  assign cmplx_adj_io_is_flip = 1'h0; // @[FPComplex.scala 382:29]
  always @(posedge clock) begin
    if (reset) begin // @[FPComplex.scala 391:31]
      result_0_Re <= 32'h0; // @[FPComplex.scala 391:31]
    end else begin
      result_0_Re <= cmplx_adj_io_out_Re; // @[FPComplex.scala 394:25]
    end
    if (reset) begin // @[FPComplex.scala 391:31]
      result_0_Im <= 32'h0; // @[FPComplex.scala 391:31]
    end else begin
      result_0_Im <= cmplx_adj_io_out_Im; // @[FPComplex.scala 394:25]
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
  result_0_Re = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  result_0_Im = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FPComplexMult_reducable_v2_1(
  input         clock,
  input         reset,
  input  [31:0] io_in_a_Re,
  input  [31:0] io_in_a_Im,
  output [31:0] io_out_s_Re,
  output [31:0] io_out_s_Im
);
  wire [31:0] cmplx_adj_io_in_Re; // @[FPComplex.scala 340:33]
  wire [31:0] cmplx_adj_io_in_Im; // @[FPComplex.scala 340:33]
  wire [7:0] cmplx_adj_io_in_adj; // @[FPComplex.scala 340:33]
  wire  cmplx_adj_io_is_neg; // @[FPComplex.scala 340:33]
  wire  cmplx_adj_io_is_flip; // @[FPComplex.scala 340:33]
  wire [31:0] cmplx_adj_io_out_Re; // @[FPComplex.scala 340:33]
  wire [31:0] cmplx_adj_io_out_Im; // @[FPComplex.scala 340:33]
  wire  FP_multiplier_clock; // @[FPComplex.scala 368:29]
  wire  FP_multiplier_reset; // @[FPComplex.scala 368:29]
  wire [31:0] FP_multiplier_io_in_a; // @[FPComplex.scala 368:29]
  wire [31:0] FP_multiplier_io_in_b; // @[FPComplex.scala 368:29]
  wire [31:0] FP_multiplier_io_out_s; // @[FPComplex.scala 368:29]
  wire  FP_multiplier_1_clock; // @[FPComplex.scala 368:29]
  wire  FP_multiplier_1_reset; // @[FPComplex.scala 368:29]
  wire [31:0] FP_multiplier_1_io_in_a; // @[FPComplex.scala 368:29]
  wire [31:0] FP_multiplier_1_io_in_b; // @[FPComplex.scala 368:29]
  wire [31:0] FP_multiplier_1_io_out_s; // @[FPComplex.scala 368:29]
  cmplx_adj cmplx_adj ( // @[FPComplex.scala 340:33]
    .io_in_Re(cmplx_adj_io_in_Re),
    .io_in_Im(cmplx_adj_io_in_Im),
    .io_in_adj(cmplx_adj_io_in_adj),
    .io_is_neg(cmplx_adj_io_is_neg),
    .io_is_flip(cmplx_adj_io_is_flip),
    .io_out_Re(cmplx_adj_io_out_Re),
    .io_out_Im(cmplx_adj_io_out_Im)
  );
  FP_multiplier FP_multiplier ( // @[FPComplex.scala 368:29]
    .clock(FP_multiplier_clock),
    .reset(FP_multiplier_reset),
    .io_in_a(FP_multiplier_io_in_a),
    .io_in_b(FP_multiplier_io_in_b),
    .io_out_s(FP_multiplier_io_out_s)
  );
  FP_multiplier FP_multiplier_1 ( // @[FPComplex.scala 368:29]
    .clock(FP_multiplier_1_clock),
    .reset(FP_multiplier_1_reset),
    .io_in_a(FP_multiplier_1_io_in_a),
    .io_in_b(FP_multiplier_1_io_in_b),
    .io_out_s(FP_multiplier_1_io_out_s)
  );
  assign io_out_s_Re = FP_multiplier_io_out_s; // @[FPComplex.scala 375:21]
  assign io_out_s_Im = FP_multiplier_1_io_out_s; // @[FPComplex.scala 376:21]
  assign cmplx_adj_io_in_Re = io_in_a_Re; // @[FPComplex.scala 341:24]
  assign cmplx_adj_io_in_Im = io_in_a_Im; // @[FPComplex.scala 341:24]
  assign cmplx_adj_io_in_adj = 8'h0; // @[FPComplex.scala 365:30]
  assign cmplx_adj_io_is_neg = 1'h0; // @[FPComplex.scala 366:30]
  assign cmplx_adj_io_is_flip = 1'h1; // @[FPComplex.scala 342:29]
  assign FP_multiplier_clock = clock;
  assign FP_multiplier_reset = reset;
  assign FP_multiplier_io_in_a = cmplx_adj_io_out_Re; // @[FPComplex.scala 371:29]
  assign FP_multiplier_io_in_b = 32'hbf5db3d6; // @[FPComplex.scala 372:29]
  assign FP_multiplier_1_clock = clock;
  assign FP_multiplier_1_reset = reset;
  assign FP_multiplier_1_io_in_a = cmplx_adj_io_out_Im; // @[FPComplex.scala 373:29]
  assign FP_multiplier_1_io_in_b = 32'hbf5db3d6; // @[FPComplex.scala 374:29]
endmodule
module DFT_r_v2_10(
  input         clock,
  input         reset,
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  input  [31:0] io_in_2_Re,
  input  [31:0] io_in_2_Im,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im,
  output [31:0] io_out_2_Re,
  output [31:0] io_out_2_Im
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
`endif // RANDOMIZE_REG_INIT
  wire  FPComplexAdder_clock; // @[FFTDesigns.scala 258:34]
  wire  FPComplexAdder_reset; // @[FFTDesigns.scala 258:34]
  wire [31:0] FPComplexAdder_io_in_a_Re; // @[FFTDesigns.scala 258:34]
  wire [31:0] FPComplexAdder_io_in_a_Im; // @[FFTDesigns.scala 258:34]
  wire [31:0] FPComplexAdder_io_in_b_Re; // @[FFTDesigns.scala 258:34]
  wire [31:0] FPComplexAdder_io_in_b_Im; // @[FFTDesigns.scala 258:34]
  wire [31:0] FPComplexAdder_io_out_s_Re; // @[FFTDesigns.scala 258:34]
  wire [31:0] FPComplexAdder_io_out_s_Im; // @[FFTDesigns.scala 258:34]
  wire  FPComplexSub_clock; // @[FFTDesigns.scala 261:34]
  wire  FPComplexSub_reset; // @[FFTDesigns.scala 261:34]
  wire [31:0] FPComplexSub_io_in_a_Re; // @[FFTDesigns.scala 261:34]
  wire [31:0] FPComplexSub_io_in_a_Im; // @[FFTDesigns.scala 261:34]
  wire [31:0] FPComplexSub_io_in_b_Re; // @[FFTDesigns.scala 261:34]
  wire [31:0] FPComplexSub_io_in_b_Im; // @[FFTDesigns.scala 261:34]
  wire [31:0] FPComplexSub_io_out_s_Re; // @[FFTDesigns.scala 261:34]
  wire [31:0] FPComplexSub_io_out_s_Im; // @[FFTDesigns.scala 261:34]
  wire [31:0] FPComplexMultiAdder_io_in_0_Re; // @[FFTDesigns.scala 275:36]
  wire [31:0] FPComplexMultiAdder_io_in_0_Im; // @[FFTDesigns.scala 275:36]
  wire [31:0] FPComplexMultiAdder_io_out_Re; // @[FFTDesigns.scala 275:36]
  wire [31:0] FPComplexMultiAdder_io_out_Im; // @[FFTDesigns.scala 275:36]
  wire  FPComplexMult_reducable_v2_clock; // @[FFTDesigns.scala 294:39]
  wire  FPComplexMult_reducable_v2_reset; // @[FFTDesigns.scala 294:39]
  wire [31:0] FPComplexMult_reducable_v2_io_in_a_Re; // @[FFTDesigns.scala 294:39]
  wire [31:0] FPComplexMult_reducable_v2_io_in_a_Im; // @[FFTDesigns.scala 294:39]
  wire [31:0] FPComplexMult_reducable_v2_io_out_s_Re; // @[FFTDesigns.scala 294:39]
  wire [31:0] FPComplexMult_reducable_v2_io_out_s_Im; // @[FFTDesigns.scala 294:39]
  wire  FPComplexMult_reducable_v2_1_clock; // @[FFTDesigns.scala 297:39]
  wire  FPComplexMult_reducable_v2_1_reset; // @[FFTDesigns.scala 297:39]
  wire [31:0] FPComplexMult_reducable_v2_1_io_in_a_Re; // @[FFTDesigns.scala 297:39]
  wire [31:0] FPComplexMult_reducable_v2_1_io_in_a_Im; // @[FFTDesigns.scala 297:39]
  wire [31:0] FPComplexMult_reducable_v2_1_io_out_s_Re; // @[FFTDesigns.scala 297:39]
  wire [31:0] FPComplexMult_reducable_v2_1_io_out_s_Im; // @[FFTDesigns.scala 297:39]
  wire  FPComplexAdder_reducable_clock; // @[FFTDesigns.scala 338:34]
  wire  FPComplexAdder_reducable_reset; // @[FFTDesigns.scala 338:34]
  wire [31:0] FPComplexAdder_reducable_io_in_a_Re; // @[FFTDesigns.scala 338:34]
  wire [31:0] FPComplexAdder_reducable_io_in_a_Im; // @[FFTDesigns.scala 338:34]
  wire [31:0] FPComplexAdder_reducable_io_in_b_Re; // @[FFTDesigns.scala 338:34]
  wire [31:0] FPComplexAdder_reducable_io_in_b_Im; // @[FFTDesigns.scala 338:34]
  wire [31:0] FPComplexAdder_reducable_io_out_s_Re; // @[FFTDesigns.scala 338:34]
  wire [31:0] FPComplexAdder_reducable_io_out_s_Im; // @[FFTDesigns.scala 338:34]
  wire  FPComplexSub_reducable_clock; // @[FFTDesigns.scala 341:34]
  wire  FPComplexSub_reducable_reset; // @[FFTDesigns.scala 341:34]
  wire [31:0] FPComplexSub_reducable_io_in_a_Re; // @[FFTDesigns.scala 341:34]
  wire [31:0] FPComplexSub_reducable_io_in_a_Im; // @[FFTDesigns.scala 341:34]
  wire [31:0] FPComplexSub_reducable_io_in_b_Re; // @[FFTDesigns.scala 341:34]
  wire [31:0] FPComplexSub_reducable_io_in_b_Im; // @[FFTDesigns.scala 341:34]
  wire [31:0] FPComplexSub_reducable_io_out_s_Re; // @[FFTDesigns.scala 341:34]
  wire [31:0] FPComplexSub_reducable_io_out_s_Im; // @[FFTDesigns.scala 341:34]
  wire [31:0] FPComplexMultiAdder_1_io_in_0_Re; // @[FFTDesigns.scala 394:29]
  wire [31:0] FPComplexMultiAdder_1_io_in_0_Im; // @[FFTDesigns.scala 394:29]
  wire [31:0] FPComplexMultiAdder_1_io_out_Re; // @[FFTDesigns.scala 394:29]
  wire [31:0] FPComplexMultiAdder_1_io_out_Im; // @[FFTDesigns.scala 394:29]
  wire [31:0] FPComplexMultiAdder_2_io_in_0_Re; // @[FFTDesigns.scala 394:29]
  wire [31:0] FPComplexMultiAdder_2_io_in_0_Im; // @[FFTDesigns.scala 394:29]
  wire [31:0] FPComplexMultiAdder_2_io_out_Re; // @[FFTDesigns.scala 394:29]
  wire [31:0] FPComplexMultiAdder_2_io_out_Im; // @[FFTDesigns.scala 394:29]
  wire  FPComplexAdder_1_clock; // @[FFTDesigns.scala 418:27]
  wire  FPComplexAdder_1_reset; // @[FFTDesigns.scala 418:27]
  wire [31:0] FPComplexAdder_1_io_in_a_Re; // @[FFTDesigns.scala 418:27]
  wire [31:0] FPComplexAdder_1_io_in_a_Im; // @[FFTDesigns.scala 418:27]
  wire [31:0] FPComplexAdder_1_io_in_b_Re; // @[FFTDesigns.scala 418:27]
  wire [31:0] FPComplexAdder_1_io_in_b_Im; // @[FFTDesigns.scala 418:27]
  wire [31:0] FPComplexAdder_1_io_out_s_Re; // @[FFTDesigns.scala 418:27]
  wire [31:0] FPComplexAdder_1_io_out_s_Im; // @[FFTDesigns.scala 418:27]
  wire  FPComplexAdder_2_clock; // @[FFTDesigns.scala 418:27]
  wire  FPComplexAdder_2_reset; // @[FFTDesigns.scala 418:27]
  wire [31:0] FPComplexAdder_2_io_in_a_Re; // @[FFTDesigns.scala 418:27]
  wire [31:0] FPComplexAdder_2_io_in_a_Im; // @[FFTDesigns.scala 418:27]
  wire [31:0] FPComplexAdder_2_io_in_b_Re; // @[FFTDesigns.scala 418:27]
  wire [31:0] FPComplexAdder_2_io_in_b_Im; // @[FFTDesigns.scala 418:27]
  wire [31:0] FPComplexAdder_2_io_out_s_Re; // @[FFTDesigns.scala 418:27]
  wire [31:0] FPComplexAdder_2_io_out_s_Im; // @[FFTDesigns.scala 418:27]
  wire  FPComplexAdder_3_clock; // @[FFTDesigns.scala 418:27]
  wire  FPComplexAdder_3_reset; // @[FFTDesigns.scala 418:27]
  wire [31:0] FPComplexAdder_3_io_in_a_Re; // @[FFTDesigns.scala 418:27]
  wire [31:0] FPComplexAdder_3_io_in_a_Im; // @[FFTDesigns.scala 418:27]
  wire [31:0] FPComplexAdder_3_io_in_b_Re; // @[FFTDesigns.scala 418:27]
  wire [31:0] FPComplexAdder_3_io_in_b_Im; // @[FFTDesigns.scala 418:27]
  wire [31:0] FPComplexAdder_3_io_out_s_Re; // @[FFTDesigns.scala 418:27]
  wire [31:0] FPComplexAdder_3_io_out_s_Im; // @[FFTDesigns.scala 418:27]
  reg [31:0] initial_layer_out_0_0_Re; // @[FFTDesigns.scala 276:84]
  reg [31:0] initial_layer_out_0_0_Im; // @[FFTDesigns.scala 276:84]
  reg [31:0] initial_layer_out_1_0_Re; // @[FFTDesigns.scala 276:84]
  reg [31:0] initial_layer_out_1_0_Im; // @[FFTDesigns.scala 276:84]
  reg [31:0] finallayer_0_Re; // @[FFTDesigns.scala 421:31]
  reg [31:0] finallayer_0_Im; // @[FFTDesigns.scala 421:31]
  reg [31:0] finallayer_1_Re; // @[FFTDesigns.scala 421:31]
  reg [31:0] finallayer_1_Im; // @[FFTDesigns.scala 421:31]
  reg [31:0] finallayer_2_Re; // @[FFTDesigns.scala 421:31]
  reg [31:0] finallayer_2_Im; // @[FFTDesigns.scala 421:31]
  FPComplexAdder FPComplexAdder ( // @[FFTDesigns.scala 258:34]
    .clock(FPComplexAdder_clock),
    .reset(FPComplexAdder_reset),
    .io_in_a_Re(FPComplexAdder_io_in_a_Re),
    .io_in_a_Im(FPComplexAdder_io_in_a_Im),
    .io_in_b_Re(FPComplexAdder_io_in_b_Re),
    .io_in_b_Im(FPComplexAdder_io_in_b_Im),
    .io_out_s_Re(FPComplexAdder_io_out_s_Re),
    .io_out_s_Im(FPComplexAdder_io_out_s_Im)
  );
  FPComplexSub FPComplexSub ( // @[FFTDesigns.scala 261:34]
    .clock(FPComplexSub_clock),
    .reset(FPComplexSub_reset),
    .io_in_a_Re(FPComplexSub_io_in_a_Re),
    .io_in_a_Im(FPComplexSub_io_in_a_Im),
    .io_in_b_Re(FPComplexSub_io_in_b_Re),
    .io_in_b_Im(FPComplexSub_io_in_b_Im),
    .io_out_s_Re(FPComplexSub_io_out_s_Re),
    .io_out_s_Im(FPComplexSub_io_out_s_Im)
  );
  FPComplexMultiAdder_20 FPComplexMultiAdder ( // @[FFTDesigns.scala 275:36]
    .io_in_0_Re(FPComplexMultiAdder_io_in_0_Re),
    .io_in_0_Im(FPComplexMultiAdder_io_in_0_Im),
    .io_out_Re(FPComplexMultiAdder_io_out_Re),
    .io_out_Im(FPComplexMultiAdder_io_out_Im)
  );
  FPComplexMult_reducable_v2 FPComplexMult_reducable_v2 ( // @[FFTDesigns.scala 294:39]
    .clock(FPComplexMult_reducable_v2_clock),
    .reset(FPComplexMult_reducable_v2_reset),
    .io_in_a_Re(FPComplexMult_reducable_v2_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_reducable_v2_io_in_a_Im),
    .io_out_s_Re(FPComplexMult_reducable_v2_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_reducable_v2_io_out_s_Im)
  );
  FPComplexMult_reducable_v2_1 FPComplexMult_reducable_v2_1 ( // @[FFTDesigns.scala 297:39]
    .clock(FPComplexMult_reducable_v2_1_clock),
    .reset(FPComplexMult_reducable_v2_1_reset),
    .io_in_a_Re(FPComplexMult_reducable_v2_1_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_reducable_v2_1_io_in_a_Im),
    .io_out_s_Re(FPComplexMult_reducable_v2_1_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_reducable_v2_1_io_out_s_Im)
  );
  FPComplexAdder FPComplexAdder_reducable ( // @[FFTDesigns.scala 338:34]
    .clock(FPComplexAdder_reducable_clock),
    .reset(FPComplexAdder_reducable_reset),
    .io_in_a_Re(FPComplexAdder_reducable_io_in_a_Re),
    .io_in_a_Im(FPComplexAdder_reducable_io_in_a_Im),
    .io_in_b_Re(FPComplexAdder_reducable_io_in_b_Re),
    .io_in_b_Im(FPComplexAdder_reducable_io_in_b_Im),
    .io_out_s_Re(FPComplexAdder_reducable_io_out_s_Re),
    .io_out_s_Im(FPComplexAdder_reducable_io_out_s_Im)
  );
  FPComplexSub FPComplexSub_reducable ( // @[FFTDesigns.scala 341:34]
    .clock(FPComplexSub_reducable_clock),
    .reset(FPComplexSub_reducable_reset),
    .io_in_a_Re(FPComplexSub_reducable_io_in_a_Re),
    .io_in_a_Im(FPComplexSub_reducable_io_in_a_Im),
    .io_in_b_Re(FPComplexSub_reducable_io_in_b_Re),
    .io_in_b_Im(FPComplexSub_reducable_io_in_b_Im),
    .io_out_s_Re(FPComplexSub_reducable_io_out_s_Re),
    .io_out_s_Im(FPComplexSub_reducable_io_out_s_Im)
  );
  FPComplexMultiAdder_20 FPComplexMultiAdder_1 ( // @[FFTDesigns.scala 394:29]
    .io_in_0_Re(FPComplexMultiAdder_1_io_in_0_Re),
    .io_in_0_Im(FPComplexMultiAdder_1_io_in_0_Im),
    .io_out_Re(FPComplexMultiAdder_1_io_out_Re),
    .io_out_Im(FPComplexMultiAdder_1_io_out_Im)
  );
  FPComplexMultiAdder_20 FPComplexMultiAdder_2 ( // @[FFTDesigns.scala 394:29]
    .io_in_0_Re(FPComplexMultiAdder_2_io_in_0_Re),
    .io_in_0_Im(FPComplexMultiAdder_2_io_in_0_Im),
    .io_out_Re(FPComplexMultiAdder_2_io_out_Re),
    .io_out_Im(FPComplexMultiAdder_2_io_out_Im)
  );
  FPComplexAdder FPComplexAdder_1 ( // @[FFTDesigns.scala 418:27]
    .clock(FPComplexAdder_1_clock),
    .reset(FPComplexAdder_1_reset),
    .io_in_a_Re(FPComplexAdder_1_io_in_a_Re),
    .io_in_a_Im(FPComplexAdder_1_io_in_a_Im),
    .io_in_b_Re(FPComplexAdder_1_io_in_b_Re),
    .io_in_b_Im(FPComplexAdder_1_io_in_b_Im),
    .io_out_s_Re(FPComplexAdder_1_io_out_s_Re),
    .io_out_s_Im(FPComplexAdder_1_io_out_s_Im)
  );
  FPComplexAdder FPComplexAdder_2 ( // @[FFTDesigns.scala 418:27]
    .clock(FPComplexAdder_2_clock),
    .reset(FPComplexAdder_2_reset),
    .io_in_a_Re(FPComplexAdder_2_io_in_a_Re),
    .io_in_a_Im(FPComplexAdder_2_io_in_a_Im),
    .io_in_b_Re(FPComplexAdder_2_io_in_b_Re),
    .io_in_b_Im(FPComplexAdder_2_io_in_b_Im),
    .io_out_s_Re(FPComplexAdder_2_io_out_s_Re),
    .io_out_s_Im(FPComplexAdder_2_io_out_s_Im)
  );
  FPComplexAdder FPComplexAdder_3 ( // @[FFTDesigns.scala 418:27]
    .clock(FPComplexAdder_3_clock),
    .reset(FPComplexAdder_3_reset),
    .io_in_a_Re(FPComplexAdder_3_io_in_a_Re),
    .io_in_a_Im(FPComplexAdder_3_io_in_a_Im),
    .io_in_b_Re(FPComplexAdder_3_io_in_b_Re),
    .io_in_b_Im(FPComplexAdder_3_io_in_b_Im),
    .io_out_s_Re(FPComplexAdder_3_io_out_s_Re),
    .io_out_s_Im(FPComplexAdder_3_io_out_s_Im)
  );
  assign io_out_0_Re = FPComplexAdder_1_io_out_s_Re; // @[FFTDesigns.scala 432:19]
  assign io_out_0_Im = FPComplexAdder_1_io_out_s_Im; // @[FFTDesigns.scala 432:19]
  assign io_out_1_Re = FPComplexAdder_2_io_out_s_Re; // @[FFTDesigns.scala 432:19]
  assign io_out_1_Im = FPComplexAdder_2_io_out_s_Im; // @[FFTDesigns.scala 432:19]
  assign io_out_2_Re = FPComplexAdder_3_io_out_s_Re; // @[FFTDesigns.scala 432:19]
  assign io_out_2_Im = FPComplexAdder_3_io_out_s_Im; // @[FFTDesigns.scala 432:19]
  assign FPComplexAdder_clock = clock;
  assign FPComplexAdder_reset = reset;
  assign FPComplexAdder_io_in_a_Re = io_in_1_Re; // @[FFTDesigns.scala 268:38]
  assign FPComplexAdder_io_in_a_Im = io_in_1_Im; // @[FFTDesigns.scala 268:38]
  assign FPComplexAdder_io_in_b_Re = io_in_2_Re; // @[FFTDesigns.scala 269:38]
  assign FPComplexAdder_io_in_b_Im = io_in_2_Im; // @[FFTDesigns.scala 269:38]
  assign FPComplexSub_clock = clock;
  assign FPComplexSub_reset = reset;
  assign FPComplexSub_io_in_a_Re = io_in_1_Re; // @[FFTDesigns.scala 270:38]
  assign FPComplexSub_io_in_a_Im = io_in_1_Im; // @[FFTDesigns.scala 270:38]
  assign FPComplexSub_io_in_b_Re = io_in_2_Re; // @[FFTDesigns.scala 271:38]
  assign FPComplexSub_io_in_b_Im = io_in_2_Im; // @[FFTDesigns.scala 271:38]
  assign FPComplexMultiAdder_io_in_0_Re = initial_layer_out_1_0_Re; // @[FFTDesigns.scala 290:27]
  assign FPComplexMultiAdder_io_in_0_Im = initial_layer_out_1_0_Im; // @[FFTDesigns.scala 290:27]
  assign FPComplexMult_reducable_v2_clock = clock;
  assign FPComplexMult_reducable_v2_reset = reset;
  assign FPComplexMult_reducable_v2_io_in_a_Re = FPComplexAdder_io_out_s_Re; // @[FFTDesigns.scala 320:34]
  assign FPComplexMult_reducable_v2_io_in_a_Im = FPComplexAdder_io_out_s_Im; // @[FFTDesigns.scala 320:34]
  assign FPComplexMult_reducable_v2_1_clock = clock;
  assign FPComplexMult_reducable_v2_1_reset = reset;
  assign FPComplexMult_reducable_v2_1_io_in_a_Re = FPComplexSub_io_out_s_Re; // @[FFTDesigns.scala 323:34]
  assign FPComplexMult_reducable_v2_1_io_in_a_Im = FPComplexSub_io_out_s_Im; // @[FFTDesigns.scala 323:34]
  assign FPComplexAdder_reducable_clock = clock;
  assign FPComplexAdder_reducable_reset = reset;
  assign FPComplexAdder_reducable_io_in_a_Re = FPComplexMult_reducable_v2_io_out_s_Re; // @[FFTDesigns.scala 366:36]
  assign FPComplexAdder_reducable_io_in_a_Im = FPComplexMult_reducable_v2_io_out_s_Im; // @[FFTDesigns.scala 366:36]
  assign FPComplexAdder_reducable_io_in_b_Re = FPComplexMult_reducable_v2_1_io_out_s_Re; // @[FFTDesigns.scala 367:36]
  assign FPComplexAdder_reducable_io_in_b_Im = FPComplexMult_reducable_v2_1_io_out_s_Im; // @[FFTDesigns.scala 367:36]
  assign FPComplexSub_reducable_clock = clock;
  assign FPComplexSub_reducable_reset = reset;
  assign FPComplexSub_reducable_io_in_a_Re = FPComplexMult_reducable_v2_io_out_s_Re; // @[FFTDesigns.scala 368:36]
  assign FPComplexSub_reducable_io_in_a_Im = FPComplexMult_reducable_v2_io_out_s_Im; // @[FFTDesigns.scala 368:36]
  assign FPComplexSub_reducable_io_in_b_Re = FPComplexMult_reducable_v2_1_io_out_s_Re; // @[FFTDesigns.scala 369:36]
  assign FPComplexSub_reducable_io_in_b_Im = FPComplexMult_reducable_v2_1_io_out_s_Im; // @[FFTDesigns.scala 369:36]
  assign FPComplexMultiAdder_1_io_in_0_Re = FPComplexAdder_reducable_io_out_s_Re; // @[FFTDesigns.scala 402:36]
  assign FPComplexMultiAdder_1_io_in_0_Im = FPComplexAdder_reducable_io_out_s_Im; // @[FFTDesigns.scala 402:36]
  assign FPComplexMultiAdder_2_io_in_0_Re = FPComplexSub_reducable_io_out_s_Re; // @[FFTDesigns.scala 404:61]
  assign FPComplexMultiAdder_2_io_in_0_Im = FPComplexSub_reducable_io_out_s_Im; // @[FFTDesigns.scala 404:61]
  assign FPComplexAdder_1_clock = clock;
  assign FPComplexAdder_1_reset = reset;
  assign FPComplexAdder_1_io_in_a_Re = finallayer_2_Re; // @[FFTDesigns.scala 430:35]
  assign FPComplexAdder_1_io_in_a_Im = finallayer_2_Im; // @[FFTDesigns.scala 430:35]
  assign FPComplexAdder_1_io_in_b_Re = FPComplexMultiAdder_io_out_Re; // @[FFTDesigns.scala 431:35]
  assign FPComplexAdder_1_io_in_b_Im = FPComplexMultiAdder_io_out_Im; // @[FFTDesigns.scala 431:35]
  assign FPComplexAdder_2_clock = clock;
  assign FPComplexAdder_2_reset = reset;
  assign FPComplexAdder_2_io_in_a_Re = finallayer_2_Re; // @[FFTDesigns.scala 430:35]
  assign FPComplexAdder_2_io_in_a_Im = finallayer_2_Im; // @[FFTDesigns.scala 430:35]
  assign FPComplexAdder_2_io_in_b_Re = FPComplexMultiAdder_1_io_out_Re; // @[FFTDesigns.scala 431:35]
  assign FPComplexAdder_2_io_in_b_Im = FPComplexMultiAdder_1_io_out_Im; // @[FFTDesigns.scala 431:35]
  assign FPComplexAdder_3_clock = clock;
  assign FPComplexAdder_3_reset = reset;
  assign FPComplexAdder_3_io_in_a_Re = finallayer_2_Re; // @[FFTDesigns.scala 430:35]
  assign FPComplexAdder_3_io_in_a_Im = finallayer_2_Im; // @[FFTDesigns.scala 430:35]
  assign FPComplexAdder_3_io_in_b_Re = FPComplexMultiAdder_2_io_out_Re; // @[FFTDesigns.scala 431:35]
  assign FPComplexAdder_3_io_in_b_Im = FPComplexMultiAdder_2_io_out_Im; // @[FFTDesigns.scala 431:35]
  always @(posedge clock) begin
    if (reset) begin // @[FFTDesigns.scala 276:84]
      initial_layer_out_0_0_Re <= 32'h0; // @[FFTDesigns.scala 276:84]
    end else begin
      initial_layer_out_0_0_Re <= FPComplexAdder_io_out_s_Re; // @[FFTDesigns.scala 281:37]
    end
    if (reset) begin // @[FFTDesigns.scala 276:84]
      initial_layer_out_0_0_Im <= 32'h0; // @[FFTDesigns.scala 276:84]
    end else begin
      initial_layer_out_0_0_Im <= FPComplexAdder_io_out_s_Im; // @[FFTDesigns.scala 281:37]
    end
    if (reset) begin // @[FFTDesigns.scala 276:84]
      initial_layer_out_1_0_Re <= 32'h0; // @[FFTDesigns.scala 276:84]
    end else begin
      initial_layer_out_1_0_Re <= initial_layer_out_0_0_Re; // @[FFTDesigns.scala 284:32]
    end
    if (reset) begin // @[FFTDesigns.scala 276:84]
      initial_layer_out_1_0_Im <= 32'h0; // @[FFTDesigns.scala 276:84]
    end else begin
      initial_layer_out_1_0_Im <= initial_layer_out_0_0_Im; // @[FFTDesigns.scala 284:32]
    end
    if (reset) begin // @[FFTDesigns.scala 421:31]
      finallayer_0_Re <= 32'h0; // @[FFTDesigns.scala 421:31]
    end else begin
      finallayer_0_Re <= io_in_0_Re; // @[FFTDesigns.scala 424:25]
    end
    if (reset) begin // @[FFTDesigns.scala 421:31]
      finallayer_0_Im <= 32'h0; // @[FFTDesigns.scala 421:31]
    end else begin
      finallayer_0_Im <= io_in_0_Im; // @[FFTDesigns.scala 424:25]
    end
    if (reset) begin // @[FFTDesigns.scala 421:31]
      finallayer_1_Re <= 32'h0; // @[FFTDesigns.scala 421:31]
    end else begin
      finallayer_1_Re <= finallayer_0_Re; // @[FFTDesigns.scala 426:25]
    end
    if (reset) begin // @[FFTDesigns.scala 421:31]
      finallayer_1_Im <= 32'h0; // @[FFTDesigns.scala 421:31]
    end else begin
      finallayer_1_Im <= finallayer_0_Im; // @[FFTDesigns.scala 426:25]
    end
    if (reset) begin // @[FFTDesigns.scala 421:31]
      finallayer_2_Re <= 32'h0; // @[FFTDesigns.scala 421:31]
    end else begin
      finallayer_2_Re <= finallayer_1_Re; // @[FFTDesigns.scala 426:25]
    end
    if (reset) begin // @[FFTDesigns.scala 421:31]
      finallayer_2_Im <= 32'h0; // @[FFTDesigns.scala 421:31]
    end else begin
      finallayer_2_Im <= finallayer_1_Im; // @[FFTDesigns.scala 426:25]
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
  initial_layer_out_0_0_Re = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  initial_layer_out_0_0_Im = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  initial_layer_out_1_0_Re = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  initial_layer_out_1_0_Im = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  finallayer_0_Re = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  finallayer_0_Im = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  finallayer_1_Re = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  finallayer_1_Im = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  finallayer_2_Re = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  finallayer_2_Im = _RAND_9[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RAM_Block_48(
  input         clock,
  input  [5:0]  io_in_raddr,
  input  [5:0]  io_in_waddr,
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
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem_0_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_0_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_1_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_1_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_2_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_2_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_3_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_3_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_4_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_4_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_5_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_5_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_6_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_6_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_7_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_7_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_8_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_8_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_9_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_9_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_10_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_10_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_11_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_11_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_12_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_12_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_13_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_13_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_14_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_14_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_15_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_15_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_16_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_16_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_17_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_17_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_18_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_18_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_19_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_19_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_20_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_20_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_21_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_21_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_22_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_22_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_23_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_23_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_24_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_24_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_25_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_25_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_26_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_26_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_27_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_27_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_28_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_28_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_29_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_29_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_30_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_30_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_31_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_31_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_32_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_32_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_33_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_33_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_34_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_34_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_35_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_35_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_36_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_36_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_37_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_37_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_38_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_38_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_39_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_39_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_40_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_40_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_41_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_41_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_42_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_42_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_43_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_43_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_44_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_44_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_45_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_45_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_46_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_46_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_47_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_47_Im; // @[FFTDesigns.scala 3286:18]
  wire [31:0] _GEN_193 = 6'h1 == io_in_raddr ? mem_1_Im : mem_0_Im; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_194 = 6'h2 == io_in_raddr ? mem_2_Im : _GEN_193; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_195 = 6'h3 == io_in_raddr ? mem_3_Im : _GEN_194; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_196 = 6'h4 == io_in_raddr ? mem_4_Im : _GEN_195; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_197 = 6'h5 == io_in_raddr ? mem_5_Im : _GEN_196; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_198 = 6'h6 == io_in_raddr ? mem_6_Im : _GEN_197; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_199 = 6'h7 == io_in_raddr ? mem_7_Im : _GEN_198; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_200 = 6'h8 == io_in_raddr ? mem_8_Im : _GEN_199; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_201 = 6'h9 == io_in_raddr ? mem_9_Im : _GEN_200; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_202 = 6'ha == io_in_raddr ? mem_10_Im : _GEN_201; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_203 = 6'hb == io_in_raddr ? mem_11_Im : _GEN_202; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_204 = 6'hc == io_in_raddr ? mem_12_Im : _GEN_203; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_205 = 6'hd == io_in_raddr ? mem_13_Im : _GEN_204; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_206 = 6'he == io_in_raddr ? mem_14_Im : _GEN_205; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_207 = 6'hf == io_in_raddr ? mem_15_Im : _GEN_206; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_208 = 6'h10 == io_in_raddr ? mem_16_Im : _GEN_207; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_209 = 6'h11 == io_in_raddr ? mem_17_Im : _GEN_208; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_210 = 6'h12 == io_in_raddr ? mem_18_Im : _GEN_209; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_211 = 6'h13 == io_in_raddr ? mem_19_Im : _GEN_210; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_212 = 6'h14 == io_in_raddr ? mem_20_Im : _GEN_211; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_213 = 6'h15 == io_in_raddr ? mem_21_Im : _GEN_212; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_214 = 6'h16 == io_in_raddr ? mem_22_Im : _GEN_213; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_215 = 6'h17 == io_in_raddr ? mem_23_Im : _GEN_214; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_216 = 6'h18 == io_in_raddr ? mem_24_Im : _GEN_215; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_217 = 6'h19 == io_in_raddr ? mem_25_Im : _GEN_216; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_218 = 6'h1a == io_in_raddr ? mem_26_Im : _GEN_217; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_219 = 6'h1b == io_in_raddr ? mem_27_Im : _GEN_218; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_220 = 6'h1c == io_in_raddr ? mem_28_Im : _GEN_219; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_221 = 6'h1d == io_in_raddr ? mem_29_Im : _GEN_220; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_222 = 6'h1e == io_in_raddr ? mem_30_Im : _GEN_221; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_223 = 6'h1f == io_in_raddr ? mem_31_Im : _GEN_222; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_224 = 6'h20 == io_in_raddr ? mem_32_Im : _GEN_223; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_225 = 6'h21 == io_in_raddr ? mem_33_Im : _GEN_224; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_226 = 6'h22 == io_in_raddr ? mem_34_Im : _GEN_225; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_227 = 6'h23 == io_in_raddr ? mem_35_Im : _GEN_226; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_228 = 6'h24 == io_in_raddr ? mem_36_Im : _GEN_227; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_229 = 6'h25 == io_in_raddr ? mem_37_Im : _GEN_228; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_230 = 6'h26 == io_in_raddr ? mem_38_Im : _GEN_229; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_231 = 6'h27 == io_in_raddr ? mem_39_Im : _GEN_230; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_232 = 6'h28 == io_in_raddr ? mem_40_Im : _GEN_231; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_233 = 6'h29 == io_in_raddr ? mem_41_Im : _GEN_232; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_234 = 6'h2a == io_in_raddr ? mem_42_Im : _GEN_233; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_235 = 6'h2b == io_in_raddr ? mem_43_Im : _GEN_234; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_236 = 6'h2c == io_in_raddr ? mem_44_Im : _GEN_235; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_237 = 6'h2d == io_in_raddr ? mem_45_Im : _GEN_236; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_238 = 6'h2e == io_in_raddr ? mem_46_Im : _GEN_237; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_239 = 6'h2f == io_in_raddr ? mem_47_Im : _GEN_238; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_241 = 6'h1 == io_in_raddr ? mem_1_Re : mem_0_Re; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_242 = 6'h2 == io_in_raddr ? mem_2_Re : _GEN_241; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_243 = 6'h3 == io_in_raddr ? mem_3_Re : _GEN_242; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_244 = 6'h4 == io_in_raddr ? mem_4_Re : _GEN_243; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_245 = 6'h5 == io_in_raddr ? mem_5_Re : _GEN_244; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_246 = 6'h6 == io_in_raddr ? mem_6_Re : _GEN_245; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_247 = 6'h7 == io_in_raddr ? mem_7_Re : _GEN_246; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_248 = 6'h8 == io_in_raddr ? mem_8_Re : _GEN_247; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_249 = 6'h9 == io_in_raddr ? mem_9_Re : _GEN_248; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_250 = 6'ha == io_in_raddr ? mem_10_Re : _GEN_249; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_251 = 6'hb == io_in_raddr ? mem_11_Re : _GEN_250; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_252 = 6'hc == io_in_raddr ? mem_12_Re : _GEN_251; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_253 = 6'hd == io_in_raddr ? mem_13_Re : _GEN_252; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_254 = 6'he == io_in_raddr ? mem_14_Re : _GEN_253; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_255 = 6'hf == io_in_raddr ? mem_15_Re : _GEN_254; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_256 = 6'h10 == io_in_raddr ? mem_16_Re : _GEN_255; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_257 = 6'h11 == io_in_raddr ? mem_17_Re : _GEN_256; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_258 = 6'h12 == io_in_raddr ? mem_18_Re : _GEN_257; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_259 = 6'h13 == io_in_raddr ? mem_19_Re : _GEN_258; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_260 = 6'h14 == io_in_raddr ? mem_20_Re : _GEN_259; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_261 = 6'h15 == io_in_raddr ? mem_21_Re : _GEN_260; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_262 = 6'h16 == io_in_raddr ? mem_22_Re : _GEN_261; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_263 = 6'h17 == io_in_raddr ? mem_23_Re : _GEN_262; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_264 = 6'h18 == io_in_raddr ? mem_24_Re : _GEN_263; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_265 = 6'h19 == io_in_raddr ? mem_25_Re : _GEN_264; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_266 = 6'h1a == io_in_raddr ? mem_26_Re : _GEN_265; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_267 = 6'h1b == io_in_raddr ? mem_27_Re : _GEN_266; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_268 = 6'h1c == io_in_raddr ? mem_28_Re : _GEN_267; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_269 = 6'h1d == io_in_raddr ? mem_29_Re : _GEN_268; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_270 = 6'h1e == io_in_raddr ? mem_30_Re : _GEN_269; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_271 = 6'h1f == io_in_raddr ? mem_31_Re : _GEN_270; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_272 = 6'h20 == io_in_raddr ? mem_32_Re : _GEN_271; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_273 = 6'h21 == io_in_raddr ? mem_33_Re : _GEN_272; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_274 = 6'h22 == io_in_raddr ? mem_34_Re : _GEN_273; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_275 = 6'h23 == io_in_raddr ? mem_35_Re : _GEN_274; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_276 = 6'h24 == io_in_raddr ? mem_36_Re : _GEN_275; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_277 = 6'h25 == io_in_raddr ? mem_37_Re : _GEN_276; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_278 = 6'h26 == io_in_raddr ? mem_38_Re : _GEN_277; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_279 = 6'h27 == io_in_raddr ? mem_39_Re : _GEN_278; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_280 = 6'h28 == io_in_raddr ? mem_40_Re : _GEN_279; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_281 = 6'h29 == io_in_raddr ? mem_41_Re : _GEN_280; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_282 = 6'h2a == io_in_raddr ? mem_42_Re : _GEN_281; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_283 = 6'h2b == io_in_raddr ? mem_43_Re : _GEN_282; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_284 = 6'h2c == io_in_raddr ? mem_44_Re : _GEN_283; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_285 = 6'h2d == io_in_raddr ? mem_45_Re : _GEN_284; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_286 = 6'h2e == io_in_raddr ? mem_46_Re : _GEN_285; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_287 = 6'h2f == io_in_raddr ? mem_47_Re : _GEN_286; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_288 = io_re ? _GEN_239 : 32'h0; // @[FFTDesigns.scala 3291:18 3292:21 3295:24]
  wire [31:0] _GEN_289 = io_re ? _GEN_287 : 32'h0; // @[FFTDesigns.scala 3291:18 3292:21 3294:24]
  assign io_out_data_Re = io_en ? _GEN_289 : 32'h0; // @[FFTDesigns.scala 3287:16 3298:22]
  assign io_out_data_Im = io_en ? _GEN_288 : 32'h0; // @[FFTDesigns.scala 3287:16 3299:22]
  always @(posedge clock) begin
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h0 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_0_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h0 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_0_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h1 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_1_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h1 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_1_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h2 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_2_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h2 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_2_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h3 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_3_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h3 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_3_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h4 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_4_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h4 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_4_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h5 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_5_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h5 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_5_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h6 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_6_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h6 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_6_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h7 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_7_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h7 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_7_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h8 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_8_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h8 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_8_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h9 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_9_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h9 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_9_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'ha == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_10_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'ha == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_10_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'hb == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_11_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'hb == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_11_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'hc == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_12_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'hc == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_12_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'hd == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_13_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'hd == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_13_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'he == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_14_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'he == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_14_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'hf == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_15_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'hf == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_15_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h10 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_16_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h10 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_16_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h11 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_17_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h11 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_17_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h12 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_18_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h12 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_18_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h13 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_19_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h13 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_19_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h14 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_20_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h14 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_20_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h15 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_21_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h15 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_21_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h16 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_22_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h16 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_22_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h17 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_23_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h17 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_23_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h18 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_24_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h18 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_24_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h19 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_25_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h19 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_25_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h1a == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_26_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h1a == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_26_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h1b == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_27_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h1b == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_27_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h1c == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_28_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h1c == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_28_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h1d == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_29_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h1d == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_29_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h1e == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_30_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h1e == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_30_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h1f == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_31_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h1f == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_31_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h20 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_32_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h20 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_32_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h21 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_33_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h21 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_33_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h22 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_34_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h22 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_34_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h23 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_35_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h23 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_35_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h24 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_36_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h24 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_36_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h25 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_37_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h25 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_37_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h26 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_38_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h26 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_38_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h27 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_39_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h27 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_39_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h28 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_40_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h28 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_40_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h29 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_41_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h29 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_41_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h2a == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_42_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h2a == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_42_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h2b == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_43_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h2b == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_43_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h2c == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_44_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h2c == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_44_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h2d == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_45_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h2d == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_45_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h2e == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_46_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h2e == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_46_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h2f == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_47_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (6'h2f == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_47_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
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
  _RAND_8 = {1{`RANDOM}};
  mem_4_Re = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  mem_4_Im = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  mem_5_Re = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  mem_5_Im = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  mem_6_Re = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  mem_6_Im = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  mem_7_Re = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  mem_7_Im = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  mem_8_Re = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  mem_8_Im = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  mem_9_Re = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  mem_9_Im = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  mem_10_Re = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  mem_10_Im = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  mem_11_Re = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  mem_11_Im = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  mem_12_Re = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  mem_12_Im = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  mem_13_Re = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  mem_13_Im = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  mem_14_Re = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  mem_14_Im = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  mem_15_Re = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  mem_15_Im = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  mem_16_Re = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  mem_16_Im = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  mem_17_Re = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  mem_17_Im = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  mem_18_Re = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  mem_18_Im = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  mem_19_Re = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  mem_19_Im = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  mem_20_Re = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  mem_20_Im = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  mem_21_Re = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  mem_21_Im = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  mem_22_Re = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  mem_22_Im = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  mem_23_Re = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  mem_23_Im = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  mem_24_Re = _RAND_48[31:0];
  _RAND_49 = {1{`RANDOM}};
  mem_24_Im = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  mem_25_Re = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  mem_25_Im = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  mem_26_Re = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  mem_26_Im = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  mem_27_Re = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  mem_27_Im = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  mem_28_Re = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  mem_28_Im = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  mem_29_Re = _RAND_58[31:0];
  _RAND_59 = {1{`RANDOM}};
  mem_29_Im = _RAND_59[31:0];
  _RAND_60 = {1{`RANDOM}};
  mem_30_Re = _RAND_60[31:0];
  _RAND_61 = {1{`RANDOM}};
  mem_30_Im = _RAND_61[31:0];
  _RAND_62 = {1{`RANDOM}};
  mem_31_Re = _RAND_62[31:0];
  _RAND_63 = {1{`RANDOM}};
  mem_31_Im = _RAND_63[31:0];
  _RAND_64 = {1{`RANDOM}};
  mem_32_Re = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  mem_32_Im = _RAND_65[31:0];
  _RAND_66 = {1{`RANDOM}};
  mem_33_Re = _RAND_66[31:0];
  _RAND_67 = {1{`RANDOM}};
  mem_33_Im = _RAND_67[31:0];
  _RAND_68 = {1{`RANDOM}};
  mem_34_Re = _RAND_68[31:0];
  _RAND_69 = {1{`RANDOM}};
  mem_34_Im = _RAND_69[31:0];
  _RAND_70 = {1{`RANDOM}};
  mem_35_Re = _RAND_70[31:0];
  _RAND_71 = {1{`RANDOM}};
  mem_35_Im = _RAND_71[31:0];
  _RAND_72 = {1{`RANDOM}};
  mem_36_Re = _RAND_72[31:0];
  _RAND_73 = {1{`RANDOM}};
  mem_36_Im = _RAND_73[31:0];
  _RAND_74 = {1{`RANDOM}};
  mem_37_Re = _RAND_74[31:0];
  _RAND_75 = {1{`RANDOM}};
  mem_37_Im = _RAND_75[31:0];
  _RAND_76 = {1{`RANDOM}};
  mem_38_Re = _RAND_76[31:0];
  _RAND_77 = {1{`RANDOM}};
  mem_38_Im = _RAND_77[31:0];
  _RAND_78 = {1{`RANDOM}};
  mem_39_Re = _RAND_78[31:0];
  _RAND_79 = {1{`RANDOM}};
  mem_39_Im = _RAND_79[31:0];
  _RAND_80 = {1{`RANDOM}};
  mem_40_Re = _RAND_80[31:0];
  _RAND_81 = {1{`RANDOM}};
  mem_40_Im = _RAND_81[31:0];
  _RAND_82 = {1{`RANDOM}};
  mem_41_Re = _RAND_82[31:0];
  _RAND_83 = {1{`RANDOM}};
  mem_41_Im = _RAND_83[31:0];
  _RAND_84 = {1{`RANDOM}};
  mem_42_Re = _RAND_84[31:0];
  _RAND_85 = {1{`RANDOM}};
  mem_42_Im = _RAND_85[31:0];
  _RAND_86 = {1{`RANDOM}};
  mem_43_Re = _RAND_86[31:0];
  _RAND_87 = {1{`RANDOM}};
  mem_43_Im = _RAND_87[31:0];
  _RAND_88 = {1{`RANDOM}};
  mem_44_Re = _RAND_88[31:0];
  _RAND_89 = {1{`RANDOM}};
  mem_44_Im = _RAND_89[31:0];
  _RAND_90 = {1{`RANDOM}};
  mem_45_Re = _RAND_90[31:0];
  _RAND_91 = {1{`RANDOM}};
  mem_45_Im = _RAND_91[31:0];
  _RAND_92 = {1{`RANDOM}};
  mem_46_Re = _RAND_92[31:0];
  _RAND_93 = {1{`RANDOM}};
  mem_46_Im = _RAND_93[31:0];
  _RAND_94 = {1{`RANDOM}};
  mem_47_Re = _RAND_94[31:0];
  _RAND_95 = {1{`RANDOM}};
  mem_47_Im = _RAND_95[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module M0_Config_ROM_6(
  input  [4:0] io_in_cnt,
  output [5:0] io_out_0,
  output [5:0] io_out_1,
  output [5:0] io_out_2,
  output [5:0] io_out_3
);
  wire [5:0] _GEN_1 = 5'h1 == io_in_cnt ? 6'h1 : 6'h0; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_2 = 5'h2 == io_in_cnt ? 6'h2 : _GEN_1; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_3 = 5'h3 == io_in_cnt ? 6'h3 : _GEN_2; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_4 = 5'h4 == io_in_cnt ? 6'h4 : _GEN_3; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_5 = 5'h5 == io_in_cnt ? 6'h5 : _GEN_4; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_6 = 5'h6 == io_in_cnt ? 6'h6 : _GEN_5; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_7 = 5'h7 == io_in_cnt ? 6'h7 : _GEN_6; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_8 = 5'h8 == io_in_cnt ? 6'h8 : _GEN_7; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_9 = 5'h9 == io_in_cnt ? 6'h9 : _GEN_8; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_10 = 5'ha == io_in_cnt ? 6'ha : _GEN_9; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_11 = 5'hb == io_in_cnt ? 6'hb : _GEN_10; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_12 = 5'hc == io_in_cnt ? 6'hc : _GEN_11; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_13 = 5'hd == io_in_cnt ? 6'hf : _GEN_12; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_14 = 5'he == io_in_cnt ? 6'h10 : _GEN_13; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_15 = 5'hf == io_in_cnt ? 6'h11 : _GEN_14; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_16 = 5'h10 == io_in_cnt ? 6'h12 : _GEN_15; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_17 = 5'h11 == io_in_cnt ? 6'h13 : _GEN_16; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_18 = 5'h12 == io_in_cnt ? 6'h14 : _GEN_17; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_19 = 5'h13 == io_in_cnt ? 6'h15 : _GEN_18; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_20 = 5'h14 == io_in_cnt ? 6'h16 : _GEN_19; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_21 = 5'h15 == io_in_cnt ? 6'h17 : _GEN_20; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_22 = 5'h16 == io_in_cnt ? 6'he : _GEN_21; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_25 = 5'h1 == io_in_cnt ? 6'h2 : 6'h1; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_26 = 5'h2 == io_in_cnt ? 6'h3 : _GEN_25; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_27 = 5'h3 == io_in_cnt ? 6'h4 : _GEN_26; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_28 = 5'h4 == io_in_cnt ? 6'h5 : _GEN_27; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_29 = 5'h5 == io_in_cnt ? 6'h6 : _GEN_28; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_30 = 5'h6 == io_in_cnt ? 6'h7 : _GEN_29; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_31 = 5'h7 == io_in_cnt ? 6'h8 : _GEN_30; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_32 = 5'h8 == io_in_cnt ? 6'h9 : _GEN_31; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_33 = 5'h9 == io_in_cnt ? 6'ha : _GEN_32; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_34 = 5'ha == io_in_cnt ? 6'hb : _GEN_33; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_35 = 5'hb == io_in_cnt ? 6'hc : _GEN_34; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_36 = 5'hc == io_in_cnt ? 6'hd : _GEN_35; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_37 = 5'hd == io_in_cnt ? 6'he : _GEN_36; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_38 = 5'he == io_in_cnt ? 6'hf : _GEN_37; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_39 = 5'hf == io_in_cnt ? 6'h10 : _GEN_38; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_40 = 5'h10 == io_in_cnt ? 6'h11 : _GEN_39; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_41 = 5'h11 == io_in_cnt ? 6'h12 : _GEN_40; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_42 = 5'h12 == io_in_cnt ? 6'h13 : _GEN_41; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_43 = 5'h13 == io_in_cnt ? 6'h14 : _GEN_42; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_44 = 5'h14 == io_in_cnt ? 6'h15 : _GEN_43; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_45 = 5'h15 == io_in_cnt ? 6'h16 : _GEN_44; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_46 = 5'h16 == io_in_cnt ? 6'h17 : _GEN_45; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_49 = 5'h1 == io_in_cnt ? 6'h3 : 6'h1; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_50 = 5'h2 == io_in_cnt ? 6'h5 : _GEN_49; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_51 = 5'h3 == io_in_cnt ? 6'h7 : _GEN_50; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_52 = 5'h4 == io_in_cnt ? 6'h9 : _GEN_51; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_53 = 5'h5 == io_in_cnt ? 6'hb : _GEN_52; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_54 = 5'h6 == io_in_cnt ? 6'hd : _GEN_53; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_55 = 5'h7 == io_in_cnt ? 6'hf : _GEN_54; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_56 = 5'h8 == io_in_cnt ? 6'h11 : _GEN_55; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_57 = 5'h9 == io_in_cnt ? 6'h13 : _GEN_56; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_58 = 5'ha == io_in_cnt ? 6'h15 : _GEN_57; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_59 = 5'hb == io_in_cnt ? 6'h17 : _GEN_58; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_60 = 5'hc == io_in_cnt ? 6'h2 : _GEN_59; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_61 = 5'hd == io_in_cnt ? 6'h4 : _GEN_60; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_62 = 5'he == io_in_cnt ? 6'h8 : _GEN_61; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_63 = 5'hf == io_in_cnt ? 6'hc : _GEN_62; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_64 = 5'h10 == io_in_cnt ? 6'h10 : _GEN_63; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_65 = 5'h11 == io_in_cnt ? 6'h14 : _GEN_64; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_66 = 5'h12 == io_in_cnt ? 6'h0 : _GEN_65; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_67 = 5'h13 == io_in_cnt ? 6'ha : _GEN_66; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_68 = 5'h14 == io_in_cnt ? 6'he : _GEN_67; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_69 = 5'h15 == io_in_cnt ? 6'h12 : _GEN_68; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_70 = 5'h16 == io_in_cnt ? 6'h6 : _GEN_69; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_73 = 5'h1 == io_in_cnt ? 6'h4 : 6'h2; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_74 = 5'h2 == io_in_cnt ? 6'h6 : _GEN_73; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_75 = 5'h3 == io_in_cnt ? 6'h8 : _GEN_74; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_76 = 5'h4 == io_in_cnt ? 6'ha : _GEN_75; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_77 = 5'h5 == io_in_cnt ? 6'hc : _GEN_76; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_78 = 5'h6 == io_in_cnt ? 6'he : _GEN_77; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_79 = 5'h7 == io_in_cnt ? 6'h10 : _GEN_78; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_80 = 5'h8 == io_in_cnt ? 6'h12 : _GEN_79; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_81 = 5'h9 == io_in_cnt ? 6'h14 : _GEN_80; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_82 = 5'ha == io_in_cnt ? 6'h16 : _GEN_81; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_83 = 5'hb == io_in_cnt ? 6'h0 : _GEN_82; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_84 = 5'hc == io_in_cnt ? 6'h1 : _GEN_83; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_85 = 5'hd == io_in_cnt ? 6'h3 : _GEN_84; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_86 = 5'he == io_in_cnt ? 6'h7 : _GEN_85; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_87 = 5'hf == io_in_cnt ? 6'hb : _GEN_86; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_88 = 5'h10 == io_in_cnt ? 6'hf : _GEN_87; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_89 = 5'h11 == io_in_cnt ? 6'h13 : _GEN_88; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_90 = 5'h12 == io_in_cnt ? 6'h17 : _GEN_89; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_91 = 5'h13 == io_in_cnt ? 6'h9 : _GEN_90; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_92 = 5'h14 == io_in_cnt ? 6'hd : _GEN_91; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_93 = 5'h15 == io_in_cnt ? 6'h11 : _GEN_92; // @[FFTDesigns.scala 3227:{17,17}]
  wire [5:0] _GEN_94 = 5'h16 == io_in_cnt ? 6'h15 : _GEN_93; // @[FFTDesigns.scala 3227:{17,17}]
  assign io_out_0 = 5'h17 == io_in_cnt ? 6'hd : _GEN_22; // @[FFTDesigns.scala 3227:{17,17}]
  assign io_out_1 = 5'h17 == io_in_cnt ? 6'h0 : _GEN_46; // @[FFTDesigns.scala 3227:{17,17}]
  assign io_out_2 = 5'h17 == io_in_cnt ? 6'h16 : _GEN_70; // @[FFTDesigns.scala 3227:{17,17}]
  assign io_out_3 = 5'h17 == io_in_cnt ? 6'h5 : _GEN_94; // @[FFTDesigns.scala 3227:{17,17}]
endmodule
module M1_Config_ROM_6(
  input  [4:0] io_in_cnt,
  output [5:0] io_out_0,
  output [5:0] io_out_1,
  output [5:0] io_out_2,
  output [5:0] io_out_3
);
  wire [5:0] _GEN_1 = 5'h1 == io_in_cnt ? 6'h11 : 6'h0; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_2 = 5'h2 == io_in_cnt ? 6'h9 : _GEN_1; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_3 = 5'h3 == io_in_cnt ? 6'h1 : _GEN_2; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_4 = 5'h4 == io_in_cnt ? 6'h13 : _GEN_3; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_5 = 5'h5 == io_in_cnt ? 6'ha : _GEN_4; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_6 = 5'h6 == io_in_cnt ? 6'h2 : _GEN_5; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_7 = 5'h7 == io_in_cnt ? 6'h15 : _GEN_6; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_8 = 5'h8 == io_in_cnt ? 6'hb : _GEN_7; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_9 = 5'h9 == io_in_cnt ? 6'h3 : _GEN_8; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_10 = 5'ha == io_in_cnt ? 6'h17 : _GEN_9; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_11 = 5'hb == io_in_cnt ? 6'hc : _GEN_10; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_12 = 5'hc == io_in_cnt ? 6'h4 : _GEN_11; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_13 = 5'hd == io_in_cnt ? 6'h5 : _GEN_12; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_14 = 5'he == io_in_cnt ? 6'hd : _GEN_13; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_15 = 5'hf == io_in_cnt ? 6'h14 : _GEN_14; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_16 = 5'h10 == io_in_cnt ? 6'h6 : _GEN_15; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_17 = 5'h11 == io_in_cnt ? 6'he : _GEN_16; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_18 = 5'h12 == io_in_cnt ? 6'h10 : _GEN_17; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_19 = 5'h13 == io_in_cnt ? 6'h7 : _GEN_18; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_20 = 5'h14 == io_in_cnt ? 6'hf : _GEN_19; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_21 = 5'h15 == io_in_cnt ? 6'h16 : _GEN_20; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_22 = 5'h16 == io_in_cnt ? 6'h12 : _GEN_21; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_25 = 5'h1 == io_in_cnt ? 6'h8 : 6'h10; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_26 = 5'h2 == io_in_cnt ? 6'h2 : _GEN_25; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_27 = 5'h3 == io_in_cnt ? 6'h11 : _GEN_26; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_28 = 5'h4 == io_in_cnt ? 6'h9 : _GEN_27; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_29 = 5'h5 == io_in_cnt ? 6'h4 : _GEN_28; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_30 = 5'h6 == io_in_cnt ? 6'h12 : _GEN_29; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_31 = 5'h7 == io_in_cnt ? 6'ha : _GEN_30; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_32 = 5'h8 == io_in_cnt ? 6'h6 : _GEN_31; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_33 = 5'h9 == io_in_cnt ? 6'h13 : _GEN_32; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_34 = 5'ha == io_in_cnt ? 6'hb : _GEN_33; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_35 = 5'hb == io_in_cnt ? 6'h0 : _GEN_34; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_36 = 5'hc == io_in_cnt ? 6'h14 : _GEN_35; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_37 = 5'hd == io_in_cnt ? 6'h1 : _GEN_36; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_38 = 5'he == io_in_cnt ? 6'hd : _GEN_37; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_39 = 5'hf == io_in_cnt ? 6'h15 : _GEN_38; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_40 = 5'h10 == io_in_cnt ? 6'h5 : _GEN_39; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_41 = 5'h11 == io_in_cnt ? 6'he : _GEN_40; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_42 = 5'h12 == io_in_cnt ? 6'h16 : _GEN_41; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_43 = 5'h13 == io_in_cnt ? 6'h3 : _GEN_42; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_44 = 5'h14 == io_in_cnt ? 6'hf : _GEN_43; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_45 = 5'h15 == io_in_cnt ? 6'h17 : _GEN_44; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_46 = 5'h16 == io_in_cnt ? 6'h7 : _GEN_45; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_49 = 5'h1 == io_in_cnt ? 6'h9 : 6'h0; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_50 = 5'h2 == io_in_cnt ? 6'h10 : _GEN_49; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_51 = 5'h3 == io_in_cnt ? 6'h2 : _GEN_50; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_52 = 5'h4 == io_in_cnt ? 6'hb : _GEN_51; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_53 = 5'h5 == io_in_cnt ? 6'h11 : _GEN_52; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_54 = 5'h6 == io_in_cnt ? 6'h4 : _GEN_53; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_55 = 5'h7 == io_in_cnt ? 6'hd : _GEN_54; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_56 = 5'h8 == io_in_cnt ? 6'h12 : _GEN_55; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_57 = 5'h9 == io_in_cnt ? 6'h6 : _GEN_56; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_58 = 5'ha == io_in_cnt ? 6'hf : _GEN_57; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_59 = 5'hb == io_in_cnt ? 6'h13 : _GEN_58; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_60 = 5'hc == io_in_cnt ? 6'h8 : _GEN_59; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_61 = 5'hd == io_in_cnt ? 6'h1 : _GEN_60; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_62 = 5'he == io_in_cnt ? 6'ha : _GEN_61; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_63 = 5'hf == io_in_cnt ? 6'h15 : _GEN_62; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_64 = 5'h10 == io_in_cnt ? 6'h5 : _GEN_63; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_65 = 5'h11 == io_in_cnt ? 6'he : _GEN_64; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_66 = 5'h12 == io_in_cnt ? 6'h16 : _GEN_65; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_67 = 5'h13 == io_in_cnt ? 6'h3 : _GEN_66; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_68 = 5'h14 == io_in_cnt ? 6'hc : _GEN_67; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_69 = 5'h15 == io_in_cnt ? 6'h17 : _GEN_68; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_70 = 5'h16 == io_in_cnt ? 6'h14 : _GEN_69; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_73 = 5'h1 == io_in_cnt ? 6'h0 : 6'h10; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_74 = 5'h2 == io_in_cnt ? 6'h9 : _GEN_73; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_75 = 5'h3 == io_in_cnt ? 6'h12 : _GEN_74; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_76 = 5'h4 == io_in_cnt ? 6'h1 : _GEN_75; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_77 = 5'h5 == io_in_cnt ? 6'hb : _GEN_76; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_78 = 5'h6 == io_in_cnt ? 6'h14 : _GEN_77; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_79 = 5'h7 == io_in_cnt ? 6'h2 : _GEN_78; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_80 = 5'h8 == io_in_cnt ? 6'hd : _GEN_79; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_81 = 5'h9 == io_in_cnt ? 6'h16 : _GEN_80; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_82 = 5'ha == io_in_cnt ? 6'h3 : _GEN_81; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_83 = 5'hb == io_in_cnt ? 6'hf : _GEN_82; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_84 = 5'hc == io_in_cnt ? 6'h8 : _GEN_83; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_85 = 5'hd == io_in_cnt ? 6'h4 : _GEN_84; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_86 = 5'he == io_in_cnt ? 6'ha : _GEN_85; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_87 = 5'hf == io_in_cnt ? 6'h13 : _GEN_86; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_88 = 5'h10 == io_in_cnt ? 6'h5 : _GEN_87; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_89 = 5'h11 == io_in_cnt ? 6'he : _GEN_88; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_90 = 5'h12 == io_in_cnt ? 6'h17 : _GEN_89; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_91 = 5'h13 == io_in_cnt ? 6'h6 : _GEN_90; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_92 = 5'h14 == io_in_cnt ? 6'hc : _GEN_91; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_93 = 5'h15 == io_in_cnt ? 6'h15 : _GEN_92; // @[FFTDesigns.scala 3250:{17,17}]
  wire [5:0] _GEN_94 = 5'h16 == io_in_cnt ? 6'h7 : _GEN_93; // @[FFTDesigns.scala 3250:{17,17}]
  assign io_out_0 = 5'h17 == io_in_cnt ? 6'h8 : _GEN_22; // @[FFTDesigns.scala 3250:{17,17}]
  assign io_out_1 = 5'h17 == io_in_cnt ? 6'hc : _GEN_46; // @[FFTDesigns.scala 3250:{17,17}]
  assign io_out_2 = 5'h17 == io_in_cnt ? 6'h7 : _GEN_70; // @[FFTDesigns.scala 3250:{17,17}]
  assign io_out_3 = 5'h17 == io_in_cnt ? 6'h11 : _GEN_94; // @[FFTDesigns.scala 3250:{17,17}]
endmodule
module Streaming_Permute_Config_6(
  input  [4:0] io_in_cnt,
  output [1:0] io_out_0,
  output [1:0] io_out_1,
  output [1:0] io_out_2
);
  wire [1:0] _GEN_1 = 5'h1 == io_in_cnt ? 2'h1 : 2'h0; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_2 = 5'h2 == io_in_cnt ? 2'h2 : _GEN_1; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_3 = 5'h3 == io_in_cnt ? 2'h0 : _GEN_2; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_4 = 5'h4 == io_in_cnt ? 2'h1 : _GEN_3; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_5 = 5'h5 == io_in_cnt ? 2'h2 : _GEN_4; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_6 = 5'h6 == io_in_cnt ? 2'h0 : _GEN_5; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_7 = 5'h7 == io_in_cnt ? 2'h1 : _GEN_6; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_8 = 5'h8 == io_in_cnt ? 2'h2 : _GEN_7; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_9 = 5'h9 == io_in_cnt ? 2'h0 : _GEN_8; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_10 = 5'ha == io_in_cnt ? 2'h1 : _GEN_9; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_11 = 5'hb == io_in_cnt ? 2'h2 : _GEN_10; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_12 = 5'hc == io_in_cnt ? 2'h0 : _GEN_11; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_13 = 5'hd == io_in_cnt ? 2'h0 : _GEN_12; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_14 = 5'he == io_in_cnt ? 2'h1 : _GEN_13; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_15 = 5'hf == io_in_cnt ? 2'h2 : _GEN_14; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_16 = 5'h10 == io_in_cnt ? 2'h0 : _GEN_15; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_17 = 5'h11 == io_in_cnt ? 2'h1 : _GEN_16; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_18 = 5'h12 == io_in_cnt ? 2'h2 : _GEN_17; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_19 = 5'h13 == io_in_cnt ? 2'h0 : _GEN_18; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_20 = 5'h14 == io_in_cnt ? 2'h1 : _GEN_19; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_21 = 5'h15 == io_in_cnt ? 2'h2 : _GEN_20; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_22 = 5'h16 == io_in_cnt ? 2'h2 : _GEN_21; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_25 = 5'h1 == io_in_cnt ? 2'h3 : 2'h1; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_26 = 5'h2 == io_in_cnt ? 2'h0 : _GEN_25; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_27 = 5'h3 == io_in_cnt ? 2'h1 : _GEN_26; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_28 = 5'h4 == io_in_cnt ? 2'h3 : _GEN_27; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_29 = 5'h5 == io_in_cnt ? 2'h0 : _GEN_28; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_30 = 5'h6 == io_in_cnt ? 2'h1 : _GEN_29; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_31 = 5'h7 == io_in_cnt ? 2'h3 : _GEN_30; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_32 = 5'h8 == io_in_cnt ? 2'h0 : _GEN_31; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_33 = 5'h9 == io_in_cnt ? 2'h1 : _GEN_32; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_34 = 5'ha == io_in_cnt ? 2'h3 : _GEN_33; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_35 = 5'hb == io_in_cnt ? 2'h0 : _GEN_34; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_36 = 5'hc == io_in_cnt ? 2'h1 : _GEN_35; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_37 = 5'hd == io_in_cnt ? 2'h3 : _GEN_36; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_38 = 5'he == io_in_cnt ? 2'h0 : _GEN_37; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_39 = 5'hf == io_in_cnt ? 2'h1 : _GEN_38; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_40 = 5'h10 == io_in_cnt ? 2'h3 : _GEN_39; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_41 = 5'h11 == io_in_cnt ? 2'h0 : _GEN_40; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_42 = 5'h12 == io_in_cnt ? 2'h1 : _GEN_41; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_43 = 5'h13 == io_in_cnt ? 2'h3 : _GEN_42; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_44 = 5'h14 == io_in_cnt ? 2'h0 : _GEN_43; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_45 = 5'h15 == io_in_cnt ? 2'h1 : _GEN_44; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_46 = 5'h16 == io_in_cnt ? 2'h3 : _GEN_45; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_49 = 5'h1 == io_in_cnt ? 2'h0 : 2'h2; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_50 = 5'h2 == io_in_cnt ? 2'h3 : _GEN_49; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_51 = 5'h3 == io_in_cnt ? 2'h2 : _GEN_50; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_52 = 5'h4 == io_in_cnt ? 2'h0 : _GEN_51; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_53 = 5'h5 == io_in_cnt ? 2'h3 : _GEN_52; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_54 = 5'h6 == io_in_cnt ? 2'h2 : _GEN_53; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_55 = 5'h7 == io_in_cnt ? 2'h0 : _GEN_54; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_56 = 5'h8 == io_in_cnt ? 2'h3 : _GEN_55; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_57 = 5'h9 == io_in_cnt ? 2'h2 : _GEN_56; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_58 = 5'ha == io_in_cnt ? 2'h0 : _GEN_57; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_59 = 5'hb == io_in_cnt ? 2'h3 : _GEN_58; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_60 = 5'hc == io_in_cnt ? 2'h3 : _GEN_59; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_61 = 5'hd == io_in_cnt ? 2'h2 : _GEN_60; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_62 = 5'he == io_in_cnt ? 2'h3 : _GEN_61; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_63 = 5'hf == io_in_cnt ? 2'h0 : _GEN_62; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_64 = 5'h10 == io_in_cnt ? 2'h2 : _GEN_63; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_65 = 5'h11 == io_in_cnt ? 2'h3 : _GEN_64; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_66 = 5'h12 == io_in_cnt ? 2'h0 : _GEN_65; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_67 = 5'h13 == io_in_cnt ? 2'h2 : _GEN_66; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_68 = 5'h14 == io_in_cnt ? 2'h3 : _GEN_67; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_69 = 5'h15 == io_in_cnt ? 2'h0 : _GEN_68; // @[FFTDesigns.scala 3273:{17,17}]
  wire [1:0] _GEN_70 = 5'h16 == io_in_cnt ? 2'h0 : _GEN_69; // @[FFTDesigns.scala 3273:{17,17}]
  assign io_out_0 = 5'h17 == io_in_cnt ? 2'h1 : _GEN_22; // @[FFTDesigns.scala 3273:{17,17}]
  assign io_out_1 = 5'h17 == io_in_cnt ? 2'h0 : _GEN_46; // @[FFTDesigns.scala 3273:{17,17}]
  assign io_out_2 = 5'h17 == io_in_cnt ? 2'h2 : _GEN_70; // @[FFTDesigns.scala 3273:{17,17}]
endmodule
module PermutationsWithStreaming_6(
  input         clock,
  input         reset,
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  input  [31:0] io_in_2_Re,
  input  [31:0] io_in_2_Im,
  input  [31:0] io_in_3_Re,
  input  [31:0] io_in_3_Im,
  input         io_in_en_0,
  input         io_in_en_1,
  input         io_in_en_2,
  input         io_in_en_3,
  input         io_in_en_4,
  input         io_in_en_5,
  input         io_in_en_6,
  input         io_in_en_7,
  input         io_in_en_8,
  input         io_in_en_9,
  input         io_in_en_10,
  input         io_in_en_11,
  input         io_in_en_12,
  input         io_in_en_13,
  input         io_in_en_14,
  input         io_in_en_15,
  input         io_in_en_16,
  input         io_in_en_17,
  input         io_in_en_18,
  input         io_in_en_19,
  input         io_in_en_20,
  input         io_in_en_21,
  input         io_in_en_22,
  input         io_in_en_23,
  input         io_in_en_24,
  input         io_in_en_25,
  input         io_in_en_26,
  input         io_in_en_27,
  input         io_in_en_28,
  input         io_in_en_29,
  input         io_in_en_30,
  input         io_in_en_31,
  input         io_in_en_32,
  input         io_in_en_33,
  input         io_in_en_34,
  input         io_in_en_35,
  input         io_in_en_36,
  input         io_in_en_37,
  input         io_in_en_38,
  input         io_in_en_39,
  input         io_in_en_40,
  input         io_in_en_41,
  input         io_in_en_42,
  input         io_in_en_43,
  input         io_in_en_44,
  input         io_in_en_45,
  input         io_in_en_46,
  input         io_in_en_47,
  input         io_in_en_48,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im,
  output [31:0] io_out_2_Re,
  output [31:0] io_out_2_Im,
  output [31:0] io_out_3_Re,
  output [31:0] io_out_3_Im
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  RAM_Block_clock; // @[FFTDesigns.scala 2634:24]
  wire [5:0] RAM_Block_io_in_raddr; // @[FFTDesigns.scala 2634:24]
  wire [5:0] RAM_Block_io_in_waddr; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_io_in_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_io_in_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_io_re; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_io_wr; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_io_en; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_io_out_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_io_out_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_1_clock; // @[FFTDesigns.scala 2634:24]
  wire [5:0] RAM_Block_1_io_in_raddr; // @[FFTDesigns.scala 2634:24]
  wire [5:0] RAM_Block_1_io_in_waddr; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_1_io_in_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_1_io_in_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_1_io_re; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_1_io_wr; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_1_io_en; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_1_io_out_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_1_io_out_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_2_clock; // @[FFTDesigns.scala 2634:24]
  wire [5:0] RAM_Block_2_io_in_raddr; // @[FFTDesigns.scala 2634:24]
  wire [5:0] RAM_Block_2_io_in_waddr; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_2_io_in_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_2_io_in_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_2_io_re; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_2_io_wr; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_2_io_en; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_2_io_out_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_2_io_out_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_3_clock; // @[FFTDesigns.scala 2634:24]
  wire [5:0] RAM_Block_3_io_in_raddr; // @[FFTDesigns.scala 2634:24]
  wire [5:0] RAM_Block_3_io_in_waddr; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_3_io_in_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_3_io_in_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_3_io_re; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_3_io_wr; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_3_io_en; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_3_io_out_data_Re; // @[FFTDesigns.scala 2634:24]
  wire [31:0] RAM_Block_3_io_out_data_Im; // @[FFTDesigns.scala 2634:24]
  wire  RAM_Block_4_clock; // @[FFTDesigns.scala 2638:24]
  wire [5:0] RAM_Block_4_io_in_raddr; // @[FFTDesigns.scala 2638:24]
  wire [5:0] RAM_Block_4_io_in_waddr; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_4_io_in_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_4_io_in_data_Im; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_4_io_re; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_4_io_wr; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_4_io_en; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_4_io_out_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_4_io_out_data_Im; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_5_clock; // @[FFTDesigns.scala 2638:24]
  wire [5:0] RAM_Block_5_io_in_raddr; // @[FFTDesigns.scala 2638:24]
  wire [5:0] RAM_Block_5_io_in_waddr; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_5_io_in_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_5_io_in_data_Im; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_5_io_re; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_5_io_wr; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_5_io_en; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_5_io_out_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_5_io_out_data_Im; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_6_clock; // @[FFTDesigns.scala 2638:24]
  wire [5:0] RAM_Block_6_io_in_raddr; // @[FFTDesigns.scala 2638:24]
  wire [5:0] RAM_Block_6_io_in_waddr; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_6_io_in_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_6_io_in_data_Im; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_6_io_re; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_6_io_wr; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_6_io_en; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_6_io_out_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_6_io_out_data_Im; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_7_clock; // @[FFTDesigns.scala 2638:24]
  wire [5:0] RAM_Block_7_io_in_raddr; // @[FFTDesigns.scala 2638:24]
  wire [5:0] RAM_Block_7_io_in_waddr; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_7_io_in_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_7_io_in_data_Im; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_7_io_re; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_7_io_wr; // @[FFTDesigns.scala 2638:24]
  wire  RAM_Block_7_io_en; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_7_io_out_data_Re; // @[FFTDesigns.scala 2638:24]
  wire [31:0] RAM_Block_7_io_out_data_Im; // @[FFTDesigns.scala 2638:24]
  wire [31:0] PermutationModuleStreamed_io_in_0_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_in_0_Im; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_in_1_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_in_1_Im; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_in_2_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_in_2_Im; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_in_3_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_in_3_Im; // @[FFTDesigns.scala 2641:26]
  wire [1:0] PermutationModuleStreamed_io_in_config_0; // @[FFTDesigns.scala 2641:26]
  wire [1:0] PermutationModuleStreamed_io_in_config_1; // @[FFTDesigns.scala 2641:26]
  wire [1:0] PermutationModuleStreamed_io_in_config_2; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_0_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_0_Im; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_1_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_1_Im; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_2_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_2_Im; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_3_Re; // @[FFTDesigns.scala 2641:26]
  wire [31:0] PermutationModuleStreamed_io_out_3_Im; // @[FFTDesigns.scala 2641:26]
  wire [4:0] M0_Config_ROM_io_in_cnt; // @[FFTDesigns.scala 2642:27]
  wire [5:0] M0_Config_ROM_io_out_0; // @[FFTDesigns.scala 2642:27]
  wire [5:0] M0_Config_ROM_io_out_1; // @[FFTDesigns.scala 2642:27]
  wire [5:0] M0_Config_ROM_io_out_2; // @[FFTDesigns.scala 2642:27]
  wire [5:0] M0_Config_ROM_io_out_3; // @[FFTDesigns.scala 2642:27]
  wire [4:0] M1_Config_ROM_io_in_cnt; // @[FFTDesigns.scala 2643:27]
  wire [5:0] M1_Config_ROM_io_out_0; // @[FFTDesigns.scala 2643:27]
  wire [5:0] M1_Config_ROM_io_out_1; // @[FFTDesigns.scala 2643:27]
  wire [5:0] M1_Config_ROM_io_out_2; // @[FFTDesigns.scala 2643:27]
  wire [5:0] M1_Config_ROM_io_out_3; // @[FFTDesigns.scala 2643:27]
  wire [4:0] Streaming_Permute_Config_io_in_cnt; // @[FFTDesigns.scala 2644:29]
  wire [1:0] Streaming_Permute_Config_io_out_0; // @[FFTDesigns.scala 2644:29]
  wire [1:0] Streaming_Permute_Config_io_out_1; // @[FFTDesigns.scala 2644:29]
  wire [1:0] Streaming_Permute_Config_io_out_2; // @[FFTDesigns.scala 2644:29]
  reg  offset_switch; // @[FFTDesigns.scala 2627:28]
  wire [5:0] lo_lo_lo = {io_in_en_5,io_in_en_4,io_in_en_3,io_in_en_2,io_in_en_1,io_in_en_0}; // @[FFTDesigns.scala 2628:19]
  wire [11:0] lo_lo = {io_in_en_11,io_in_en_10,io_in_en_9,io_in_en_8,io_in_en_7,io_in_en_6,lo_lo_lo}; // @[FFTDesigns.scala 2628:19]
  wire [5:0] lo_hi_lo = {io_in_en_17,io_in_en_16,io_in_en_15,io_in_en_14,io_in_en_13,io_in_en_12}; // @[FFTDesigns.scala 2628:19]
  wire [23:0] lo = {io_in_en_23,io_in_en_22,io_in_en_21,io_in_en_20,io_in_en_19,io_in_en_18,lo_hi_lo,lo_lo}; // @[FFTDesigns.scala 2628:19]
  wire [5:0] hi_lo_lo = {io_in_en_29,io_in_en_28,io_in_en_27,io_in_en_26,io_in_en_25,io_in_en_24}; // @[FFTDesigns.scala 2628:19]
  wire [11:0] hi_lo = {io_in_en_35,io_in_en_34,io_in_en_33,io_in_en_32,io_in_en_31,io_in_en_30,hi_lo_lo}; // @[FFTDesigns.scala 2628:19]
  wire [5:0] hi_hi_lo = {io_in_en_41,io_in_en_40,io_in_en_39,io_in_en_38,io_in_en_37,io_in_en_36}; // @[FFTDesigns.scala 2628:19]
  wire [48:0] _T = {io_in_en_48,io_in_en_47,io_in_en_46,io_in_en_45,io_in_en_44,io_in_en_43,io_in_en_42,hi_hi_lo,hi_lo,
    lo}; // @[FFTDesigns.scala 2628:19]
  wire  _T_1 = |_T; // @[FFTDesigns.scala 2628:26]
  reg [4:0] cnt; // @[FFTDesigns.scala 2645:22]
  wire  _offset_switch_T = ~offset_switch; // @[FFTDesigns.scala 2649:26]
  wire [4:0] _cnt_T_1 = cnt + 5'h1; // @[FFTDesigns.scala 2651:20]
  wire  _GEN_2 = cnt == 5'h17 ? ~offset_switch : offset_switch; // @[FFTDesigns.scala 2647:32 2649:23 2652:23]
  wire [5:0] _T_6 = 5'h18 * _offset_switch_T; // @[FFTDesigns.scala 2661:54]
  wire [5:0] _T_8 = M0_Config_ROM_io_out_0 + _T_6; // @[FFTDesigns.scala 2661:44]
  wire [5:0] _T_9 = 5'h18 * offset_switch; // @[FFTDesigns.scala 2662:41]
  wire [5:0] _GEN_58 = {{1'd0}, cnt}; // @[FFTDesigns.scala 2662:31]
  wire [5:0] _T_11 = _GEN_58 + _T_9; // @[FFTDesigns.scala 2662:31]
  wire [5:0] _T_15 = _GEN_58 + _T_6; // @[FFTDesigns.scala 2664:31]
  wire [5:0] _T_18 = M1_Config_ROM_io_out_0 + _T_9; // @[FFTDesigns.scala 2665:44]
  wire [5:0] _T_22 = M0_Config_ROM_io_out_1 + _T_6; // @[FFTDesigns.scala 2661:44]
  wire [5:0] _T_32 = M1_Config_ROM_io_out_1 + _T_9; // @[FFTDesigns.scala 2665:44]
  wire [5:0] _T_36 = M0_Config_ROM_io_out_2 + _T_6; // @[FFTDesigns.scala 2661:44]
  wire [5:0] _T_46 = M1_Config_ROM_io_out_2 + _T_9; // @[FFTDesigns.scala 2665:44]
  wire [5:0] _T_50 = M0_Config_ROM_io_out_3 + _T_6; // @[FFTDesigns.scala 2661:44]
  wire [5:0] _T_60 = M1_Config_ROM_io_out_3 + _T_9; // @[FFTDesigns.scala 2665:44]
  RAM_Block_48 RAM_Block ( // @[FFTDesigns.scala 2634:24]
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
  RAM_Block_48 RAM_Block_1 ( // @[FFTDesigns.scala 2634:24]
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
  RAM_Block_48 RAM_Block_2 ( // @[FFTDesigns.scala 2634:24]
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
  RAM_Block_48 RAM_Block_3 ( // @[FFTDesigns.scala 2634:24]
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
  RAM_Block_48 RAM_Block_4 ( // @[FFTDesigns.scala 2638:24]
    .clock(RAM_Block_4_clock),
    .io_in_raddr(RAM_Block_4_io_in_raddr),
    .io_in_waddr(RAM_Block_4_io_in_waddr),
    .io_in_data_Re(RAM_Block_4_io_in_data_Re),
    .io_in_data_Im(RAM_Block_4_io_in_data_Im),
    .io_re(RAM_Block_4_io_re),
    .io_wr(RAM_Block_4_io_wr),
    .io_en(RAM_Block_4_io_en),
    .io_out_data_Re(RAM_Block_4_io_out_data_Re),
    .io_out_data_Im(RAM_Block_4_io_out_data_Im)
  );
  RAM_Block_48 RAM_Block_5 ( // @[FFTDesigns.scala 2638:24]
    .clock(RAM_Block_5_clock),
    .io_in_raddr(RAM_Block_5_io_in_raddr),
    .io_in_waddr(RAM_Block_5_io_in_waddr),
    .io_in_data_Re(RAM_Block_5_io_in_data_Re),
    .io_in_data_Im(RAM_Block_5_io_in_data_Im),
    .io_re(RAM_Block_5_io_re),
    .io_wr(RAM_Block_5_io_wr),
    .io_en(RAM_Block_5_io_en),
    .io_out_data_Re(RAM_Block_5_io_out_data_Re),
    .io_out_data_Im(RAM_Block_5_io_out_data_Im)
  );
  RAM_Block_48 RAM_Block_6 ( // @[FFTDesigns.scala 2638:24]
    .clock(RAM_Block_6_clock),
    .io_in_raddr(RAM_Block_6_io_in_raddr),
    .io_in_waddr(RAM_Block_6_io_in_waddr),
    .io_in_data_Re(RAM_Block_6_io_in_data_Re),
    .io_in_data_Im(RAM_Block_6_io_in_data_Im),
    .io_re(RAM_Block_6_io_re),
    .io_wr(RAM_Block_6_io_wr),
    .io_en(RAM_Block_6_io_en),
    .io_out_data_Re(RAM_Block_6_io_out_data_Re),
    .io_out_data_Im(RAM_Block_6_io_out_data_Im)
  );
  RAM_Block_48 RAM_Block_7 ( // @[FFTDesigns.scala 2638:24]
    .clock(RAM_Block_7_clock),
    .io_in_raddr(RAM_Block_7_io_in_raddr),
    .io_in_waddr(RAM_Block_7_io_in_waddr),
    .io_in_data_Re(RAM_Block_7_io_in_data_Re),
    .io_in_data_Im(RAM_Block_7_io_in_data_Im),
    .io_re(RAM_Block_7_io_re),
    .io_wr(RAM_Block_7_io_wr),
    .io_en(RAM_Block_7_io_en),
    .io_out_data_Re(RAM_Block_7_io_out_data_Re),
    .io_out_data_Im(RAM_Block_7_io_out_data_Im)
  );
  PermutationModuleStreamed PermutationModuleStreamed ( // @[FFTDesigns.scala 2641:26]
    .io_in_0_Re(PermutationModuleStreamed_io_in_0_Re),
    .io_in_0_Im(PermutationModuleStreamed_io_in_0_Im),
    .io_in_1_Re(PermutationModuleStreamed_io_in_1_Re),
    .io_in_1_Im(PermutationModuleStreamed_io_in_1_Im),
    .io_in_2_Re(PermutationModuleStreamed_io_in_2_Re),
    .io_in_2_Im(PermutationModuleStreamed_io_in_2_Im),
    .io_in_3_Re(PermutationModuleStreamed_io_in_3_Re),
    .io_in_3_Im(PermutationModuleStreamed_io_in_3_Im),
    .io_in_config_0(PermutationModuleStreamed_io_in_config_0),
    .io_in_config_1(PermutationModuleStreamed_io_in_config_1),
    .io_in_config_2(PermutationModuleStreamed_io_in_config_2),
    .io_out_0_Re(PermutationModuleStreamed_io_out_0_Re),
    .io_out_0_Im(PermutationModuleStreamed_io_out_0_Im),
    .io_out_1_Re(PermutationModuleStreamed_io_out_1_Re),
    .io_out_1_Im(PermutationModuleStreamed_io_out_1_Im),
    .io_out_2_Re(PermutationModuleStreamed_io_out_2_Re),
    .io_out_2_Im(PermutationModuleStreamed_io_out_2_Im),
    .io_out_3_Re(PermutationModuleStreamed_io_out_3_Re),
    .io_out_3_Im(PermutationModuleStreamed_io_out_3_Im)
  );
  M0_Config_ROM_6 M0_Config_ROM ( // @[FFTDesigns.scala 2642:27]
    .io_in_cnt(M0_Config_ROM_io_in_cnt),
    .io_out_0(M0_Config_ROM_io_out_0),
    .io_out_1(M0_Config_ROM_io_out_1),
    .io_out_2(M0_Config_ROM_io_out_2),
    .io_out_3(M0_Config_ROM_io_out_3)
  );
  M1_Config_ROM_6 M1_Config_ROM ( // @[FFTDesigns.scala 2643:27]
    .io_in_cnt(M1_Config_ROM_io_in_cnt),
    .io_out_0(M1_Config_ROM_io_out_0),
    .io_out_1(M1_Config_ROM_io_out_1),
    .io_out_2(M1_Config_ROM_io_out_2),
    .io_out_3(M1_Config_ROM_io_out_3)
  );
  Streaming_Permute_Config_6 Streaming_Permute_Config ( // @[FFTDesigns.scala 2644:29]
    .io_in_cnt(Streaming_Permute_Config_io_in_cnt),
    .io_out_0(Streaming_Permute_Config_io_out_0),
    .io_out_1(Streaming_Permute_Config_io_out_1),
    .io_out_2(Streaming_Permute_Config_io_out_2)
  );
  assign io_out_0_Re = RAM_Block_4_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign io_out_0_Im = RAM_Block_4_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign io_out_1_Re = RAM_Block_5_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign io_out_1_Im = RAM_Block_5_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign io_out_2_Re = RAM_Block_6_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign io_out_2_Im = RAM_Block_6_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign io_out_3_Re = RAM_Block_7_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign io_out_3_Im = RAM_Block_7_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2670:19 2689:19]
  assign RAM_Block_clock = clock;
  assign RAM_Block_io_in_raddr = _T_1 ? _T_8 : 6'h0; // @[FFTDesigns.scala 2646:30 2661:24 2680:24]
  assign RAM_Block_io_in_waddr = _T_1 ? _T_11 : 6'h0; // @[FFTDesigns.scala 2646:30 2662:24 2681:24]
  assign RAM_Block_io_in_data_Re = io_in_0_Re; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_io_in_data_Im = io_in_0_Im; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_1_clock = clock;
  assign RAM_Block_1_io_in_raddr = _T_1 ? _T_22 : 6'h0; // @[FFTDesigns.scala 2646:30 2661:24 2680:24]
  assign RAM_Block_1_io_in_waddr = _T_1 ? _T_11 : 6'h0; // @[FFTDesigns.scala 2646:30 2662:24 2681:24]
  assign RAM_Block_1_io_in_data_Re = io_in_1_Re; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_1_io_in_data_Im = io_in_1_Im; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_1_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_1_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_1_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_2_clock = clock;
  assign RAM_Block_2_io_in_raddr = _T_1 ? _T_36 : 6'h0; // @[FFTDesigns.scala 2646:30 2661:24 2680:24]
  assign RAM_Block_2_io_in_waddr = _T_1 ? _T_11 : 6'h0; // @[FFTDesigns.scala 2646:30 2662:24 2681:24]
  assign RAM_Block_2_io_in_data_Re = io_in_2_Re; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_2_io_in_data_Im = io_in_2_Im; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_2_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_2_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_2_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_3_clock = clock;
  assign RAM_Block_3_io_in_raddr = _T_1 ? _T_50 : 6'h0; // @[FFTDesigns.scala 2646:30 2661:24 2680:24]
  assign RAM_Block_3_io_in_waddr = _T_1 ? _T_11 : 6'h0; // @[FFTDesigns.scala 2646:30 2662:24 2681:24]
  assign RAM_Block_3_io_in_data_Re = io_in_3_Re; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_3_io_in_data_Im = io_in_3_Im; // @[FFTDesigns.scala 2646:30 2663:23 2682:23]
  assign RAM_Block_3_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_3_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_3_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_4_clock = clock;
  assign RAM_Block_4_io_in_raddr = _T_1 ? _T_15 : 6'h0; // @[FFTDesigns.scala 2646:30 2664:24 2683:24]
  assign RAM_Block_4_io_in_waddr = _T_1 ? _T_18 : 6'h0; // @[FFTDesigns.scala 2646:30 2665:24 2684:24]
  assign RAM_Block_4_io_in_data_Re = PermutationModuleStreamed_io_out_0_Re; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_4_io_in_data_Im = PermutationModuleStreamed_io_out_0_Im; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_4_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_4_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_4_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_5_clock = clock;
  assign RAM_Block_5_io_in_raddr = _T_1 ? _T_15 : 6'h0; // @[FFTDesigns.scala 2646:30 2664:24 2683:24]
  assign RAM_Block_5_io_in_waddr = _T_1 ? _T_32 : 6'h0; // @[FFTDesigns.scala 2646:30 2665:24 2684:24]
  assign RAM_Block_5_io_in_data_Re = PermutationModuleStreamed_io_out_1_Re; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_5_io_in_data_Im = PermutationModuleStreamed_io_out_1_Im; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_5_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_5_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_5_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_6_clock = clock;
  assign RAM_Block_6_io_in_raddr = _T_1 ? _T_15 : 6'h0; // @[FFTDesigns.scala 2646:30 2664:24 2683:24]
  assign RAM_Block_6_io_in_waddr = _T_1 ? _T_46 : 6'h0; // @[FFTDesigns.scala 2646:30 2665:24 2684:24]
  assign RAM_Block_6_io_in_data_Re = PermutationModuleStreamed_io_out_2_Re; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_6_io_in_data_Im = PermutationModuleStreamed_io_out_2_Im; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_6_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_6_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_6_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_7_clock = clock;
  assign RAM_Block_7_io_in_raddr = _T_1 ? _T_15 : 6'h0; // @[FFTDesigns.scala 2646:30 2664:24 2683:24]
  assign RAM_Block_7_io_in_waddr = _T_1 ? _T_60 : 6'h0; // @[FFTDesigns.scala 2646:30 2665:24 2684:24]
  assign RAM_Block_7_io_in_data_Re = PermutationModuleStreamed_io_out_3_Re; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_7_io_in_data_Im = PermutationModuleStreamed_io_out_3_Im; // @[FFTDesigns.scala 2646:30 2666:23 2685:23]
  assign RAM_Block_7_io_re = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_7_io_wr = |_T; // @[FFTDesigns.scala 2646:26]
  assign RAM_Block_7_io_en = |_T; // @[FFTDesigns.scala 2646:26]
  assign PermutationModuleStreamed_io_in_0_Re = RAM_Block_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_0_Im = RAM_Block_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_1_Re = RAM_Block_1_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_1_Im = RAM_Block_1_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_2_Re = RAM_Block_2_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_2_Im = RAM_Block_2_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_3_Re = RAM_Block_3_io_out_data_Re; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_3_Im = RAM_Block_3_io_out_data_Im; // @[FFTDesigns.scala 2646:30 2668:24 2687:24]
  assign PermutationModuleStreamed_io_in_config_0 = Streaming_Permute_Config_io_out_0; // @[FFTDesigns.scala 2646:30 2667:31 2686:31]
  assign PermutationModuleStreamed_io_in_config_1 = Streaming_Permute_Config_io_out_1; // @[FFTDesigns.scala 2646:30 2667:31 2686:31]
  assign PermutationModuleStreamed_io_in_config_2 = Streaming_Permute_Config_io_out_2; // @[FFTDesigns.scala 2646:30 2667:31 2686:31]
  assign M0_Config_ROM_io_in_cnt = cnt; // @[FFTDesigns.scala 2694:22]
  assign M1_Config_ROM_io_in_cnt = cnt; // @[FFTDesigns.scala 2695:22]
  assign Streaming_Permute_Config_io_in_cnt = cnt; // @[FFTDesigns.scala 2696:24]
  always @(posedge clock) begin
    offset_switch <= _T_1 & _GEN_2; // @[FFTDesigns.scala 2646:30 2691:21]
    if (reset) begin // @[FFTDesigns.scala 2645:22]
      cnt <= 5'h0; // @[FFTDesigns.scala 2645:22]
    end else if (_T_1) begin // @[FFTDesigns.scala 2646:30]
      if (cnt == 5'h17) begin // @[FFTDesigns.scala 2647:32]
        cnt <= 5'h0; // @[FFTDesigns.scala 2648:13]
      end else begin
        cnt <= _cnt_T_1; // @[FFTDesigns.scala 2651:13]
      end
    end else begin
      cnt <= 5'h0; // @[FFTDesigns.scala 2692:11]
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
  cnt = _RAND_1[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RAM_Block_56(
  input         clock,
  input  [4:0]  io_in_raddr,
  input  [4:0]  io_in_waddr,
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
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem_0_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_0_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_1_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_1_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_2_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_2_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_3_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_3_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_4_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_4_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_5_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_5_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_6_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_6_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_7_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_7_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_8_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_8_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_9_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_9_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_10_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_10_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_11_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_11_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_12_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_12_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_13_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_13_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_14_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_14_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_15_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_15_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_16_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_16_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_17_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_17_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_18_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_18_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_19_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_19_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_20_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_20_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_21_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_21_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_22_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_22_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_23_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_23_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_24_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_24_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_25_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_25_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_26_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_26_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_27_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_27_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_28_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_28_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_29_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_29_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_30_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_30_Im; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_31_Re; // @[FFTDesigns.scala 3286:18]
  reg [31:0] mem_31_Im; // @[FFTDesigns.scala 3286:18]
  wire [31:0] _GEN_129 = 5'h1 == io_in_raddr ? mem_1_Im : mem_0_Im; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_130 = 5'h2 == io_in_raddr ? mem_2_Im : _GEN_129; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_131 = 5'h3 == io_in_raddr ? mem_3_Im : _GEN_130; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_132 = 5'h4 == io_in_raddr ? mem_4_Im : _GEN_131; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_133 = 5'h5 == io_in_raddr ? mem_5_Im : _GEN_132; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_134 = 5'h6 == io_in_raddr ? mem_6_Im : _GEN_133; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_135 = 5'h7 == io_in_raddr ? mem_7_Im : _GEN_134; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_136 = 5'h8 == io_in_raddr ? mem_8_Im : _GEN_135; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_137 = 5'h9 == io_in_raddr ? mem_9_Im : _GEN_136; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_138 = 5'ha == io_in_raddr ? mem_10_Im : _GEN_137; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_139 = 5'hb == io_in_raddr ? mem_11_Im : _GEN_138; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_140 = 5'hc == io_in_raddr ? mem_12_Im : _GEN_139; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_141 = 5'hd == io_in_raddr ? mem_13_Im : _GEN_140; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_142 = 5'he == io_in_raddr ? mem_14_Im : _GEN_141; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_143 = 5'hf == io_in_raddr ? mem_15_Im : _GEN_142; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_144 = 5'h10 == io_in_raddr ? mem_16_Im : _GEN_143; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_145 = 5'h11 == io_in_raddr ? mem_17_Im : _GEN_144; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_146 = 5'h12 == io_in_raddr ? mem_18_Im : _GEN_145; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_147 = 5'h13 == io_in_raddr ? mem_19_Im : _GEN_146; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_148 = 5'h14 == io_in_raddr ? mem_20_Im : _GEN_147; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_149 = 5'h15 == io_in_raddr ? mem_21_Im : _GEN_148; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_150 = 5'h16 == io_in_raddr ? mem_22_Im : _GEN_149; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_151 = 5'h17 == io_in_raddr ? mem_23_Im : _GEN_150; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_152 = 5'h18 == io_in_raddr ? mem_24_Im : _GEN_151; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_153 = 5'h19 == io_in_raddr ? mem_25_Im : _GEN_152; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_154 = 5'h1a == io_in_raddr ? mem_26_Im : _GEN_153; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_155 = 5'h1b == io_in_raddr ? mem_27_Im : _GEN_154; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_156 = 5'h1c == io_in_raddr ? mem_28_Im : _GEN_155; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_157 = 5'h1d == io_in_raddr ? mem_29_Im : _GEN_156; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_158 = 5'h1e == io_in_raddr ? mem_30_Im : _GEN_157; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_159 = 5'h1f == io_in_raddr ? mem_31_Im : _GEN_158; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_161 = 5'h1 == io_in_raddr ? mem_1_Re : mem_0_Re; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_162 = 5'h2 == io_in_raddr ? mem_2_Re : _GEN_161; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_163 = 5'h3 == io_in_raddr ? mem_3_Re : _GEN_162; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_164 = 5'h4 == io_in_raddr ? mem_4_Re : _GEN_163; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_165 = 5'h5 == io_in_raddr ? mem_5_Re : _GEN_164; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_166 = 5'h6 == io_in_raddr ? mem_6_Re : _GEN_165; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_167 = 5'h7 == io_in_raddr ? mem_7_Re : _GEN_166; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_168 = 5'h8 == io_in_raddr ? mem_8_Re : _GEN_167; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_169 = 5'h9 == io_in_raddr ? mem_9_Re : _GEN_168; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_170 = 5'ha == io_in_raddr ? mem_10_Re : _GEN_169; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_171 = 5'hb == io_in_raddr ? mem_11_Re : _GEN_170; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_172 = 5'hc == io_in_raddr ? mem_12_Re : _GEN_171; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_173 = 5'hd == io_in_raddr ? mem_13_Re : _GEN_172; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_174 = 5'he == io_in_raddr ? mem_14_Re : _GEN_173; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_175 = 5'hf == io_in_raddr ? mem_15_Re : _GEN_174; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_176 = 5'h10 == io_in_raddr ? mem_16_Re : _GEN_175; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_177 = 5'h11 == io_in_raddr ? mem_17_Re : _GEN_176; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_178 = 5'h12 == io_in_raddr ? mem_18_Re : _GEN_177; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_179 = 5'h13 == io_in_raddr ? mem_19_Re : _GEN_178; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_180 = 5'h14 == io_in_raddr ? mem_20_Re : _GEN_179; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_181 = 5'h15 == io_in_raddr ? mem_21_Re : _GEN_180; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_182 = 5'h16 == io_in_raddr ? mem_22_Re : _GEN_181; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_183 = 5'h17 == io_in_raddr ? mem_23_Re : _GEN_182; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_184 = 5'h18 == io_in_raddr ? mem_24_Re : _GEN_183; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_185 = 5'h19 == io_in_raddr ? mem_25_Re : _GEN_184; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_186 = 5'h1a == io_in_raddr ? mem_26_Re : _GEN_185; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_187 = 5'h1b == io_in_raddr ? mem_27_Re : _GEN_186; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_188 = 5'h1c == io_in_raddr ? mem_28_Re : _GEN_187; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_189 = 5'h1d == io_in_raddr ? mem_29_Re : _GEN_188; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_190 = 5'h1e == io_in_raddr ? mem_30_Re : _GEN_189; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_191 = 5'h1f == io_in_raddr ? mem_31_Re : _GEN_190; // @[FFTDesigns.scala 3292:{21,21}]
  wire [31:0] _GEN_192 = io_re ? _GEN_159 : 32'h0; // @[FFTDesigns.scala 3291:18 3292:21 3295:24]
  wire [31:0] _GEN_193 = io_re ? _GEN_191 : 32'h0; // @[FFTDesigns.scala 3291:18 3292:21 3294:24]
  assign io_out_data_Re = io_en ? _GEN_193 : 32'h0; // @[FFTDesigns.scala 3287:16 3298:22]
  assign io_out_data_Im = io_en ? _GEN_192 : 32'h0; // @[FFTDesigns.scala 3287:16 3299:22]
  always @(posedge clock) begin
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h0 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_0_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h0 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_0_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h1 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_1_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h1 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_1_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h2 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_2_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h2 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_2_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h3 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_3_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h3 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_3_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h4 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_4_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h4 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_4_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h5 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_5_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h5 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_5_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h6 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_6_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h6 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_6_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h7 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_7_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h7 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_7_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h8 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_8_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h8 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_8_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h9 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_9_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h9 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_9_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'ha == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_10_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'ha == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_10_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'hb == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_11_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'hb == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_11_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'hc == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_12_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'hc == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_12_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'hd == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_13_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'hd == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_13_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'he == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_14_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'he == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_14_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'hf == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_15_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'hf == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_15_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h10 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_16_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h10 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_16_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h11 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_17_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h11 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_17_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h12 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_18_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h12 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_18_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h13 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_19_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h13 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_19_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h14 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_20_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h14 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_20_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h15 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_21_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h15 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_21_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h16 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_22_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h16 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_22_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h17 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_23_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h17 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_23_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h18 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_24_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h18 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_24_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h19 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_25_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h19 == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_25_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h1a == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_26_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h1a == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_26_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h1b == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_27_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h1b == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_27_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h1c == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_28_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h1c == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_28_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h1d == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_29_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h1d == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_29_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h1e == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_30_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h1e == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_30_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h1f == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_31_Re <= io_in_data_Re; // @[FFTDesigns.scala 3289:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3287:16]
      if (io_wr) begin // @[FFTDesigns.scala 3288:18]
        if (5'h1f == io_in_waddr) begin // @[FFTDesigns.scala 3289:26]
          mem_31_Im <= io_in_data_Im; // @[FFTDesigns.scala 3289:26]
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
  _RAND_8 = {1{`RANDOM}};
  mem_4_Re = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  mem_4_Im = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  mem_5_Re = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  mem_5_Im = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  mem_6_Re = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  mem_6_Im = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  mem_7_Re = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  mem_7_Im = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  mem_8_Re = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  mem_8_Im = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  mem_9_Re = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  mem_9_Im = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  mem_10_Re = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  mem_10_Im = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  mem_11_Re = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  mem_11_Im = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  mem_12_Re = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  mem_12_Im = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  mem_13_Re = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  mem_13_Im = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  mem_14_Re = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  mem_14_Im = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  mem_15_Re = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  mem_15_Im = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  mem_16_Re = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  mem_16_Im = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  mem_17_Re = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  mem_17_Im = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  mem_18_Re = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  mem_18_Im = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  mem_19_Re = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  mem_19_Im = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  mem_20_Re = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  mem_20_Im = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  mem_21_Re = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  mem_21_Im = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  mem_22_Re = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  mem_22_Im = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  mem_23_Re = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  mem_23_Im = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  mem_24_Re = _RAND_48[31:0];
  _RAND_49 = {1{`RANDOM}};
  mem_24_Im = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  mem_25_Re = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  mem_25_Im = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  mem_26_Re = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  mem_26_Im = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  mem_27_Re = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  mem_27_Im = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  mem_28_Re = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  mem_28_Im = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  mem_29_Re = _RAND_58[31:0];
  _RAND_59 = {1{`RANDOM}};
  mem_29_Im = _RAND_59[31:0];
  _RAND_60 = {1{`RANDOM}};
  mem_30_Re = _RAND_60[31:0];
  _RAND_61 = {1{`RANDOM}};
  mem_30_Im = _RAND_61[31:0];
  _RAND_62 = {1{`RANDOM}};
  mem_31_Re = _RAND_62[31:0];
  _RAND_63 = {1{`RANDOM}};
  mem_31_Im = _RAND_63[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PermutationModuleStreamed_7(
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  input  [31:0] io_in_2_Re,
  input  [31:0] io_in_2_Im,
  input  [31:0] io_in_3_Re,
  input  [31:0] io_in_3_Im,
  input  [31:0] io_in_4_Re,
  input  [31:0] io_in_4_Im,
  input  [31:0] io_in_5_Re,
  input  [31:0] io_in_5_Im,
  input  [2:0]  io_in_config_0,
  input  [2:0]  io_in_config_1,
  input  [2:0]  io_in_config_2,
  input  [2:0]  io_in_config_3,
  input  [2:0]  io_in_config_4,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im,
  output [31:0] io_out_2_Re,
  output [31:0] io_out_2_Im,
  output [31:0] io_out_3_Re,
  output [31:0] io_out_3_Im,
  output [31:0] io_out_4_Re,
  output [31:0] io_out_4_Im,
  output [31:0] io_out_5_Re,
  output [31:0] io_out_5_Im
);
  wire  _T = io_in_config_0 == 3'h0; // @[FFTDesigns.scala 3194:35]
  wire  _T_1 = io_in_config_1 == 3'h0; // @[FFTDesigns.scala 3194:35]
  wire  _T_2 = io_in_config_2 == 3'h0; // @[FFTDesigns.scala 3194:35]
  wire  _T_3 = io_in_config_3 == 3'h0; // @[FFTDesigns.scala 3194:35]
  wire  _T_4 = io_in_config_4 == 3'h0; // @[FFTDesigns.scala 3194:35]
  wire  _T_6 = io_in_config_0 == 3'h1; // @[FFTDesigns.scala 3194:35]
  wire  _T_7 = io_in_config_1 == 3'h1; // @[FFTDesigns.scala 3194:35]
  wire  _T_8 = io_in_config_2 == 3'h1; // @[FFTDesigns.scala 3194:35]
  wire  _T_9 = io_in_config_3 == 3'h1; // @[FFTDesigns.scala 3194:35]
  wire  _T_10 = io_in_config_4 == 3'h1; // @[FFTDesigns.scala 3194:35]
  wire  _T_12 = io_in_config_0 == 3'h2; // @[FFTDesigns.scala 3194:35]
  wire  _T_13 = io_in_config_1 == 3'h2; // @[FFTDesigns.scala 3194:35]
  wire  _T_14 = io_in_config_2 == 3'h2; // @[FFTDesigns.scala 3194:35]
  wire  _T_15 = io_in_config_3 == 3'h2; // @[FFTDesigns.scala 3194:35]
  wire  _T_16 = io_in_config_4 == 3'h2; // @[FFTDesigns.scala 3194:35]
  wire  _T_18 = io_in_config_0 == 3'h3; // @[FFTDesigns.scala 3194:35]
  wire  _T_19 = io_in_config_1 == 3'h3; // @[FFTDesigns.scala 3194:35]
  wire  _T_20 = io_in_config_2 == 3'h3; // @[FFTDesigns.scala 3194:35]
  wire  _T_21 = io_in_config_3 == 3'h3; // @[FFTDesigns.scala 3194:35]
  wire  _T_22 = io_in_config_4 == 3'h3; // @[FFTDesigns.scala 3194:35]
  wire  _T_24 = io_in_config_0 == 3'h4; // @[FFTDesigns.scala 3194:35]
  wire  _T_25 = io_in_config_1 == 3'h4; // @[FFTDesigns.scala 3194:35]
  wire  _T_26 = io_in_config_2 == 3'h4; // @[FFTDesigns.scala 3194:35]
  wire  _T_27 = io_in_config_3 == 3'h4; // @[FFTDesigns.scala 3194:35]
  wire  _T_28 = io_in_config_4 == 3'h4; // @[FFTDesigns.scala 3194:35]
  wire  _T_30 = io_in_config_0 == 3'h5; // @[FFTDesigns.scala 3194:35]
  wire  _T_31 = io_in_config_1 == 3'h5; // @[FFTDesigns.scala 3194:35]
  wire  _T_32 = io_in_config_2 == 3'h5; // @[FFTDesigns.scala 3194:35]
  wire  _T_33 = io_in_config_3 == 3'h5; // @[FFTDesigns.scala 3194:35]
  wire  _T_34 = io_in_config_4 == 3'h5; // @[FFTDesigns.scala 3194:35]
  wire [2:0] _pms_pmx_T = _T_4 ? 3'h4 : 3'h5; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_1 = _T_3 ? 3'h3 : _pms_pmx_T; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_2 = _T_2 ? 3'h2 : _pms_pmx_T_1; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_3 = _T_1 ? 3'h1 : _pms_pmx_T_2; // @[Mux.scala 47:70]
  wire [2:0] pms_0 = _T ? 3'h0 : _pms_pmx_T_3; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_4 = _T_10 ? 3'h4 : 3'h5; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_5 = _T_9 ? 3'h3 : _pms_pmx_T_4; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_6 = _T_8 ? 3'h2 : _pms_pmx_T_5; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_7 = _T_7 ? 3'h1 : _pms_pmx_T_6; // @[Mux.scala 47:70]
  wire [2:0] pms_1 = _T_6 ? 3'h0 : _pms_pmx_T_7; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_8 = _T_16 ? 3'h4 : 3'h5; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_9 = _T_15 ? 3'h3 : _pms_pmx_T_8; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_10 = _T_14 ? 3'h2 : _pms_pmx_T_9; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_11 = _T_13 ? 3'h1 : _pms_pmx_T_10; // @[Mux.scala 47:70]
  wire [2:0] pms_2 = _T_12 ? 3'h0 : _pms_pmx_T_11; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_12 = _T_22 ? 3'h4 : 3'h5; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_13 = _T_21 ? 3'h3 : _pms_pmx_T_12; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_14 = _T_20 ? 3'h2 : _pms_pmx_T_13; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_15 = _T_19 ? 3'h1 : _pms_pmx_T_14; // @[Mux.scala 47:70]
  wire [2:0] pms_3 = _T_18 ? 3'h0 : _pms_pmx_T_15; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_16 = _T_28 ? 3'h4 : 3'h5; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_17 = _T_27 ? 3'h3 : _pms_pmx_T_16; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_18 = _T_26 ? 3'h2 : _pms_pmx_T_17; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_19 = _T_25 ? 3'h1 : _pms_pmx_T_18; // @[Mux.scala 47:70]
  wire [2:0] pms_4 = _T_24 ? 3'h0 : _pms_pmx_T_19; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_20 = _T_34 ? 3'h4 : 3'h5; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_21 = _T_33 ? 3'h3 : _pms_pmx_T_20; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_22 = _T_32 ? 3'h2 : _pms_pmx_T_21; // @[Mux.scala 47:70]
  wire [2:0] _pms_pmx_T_23 = _T_31 ? 3'h1 : _pms_pmx_T_22; // @[Mux.scala 47:70]
  wire [2:0] pms_5 = _T_30 ? 3'h0 : _pms_pmx_T_23; // @[Mux.scala 47:70]
  wire [31:0] _GEN_1 = 3'h1 == pms_0 ? io_in_1_Im : io_in_0_Im; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_2 = 3'h2 == pms_0 ? io_in_2_Im : _GEN_1; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_3 = 3'h3 == pms_0 ? io_in_3_Im : _GEN_2; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_4 = 3'h4 == pms_0 ? io_in_4_Im : _GEN_3; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_7 = 3'h1 == pms_0 ? io_in_1_Re : io_in_0_Re; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_8 = 3'h2 == pms_0 ? io_in_2_Re : _GEN_7; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_9 = 3'h3 == pms_0 ? io_in_3_Re : _GEN_8; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_10 = 3'h4 == pms_0 ? io_in_4_Re : _GEN_9; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_13 = 3'h1 == pms_1 ? io_in_1_Im : io_in_0_Im; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_14 = 3'h2 == pms_1 ? io_in_2_Im : _GEN_13; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_15 = 3'h3 == pms_1 ? io_in_3_Im : _GEN_14; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_16 = 3'h4 == pms_1 ? io_in_4_Im : _GEN_15; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_19 = 3'h1 == pms_1 ? io_in_1_Re : io_in_0_Re; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_20 = 3'h2 == pms_1 ? io_in_2_Re : _GEN_19; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_21 = 3'h3 == pms_1 ? io_in_3_Re : _GEN_20; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_22 = 3'h4 == pms_1 ? io_in_4_Re : _GEN_21; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_25 = 3'h1 == pms_2 ? io_in_1_Im : io_in_0_Im; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_26 = 3'h2 == pms_2 ? io_in_2_Im : _GEN_25; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_27 = 3'h3 == pms_2 ? io_in_3_Im : _GEN_26; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_28 = 3'h4 == pms_2 ? io_in_4_Im : _GEN_27; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_31 = 3'h1 == pms_2 ? io_in_1_Re : io_in_0_Re; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_32 = 3'h2 == pms_2 ? io_in_2_Re : _GEN_31; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_33 = 3'h3 == pms_2 ? io_in_3_Re : _GEN_32; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_34 = 3'h4 == pms_2 ? io_in_4_Re : _GEN_33; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_37 = 3'h1 == pms_3 ? io_in_1_Im : io_in_0_Im; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_38 = 3'h2 == pms_3 ? io_in_2_Im : _GEN_37; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_39 = 3'h3 == pms_3 ? io_in_3_Im : _GEN_38; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_40 = 3'h4 == pms_3 ? io_in_4_Im : _GEN_39; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_43 = 3'h1 == pms_3 ? io_in_1_Re : io_in_0_Re; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_44 = 3'h2 == pms_3 ? io_in_2_Re : _GEN_43; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_45 = 3'h3 == pms_3 ? io_in_3_Re : _GEN_44; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_46 = 3'h4 == pms_3 ? io_in_4_Re : _GEN_45; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_49 = 3'h1 == pms_4 ? io_in_1_Im : io_in_0_Im; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_50 = 3'h2 == pms_4 ? io_in_2_Im : _GEN_49; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_51 = 3'h3 == pms_4 ? io_in_3_Im : _GEN_50; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_52 = 3'h4 == pms_4 ? io_in_4_Im : _GEN_51; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_55 = 3'h1 == pms_4 ? io_in_1_Re : io_in_0_Re; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_56 = 3'h2 == pms_4 ? io_in_2_Re : _GEN_55; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_57 = 3'h3 == pms_4 ? io_in_3_Re : _GEN_56; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_58 = 3'h4 == pms_4 ? io_in_4_Re : _GEN_57; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_61 = 3'h1 == pms_5 ? io_in_1_Im : io_in_0_Im; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_62 = 3'h2 == pms_5 ? io_in_2_Im : _GEN_61; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_63 = 3'h3 == pms_5 ? io_in_3_Im : _GEN_62; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_64 = 3'h4 == pms_5 ? io_in_4_Im : _GEN_63; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_67 = 3'h1 == pms_5 ? io_in_1_Re : io_in_0_Re; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_68 = 3'h2 == pms_5 ? io_in_2_Re : _GEN_67; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_69 = 3'h3 == pms_5 ? io_in_3_Re : _GEN_68; // @[FFTDesigns.scala 3203:{17,17}]
  wire [31:0] _GEN_70 = 3'h4 == pms_5 ? io_in_4_Re : _GEN_69; // @[FFTDesigns.scala 3203:{17,17}]
  assign io_out_0_Re = 3'h5 == pms_0 ? io_in_5_Re : _GEN_10; // @[FFTDesigns.scala 3203:{17,17}]
  assign io_out_0_Im = 3'h5 == pms_0 ? io_in_5_Im : _GEN_4; // @[FFTDesigns.scala 3203:{17,17}]
  assign io_out_1_Re = 3'h5 == pms_1 ? io_in_5_Re : _GEN_22; // @[FFTDesigns.scala 3203:{17,17}]
  assign io_out_1_Im = 3'h5 == pms_1 ? io_in_5_Im : _GEN_16; // @[FFTDesigns.scala 3203:{17,17}]
  assign io_out_2_Re = 3'h5 == pms_2 ? io_in_5_Re : _GEN_34; // @[FFTDesigns.scala 3203:{17,17}]
  assign io_out_2_Im = 3'h5 == pms_2 ? io_in_5_Im : _GEN_28; // @[FFTDesigns.scala 3203:{17,17}]
  assign io_out_3_Re = 3'h5 == pms_3 ? io_in_5_Re : _GEN_46; // @[FFTDesigns.scala 3203:{17,17}]
  assign io_out_3_Im = 3'h5 == pms_3 ? io_in_5_Im : _GEN_40; // @[FFTDesigns.scala 3203:{17,17}]
  assign io_out_4_Re = 3'h5 == pms_4 ? io_in_5_Re : _GEN_58; // @[FFTDesigns.scala 3203:{17,17}]
  assign io_out_4_Im = 3'h5 == pms_4 ? io_in_5_Im : _GEN_52; // @[FFTDesigns.scala 3203:{17,17}]
  assign io_out_5_Re = 3'h5 == pms_5 ? io_in_5_Re : _GEN_70; // @[FFTDesigns.scala 3203:{17,17}]
  assign io_out_5_Im = 3'h5 == pms_5 ? io_in_5_Im : _GEN_64; // @[FFTDesigns.scala 3203:{17,17}]
endmodule
module M0_Config_ROM_7(
  input  [3:0] io_in_cnt,
  output [4:0] io_out_0,
  output [4:0] io_out_1,
  output [4:0] io_out_2,
  output [4:0] io_out_3,
  output [4:0] io_out_4,
  output [4:0] io_out_5
);
  wire [4:0] _GEN_1 = 4'h1 == io_in_cnt ? 5'h1 : 5'h0; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_2 = 4'h2 == io_in_cnt ? 5'h2 : _GEN_1; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_3 = 4'h3 == io_in_cnt ? 5'h3 : _GEN_2; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_4 = 4'h4 == io_in_cnt ? 5'h4 : _GEN_3; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_5 = 4'h5 == io_in_cnt ? 5'h5 : _GEN_4; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_6 = 4'h6 == io_in_cnt ? 5'h6 : _GEN_5; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_7 = 4'h7 == io_in_cnt ? 5'h7 : _GEN_6; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_8 = 4'h8 == io_in_cnt ? 5'h8 : _GEN_7; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_9 = 4'h9 == io_in_cnt ? 5'h9 : _GEN_8; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_10 = 4'ha == io_in_cnt ? 5'ha : _GEN_9; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_11 = 4'hb == io_in_cnt ? 5'hb : _GEN_10; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_12 = 4'hc == io_in_cnt ? 5'hc : _GEN_11; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_13 = 4'hd == io_in_cnt ? 5'hd : _GEN_12; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_14 = 4'he == io_in_cnt ? 5'he : _GEN_13; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_33 = 4'h1 == io_in_cnt ? 5'h6 : 5'h5; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_34 = 4'h2 == io_in_cnt ? 5'h7 : _GEN_33; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_35 = 4'h3 == io_in_cnt ? 5'h8 : _GEN_34; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_36 = 4'h4 == io_in_cnt ? 5'h9 : _GEN_35; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_37 = 4'h5 == io_in_cnt ? 5'ha : _GEN_36; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_38 = 4'h6 == io_in_cnt ? 5'hb : _GEN_37; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_39 = 4'h7 == io_in_cnt ? 5'hc : _GEN_38; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_40 = 4'h8 == io_in_cnt ? 5'hd : _GEN_39; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_41 = 4'h9 == io_in_cnt ? 5'he : _GEN_40; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_42 = 4'ha == io_in_cnt ? 5'hf : _GEN_41; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_43 = 4'hb == io_in_cnt ? 5'h0 : _GEN_42; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_44 = 4'hc == io_in_cnt ? 5'h1 : _GEN_43; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_45 = 4'hd == io_in_cnt ? 5'h2 : _GEN_44; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_46 = 4'he == io_in_cnt ? 5'h3 : _GEN_45; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_65 = 4'h1 == io_in_cnt ? 5'hb : 5'ha; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_66 = 4'h2 == io_in_cnt ? 5'hc : _GEN_65; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_67 = 4'h3 == io_in_cnt ? 5'hd : _GEN_66; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_68 = 4'h4 == io_in_cnt ? 5'he : _GEN_67; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_69 = 4'h5 == io_in_cnt ? 5'hf : _GEN_68; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_70 = 4'h6 == io_in_cnt ? 5'h0 : _GEN_69; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_71 = 4'h7 == io_in_cnt ? 5'h1 : _GEN_70; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_72 = 4'h8 == io_in_cnt ? 5'h2 : _GEN_71; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_73 = 4'h9 == io_in_cnt ? 5'h3 : _GEN_72; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_74 = 4'ha == io_in_cnt ? 5'h4 : _GEN_73; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_75 = 4'hb == io_in_cnt ? 5'h5 : _GEN_74; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_76 = 4'hc == io_in_cnt ? 5'h6 : _GEN_75; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_77 = 4'hd == io_in_cnt ? 5'h7 : _GEN_76; // @[FFTDesigns.scala 3227:{17,17}]
  wire [4:0] _GEN_78 = 4'he == io_in_cnt ? 5'h8 : _GEN_77; // @[FFTDesigns.scala 3227:{17,17}]
  assign io_out_0 = 4'hf == io_in_cnt ? 5'hf : _GEN_14; // @[FFTDesigns.scala 3227:{17,17}]
  assign io_out_1 = 4'hf == io_in_cnt ? 5'hf : _GEN_14; // @[FFTDesigns.scala 3227:{17,17}]
  assign io_out_2 = 4'hf == io_in_cnt ? 5'h4 : _GEN_46; // @[FFTDesigns.scala 3227:{17,17}]
  assign io_out_3 = 4'hf == io_in_cnt ? 5'h4 : _GEN_46; // @[FFTDesigns.scala 3227:{17,17}]
  assign io_out_4 = 4'hf == io_in_cnt ? 5'h9 : _GEN_78; // @[FFTDesigns.scala 3227:{17,17}]
  assign io_out_5 = 4'hf == io_in_cnt ? 5'h9 : _GEN_78; // @[FFTDesigns.scala 3227:{17,17}]
endmodule
module M1_Config_ROM_7(
  input  [3:0] io_in_cnt,
  output [4:0] io_out_0,
  output [4:0] io_out_1,
  output [4:0] io_out_2,
  output [4:0] io_out_3,
  output [4:0] io_out_4,
  output [4:0] io_out_5
);
  wire [4:0] _GEN_1 = 4'h1 == io_in_cnt ? 5'h3 : 5'h0; // @[FFTDesigns.scala 3250:{17,17}]
  wire [4:0] _GEN_2 = 4'h2 == io_in_cnt ? 5'h6 : _GEN_1; // @[FFTDesigns.scala 3250:{17,17}]
  wire [4:0] _GEN_3 = 4'h3 == io_in_cnt ? 5'h9 : _GEN_2; // @[FFTDesigns.scala 3250:{17,17}]
  wire [4:0] _GEN_4 = 4'h4 == io_in_cnt ? 5'hc : _GEN_3; // @[FFTDesigns.scala 3250:{17,17}]
  wire [4:0] _GEN_5 = 4'h5 == io_in_cnt ? 5'hf : _GEN_4; // @[FFTDesigns.scala 3250:{17,17}]
  wire [4:0] _GEN_6 = 4'h6 == io_in_cnt ? 5'h2 : _GEN_5; // @[FFTDesigns.scala 3250:{17,17}]
  wire [4:0] _GEN_7 = 4'h7 == io_in_cnt ? 5'h5 : _GEN_6; // @[FFTDesigns.scala 3250:{17,17}]
  wire [4:0] _GEN_8 = 4'h8 == io_in_cnt ? 5'h8 : _GEN_7; // @[FFTDesigns.scala 3250:{17,17}]
  wire [4:0] _GEN_9 = 4'h9 == io_in_cnt ? 5'hb : _GEN_8; // @[FFTDesigns.scala 3250:{17,17}]
  wire [4:0] _GEN_10 = 4'ha == io_in_cnt ? 5'he : _GEN_9; // @[FFTDesigns.scala 3250:{17,17}]
  wire [4:0] _GEN_11 = 4'hb == io_in_cnt ? 5'h1 : _GEN_10; // @[FFTDesigns.scala 3250:{17,17}]
  wire [4:0] _GEN_12 = 4'hc == io_in_cnt ? 5'h4 : _GEN_11; // @[FFTDesigns.scala 3250:{17,17}]
  wire [4:0] _GEN_13 = 4'hd == io_in_cnt ? 5'h7 : _GEN_12; // @[FFTDesigns.scala 3250:{17,17}]
  wire [4:0] _GEN_14 = 4'he == io_in_cnt ? 5'ha : _GEN_13; // @[FFTDesigns.scala 3250:{17,17}]
  assign io_out_0 = 4'hf == io_in_cnt ? 5'hd : _GEN_14; // @[FFTDesigns.scala 3250:{17,17}]
  assign io_out_1 = 4'hf == io_in_cnt ? 5'hd : _GEN_14; // @[FFTDesigns.scala 3250:{17,17}]
  assign io_out_2 = 4'hf == io_in_cnt ? 5'hd : _GEN_14; // @[FFTDesigns.scala 3250:{17,17}]
  assign io_out_3 = 4'hf == io_in_cnt ? 5'hd : _GEN_14; // @[FFTDesigns.scala 3250:{17,17}]
  assign io_out_4 = 4'hf == io_in_cnt ? 5'hd : _GEN_14; // @[FFTDesigns.scala 3250:{17,17}]
  assign io_out_5 = 4'hf == io_in_cnt ? 5'hd : _GEN_14; // @[FFTDesigns.scala 3250:{17,17}]
endmodule
module Streaming_Permute_Config_7(
  input  [3:0] io_in_cnt,
  output [2:0] io_out_0,
  output [2:0] io_out_1,
  output [2:0] io_out_2,
  output [2:0] io_out_3,
  output [2:0] io_out_4
);
  wire [2:0] _GEN_6 = 4'h6 == io_in_cnt ? 3'h1 : 3'h0; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_7 = 4'h7 == io_in_cnt ? 3'h1 : _GEN_6; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_8 = 4'h8 == io_in_cnt ? 3'h1 : _GEN_7; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_9 = 4'h9 == io_in_cnt ? 3'h1 : _GEN_8; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_10 = 4'ha == io_in_cnt ? 3'h1 : _GEN_9; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_11 = 4'hb == io_in_cnt ? 3'h2 : _GEN_10; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_12 = 4'hc == io_in_cnt ? 3'h2 : _GEN_11; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_13 = 4'hd == io_in_cnt ? 3'h2 : _GEN_12; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_14 = 4'he == io_in_cnt ? 3'h2 : _GEN_13; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_22 = 4'h6 == io_in_cnt ? 3'h4 : 3'h3; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_23 = 4'h7 == io_in_cnt ? 3'h4 : _GEN_22; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_24 = 4'h8 == io_in_cnt ? 3'h4 : _GEN_23; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_25 = 4'h9 == io_in_cnt ? 3'h4 : _GEN_24; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_26 = 4'ha == io_in_cnt ? 3'h4 : _GEN_25; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_27 = 4'hb == io_in_cnt ? 3'h5 : _GEN_26; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_28 = 4'hc == io_in_cnt ? 3'h5 : _GEN_27; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_29 = 4'hd == io_in_cnt ? 3'h5 : _GEN_28; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_30 = 4'he == io_in_cnt ? 3'h5 : _GEN_29; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_38 = 4'h6 == io_in_cnt ? 3'h2 : 3'h1; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_39 = 4'h7 == io_in_cnt ? 3'h2 : _GEN_38; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_40 = 4'h8 == io_in_cnt ? 3'h2 : _GEN_39; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_41 = 4'h9 == io_in_cnt ? 3'h2 : _GEN_40; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_42 = 4'ha == io_in_cnt ? 3'h2 : _GEN_41; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_43 = 4'hb == io_in_cnt ? 3'h0 : _GEN_42; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_44 = 4'hc == io_in_cnt ? 3'h0 : _GEN_43; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_45 = 4'hd == io_in_cnt ? 3'h0 : _GEN_44; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_46 = 4'he == io_in_cnt ? 3'h0 : _GEN_45; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_54 = 4'h6 == io_in_cnt ? 3'h5 : 3'h4; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_55 = 4'h7 == io_in_cnt ? 3'h5 : _GEN_54; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_56 = 4'h8 == io_in_cnt ? 3'h5 : _GEN_55; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_57 = 4'h9 == io_in_cnt ? 3'h5 : _GEN_56; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_58 = 4'ha == io_in_cnt ? 3'h5 : _GEN_57; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_59 = 4'hb == io_in_cnt ? 3'h3 : _GEN_58; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_60 = 4'hc == io_in_cnt ? 3'h3 : _GEN_59; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_61 = 4'hd == io_in_cnt ? 3'h3 : _GEN_60; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_62 = 4'he == io_in_cnt ? 3'h3 : _GEN_61; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_70 = 4'h6 == io_in_cnt ? 3'h0 : 3'h2; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_71 = 4'h7 == io_in_cnt ? 3'h0 : _GEN_70; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_72 = 4'h8 == io_in_cnt ? 3'h0 : _GEN_71; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_73 = 4'h9 == io_in_cnt ? 3'h0 : _GEN_72; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_74 = 4'ha == io_in_cnt ? 3'h0 : _GEN_73; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_75 = 4'hb == io_in_cnt ? 3'h1 : _GEN_74; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_76 = 4'hc == io_in_cnt ? 3'h1 : _GEN_75; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_77 = 4'hd == io_in_cnt ? 3'h1 : _GEN_76; // @[FFTDesigns.scala 3273:{17,17}]
  wire [2:0] _GEN_78 = 4'he == io_in_cnt ? 3'h1 : _GEN_77; // @[FFTDesigns.scala 3273:{17,17}]
  assign io_out_0 = 4'hf == io_in_cnt ? 3'h2 : _GEN_14; // @[FFTDesigns.scala 3273:{17,17}]
  assign io_out_1 = 4'hf == io_in_cnt ? 3'h5 : _GEN_30; // @[FFTDesigns.scala 3273:{17,17}]
  assign io_out_2 = 4'hf == io_in_cnt ? 3'h0 : _GEN_46; // @[FFTDesigns.scala 3273:{17,17}]
  assign io_out_3 = 4'hf == io_in_cnt ? 3'h3 : _GEN_62; // @[FFTDesigns.scala 3273:{17,17}]
  assign io_out_4 = 4'hf == io_in_cnt ? 3'h1 : _GEN_78; // @[FFTDesigns.scala 3273:{17,17}]
endmodule
module PermutationsWithStreaming_mr(
  input         clock,
  input         reset,
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  input  [31:0] io_in_2_Re,
  input  [31:0] io_in_2_Im,
  input  [31:0] io_in_3_Re,
  input  [31:0] io_in_3_Im,
  input         io_in_en_0,
  input         io_in_en_1,
  input         io_in_en_2,
  input         io_in_en_3,
  input         io_in_en_4,
  input         io_in_en_5,
  input         io_in_en_6,
  input         io_in_en_7,
  input         io_in_en_8,
  input         io_in_en_9,
  input         io_in_en_10,
  input         io_in_en_11,
  input         io_in_en_12,
  input         io_in_en_13,
  input         io_in_en_14,
  input         io_in_en_15,
  input         io_in_en_16,
  input         io_in_en_17,
  input         io_in_en_18,
  input         io_in_en_19,
  input         io_in_en_20,
  input         io_in_en_21,
  input         io_in_en_22,
  input         io_in_en_23,
  input         io_in_en_24,
  input         io_in_en_25,
  input         io_in_en_26,
  input         io_in_en_27,
  input         io_in_en_28,
  input         io_in_en_29,
  input         io_in_en_30,
  input         io_in_en_31,
  input         io_in_en_32,
  input         io_in_en_33,
  input         io_in_en_34,
  input         io_in_en_35,
  input         io_in_en_36,
  input         io_in_en_37,
  input         io_in_en_38,
  input         io_in_en_39,
  input         io_in_en_40,
  input         io_in_en_41,
  input         io_in_en_42,
  input         io_in_en_43,
  input         io_in_en_44,
  input         io_in_en_45,
  input         io_in_en_46,
  input         io_in_en_47,
  input         io_in_en_48,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im,
  output [31:0] io_out_2_Re,
  output [31:0] io_out_2_Im,
  output [31:0] io_out_3_Re,
  output [31:0] io_out_3_Im,
  output [31:0] io_out_4_Re,
  output [31:0] io_out_4_Im,
  output [31:0] io_out_5_Re,
  output [31:0] io_out_5_Im
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  RAM_Block_clock; // @[FFTDesigns.scala 2713:26]
  wire [4:0] RAM_Block_io_in_raddr; // @[FFTDesigns.scala 2713:26]
  wire [4:0] RAM_Block_io_in_waddr; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_io_in_data_Re; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_io_in_data_Im; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_io_re; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_io_wr; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_io_en; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_io_out_data_Re; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_io_out_data_Im; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_1_clock; // @[FFTDesigns.scala 2713:26]
  wire [4:0] RAM_Block_1_io_in_raddr; // @[FFTDesigns.scala 2713:26]
  wire [4:0] RAM_Block_1_io_in_waddr; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_1_io_in_data_Re; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_1_io_in_data_Im; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_1_io_re; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_1_io_wr; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_1_io_en; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_1_io_out_data_Re; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_1_io_out_data_Im; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_2_clock; // @[FFTDesigns.scala 2713:26]
  wire [4:0] RAM_Block_2_io_in_raddr; // @[FFTDesigns.scala 2713:26]
  wire [4:0] RAM_Block_2_io_in_waddr; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_2_io_in_data_Re; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_2_io_in_data_Im; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_2_io_re; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_2_io_wr; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_2_io_en; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_2_io_out_data_Re; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_2_io_out_data_Im; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_3_clock; // @[FFTDesigns.scala 2713:26]
  wire [4:0] RAM_Block_3_io_in_raddr; // @[FFTDesigns.scala 2713:26]
  wire [4:0] RAM_Block_3_io_in_waddr; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_3_io_in_data_Re; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_3_io_in_data_Im; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_3_io_re; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_3_io_wr; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_3_io_en; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_3_io_out_data_Re; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_3_io_out_data_Im; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_4_clock; // @[FFTDesigns.scala 2713:26]
  wire [4:0] RAM_Block_4_io_in_raddr; // @[FFTDesigns.scala 2713:26]
  wire [4:0] RAM_Block_4_io_in_waddr; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_4_io_in_data_Re; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_4_io_in_data_Im; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_4_io_re; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_4_io_wr; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_4_io_en; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_4_io_out_data_Re; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_4_io_out_data_Im; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_5_clock; // @[FFTDesigns.scala 2713:26]
  wire [4:0] RAM_Block_5_io_in_raddr; // @[FFTDesigns.scala 2713:26]
  wire [4:0] RAM_Block_5_io_in_waddr; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_5_io_in_data_Re; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_5_io_in_data_Im; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_5_io_re; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_5_io_wr; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_5_io_en; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_5_io_out_data_Re; // @[FFTDesigns.scala 2713:26]
  wire [31:0] RAM_Block_5_io_out_data_Im; // @[FFTDesigns.scala 2713:26]
  wire  RAM_Block_6_clock; // @[FFTDesigns.scala 2717:26]
  wire [4:0] RAM_Block_6_io_in_raddr; // @[FFTDesigns.scala 2717:26]
  wire [4:0] RAM_Block_6_io_in_waddr; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_6_io_in_data_Re; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_6_io_in_data_Im; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_6_io_re; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_6_io_wr; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_6_io_en; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_6_io_out_data_Re; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_6_io_out_data_Im; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_7_clock; // @[FFTDesigns.scala 2717:26]
  wire [4:0] RAM_Block_7_io_in_raddr; // @[FFTDesigns.scala 2717:26]
  wire [4:0] RAM_Block_7_io_in_waddr; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_7_io_in_data_Re; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_7_io_in_data_Im; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_7_io_re; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_7_io_wr; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_7_io_en; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_7_io_out_data_Re; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_7_io_out_data_Im; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_8_clock; // @[FFTDesigns.scala 2717:26]
  wire [4:0] RAM_Block_8_io_in_raddr; // @[FFTDesigns.scala 2717:26]
  wire [4:0] RAM_Block_8_io_in_waddr; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_8_io_in_data_Re; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_8_io_in_data_Im; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_8_io_re; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_8_io_wr; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_8_io_en; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_8_io_out_data_Re; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_8_io_out_data_Im; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_9_clock; // @[FFTDesigns.scala 2717:26]
  wire [4:0] RAM_Block_9_io_in_raddr; // @[FFTDesigns.scala 2717:26]
  wire [4:0] RAM_Block_9_io_in_waddr; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_9_io_in_data_Re; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_9_io_in_data_Im; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_9_io_re; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_9_io_wr; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_9_io_en; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_9_io_out_data_Re; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_9_io_out_data_Im; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_10_clock; // @[FFTDesigns.scala 2717:26]
  wire [4:0] RAM_Block_10_io_in_raddr; // @[FFTDesigns.scala 2717:26]
  wire [4:0] RAM_Block_10_io_in_waddr; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_10_io_in_data_Re; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_10_io_in_data_Im; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_10_io_re; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_10_io_wr; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_10_io_en; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_10_io_out_data_Re; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_10_io_out_data_Im; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_11_clock; // @[FFTDesigns.scala 2717:26]
  wire [4:0] RAM_Block_11_io_in_raddr; // @[FFTDesigns.scala 2717:26]
  wire [4:0] RAM_Block_11_io_in_waddr; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_11_io_in_data_Re; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_11_io_in_data_Im; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_11_io_re; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_11_io_wr; // @[FFTDesigns.scala 2717:26]
  wire  RAM_Block_11_io_en; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_11_io_out_data_Re; // @[FFTDesigns.scala 2717:26]
  wire [31:0] RAM_Block_11_io_out_data_Im; // @[FFTDesigns.scala 2717:26]
  wire [31:0] PermutationModuleStreamed_io_in_0_Re; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_in_0_Im; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_in_1_Re; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_in_1_Im; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_in_2_Re; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_in_2_Im; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_in_3_Re; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_in_3_Im; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_in_4_Re; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_in_4_Im; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_in_5_Re; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_in_5_Im; // @[FFTDesigns.scala 2750:28]
  wire [2:0] PermutationModuleStreamed_io_in_config_0; // @[FFTDesigns.scala 2750:28]
  wire [2:0] PermutationModuleStreamed_io_in_config_1; // @[FFTDesigns.scala 2750:28]
  wire [2:0] PermutationModuleStreamed_io_in_config_2; // @[FFTDesigns.scala 2750:28]
  wire [2:0] PermutationModuleStreamed_io_in_config_3; // @[FFTDesigns.scala 2750:28]
  wire [2:0] PermutationModuleStreamed_io_in_config_4; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_out_0_Re; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_out_0_Im; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_out_1_Re; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_out_1_Im; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_out_2_Re; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_out_2_Im; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_out_3_Re; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_out_3_Im; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_out_4_Re; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_out_4_Im; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_out_5_Re; // @[FFTDesigns.scala 2750:28]
  wire [31:0] PermutationModuleStreamed_io_out_5_Im; // @[FFTDesigns.scala 2750:28]
  wire [3:0] M0_Config_ROM_io_in_cnt; // @[FFTDesigns.scala 2751:29]
  wire [4:0] M0_Config_ROM_io_out_0; // @[FFTDesigns.scala 2751:29]
  wire [4:0] M0_Config_ROM_io_out_1; // @[FFTDesigns.scala 2751:29]
  wire [4:0] M0_Config_ROM_io_out_2; // @[FFTDesigns.scala 2751:29]
  wire [4:0] M0_Config_ROM_io_out_3; // @[FFTDesigns.scala 2751:29]
  wire [4:0] M0_Config_ROM_io_out_4; // @[FFTDesigns.scala 2751:29]
  wire [4:0] M0_Config_ROM_io_out_5; // @[FFTDesigns.scala 2751:29]
  wire [3:0] M1_Config_ROM_io_in_cnt; // @[FFTDesigns.scala 2752:29]
  wire [4:0] M1_Config_ROM_io_out_0; // @[FFTDesigns.scala 2752:29]
  wire [4:0] M1_Config_ROM_io_out_1; // @[FFTDesigns.scala 2752:29]
  wire [4:0] M1_Config_ROM_io_out_2; // @[FFTDesigns.scala 2752:29]
  wire [4:0] M1_Config_ROM_io_out_3; // @[FFTDesigns.scala 2752:29]
  wire [4:0] M1_Config_ROM_io_out_4; // @[FFTDesigns.scala 2752:29]
  wire [4:0] M1_Config_ROM_io_out_5; // @[FFTDesigns.scala 2752:29]
  wire [3:0] Streaming_Permute_Config_io_in_cnt; // @[FFTDesigns.scala 2753:31]
  wire [2:0] Streaming_Permute_Config_io_out_0; // @[FFTDesigns.scala 2753:31]
  wire [2:0] Streaming_Permute_Config_io_out_1; // @[FFTDesigns.scala 2753:31]
  wire [2:0] Streaming_Permute_Config_io_out_2; // @[FFTDesigns.scala 2753:31]
  wire [2:0] Streaming_Permute_Config_io_out_3; // @[FFTDesigns.scala 2753:31]
  wire [2:0] Streaming_Permute_Config_io_out_4; // @[FFTDesigns.scala 2753:31]
  reg  offset_switch; // @[FFTDesigns.scala 2710:28]
  reg [3:0] cnt2; // @[FFTDesigns.scala 2755:25]
  reg [4:0] cnt; // @[FFTDesigns.scala 2756:24]
  wire [5:0] lo_lo_lo = {io_in_en_5,io_in_en_4,io_in_en_3,io_in_en_2,io_in_en_1,io_in_en_0}; // @[FFTDesigns.scala 2757:21]
  wire [11:0] lo_lo = {io_in_en_11,io_in_en_10,io_in_en_9,io_in_en_8,io_in_en_7,io_in_en_6,lo_lo_lo}; // @[FFTDesigns.scala 2757:21]
  wire [5:0] lo_hi_lo = {io_in_en_17,io_in_en_16,io_in_en_15,io_in_en_14,io_in_en_13,io_in_en_12}; // @[FFTDesigns.scala 2757:21]
  wire [23:0] lo = {io_in_en_23,io_in_en_22,io_in_en_21,io_in_en_20,io_in_en_19,io_in_en_18,lo_hi_lo,lo_lo}; // @[FFTDesigns.scala 2757:21]
  wire [5:0] hi_lo_lo = {io_in_en_29,io_in_en_28,io_in_en_27,io_in_en_26,io_in_en_25,io_in_en_24}; // @[FFTDesigns.scala 2757:21]
  wire [11:0] hi_lo = {io_in_en_35,io_in_en_34,io_in_en_33,io_in_en_32,io_in_en_31,io_in_en_30,hi_lo_lo}; // @[FFTDesigns.scala 2757:21]
  wire [5:0] hi_hi_lo = {io_in_en_41,io_in_en_40,io_in_en_39,io_in_en_38,io_in_en_37,io_in_en_36}; // @[FFTDesigns.scala 2757:21]
  wire [48:0] _T = {io_in_en_48,io_in_en_47,io_in_en_46,io_in_en_45,io_in_en_44,io_in_en_43,io_in_en_42,hi_hi_lo,hi_lo,
    lo}; // @[FFTDesigns.scala 2757:21]
  wire  M0_0_re = |_T; // @[FFTDesigns.scala 2757:28]
  wire  _T_2 = cnt2 == 4'hf; // @[FFTDesigns.scala 2758:19]
  wire  _offset_switch_T = ~offset_switch; // @[FFTDesigns.scala 2761:28]
  wire [4:0] _cnt_T_1 = cnt + 5'h1; // @[FFTDesigns.scala 2764:22]
  wire [3:0] _cnt2_T_1 = cnt2 + 4'h1; // @[FFTDesigns.scala 2767:24]
  wire  _GEN_5 = cnt2 == 4'hf & cnt == 5'h17 ? ~offset_switch : offset_switch; // @[FFTDesigns.scala 2758:69 2761:25]
  wire [5:0] _M0_0_in_raddr_T_1 = 5'h10 * _offset_switch_T; // @[FFTDesigns.scala 2778:56]
  wire [5:0] _GEN_412 = {{1'd0}, M0_Config_ROM_io_out_0}; // @[FFTDesigns.scala 2778:46]
  wire [5:0] _M0_0_in_raddr_T_3 = _GEN_412 + _M0_0_in_raddr_T_1; // @[FFTDesigns.scala 2778:46]
  wire [5:0] _GEN_413 = {{2'd0}, cnt2}; // @[FFTDesigns.scala 2781:34]
  wire [5:0] _M1_0_in_raddr_T_3 = _GEN_413 + _M0_0_in_raddr_T_1; // @[FFTDesigns.scala 2781:34]
  wire [5:0] _M1_0_in_waddr_T = 5'h10 * offset_switch; // @[FFTDesigns.scala 2782:56]
  wire [5:0] _GEN_414 = {{1'd0}, M1_Config_ROM_io_out_0}; // @[FFTDesigns.scala 2782:46]
  wire [5:0] _M1_0_in_waddr_T_2 = _GEN_414 + _M1_0_in_waddr_T; // @[FFTDesigns.scala 2782:46]
  wire [5:0] _GEN_415 = {{1'd0}, M0_Config_ROM_io_out_1}; // @[FFTDesigns.scala 2778:46]
  wire [5:0] _M0_1_in_raddr_T_3 = _GEN_415 + _M0_0_in_raddr_T_1; // @[FFTDesigns.scala 2778:46]
  wire [5:0] _GEN_417 = {{1'd0}, M1_Config_ROM_io_out_1}; // @[FFTDesigns.scala 2782:46]
  wire [5:0] _M1_1_in_waddr_T_2 = _GEN_417 + _M1_0_in_waddr_T; // @[FFTDesigns.scala 2782:46]
  wire [5:0] _GEN_418 = {{1'd0}, M0_Config_ROM_io_out_2}; // @[FFTDesigns.scala 2778:46]
  wire [5:0] _M0_2_in_raddr_T_3 = _GEN_418 + _M0_0_in_raddr_T_1; // @[FFTDesigns.scala 2778:46]
  wire [5:0] _GEN_420 = {{1'd0}, M1_Config_ROM_io_out_2}; // @[FFTDesigns.scala 2782:46]
  wire [5:0] _M1_2_in_waddr_T_2 = _GEN_420 + _M1_0_in_waddr_T; // @[FFTDesigns.scala 2782:46]
  wire [5:0] _GEN_421 = {{1'd0}, M0_Config_ROM_io_out_3}; // @[FFTDesigns.scala 2778:46]
  wire [5:0] _M0_3_in_raddr_T_3 = _GEN_421 + _M0_0_in_raddr_T_1; // @[FFTDesigns.scala 2778:46]
  wire [5:0] _GEN_423 = {{1'd0}, M1_Config_ROM_io_out_3}; // @[FFTDesigns.scala 2782:46]
  wire [5:0] _M1_3_in_waddr_T_2 = _GEN_423 + _M1_0_in_waddr_T; // @[FFTDesigns.scala 2782:46]
  wire [5:0] _GEN_424 = {{1'd0}, M0_Config_ROM_io_out_4}; // @[FFTDesigns.scala 2778:46]
  wire [5:0] _M0_4_in_raddr_T_3 = _GEN_424 + _M0_0_in_raddr_T_1; // @[FFTDesigns.scala 2778:46]
  wire [5:0] _GEN_426 = {{1'd0}, M1_Config_ROM_io_out_4}; // @[FFTDesigns.scala 2782:46]
  wire [5:0] _M1_4_in_waddr_T_2 = _GEN_426 + _M1_0_in_waddr_T; // @[FFTDesigns.scala 2782:46]
  wire [5:0] _GEN_427 = {{1'd0}, M0_Config_ROM_io_out_5}; // @[FFTDesigns.scala 2778:46]
  wire [5:0] _M0_5_in_raddr_T_3 = _GEN_427 + _M0_0_in_raddr_T_1; // @[FFTDesigns.scala 2778:46]
  wire [5:0] _GEN_429 = {{1'd0}, M1_Config_ROM_io_out_5}; // @[FFTDesigns.scala 2782:46]
  wire [5:0] _M1_5_in_waddr_T_2 = _GEN_429 + _M1_0_in_waddr_T; // @[FFTDesigns.scala 2782:46]
  wire [3:0] _GEN_7 = 5'h1 == cnt ? 4'h4 : 4'h0; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_8 = 5'h2 == cnt ? 4'h2 : _GEN_7; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_9 = 5'h3 == cnt ? 4'h0 : _GEN_8; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_10 = 5'h4 == cnt ? 4'h4 : _GEN_9; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_11 = 5'h5 == cnt ? 4'h2 : _GEN_10; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_12 = 5'h6 == cnt ? 4'h0 : _GEN_11; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_13 = 5'h7 == cnt ? 4'h4 : _GEN_12; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_14 = 5'h8 == cnt ? 4'h2 : _GEN_13; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_15 = 5'h9 == cnt ? 4'h0 : _GEN_14; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_16 = 5'ha == cnt ? 4'h4 : _GEN_15; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_17 = 5'hb == cnt ? 4'h2 : _GEN_16; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_18 = 5'hc == cnt ? 4'h0 : _GEN_17; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_19 = 5'hd == cnt ? 4'h4 : _GEN_18; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_20 = 5'he == cnt ? 4'h2 : _GEN_19; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_21 = 5'hf == cnt ? 4'h0 : _GEN_20; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_22 = 5'h10 == cnt ? 4'h4 : _GEN_21; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_23 = 5'h11 == cnt ? 4'h2 : _GEN_22; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_24 = 5'h12 == cnt ? 4'h0 : _GEN_23; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_25 = 5'h13 == cnt ? 4'h4 : _GEN_24; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_26 = 5'h14 == cnt ? 4'h2 : _GEN_25; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_27 = 5'h15 == cnt ? 4'h0 : _GEN_26; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_28 = 5'h16 == cnt ? 4'h4 : _GEN_27; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_29 = 5'h17 == cnt ? 4'h2 : _GEN_28; // @[FFTDesigns.scala 2797:{35,35}]
  wire [5:0] _GEN_32 = 5'h2 == cnt ? 6'h1 : 6'h0; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_33 = 5'h3 == cnt ? 6'h2 : _GEN_32; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_34 = 5'h4 == cnt ? 6'h2 : _GEN_33; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_35 = 5'h5 == cnt ? 6'h3 : _GEN_34; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_36 = 5'h6 == cnt ? 6'h4 : _GEN_35; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_37 = 5'h7 == cnt ? 6'h4 : _GEN_36; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_38 = 5'h8 == cnt ? 6'h5 : _GEN_37; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_39 = 5'h9 == cnt ? 6'h6 : _GEN_38; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_40 = 5'ha == cnt ? 6'h6 : _GEN_39; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_41 = 5'hb == cnt ? 6'h7 : _GEN_40; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_42 = 5'hc == cnt ? 6'h8 : _GEN_41; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_43 = 5'hd == cnt ? 6'h8 : _GEN_42; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_44 = 5'he == cnt ? 6'h9 : _GEN_43; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_45 = 5'hf == cnt ? 6'ha : _GEN_44; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_46 = 5'h10 == cnt ? 6'ha : _GEN_45; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_47 = 5'h11 == cnt ? 6'hb : _GEN_46; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_48 = 5'h12 == cnt ? 6'hc : _GEN_47; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_49 = 5'h13 == cnt ? 6'hc : _GEN_48; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_50 = 5'h14 == cnt ? 6'hd : _GEN_49; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_51 = 5'h15 == cnt ? 6'he : _GEN_50; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_52 = 5'h16 == cnt ? 6'he : _GEN_51; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_53 = 5'h17 == cnt ? 6'hf : _GEN_52; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _M0_0_in_waddr_T_2 = _GEN_53 + _M1_0_in_waddr_T; // @[FFTDesigns.scala 2799:50]
  wire [5:0] _GEN_55 = _GEN_29 == 4'h0 ? _M0_0_in_waddr_T_2 : 6'h0; // @[FFTDesigns.scala 2791:26 2797:44 2799:30]
  wire [31:0] _GEN_56 = _GEN_29 == 4'h0 ? io_in_0_Im : 32'h0; // @[FFTDesigns.scala 2792:25 2797:44 2800:29]
  wire [31:0] _GEN_57 = _GEN_29 == 4'h0 ? io_in_0_Re : 32'h0; // @[FFTDesigns.scala 2792:25 2797:44 2800:29]
  wire [3:0] _GEN_60 = 5'h1 == cnt ? 4'h5 : 4'h1; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_61 = 5'h2 == cnt ? 4'h3 : _GEN_60; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_62 = 5'h3 == cnt ? 4'h1 : _GEN_61; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_63 = 5'h4 == cnt ? 4'h5 : _GEN_62; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_64 = 5'h5 == cnt ? 4'h3 : _GEN_63; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_65 = 5'h6 == cnt ? 4'h1 : _GEN_64; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_66 = 5'h7 == cnt ? 4'h5 : _GEN_65; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_67 = 5'h8 == cnt ? 4'h3 : _GEN_66; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_68 = 5'h9 == cnt ? 4'h1 : _GEN_67; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_69 = 5'ha == cnt ? 4'h5 : _GEN_68; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_70 = 5'hb == cnt ? 4'h3 : _GEN_69; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_71 = 5'hc == cnt ? 4'h1 : _GEN_70; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_72 = 5'hd == cnt ? 4'h5 : _GEN_71; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_73 = 5'he == cnt ? 4'h3 : _GEN_72; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_74 = 5'hf == cnt ? 4'h1 : _GEN_73; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_75 = 5'h10 == cnt ? 4'h5 : _GEN_74; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_76 = 5'h11 == cnt ? 4'h3 : _GEN_75; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_77 = 5'h12 == cnt ? 4'h1 : _GEN_76; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_78 = 5'h13 == cnt ? 4'h5 : _GEN_77; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_79 = 5'h14 == cnt ? 4'h3 : _GEN_78; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_80 = 5'h15 == cnt ? 4'h1 : _GEN_79; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_81 = 5'h16 == cnt ? 4'h5 : _GEN_80; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_82 = 5'h17 == cnt ? 4'h3 : _GEN_81; // @[FFTDesigns.scala 2797:{35,35}]
  wire [5:0] _GEN_108 = _GEN_82 == 4'h0 ? _M0_0_in_waddr_T_2 : _GEN_55; // @[FFTDesigns.scala 2797:44 2799:30]
  wire [31:0] _GEN_109 = _GEN_82 == 4'h0 ? io_in_1_Im : _GEN_56; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [31:0] _GEN_110 = _GEN_82 == 4'h0 ? io_in_1_Re : _GEN_57; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [3:0] _GEN_113 = 5'h1 == cnt ? 4'h0 : 4'h2; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_114 = 5'h2 == cnt ? 4'h4 : _GEN_113; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_115 = 5'h3 == cnt ? 4'h2 : _GEN_114; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_116 = 5'h4 == cnt ? 4'h0 : _GEN_115; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_117 = 5'h5 == cnt ? 4'h4 : _GEN_116; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_118 = 5'h6 == cnt ? 4'h2 : _GEN_117; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_119 = 5'h7 == cnt ? 4'h0 : _GEN_118; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_120 = 5'h8 == cnt ? 4'h4 : _GEN_119; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_121 = 5'h9 == cnt ? 4'h2 : _GEN_120; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_122 = 5'ha == cnt ? 4'h0 : _GEN_121; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_123 = 5'hb == cnt ? 4'h4 : _GEN_122; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_124 = 5'hc == cnt ? 4'h2 : _GEN_123; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_125 = 5'hd == cnt ? 4'h0 : _GEN_124; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_126 = 5'he == cnt ? 4'h4 : _GEN_125; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_127 = 5'hf == cnt ? 4'h2 : _GEN_126; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_128 = 5'h10 == cnt ? 4'h0 : _GEN_127; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_129 = 5'h11 == cnt ? 4'h4 : _GEN_128; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_130 = 5'h12 == cnt ? 4'h2 : _GEN_129; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_131 = 5'h13 == cnt ? 4'h0 : _GEN_130; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_132 = 5'h14 == cnt ? 4'h4 : _GEN_131; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_133 = 5'h15 == cnt ? 4'h2 : _GEN_132; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_134 = 5'h16 == cnt ? 4'h0 : _GEN_133; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_135 = 5'h17 == cnt ? 4'h4 : _GEN_134; // @[FFTDesigns.scala 2797:{35,35}]
  wire [5:0] _GEN_137 = 5'h1 == cnt ? 6'h1 : 6'h0; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_138 = 5'h2 == cnt ? 6'h1 : _GEN_137; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_139 = 5'h3 == cnt ? 6'h2 : _GEN_138; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_140 = 5'h4 == cnt ? 6'h3 : _GEN_139; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_141 = 5'h5 == cnt ? 6'h3 : _GEN_140; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_142 = 5'h6 == cnt ? 6'h4 : _GEN_141; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_143 = 5'h7 == cnt ? 6'h5 : _GEN_142; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_144 = 5'h8 == cnt ? 6'h5 : _GEN_143; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_145 = 5'h9 == cnt ? 6'h6 : _GEN_144; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_146 = 5'ha == cnt ? 6'h7 : _GEN_145; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_147 = 5'hb == cnt ? 6'h7 : _GEN_146; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_148 = 5'hc == cnt ? 6'h8 : _GEN_147; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_149 = 5'hd == cnt ? 6'h9 : _GEN_148; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_150 = 5'he == cnt ? 6'h9 : _GEN_149; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_151 = 5'hf == cnt ? 6'ha : _GEN_150; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_152 = 5'h10 == cnt ? 6'hb : _GEN_151; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_153 = 5'h11 == cnt ? 6'hb : _GEN_152; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_154 = 5'h12 == cnt ? 6'hc : _GEN_153; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_155 = 5'h13 == cnt ? 6'hd : _GEN_154; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_156 = 5'h14 == cnt ? 6'hd : _GEN_155; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_157 = 5'h15 == cnt ? 6'he : _GEN_156; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_158 = 5'h16 == cnt ? 6'hf : _GEN_157; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _GEN_159 = 5'h17 == cnt ? 6'hf : _GEN_158; // @[FFTDesigns.scala 2799:{50,50}]
  wire [5:0] _M0_0_in_waddr_T_8 = _GEN_159 + _M1_0_in_waddr_T; // @[FFTDesigns.scala 2799:50]
  wire [5:0] _GEN_161 = _GEN_135 == 4'h0 ? _M0_0_in_waddr_T_8 : _GEN_108; // @[FFTDesigns.scala 2797:44 2799:30]
  wire [31:0] _GEN_162 = _GEN_135 == 4'h0 ? io_in_2_Im : _GEN_109; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [31:0] _GEN_163 = _GEN_135 == 4'h0 ? io_in_2_Re : _GEN_110; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [3:0] _GEN_166 = 5'h1 == cnt ? 4'h1 : 4'h3; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_167 = 5'h2 == cnt ? 4'h5 : _GEN_166; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_168 = 5'h3 == cnt ? 4'h3 : _GEN_167; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_169 = 5'h4 == cnt ? 4'h1 : _GEN_168; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_170 = 5'h5 == cnt ? 4'h5 : _GEN_169; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_171 = 5'h6 == cnt ? 4'h3 : _GEN_170; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_172 = 5'h7 == cnt ? 4'h1 : _GEN_171; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_173 = 5'h8 == cnt ? 4'h5 : _GEN_172; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_174 = 5'h9 == cnt ? 4'h3 : _GEN_173; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_175 = 5'ha == cnt ? 4'h1 : _GEN_174; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_176 = 5'hb == cnt ? 4'h5 : _GEN_175; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_177 = 5'hc == cnt ? 4'h3 : _GEN_176; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_178 = 5'hd == cnt ? 4'h1 : _GEN_177; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_179 = 5'he == cnt ? 4'h5 : _GEN_178; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_180 = 5'hf == cnt ? 4'h3 : _GEN_179; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_181 = 5'h10 == cnt ? 4'h1 : _GEN_180; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_182 = 5'h11 == cnt ? 4'h5 : _GEN_181; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_183 = 5'h12 == cnt ? 4'h3 : _GEN_182; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_184 = 5'h13 == cnt ? 4'h1 : _GEN_183; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_185 = 5'h14 == cnt ? 4'h5 : _GEN_184; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_186 = 5'h15 == cnt ? 4'h3 : _GEN_185; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_187 = 5'h16 == cnt ? 4'h1 : _GEN_186; // @[FFTDesigns.scala 2797:{35,35}]
  wire [3:0] _GEN_188 = 5'h17 == cnt ? 4'h5 : _GEN_187; // @[FFTDesigns.scala 2797:{35,35}]
  wire  _GEN_213 = _GEN_188 == 4'h0 | (_GEN_135 == 4'h0 | (_GEN_82 == 4'h0 | _GEN_29 == 4'h0)); // @[FFTDesigns.scala 2797:44 2798:24]
  wire [5:0] _GEN_214 = _GEN_188 == 4'h0 ? _M0_0_in_waddr_T_8 : _GEN_161; // @[FFTDesigns.scala 2797:44 2799:30]
  wire [31:0] _GEN_215 = _GEN_188 == 4'h0 ? io_in_3_Im : _GEN_162; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [31:0] _GEN_216 = _GEN_188 == 4'h0 ? io_in_3_Re : _GEN_163; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [5:0] _GEN_219 = _GEN_29 == 4'h1 ? _M0_0_in_waddr_T_2 : 6'h0; // @[FFTDesigns.scala 2791:26 2797:44 2799:30]
  wire [31:0] _GEN_220 = _GEN_29 == 4'h1 ? io_in_0_Im : 32'h0; // @[FFTDesigns.scala 2792:25 2797:44 2800:29]
  wire [31:0] _GEN_221 = _GEN_29 == 4'h1 ? io_in_0_Re : 32'h0; // @[FFTDesigns.scala 2792:25 2797:44 2800:29]
  wire [5:0] _GEN_224 = _GEN_82 == 4'h1 ? _M0_0_in_waddr_T_2 : _GEN_219; // @[FFTDesigns.scala 2797:44 2799:30]
  wire [31:0] _GEN_225 = _GEN_82 == 4'h1 ? io_in_1_Im : _GEN_220; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [31:0] _GEN_226 = _GEN_82 == 4'h1 ? io_in_1_Re : _GEN_221; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [5:0] _GEN_229 = _GEN_135 == 4'h1 ? _M0_0_in_waddr_T_8 : _GEN_224; // @[FFTDesigns.scala 2797:44 2799:30]
  wire [31:0] _GEN_230 = _GEN_135 == 4'h1 ? io_in_2_Im : _GEN_225; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [31:0] _GEN_231 = _GEN_135 == 4'h1 ? io_in_2_Re : _GEN_226; // @[FFTDesigns.scala 2797:44 2800:29]
  wire  _GEN_233 = _GEN_188 == 4'h1 | (_GEN_135 == 4'h1 | (_GEN_82 == 4'h1 | _GEN_29 == 4'h1)); // @[FFTDesigns.scala 2797:44 2798:24]
  wire [5:0] _GEN_234 = _GEN_188 == 4'h1 ? _M0_0_in_waddr_T_8 : _GEN_229; // @[FFTDesigns.scala 2797:44 2799:30]
  wire [31:0] _GEN_235 = _GEN_188 == 4'h1 ? io_in_3_Im : _GEN_230; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [31:0] _GEN_236 = _GEN_188 == 4'h1 ? io_in_3_Re : _GEN_231; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [5:0] _GEN_239 = _GEN_29 == 4'h2 ? _M0_0_in_waddr_T_2 : 6'h0; // @[FFTDesigns.scala 2791:26 2797:44 2799:30]
  wire [31:0] _GEN_240 = _GEN_29 == 4'h2 ? io_in_0_Im : 32'h0; // @[FFTDesigns.scala 2792:25 2797:44 2800:29]
  wire [31:0] _GEN_241 = _GEN_29 == 4'h2 ? io_in_0_Re : 32'h0; // @[FFTDesigns.scala 2792:25 2797:44 2800:29]
  wire [5:0] _GEN_244 = _GEN_82 == 4'h2 ? _M0_0_in_waddr_T_2 : _GEN_239; // @[FFTDesigns.scala 2797:44 2799:30]
  wire [31:0] _GEN_245 = _GEN_82 == 4'h2 ? io_in_1_Im : _GEN_240; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [31:0] _GEN_246 = _GEN_82 == 4'h2 ? io_in_1_Re : _GEN_241; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [5:0] _GEN_249 = _GEN_135 == 4'h2 ? _M0_0_in_waddr_T_8 : _GEN_244; // @[FFTDesigns.scala 2797:44 2799:30]
  wire [31:0] _GEN_250 = _GEN_135 == 4'h2 ? io_in_2_Im : _GEN_245; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [31:0] _GEN_251 = _GEN_135 == 4'h2 ? io_in_2_Re : _GEN_246; // @[FFTDesigns.scala 2797:44 2800:29]
  wire  _GEN_253 = _GEN_188 == 4'h2 | (_GEN_135 == 4'h2 | (_GEN_82 == 4'h2 | _GEN_29 == 4'h2)); // @[FFTDesigns.scala 2797:44 2798:24]
  wire [5:0] _GEN_254 = _GEN_188 == 4'h2 ? _M0_0_in_waddr_T_8 : _GEN_249; // @[FFTDesigns.scala 2797:44 2799:30]
  wire [31:0] _GEN_255 = _GEN_188 == 4'h2 ? io_in_3_Im : _GEN_250; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [31:0] _GEN_256 = _GEN_188 == 4'h2 ? io_in_3_Re : _GEN_251; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [5:0] _GEN_259 = _GEN_29 == 4'h3 ? _M0_0_in_waddr_T_2 : 6'h0; // @[FFTDesigns.scala 2791:26 2797:44 2799:30]
  wire [31:0] _GEN_260 = _GEN_29 == 4'h3 ? io_in_0_Im : 32'h0; // @[FFTDesigns.scala 2792:25 2797:44 2800:29]
  wire [31:0] _GEN_261 = _GEN_29 == 4'h3 ? io_in_0_Re : 32'h0; // @[FFTDesigns.scala 2792:25 2797:44 2800:29]
  wire [5:0] _GEN_264 = _GEN_82 == 4'h3 ? _M0_0_in_waddr_T_2 : _GEN_259; // @[FFTDesigns.scala 2797:44 2799:30]
  wire [31:0] _GEN_265 = _GEN_82 == 4'h3 ? io_in_1_Im : _GEN_260; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [31:0] _GEN_266 = _GEN_82 == 4'h3 ? io_in_1_Re : _GEN_261; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [5:0] _GEN_269 = _GEN_135 == 4'h3 ? _M0_0_in_waddr_T_8 : _GEN_264; // @[FFTDesigns.scala 2797:44 2799:30]
  wire [31:0] _GEN_270 = _GEN_135 == 4'h3 ? io_in_2_Im : _GEN_265; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [31:0] _GEN_271 = _GEN_135 == 4'h3 ? io_in_2_Re : _GEN_266; // @[FFTDesigns.scala 2797:44 2800:29]
  wire  _GEN_273 = _GEN_188 == 4'h3 | (_GEN_135 == 4'h3 | (_GEN_82 == 4'h3 | _GEN_29 == 4'h3)); // @[FFTDesigns.scala 2797:44 2798:24]
  wire [5:0] _GEN_274 = _GEN_188 == 4'h3 ? _M0_0_in_waddr_T_8 : _GEN_269; // @[FFTDesigns.scala 2797:44 2799:30]
  wire [31:0] _GEN_275 = _GEN_188 == 4'h3 ? io_in_3_Im : _GEN_270; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [31:0] _GEN_276 = _GEN_188 == 4'h3 ? io_in_3_Re : _GEN_271; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [5:0] _GEN_279 = _GEN_29 == 4'h4 ? _M0_0_in_waddr_T_2 : 6'h0; // @[FFTDesigns.scala 2791:26 2797:44 2799:30]
  wire [31:0] _GEN_280 = _GEN_29 == 4'h4 ? io_in_0_Im : 32'h0; // @[FFTDesigns.scala 2792:25 2797:44 2800:29]
  wire [31:0] _GEN_281 = _GEN_29 == 4'h4 ? io_in_0_Re : 32'h0; // @[FFTDesigns.scala 2792:25 2797:44 2800:29]
  wire [5:0] _GEN_284 = _GEN_82 == 4'h4 ? _M0_0_in_waddr_T_2 : _GEN_279; // @[FFTDesigns.scala 2797:44 2799:30]
  wire [31:0] _GEN_285 = _GEN_82 == 4'h4 ? io_in_1_Im : _GEN_280; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [31:0] _GEN_286 = _GEN_82 == 4'h4 ? io_in_1_Re : _GEN_281; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [5:0] _GEN_289 = _GEN_135 == 4'h4 ? _M0_0_in_waddr_T_8 : _GEN_284; // @[FFTDesigns.scala 2797:44 2799:30]
  wire [31:0] _GEN_290 = _GEN_135 == 4'h4 ? io_in_2_Im : _GEN_285; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [31:0] _GEN_291 = _GEN_135 == 4'h4 ? io_in_2_Re : _GEN_286; // @[FFTDesigns.scala 2797:44 2800:29]
  wire  _GEN_293 = _GEN_188 == 4'h4 | (_GEN_135 == 4'h4 | (_GEN_82 == 4'h4 | _GEN_29 == 4'h4)); // @[FFTDesigns.scala 2797:44 2798:24]
  wire [5:0] _GEN_294 = _GEN_188 == 4'h4 ? _M0_0_in_waddr_T_8 : _GEN_289; // @[FFTDesigns.scala 2797:44 2799:30]
  wire [31:0] _GEN_295 = _GEN_188 == 4'h4 ? io_in_3_Im : _GEN_290; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [31:0] _GEN_296 = _GEN_188 == 4'h4 ? io_in_3_Re : _GEN_291; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [5:0] _GEN_299 = _GEN_29 == 4'h5 ? _M0_0_in_waddr_T_2 : 6'h0; // @[FFTDesigns.scala 2791:26 2797:44 2799:30]
  wire [31:0] _GEN_300 = _GEN_29 == 4'h5 ? io_in_0_Im : 32'h0; // @[FFTDesigns.scala 2792:25 2797:44 2800:29]
  wire [31:0] _GEN_301 = _GEN_29 == 4'h5 ? io_in_0_Re : 32'h0; // @[FFTDesigns.scala 2792:25 2797:44 2800:29]
  wire [5:0] _GEN_304 = _GEN_82 == 4'h5 ? _M0_0_in_waddr_T_2 : _GEN_299; // @[FFTDesigns.scala 2797:44 2799:30]
  wire [31:0] _GEN_305 = _GEN_82 == 4'h5 ? io_in_1_Im : _GEN_300; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [31:0] _GEN_306 = _GEN_82 == 4'h5 ? io_in_1_Re : _GEN_301; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [5:0] _GEN_309 = _GEN_135 == 4'h5 ? _M0_0_in_waddr_T_8 : _GEN_304; // @[FFTDesigns.scala 2797:44 2799:30]
  wire [31:0] _GEN_310 = _GEN_135 == 4'h5 ? io_in_2_Im : _GEN_305; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [31:0] _GEN_311 = _GEN_135 == 4'h5 ? io_in_2_Re : _GEN_306; // @[FFTDesigns.scala 2797:44 2800:29]
  wire  _GEN_313 = _GEN_188 == 4'h5 | (_GEN_135 == 4'h5 | (_GEN_82 == 4'h5 | _GEN_29 == 4'h5)); // @[FFTDesigns.scala 2797:44 2798:24]
  wire [5:0] _GEN_314 = _GEN_188 == 4'h5 ? _M0_0_in_waddr_T_8 : _GEN_309; // @[FFTDesigns.scala 2797:44 2799:30]
  wire [31:0] _GEN_315 = _GEN_188 == 4'h5 ? io_in_3_Im : _GEN_310; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [31:0] _GEN_316 = _GEN_188 == 4'h5 ? io_in_3_Re : _GEN_311; // @[FFTDesigns.scala 2797:44 2800:29]
  wire [5:0] _GEN_322 = M0_0_re ? _M0_0_in_raddr_T_3 : 6'h0; // @[FFTDesigns.scala 2757:33 2778:26 2813:26]
  wire [5:0] _GEN_323 = M0_0_re ? _M1_0_in_raddr_T_3 : 6'h0; // @[FFTDesigns.scala 2757:33 2781:26 2816:26]
  wire [5:0] _GEN_324 = M0_0_re ? _M1_0_in_waddr_T_2 : 6'h0; // @[FFTDesigns.scala 2757:33 2782:26 2817:26]
  wire [5:0] _GEN_332 = M0_0_re ? _M0_1_in_raddr_T_3 : 6'h0; // @[FFTDesigns.scala 2757:33 2778:26 2813:26]
  wire [5:0] _GEN_334 = M0_0_re ? _M1_1_in_waddr_T_2 : 6'h0; // @[FFTDesigns.scala 2757:33 2782:26 2817:26]
  wire [5:0] _GEN_342 = M0_0_re ? _M0_2_in_raddr_T_3 : 6'h0; // @[FFTDesigns.scala 2757:33 2778:26 2813:26]
  wire [5:0] _GEN_344 = M0_0_re ? _M1_2_in_waddr_T_2 : 6'h0; // @[FFTDesigns.scala 2757:33 2782:26 2817:26]
  wire [5:0] _GEN_352 = M0_0_re ? _M0_3_in_raddr_T_3 : 6'h0; // @[FFTDesigns.scala 2757:33 2778:26 2813:26]
  wire [5:0] _GEN_354 = M0_0_re ? _M1_3_in_waddr_T_2 : 6'h0; // @[FFTDesigns.scala 2757:33 2782:26 2817:26]
  wire [5:0] _GEN_362 = M0_0_re ? _M0_4_in_raddr_T_3 : 6'h0; // @[FFTDesigns.scala 2757:33 2778:26 2813:26]
  wire [5:0] _GEN_364 = M0_0_re ? _M1_4_in_waddr_T_2 : 6'h0; // @[FFTDesigns.scala 2757:33 2782:26 2817:26]
  wire [5:0] _GEN_372 = M0_0_re ? _M0_5_in_raddr_T_3 : 6'h0; // @[FFTDesigns.scala 2757:33 2778:26 2813:26]
  wire [5:0] _GEN_374 = M0_0_re ? _M1_5_in_waddr_T_2 : 6'h0; // @[FFTDesigns.scala 2757:33 2782:26 2817:26]
  wire [5:0] _GEN_383 = M0_0_re ? _GEN_214 : 6'h0; // @[FFTDesigns.scala 2757:33 2814:26]
  wire [5:0] _GEN_388 = M0_0_re ? _GEN_234 : 6'h0; // @[FFTDesigns.scala 2757:33 2814:26]
  wire [5:0] _GEN_393 = M0_0_re ? _GEN_254 : 6'h0; // @[FFTDesigns.scala 2757:33 2814:26]
  wire [5:0] _GEN_398 = M0_0_re ? _GEN_274 : 6'h0; // @[FFTDesigns.scala 2757:33 2814:26]
  wire [5:0] _GEN_403 = M0_0_re ? _GEN_294 : 6'h0; // @[FFTDesigns.scala 2757:33 2814:26]
  wire [5:0] _GEN_408 = M0_0_re ? _GEN_314 : 6'h0; // @[FFTDesigns.scala 2757:33 2814:26]
  RAM_Block_56 RAM_Block ( // @[FFTDesigns.scala 2713:26]
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
  RAM_Block_56 RAM_Block_1 ( // @[FFTDesigns.scala 2713:26]
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
  RAM_Block_56 RAM_Block_2 ( // @[FFTDesigns.scala 2713:26]
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
  RAM_Block_56 RAM_Block_3 ( // @[FFTDesigns.scala 2713:26]
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
  RAM_Block_56 RAM_Block_4 ( // @[FFTDesigns.scala 2713:26]
    .clock(RAM_Block_4_clock),
    .io_in_raddr(RAM_Block_4_io_in_raddr),
    .io_in_waddr(RAM_Block_4_io_in_waddr),
    .io_in_data_Re(RAM_Block_4_io_in_data_Re),
    .io_in_data_Im(RAM_Block_4_io_in_data_Im),
    .io_re(RAM_Block_4_io_re),
    .io_wr(RAM_Block_4_io_wr),
    .io_en(RAM_Block_4_io_en),
    .io_out_data_Re(RAM_Block_4_io_out_data_Re),
    .io_out_data_Im(RAM_Block_4_io_out_data_Im)
  );
  RAM_Block_56 RAM_Block_5 ( // @[FFTDesigns.scala 2713:26]
    .clock(RAM_Block_5_clock),
    .io_in_raddr(RAM_Block_5_io_in_raddr),
    .io_in_waddr(RAM_Block_5_io_in_waddr),
    .io_in_data_Re(RAM_Block_5_io_in_data_Re),
    .io_in_data_Im(RAM_Block_5_io_in_data_Im),
    .io_re(RAM_Block_5_io_re),
    .io_wr(RAM_Block_5_io_wr),
    .io_en(RAM_Block_5_io_en),
    .io_out_data_Re(RAM_Block_5_io_out_data_Re),
    .io_out_data_Im(RAM_Block_5_io_out_data_Im)
  );
  RAM_Block_56 RAM_Block_6 ( // @[FFTDesigns.scala 2717:26]
    .clock(RAM_Block_6_clock),
    .io_in_raddr(RAM_Block_6_io_in_raddr),
    .io_in_waddr(RAM_Block_6_io_in_waddr),
    .io_in_data_Re(RAM_Block_6_io_in_data_Re),
    .io_in_data_Im(RAM_Block_6_io_in_data_Im),
    .io_re(RAM_Block_6_io_re),
    .io_wr(RAM_Block_6_io_wr),
    .io_en(RAM_Block_6_io_en),
    .io_out_data_Re(RAM_Block_6_io_out_data_Re),
    .io_out_data_Im(RAM_Block_6_io_out_data_Im)
  );
  RAM_Block_56 RAM_Block_7 ( // @[FFTDesigns.scala 2717:26]
    .clock(RAM_Block_7_clock),
    .io_in_raddr(RAM_Block_7_io_in_raddr),
    .io_in_waddr(RAM_Block_7_io_in_waddr),
    .io_in_data_Re(RAM_Block_7_io_in_data_Re),
    .io_in_data_Im(RAM_Block_7_io_in_data_Im),
    .io_re(RAM_Block_7_io_re),
    .io_wr(RAM_Block_7_io_wr),
    .io_en(RAM_Block_7_io_en),
    .io_out_data_Re(RAM_Block_7_io_out_data_Re),
    .io_out_data_Im(RAM_Block_7_io_out_data_Im)
  );
  RAM_Block_56 RAM_Block_8 ( // @[FFTDesigns.scala 2717:26]
    .clock(RAM_Block_8_clock),
    .io_in_raddr(RAM_Block_8_io_in_raddr),
    .io_in_waddr(RAM_Block_8_io_in_waddr),
    .io_in_data_Re(RAM_Block_8_io_in_data_Re),
    .io_in_data_Im(RAM_Block_8_io_in_data_Im),
    .io_re(RAM_Block_8_io_re),
    .io_wr(RAM_Block_8_io_wr),
    .io_en(RAM_Block_8_io_en),
    .io_out_data_Re(RAM_Block_8_io_out_data_Re),
    .io_out_data_Im(RAM_Block_8_io_out_data_Im)
  );
  RAM_Block_56 RAM_Block_9 ( // @[FFTDesigns.scala 2717:26]
    .clock(RAM_Block_9_clock),
    .io_in_raddr(RAM_Block_9_io_in_raddr),
    .io_in_waddr(RAM_Block_9_io_in_waddr),
    .io_in_data_Re(RAM_Block_9_io_in_data_Re),
    .io_in_data_Im(RAM_Block_9_io_in_data_Im),
    .io_re(RAM_Block_9_io_re),
    .io_wr(RAM_Block_9_io_wr),
    .io_en(RAM_Block_9_io_en),
    .io_out_data_Re(RAM_Block_9_io_out_data_Re),
    .io_out_data_Im(RAM_Block_9_io_out_data_Im)
  );
  RAM_Block_56 RAM_Block_10 ( // @[FFTDesigns.scala 2717:26]
    .clock(RAM_Block_10_clock),
    .io_in_raddr(RAM_Block_10_io_in_raddr),
    .io_in_waddr(RAM_Block_10_io_in_waddr),
    .io_in_data_Re(RAM_Block_10_io_in_data_Re),
    .io_in_data_Im(RAM_Block_10_io_in_data_Im),
    .io_re(RAM_Block_10_io_re),
    .io_wr(RAM_Block_10_io_wr),
    .io_en(RAM_Block_10_io_en),
    .io_out_data_Re(RAM_Block_10_io_out_data_Re),
    .io_out_data_Im(RAM_Block_10_io_out_data_Im)
  );
  RAM_Block_56 RAM_Block_11 ( // @[FFTDesigns.scala 2717:26]
    .clock(RAM_Block_11_clock),
    .io_in_raddr(RAM_Block_11_io_in_raddr),
    .io_in_waddr(RAM_Block_11_io_in_waddr),
    .io_in_data_Re(RAM_Block_11_io_in_data_Re),
    .io_in_data_Im(RAM_Block_11_io_in_data_Im),
    .io_re(RAM_Block_11_io_re),
    .io_wr(RAM_Block_11_io_wr),
    .io_en(RAM_Block_11_io_en),
    .io_out_data_Re(RAM_Block_11_io_out_data_Re),
    .io_out_data_Im(RAM_Block_11_io_out_data_Im)
  );
  PermutationModuleStreamed_7 PermutationModuleStreamed ( // @[FFTDesigns.scala 2750:28]
    .io_in_0_Re(PermutationModuleStreamed_io_in_0_Re),
    .io_in_0_Im(PermutationModuleStreamed_io_in_0_Im),
    .io_in_1_Re(PermutationModuleStreamed_io_in_1_Re),
    .io_in_1_Im(PermutationModuleStreamed_io_in_1_Im),
    .io_in_2_Re(PermutationModuleStreamed_io_in_2_Re),
    .io_in_2_Im(PermutationModuleStreamed_io_in_2_Im),
    .io_in_3_Re(PermutationModuleStreamed_io_in_3_Re),
    .io_in_3_Im(PermutationModuleStreamed_io_in_3_Im),
    .io_in_4_Re(PermutationModuleStreamed_io_in_4_Re),
    .io_in_4_Im(PermutationModuleStreamed_io_in_4_Im),
    .io_in_5_Re(PermutationModuleStreamed_io_in_5_Re),
    .io_in_5_Im(PermutationModuleStreamed_io_in_5_Im),
    .io_in_config_0(PermutationModuleStreamed_io_in_config_0),
    .io_in_config_1(PermutationModuleStreamed_io_in_config_1),
    .io_in_config_2(PermutationModuleStreamed_io_in_config_2),
    .io_in_config_3(PermutationModuleStreamed_io_in_config_3),
    .io_in_config_4(PermutationModuleStreamed_io_in_config_4),
    .io_out_0_Re(PermutationModuleStreamed_io_out_0_Re),
    .io_out_0_Im(PermutationModuleStreamed_io_out_0_Im),
    .io_out_1_Re(PermutationModuleStreamed_io_out_1_Re),
    .io_out_1_Im(PermutationModuleStreamed_io_out_1_Im),
    .io_out_2_Re(PermutationModuleStreamed_io_out_2_Re),
    .io_out_2_Im(PermutationModuleStreamed_io_out_2_Im),
    .io_out_3_Re(PermutationModuleStreamed_io_out_3_Re),
    .io_out_3_Im(PermutationModuleStreamed_io_out_3_Im),
    .io_out_4_Re(PermutationModuleStreamed_io_out_4_Re),
    .io_out_4_Im(PermutationModuleStreamed_io_out_4_Im),
    .io_out_5_Re(PermutationModuleStreamed_io_out_5_Re),
    .io_out_5_Im(PermutationModuleStreamed_io_out_5_Im)
  );
  M0_Config_ROM_7 M0_Config_ROM ( // @[FFTDesigns.scala 2751:29]
    .io_in_cnt(M0_Config_ROM_io_in_cnt),
    .io_out_0(M0_Config_ROM_io_out_0),
    .io_out_1(M0_Config_ROM_io_out_1),
    .io_out_2(M0_Config_ROM_io_out_2),
    .io_out_3(M0_Config_ROM_io_out_3),
    .io_out_4(M0_Config_ROM_io_out_4),
    .io_out_5(M0_Config_ROM_io_out_5)
  );
  M1_Config_ROM_7 M1_Config_ROM ( // @[FFTDesigns.scala 2752:29]
    .io_in_cnt(M1_Config_ROM_io_in_cnt),
    .io_out_0(M1_Config_ROM_io_out_0),
    .io_out_1(M1_Config_ROM_io_out_1),
    .io_out_2(M1_Config_ROM_io_out_2),
    .io_out_3(M1_Config_ROM_io_out_3),
    .io_out_4(M1_Config_ROM_io_out_4),
    .io_out_5(M1_Config_ROM_io_out_5)
  );
  Streaming_Permute_Config_7 Streaming_Permute_Config ( // @[FFTDesigns.scala 2753:31]
    .io_in_cnt(Streaming_Permute_Config_io_in_cnt),
    .io_out_0(Streaming_Permute_Config_io_out_0),
    .io_out_1(Streaming_Permute_Config_io_out_1),
    .io_out_2(Streaming_Permute_Config_io_out_2),
    .io_out_3(Streaming_Permute_Config_io_out_3),
    .io_out_4(Streaming_Permute_Config_io_out_4)
  );
  assign io_out_0_Re = RAM_Block_6_io_out_data_Re; // @[FFTDesigns.scala 2716:{23,23}]
  assign io_out_0_Im = RAM_Block_6_io_out_data_Im; // @[FFTDesigns.scala 2716:{23,23}]
  assign io_out_1_Re = RAM_Block_7_io_out_data_Re; // @[FFTDesigns.scala 2716:{23,23}]
  assign io_out_1_Im = RAM_Block_7_io_out_data_Im; // @[FFTDesigns.scala 2716:{23,23}]
  assign io_out_2_Re = RAM_Block_8_io_out_data_Re; // @[FFTDesigns.scala 2716:{23,23}]
  assign io_out_2_Im = RAM_Block_8_io_out_data_Im; // @[FFTDesigns.scala 2716:{23,23}]
  assign io_out_3_Re = RAM_Block_9_io_out_data_Re; // @[FFTDesigns.scala 2716:{23,23}]
  assign io_out_3_Im = RAM_Block_9_io_out_data_Im; // @[FFTDesigns.scala 2716:{23,23}]
  assign io_out_4_Re = RAM_Block_10_io_out_data_Re; // @[FFTDesigns.scala 2716:{23,23}]
  assign io_out_4_Im = RAM_Block_10_io_out_data_Im; // @[FFTDesigns.scala 2716:{23,23}]
  assign io_out_5_Re = RAM_Block_11_io_out_data_Re; // @[FFTDesigns.scala 2716:{23,23}]
  assign io_out_5_Im = RAM_Block_11_io_out_data_Im; // @[FFTDesigns.scala 2716:{23,23}]
  assign RAM_Block_clock = clock;
  assign RAM_Block_io_in_raddr = _GEN_322[4:0]; // @[FFTDesigns.scala 2712:23]
  assign RAM_Block_io_in_waddr = _GEN_383[4:0]; // @[FFTDesigns.scala 2712:23]
  assign RAM_Block_io_in_data_Re = M0_0_re ? _GEN_216 : 32'h0; // @[FFTDesigns.scala 2757:33 2815:25]
  assign RAM_Block_io_in_data_Im = M0_0_re ? _GEN_215 : 32'h0; // @[FFTDesigns.scala 2757:33 2815:25]
  assign RAM_Block_io_re = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_io_wr = M0_0_re & _GEN_213; // @[FFTDesigns.scala 2757:33 2809:20]
  assign RAM_Block_io_en = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_1_clock = clock;
  assign RAM_Block_1_io_in_raddr = _GEN_332[4:0]; // @[FFTDesigns.scala 2712:23]
  assign RAM_Block_1_io_in_waddr = _GEN_388[4:0]; // @[FFTDesigns.scala 2712:23]
  assign RAM_Block_1_io_in_data_Re = M0_0_re ? _GEN_236 : 32'h0; // @[FFTDesigns.scala 2757:33 2815:25]
  assign RAM_Block_1_io_in_data_Im = M0_0_re ? _GEN_235 : 32'h0; // @[FFTDesigns.scala 2757:33 2815:25]
  assign RAM_Block_1_io_re = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_1_io_wr = M0_0_re & _GEN_233; // @[FFTDesigns.scala 2757:33 2809:20]
  assign RAM_Block_1_io_en = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_2_clock = clock;
  assign RAM_Block_2_io_in_raddr = _GEN_342[4:0]; // @[FFTDesigns.scala 2712:23]
  assign RAM_Block_2_io_in_waddr = _GEN_393[4:0]; // @[FFTDesigns.scala 2712:23]
  assign RAM_Block_2_io_in_data_Re = M0_0_re ? _GEN_256 : 32'h0; // @[FFTDesigns.scala 2757:33 2815:25]
  assign RAM_Block_2_io_in_data_Im = M0_0_re ? _GEN_255 : 32'h0; // @[FFTDesigns.scala 2757:33 2815:25]
  assign RAM_Block_2_io_re = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_2_io_wr = M0_0_re & _GEN_253; // @[FFTDesigns.scala 2757:33 2809:20]
  assign RAM_Block_2_io_en = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_3_clock = clock;
  assign RAM_Block_3_io_in_raddr = _GEN_352[4:0]; // @[FFTDesigns.scala 2712:23]
  assign RAM_Block_3_io_in_waddr = _GEN_398[4:0]; // @[FFTDesigns.scala 2712:23]
  assign RAM_Block_3_io_in_data_Re = M0_0_re ? _GEN_276 : 32'h0; // @[FFTDesigns.scala 2757:33 2815:25]
  assign RAM_Block_3_io_in_data_Im = M0_0_re ? _GEN_275 : 32'h0; // @[FFTDesigns.scala 2757:33 2815:25]
  assign RAM_Block_3_io_re = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_3_io_wr = M0_0_re & _GEN_273; // @[FFTDesigns.scala 2757:33 2809:20]
  assign RAM_Block_3_io_en = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_4_clock = clock;
  assign RAM_Block_4_io_in_raddr = _GEN_362[4:0]; // @[FFTDesigns.scala 2712:23]
  assign RAM_Block_4_io_in_waddr = _GEN_403[4:0]; // @[FFTDesigns.scala 2712:23]
  assign RAM_Block_4_io_in_data_Re = M0_0_re ? _GEN_296 : 32'h0; // @[FFTDesigns.scala 2757:33 2815:25]
  assign RAM_Block_4_io_in_data_Im = M0_0_re ? _GEN_295 : 32'h0; // @[FFTDesigns.scala 2757:33 2815:25]
  assign RAM_Block_4_io_re = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_4_io_wr = M0_0_re & _GEN_293; // @[FFTDesigns.scala 2757:33 2809:20]
  assign RAM_Block_4_io_en = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_5_clock = clock;
  assign RAM_Block_5_io_in_raddr = _GEN_372[4:0]; // @[FFTDesigns.scala 2712:23]
  assign RAM_Block_5_io_in_waddr = _GEN_408[4:0]; // @[FFTDesigns.scala 2712:23]
  assign RAM_Block_5_io_in_data_Re = M0_0_re ? _GEN_316 : 32'h0; // @[FFTDesigns.scala 2757:33 2815:25]
  assign RAM_Block_5_io_in_data_Im = M0_0_re ? _GEN_315 : 32'h0; // @[FFTDesigns.scala 2757:33 2815:25]
  assign RAM_Block_5_io_re = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_5_io_wr = M0_0_re & _GEN_313; // @[FFTDesigns.scala 2757:33 2809:20]
  assign RAM_Block_5_io_en = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_6_clock = clock;
  assign RAM_Block_6_io_in_raddr = _GEN_323[4:0]; // @[FFTDesigns.scala 2716:23]
  assign RAM_Block_6_io_in_waddr = _GEN_324[4:0]; // @[FFTDesigns.scala 2716:23]
  assign RAM_Block_6_io_in_data_Re = PermutationModuleStreamed_io_out_0_Re; // @[FFTDesigns.scala 2757:33 2783:25 2818:25]
  assign RAM_Block_6_io_in_data_Im = PermutationModuleStreamed_io_out_0_Im; // @[FFTDesigns.scala 2757:33 2783:25 2818:25]
  assign RAM_Block_6_io_re = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_6_io_wr = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_6_io_en = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_7_clock = clock;
  assign RAM_Block_7_io_in_raddr = _GEN_323[4:0]; // @[FFTDesigns.scala 2716:23]
  assign RAM_Block_7_io_in_waddr = _GEN_334[4:0]; // @[FFTDesigns.scala 2716:23]
  assign RAM_Block_7_io_in_data_Re = PermutationModuleStreamed_io_out_1_Re; // @[FFTDesigns.scala 2757:33 2783:25 2818:25]
  assign RAM_Block_7_io_in_data_Im = PermutationModuleStreamed_io_out_1_Im; // @[FFTDesigns.scala 2757:33 2783:25 2818:25]
  assign RAM_Block_7_io_re = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_7_io_wr = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_7_io_en = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_8_clock = clock;
  assign RAM_Block_8_io_in_raddr = _GEN_323[4:0]; // @[FFTDesigns.scala 2716:23]
  assign RAM_Block_8_io_in_waddr = _GEN_344[4:0]; // @[FFTDesigns.scala 2716:23]
  assign RAM_Block_8_io_in_data_Re = PermutationModuleStreamed_io_out_2_Re; // @[FFTDesigns.scala 2757:33 2783:25 2818:25]
  assign RAM_Block_8_io_in_data_Im = PermutationModuleStreamed_io_out_2_Im; // @[FFTDesigns.scala 2757:33 2783:25 2818:25]
  assign RAM_Block_8_io_re = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_8_io_wr = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_8_io_en = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_9_clock = clock;
  assign RAM_Block_9_io_in_raddr = _GEN_323[4:0]; // @[FFTDesigns.scala 2716:23]
  assign RAM_Block_9_io_in_waddr = _GEN_354[4:0]; // @[FFTDesigns.scala 2716:23]
  assign RAM_Block_9_io_in_data_Re = PermutationModuleStreamed_io_out_3_Re; // @[FFTDesigns.scala 2757:33 2783:25 2818:25]
  assign RAM_Block_9_io_in_data_Im = PermutationModuleStreamed_io_out_3_Im; // @[FFTDesigns.scala 2757:33 2783:25 2818:25]
  assign RAM_Block_9_io_re = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_9_io_wr = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_9_io_en = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_10_clock = clock;
  assign RAM_Block_10_io_in_raddr = _GEN_323[4:0]; // @[FFTDesigns.scala 2716:23]
  assign RAM_Block_10_io_in_waddr = _GEN_364[4:0]; // @[FFTDesigns.scala 2716:23]
  assign RAM_Block_10_io_in_data_Re = PermutationModuleStreamed_io_out_4_Re; // @[FFTDesigns.scala 2757:33 2783:25 2818:25]
  assign RAM_Block_10_io_in_data_Im = PermutationModuleStreamed_io_out_4_Im; // @[FFTDesigns.scala 2757:33 2783:25 2818:25]
  assign RAM_Block_10_io_re = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_10_io_wr = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_10_io_en = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_11_clock = clock;
  assign RAM_Block_11_io_in_raddr = _GEN_323[4:0]; // @[FFTDesigns.scala 2716:23]
  assign RAM_Block_11_io_in_waddr = _GEN_374[4:0]; // @[FFTDesigns.scala 2716:23]
  assign RAM_Block_11_io_in_data_Re = PermutationModuleStreamed_io_out_5_Re; // @[FFTDesigns.scala 2757:33 2783:25 2818:25]
  assign RAM_Block_11_io_in_data_Im = PermutationModuleStreamed_io_out_5_Im; // @[FFTDesigns.scala 2757:33 2783:25 2818:25]
  assign RAM_Block_11_io_re = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_11_io_wr = |_T; // @[FFTDesigns.scala 2757:28]
  assign RAM_Block_11_io_en = |_T; // @[FFTDesigns.scala 2757:28]
  assign PermutationModuleStreamed_io_in_0_Re = RAM_Block_io_out_data_Re; // @[FFTDesigns.scala 2712:{23,23}]
  assign PermutationModuleStreamed_io_in_0_Im = RAM_Block_io_out_data_Im; // @[FFTDesigns.scala 2712:{23,23}]
  assign PermutationModuleStreamed_io_in_1_Re = RAM_Block_1_io_out_data_Re; // @[FFTDesigns.scala 2712:{23,23}]
  assign PermutationModuleStreamed_io_in_1_Im = RAM_Block_1_io_out_data_Im; // @[FFTDesigns.scala 2712:{23,23}]
  assign PermutationModuleStreamed_io_in_2_Re = RAM_Block_2_io_out_data_Re; // @[FFTDesigns.scala 2712:{23,23}]
  assign PermutationModuleStreamed_io_in_2_Im = RAM_Block_2_io_out_data_Im; // @[FFTDesigns.scala 2712:{23,23}]
  assign PermutationModuleStreamed_io_in_3_Re = RAM_Block_3_io_out_data_Re; // @[FFTDesigns.scala 2712:{23,23}]
  assign PermutationModuleStreamed_io_in_3_Im = RAM_Block_3_io_out_data_Im; // @[FFTDesigns.scala 2712:{23,23}]
  assign PermutationModuleStreamed_io_in_4_Re = RAM_Block_4_io_out_data_Re; // @[FFTDesigns.scala 2712:{23,23}]
  assign PermutationModuleStreamed_io_in_4_Im = RAM_Block_4_io_out_data_Im; // @[FFTDesigns.scala 2712:{23,23}]
  assign PermutationModuleStreamed_io_in_5_Re = RAM_Block_5_io_out_data_Re; // @[FFTDesigns.scala 2712:{23,23}]
  assign PermutationModuleStreamed_io_in_5_Im = RAM_Block_5_io_out_data_Im; // @[FFTDesigns.scala 2712:{23,23}]
  assign PermutationModuleStreamed_io_in_config_0 = Streaming_Permute_Config_io_out_0; // @[FFTDesigns.scala 2757:33 2784:33 2819:33]
  assign PermutationModuleStreamed_io_in_config_1 = Streaming_Permute_Config_io_out_1; // @[FFTDesigns.scala 2757:33 2784:33 2819:33]
  assign PermutationModuleStreamed_io_in_config_2 = Streaming_Permute_Config_io_out_2; // @[FFTDesigns.scala 2757:33 2784:33 2819:33]
  assign PermutationModuleStreamed_io_in_config_3 = Streaming_Permute_Config_io_out_3; // @[FFTDesigns.scala 2757:33 2784:33 2819:33]
  assign PermutationModuleStreamed_io_in_config_4 = Streaming_Permute_Config_io_out_4; // @[FFTDesigns.scala 2757:33 2784:33 2819:33]
  assign M0_Config_ROM_io_in_cnt = cnt2; // @[FFTDesigns.scala 2829:24]
  assign M1_Config_ROM_io_in_cnt = cnt2; // @[FFTDesigns.scala 2830:24]
  assign Streaming_Permute_Config_io_in_cnt = cnt2; // @[FFTDesigns.scala 2831:26]
  always @(posedge clock) begin
    offset_switch <= M0_0_re & _GEN_5; // @[FFTDesigns.scala 2757:33 2825:23]
    if (reset) begin // @[FFTDesigns.scala 2755:25]
      cnt2 <= 4'h0; // @[FFTDesigns.scala 2755:25]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2757:33]
      if (cnt2 == 4'hf & cnt == 5'h17) begin // @[FFTDesigns.scala 2758:69]
        cnt2 <= 4'h0; // @[FFTDesigns.scala 2759:16]
      end else if (!(_T_2)) begin // @[FFTDesigns.scala 2762:46]
        cnt2 <= _cnt2_T_1; // @[FFTDesigns.scala 2767:16]
      end
    end
    if (reset) begin // @[FFTDesigns.scala 2756:24]
      cnt <= 5'h0; // @[FFTDesigns.scala 2756:24]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2757:33]
      if (cnt2 == 4'hf & cnt == 5'h17) begin // @[FFTDesigns.scala 2758:69]
        cnt <= 5'h0; // @[FFTDesigns.scala 2760:15]
      end else if (_T_2) begin // @[FFTDesigns.scala 2762:46]
        cnt <= _cnt_T_1; // @[FFTDesigns.scala 2764:15]
      end else begin
        cnt <= _cnt_T_1; // @[FFTDesigns.scala 2768:15]
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
  cnt2 = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  cnt = _RAND_2[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RAM_Block_mw(
  input         clock,
  input  [5:0]  io_in_raddr,
  input  [5:0]  io_in_waddr_0,
  input  [5:0]  io_in_waddr_1,
  input  [31:0] io_in_data_0_Re,
  input  [31:0] io_in_data_0_Im,
  input  [31:0] io_in_data_1_Re,
  input  [31:0] io_in_data_1_Im,
  input         io_re,
  input         io_wr_0,
  input         io_wr_1,
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
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem_0_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_0_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_1_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_1_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_2_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_2_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_3_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_3_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_4_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_4_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_5_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_5_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_6_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_6_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_7_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_7_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_8_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_8_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_9_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_9_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_10_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_10_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_11_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_11_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_12_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_12_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_13_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_13_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_14_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_14_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_15_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_15_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_16_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_16_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_17_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_17_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_18_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_18_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_19_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_19_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_20_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_20_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_21_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_21_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_22_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_22_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_23_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_23_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_24_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_24_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_25_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_25_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_26_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_26_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_27_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_27_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_28_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_28_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_29_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_29_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_30_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_30_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_31_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_31_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_32_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_32_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_33_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_33_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_34_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_34_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_35_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_35_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_36_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_36_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_37_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_37_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_38_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_38_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_39_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_39_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_40_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_40_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_41_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_41_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_42_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_42_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_43_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_43_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_44_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_44_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_45_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_45_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_46_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_46_Im; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_47_Re; // @[FFTDesigns.scala 3313:18]
  reg [31:0] mem_47_Im; // @[FFTDesigns.scala 3313:18]
  wire [31:0] _GEN_0 = 6'h0 == io_in_waddr_0 ? io_in_data_0_Im : mem_0_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_1 = 6'h1 == io_in_waddr_0 ? io_in_data_0_Im : mem_1_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_2 = 6'h2 == io_in_waddr_0 ? io_in_data_0_Im : mem_2_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_3 = 6'h3 == io_in_waddr_0 ? io_in_data_0_Im : mem_3_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_4 = 6'h4 == io_in_waddr_0 ? io_in_data_0_Im : mem_4_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_5 = 6'h5 == io_in_waddr_0 ? io_in_data_0_Im : mem_5_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_6 = 6'h6 == io_in_waddr_0 ? io_in_data_0_Im : mem_6_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_7 = 6'h7 == io_in_waddr_0 ? io_in_data_0_Im : mem_7_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_8 = 6'h8 == io_in_waddr_0 ? io_in_data_0_Im : mem_8_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_9 = 6'h9 == io_in_waddr_0 ? io_in_data_0_Im : mem_9_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_10 = 6'ha == io_in_waddr_0 ? io_in_data_0_Im : mem_10_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_11 = 6'hb == io_in_waddr_0 ? io_in_data_0_Im : mem_11_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_12 = 6'hc == io_in_waddr_0 ? io_in_data_0_Im : mem_12_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_13 = 6'hd == io_in_waddr_0 ? io_in_data_0_Im : mem_13_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_14 = 6'he == io_in_waddr_0 ? io_in_data_0_Im : mem_14_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_15 = 6'hf == io_in_waddr_0 ? io_in_data_0_Im : mem_15_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_16 = 6'h10 == io_in_waddr_0 ? io_in_data_0_Im : mem_16_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_17 = 6'h11 == io_in_waddr_0 ? io_in_data_0_Im : mem_17_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_18 = 6'h12 == io_in_waddr_0 ? io_in_data_0_Im : mem_18_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_19 = 6'h13 == io_in_waddr_0 ? io_in_data_0_Im : mem_19_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_20 = 6'h14 == io_in_waddr_0 ? io_in_data_0_Im : mem_20_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_21 = 6'h15 == io_in_waddr_0 ? io_in_data_0_Im : mem_21_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_22 = 6'h16 == io_in_waddr_0 ? io_in_data_0_Im : mem_22_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_23 = 6'h17 == io_in_waddr_0 ? io_in_data_0_Im : mem_23_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_24 = 6'h18 == io_in_waddr_0 ? io_in_data_0_Im : mem_24_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_25 = 6'h19 == io_in_waddr_0 ? io_in_data_0_Im : mem_25_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_26 = 6'h1a == io_in_waddr_0 ? io_in_data_0_Im : mem_26_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_27 = 6'h1b == io_in_waddr_0 ? io_in_data_0_Im : mem_27_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_28 = 6'h1c == io_in_waddr_0 ? io_in_data_0_Im : mem_28_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_29 = 6'h1d == io_in_waddr_0 ? io_in_data_0_Im : mem_29_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_30 = 6'h1e == io_in_waddr_0 ? io_in_data_0_Im : mem_30_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_31 = 6'h1f == io_in_waddr_0 ? io_in_data_0_Im : mem_31_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_32 = 6'h20 == io_in_waddr_0 ? io_in_data_0_Im : mem_32_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_33 = 6'h21 == io_in_waddr_0 ? io_in_data_0_Im : mem_33_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_34 = 6'h22 == io_in_waddr_0 ? io_in_data_0_Im : mem_34_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_35 = 6'h23 == io_in_waddr_0 ? io_in_data_0_Im : mem_35_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_36 = 6'h24 == io_in_waddr_0 ? io_in_data_0_Im : mem_36_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_37 = 6'h25 == io_in_waddr_0 ? io_in_data_0_Im : mem_37_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_38 = 6'h26 == io_in_waddr_0 ? io_in_data_0_Im : mem_38_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_39 = 6'h27 == io_in_waddr_0 ? io_in_data_0_Im : mem_39_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_40 = 6'h28 == io_in_waddr_0 ? io_in_data_0_Im : mem_40_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_41 = 6'h29 == io_in_waddr_0 ? io_in_data_0_Im : mem_41_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_42 = 6'h2a == io_in_waddr_0 ? io_in_data_0_Im : mem_42_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_43 = 6'h2b == io_in_waddr_0 ? io_in_data_0_Im : mem_43_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_44 = 6'h2c == io_in_waddr_0 ? io_in_data_0_Im : mem_44_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_45 = 6'h2d == io_in_waddr_0 ? io_in_data_0_Im : mem_45_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_46 = 6'h2e == io_in_waddr_0 ? io_in_data_0_Im : mem_46_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_47 = 6'h2f == io_in_waddr_0 ? io_in_data_0_Im : mem_47_Im; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_48 = 6'h0 == io_in_waddr_0 ? io_in_data_0_Re : mem_0_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_49 = 6'h1 == io_in_waddr_0 ? io_in_data_0_Re : mem_1_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_50 = 6'h2 == io_in_waddr_0 ? io_in_data_0_Re : mem_2_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_51 = 6'h3 == io_in_waddr_0 ? io_in_data_0_Re : mem_3_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_52 = 6'h4 == io_in_waddr_0 ? io_in_data_0_Re : mem_4_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_53 = 6'h5 == io_in_waddr_0 ? io_in_data_0_Re : mem_5_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_54 = 6'h6 == io_in_waddr_0 ? io_in_data_0_Re : mem_6_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_55 = 6'h7 == io_in_waddr_0 ? io_in_data_0_Re : mem_7_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_56 = 6'h8 == io_in_waddr_0 ? io_in_data_0_Re : mem_8_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_57 = 6'h9 == io_in_waddr_0 ? io_in_data_0_Re : mem_9_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_58 = 6'ha == io_in_waddr_0 ? io_in_data_0_Re : mem_10_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_59 = 6'hb == io_in_waddr_0 ? io_in_data_0_Re : mem_11_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_60 = 6'hc == io_in_waddr_0 ? io_in_data_0_Re : mem_12_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_61 = 6'hd == io_in_waddr_0 ? io_in_data_0_Re : mem_13_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_62 = 6'he == io_in_waddr_0 ? io_in_data_0_Re : mem_14_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_63 = 6'hf == io_in_waddr_0 ? io_in_data_0_Re : mem_15_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_64 = 6'h10 == io_in_waddr_0 ? io_in_data_0_Re : mem_16_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_65 = 6'h11 == io_in_waddr_0 ? io_in_data_0_Re : mem_17_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_66 = 6'h12 == io_in_waddr_0 ? io_in_data_0_Re : mem_18_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_67 = 6'h13 == io_in_waddr_0 ? io_in_data_0_Re : mem_19_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_68 = 6'h14 == io_in_waddr_0 ? io_in_data_0_Re : mem_20_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_69 = 6'h15 == io_in_waddr_0 ? io_in_data_0_Re : mem_21_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_70 = 6'h16 == io_in_waddr_0 ? io_in_data_0_Re : mem_22_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_71 = 6'h17 == io_in_waddr_0 ? io_in_data_0_Re : mem_23_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_72 = 6'h18 == io_in_waddr_0 ? io_in_data_0_Re : mem_24_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_73 = 6'h19 == io_in_waddr_0 ? io_in_data_0_Re : mem_25_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_74 = 6'h1a == io_in_waddr_0 ? io_in_data_0_Re : mem_26_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_75 = 6'h1b == io_in_waddr_0 ? io_in_data_0_Re : mem_27_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_76 = 6'h1c == io_in_waddr_0 ? io_in_data_0_Re : mem_28_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_77 = 6'h1d == io_in_waddr_0 ? io_in_data_0_Re : mem_29_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_78 = 6'h1e == io_in_waddr_0 ? io_in_data_0_Re : mem_30_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_79 = 6'h1f == io_in_waddr_0 ? io_in_data_0_Re : mem_31_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_80 = 6'h20 == io_in_waddr_0 ? io_in_data_0_Re : mem_32_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_81 = 6'h21 == io_in_waddr_0 ? io_in_data_0_Re : mem_33_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_82 = 6'h22 == io_in_waddr_0 ? io_in_data_0_Re : mem_34_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_83 = 6'h23 == io_in_waddr_0 ? io_in_data_0_Re : mem_35_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_84 = 6'h24 == io_in_waddr_0 ? io_in_data_0_Re : mem_36_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_85 = 6'h25 == io_in_waddr_0 ? io_in_data_0_Re : mem_37_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_86 = 6'h26 == io_in_waddr_0 ? io_in_data_0_Re : mem_38_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_87 = 6'h27 == io_in_waddr_0 ? io_in_data_0_Re : mem_39_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_88 = 6'h28 == io_in_waddr_0 ? io_in_data_0_Re : mem_40_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_89 = 6'h29 == io_in_waddr_0 ? io_in_data_0_Re : mem_41_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_90 = 6'h2a == io_in_waddr_0 ? io_in_data_0_Re : mem_42_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_91 = 6'h2b == io_in_waddr_0 ? io_in_data_0_Re : mem_43_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_92 = 6'h2c == io_in_waddr_0 ? io_in_data_0_Re : mem_44_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_93 = 6'h2d == io_in_waddr_0 ? io_in_data_0_Re : mem_45_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_94 = 6'h2e == io_in_waddr_0 ? io_in_data_0_Re : mem_46_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_95 = 6'h2f == io_in_waddr_0 ? io_in_data_0_Re : mem_47_Re; // @[FFTDesigns.scala 3313:18 3317:{31,31}]
  wire [31:0] _GEN_96 = io_wr_0 ? _GEN_0 : mem_0_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_97 = io_wr_0 ? _GEN_1 : mem_1_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_98 = io_wr_0 ? _GEN_2 : mem_2_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_99 = io_wr_0 ? _GEN_3 : mem_3_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_100 = io_wr_0 ? _GEN_4 : mem_4_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_101 = io_wr_0 ? _GEN_5 : mem_5_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_102 = io_wr_0 ? _GEN_6 : mem_6_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_103 = io_wr_0 ? _GEN_7 : mem_7_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_104 = io_wr_0 ? _GEN_8 : mem_8_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_105 = io_wr_0 ? _GEN_9 : mem_9_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_106 = io_wr_0 ? _GEN_10 : mem_10_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_107 = io_wr_0 ? _GEN_11 : mem_11_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_108 = io_wr_0 ? _GEN_12 : mem_12_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_109 = io_wr_0 ? _GEN_13 : mem_13_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_110 = io_wr_0 ? _GEN_14 : mem_14_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_111 = io_wr_0 ? _GEN_15 : mem_15_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_112 = io_wr_0 ? _GEN_16 : mem_16_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_113 = io_wr_0 ? _GEN_17 : mem_17_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_114 = io_wr_0 ? _GEN_18 : mem_18_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_115 = io_wr_0 ? _GEN_19 : mem_19_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_116 = io_wr_0 ? _GEN_20 : mem_20_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_117 = io_wr_0 ? _GEN_21 : mem_21_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_118 = io_wr_0 ? _GEN_22 : mem_22_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_119 = io_wr_0 ? _GEN_23 : mem_23_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_120 = io_wr_0 ? _GEN_24 : mem_24_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_121 = io_wr_0 ? _GEN_25 : mem_25_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_122 = io_wr_0 ? _GEN_26 : mem_26_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_123 = io_wr_0 ? _GEN_27 : mem_27_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_124 = io_wr_0 ? _GEN_28 : mem_28_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_125 = io_wr_0 ? _GEN_29 : mem_29_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_126 = io_wr_0 ? _GEN_30 : mem_30_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_127 = io_wr_0 ? _GEN_31 : mem_31_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_128 = io_wr_0 ? _GEN_32 : mem_32_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_129 = io_wr_0 ? _GEN_33 : mem_33_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_130 = io_wr_0 ? _GEN_34 : mem_34_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_131 = io_wr_0 ? _GEN_35 : mem_35_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_132 = io_wr_0 ? _GEN_36 : mem_36_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_133 = io_wr_0 ? _GEN_37 : mem_37_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_134 = io_wr_0 ? _GEN_38 : mem_38_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_135 = io_wr_0 ? _GEN_39 : mem_39_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_136 = io_wr_0 ? _GEN_40 : mem_40_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_137 = io_wr_0 ? _GEN_41 : mem_41_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_138 = io_wr_0 ? _GEN_42 : mem_42_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_139 = io_wr_0 ? _GEN_43 : mem_43_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_140 = io_wr_0 ? _GEN_44 : mem_44_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_141 = io_wr_0 ? _GEN_45 : mem_45_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_142 = io_wr_0 ? _GEN_46 : mem_46_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_143 = io_wr_0 ? _GEN_47 : mem_47_Im; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_144 = io_wr_0 ? _GEN_48 : mem_0_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_145 = io_wr_0 ? _GEN_49 : mem_1_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_146 = io_wr_0 ? _GEN_50 : mem_2_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_147 = io_wr_0 ? _GEN_51 : mem_3_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_148 = io_wr_0 ? _GEN_52 : mem_4_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_149 = io_wr_0 ? _GEN_53 : mem_5_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_150 = io_wr_0 ? _GEN_54 : mem_6_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_151 = io_wr_0 ? _GEN_55 : mem_7_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_152 = io_wr_0 ? _GEN_56 : mem_8_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_153 = io_wr_0 ? _GEN_57 : mem_9_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_154 = io_wr_0 ? _GEN_58 : mem_10_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_155 = io_wr_0 ? _GEN_59 : mem_11_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_156 = io_wr_0 ? _GEN_60 : mem_12_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_157 = io_wr_0 ? _GEN_61 : mem_13_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_158 = io_wr_0 ? _GEN_62 : mem_14_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_159 = io_wr_0 ? _GEN_63 : mem_15_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_160 = io_wr_0 ? _GEN_64 : mem_16_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_161 = io_wr_0 ? _GEN_65 : mem_17_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_162 = io_wr_0 ? _GEN_66 : mem_18_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_163 = io_wr_0 ? _GEN_67 : mem_19_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_164 = io_wr_0 ? _GEN_68 : mem_20_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_165 = io_wr_0 ? _GEN_69 : mem_21_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_166 = io_wr_0 ? _GEN_70 : mem_22_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_167 = io_wr_0 ? _GEN_71 : mem_23_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_168 = io_wr_0 ? _GEN_72 : mem_24_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_169 = io_wr_0 ? _GEN_73 : mem_25_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_170 = io_wr_0 ? _GEN_74 : mem_26_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_171 = io_wr_0 ? _GEN_75 : mem_27_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_172 = io_wr_0 ? _GEN_76 : mem_28_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_173 = io_wr_0 ? _GEN_77 : mem_29_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_174 = io_wr_0 ? _GEN_78 : mem_30_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_175 = io_wr_0 ? _GEN_79 : mem_31_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_176 = io_wr_0 ? _GEN_80 : mem_32_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_177 = io_wr_0 ? _GEN_81 : mem_33_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_178 = io_wr_0 ? _GEN_82 : mem_34_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_179 = io_wr_0 ? _GEN_83 : mem_35_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_180 = io_wr_0 ? _GEN_84 : mem_36_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_181 = io_wr_0 ? _GEN_85 : mem_37_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_182 = io_wr_0 ? _GEN_86 : mem_38_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_183 = io_wr_0 ? _GEN_87 : mem_39_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_184 = io_wr_0 ? _GEN_88 : mem_40_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_185 = io_wr_0 ? _GEN_89 : mem_41_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_186 = io_wr_0 ? _GEN_90 : mem_42_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_187 = io_wr_0 ? _GEN_91 : mem_43_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_188 = io_wr_0 ? _GEN_92 : mem_44_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_189 = io_wr_0 ? _GEN_93 : mem_45_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_190 = io_wr_0 ? _GEN_94 : mem_46_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_191 = io_wr_0 ? _GEN_95 : mem_47_Re; // @[FFTDesigns.scala 3313:18 3316:23]
  wire [31:0] _GEN_385 = 6'h1 == io_in_raddr ? mem_1_Im : mem_0_Im; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_386 = 6'h2 == io_in_raddr ? mem_2_Im : _GEN_385; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_387 = 6'h3 == io_in_raddr ? mem_3_Im : _GEN_386; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_388 = 6'h4 == io_in_raddr ? mem_4_Im : _GEN_387; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_389 = 6'h5 == io_in_raddr ? mem_5_Im : _GEN_388; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_390 = 6'h6 == io_in_raddr ? mem_6_Im : _GEN_389; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_391 = 6'h7 == io_in_raddr ? mem_7_Im : _GEN_390; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_392 = 6'h8 == io_in_raddr ? mem_8_Im : _GEN_391; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_393 = 6'h9 == io_in_raddr ? mem_9_Im : _GEN_392; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_394 = 6'ha == io_in_raddr ? mem_10_Im : _GEN_393; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_395 = 6'hb == io_in_raddr ? mem_11_Im : _GEN_394; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_396 = 6'hc == io_in_raddr ? mem_12_Im : _GEN_395; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_397 = 6'hd == io_in_raddr ? mem_13_Im : _GEN_396; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_398 = 6'he == io_in_raddr ? mem_14_Im : _GEN_397; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_399 = 6'hf == io_in_raddr ? mem_15_Im : _GEN_398; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_400 = 6'h10 == io_in_raddr ? mem_16_Im : _GEN_399; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_401 = 6'h11 == io_in_raddr ? mem_17_Im : _GEN_400; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_402 = 6'h12 == io_in_raddr ? mem_18_Im : _GEN_401; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_403 = 6'h13 == io_in_raddr ? mem_19_Im : _GEN_402; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_404 = 6'h14 == io_in_raddr ? mem_20_Im : _GEN_403; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_405 = 6'h15 == io_in_raddr ? mem_21_Im : _GEN_404; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_406 = 6'h16 == io_in_raddr ? mem_22_Im : _GEN_405; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_407 = 6'h17 == io_in_raddr ? mem_23_Im : _GEN_406; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_408 = 6'h18 == io_in_raddr ? mem_24_Im : _GEN_407; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_409 = 6'h19 == io_in_raddr ? mem_25_Im : _GEN_408; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_410 = 6'h1a == io_in_raddr ? mem_26_Im : _GEN_409; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_411 = 6'h1b == io_in_raddr ? mem_27_Im : _GEN_410; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_412 = 6'h1c == io_in_raddr ? mem_28_Im : _GEN_411; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_413 = 6'h1d == io_in_raddr ? mem_29_Im : _GEN_412; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_414 = 6'h1e == io_in_raddr ? mem_30_Im : _GEN_413; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_415 = 6'h1f == io_in_raddr ? mem_31_Im : _GEN_414; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_416 = 6'h20 == io_in_raddr ? mem_32_Im : _GEN_415; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_417 = 6'h21 == io_in_raddr ? mem_33_Im : _GEN_416; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_418 = 6'h22 == io_in_raddr ? mem_34_Im : _GEN_417; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_419 = 6'h23 == io_in_raddr ? mem_35_Im : _GEN_418; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_420 = 6'h24 == io_in_raddr ? mem_36_Im : _GEN_419; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_421 = 6'h25 == io_in_raddr ? mem_37_Im : _GEN_420; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_422 = 6'h26 == io_in_raddr ? mem_38_Im : _GEN_421; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_423 = 6'h27 == io_in_raddr ? mem_39_Im : _GEN_422; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_424 = 6'h28 == io_in_raddr ? mem_40_Im : _GEN_423; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_425 = 6'h29 == io_in_raddr ? mem_41_Im : _GEN_424; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_426 = 6'h2a == io_in_raddr ? mem_42_Im : _GEN_425; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_427 = 6'h2b == io_in_raddr ? mem_43_Im : _GEN_426; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_428 = 6'h2c == io_in_raddr ? mem_44_Im : _GEN_427; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_429 = 6'h2d == io_in_raddr ? mem_45_Im : _GEN_428; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_430 = 6'h2e == io_in_raddr ? mem_46_Im : _GEN_429; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_431 = 6'h2f == io_in_raddr ? mem_47_Im : _GEN_430; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_433 = 6'h1 == io_in_raddr ? mem_1_Re : mem_0_Re; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_434 = 6'h2 == io_in_raddr ? mem_2_Re : _GEN_433; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_435 = 6'h3 == io_in_raddr ? mem_3_Re : _GEN_434; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_436 = 6'h4 == io_in_raddr ? mem_4_Re : _GEN_435; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_437 = 6'h5 == io_in_raddr ? mem_5_Re : _GEN_436; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_438 = 6'h6 == io_in_raddr ? mem_6_Re : _GEN_437; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_439 = 6'h7 == io_in_raddr ? mem_7_Re : _GEN_438; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_440 = 6'h8 == io_in_raddr ? mem_8_Re : _GEN_439; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_441 = 6'h9 == io_in_raddr ? mem_9_Re : _GEN_440; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_442 = 6'ha == io_in_raddr ? mem_10_Re : _GEN_441; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_443 = 6'hb == io_in_raddr ? mem_11_Re : _GEN_442; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_444 = 6'hc == io_in_raddr ? mem_12_Re : _GEN_443; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_445 = 6'hd == io_in_raddr ? mem_13_Re : _GEN_444; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_446 = 6'he == io_in_raddr ? mem_14_Re : _GEN_445; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_447 = 6'hf == io_in_raddr ? mem_15_Re : _GEN_446; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_448 = 6'h10 == io_in_raddr ? mem_16_Re : _GEN_447; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_449 = 6'h11 == io_in_raddr ? mem_17_Re : _GEN_448; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_450 = 6'h12 == io_in_raddr ? mem_18_Re : _GEN_449; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_451 = 6'h13 == io_in_raddr ? mem_19_Re : _GEN_450; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_452 = 6'h14 == io_in_raddr ? mem_20_Re : _GEN_451; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_453 = 6'h15 == io_in_raddr ? mem_21_Re : _GEN_452; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_454 = 6'h16 == io_in_raddr ? mem_22_Re : _GEN_453; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_455 = 6'h17 == io_in_raddr ? mem_23_Re : _GEN_454; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_456 = 6'h18 == io_in_raddr ? mem_24_Re : _GEN_455; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_457 = 6'h19 == io_in_raddr ? mem_25_Re : _GEN_456; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_458 = 6'h1a == io_in_raddr ? mem_26_Re : _GEN_457; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_459 = 6'h1b == io_in_raddr ? mem_27_Re : _GEN_458; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_460 = 6'h1c == io_in_raddr ? mem_28_Re : _GEN_459; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_461 = 6'h1d == io_in_raddr ? mem_29_Re : _GEN_460; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_462 = 6'h1e == io_in_raddr ? mem_30_Re : _GEN_461; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_463 = 6'h1f == io_in_raddr ? mem_31_Re : _GEN_462; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_464 = 6'h20 == io_in_raddr ? mem_32_Re : _GEN_463; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_465 = 6'h21 == io_in_raddr ? mem_33_Re : _GEN_464; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_466 = 6'h22 == io_in_raddr ? mem_34_Re : _GEN_465; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_467 = 6'h23 == io_in_raddr ? mem_35_Re : _GEN_466; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_468 = 6'h24 == io_in_raddr ? mem_36_Re : _GEN_467; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_469 = 6'h25 == io_in_raddr ? mem_37_Re : _GEN_468; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_470 = 6'h26 == io_in_raddr ? mem_38_Re : _GEN_469; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_471 = 6'h27 == io_in_raddr ? mem_39_Re : _GEN_470; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_472 = 6'h28 == io_in_raddr ? mem_40_Re : _GEN_471; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_473 = 6'h29 == io_in_raddr ? mem_41_Re : _GEN_472; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_474 = 6'h2a == io_in_raddr ? mem_42_Re : _GEN_473; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_475 = 6'h2b == io_in_raddr ? mem_43_Re : _GEN_474; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_476 = 6'h2c == io_in_raddr ? mem_44_Re : _GEN_475; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_477 = 6'h2d == io_in_raddr ? mem_45_Re : _GEN_476; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_478 = 6'h2e == io_in_raddr ? mem_46_Re : _GEN_477; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_479 = 6'h2f == io_in_raddr ? mem_47_Re : _GEN_478; // @[FFTDesigns.scala 3321:{21,21}]
  wire [31:0] _GEN_480 = io_re ? _GEN_431 : 32'h0; // @[FFTDesigns.scala 3320:18 3321:21 3324:24]
  wire [31:0] _GEN_481 = io_re ? _GEN_479 : 32'h0; // @[FFTDesigns.scala 3320:18 3321:21 3323:24]
  assign io_out_data_Re = io_en ? _GEN_481 : 32'h0; // @[FFTDesigns.scala 3314:16 3327:22]
  assign io_out_data_Im = io_en ? _GEN_480 : 32'h0; // @[FFTDesigns.scala 3314:16 3328:22]
  always @(posedge clock) begin
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h0 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_0_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_0_Re <= _GEN_144;
        end
      end else begin
        mem_0_Re <= _GEN_144;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h0 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_0_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_0_Im <= _GEN_96;
        end
      end else begin
        mem_0_Im <= _GEN_96;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h1 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_1_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_1_Re <= _GEN_145;
        end
      end else begin
        mem_1_Re <= _GEN_145;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h1 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_1_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_1_Im <= _GEN_97;
        end
      end else begin
        mem_1_Im <= _GEN_97;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h2 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_2_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_2_Re <= _GEN_146;
        end
      end else begin
        mem_2_Re <= _GEN_146;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h2 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_2_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_2_Im <= _GEN_98;
        end
      end else begin
        mem_2_Im <= _GEN_98;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h3 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_3_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_3_Re <= _GEN_147;
        end
      end else begin
        mem_3_Re <= _GEN_147;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h3 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_3_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_3_Im <= _GEN_99;
        end
      end else begin
        mem_3_Im <= _GEN_99;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h4 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_4_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_4_Re <= _GEN_148;
        end
      end else begin
        mem_4_Re <= _GEN_148;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h4 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_4_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_4_Im <= _GEN_100;
        end
      end else begin
        mem_4_Im <= _GEN_100;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h5 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_5_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_5_Re <= _GEN_149;
        end
      end else begin
        mem_5_Re <= _GEN_149;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h5 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_5_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_5_Im <= _GEN_101;
        end
      end else begin
        mem_5_Im <= _GEN_101;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h6 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_6_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_6_Re <= _GEN_150;
        end
      end else begin
        mem_6_Re <= _GEN_150;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h6 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_6_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_6_Im <= _GEN_102;
        end
      end else begin
        mem_6_Im <= _GEN_102;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h7 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_7_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_7_Re <= _GEN_151;
        end
      end else begin
        mem_7_Re <= _GEN_151;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h7 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_7_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_7_Im <= _GEN_103;
        end
      end else begin
        mem_7_Im <= _GEN_103;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h8 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_8_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_8_Re <= _GEN_152;
        end
      end else begin
        mem_8_Re <= _GEN_152;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h8 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_8_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_8_Im <= _GEN_104;
        end
      end else begin
        mem_8_Im <= _GEN_104;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h9 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_9_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_9_Re <= _GEN_153;
        end
      end else begin
        mem_9_Re <= _GEN_153;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h9 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_9_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_9_Im <= _GEN_105;
        end
      end else begin
        mem_9_Im <= _GEN_105;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'ha == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_10_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_10_Re <= _GEN_154;
        end
      end else begin
        mem_10_Re <= _GEN_154;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'ha == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_10_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_10_Im <= _GEN_106;
        end
      end else begin
        mem_10_Im <= _GEN_106;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'hb == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_11_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_11_Re <= _GEN_155;
        end
      end else begin
        mem_11_Re <= _GEN_155;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'hb == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_11_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_11_Im <= _GEN_107;
        end
      end else begin
        mem_11_Im <= _GEN_107;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'hc == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_12_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_12_Re <= _GEN_156;
        end
      end else begin
        mem_12_Re <= _GEN_156;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'hc == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_12_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_12_Im <= _GEN_108;
        end
      end else begin
        mem_12_Im <= _GEN_108;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'hd == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_13_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_13_Re <= _GEN_157;
        end
      end else begin
        mem_13_Re <= _GEN_157;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'hd == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_13_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_13_Im <= _GEN_109;
        end
      end else begin
        mem_13_Im <= _GEN_109;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'he == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_14_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_14_Re <= _GEN_158;
        end
      end else begin
        mem_14_Re <= _GEN_158;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'he == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_14_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_14_Im <= _GEN_110;
        end
      end else begin
        mem_14_Im <= _GEN_110;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'hf == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_15_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_15_Re <= _GEN_159;
        end
      end else begin
        mem_15_Re <= _GEN_159;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'hf == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_15_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_15_Im <= _GEN_111;
        end
      end else begin
        mem_15_Im <= _GEN_111;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h10 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_16_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_16_Re <= _GEN_160;
        end
      end else begin
        mem_16_Re <= _GEN_160;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h10 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_16_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_16_Im <= _GEN_112;
        end
      end else begin
        mem_16_Im <= _GEN_112;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h11 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_17_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_17_Re <= _GEN_161;
        end
      end else begin
        mem_17_Re <= _GEN_161;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h11 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_17_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_17_Im <= _GEN_113;
        end
      end else begin
        mem_17_Im <= _GEN_113;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h12 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_18_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_18_Re <= _GEN_162;
        end
      end else begin
        mem_18_Re <= _GEN_162;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h12 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_18_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_18_Im <= _GEN_114;
        end
      end else begin
        mem_18_Im <= _GEN_114;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h13 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_19_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_19_Re <= _GEN_163;
        end
      end else begin
        mem_19_Re <= _GEN_163;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h13 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_19_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_19_Im <= _GEN_115;
        end
      end else begin
        mem_19_Im <= _GEN_115;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h14 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_20_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_20_Re <= _GEN_164;
        end
      end else begin
        mem_20_Re <= _GEN_164;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h14 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_20_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_20_Im <= _GEN_116;
        end
      end else begin
        mem_20_Im <= _GEN_116;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h15 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_21_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_21_Re <= _GEN_165;
        end
      end else begin
        mem_21_Re <= _GEN_165;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h15 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_21_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_21_Im <= _GEN_117;
        end
      end else begin
        mem_21_Im <= _GEN_117;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h16 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_22_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_22_Re <= _GEN_166;
        end
      end else begin
        mem_22_Re <= _GEN_166;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h16 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_22_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_22_Im <= _GEN_118;
        end
      end else begin
        mem_22_Im <= _GEN_118;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h17 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_23_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_23_Re <= _GEN_167;
        end
      end else begin
        mem_23_Re <= _GEN_167;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h17 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_23_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_23_Im <= _GEN_119;
        end
      end else begin
        mem_23_Im <= _GEN_119;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h18 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_24_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_24_Re <= _GEN_168;
        end
      end else begin
        mem_24_Re <= _GEN_168;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h18 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_24_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_24_Im <= _GEN_120;
        end
      end else begin
        mem_24_Im <= _GEN_120;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h19 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_25_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_25_Re <= _GEN_169;
        end
      end else begin
        mem_25_Re <= _GEN_169;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h19 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_25_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_25_Im <= _GEN_121;
        end
      end else begin
        mem_25_Im <= _GEN_121;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h1a == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_26_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_26_Re <= _GEN_170;
        end
      end else begin
        mem_26_Re <= _GEN_170;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h1a == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_26_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_26_Im <= _GEN_122;
        end
      end else begin
        mem_26_Im <= _GEN_122;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h1b == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_27_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_27_Re <= _GEN_171;
        end
      end else begin
        mem_27_Re <= _GEN_171;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h1b == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_27_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_27_Im <= _GEN_123;
        end
      end else begin
        mem_27_Im <= _GEN_123;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h1c == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_28_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_28_Re <= _GEN_172;
        end
      end else begin
        mem_28_Re <= _GEN_172;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h1c == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_28_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_28_Im <= _GEN_124;
        end
      end else begin
        mem_28_Im <= _GEN_124;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h1d == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_29_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_29_Re <= _GEN_173;
        end
      end else begin
        mem_29_Re <= _GEN_173;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h1d == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_29_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_29_Im <= _GEN_125;
        end
      end else begin
        mem_29_Im <= _GEN_125;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h1e == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_30_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_30_Re <= _GEN_174;
        end
      end else begin
        mem_30_Re <= _GEN_174;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h1e == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_30_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_30_Im <= _GEN_126;
        end
      end else begin
        mem_30_Im <= _GEN_126;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h1f == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_31_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_31_Re <= _GEN_175;
        end
      end else begin
        mem_31_Re <= _GEN_175;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h1f == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_31_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_31_Im <= _GEN_127;
        end
      end else begin
        mem_31_Im <= _GEN_127;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h20 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_32_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_32_Re <= _GEN_176;
        end
      end else begin
        mem_32_Re <= _GEN_176;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h20 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_32_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_32_Im <= _GEN_128;
        end
      end else begin
        mem_32_Im <= _GEN_128;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h21 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_33_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_33_Re <= _GEN_177;
        end
      end else begin
        mem_33_Re <= _GEN_177;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h21 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_33_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_33_Im <= _GEN_129;
        end
      end else begin
        mem_33_Im <= _GEN_129;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h22 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_34_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_34_Re <= _GEN_178;
        end
      end else begin
        mem_34_Re <= _GEN_178;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h22 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_34_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_34_Im <= _GEN_130;
        end
      end else begin
        mem_34_Im <= _GEN_130;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h23 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_35_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_35_Re <= _GEN_179;
        end
      end else begin
        mem_35_Re <= _GEN_179;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h23 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_35_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_35_Im <= _GEN_131;
        end
      end else begin
        mem_35_Im <= _GEN_131;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h24 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_36_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_36_Re <= _GEN_180;
        end
      end else begin
        mem_36_Re <= _GEN_180;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h24 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_36_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_36_Im <= _GEN_132;
        end
      end else begin
        mem_36_Im <= _GEN_132;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h25 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_37_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_37_Re <= _GEN_181;
        end
      end else begin
        mem_37_Re <= _GEN_181;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h25 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_37_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_37_Im <= _GEN_133;
        end
      end else begin
        mem_37_Im <= _GEN_133;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h26 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_38_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_38_Re <= _GEN_182;
        end
      end else begin
        mem_38_Re <= _GEN_182;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h26 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_38_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_38_Im <= _GEN_134;
        end
      end else begin
        mem_38_Im <= _GEN_134;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h27 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_39_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_39_Re <= _GEN_183;
        end
      end else begin
        mem_39_Re <= _GEN_183;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h27 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_39_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_39_Im <= _GEN_135;
        end
      end else begin
        mem_39_Im <= _GEN_135;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h28 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_40_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_40_Re <= _GEN_184;
        end
      end else begin
        mem_40_Re <= _GEN_184;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h28 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_40_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_40_Im <= _GEN_136;
        end
      end else begin
        mem_40_Im <= _GEN_136;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h29 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_41_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_41_Re <= _GEN_185;
        end
      end else begin
        mem_41_Re <= _GEN_185;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h29 == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_41_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_41_Im <= _GEN_137;
        end
      end else begin
        mem_41_Im <= _GEN_137;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h2a == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_42_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_42_Re <= _GEN_186;
        end
      end else begin
        mem_42_Re <= _GEN_186;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h2a == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_42_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_42_Im <= _GEN_138;
        end
      end else begin
        mem_42_Im <= _GEN_138;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h2b == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_43_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_43_Re <= _GEN_187;
        end
      end else begin
        mem_43_Re <= _GEN_187;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h2b == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_43_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_43_Im <= _GEN_139;
        end
      end else begin
        mem_43_Im <= _GEN_139;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h2c == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_44_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_44_Re <= _GEN_188;
        end
      end else begin
        mem_44_Re <= _GEN_188;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h2c == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_44_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_44_Im <= _GEN_140;
        end
      end else begin
        mem_44_Im <= _GEN_140;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h2d == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_45_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_45_Re <= _GEN_189;
        end
      end else begin
        mem_45_Re <= _GEN_189;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h2d == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_45_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_45_Im <= _GEN_141;
        end
      end else begin
        mem_45_Im <= _GEN_141;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h2e == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_46_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_46_Re <= _GEN_190;
        end
      end else begin
        mem_46_Re <= _GEN_190;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h2e == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_46_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_46_Im <= _GEN_142;
        end
      end else begin
        mem_46_Im <= _GEN_142;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h2f == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_47_Re <= io_in_data_1_Re; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_47_Re <= _GEN_191;
        end
      end else begin
        mem_47_Re <= _GEN_191;
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 3314:16]
      if (io_wr_1) begin // @[FFTDesigns.scala 3316:23]
        if (6'h2f == io_in_waddr_1) begin // @[FFTDesigns.scala 3317:31]
          mem_47_Im <= io_in_data_1_Im; // @[FFTDesigns.scala 3317:31]
        end else begin
          mem_47_Im <= _GEN_143;
        end
      end else begin
        mem_47_Im <= _GEN_143;
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
  _RAND_8 = {1{`RANDOM}};
  mem_4_Re = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  mem_4_Im = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  mem_5_Re = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  mem_5_Im = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  mem_6_Re = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  mem_6_Im = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  mem_7_Re = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  mem_7_Im = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  mem_8_Re = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  mem_8_Im = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  mem_9_Re = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  mem_9_Im = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  mem_10_Re = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  mem_10_Im = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  mem_11_Re = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  mem_11_Im = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  mem_12_Re = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  mem_12_Im = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  mem_13_Re = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  mem_13_Im = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  mem_14_Re = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  mem_14_Im = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  mem_15_Re = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  mem_15_Im = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  mem_16_Re = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  mem_16_Im = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  mem_17_Re = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  mem_17_Im = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  mem_18_Re = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  mem_18_Im = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  mem_19_Re = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  mem_19_Im = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  mem_20_Re = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  mem_20_Im = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  mem_21_Re = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  mem_21_Im = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  mem_22_Re = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  mem_22_Im = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  mem_23_Re = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  mem_23_Im = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  mem_24_Re = _RAND_48[31:0];
  _RAND_49 = {1{`RANDOM}};
  mem_24_Im = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  mem_25_Re = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  mem_25_Im = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  mem_26_Re = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  mem_26_Im = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  mem_27_Re = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  mem_27_Im = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  mem_28_Re = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  mem_28_Im = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  mem_29_Re = _RAND_58[31:0];
  _RAND_59 = {1{`RANDOM}};
  mem_29_Im = _RAND_59[31:0];
  _RAND_60 = {1{`RANDOM}};
  mem_30_Re = _RAND_60[31:0];
  _RAND_61 = {1{`RANDOM}};
  mem_30_Im = _RAND_61[31:0];
  _RAND_62 = {1{`RANDOM}};
  mem_31_Re = _RAND_62[31:0];
  _RAND_63 = {1{`RANDOM}};
  mem_31_Im = _RAND_63[31:0];
  _RAND_64 = {1{`RANDOM}};
  mem_32_Re = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  mem_32_Im = _RAND_65[31:0];
  _RAND_66 = {1{`RANDOM}};
  mem_33_Re = _RAND_66[31:0];
  _RAND_67 = {1{`RANDOM}};
  mem_33_Im = _RAND_67[31:0];
  _RAND_68 = {1{`RANDOM}};
  mem_34_Re = _RAND_68[31:0];
  _RAND_69 = {1{`RANDOM}};
  mem_34_Im = _RAND_69[31:0];
  _RAND_70 = {1{`RANDOM}};
  mem_35_Re = _RAND_70[31:0];
  _RAND_71 = {1{`RANDOM}};
  mem_35_Im = _RAND_71[31:0];
  _RAND_72 = {1{`RANDOM}};
  mem_36_Re = _RAND_72[31:0];
  _RAND_73 = {1{`RANDOM}};
  mem_36_Im = _RAND_73[31:0];
  _RAND_74 = {1{`RANDOM}};
  mem_37_Re = _RAND_74[31:0];
  _RAND_75 = {1{`RANDOM}};
  mem_37_Im = _RAND_75[31:0];
  _RAND_76 = {1{`RANDOM}};
  mem_38_Re = _RAND_76[31:0];
  _RAND_77 = {1{`RANDOM}};
  mem_38_Im = _RAND_77[31:0];
  _RAND_78 = {1{`RANDOM}};
  mem_39_Re = _RAND_78[31:0];
  _RAND_79 = {1{`RANDOM}};
  mem_39_Im = _RAND_79[31:0];
  _RAND_80 = {1{`RANDOM}};
  mem_40_Re = _RAND_80[31:0];
  _RAND_81 = {1{`RANDOM}};
  mem_40_Im = _RAND_81[31:0];
  _RAND_82 = {1{`RANDOM}};
  mem_41_Re = _RAND_82[31:0];
  _RAND_83 = {1{`RANDOM}};
  mem_41_Im = _RAND_83[31:0];
  _RAND_84 = {1{`RANDOM}};
  mem_42_Re = _RAND_84[31:0];
  _RAND_85 = {1{`RANDOM}};
  mem_42_Im = _RAND_85[31:0];
  _RAND_86 = {1{`RANDOM}};
  mem_43_Re = _RAND_86[31:0];
  _RAND_87 = {1{`RANDOM}};
  mem_43_Im = _RAND_87[31:0];
  _RAND_88 = {1{`RANDOM}};
  mem_44_Re = _RAND_88[31:0];
  _RAND_89 = {1{`RANDOM}};
  mem_44_Im = _RAND_89[31:0];
  _RAND_90 = {1{`RANDOM}};
  mem_45_Re = _RAND_90[31:0];
  _RAND_91 = {1{`RANDOM}};
  mem_45_Im = _RAND_91[31:0];
  _RAND_92 = {1{`RANDOM}};
  mem_46_Re = _RAND_92[31:0];
  _RAND_93 = {1{`RANDOM}};
  mem_46_Im = _RAND_93[31:0];
  _RAND_94 = {1{`RANDOM}};
  mem_47_Re = _RAND_94[31:0];
  _RAND_95 = {1{`RANDOM}};
  mem_47_Im = _RAND_95[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PermutationsWithStreaming_mr_1(
  input         clock,
  input         reset,
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  input  [31:0] io_in_2_Re,
  input  [31:0] io_in_2_Im,
  input  [31:0] io_in_3_Re,
  input  [31:0] io_in_3_Im,
  input  [31:0] io_in_4_Re,
  input  [31:0] io_in_4_Im,
  input  [31:0] io_in_5_Re,
  input  [31:0] io_in_5_Im,
  input         io_in_en_0,
  input         io_in_en_1,
  input         io_in_en_2,
  input         io_in_en_3,
  input         io_in_en_4,
  input         io_in_en_5,
  input         io_in_en_6,
  input         io_in_en_7,
  input         io_in_en_8,
  input         io_in_en_9,
  input         io_in_en_10,
  input         io_in_en_11,
  input         io_in_en_12,
  input         io_in_en_13,
  input         io_in_en_14,
  input         io_in_en_15,
  input         io_in_en_16,
  input         io_in_en_17,
  input         io_in_en_18,
  input         io_in_en_19,
  input         io_in_en_20,
  input         io_in_en_21,
  input         io_in_en_22,
  input         io_in_en_23,
  input         io_in_en_24,
  input         io_in_en_25,
  input         io_in_en_26,
  input         io_in_en_27,
  input         io_in_en_28,
  input         io_in_en_29,
  input         io_in_en_30,
  input         io_in_en_31,
  input         io_in_en_32,
  input         io_in_en_33,
  input         io_in_en_34,
  input         io_in_en_35,
  input         io_in_en_36,
  input         io_in_en_37,
  input         io_in_en_38,
  input         io_in_en_39,
  input         io_in_en_40,
  input         io_in_en_41,
  input         io_in_en_42,
  input         io_in_en_43,
  input         io_in_en_44,
  input         io_in_en_45,
  input         io_in_en_46,
  input         io_in_en_47,
  input         io_in_en_48,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im,
  output [31:0] io_out_2_Re,
  output [31:0] io_out_2_Im,
  output [31:0] io_out_3_Re,
  output [31:0] io_out_3_Im
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
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
`endif // RANDOMIZE_REG_INIT
  wire  RAM_Block_mw_clock; // @[FFTDesigns.scala 2837:26]
  wire [5:0] RAM_Block_mw_io_in_raddr; // @[FFTDesigns.scala 2837:26]
  wire [5:0] RAM_Block_mw_io_in_waddr_0; // @[FFTDesigns.scala 2837:26]
  wire [5:0] RAM_Block_mw_io_in_waddr_1; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_io_in_data_0_Re; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_io_in_data_0_Im; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_io_in_data_1_Re; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_io_in_data_1_Im; // @[FFTDesigns.scala 2837:26]
  wire  RAM_Block_mw_io_re; // @[FFTDesigns.scala 2837:26]
  wire  RAM_Block_mw_io_wr_0; // @[FFTDesigns.scala 2837:26]
  wire  RAM_Block_mw_io_wr_1; // @[FFTDesigns.scala 2837:26]
  wire  RAM_Block_mw_io_en; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_io_out_data_Re; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_io_out_data_Im; // @[FFTDesigns.scala 2837:26]
  wire  RAM_Block_mw_1_clock; // @[FFTDesigns.scala 2837:26]
  wire [5:0] RAM_Block_mw_1_io_in_raddr; // @[FFTDesigns.scala 2837:26]
  wire [5:0] RAM_Block_mw_1_io_in_waddr_0; // @[FFTDesigns.scala 2837:26]
  wire [5:0] RAM_Block_mw_1_io_in_waddr_1; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_1_io_in_data_0_Re; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_1_io_in_data_0_Im; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_1_io_in_data_1_Re; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_1_io_in_data_1_Im; // @[FFTDesigns.scala 2837:26]
  wire  RAM_Block_mw_1_io_re; // @[FFTDesigns.scala 2837:26]
  wire  RAM_Block_mw_1_io_wr_0; // @[FFTDesigns.scala 2837:26]
  wire  RAM_Block_mw_1_io_wr_1; // @[FFTDesigns.scala 2837:26]
  wire  RAM_Block_mw_1_io_en; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_1_io_out_data_Re; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_1_io_out_data_Im; // @[FFTDesigns.scala 2837:26]
  wire  RAM_Block_mw_2_clock; // @[FFTDesigns.scala 2837:26]
  wire [5:0] RAM_Block_mw_2_io_in_raddr; // @[FFTDesigns.scala 2837:26]
  wire [5:0] RAM_Block_mw_2_io_in_waddr_0; // @[FFTDesigns.scala 2837:26]
  wire [5:0] RAM_Block_mw_2_io_in_waddr_1; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_2_io_in_data_0_Re; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_2_io_in_data_0_Im; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_2_io_in_data_1_Re; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_2_io_in_data_1_Im; // @[FFTDesigns.scala 2837:26]
  wire  RAM_Block_mw_2_io_re; // @[FFTDesigns.scala 2837:26]
  wire  RAM_Block_mw_2_io_wr_0; // @[FFTDesigns.scala 2837:26]
  wire  RAM_Block_mw_2_io_wr_1; // @[FFTDesigns.scala 2837:26]
  wire  RAM_Block_mw_2_io_en; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_2_io_out_data_Re; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_2_io_out_data_Im; // @[FFTDesigns.scala 2837:26]
  wire  RAM_Block_mw_3_clock; // @[FFTDesigns.scala 2837:26]
  wire [5:0] RAM_Block_mw_3_io_in_raddr; // @[FFTDesigns.scala 2837:26]
  wire [5:0] RAM_Block_mw_3_io_in_waddr_0; // @[FFTDesigns.scala 2837:26]
  wire [5:0] RAM_Block_mw_3_io_in_waddr_1; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_3_io_in_data_0_Re; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_3_io_in_data_0_Im; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_3_io_in_data_1_Re; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_3_io_in_data_1_Im; // @[FFTDesigns.scala 2837:26]
  wire  RAM_Block_mw_3_io_re; // @[FFTDesigns.scala 2837:26]
  wire  RAM_Block_mw_3_io_wr_0; // @[FFTDesigns.scala 2837:26]
  wire  RAM_Block_mw_3_io_wr_1; // @[FFTDesigns.scala 2837:26]
  wire  RAM_Block_mw_3_io_en; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_3_io_out_data_Re; // @[FFTDesigns.scala 2837:26]
  wire [31:0] RAM_Block_mw_3_io_out_data_Im; // @[FFTDesigns.scala 2837:26]
  wire  RAM_Block_clock; // @[FFTDesigns.scala 2841:26]
  wire [5:0] RAM_Block_io_in_raddr; // @[FFTDesigns.scala 2841:26]
  wire [5:0] RAM_Block_io_in_waddr; // @[FFTDesigns.scala 2841:26]
  wire [31:0] RAM_Block_io_in_data_Re; // @[FFTDesigns.scala 2841:26]
  wire [31:0] RAM_Block_io_in_data_Im; // @[FFTDesigns.scala 2841:26]
  wire  RAM_Block_io_re; // @[FFTDesigns.scala 2841:26]
  wire  RAM_Block_io_wr; // @[FFTDesigns.scala 2841:26]
  wire  RAM_Block_io_en; // @[FFTDesigns.scala 2841:26]
  wire [31:0] RAM_Block_io_out_data_Re; // @[FFTDesigns.scala 2841:26]
  wire [31:0] RAM_Block_io_out_data_Im; // @[FFTDesigns.scala 2841:26]
  wire  RAM_Block_1_clock; // @[FFTDesigns.scala 2841:26]
  wire [5:0] RAM_Block_1_io_in_raddr; // @[FFTDesigns.scala 2841:26]
  wire [5:0] RAM_Block_1_io_in_waddr; // @[FFTDesigns.scala 2841:26]
  wire [31:0] RAM_Block_1_io_in_data_Re; // @[FFTDesigns.scala 2841:26]
  wire [31:0] RAM_Block_1_io_in_data_Im; // @[FFTDesigns.scala 2841:26]
  wire  RAM_Block_1_io_re; // @[FFTDesigns.scala 2841:26]
  wire  RAM_Block_1_io_wr; // @[FFTDesigns.scala 2841:26]
  wire  RAM_Block_1_io_en; // @[FFTDesigns.scala 2841:26]
  wire [31:0] RAM_Block_1_io_out_data_Re; // @[FFTDesigns.scala 2841:26]
  wire [31:0] RAM_Block_1_io_out_data_Im; // @[FFTDesigns.scala 2841:26]
  wire  RAM_Block_2_clock; // @[FFTDesigns.scala 2841:26]
  wire [5:0] RAM_Block_2_io_in_raddr; // @[FFTDesigns.scala 2841:26]
  wire [5:0] RAM_Block_2_io_in_waddr; // @[FFTDesigns.scala 2841:26]
  wire [31:0] RAM_Block_2_io_in_data_Re; // @[FFTDesigns.scala 2841:26]
  wire [31:0] RAM_Block_2_io_in_data_Im; // @[FFTDesigns.scala 2841:26]
  wire  RAM_Block_2_io_re; // @[FFTDesigns.scala 2841:26]
  wire  RAM_Block_2_io_wr; // @[FFTDesigns.scala 2841:26]
  wire  RAM_Block_2_io_en; // @[FFTDesigns.scala 2841:26]
  wire [31:0] RAM_Block_2_io_out_data_Re; // @[FFTDesigns.scala 2841:26]
  wire [31:0] RAM_Block_2_io_out_data_Im; // @[FFTDesigns.scala 2841:26]
  wire  RAM_Block_3_clock; // @[FFTDesigns.scala 2841:26]
  wire [5:0] RAM_Block_3_io_in_raddr; // @[FFTDesigns.scala 2841:26]
  wire [5:0] RAM_Block_3_io_in_waddr; // @[FFTDesigns.scala 2841:26]
  wire [31:0] RAM_Block_3_io_in_data_Re; // @[FFTDesigns.scala 2841:26]
  wire [31:0] RAM_Block_3_io_in_data_Im; // @[FFTDesigns.scala 2841:26]
  wire  RAM_Block_3_io_re; // @[FFTDesigns.scala 2841:26]
  wire  RAM_Block_3_io_wr; // @[FFTDesigns.scala 2841:26]
  wire  RAM_Block_3_io_en; // @[FFTDesigns.scala 2841:26]
  wire [31:0] RAM_Block_3_io_out_data_Re; // @[FFTDesigns.scala 2841:26]
  wire [31:0] RAM_Block_3_io_out_data_Im; // @[FFTDesigns.scala 2841:26]
  wire [31:0] PermutationModuleStreamed_io_in_0_Re; // @[FFTDesigns.scala 2907:28]
  wire [31:0] PermutationModuleStreamed_io_in_0_Im; // @[FFTDesigns.scala 2907:28]
  wire [31:0] PermutationModuleStreamed_io_in_1_Re; // @[FFTDesigns.scala 2907:28]
  wire [31:0] PermutationModuleStreamed_io_in_1_Im; // @[FFTDesigns.scala 2907:28]
  wire [31:0] PermutationModuleStreamed_io_in_2_Re; // @[FFTDesigns.scala 2907:28]
  wire [31:0] PermutationModuleStreamed_io_in_2_Im; // @[FFTDesigns.scala 2907:28]
  wire [31:0] PermutationModuleStreamed_io_in_3_Re; // @[FFTDesigns.scala 2907:28]
  wire [31:0] PermutationModuleStreamed_io_in_3_Im; // @[FFTDesigns.scala 2907:28]
  wire [1:0] PermutationModuleStreamed_io_in_config_0; // @[FFTDesigns.scala 2907:28]
  wire [1:0] PermutationModuleStreamed_io_in_config_1; // @[FFTDesigns.scala 2907:28]
  wire [1:0] PermutationModuleStreamed_io_in_config_2; // @[FFTDesigns.scala 2907:28]
  wire [31:0] PermutationModuleStreamed_io_out_0_Re; // @[FFTDesigns.scala 2907:28]
  wire [31:0] PermutationModuleStreamed_io_out_0_Im; // @[FFTDesigns.scala 2907:28]
  wire [31:0] PermutationModuleStreamed_io_out_1_Re; // @[FFTDesigns.scala 2907:28]
  wire [31:0] PermutationModuleStreamed_io_out_1_Im; // @[FFTDesigns.scala 2907:28]
  wire [31:0] PermutationModuleStreamed_io_out_2_Re; // @[FFTDesigns.scala 2907:28]
  wire [31:0] PermutationModuleStreamed_io_out_2_Im; // @[FFTDesigns.scala 2907:28]
  wire [31:0] PermutationModuleStreamed_io_out_3_Re; // @[FFTDesigns.scala 2907:28]
  wire [31:0] PermutationModuleStreamed_io_out_3_Im; // @[FFTDesigns.scala 2907:28]
  wire [4:0] M0_Config_ROM_io_in_cnt; // @[FFTDesigns.scala 2908:29]
  wire [5:0] M0_Config_ROM_io_out_0; // @[FFTDesigns.scala 2908:29]
  wire [5:0] M0_Config_ROM_io_out_1; // @[FFTDesigns.scala 2908:29]
  wire [5:0] M0_Config_ROM_io_out_2; // @[FFTDesigns.scala 2908:29]
  wire [5:0] M0_Config_ROM_io_out_3; // @[FFTDesigns.scala 2908:29]
  wire [4:0] M1_Config_ROM_io_in_cnt; // @[FFTDesigns.scala 2909:29]
  wire [5:0] M1_Config_ROM_io_out_0; // @[FFTDesigns.scala 2909:29]
  wire [5:0] M1_Config_ROM_io_out_1; // @[FFTDesigns.scala 2909:29]
  wire [5:0] M1_Config_ROM_io_out_2; // @[FFTDesigns.scala 2909:29]
  wire [5:0] M1_Config_ROM_io_out_3; // @[FFTDesigns.scala 2909:29]
  wire [4:0] Streaming_Permute_Config_io_in_cnt; // @[FFTDesigns.scala 2910:31]
  wire [1:0] Streaming_Permute_Config_io_out_0; // @[FFTDesigns.scala 2910:31]
  wire [1:0] Streaming_Permute_Config_io_out_1; // @[FFTDesigns.scala 2910:31]
  wire [1:0] Streaming_Permute_Config_io_out_2; // @[FFTDesigns.scala 2910:31]
  reg  offset_switch; // @[FFTDesigns.scala 2710:28]
  reg [31:0] input_delay_registers_0_0_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_0_0_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_0_1_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_0_1_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_0_2_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_0_2_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_0_3_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_0_3_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_0_4_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_0_4_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_0_5_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_0_5_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_1_0_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_1_0_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_1_1_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_1_1_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_1_2_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_1_2_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_1_3_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_1_3_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_1_4_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_1_4_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_1_5_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_1_5_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_2_0_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_2_0_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_2_1_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_2_1_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_2_2_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_2_2_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_2_3_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_2_3_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_2_4_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_2_4_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_2_5_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_2_5_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_3_0_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_3_0_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_3_1_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_3_1_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_3_2_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_3_2_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_3_3_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_3_3_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_3_4_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_3_4_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_3_5_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_3_5_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_4_0_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_4_0_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_4_1_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_4_1_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_4_2_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_4_2_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_4_3_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_4_3_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_4_4_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_4_4_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_4_5_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_4_5_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_5_0_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_5_0_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_5_1_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_5_1_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_5_2_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_5_2_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_5_3_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_5_3_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_5_4_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_5_4_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_5_5_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_5_5_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_6_0_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_6_0_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_6_1_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_6_1_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_6_2_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_6_2_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_6_3_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_6_3_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_6_4_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_6_4_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_6_5_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_6_5_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_7_0_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_7_0_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_7_1_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_7_1_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_7_2_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_7_2_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_7_3_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_7_3_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_7_4_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_7_4_Im; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_7_5_Re; // @[FFTDesigns.scala 2834:42]
  reg [31:0] input_delay_registers_7_5_Im; // @[FFTDesigns.scala 2834:42]
  reg [4:0] cnt2; // @[FFTDesigns.scala 2912:25]
  reg [3:0] cnt; // @[FFTDesigns.scala 2913:24]
  wire [5:0] lo_lo_lo = {io_in_en_5,io_in_en_4,io_in_en_3,io_in_en_2,io_in_en_1,io_in_en_0}; // @[FFTDesigns.scala 2914:21]
  wire [11:0] lo_lo = {io_in_en_11,io_in_en_10,io_in_en_9,io_in_en_8,io_in_en_7,io_in_en_6,lo_lo_lo}; // @[FFTDesigns.scala 2914:21]
  wire [5:0] lo_hi_lo = {io_in_en_17,io_in_en_16,io_in_en_15,io_in_en_14,io_in_en_13,io_in_en_12}; // @[FFTDesigns.scala 2914:21]
  wire [23:0] lo = {io_in_en_23,io_in_en_22,io_in_en_21,io_in_en_20,io_in_en_19,io_in_en_18,lo_hi_lo,lo_lo}; // @[FFTDesigns.scala 2914:21]
  wire [5:0] hi_lo_lo = {io_in_en_29,io_in_en_28,io_in_en_27,io_in_en_26,io_in_en_25,io_in_en_24}; // @[FFTDesigns.scala 2914:21]
  wire [11:0] hi_lo = {io_in_en_35,io_in_en_34,io_in_en_33,io_in_en_32,io_in_en_31,io_in_en_30,hi_lo_lo}; // @[FFTDesigns.scala 2914:21]
  wire [5:0] hi_hi_lo = {io_in_en_41,io_in_en_40,io_in_en_39,io_in_en_38,io_in_en_37,io_in_en_36}; // @[FFTDesigns.scala 2914:21]
  wire [48:0] _T = {io_in_en_48,io_in_en_47,io_in_en_46,io_in_en_45,io_in_en_44,io_in_en_43,io_in_en_42,hi_hi_lo,hi_lo,
    lo}; // @[FFTDesigns.scala 2914:21]
  wire  M0_0_re = |_T; // @[FFTDesigns.scala 2914:28]
  wire  _T_3 = cnt == 4'hf; // @[FFTDesigns.scala 2922:46]
  wire  _offset_switch_T = ~offset_switch; // @[FFTDesigns.scala 2925:28]
  wire [4:0] _cnt2_T_1 = cnt2 + 5'h1; // @[FFTDesigns.scala 2928:24]
  wire [3:0] _cnt_T_1 = cnt + 4'h1; // @[FFTDesigns.scala 2933:24]
  wire [3:0] _GEN_0 = cnt2 >= 5'h8 ? _cnt_T_1 : 4'h0; // @[FFTDesigns.scala 2932:32 2933:17 2935:17]
  wire  _GEN_6 = cnt2 == 5'h17 & cnt == 4'hf ? ~offset_switch : offset_switch; // @[FFTDesigns.scala 2922:69 2925:25]
  wire [5:0] _M0_0_in_raddr_T_1 = 5'h18 * _offset_switch_T; // @[FFTDesigns.scala 2950:56]
  wire [5:0] _M0_0_in_raddr_T_3 = M0_Config_ROM_io_out_0 + _M0_0_in_raddr_T_1; // @[FFTDesigns.scala 2950:46]
  wire [5:0] _GEN_668 = {{1'd0}, cnt2}; // @[FFTDesigns.scala 2951:34]
  wire [5:0] _M1_0_in_raddr_T_3 = _GEN_668 + _M0_0_in_raddr_T_1; // @[FFTDesigns.scala 2951:34]
  wire [5:0] _M1_0_in_waddr_T = 5'h18 * offset_switch; // @[FFTDesigns.scala 2952:56]
  wire [5:0] _M1_0_in_waddr_T_2 = M1_Config_ROM_io_out_0 + _M1_0_in_waddr_T; // @[FFTDesigns.scala 2952:46]
  wire [5:0] _M0_1_in_raddr_T_3 = M0_Config_ROM_io_out_1 + _M0_0_in_raddr_T_1; // @[FFTDesigns.scala 2950:46]
  wire [5:0] _M1_1_in_waddr_T_2 = M1_Config_ROM_io_out_1 + _M1_0_in_waddr_T; // @[FFTDesigns.scala 2952:46]
  wire [5:0] _M0_2_in_raddr_T_3 = M0_Config_ROM_io_out_2 + _M0_0_in_raddr_T_1; // @[FFTDesigns.scala 2950:46]
  wire [5:0] _M1_2_in_waddr_T_2 = M1_Config_ROM_io_out_2 + _M1_0_in_waddr_T; // @[FFTDesigns.scala 2952:46]
  wire [5:0] _M0_3_in_raddr_T_3 = M0_Config_ROM_io_out_3 + _M0_0_in_raddr_T_1; // @[FFTDesigns.scala 2950:46]
  wire [5:0] _M1_3_in_waddr_T_2 = M1_Config_ROM_io_out_3 + _M1_0_in_waddr_T; // @[FFTDesigns.scala 2952:46]
  wire [4:0] _GEN_24 = 4'h1 == cnt ? 5'h2 : 5'h0; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_25 = 4'h2 == cnt ? 5'h3 : _GEN_24; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_26 = 4'h3 == cnt ? 5'h5 : _GEN_25; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_27 = 4'h4 == cnt ? 5'h6 : _GEN_26; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_28 = 4'h5 == cnt ? 5'h8 : _GEN_27; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_29 = 4'h6 == cnt ? 5'h9 : _GEN_28; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_30 = 4'h7 == cnt ? 5'hb : _GEN_29; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_31 = 4'h8 == cnt ? 5'hc : _GEN_30; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_32 = 4'h9 == cnt ? 5'he : _GEN_31; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_33 = 4'ha == cnt ? 5'hf : _GEN_32; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_34 = 4'hb == cnt ? 5'h11 : _GEN_33; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_35 = 4'hc == cnt ? 5'h12 : _GEN_34; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_36 = 4'hd == cnt ? 5'h14 : _GEN_35; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_37 = 4'he == cnt ? 5'h15 : _GEN_36; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_38 = 4'hf == cnt ? 5'h17 : _GEN_37; // @[FFTDesigns.scala 2978:{55,55}]
  wire [5:0] _GEN_672 = {{1'd0}, _GEN_38}; // @[FFTDesigns.scala 2978:55]
  wire [5:0] _M0_0_in_waddr_0_T_2 = _GEN_672 + _M1_0_in_waddr_T; // @[FFTDesigns.scala 2978:55]
  wire [2:0] _GEN_40 = 4'h1 == cnt ? 3'h2 : 3'h0; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_41 = 4'h2 == cnt ? 3'h0 : _GEN_40; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_42 = 4'h3 == cnt ? 3'h2 : _GEN_41; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_43 = 4'h4 == cnt ? 3'h0 : _GEN_42; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_44 = 4'h5 == cnt ? 3'h2 : _GEN_43; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_45 = 4'h6 == cnt ? 3'h0 : _GEN_44; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_46 = 4'h7 == cnt ? 3'h2 : _GEN_45; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_47 = 4'h8 == cnt ? 3'h0 : _GEN_46; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_48 = 4'h9 == cnt ? 3'h2 : _GEN_47; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_49 = 4'ha == cnt ? 3'h0 : _GEN_48; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_50 = 4'hb == cnt ? 3'h2 : _GEN_49; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_51 = 4'hc == cnt ? 3'h0 : _GEN_50; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_52 = 4'hd == cnt ? 3'h2 : _GEN_51; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_53 = 4'he == cnt ? 3'h0 : _GEN_52; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_54 = 4'hf == cnt ? 3'h2 : _GEN_53; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_56 = 3'h1 == _GEN_54 ? input_delay_registers_7_1_Im : input_delay_registers_7_0_Im; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_57 = 3'h2 == _GEN_54 ? input_delay_registers_7_2_Im : _GEN_56; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_58 = 3'h3 == _GEN_54 ? input_delay_registers_7_3_Im : _GEN_57; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_59 = 3'h4 == _GEN_54 ? input_delay_registers_7_4_Im : _GEN_58; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_60 = 3'h5 == _GEN_54 ? input_delay_registers_7_5_Im : _GEN_59; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_62 = 3'h1 == _GEN_54 ? input_delay_registers_7_1_Re : input_delay_registers_7_0_Re; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_63 = 3'h2 == _GEN_54 ? input_delay_registers_7_2_Re : _GEN_62; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_64 = 3'h3 == _GEN_54 ? input_delay_registers_7_3_Re : _GEN_63; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_65 = 3'h4 == _GEN_54 ? input_delay_registers_7_4_Re : _GEN_64; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_66 = 3'h5 == _GEN_54 ? input_delay_registers_7_5_Re : _GEN_65; // @[FFTDesigns.scala 2979:{32,32}]
  wire  _GEN_68 = 4'h1 == cnt ? 1'h0 : 1'h1; // @[FFTDesigns.scala 2977:{27,27}]
  wire  _GEN_70 = 4'h3 == cnt ? 1'h0 : 4'h2 == cnt | _GEN_68; // @[FFTDesigns.scala 2977:{27,27}]
  wire  _GEN_72 = 4'h5 == cnt ? 1'h0 : 4'h4 == cnt | _GEN_70; // @[FFTDesigns.scala 2977:{27,27}]
  wire  _GEN_74 = 4'h7 == cnt ? 1'h0 : 4'h6 == cnt | _GEN_72; // @[FFTDesigns.scala 2977:{27,27}]
  wire  _GEN_76 = 4'h9 == cnt ? 1'h0 : 4'h8 == cnt | _GEN_74; // @[FFTDesigns.scala 2977:{27,27}]
  wire  _GEN_78 = 4'hb == cnt ? 1'h0 : 4'ha == cnt | _GEN_76; // @[FFTDesigns.scala 2977:{27,27}]
  wire  _GEN_80 = 4'hd == cnt ? 1'h0 : 4'hc == cnt | _GEN_78; // @[FFTDesigns.scala 2977:{27,27}]
  wire  _GEN_82 = 4'hf == cnt ? 1'h0 : 4'he == cnt | _GEN_80; // @[FFTDesigns.scala 2977:{27,27}]
  wire [4:0] _GEN_84 = 4'h1 == cnt ? 5'h0 : 5'h1; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_85 = 4'h2 == cnt ? 5'h4 : _GEN_84; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_86 = 4'h3 == cnt ? 5'h0 : _GEN_85; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_87 = 4'h4 == cnt ? 5'h7 : _GEN_86; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_88 = 4'h5 == cnt ? 5'h0 : _GEN_87; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_89 = 4'h6 == cnt ? 5'ha : _GEN_88; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_90 = 4'h7 == cnt ? 5'h0 : _GEN_89; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_91 = 4'h8 == cnt ? 5'hd : _GEN_90; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_92 = 4'h9 == cnt ? 5'h0 : _GEN_91; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_93 = 4'ha == cnt ? 5'h10 : _GEN_92; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_94 = 4'hb == cnt ? 5'h0 : _GEN_93; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_95 = 4'hc == cnt ? 5'h13 : _GEN_94; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_96 = 4'hd == cnt ? 5'h0 : _GEN_95; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_97 = 4'he == cnt ? 5'h16 : _GEN_96; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_98 = 4'hf == cnt ? 5'h0 : _GEN_97; // @[FFTDesigns.scala 2978:{55,55}]
  wire [5:0] _GEN_680 = {{1'd0}, _GEN_98}; // @[FFTDesigns.scala 2978:55]
  wire [5:0] _M0_0_in_waddr_1_T_2 = _GEN_680 + _M1_0_in_waddr_T; // @[FFTDesigns.scala 2978:55]
  wire [2:0] _GEN_100 = 4'h1 == cnt ? 3'h0 : 3'h4; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_101 = 4'h2 == cnt ? 3'h4 : _GEN_100; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_102 = 4'h3 == cnt ? 3'h0 : _GEN_101; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_103 = 4'h4 == cnt ? 3'h4 : _GEN_102; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_104 = 4'h5 == cnt ? 3'h0 : _GEN_103; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_105 = 4'h6 == cnt ? 3'h4 : _GEN_104; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_106 = 4'h7 == cnt ? 3'h0 : _GEN_105; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_107 = 4'h8 == cnt ? 3'h4 : _GEN_106; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_108 = 4'h9 == cnt ? 3'h0 : _GEN_107; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_109 = 4'ha == cnt ? 3'h4 : _GEN_108; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_110 = 4'hb == cnt ? 3'h0 : _GEN_109; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_111 = 4'hc == cnt ? 3'h4 : _GEN_110; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_112 = 4'hd == cnt ? 3'h0 : _GEN_111; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_113 = 4'he == cnt ? 3'h4 : _GEN_112; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_114 = 4'hf == cnt ? 3'h0 : _GEN_113; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_116 = 3'h1 == _GEN_114 ? input_delay_registers_7_1_Im : input_delay_registers_7_0_Im; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_117 = 3'h2 == _GEN_114 ? input_delay_registers_7_2_Im : _GEN_116; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_118 = 3'h3 == _GEN_114 ? input_delay_registers_7_3_Im : _GEN_117; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_119 = 3'h4 == _GEN_114 ? input_delay_registers_7_4_Im : _GEN_118; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_120 = 3'h5 == _GEN_114 ? input_delay_registers_7_5_Im : _GEN_119; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_122 = 3'h1 == _GEN_114 ? input_delay_registers_7_1_Re : input_delay_registers_7_0_Re; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_123 = 3'h2 == _GEN_114 ? input_delay_registers_7_2_Re : _GEN_122; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_124 = 3'h3 == _GEN_114 ? input_delay_registers_7_3_Re : _GEN_123; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_125 = 3'h4 == _GEN_114 ? input_delay_registers_7_4_Re : _GEN_124; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_126 = 3'h5 == _GEN_114 ? input_delay_registers_7_5_Re : _GEN_125; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_160 = 4'h1 == cnt ? 3'h3 : 3'h1; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_161 = 4'h2 == cnt ? 3'h1 : _GEN_160; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_162 = 4'h3 == cnt ? 3'h3 : _GEN_161; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_163 = 4'h4 == cnt ? 3'h1 : _GEN_162; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_164 = 4'h5 == cnt ? 3'h3 : _GEN_163; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_165 = 4'h6 == cnt ? 3'h1 : _GEN_164; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_166 = 4'h7 == cnt ? 3'h3 : _GEN_165; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_167 = 4'h8 == cnt ? 3'h1 : _GEN_166; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_168 = 4'h9 == cnt ? 3'h3 : _GEN_167; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_169 = 4'ha == cnt ? 3'h1 : _GEN_168; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_170 = 4'hb == cnt ? 3'h3 : _GEN_169; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_171 = 4'hc == cnt ? 3'h1 : _GEN_170; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_172 = 4'hd == cnt ? 3'h3 : _GEN_171; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_173 = 4'he == cnt ? 3'h1 : _GEN_172; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_174 = 4'hf == cnt ? 3'h3 : _GEN_173; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_176 = 3'h1 == _GEN_174 ? input_delay_registers_7_1_Im : input_delay_registers_7_0_Im; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_177 = 3'h2 == _GEN_174 ? input_delay_registers_7_2_Im : _GEN_176; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_178 = 3'h3 == _GEN_174 ? input_delay_registers_7_3_Im : _GEN_177; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_179 = 3'h4 == _GEN_174 ? input_delay_registers_7_4_Im : _GEN_178; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_180 = 3'h5 == _GEN_174 ? input_delay_registers_7_5_Im : _GEN_179; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_182 = 3'h1 == _GEN_174 ? input_delay_registers_7_1_Re : input_delay_registers_7_0_Re; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_183 = 3'h2 == _GEN_174 ? input_delay_registers_7_2_Re : _GEN_182; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_184 = 3'h3 == _GEN_174 ? input_delay_registers_7_3_Re : _GEN_183; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_185 = 3'h4 == _GEN_174 ? input_delay_registers_7_4_Re : _GEN_184; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_186 = 3'h5 == _GEN_174 ? input_delay_registers_7_5_Re : _GEN_185; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_220 = 4'h1 == cnt ? 3'h0 : 3'h5; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_221 = 4'h2 == cnt ? 3'h5 : _GEN_220; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_222 = 4'h3 == cnt ? 3'h0 : _GEN_221; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_223 = 4'h4 == cnt ? 3'h5 : _GEN_222; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_224 = 4'h5 == cnt ? 3'h0 : _GEN_223; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_225 = 4'h6 == cnt ? 3'h5 : _GEN_224; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_226 = 4'h7 == cnt ? 3'h0 : _GEN_225; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_227 = 4'h8 == cnt ? 3'h5 : _GEN_226; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_228 = 4'h9 == cnt ? 3'h0 : _GEN_227; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_229 = 4'ha == cnt ? 3'h5 : _GEN_228; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_230 = 4'hb == cnt ? 3'h0 : _GEN_229; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_231 = 4'hc == cnt ? 3'h5 : _GEN_230; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_232 = 4'hd == cnt ? 3'h0 : _GEN_231; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_233 = 4'he == cnt ? 3'h5 : _GEN_232; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_234 = 4'hf == cnt ? 3'h0 : _GEN_233; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_236 = 3'h1 == _GEN_234 ? input_delay_registers_7_1_Im : input_delay_registers_7_0_Im; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_237 = 3'h2 == _GEN_234 ? input_delay_registers_7_2_Im : _GEN_236; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_238 = 3'h3 == _GEN_234 ? input_delay_registers_7_3_Im : _GEN_237; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_239 = 3'h4 == _GEN_234 ? input_delay_registers_7_4_Im : _GEN_238; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_240 = 3'h5 == _GEN_234 ? input_delay_registers_7_5_Im : _GEN_239; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_242 = 3'h1 == _GEN_234 ? input_delay_registers_7_1_Re : input_delay_registers_7_0_Re; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_243 = 3'h2 == _GEN_234 ? input_delay_registers_7_2_Re : _GEN_242; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_244 = 3'h3 == _GEN_234 ? input_delay_registers_7_3_Re : _GEN_243; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_245 = 3'h4 == _GEN_234 ? input_delay_registers_7_4_Re : _GEN_244; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_246 = 3'h5 == _GEN_234 ? input_delay_registers_7_5_Re : _GEN_245; // @[FFTDesigns.scala 2979:{32,32}]
  wire [4:0] _GEN_264 = 4'h1 == cnt ? 5'h1 : 5'h0; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_265 = 4'h2 == cnt ? 5'h3 : _GEN_264; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_266 = 4'h3 == cnt ? 5'h4 : _GEN_265; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_267 = 4'h4 == cnt ? 5'h6 : _GEN_266; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_268 = 4'h5 == cnt ? 5'h7 : _GEN_267; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_269 = 4'h6 == cnt ? 5'h9 : _GEN_268; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_270 = 4'h7 == cnt ? 5'ha : _GEN_269; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_271 = 4'h8 == cnt ? 5'hc : _GEN_270; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_272 = 4'h9 == cnt ? 5'hd : _GEN_271; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_273 = 4'ha == cnt ? 5'hf : _GEN_272; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_274 = 4'hb == cnt ? 5'h10 : _GEN_273; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_275 = 4'hc == cnt ? 5'h12 : _GEN_274; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_276 = 4'hd == cnt ? 5'h13 : _GEN_275; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_277 = 4'he == cnt ? 5'h15 : _GEN_276; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_278 = 4'hf == cnt ? 5'h16 : _GEN_277; // @[FFTDesigns.scala 2978:{55,55}]
  wire [5:0] _GEN_690 = {{1'd0}, _GEN_278}; // @[FFTDesigns.scala 2978:55]
  wire [5:0] _M0_2_in_waddr_0_T_2 = _GEN_690 + _M1_0_in_waddr_T; // @[FFTDesigns.scala 2978:55]
  wire [2:0] _GEN_280 = 4'h1 == cnt ? 3'h0 : 3'h2; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_281 = 4'h2 == cnt ? 3'h2 : _GEN_280; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_282 = 4'h3 == cnt ? 3'h0 : _GEN_281; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_283 = 4'h4 == cnt ? 3'h2 : _GEN_282; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_284 = 4'h5 == cnt ? 3'h0 : _GEN_283; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_285 = 4'h6 == cnt ? 3'h2 : _GEN_284; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_286 = 4'h7 == cnt ? 3'h0 : _GEN_285; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_287 = 4'h8 == cnt ? 3'h2 : _GEN_286; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_288 = 4'h9 == cnt ? 3'h0 : _GEN_287; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_289 = 4'ha == cnt ? 3'h2 : _GEN_288; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_290 = 4'hb == cnt ? 3'h0 : _GEN_289; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_291 = 4'hc == cnt ? 3'h2 : _GEN_290; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_292 = 4'hd == cnt ? 3'h0 : _GEN_291; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_293 = 4'he == cnt ? 3'h2 : _GEN_292; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_294 = 4'hf == cnt ? 3'h0 : _GEN_293; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_296 = 3'h1 == _GEN_294 ? input_delay_registers_7_1_Im : input_delay_registers_7_0_Im; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_297 = 3'h2 == _GEN_294 ? input_delay_registers_7_2_Im : _GEN_296; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_298 = 3'h3 == _GEN_294 ? input_delay_registers_7_3_Im : _GEN_297; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_299 = 3'h4 == _GEN_294 ? input_delay_registers_7_4_Im : _GEN_298; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_300 = 3'h5 == _GEN_294 ? input_delay_registers_7_5_Im : _GEN_299; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_302 = 3'h1 == _GEN_294 ? input_delay_registers_7_1_Re : input_delay_registers_7_0_Re; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_303 = 3'h2 == _GEN_294 ? input_delay_registers_7_2_Re : _GEN_302; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_304 = 3'h3 == _GEN_294 ? input_delay_registers_7_3_Re : _GEN_303; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_305 = 3'h4 == _GEN_294 ? input_delay_registers_7_4_Re : _GEN_304; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_306 = 3'h5 == _GEN_294 ? input_delay_registers_7_5_Re : _GEN_305; // @[FFTDesigns.scala 2979:{32,32}]
  wire  _GEN_309 = 4'h2 == cnt ? 1'h0 : 4'h1 == cnt; // @[FFTDesigns.scala 2977:{27,27}]
  wire  _GEN_311 = 4'h4 == cnt ? 1'h0 : 4'h3 == cnt | _GEN_309; // @[FFTDesigns.scala 2977:{27,27}]
  wire  _GEN_313 = 4'h6 == cnt ? 1'h0 : 4'h5 == cnt | _GEN_311; // @[FFTDesigns.scala 2977:{27,27}]
  wire  _GEN_315 = 4'h8 == cnt ? 1'h0 : 4'h7 == cnt | _GEN_313; // @[FFTDesigns.scala 2977:{27,27}]
  wire  _GEN_317 = 4'ha == cnt ? 1'h0 : 4'h9 == cnt | _GEN_315; // @[FFTDesigns.scala 2977:{27,27}]
  wire  _GEN_319 = 4'hc == cnt ? 1'h0 : 4'hb == cnt | _GEN_317; // @[FFTDesigns.scala 2977:{27,27}]
  wire  _GEN_321 = 4'he == cnt ? 1'h0 : 4'hd == cnt | _GEN_319; // @[FFTDesigns.scala 2977:{27,27}]
  wire [4:0] _GEN_325 = 4'h2 == cnt ? 5'h0 : _GEN_24; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_326 = 4'h3 == cnt ? 5'h5 : _GEN_325; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_327 = 4'h4 == cnt ? 5'h0 : _GEN_326; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_328 = 4'h5 == cnt ? 5'h8 : _GEN_327; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_329 = 4'h6 == cnt ? 5'h0 : _GEN_328; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_330 = 4'h7 == cnt ? 5'hb : _GEN_329; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_331 = 4'h8 == cnt ? 5'h0 : _GEN_330; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_332 = 4'h9 == cnt ? 5'he : _GEN_331; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_333 = 4'ha == cnt ? 5'h0 : _GEN_332; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_334 = 4'hb == cnt ? 5'h11 : _GEN_333; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_335 = 4'hc == cnt ? 5'h0 : _GEN_334; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_336 = 4'hd == cnt ? 5'h14 : _GEN_335; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_337 = 4'he == cnt ? 5'h0 : _GEN_336; // @[FFTDesigns.scala 2978:{55,55}]
  wire [4:0] _GEN_338 = 4'hf == cnt ? 5'h17 : _GEN_337; // @[FFTDesigns.scala 2978:{55,55}]
  wire [5:0] _GEN_698 = {{1'd0}, _GEN_338}; // @[FFTDesigns.scala 2978:55]
  wire [5:0] _M0_2_in_waddr_1_T_2 = _GEN_698 + _M1_0_in_waddr_T; // @[FFTDesigns.scala 2978:55]
  wire [2:0] _GEN_340 = 4'h1 == cnt ? 3'h4 : 3'h0; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_341 = 4'h2 == cnt ? 3'h0 : _GEN_340; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_342 = 4'h3 == cnt ? 3'h4 : _GEN_341; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_343 = 4'h4 == cnt ? 3'h0 : _GEN_342; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_344 = 4'h5 == cnt ? 3'h4 : _GEN_343; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_345 = 4'h6 == cnt ? 3'h0 : _GEN_344; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_346 = 4'h7 == cnt ? 3'h4 : _GEN_345; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_347 = 4'h8 == cnt ? 3'h0 : _GEN_346; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_348 = 4'h9 == cnt ? 3'h4 : _GEN_347; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_349 = 4'ha == cnt ? 3'h0 : _GEN_348; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_350 = 4'hb == cnt ? 3'h4 : _GEN_349; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_351 = 4'hc == cnt ? 3'h0 : _GEN_350; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_352 = 4'hd == cnt ? 3'h4 : _GEN_351; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_353 = 4'he == cnt ? 3'h0 : _GEN_352; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_354 = 4'hf == cnt ? 3'h4 : _GEN_353; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_356 = 3'h1 == _GEN_354 ? input_delay_registers_7_1_Im : input_delay_registers_7_0_Im; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_357 = 3'h2 == _GEN_354 ? input_delay_registers_7_2_Im : _GEN_356; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_358 = 3'h3 == _GEN_354 ? input_delay_registers_7_3_Im : _GEN_357; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_359 = 3'h4 == _GEN_354 ? input_delay_registers_7_4_Im : _GEN_358; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_360 = 3'h5 == _GEN_354 ? input_delay_registers_7_5_Im : _GEN_359; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_362 = 3'h1 == _GEN_354 ? input_delay_registers_7_1_Re : input_delay_registers_7_0_Re; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_363 = 3'h2 == _GEN_354 ? input_delay_registers_7_2_Re : _GEN_362; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_364 = 3'h3 == _GEN_354 ? input_delay_registers_7_3_Re : _GEN_363; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_365 = 3'h4 == _GEN_354 ? input_delay_registers_7_4_Re : _GEN_364; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_366 = 3'h5 == _GEN_354 ? input_delay_registers_7_5_Re : _GEN_365; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_400 = 4'h1 == cnt ? 3'h1 : 3'h3; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_401 = 4'h2 == cnt ? 3'h3 : _GEN_400; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_402 = 4'h3 == cnt ? 3'h1 : _GEN_401; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_403 = 4'h4 == cnt ? 3'h3 : _GEN_402; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_404 = 4'h5 == cnt ? 3'h1 : _GEN_403; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_405 = 4'h6 == cnt ? 3'h3 : _GEN_404; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_406 = 4'h7 == cnt ? 3'h1 : _GEN_405; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_407 = 4'h8 == cnt ? 3'h3 : _GEN_406; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_408 = 4'h9 == cnt ? 3'h1 : _GEN_407; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_409 = 4'ha == cnt ? 3'h3 : _GEN_408; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_410 = 4'hb == cnt ? 3'h1 : _GEN_409; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_411 = 4'hc == cnt ? 3'h3 : _GEN_410; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_412 = 4'hd == cnt ? 3'h1 : _GEN_411; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_413 = 4'he == cnt ? 3'h3 : _GEN_412; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_414 = 4'hf == cnt ? 3'h1 : _GEN_413; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_416 = 3'h1 == _GEN_414 ? input_delay_registers_7_1_Im : input_delay_registers_7_0_Im; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_417 = 3'h2 == _GEN_414 ? input_delay_registers_7_2_Im : _GEN_416; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_418 = 3'h3 == _GEN_414 ? input_delay_registers_7_3_Im : _GEN_417; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_419 = 3'h4 == _GEN_414 ? input_delay_registers_7_4_Im : _GEN_418; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_420 = 3'h5 == _GEN_414 ? input_delay_registers_7_5_Im : _GEN_419; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_422 = 3'h1 == _GEN_414 ? input_delay_registers_7_1_Re : input_delay_registers_7_0_Re; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_423 = 3'h2 == _GEN_414 ? input_delay_registers_7_2_Re : _GEN_422; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_424 = 3'h3 == _GEN_414 ? input_delay_registers_7_3_Re : _GEN_423; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_425 = 3'h4 == _GEN_414 ? input_delay_registers_7_4_Re : _GEN_424; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_426 = 3'h5 == _GEN_414 ? input_delay_registers_7_5_Re : _GEN_425; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_460 = 4'h1 == cnt ? 3'h5 : 3'h0; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_461 = 4'h2 == cnt ? 3'h0 : _GEN_460; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_462 = 4'h3 == cnt ? 3'h5 : _GEN_461; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_463 = 4'h4 == cnt ? 3'h0 : _GEN_462; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_464 = 4'h5 == cnt ? 3'h5 : _GEN_463; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_465 = 4'h6 == cnt ? 3'h0 : _GEN_464; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_466 = 4'h7 == cnt ? 3'h5 : _GEN_465; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_467 = 4'h8 == cnt ? 3'h0 : _GEN_466; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_468 = 4'h9 == cnt ? 3'h5 : _GEN_467; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_469 = 4'ha == cnt ? 3'h0 : _GEN_468; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_470 = 4'hb == cnt ? 3'h5 : _GEN_469; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_471 = 4'hc == cnt ? 3'h0 : _GEN_470; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_472 = 4'hd == cnt ? 3'h5 : _GEN_471; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_473 = 4'he == cnt ? 3'h0 : _GEN_472; // @[FFTDesigns.scala 2979:{32,32}]
  wire [2:0] _GEN_474 = 4'hf == cnt ? 3'h5 : _GEN_473; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_476 = 3'h1 == _GEN_474 ? input_delay_registers_7_1_Im : input_delay_registers_7_0_Im; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_477 = 3'h2 == _GEN_474 ? input_delay_registers_7_2_Im : _GEN_476; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_478 = 3'h3 == _GEN_474 ? input_delay_registers_7_3_Im : _GEN_477; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_479 = 3'h4 == _GEN_474 ? input_delay_registers_7_4_Im : _GEN_478; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_480 = 3'h5 == _GEN_474 ? input_delay_registers_7_5_Im : _GEN_479; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_482 = 3'h1 == _GEN_474 ? input_delay_registers_7_1_Re : input_delay_registers_7_0_Re; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_483 = 3'h2 == _GEN_474 ? input_delay_registers_7_2_Re : _GEN_482; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_484 = 3'h3 == _GEN_474 ? input_delay_registers_7_3_Re : _GEN_483; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_485 = 3'h4 == _GEN_474 ? input_delay_registers_7_4_Re : _GEN_484; // @[FFTDesigns.scala 2979:{32,32}]
  wire [31:0] _GEN_486 = 3'h5 == _GEN_474 ? input_delay_registers_7_5_Re : _GEN_485; // @[FFTDesigns.scala 2979:{32,32}]
  RAM_Block_mw RAM_Block_mw ( // @[FFTDesigns.scala 2837:26]
    .clock(RAM_Block_mw_clock),
    .io_in_raddr(RAM_Block_mw_io_in_raddr),
    .io_in_waddr_0(RAM_Block_mw_io_in_waddr_0),
    .io_in_waddr_1(RAM_Block_mw_io_in_waddr_1),
    .io_in_data_0_Re(RAM_Block_mw_io_in_data_0_Re),
    .io_in_data_0_Im(RAM_Block_mw_io_in_data_0_Im),
    .io_in_data_1_Re(RAM_Block_mw_io_in_data_1_Re),
    .io_in_data_1_Im(RAM_Block_mw_io_in_data_1_Im),
    .io_re(RAM_Block_mw_io_re),
    .io_wr_0(RAM_Block_mw_io_wr_0),
    .io_wr_1(RAM_Block_mw_io_wr_1),
    .io_en(RAM_Block_mw_io_en),
    .io_out_data_Re(RAM_Block_mw_io_out_data_Re),
    .io_out_data_Im(RAM_Block_mw_io_out_data_Im)
  );
  RAM_Block_mw RAM_Block_mw_1 ( // @[FFTDesigns.scala 2837:26]
    .clock(RAM_Block_mw_1_clock),
    .io_in_raddr(RAM_Block_mw_1_io_in_raddr),
    .io_in_waddr_0(RAM_Block_mw_1_io_in_waddr_0),
    .io_in_waddr_1(RAM_Block_mw_1_io_in_waddr_1),
    .io_in_data_0_Re(RAM_Block_mw_1_io_in_data_0_Re),
    .io_in_data_0_Im(RAM_Block_mw_1_io_in_data_0_Im),
    .io_in_data_1_Re(RAM_Block_mw_1_io_in_data_1_Re),
    .io_in_data_1_Im(RAM_Block_mw_1_io_in_data_1_Im),
    .io_re(RAM_Block_mw_1_io_re),
    .io_wr_0(RAM_Block_mw_1_io_wr_0),
    .io_wr_1(RAM_Block_mw_1_io_wr_1),
    .io_en(RAM_Block_mw_1_io_en),
    .io_out_data_Re(RAM_Block_mw_1_io_out_data_Re),
    .io_out_data_Im(RAM_Block_mw_1_io_out_data_Im)
  );
  RAM_Block_mw RAM_Block_mw_2 ( // @[FFTDesigns.scala 2837:26]
    .clock(RAM_Block_mw_2_clock),
    .io_in_raddr(RAM_Block_mw_2_io_in_raddr),
    .io_in_waddr_0(RAM_Block_mw_2_io_in_waddr_0),
    .io_in_waddr_1(RAM_Block_mw_2_io_in_waddr_1),
    .io_in_data_0_Re(RAM_Block_mw_2_io_in_data_0_Re),
    .io_in_data_0_Im(RAM_Block_mw_2_io_in_data_0_Im),
    .io_in_data_1_Re(RAM_Block_mw_2_io_in_data_1_Re),
    .io_in_data_1_Im(RAM_Block_mw_2_io_in_data_1_Im),
    .io_re(RAM_Block_mw_2_io_re),
    .io_wr_0(RAM_Block_mw_2_io_wr_0),
    .io_wr_1(RAM_Block_mw_2_io_wr_1),
    .io_en(RAM_Block_mw_2_io_en),
    .io_out_data_Re(RAM_Block_mw_2_io_out_data_Re),
    .io_out_data_Im(RAM_Block_mw_2_io_out_data_Im)
  );
  RAM_Block_mw RAM_Block_mw_3 ( // @[FFTDesigns.scala 2837:26]
    .clock(RAM_Block_mw_3_clock),
    .io_in_raddr(RAM_Block_mw_3_io_in_raddr),
    .io_in_waddr_0(RAM_Block_mw_3_io_in_waddr_0),
    .io_in_waddr_1(RAM_Block_mw_3_io_in_waddr_1),
    .io_in_data_0_Re(RAM_Block_mw_3_io_in_data_0_Re),
    .io_in_data_0_Im(RAM_Block_mw_3_io_in_data_0_Im),
    .io_in_data_1_Re(RAM_Block_mw_3_io_in_data_1_Re),
    .io_in_data_1_Im(RAM_Block_mw_3_io_in_data_1_Im),
    .io_re(RAM_Block_mw_3_io_re),
    .io_wr_0(RAM_Block_mw_3_io_wr_0),
    .io_wr_1(RAM_Block_mw_3_io_wr_1),
    .io_en(RAM_Block_mw_3_io_en),
    .io_out_data_Re(RAM_Block_mw_3_io_out_data_Re),
    .io_out_data_Im(RAM_Block_mw_3_io_out_data_Im)
  );
  RAM_Block_48 RAM_Block ( // @[FFTDesigns.scala 2841:26]
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
  RAM_Block_48 RAM_Block_1 ( // @[FFTDesigns.scala 2841:26]
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
  RAM_Block_48 RAM_Block_2 ( // @[FFTDesigns.scala 2841:26]
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
  RAM_Block_48 RAM_Block_3 ( // @[FFTDesigns.scala 2841:26]
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
  PermutationModuleStreamed PermutationModuleStreamed ( // @[FFTDesigns.scala 2907:28]
    .io_in_0_Re(PermutationModuleStreamed_io_in_0_Re),
    .io_in_0_Im(PermutationModuleStreamed_io_in_0_Im),
    .io_in_1_Re(PermutationModuleStreamed_io_in_1_Re),
    .io_in_1_Im(PermutationModuleStreamed_io_in_1_Im),
    .io_in_2_Re(PermutationModuleStreamed_io_in_2_Re),
    .io_in_2_Im(PermutationModuleStreamed_io_in_2_Im),
    .io_in_3_Re(PermutationModuleStreamed_io_in_3_Re),
    .io_in_3_Im(PermutationModuleStreamed_io_in_3_Im),
    .io_in_config_0(PermutationModuleStreamed_io_in_config_0),
    .io_in_config_1(PermutationModuleStreamed_io_in_config_1),
    .io_in_config_2(PermutationModuleStreamed_io_in_config_2),
    .io_out_0_Re(PermutationModuleStreamed_io_out_0_Re),
    .io_out_0_Im(PermutationModuleStreamed_io_out_0_Im),
    .io_out_1_Re(PermutationModuleStreamed_io_out_1_Re),
    .io_out_1_Im(PermutationModuleStreamed_io_out_1_Im),
    .io_out_2_Re(PermutationModuleStreamed_io_out_2_Re),
    .io_out_2_Im(PermutationModuleStreamed_io_out_2_Im),
    .io_out_3_Re(PermutationModuleStreamed_io_out_3_Re),
    .io_out_3_Im(PermutationModuleStreamed_io_out_3_Im)
  );
  M0_Config_ROM_6 M0_Config_ROM ( // @[FFTDesigns.scala 2908:29]
    .io_in_cnt(M0_Config_ROM_io_in_cnt),
    .io_out_0(M0_Config_ROM_io_out_0),
    .io_out_1(M0_Config_ROM_io_out_1),
    .io_out_2(M0_Config_ROM_io_out_2),
    .io_out_3(M0_Config_ROM_io_out_3)
  );
  M1_Config_ROM_6 M1_Config_ROM ( // @[FFTDesigns.scala 2909:29]
    .io_in_cnt(M1_Config_ROM_io_in_cnt),
    .io_out_0(M1_Config_ROM_io_out_0),
    .io_out_1(M1_Config_ROM_io_out_1),
    .io_out_2(M1_Config_ROM_io_out_2),
    .io_out_3(M1_Config_ROM_io_out_3)
  );
  Streaming_Permute_Config_6 Streaming_Permute_Config ( // @[FFTDesigns.scala 2910:31]
    .io_in_cnt(Streaming_Permute_Config_io_in_cnt),
    .io_out_0(Streaming_Permute_Config_io_out_0),
    .io_out_1(Streaming_Permute_Config_io_out_1),
    .io_out_2(Streaming_Permute_Config_io_out_2)
  );
  assign io_out_0_Re = RAM_Block_io_out_data_Re; // @[FFTDesigns.scala 2840:{23,23}]
  assign io_out_0_Im = RAM_Block_io_out_data_Im; // @[FFTDesigns.scala 2840:{23,23}]
  assign io_out_1_Re = RAM_Block_1_io_out_data_Re; // @[FFTDesigns.scala 2840:{23,23}]
  assign io_out_1_Im = RAM_Block_1_io_out_data_Im; // @[FFTDesigns.scala 2840:{23,23}]
  assign io_out_2_Re = RAM_Block_2_io_out_data_Re; // @[FFTDesigns.scala 2840:{23,23}]
  assign io_out_2_Im = RAM_Block_2_io_out_data_Im; // @[FFTDesigns.scala 2840:{23,23}]
  assign io_out_3_Re = RAM_Block_3_io_out_data_Re; // @[FFTDesigns.scala 2840:{23,23}]
  assign io_out_3_Im = RAM_Block_3_io_out_data_Im; // @[FFTDesigns.scala 2840:{23,23}]
  assign RAM_Block_mw_clock = clock;
  assign RAM_Block_mw_io_in_raddr = M0_0_re ? _M0_0_in_raddr_T_3 : 6'h0; // @[FFTDesigns.scala 2914:33 2950:26 3005:26]
  assign RAM_Block_mw_io_in_waddr_0 = M0_0_re ? _M0_0_in_waddr_0_T_2 : 6'h0; // @[FFTDesigns.scala 2914:33 2978:33 3006:26]
  assign RAM_Block_mw_io_in_waddr_1 = M0_0_re ? _M0_0_in_waddr_1_T_2 : 6'h0; // @[FFTDesigns.scala 2914:33 2978:33 3006:26]
  assign RAM_Block_mw_io_in_data_0_Re = M0_0_re ? _GEN_66 : 32'h0; // @[FFTDesigns.scala 2914:33 2979:32 3007:25]
  assign RAM_Block_mw_io_in_data_0_Im = M0_0_re ? _GEN_60 : 32'h0; // @[FFTDesigns.scala 2914:33 2979:32 3007:25]
  assign RAM_Block_mw_io_in_data_1_Re = M0_0_re ? _GEN_126 : 32'h0; // @[FFTDesigns.scala 2914:33 2979:32 3007:25]
  assign RAM_Block_mw_io_in_data_1_Im = M0_0_re ? _GEN_120 : 32'h0; // @[FFTDesigns.scala 2914:33 2979:32 3007:25]
  assign RAM_Block_mw_io_re = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_mw_io_wr_0 = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_mw_io_wr_1 = M0_0_re & _GEN_82; // @[FFTDesigns.scala 2914:33 2977:27 3001:20]
  assign RAM_Block_mw_io_en = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_mw_1_clock = clock;
  assign RAM_Block_mw_1_io_in_raddr = M0_0_re ? _M0_1_in_raddr_T_3 : 6'h0; // @[FFTDesigns.scala 2914:33 2950:26 3005:26]
  assign RAM_Block_mw_1_io_in_waddr_0 = M0_0_re ? _M0_0_in_waddr_0_T_2 : 6'h0; // @[FFTDesigns.scala 2914:33 2978:33 3006:26]
  assign RAM_Block_mw_1_io_in_waddr_1 = M0_0_re ? _M0_0_in_waddr_1_T_2 : 6'h0; // @[FFTDesigns.scala 2914:33 2978:33 3006:26]
  assign RAM_Block_mw_1_io_in_data_0_Re = M0_0_re ? _GEN_186 : 32'h0; // @[FFTDesigns.scala 2914:33 2979:32 3007:25]
  assign RAM_Block_mw_1_io_in_data_0_Im = M0_0_re ? _GEN_180 : 32'h0; // @[FFTDesigns.scala 2914:33 2979:32 3007:25]
  assign RAM_Block_mw_1_io_in_data_1_Re = M0_0_re ? _GEN_246 : 32'h0; // @[FFTDesigns.scala 2914:33 2979:32 3007:25]
  assign RAM_Block_mw_1_io_in_data_1_Im = M0_0_re ? _GEN_240 : 32'h0; // @[FFTDesigns.scala 2914:33 2979:32 3007:25]
  assign RAM_Block_mw_1_io_re = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_mw_1_io_wr_0 = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_mw_1_io_wr_1 = M0_0_re & _GEN_82; // @[FFTDesigns.scala 2914:33 2977:27 3001:20]
  assign RAM_Block_mw_1_io_en = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_mw_2_clock = clock;
  assign RAM_Block_mw_2_io_in_raddr = M0_0_re ? _M0_2_in_raddr_T_3 : 6'h0; // @[FFTDesigns.scala 2914:33 2950:26 3005:26]
  assign RAM_Block_mw_2_io_in_waddr_0 = M0_0_re ? _M0_2_in_waddr_0_T_2 : 6'h0; // @[FFTDesigns.scala 2914:33 2978:33 3006:26]
  assign RAM_Block_mw_2_io_in_waddr_1 = M0_0_re ? _M0_2_in_waddr_1_T_2 : 6'h0; // @[FFTDesigns.scala 2914:33 2978:33 3006:26]
  assign RAM_Block_mw_2_io_in_data_0_Re = M0_0_re ? _GEN_306 : 32'h0; // @[FFTDesigns.scala 2914:33 2979:32 3007:25]
  assign RAM_Block_mw_2_io_in_data_0_Im = M0_0_re ? _GEN_300 : 32'h0; // @[FFTDesigns.scala 2914:33 2979:32 3007:25]
  assign RAM_Block_mw_2_io_in_data_1_Re = M0_0_re ? _GEN_366 : 32'h0; // @[FFTDesigns.scala 2914:33 2979:32 3007:25]
  assign RAM_Block_mw_2_io_in_data_1_Im = M0_0_re ? _GEN_360 : 32'h0; // @[FFTDesigns.scala 2914:33 2979:32 3007:25]
  assign RAM_Block_mw_2_io_re = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_mw_2_io_wr_0 = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_mw_2_io_wr_1 = M0_0_re & (4'hf == cnt | _GEN_321); // @[FFTDesigns.scala 2914:33 2977:27 3001:20]
  assign RAM_Block_mw_2_io_en = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_mw_3_clock = clock;
  assign RAM_Block_mw_3_io_in_raddr = M0_0_re ? _M0_3_in_raddr_T_3 : 6'h0; // @[FFTDesigns.scala 2914:33 2950:26 3005:26]
  assign RAM_Block_mw_3_io_in_waddr_0 = M0_0_re ? _M0_2_in_waddr_0_T_2 : 6'h0; // @[FFTDesigns.scala 2914:33 2978:33 3006:26]
  assign RAM_Block_mw_3_io_in_waddr_1 = M0_0_re ? _M0_2_in_waddr_1_T_2 : 6'h0; // @[FFTDesigns.scala 2914:33 2978:33 3006:26]
  assign RAM_Block_mw_3_io_in_data_0_Re = M0_0_re ? _GEN_426 : 32'h0; // @[FFTDesigns.scala 2914:33 2979:32 3007:25]
  assign RAM_Block_mw_3_io_in_data_0_Im = M0_0_re ? _GEN_420 : 32'h0; // @[FFTDesigns.scala 2914:33 2979:32 3007:25]
  assign RAM_Block_mw_3_io_in_data_1_Re = M0_0_re ? _GEN_486 : 32'h0; // @[FFTDesigns.scala 2914:33 2979:32 3007:25]
  assign RAM_Block_mw_3_io_in_data_1_Im = M0_0_re ? _GEN_480 : 32'h0; // @[FFTDesigns.scala 2914:33 2979:32 3007:25]
  assign RAM_Block_mw_3_io_re = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_mw_3_io_wr_0 = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_mw_3_io_wr_1 = M0_0_re & (4'hf == cnt | _GEN_321); // @[FFTDesigns.scala 2914:33 2977:27 3001:20]
  assign RAM_Block_mw_3_io_en = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_clock = clock;
  assign RAM_Block_io_in_raddr = M0_0_re ? _M1_0_in_raddr_T_3 : 6'h0; // @[FFTDesigns.scala 2914:33 2951:26 3008:26]
  assign RAM_Block_io_in_waddr = M0_0_re ? _M1_0_in_waddr_T_2 : 6'h0; // @[FFTDesigns.scala 2914:33 2952:26 3009:26]
  assign RAM_Block_io_in_data_Re = PermutationModuleStreamed_io_out_0_Re; // @[FFTDesigns.scala 2914:33 2953:25 3010:25]
  assign RAM_Block_io_in_data_Im = PermutationModuleStreamed_io_out_0_Im; // @[FFTDesigns.scala 2914:33 2953:25 3010:25]
  assign RAM_Block_io_re = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_io_wr = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_io_en = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_1_clock = clock;
  assign RAM_Block_1_io_in_raddr = M0_0_re ? _M1_0_in_raddr_T_3 : 6'h0; // @[FFTDesigns.scala 2914:33 2951:26 3008:26]
  assign RAM_Block_1_io_in_waddr = M0_0_re ? _M1_1_in_waddr_T_2 : 6'h0; // @[FFTDesigns.scala 2914:33 2952:26 3009:26]
  assign RAM_Block_1_io_in_data_Re = PermutationModuleStreamed_io_out_1_Re; // @[FFTDesigns.scala 2914:33 2953:25 3010:25]
  assign RAM_Block_1_io_in_data_Im = PermutationModuleStreamed_io_out_1_Im; // @[FFTDesigns.scala 2914:33 2953:25 3010:25]
  assign RAM_Block_1_io_re = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_1_io_wr = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_1_io_en = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_2_clock = clock;
  assign RAM_Block_2_io_in_raddr = M0_0_re ? _M1_0_in_raddr_T_3 : 6'h0; // @[FFTDesigns.scala 2914:33 2951:26 3008:26]
  assign RAM_Block_2_io_in_waddr = M0_0_re ? _M1_2_in_waddr_T_2 : 6'h0; // @[FFTDesigns.scala 2914:33 2952:26 3009:26]
  assign RAM_Block_2_io_in_data_Re = PermutationModuleStreamed_io_out_2_Re; // @[FFTDesigns.scala 2914:33 2953:25 3010:25]
  assign RAM_Block_2_io_in_data_Im = PermutationModuleStreamed_io_out_2_Im; // @[FFTDesigns.scala 2914:33 2953:25 3010:25]
  assign RAM_Block_2_io_re = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_2_io_wr = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_2_io_en = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_3_clock = clock;
  assign RAM_Block_3_io_in_raddr = M0_0_re ? _M1_0_in_raddr_T_3 : 6'h0; // @[FFTDesigns.scala 2914:33 2951:26 3008:26]
  assign RAM_Block_3_io_in_waddr = M0_0_re ? _M1_3_in_waddr_T_2 : 6'h0; // @[FFTDesigns.scala 2914:33 2952:26 3009:26]
  assign RAM_Block_3_io_in_data_Re = PermutationModuleStreamed_io_out_3_Re; // @[FFTDesigns.scala 2914:33 2953:25 3010:25]
  assign RAM_Block_3_io_in_data_Im = PermutationModuleStreamed_io_out_3_Im; // @[FFTDesigns.scala 2914:33 2953:25 3010:25]
  assign RAM_Block_3_io_re = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_3_io_wr = |_T; // @[FFTDesigns.scala 2914:28]
  assign RAM_Block_3_io_en = |_T; // @[FFTDesigns.scala 2914:28]
  assign PermutationModuleStreamed_io_in_0_Re = RAM_Block_mw_io_out_data_Re; // @[FFTDesigns.scala 2836:{23,23}]
  assign PermutationModuleStreamed_io_in_0_Im = RAM_Block_mw_io_out_data_Im; // @[FFTDesigns.scala 2836:{23,23}]
  assign PermutationModuleStreamed_io_in_1_Re = RAM_Block_mw_1_io_out_data_Re; // @[FFTDesigns.scala 2836:{23,23}]
  assign PermutationModuleStreamed_io_in_1_Im = RAM_Block_mw_1_io_out_data_Im; // @[FFTDesigns.scala 2836:{23,23}]
  assign PermutationModuleStreamed_io_in_2_Re = RAM_Block_mw_2_io_out_data_Re; // @[FFTDesigns.scala 2836:{23,23}]
  assign PermutationModuleStreamed_io_in_2_Im = RAM_Block_mw_2_io_out_data_Im; // @[FFTDesigns.scala 2836:{23,23}]
  assign PermutationModuleStreamed_io_in_3_Re = RAM_Block_mw_3_io_out_data_Re; // @[FFTDesigns.scala 2836:{23,23}]
  assign PermutationModuleStreamed_io_in_3_Im = RAM_Block_mw_3_io_out_data_Im; // @[FFTDesigns.scala 2836:{23,23}]
  assign PermutationModuleStreamed_io_in_config_0 = Streaming_Permute_Config_io_out_0; // @[FFTDesigns.scala 2914:33 2954:33 3011:33]
  assign PermutationModuleStreamed_io_in_config_1 = Streaming_Permute_Config_io_out_1; // @[FFTDesigns.scala 2914:33 2954:33 3011:33]
  assign PermutationModuleStreamed_io_in_config_2 = Streaming_Permute_Config_io_out_2; // @[FFTDesigns.scala 2914:33 2954:33 3011:33]
  assign M0_Config_ROM_io_in_cnt = cnt2; // @[FFTDesigns.scala 3021:24]
  assign M1_Config_ROM_io_in_cnt = cnt2; // @[FFTDesigns.scala 3022:24]
  assign Streaming_Permute_Config_io_in_cnt = cnt2; // @[FFTDesigns.scala 3023:26]
  always @(posedge clock) begin
    offset_switch <= M0_0_re & _GEN_6; // @[FFTDesigns.scala 2914:33 3017:23]
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_0_0_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_0_0_Re <= io_in_0_Re; // @[FFTDesigns.scala 2969:38]
    end else begin
      input_delay_registers_0_0_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_0_0_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_0_0_Im <= io_in_0_Im; // @[FFTDesigns.scala 2969:38]
    end else begin
      input_delay_registers_0_0_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_0_1_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_0_1_Re <= io_in_1_Re; // @[FFTDesigns.scala 2969:38]
    end else begin
      input_delay_registers_0_1_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_0_1_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_0_1_Im <= io_in_1_Im; // @[FFTDesigns.scala 2969:38]
    end else begin
      input_delay_registers_0_1_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_0_2_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_0_2_Re <= io_in_2_Re; // @[FFTDesigns.scala 2969:38]
    end else begin
      input_delay_registers_0_2_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_0_2_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_0_2_Im <= io_in_2_Im; // @[FFTDesigns.scala 2969:38]
    end else begin
      input_delay_registers_0_2_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_0_3_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_0_3_Re <= io_in_3_Re; // @[FFTDesigns.scala 2969:38]
    end else begin
      input_delay_registers_0_3_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_0_3_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_0_3_Im <= io_in_3_Im; // @[FFTDesigns.scala 2969:38]
    end else begin
      input_delay_registers_0_3_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_0_4_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_0_4_Re <= io_in_4_Re; // @[FFTDesigns.scala 2969:38]
    end else begin
      input_delay_registers_0_4_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_0_4_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_0_4_Im <= io_in_4_Im; // @[FFTDesigns.scala 2969:38]
    end else begin
      input_delay_registers_0_4_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_0_5_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_0_5_Re <= io_in_5_Re; // @[FFTDesigns.scala 2969:38]
    end else begin
      input_delay_registers_0_5_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_0_5_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_0_5_Im <= io_in_5_Im; // @[FFTDesigns.scala 2969:38]
    end else begin
      input_delay_registers_0_5_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_1_0_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_1_0_Re <= input_delay_registers_0_0_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_1_0_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_1_0_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_1_0_Im <= input_delay_registers_0_0_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_1_0_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_1_1_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_1_1_Re <= input_delay_registers_0_1_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_1_1_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_1_1_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_1_1_Im <= input_delay_registers_0_1_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_1_1_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_1_2_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_1_2_Re <= input_delay_registers_0_2_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_1_2_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_1_2_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_1_2_Im <= input_delay_registers_0_2_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_1_2_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_1_3_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_1_3_Re <= input_delay_registers_0_3_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_1_3_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_1_3_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_1_3_Im <= input_delay_registers_0_3_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_1_3_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_1_4_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_1_4_Re <= input_delay_registers_0_4_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_1_4_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_1_4_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_1_4_Im <= input_delay_registers_0_4_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_1_4_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_1_5_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_1_5_Re <= input_delay_registers_0_5_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_1_5_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_1_5_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_1_5_Im <= input_delay_registers_0_5_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_1_5_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_2_0_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_2_0_Re <= input_delay_registers_1_0_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_2_0_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_2_0_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_2_0_Im <= input_delay_registers_1_0_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_2_0_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_2_1_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_2_1_Re <= input_delay_registers_1_1_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_2_1_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_2_1_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_2_1_Im <= input_delay_registers_1_1_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_2_1_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_2_2_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_2_2_Re <= input_delay_registers_1_2_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_2_2_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_2_2_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_2_2_Im <= input_delay_registers_1_2_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_2_2_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_2_3_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_2_3_Re <= input_delay_registers_1_3_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_2_3_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_2_3_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_2_3_Im <= input_delay_registers_1_3_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_2_3_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_2_4_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_2_4_Re <= input_delay_registers_1_4_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_2_4_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_2_4_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_2_4_Im <= input_delay_registers_1_4_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_2_4_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_2_5_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_2_5_Re <= input_delay_registers_1_5_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_2_5_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_2_5_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_2_5_Im <= input_delay_registers_1_5_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_2_5_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_3_0_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_3_0_Re <= input_delay_registers_2_0_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_3_0_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_3_0_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_3_0_Im <= input_delay_registers_2_0_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_3_0_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_3_1_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_3_1_Re <= input_delay_registers_2_1_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_3_1_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_3_1_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_3_1_Im <= input_delay_registers_2_1_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_3_1_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_3_2_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_3_2_Re <= input_delay_registers_2_2_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_3_2_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_3_2_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_3_2_Im <= input_delay_registers_2_2_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_3_2_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_3_3_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_3_3_Re <= input_delay_registers_2_3_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_3_3_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_3_3_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_3_3_Im <= input_delay_registers_2_3_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_3_3_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_3_4_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_3_4_Re <= input_delay_registers_2_4_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_3_4_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_3_4_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_3_4_Im <= input_delay_registers_2_4_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_3_4_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_3_5_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_3_5_Re <= input_delay_registers_2_5_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_3_5_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_3_5_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_3_5_Im <= input_delay_registers_2_5_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_3_5_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_4_0_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_4_0_Re <= input_delay_registers_3_0_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_4_0_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_4_0_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_4_0_Im <= input_delay_registers_3_0_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_4_0_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_4_1_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_4_1_Re <= input_delay_registers_3_1_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_4_1_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_4_1_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_4_1_Im <= input_delay_registers_3_1_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_4_1_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_4_2_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_4_2_Re <= input_delay_registers_3_2_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_4_2_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_4_2_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_4_2_Im <= input_delay_registers_3_2_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_4_2_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_4_3_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_4_3_Re <= input_delay_registers_3_3_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_4_3_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_4_3_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_4_3_Im <= input_delay_registers_3_3_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_4_3_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_4_4_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_4_4_Re <= input_delay_registers_3_4_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_4_4_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_4_4_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_4_4_Im <= input_delay_registers_3_4_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_4_4_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_4_5_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_4_5_Re <= input_delay_registers_3_5_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_4_5_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_4_5_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_4_5_Im <= input_delay_registers_3_5_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_4_5_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_5_0_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_5_0_Re <= input_delay_registers_4_0_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_5_0_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_5_0_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_5_0_Im <= input_delay_registers_4_0_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_5_0_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_5_1_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_5_1_Re <= input_delay_registers_4_1_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_5_1_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_5_1_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_5_1_Im <= input_delay_registers_4_1_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_5_1_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_5_2_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_5_2_Re <= input_delay_registers_4_2_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_5_2_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_5_2_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_5_2_Im <= input_delay_registers_4_2_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_5_2_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_5_3_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_5_3_Re <= input_delay_registers_4_3_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_5_3_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_5_3_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_5_3_Im <= input_delay_registers_4_3_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_5_3_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_5_4_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_5_4_Re <= input_delay_registers_4_4_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_5_4_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_5_4_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_5_4_Im <= input_delay_registers_4_4_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_5_4_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_5_5_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_5_5_Re <= input_delay_registers_4_5_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_5_5_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_5_5_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_5_5_Im <= input_delay_registers_4_5_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_5_5_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_6_0_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_6_0_Re <= input_delay_registers_5_0_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_6_0_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_6_0_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_6_0_Im <= input_delay_registers_5_0_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_6_0_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_6_1_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_6_1_Re <= input_delay_registers_5_1_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_6_1_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_6_1_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_6_1_Im <= input_delay_registers_5_1_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_6_1_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_6_2_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_6_2_Re <= input_delay_registers_5_2_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_6_2_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_6_2_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_6_2_Im <= input_delay_registers_5_2_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_6_2_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_6_3_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_6_3_Re <= input_delay_registers_5_3_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_6_3_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_6_3_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_6_3_Im <= input_delay_registers_5_3_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_6_3_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_6_4_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_6_4_Re <= input_delay_registers_5_4_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_6_4_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_6_4_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_6_4_Im <= input_delay_registers_5_4_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_6_4_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_6_5_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_6_5_Re <= input_delay_registers_5_5_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_6_5_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_6_5_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_6_5_Im <= input_delay_registers_5_5_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_6_5_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_7_0_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_7_0_Re <= input_delay_registers_6_0_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_7_0_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_7_0_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_7_0_Im <= input_delay_registers_6_0_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_7_0_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_7_1_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_7_1_Re <= input_delay_registers_6_1_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_7_1_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_7_1_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_7_1_Im <= input_delay_registers_6_1_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_7_1_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_7_2_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_7_2_Re <= input_delay_registers_6_2_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_7_2_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_7_2_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_7_2_Im <= input_delay_registers_6_2_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_7_2_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_7_3_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_7_3_Re <= input_delay_registers_6_3_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_7_3_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_7_3_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_7_3_Im <= input_delay_registers_6_3_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_7_3_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_7_4_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_7_4_Re <= input_delay_registers_6_4_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_7_4_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_7_4_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_7_4_Im <= input_delay_registers_6_4_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_7_4_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_7_5_Re <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_7_5_Re <= input_delay_registers_6_5_Re; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_7_5_Re <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2834:42]
      input_delay_registers_7_5_Im <= 32'h0; // @[FFTDesigns.scala 2834:42]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      input_delay_registers_7_5_Im <= input_delay_registers_6_5_Im; // @[FFTDesigns.scala 2971:38]
    end else begin
      input_delay_registers_7_5_Im <= 32'h0; // @[FFTDesigns.scala 2996:31]
    end
    if (reset) begin // @[FFTDesigns.scala 2912:25]
      cnt2 <= 5'h0; // @[FFTDesigns.scala 2912:25]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      if (cnt2 == 5'h17 & cnt == 4'hf) begin // @[FFTDesigns.scala 2922:69]
        cnt2 <= 5'h0; // @[FFTDesigns.scala 2923:16]
      end else if (_T_3) begin // @[FFTDesigns.scala 2926:47]
        cnt2 <= _cnt2_T_1; // @[FFTDesigns.scala 2928:16]
      end else begin
        cnt2 <= _cnt2_T_1; // @[FFTDesigns.scala 2931:16]
      end
    end else begin
      cnt2 <= 5'h0; // @[FFTDesigns.scala 3019:14]
    end
    if (reset) begin // @[FFTDesigns.scala 2913:24]
      cnt <= 4'h0; // @[FFTDesigns.scala 2913:24]
    end else if (M0_0_re) begin // @[FFTDesigns.scala 2914:33]
      if (cnt2 == 5'h17 & cnt == 4'hf) begin // @[FFTDesigns.scala 2922:69]
        cnt <= 4'h0; // @[FFTDesigns.scala 2924:15]
      end else if (!(_T_3)) begin // @[FFTDesigns.scala 2926:47]
        cnt <= _GEN_0;
      end
    end else begin
      cnt <= 4'h0; // @[FFTDesigns.scala 3018:13]
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
  input_delay_registers_0_0_Re = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_delay_registers_0_0_Im = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  input_delay_registers_0_1_Re = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  input_delay_registers_0_1_Im = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_delay_registers_0_2_Re = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  input_delay_registers_0_2_Im = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  input_delay_registers_0_3_Re = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_delay_registers_0_3_Im = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  input_delay_registers_0_4_Re = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  input_delay_registers_0_4_Im = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  input_delay_registers_0_5_Re = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  input_delay_registers_0_5_Im = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  input_delay_registers_1_0_Re = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  input_delay_registers_1_0_Im = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  input_delay_registers_1_1_Re = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  input_delay_registers_1_1_Im = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  input_delay_registers_1_2_Re = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  input_delay_registers_1_2_Im = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  input_delay_registers_1_3_Re = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  input_delay_registers_1_3_Im = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  input_delay_registers_1_4_Re = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  input_delay_registers_1_4_Im = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  input_delay_registers_1_5_Re = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  input_delay_registers_1_5_Im = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  input_delay_registers_2_0_Re = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  input_delay_registers_2_0_Im = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  input_delay_registers_2_1_Re = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  input_delay_registers_2_1_Im = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  input_delay_registers_2_2_Re = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  input_delay_registers_2_2_Im = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  input_delay_registers_2_3_Re = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  input_delay_registers_2_3_Im = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  input_delay_registers_2_4_Re = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  input_delay_registers_2_4_Im = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  input_delay_registers_2_5_Re = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  input_delay_registers_2_5_Im = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  input_delay_registers_3_0_Re = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  input_delay_registers_3_0_Im = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  input_delay_registers_3_1_Re = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  input_delay_registers_3_1_Im = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  input_delay_registers_3_2_Re = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  input_delay_registers_3_2_Im = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  input_delay_registers_3_3_Re = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  input_delay_registers_3_3_Im = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  input_delay_registers_3_4_Re = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  input_delay_registers_3_4_Im = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  input_delay_registers_3_5_Re = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  input_delay_registers_3_5_Im = _RAND_48[31:0];
  _RAND_49 = {1{`RANDOM}};
  input_delay_registers_4_0_Re = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  input_delay_registers_4_0_Im = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  input_delay_registers_4_1_Re = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  input_delay_registers_4_1_Im = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  input_delay_registers_4_2_Re = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  input_delay_registers_4_2_Im = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  input_delay_registers_4_3_Re = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  input_delay_registers_4_3_Im = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  input_delay_registers_4_4_Re = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  input_delay_registers_4_4_Im = _RAND_58[31:0];
  _RAND_59 = {1{`RANDOM}};
  input_delay_registers_4_5_Re = _RAND_59[31:0];
  _RAND_60 = {1{`RANDOM}};
  input_delay_registers_4_5_Im = _RAND_60[31:0];
  _RAND_61 = {1{`RANDOM}};
  input_delay_registers_5_0_Re = _RAND_61[31:0];
  _RAND_62 = {1{`RANDOM}};
  input_delay_registers_5_0_Im = _RAND_62[31:0];
  _RAND_63 = {1{`RANDOM}};
  input_delay_registers_5_1_Re = _RAND_63[31:0];
  _RAND_64 = {1{`RANDOM}};
  input_delay_registers_5_1_Im = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  input_delay_registers_5_2_Re = _RAND_65[31:0];
  _RAND_66 = {1{`RANDOM}};
  input_delay_registers_5_2_Im = _RAND_66[31:0];
  _RAND_67 = {1{`RANDOM}};
  input_delay_registers_5_3_Re = _RAND_67[31:0];
  _RAND_68 = {1{`RANDOM}};
  input_delay_registers_5_3_Im = _RAND_68[31:0];
  _RAND_69 = {1{`RANDOM}};
  input_delay_registers_5_4_Re = _RAND_69[31:0];
  _RAND_70 = {1{`RANDOM}};
  input_delay_registers_5_4_Im = _RAND_70[31:0];
  _RAND_71 = {1{`RANDOM}};
  input_delay_registers_5_5_Re = _RAND_71[31:0];
  _RAND_72 = {1{`RANDOM}};
  input_delay_registers_5_5_Im = _RAND_72[31:0];
  _RAND_73 = {1{`RANDOM}};
  input_delay_registers_6_0_Re = _RAND_73[31:0];
  _RAND_74 = {1{`RANDOM}};
  input_delay_registers_6_0_Im = _RAND_74[31:0];
  _RAND_75 = {1{`RANDOM}};
  input_delay_registers_6_1_Re = _RAND_75[31:0];
  _RAND_76 = {1{`RANDOM}};
  input_delay_registers_6_1_Im = _RAND_76[31:0];
  _RAND_77 = {1{`RANDOM}};
  input_delay_registers_6_2_Re = _RAND_77[31:0];
  _RAND_78 = {1{`RANDOM}};
  input_delay_registers_6_2_Im = _RAND_78[31:0];
  _RAND_79 = {1{`RANDOM}};
  input_delay_registers_6_3_Re = _RAND_79[31:0];
  _RAND_80 = {1{`RANDOM}};
  input_delay_registers_6_3_Im = _RAND_80[31:0];
  _RAND_81 = {1{`RANDOM}};
  input_delay_registers_6_4_Re = _RAND_81[31:0];
  _RAND_82 = {1{`RANDOM}};
  input_delay_registers_6_4_Im = _RAND_82[31:0];
  _RAND_83 = {1{`RANDOM}};
  input_delay_registers_6_5_Re = _RAND_83[31:0];
  _RAND_84 = {1{`RANDOM}};
  input_delay_registers_6_5_Im = _RAND_84[31:0];
  _RAND_85 = {1{`RANDOM}};
  input_delay_registers_7_0_Re = _RAND_85[31:0];
  _RAND_86 = {1{`RANDOM}};
  input_delay_registers_7_0_Im = _RAND_86[31:0];
  _RAND_87 = {1{`RANDOM}};
  input_delay_registers_7_1_Re = _RAND_87[31:0];
  _RAND_88 = {1{`RANDOM}};
  input_delay_registers_7_1_Im = _RAND_88[31:0];
  _RAND_89 = {1{`RANDOM}};
  input_delay_registers_7_2_Re = _RAND_89[31:0];
  _RAND_90 = {1{`RANDOM}};
  input_delay_registers_7_2_Im = _RAND_90[31:0];
  _RAND_91 = {1{`RANDOM}};
  input_delay_registers_7_3_Re = _RAND_91[31:0];
  _RAND_92 = {1{`RANDOM}};
  input_delay_registers_7_3_Im = _RAND_92[31:0];
  _RAND_93 = {1{`RANDOM}};
  input_delay_registers_7_4_Re = _RAND_93[31:0];
  _RAND_94 = {1{`RANDOM}};
  input_delay_registers_7_4_Im = _RAND_94[31:0];
  _RAND_95 = {1{`RANDOM}};
  input_delay_registers_7_5_Re = _RAND_95[31:0];
  _RAND_96 = {1{`RANDOM}};
  input_delay_registers_7_5_Im = _RAND_96[31:0];
  _RAND_97 = {1{`RANDOM}};
  cnt2 = _RAND_97[4:0];
  _RAND_98 = {1{`RANDOM}};
  cnt = _RAND_98[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TwiddleFactorROM_mr(
  input  [6:0]  io_in_addr,
  output [31:0] io_out_data_1_Re,
  output [31:0] io_out_data_1_Im,
  output [31:0] io_out_data_2_Re,
  output [31:0] io_out_data_2_Im,
  output [31:0] io_out_data_4_Re,
  output [31:0] io_out_data_4_Im,
  output [31:0] io_out_data_5_Re,
  output [31:0] io_out_data_5_Im
);
  wire [31:0] _GEN_33 = 4'h1 == io_in_addr[3:0] ? 32'h3f7dcf54 : 32'h3f800000; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_34 = 4'h2 == io_in_addr[3:0] ? 32'h3f7746ea : _GEN_33; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_35 = 4'h3 == io_in_addr[3:0] ? 32'h3f6c835e : _GEN_34; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_36 = 4'h4 == io_in_addr[3:0] ? 32'h3f5db3d6 : _GEN_35; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_37 = 4'h5 == io_in_addr[3:0] ? 32'h3f4b1934 : _GEN_36; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_38 = 4'h6 == io_in_addr[3:0] ? 32'h3f3504f2 : _GEN_37; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_39 = 4'h7 == io_in_addr[3:0] ? 32'h3f1bd7c8 : _GEN_38; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_40 = 4'h8 == io_in_addr[3:0] ? 32'h3f000000 : _GEN_39; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_41 = 4'h9 == io_in_addr[3:0] ? 32'h3ec3ef14 : _GEN_40; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_42 = 4'ha == io_in_addr[3:0] ? 32'h3e8483ec : _GEN_41; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_43 = 4'hb == io_in_addr[3:0] ? 32'h3e05a8a8 : _GEN_42; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_44 = 4'hc == io_in_addr[3:0] ? 32'h248d3131 : _GEN_43; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_45 = 4'hd == io_in_addr[3:0] ? 32'hbe05a8a8 : _GEN_44; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_46 = 4'he == io_in_addr[3:0] ? 32'hbe8483ec : _GEN_45; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_49 = 4'h1 == io_in_addr[3:0] ? 32'hbe05a8a8 : 32'h80800000; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_50 = 4'h2 == io_in_addr[3:0] ? 32'hbe8483ec : _GEN_49; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_51 = 4'h3 == io_in_addr[3:0] ? 32'hbec3ef14 : _GEN_50; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_52 = 4'h4 == io_in_addr[3:0] ? 32'hbefffffc : _GEN_51; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_53 = 4'h5 == io_in_addr[3:0] ? 32'hbf1bd7c8 : _GEN_52; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_54 = 4'h6 == io_in_addr[3:0] ? 32'hbf3504f2 : _GEN_53; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_55 = 4'h7 == io_in_addr[3:0] ? 32'hbf4b1934 : _GEN_54; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_56 = 4'h8 == io_in_addr[3:0] ? 32'hbf5db3d6 : _GEN_55; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_57 = 4'h9 == io_in_addr[3:0] ? 32'hbf6c835e : _GEN_56; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_58 = 4'ha == io_in_addr[3:0] ? 32'hbf7746ea : _GEN_57; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_59 = 4'hb == io_in_addr[3:0] ? 32'hbf7dcf54 : _GEN_58; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_60 = 4'hc == io_in_addr[3:0] ? 32'hbf800000 : _GEN_59; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_61 = 4'hd == io_in_addr[3:0] ? 32'hbf7dcf54 : _GEN_60; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_62 = 4'he == io_in_addr[3:0] ? 32'hbf7746ea : _GEN_61; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_65 = 4'h1 == io_in_addr[3:0] ? 32'h3f7746ea : 32'h3f800000; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_66 = 4'h2 == io_in_addr[3:0] ? 32'h3f5db3d6 : _GEN_65; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_67 = 4'h3 == io_in_addr[3:0] ? 32'h3f3504f2 : _GEN_66; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_68 = 4'h4 == io_in_addr[3:0] ? 32'h3f000000 : _GEN_67; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_69 = 4'h5 == io_in_addr[3:0] ? 32'h3e8483ec : _GEN_68; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_70 = 4'h6 == io_in_addr[3:0] ? 32'h248d3131 : _GEN_69; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_71 = 4'h7 == io_in_addr[3:0] ? 32'hbe8483ec : _GEN_70; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_72 = 4'h8 == io_in_addr[3:0] ? 32'hbefffffc : _GEN_71; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_73 = 4'h9 == io_in_addr[3:0] ? 32'hbf3504f2 : _GEN_72; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_74 = 4'ha == io_in_addr[3:0] ? 32'hbf5db3d6 : _GEN_73; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_75 = 4'hb == io_in_addr[3:0] ? 32'hbf7746ea : _GEN_74; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_76 = 4'hc == io_in_addr[3:0] ? 32'hbf800000 : _GEN_75; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_77 = 4'hd == io_in_addr[3:0] ? 32'hbf7746ea : _GEN_76; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_78 = 4'he == io_in_addr[3:0] ? 32'hbf5db3d6 : _GEN_77; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_81 = 4'h1 == io_in_addr[3:0] ? 32'hbe8483ec : 32'h80800000; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_82 = 4'h2 == io_in_addr[3:0] ? 32'hbefffffc : _GEN_81; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_83 = 4'h3 == io_in_addr[3:0] ? 32'hbf3504f2 : _GEN_82; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_84 = 4'h4 == io_in_addr[3:0] ? 32'hbf5db3d6 : _GEN_83; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_85 = 4'h5 == io_in_addr[3:0] ? 32'hbf7746ea : _GEN_84; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_86 = 4'h6 == io_in_addr[3:0] ? 32'hbf800000 : _GEN_85; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_87 = 4'h7 == io_in_addr[3:0] ? 32'hbf7746ea : _GEN_86; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_88 = 4'h8 == io_in_addr[3:0] ? 32'hbf5db3d6 : _GEN_87; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_89 = 4'h9 == io_in_addr[3:0] ? 32'hbf3504f2 : _GEN_88; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_90 = 4'ha == io_in_addr[3:0] ? 32'hbf000000 : _GEN_89; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_91 = 4'hb == io_in_addr[3:0] ? 32'hbe8483ec : _GEN_90; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_92 = 4'hc == io_in_addr[3:0] ? 32'ha50d3131 : _GEN_91; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_93 = 4'hd == io_in_addr[3:0] ? 32'h3e8483ec : _GEN_92; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_94 = 4'he == io_in_addr[3:0] ? 32'h3efffffc : _GEN_93; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_129 = 4'h1 == io_in_addr[3:0] ? 32'h3f7b14be : 32'h3f7f73ae; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_130 = 4'h2 == io_in_addr[3:0] ? 32'h3f726a02 : _GEN_129; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_131 = 4'h3 == io_in_addr[3:0] ? 32'h3f659972 : _GEN_130; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_132 = 4'h4 == io_in_addr[3:0] ? 32'h3f54db30 : _GEN_131; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_133 = 4'h5 == io_in_addr[3:0] ? 32'h3f407892 : _GEN_132; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_134 = 4'h6 == io_in_addr[3:0] ? 32'h3f28cae2 : _GEN_133; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_135 = 4'h7 == io_in_addr[3:0] ? 32'h3f0e39d8 : _GEN_134; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_136 = 4'h8 == io_in_addr[3:0] ? 32'h3ee273a8 : _GEN_135; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_137 = 4'h9 == io_in_addr[3:0] ? 32'h3ea493b4 : _GEN_136; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_138 = 4'ha == io_in_addr[3:0] ? 32'h3e47c5c0 : _GEN_137; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_139 = 4'hb == io_in_addr[3:0] ? 32'h3d85f210 : _GEN_138; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_140 = 4'hc == io_in_addr[3:0] ? 32'hbd85f210 : _GEN_139; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_141 = 4'hd == io_in_addr[3:0] ? 32'hbe47c5c0 : _GEN_140; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_142 = 4'he == io_in_addr[3:0] ? 32'hbea493b4 : _GEN_141; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_145 = 4'h1 == io_in_addr[3:0] ? 32'hbe47c5c0 : 32'hbd85f210; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_146 = 4'h2 == io_in_addr[3:0] ? 32'hbea493b4 : _GEN_145; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_147 = 4'h3 == io_in_addr[3:0] ? 32'hbee273a8 : _GEN_146; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_148 = 4'h4 == io_in_addr[3:0] ? 32'hbf0e39d8 : _GEN_147; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_149 = 4'h5 == io_in_addr[3:0] ? 32'hbf28cae2 : _GEN_148; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_150 = 4'h6 == io_in_addr[3:0] ? 32'hbf407892 : _GEN_149; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_151 = 4'h7 == io_in_addr[3:0] ? 32'hbf54db30 : _GEN_150; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_152 = 4'h8 == io_in_addr[3:0] ? 32'hbf659972 : _GEN_151; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_153 = 4'h9 == io_in_addr[3:0] ? 32'hbf726a02 : _GEN_152; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_154 = 4'ha == io_in_addr[3:0] ? 32'hbf7b14be : _GEN_153; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_155 = 4'hb == io_in_addr[3:0] ? 32'hbf7f73ae : _GEN_154; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_156 = 4'hc == io_in_addr[3:0] ? 32'hbf7f73ae : _GEN_155; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_157 = 4'hd == io_in_addr[3:0] ? 32'hbf7b14be : _GEN_156; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_158 = 4'he == io_in_addr[3:0] ? 32'hbf726a02 : _GEN_157; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_161 = 4'h1 == io_in_addr[3:0] ? 32'h3f6c835e : 32'h3f7dcf54; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_162 = 4'h2 == io_in_addr[3:0] ? 32'h3f4b1934 : _GEN_161; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_163 = 4'h3 == io_in_addr[3:0] ? 32'h3f1bd7c8 : _GEN_162; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_164 = 4'h4 == io_in_addr[3:0] ? 32'h3ec3ef14 : _GEN_163; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_165 = 4'h5 == io_in_addr[3:0] ? 32'h3e05a8a8 : _GEN_164; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_166 = 4'h6 == io_in_addr[3:0] ? 32'hbe05a8a8 : _GEN_165; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_167 = 4'h7 == io_in_addr[3:0] ? 32'hbec3ef14 : _GEN_166; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_168 = 4'h8 == io_in_addr[3:0] ? 32'hbf1bd7c8 : _GEN_167; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_169 = 4'h9 == io_in_addr[3:0] ? 32'hbf4b1934 : _GEN_168; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_170 = 4'ha == io_in_addr[3:0] ? 32'hbf6c835e : _GEN_169; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_171 = 4'hb == io_in_addr[3:0] ? 32'hbf7dcf54 : _GEN_170; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_172 = 4'hc == io_in_addr[3:0] ? 32'hbf7dcf54 : _GEN_171; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_173 = 4'hd == io_in_addr[3:0] ? 32'hbf6c835e : _GEN_172; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_174 = 4'he == io_in_addr[3:0] ? 32'hbf4b1934 : _GEN_173; // @[FFTDesigns.scala 2084:{25,25}]
  wire [31:0] _GEN_177 = 4'h1 == io_in_addr[3:0] ? 32'hbec3ef14 : 32'hbe05a8a8; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_178 = 4'h2 == io_in_addr[3:0] ? 32'hbf1bd7c8 : _GEN_177; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_179 = 4'h3 == io_in_addr[3:0] ? 32'hbf4b1934 : _GEN_178; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_180 = 4'h4 == io_in_addr[3:0] ? 32'hbf6c835e : _GEN_179; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_181 = 4'h5 == io_in_addr[3:0] ? 32'hbf7dcf54 : _GEN_180; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_182 = 4'h6 == io_in_addr[3:0] ? 32'hbf7dcf54 : _GEN_181; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_183 = 4'h7 == io_in_addr[3:0] ? 32'hbf6c835e : _GEN_182; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_184 = 4'h8 == io_in_addr[3:0] ? 32'hbf4b1934 : _GEN_183; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_185 = 4'h9 == io_in_addr[3:0] ? 32'hbf1bd7c8 : _GEN_184; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_186 = 4'ha == io_in_addr[3:0] ? 32'hbec3ef14 : _GEN_185; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_187 = 4'hb == io_in_addr[3:0] ? 32'hbe05a8a8 : _GEN_186; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_188 = 4'hc == io_in_addr[3:0] ? 32'h3e05a8a8 : _GEN_187; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_189 = 4'hd == io_in_addr[3:0] ? 32'h3ec3ef14 : _GEN_188; // @[FFTDesigns.scala 2085:{25,25}]
  wire [31:0] _GEN_190 = 4'he == io_in_addr[3:0] ? 32'h3f1bd7c8 : _GEN_189; // @[FFTDesigns.scala 2085:{25,25}]
  assign io_out_data_1_Re = 4'hf == io_in_addr[3:0] ? 32'hbec3ef14 : _GEN_46; // @[FFTDesigns.scala 2084:{25,25}]
  assign io_out_data_1_Im = 4'hf == io_in_addr[3:0] ? 32'hbf6c835e : _GEN_62; // @[FFTDesigns.scala 2085:{25,25}]
  assign io_out_data_2_Re = 4'hf == io_in_addr[3:0] ? 32'hbf3504f2 : _GEN_78; // @[FFTDesigns.scala 2084:{25,25}]
  assign io_out_data_2_Im = 4'hf == io_in_addr[3:0] ? 32'h3f3504f2 : _GEN_94; // @[FFTDesigns.scala 2085:{25,25}]
  assign io_out_data_4_Re = 4'hf == io_in_addr[3:0] ? 32'hbee273a8 : _GEN_142; // @[FFTDesigns.scala 2084:{25,25}]
  assign io_out_data_4_Im = 4'hf == io_in_addr[3:0] ? 32'hbf659972 : _GEN_158; // @[FFTDesigns.scala 2085:{25,25}]
  assign io_out_data_5_Re = 4'hf == io_in_addr[3:0] ? 32'hbf1bd7c8 : _GEN_174; // @[FFTDesigns.scala 2084:{25,25}]
  assign io_out_data_5_Im = 4'hf == io_in_addr[3:0] ? 32'h3f4b1934 : _GEN_190; // @[FFTDesigns.scala 2085:{25,25}]
endmodule
module TwiddleFactorsStreamed_mr_v2(
  input         clock,
  input         reset,
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  input  [31:0] io_in_2_Re,
  input  [31:0] io_in_2_Im,
  input  [31:0] io_in_3_Re,
  input  [31:0] io_in_3_Im,
  input  [31:0] io_in_4_Re,
  input  [31:0] io_in_4_Im,
  input  [31:0] io_in_5_Re,
  input  [31:0] io_in_5_Im,
  input         io_in_en_0,
  input         io_in_en_1,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im,
  output [31:0] io_out_2_Re,
  output [31:0] io_out_2_Im,
  output [31:0] io_out_3_Re,
  output [31:0] io_out_3_Im,
  output [31:0] io_out_4_Re,
  output [31:0] io_out_4_Im,
  output [31:0] io_out_5_Re,
  output [31:0] io_out_5_Im
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [6:0] TwiddleFactorROM_mr_io_in_addr; // @[FFTDesigns.scala 2314:26]
  wire [31:0] TwiddleFactorROM_mr_io_out_data_1_Re; // @[FFTDesigns.scala 2314:26]
  wire [31:0] TwiddleFactorROM_mr_io_out_data_1_Im; // @[FFTDesigns.scala 2314:26]
  wire [31:0] TwiddleFactorROM_mr_io_out_data_2_Re; // @[FFTDesigns.scala 2314:26]
  wire [31:0] TwiddleFactorROM_mr_io_out_data_2_Im; // @[FFTDesigns.scala 2314:26]
  wire [31:0] TwiddleFactorROM_mr_io_out_data_4_Re; // @[FFTDesigns.scala 2314:26]
  wire [31:0] TwiddleFactorROM_mr_io_out_data_4_Im; // @[FFTDesigns.scala 2314:26]
  wire [31:0] TwiddleFactorROM_mr_io_out_data_5_Re; // @[FFTDesigns.scala 2314:26]
  wire [31:0] TwiddleFactorROM_mr_io_out_data_5_Im; // @[FFTDesigns.scala 2314:26]
  wire  FPComplexMult_clock; // @[FFTDesigns.scala 2330:30]
  wire  FPComplexMult_reset; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_io_in_a_Re; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_io_in_a_Im; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_io_in_b_Re; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_io_in_b_Im; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_io_out_s_Re; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_io_out_s_Im; // @[FFTDesigns.scala 2330:30]
  wire  FPComplexMult_1_clock; // @[FFTDesigns.scala 2330:30]
  wire  FPComplexMult_1_reset; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_1_io_in_a_Re; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_1_io_in_a_Im; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_1_io_in_b_Re; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_1_io_in_b_Im; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_1_io_out_s_Re; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_1_io_out_s_Im; // @[FFTDesigns.scala 2330:30]
  wire  FPComplexMult_2_clock; // @[FFTDesigns.scala 2330:30]
  wire  FPComplexMult_2_reset; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_2_io_in_a_Re; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_2_io_in_a_Im; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_2_io_in_b_Re; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_2_io_in_b_Im; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_2_io_out_s_Re; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_2_io_out_s_Im; // @[FFTDesigns.scala 2330:30]
  wire  FPComplexMult_3_clock; // @[FFTDesigns.scala 2330:30]
  wire  FPComplexMult_3_reset; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_3_io_in_a_Re; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_3_io_in_a_Im; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_3_io_in_b_Re; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_3_io_in_b_Im; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_3_io_out_s_Re; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_3_io_out_s_Im; // @[FFTDesigns.scala 2330:30]
  wire  FPComplexMult_4_clock; // @[FFTDesigns.scala 2330:30]
  wire  FPComplexMult_4_reset; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_4_io_in_a_Re; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_4_io_in_a_Im; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_4_io_in_b_Re; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_4_io_in_b_Im; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_4_io_out_s_Re; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_4_io_out_s_Im; // @[FFTDesigns.scala 2330:30]
  wire  FPComplexMult_5_clock; // @[FFTDesigns.scala 2330:30]
  wire  FPComplexMult_5_reset; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_5_io_in_a_Re; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_5_io_in_a_Im; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_5_io_in_b_Re; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_5_io_in_b_Im; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_5_io_out_s_Re; // @[FFTDesigns.scala 2330:30]
  wire [31:0] FPComplexMult_5_io_out_s_Im; // @[FFTDesigns.scala 2330:30]
  reg [3:0] cnt; // @[FFTDesigns.scala 2322:24]
  reg [4:0] cnt2; // @[FFTDesigns.scala 2323:25]
  wire [1:0] _T = {io_in_en_1,io_in_en_0}; // @[FFTDesigns.scala 2324:21]
  wire  _T_1 = |_T; // @[FFTDesigns.scala 2324:28]
  wire [4:0] _cnt2_T_1 = cnt2 + 5'h1; // @[FFTDesigns.scala 2339:24]
  wire [3:0] _cnt_T_1 = cnt + 4'h1; // @[FFTDesigns.scala 2341:22]
  TwiddleFactorROM_mr TwiddleFactorROM_mr ( // @[FFTDesigns.scala 2314:26]
    .io_in_addr(TwiddleFactorROM_mr_io_in_addr),
    .io_out_data_1_Re(TwiddleFactorROM_mr_io_out_data_1_Re),
    .io_out_data_1_Im(TwiddleFactorROM_mr_io_out_data_1_Im),
    .io_out_data_2_Re(TwiddleFactorROM_mr_io_out_data_2_Re),
    .io_out_data_2_Im(TwiddleFactorROM_mr_io_out_data_2_Im),
    .io_out_data_4_Re(TwiddleFactorROM_mr_io_out_data_4_Re),
    .io_out_data_4_Im(TwiddleFactorROM_mr_io_out_data_4_Im),
    .io_out_data_5_Re(TwiddleFactorROM_mr_io_out_data_5_Re),
    .io_out_data_5_Im(TwiddleFactorROM_mr_io_out_data_5_Im)
  );
  FPComplexMult FPComplexMult ( // @[FFTDesigns.scala 2330:30]
    .clock(FPComplexMult_clock),
    .reset(FPComplexMult_reset),
    .io_in_a_Re(FPComplexMult_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_io_out_s_Im)
  );
  FPComplexMult FPComplexMult_1 ( // @[FFTDesigns.scala 2330:30]
    .clock(FPComplexMult_1_clock),
    .reset(FPComplexMult_1_reset),
    .io_in_a_Re(FPComplexMult_1_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_1_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_1_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_1_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_1_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_1_io_out_s_Im)
  );
  FPComplexMult FPComplexMult_2 ( // @[FFTDesigns.scala 2330:30]
    .clock(FPComplexMult_2_clock),
    .reset(FPComplexMult_2_reset),
    .io_in_a_Re(FPComplexMult_2_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_2_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_2_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_2_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_2_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_2_io_out_s_Im)
  );
  FPComplexMult FPComplexMult_3 ( // @[FFTDesigns.scala 2330:30]
    .clock(FPComplexMult_3_clock),
    .reset(FPComplexMult_3_reset),
    .io_in_a_Re(FPComplexMult_3_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_3_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_3_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_3_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_3_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_3_io_out_s_Im)
  );
  FPComplexMult FPComplexMult_4 ( // @[FFTDesigns.scala 2330:30]
    .clock(FPComplexMult_4_clock),
    .reset(FPComplexMult_4_reset),
    .io_in_a_Re(FPComplexMult_4_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_4_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_4_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_4_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_4_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_4_io_out_s_Im)
  );
  FPComplexMult FPComplexMult_5 ( // @[FFTDesigns.scala 2330:30]
    .clock(FPComplexMult_5_clock),
    .reset(FPComplexMult_5_reset),
    .io_in_a_Re(FPComplexMult_5_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_5_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_5_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_5_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_5_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_5_io_out_s_Im)
  );
  assign io_out_0_Re = FPComplexMult_io_out_s_Re; // @[FFTDesigns.scala 2357:19]
  assign io_out_0_Im = FPComplexMult_io_out_s_Im; // @[FFTDesigns.scala 2357:19]
  assign io_out_1_Re = FPComplexMult_1_io_out_s_Re; // @[FFTDesigns.scala 2357:19]
  assign io_out_1_Im = FPComplexMult_1_io_out_s_Im; // @[FFTDesigns.scala 2357:19]
  assign io_out_2_Re = FPComplexMult_2_io_out_s_Re; // @[FFTDesigns.scala 2357:19]
  assign io_out_2_Im = FPComplexMult_2_io_out_s_Im; // @[FFTDesigns.scala 2357:19]
  assign io_out_3_Re = FPComplexMult_3_io_out_s_Re; // @[FFTDesigns.scala 2357:19]
  assign io_out_3_Im = FPComplexMult_3_io_out_s_Im; // @[FFTDesigns.scala 2357:19]
  assign io_out_4_Re = FPComplexMult_4_io_out_s_Re; // @[FFTDesigns.scala 2357:19]
  assign io_out_4_Im = FPComplexMult_4_io_out_s_Im; // @[FFTDesigns.scala 2357:19]
  assign io_out_5_Re = FPComplexMult_5_io_out_s_Re; // @[FFTDesigns.scala 2357:19]
  assign io_out_5_Im = FPComplexMult_5_io_out_s_Im; // @[FFTDesigns.scala 2357:19]
  assign TwiddleFactorROM_mr_io_in_addr = {{3'd0}, cnt}; // @[FFTDesigns.scala 2359:24]
  assign FPComplexMult_clock = clock;
  assign FPComplexMult_reset = reset;
  assign FPComplexMult_io_in_a_Re = _T_1 ? io_in_0_Re : 32'h0; // @[FFTDesigns.scala 2333:32 2345:31 2350:31]
  assign FPComplexMult_io_in_a_Im = _T_1 ? io_in_0_Im : 32'h0; // @[FFTDesigns.scala 2333:32 2345:31 2350:31]
  assign FPComplexMult_io_in_b_Re = _T_1 ? 32'h3f800000 : 32'h0; // @[FFTDesigns.scala 2333:32 2346:31 2351:31]
  assign FPComplexMult_io_in_b_Im = _T_1 ? 32'h80800000 : 32'h0; // @[FFTDesigns.scala 2333:32 2346:31 2351:31]
  assign FPComplexMult_1_clock = clock;
  assign FPComplexMult_1_reset = reset;
  assign FPComplexMult_1_io_in_a_Re = _T_1 ? io_in_1_Re : 32'h0; // @[FFTDesigns.scala 2333:32 2345:31 2350:31]
  assign FPComplexMult_1_io_in_a_Im = _T_1 ? io_in_1_Im : 32'h0; // @[FFTDesigns.scala 2333:32 2345:31 2350:31]
  assign FPComplexMult_1_io_in_b_Re = _T_1 ? TwiddleFactorROM_mr_io_out_data_1_Re : 32'h0; // @[FFTDesigns.scala 2333:32 2346:31 2351:31]
  assign FPComplexMult_1_io_in_b_Im = _T_1 ? TwiddleFactorROM_mr_io_out_data_1_Im : 32'h0; // @[FFTDesigns.scala 2333:32 2346:31 2351:31]
  assign FPComplexMult_2_clock = clock;
  assign FPComplexMult_2_reset = reset;
  assign FPComplexMult_2_io_in_a_Re = _T_1 ? io_in_2_Re : 32'h0; // @[FFTDesigns.scala 2333:32 2345:31 2350:31]
  assign FPComplexMult_2_io_in_a_Im = _T_1 ? io_in_2_Im : 32'h0; // @[FFTDesigns.scala 2333:32 2345:31 2350:31]
  assign FPComplexMult_2_io_in_b_Re = _T_1 ? TwiddleFactorROM_mr_io_out_data_2_Re : 32'h0; // @[FFTDesigns.scala 2333:32 2346:31 2351:31]
  assign FPComplexMult_2_io_in_b_Im = _T_1 ? TwiddleFactorROM_mr_io_out_data_2_Im : 32'h0; // @[FFTDesigns.scala 2333:32 2346:31 2351:31]
  assign FPComplexMult_3_clock = clock;
  assign FPComplexMult_3_reset = reset;
  assign FPComplexMult_3_io_in_a_Re = _T_1 ? io_in_3_Re : 32'h0; // @[FFTDesigns.scala 2333:32 2345:31 2350:31]
  assign FPComplexMult_3_io_in_a_Im = _T_1 ? io_in_3_Im : 32'h0; // @[FFTDesigns.scala 2333:32 2345:31 2350:31]
  assign FPComplexMult_3_io_in_b_Re = _T_1 ? 32'h3f800000 : 32'h0; // @[FFTDesigns.scala 2333:32 2346:31 2351:31]
  assign FPComplexMult_3_io_in_b_Im = _T_1 ? 32'h80800000 : 32'h0; // @[FFTDesigns.scala 2333:32 2346:31 2351:31]
  assign FPComplexMult_4_clock = clock;
  assign FPComplexMult_4_reset = reset;
  assign FPComplexMult_4_io_in_a_Re = _T_1 ? io_in_4_Re : 32'h0; // @[FFTDesigns.scala 2333:32 2345:31 2350:31]
  assign FPComplexMult_4_io_in_a_Im = _T_1 ? io_in_4_Im : 32'h0; // @[FFTDesigns.scala 2333:32 2345:31 2350:31]
  assign FPComplexMult_4_io_in_b_Re = _T_1 ? TwiddleFactorROM_mr_io_out_data_4_Re : 32'h0; // @[FFTDesigns.scala 2333:32 2346:31 2351:31]
  assign FPComplexMult_4_io_in_b_Im = _T_1 ? TwiddleFactorROM_mr_io_out_data_4_Im : 32'h0; // @[FFTDesigns.scala 2333:32 2346:31 2351:31]
  assign FPComplexMult_5_clock = clock;
  assign FPComplexMult_5_reset = reset;
  assign FPComplexMult_5_io_in_a_Re = _T_1 ? io_in_5_Re : 32'h0; // @[FFTDesigns.scala 2333:32 2345:31 2350:31]
  assign FPComplexMult_5_io_in_a_Im = _T_1 ? io_in_5_Im : 32'h0; // @[FFTDesigns.scala 2333:32 2345:31 2350:31]
  assign FPComplexMult_5_io_in_b_Re = _T_1 ? TwiddleFactorROM_mr_io_out_data_5_Re : 32'h0; // @[FFTDesigns.scala 2333:32 2346:31 2351:31]
  assign FPComplexMult_5_io_in_b_Im = _T_1 ? TwiddleFactorROM_mr_io_out_data_5_Im : 32'h0; // @[FFTDesigns.scala 2333:32 2346:31 2351:31]
  always @(posedge clock) begin
    if (reset) begin // @[FFTDesigns.scala 2322:24]
      cnt <= 4'h0; // @[FFTDesigns.scala 2322:24]
    end else if (_T_1) begin // @[FFTDesigns.scala 2333:32]
      if (cnt2 == 5'h17) begin // @[FFTDesigns.scala 2334:37]
        cnt <= 4'h0; // @[FFTDesigns.scala 2336:15]
      end else if (!(cnt == 4'hf & cnt2 != 5'h17)) begin // @[FFTDesigns.scala 2337:66]
        cnt <= _cnt_T_1; // @[FFTDesigns.scala 2341:15]
      end
    end else begin
      cnt <= 4'h0; // @[FFTDesigns.scala 2353:13]
    end
    if (reset) begin // @[FFTDesigns.scala 2323:25]
      cnt2 <= 5'h0; // @[FFTDesigns.scala 2323:25]
    end else if (_T_1) begin // @[FFTDesigns.scala 2333:32]
      if (cnt2 == 5'h17) begin // @[FFTDesigns.scala 2334:37]
        cnt2 <= 5'h0; // @[FFTDesigns.scala 2335:16]
      end else if (cnt == 4'hf & cnt2 != 5'h17) begin // @[FFTDesigns.scala 2337:66]
        cnt2 <= _cnt2_T_1; // @[FFTDesigns.scala 2339:16]
      end else begin
        cnt2 <= _cnt2_T_1; // @[FFTDesigns.scala 2342:16]
      end
    end else begin
      cnt2 <= 5'h0; // @[FFTDesigns.scala 2354:14]
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
  cnt = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  cnt2 = _RAND_1[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module od_fft96_4_6(
  input         clock,
  input         reset,
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  input  [31:0] io_in_2_Re,
  input  [31:0] io_in_2_Im,
  input  [31:0] io_in_3_Re,
  input  [31:0] io_in_3_Im,
  input         io_in_ready,
  output        io_out_validate,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im,
  output [31:0] io_out_2_Re,
  output [31:0] io_out_2_Im,
  output [31:0] io_out_3_Re,
  output [31:0] io_out_3_Im
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
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_193;
  reg [31:0] _RAND_194;
  reg [31:0] _RAND_195;
  reg [31:0] _RAND_196;
  reg [31:0] _RAND_197;
  reg [31:0] _RAND_198;
  reg [31:0] _RAND_199;
  reg [31:0] _RAND_200;
  reg [31:0] _RAND_201;
  reg [31:0] _RAND_202;
  reg [31:0] _RAND_203;
  reg [31:0] _RAND_204;
  reg [31:0] _RAND_205;
  reg [31:0] _RAND_206;
  reg [31:0] _RAND_207;
  reg [31:0] _RAND_208;
  reg [31:0] _RAND_209;
  reg [31:0] _RAND_210;
  reg [31:0] _RAND_211;
  reg [31:0] _RAND_212;
  reg [31:0] _RAND_213;
  reg [31:0] _RAND_214;
  reg [31:0] _RAND_215;
  reg [31:0] _RAND_216;
  reg [31:0] _RAND_217;
  reg [31:0] _RAND_218;
  reg [31:0] _RAND_219;
  reg [31:0] _RAND_220;
  reg [31:0] _RAND_221;
  reg [31:0] _RAND_222;
  reg [31:0] _RAND_223;
  reg [31:0] _RAND_224;
  reg [31:0] _RAND_225;
  reg [31:0] _RAND_226;
  reg [31:0] _RAND_227;
  reg [31:0] _RAND_228;
  reg [31:0] _RAND_229;
  reg [31:0] _RAND_230;
  reg [31:0] _RAND_231;
  reg [31:0] _RAND_232;
  reg [31:0] _RAND_233;
  reg [31:0] _RAND_234;
  reg [31:0] _RAND_235;
  reg [31:0] _RAND_236;
  reg [31:0] _RAND_237;
  reg [31:0] _RAND_238;
  reg [31:0] _RAND_239;
  reg [31:0] _RAND_240;
  reg [31:0] _RAND_241;
  reg [31:0] _RAND_242;
  reg [31:0] _RAND_243;
  reg [31:0] _RAND_244;
  reg [31:0] _RAND_245;
  reg [31:0] _RAND_246;
  reg [31:0] _RAND_247;
  reg [31:0] _RAND_248;
  reg [31:0] _RAND_249;
  reg [31:0] _RAND_250;
  reg [31:0] _RAND_251;
  reg [31:0] _RAND_252;
  reg [31:0] _RAND_253;
  reg [31:0] _RAND_254;
  reg [31:0] _RAND_255;
  reg [31:0] _RAND_256;
  reg [31:0] _RAND_257;
  reg [31:0] _RAND_258;
  reg [31:0] _RAND_259;
  reg [31:0] _RAND_260;
  reg [31:0] _RAND_261;
  reg [31:0] _RAND_262;
  reg [31:0] _RAND_263;
  reg [31:0] _RAND_264;
  reg [31:0] _RAND_265;
  reg [31:0] _RAND_266;
  reg [31:0] _RAND_267;
`endif // RANDOMIZE_REG_INIT
  wire  FFT_sr_v2_streaming_nrv_clock; // @[FFTDesigns.scala 6453:32]
  wire  FFT_sr_v2_streaming_nrv_reset; // @[FFTDesigns.scala 6453:32]
  wire [31:0] FFT_sr_v2_streaming_nrv_io_in_0_Re; // @[FFTDesigns.scala 6453:32]
  wire [31:0] FFT_sr_v2_streaming_nrv_io_in_0_Im; // @[FFTDesigns.scala 6453:32]
  wire [31:0] FFT_sr_v2_streaming_nrv_io_in_1_Re; // @[FFTDesigns.scala 6453:32]
  wire [31:0] FFT_sr_v2_streaming_nrv_io_in_1_Im; // @[FFTDesigns.scala 6453:32]
  wire [31:0] FFT_sr_v2_streaming_nrv_io_in_2_Re; // @[FFTDesigns.scala 6453:32]
  wire [31:0] FFT_sr_v2_streaming_nrv_io_in_2_Im; // @[FFTDesigns.scala 6453:32]
  wire [31:0] FFT_sr_v2_streaming_nrv_io_in_3_Re; // @[FFTDesigns.scala 6453:32]
  wire [31:0] FFT_sr_v2_streaming_nrv_io_in_3_Im; // @[FFTDesigns.scala 6453:32]
  wire  FFT_sr_v2_streaming_nrv_io_in_ready; // @[FFTDesigns.scala 6453:32]
  wire [31:0] FFT_sr_v2_streaming_nrv_io_out_0_Re; // @[FFTDesigns.scala 6453:32]
  wire [31:0] FFT_sr_v2_streaming_nrv_io_out_0_Im; // @[FFTDesigns.scala 6453:32]
  wire [31:0] FFT_sr_v2_streaming_nrv_io_out_1_Re; // @[FFTDesigns.scala 6453:32]
  wire [31:0] FFT_sr_v2_streaming_nrv_io_out_1_Im; // @[FFTDesigns.scala 6453:32]
  wire [31:0] FFT_sr_v2_streaming_nrv_io_out_2_Re; // @[FFTDesigns.scala 6453:32]
  wire [31:0] FFT_sr_v2_streaming_nrv_io_out_2_Im; // @[FFTDesigns.scala 6453:32]
  wire [31:0] FFT_sr_v2_streaming_nrv_io_out_3_Re; // @[FFTDesigns.scala 6453:32]
  wire [31:0] FFT_sr_v2_streaming_nrv_io_out_3_Im; // @[FFTDesigns.scala 6453:32]
  wire  DFT_r_v2_clock; // @[FFTDesigns.scala 6457:32]
  wire  DFT_r_v2_reset; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_io_in_0_Re; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_io_in_0_Im; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_io_in_1_Re; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_io_in_1_Im; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_io_in_2_Re; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_io_in_2_Im; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_io_out_0_Re; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_io_out_0_Im; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_io_out_1_Re; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_io_out_1_Im; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_io_out_2_Re; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_io_out_2_Im; // @[FFTDesigns.scala 6457:32]
  wire  DFT_r_v2_1_clock; // @[FFTDesigns.scala 6457:32]
  wire  DFT_r_v2_1_reset; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_1_io_in_0_Re; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_1_io_in_0_Im; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_1_io_in_1_Re; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_1_io_in_1_Im; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_1_io_in_2_Re; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_1_io_in_2_Im; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_1_io_out_0_Re; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_1_io_out_0_Im; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_1_io_out_1_Re; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_1_io_out_1_Im; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_1_io_out_2_Re; // @[FFTDesigns.scala 6457:32]
  wire [31:0] DFT_r_v2_1_io_out_2_Im; // @[FFTDesigns.scala 6457:32]
  wire  PermutationsWithStreaming_clock; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_reset; // @[FFTDesigns.scala 6468:32]
  wire [31:0] PermutationsWithStreaming_io_in_0_Re; // @[FFTDesigns.scala 6468:32]
  wire [31:0] PermutationsWithStreaming_io_in_0_Im; // @[FFTDesigns.scala 6468:32]
  wire [31:0] PermutationsWithStreaming_io_in_1_Re; // @[FFTDesigns.scala 6468:32]
  wire [31:0] PermutationsWithStreaming_io_in_1_Im; // @[FFTDesigns.scala 6468:32]
  wire [31:0] PermutationsWithStreaming_io_in_2_Re; // @[FFTDesigns.scala 6468:32]
  wire [31:0] PermutationsWithStreaming_io_in_2_Im; // @[FFTDesigns.scala 6468:32]
  wire [31:0] PermutationsWithStreaming_io_in_3_Re; // @[FFTDesigns.scala 6468:32]
  wire [31:0] PermutationsWithStreaming_io_in_3_Im; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_0; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_1; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_2; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_3; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_4; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_5; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_6; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_7; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_8; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_9; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_10; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_11; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_12; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_13; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_14; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_15; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_16; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_17; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_18; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_19; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_20; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_21; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_22; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_23; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_24; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_25; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_26; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_27; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_28; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_29; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_30; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_31; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_32; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_33; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_34; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_35; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_36; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_37; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_38; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_39; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_40; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_41; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_42; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_43; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_44; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_45; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_46; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_47; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_io_in_en_48; // @[FFTDesigns.scala 6468:32]
  wire [31:0] PermutationsWithStreaming_io_out_0_Re; // @[FFTDesigns.scala 6468:32]
  wire [31:0] PermutationsWithStreaming_io_out_0_Im; // @[FFTDesigns.scala 6468:32]
  wire [31:0] PermutationsWithStreaming_io_out_1_Re; // @[FFTDesigns.scala 6468:32]
  wire [31:0] PermutationsWithStreaming_io_out_1_Im; // @[FFTDesigns.scala 6468:32]
  wire [31:0] PermutationsWithStreaming_io_out_2_Re; // @[FFTDesigns.scala 6468:32]
  wire [31:0] PermutationsWithStreaming_io_out_2_Im; // @[FFTDesigns.scala 6468:32]
  wire [31:0] PermutationsWithStreaming_io_out_3_Re; // @[FFTDesigns.scala 6468:32]
  wire [31:0] PermutationsWithStreaming_io_out_3_Im; // @[FFTDesigns.scala 6468:32]
  wire  PermutationsWithStreaming_mr_clock; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_reset; // @[FFTDesigns.scala 6469:32]
  wire [31:0] PermutationsWithStreaming_mr_io_in_0_Re; // @[FFTDesigns.scala 6469:32]
  wire [31:0] PermutationsWithStreaming_mr_io_in_0_Im; // @[FFTDesigns.scala 6469:32]
  wire [31:0] PermutationsWithStreaming_mr_io_in_1_Re; // @[FFTDesigns.scala 6469:32]
  wire [31:0] PermutationsWithStreaming_mr_io_in_1_Im; // @[FFTDesigns.scala 6469:32]
  wire [31:0] PermutationsWithStreaming_mr_io_in_2_Re; // @[FFTDesigns.scala 6469:32]
  wire [31:0] PermutationsWithStreaming_mr_io_in_2_Im; // @[FFTDesigns.scala 6469:32]
  wire [31:0] PermutationsWithStreaming_mr_io_in_3_Re; // @[FFTDesigns.scala 6469:32]
  wire [31:0] PermutationsWithStreaming_mr_io_in_3_Im; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_0; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_1; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_2; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_3; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_4; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_5; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_6; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_7; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_8; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_9; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_10; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_11; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_12; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_13; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_14; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_15; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_16; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_17; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_18; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_19; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_20; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_21; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_22; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_23; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_24; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_25; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_26; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_27; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_28; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_29; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_30; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_31; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_32; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_33; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_34; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_35; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_36; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_37; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_38; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_39; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_40; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_41; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_42; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_43; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_44; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_45; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_46; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_47; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_io_in_en_48; // @[FFTDesigns.scala 6469:32]
  wire [31:0] PermutationsWithStreaming_mr_io_out_0_Re; // @[FFTDesigns.scala 6469:32]
  wire [31:0] PermutationsWithStreaming_mr_io_out_0_Im; // @[FFTDesigns.scala 6469:32]
  wire [31:0] PermutationsWithStreaming_mr_io_out_1_Re; // @[FFTDesigns.scala 6469:32]
  wire [31:0] PermutationsWithStreaming_mr_io_out_1_Im; // @[FFTDesigns.scala 6469:32]
  wire [31:0] PermutationsWithStreaming_mr_io_out_2_Re; // @[FFTDesigns.scala 6469:32]
  wire [31:0] PermutationsWithStreaming_mr_io_out_2_Im; // @[FFTDesigns.scala 6469:32]
  wire [31:0] PermutationsWithStreaming_mr_io_out_3_Re; // @[FFTDesigns.scala 6469:32]
  wire [31:0] PermutationsWithStreaming_mr_io_out_3_Im; // @[FFTDesigns.scala 6469:32]
  wire [31:0] PermutationsWithStreaming_mr_io_out_4_Re; // @[FFTDesigns.scala 6469:32]
  wire [31:0] PermutationsWithStreaming_mr_io_out_4_Im; // @[FFTDesigns.scala 6469:32]
  wire [31:0] PermutationsWithStreaming_mr_io_out_5_Re; // @[FFTDesigns.scala 6469:32]
  wire [31:0] PermutationsWithStreaming_mr_io_out_5_Im; // @[FFTDesigns.scala 6469:32]
  wire  PermutationsWithStreaming_mr_1_clock; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_reset; // @[FFTDesigns.scala 6470:32]
  wire [31:0] PermutationsWithStreaming_mr_1_io_in_0_Re; // @[FFTDesigns.scala 6470:32]
  wire [31:0] PermutationsWithStreaming_mr_1_io_in_0_Im; // @[FFTDesigns.scala 6470:32]
  wire [31:0] PermutationsWithStreaming_mr_1_io_in_1_Re; // @[FFTDesigns.scala 6470:32]
  wire [31:0] PermutationsWithStreaming_mr_1_io_in_1_Im; // @[FFTDesigns.scala 6470:32]
  wire [31:0] PermutationsWithStreaming_mr_1_io_in_2_Re; // @[FFTDesigns.scala 6470:32]
  wire [31:0] PermutationsWithStreaming_mr_1_io_in_2_Im; // @[FFTDesigns.scala 6470:32]
  wire [31:0] PermutationsWithStreaming_mr_1_io_in_3_Re; // @[FFTDesigns.scala 6470:32]
  wire [31:0] PermutationsWithStreaming_mr_1_io_in_3_Im; // @[FFTDesigns.scala 6470:32]
  wire [31:0] PermutationsWithStreaming_mr_1_io_in_4_Re; // @[FFTDesigns.scala 6470:32]
  wire [31:0] PermutationsWithStreaming_mr_1_io_in_4_Im; // @[FFTDesigns.scala 6470:32]
  wire [31:0] PermutationsWithStreaming_mr_1_io_in_5_Re; // @[FFTDesigns.scala 6470:32]
  wire [31:0] PermutationsWithStreaming_mr_1_io_in_5_Im; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_0; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_1; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_2; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_3; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_4; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_5; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_6; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_7; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_8; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_9; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_10; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_11; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_12; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_13; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_14; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_15; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_16; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_17; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_18; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_19; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_20; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_21; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_22; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_23; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_24; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_25; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_26; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_27; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_28; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_29; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_30; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_31; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_32; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_33; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_34; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_35; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_36; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_37; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_38; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_39; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_40; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_41; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_42; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_43; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_44; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_45; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_46; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_47; // @[FFTDesigns.scala 6470:32]
  wire  PermutationsWithStreaming_mr_1_io_in_en_48; // @[FFTDesigns.scala 6470:32]
  wire [31:0] PermutationsWithStreaming_mr_1_io_out_0_Re; // @[FFTDesigns.scala 6470:32]
  wire [31:0] PermutationsWithStreaming_mr_1_io_out_0_Im; // @[FFTDesigns.scala 6470:32]
  wire [31:0] PermutationsWithStreaming_mr_1_io_out_1_Re; // @[FFTDesigns.scala 6470:32]
  wire [31:0] PermutationsWithStreaming_mr_1_io_out_1_Im; // @[FFTDesigns.scala 6470:32]
  wire [31:0] PermutationsWithStreaming_mr_1_io_out_2_Re; // @[FFTDesigns.scala 6470:32]
  wire [31:0] PermutationsWithStreaming_mr_1_io_out_2_Im; // @[FFTDesigns.scala 6470:32]
  wire [31:0] PermutationsWithStreaming_mr_1_io_out_3_Re; // @[FFTDesigns.scala 6470:32]
  wire [31:0] PermutationsWithStreaming_mr_1_io_out_3_Im; // @[FFTDesigns.scala 6470:32]
  wire  TwiddleFactorsStreamed_mr_v2_clock; // @[FFTDesigns.scala 6471:32]
  wire  TwiddleFactorsStreamed_mr_v2_reset; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_in_0_Re; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_in_0_Im; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_in_1_Re; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_in_1_Im; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_in_2_Re; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_in_2_Im; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_in_3_Re; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_in_3_Im; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_in_4_Re; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_in_4_Im; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_in_5_Re; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_in_5_Im; // @[FFTDesigns.scala 6471:32]
  wire  TwiddleFactorsStreamed_mr_v2_io_in_en_0; // @[FFTDesigns.scala 6471:32]
  wire  TwiddleFactorsStreamed_mr_v2_io_in_en_1; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_out_0_Re; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_out_0_Im; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_out_1_Re; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_out_1_Im; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_out_2_Re; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_out_2_Im; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_out_3_Re; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_out_3_Im; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_out_4_Re; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_out_4_Im; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_out_5_Re; // @[FFTDesigns.scala 6471:32]
  wire [31:0] TwiddleFactorsStreamed_mr_v2_io_out_5_Im; // @[FFTDesigns.scala 6471:32]
  reg  DFT_regdelays1_0; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_1; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_2; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_3; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_4; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_5; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_6; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_7; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_8; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_9; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_10; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_11; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_12; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_13; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_14; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_15; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_16; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_17; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_18; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_19; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_20; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_21; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_22; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_23; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_24; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_25; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_26; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_27; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_28; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_29; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_30; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_31; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_32; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_33; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_34; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_35; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_36; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_37; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_38; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_39; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_40; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_41; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_42; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_43; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_44; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_45; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_46; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_47; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_48; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_49; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_50; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_51; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_52; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_53; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_54; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_55; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_56; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_57; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_58; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_59; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_60; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_61; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_62; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_63; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_64; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_65; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_66; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_67; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_68; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_69; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_70; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_71; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_72; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_73; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_74; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_75; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_76; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_77; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_78; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_79; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_80; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_81; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_82; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_83; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_84; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_85; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_86; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_87; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_88; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_89; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_90; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_91; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_92; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_93; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_94; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_95; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_96; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_97; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_98; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_99; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_100; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_101; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_102; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_103; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_104; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_105; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_106; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_107; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays1_108; // @[FFTDesigns.scala 6474:35]
  reg  DFT_regdelays2_0; // @[FFTDesigns.scala 6475:35]
  reg  DFT_regdelays2_1; // @[FFTDesigns.scala 6475:35]
  reg  DFT_regdelays2_2; // @[FFTDesigns.scala 6475:35]
  reg  DFT_regdelays2_3; // @[FFTDesigns.scala 6475:35]
  reg  Twid_regdelays_0; // @[FFTDesigns.scala 6476:35]
  reg  Twid_regdelays_1; // @[FFTDesigns.scala 6476:35]
  reg  Perm_regdelays1_0_0; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_1; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_2; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_3; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_4; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_5; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_6; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_7; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_8; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_9; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_10; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_11; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_12; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_13; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_14; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_15; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_16; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_17; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_18; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_19; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_20; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_21; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_22; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_23; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_24; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_25; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_26; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_27; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_28; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_29; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_30; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_31; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_32; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_33; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_34; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_35; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_36; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_37; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_38; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_39; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_40; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_41; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_42; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_43; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_44; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_45; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_46; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_0_47; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_0; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_1; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_2; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_3; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_4; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_5; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_6; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_7; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_8; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_9; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_10; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_11; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_12; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_13; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_14; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_15; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_16; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_17; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_18; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_19; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_20; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_21; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_22; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_23; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_24; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_25; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_26; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_27; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_28; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_29; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_30; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_31; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_32; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_33; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_34; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_35; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_36; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_37; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_38; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_39; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_40; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_41; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_42; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_43; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_44; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_45; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_46; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_1_47; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_0; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_1; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_2; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_3; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_4; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_5; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_6; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_7; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_8; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_9; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_10; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_11; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_12; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_13; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_14; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_15; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_16; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_17; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_18; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_19; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_20; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_21; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_22; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_23; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_24; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_25; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_26; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_27; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_28; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_29; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_30; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_31; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_32; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_33; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_34; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_35; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_36; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_37; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_38; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_39; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_40; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_41; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_42; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_43; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_44; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_45; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_46; // @[FFTDesigns.scala 6477:36]
  reg  Perm_regdelays1_2_47; // @[FFTDesigns.scala 6477:36]
  reg  out_regdelay; // @[FFTDesigns.scala 6478:33]
  reg [31:0] results_0_Re; // @[FFTDesigns.scala 6479:28]
  reg [31:0] results_0_Im; // @[FFTDesigns.scala 6479:28]
  reg [31:0] results_1_Re; // @[FFTDesigns.scala 6479:28]
  reg [31:0] results_1_Im; // @[FFTDesigns.scala 6479:28]
  reg [31:0] results_2_Re; // @[FFTDesigns.scala 6479:28]
  reg [31:0] results_2_Im; // @[FFTDesigns.scala 6479:28]
  reg [31:0] results_3_Re; // @[FFTDesigns.scala 6479:28]
  reg [31:0] results_3_Im; // @[FFTDesigns.scala 6479:28]
  FFT_sr_v2_streaming_nrv FFT_sr_v2_streaming_nrv ( // @[FFTDesigns.scala 6453:32]
    .clock(FFT_sr_v2_streaming_nrv_clock),
    .reset(FFT_sr_v2_streaming_nrv_reset),
    .io_in_0_Re(FFT_sr_v2_streaming_nrv_io_in_0_Re),
    .io_in_0_Im(FFT_sr_v2_streaming_nrv_io_in_0_Im),
    .io_in_1_Re(FFT_sr_v2_streaming_nrv_io_in_1_Re),
    .io_in_1_Im(FFT_sr_v2_streaming_nrv_io_in_1_Im),
    .io_in_2_Re(FFT_sr_v2_streaming_nrv_io_in_2_Re),
    .io_in_2_Im(FFT_sr_v2_streaming_nrv_io_in_2_Im),
    .io_in_3_Re(FFT_sr_v2_streaming_nrv_io_in_3_Re),
    .io_in_3_Im(FFT_sr_v2_streaming_nrv_io_in_3_Im),
    .io_in_ready(FFT_sr_v2_streaming_nrv_io_in_ready),
    .io_out_0_Re(FFT_sr_v2_streaming_nrv_io_out_0_Re),
    .io_out_0_Im(FFT_sr_v2_streaming_nrv_io_out_0_Im),
    .io_out_1_Re(FFT_sr_v2_streaming_nrv_io_out_1_Re),
    .io_out_1_Im(FFT_sr_v2_streaming_nrv_io_out_1_Im),
    .io_out_2_Re(FFT_sr_v2_streaming_nrv_io_out_2_Re),
    .io_out_2_Im(FFT_sr_v2_streaming_nrv_io_out_2_Im),
    .io_out_3_Re(FFT_sr_v2_streaming_nrv_io_out_3_Re),
    .io_out_3_Im(FFT_sr_v2_streaming_nrv_io_out_3_Im)
  );
  DFT_r_v2_10 DFT_r_v2 ( // @[FFTDesigns.scala 6457:32]
    .clock(DFT_r_v2_clock),
    .reset(DFT_r_v2_reset),
    .io_in_0_Re(DFT_r_v2_io_in_0_Re),
    .io_in_0_Im(DFT_r_v2_io_in_0_Im),
    .io_in_1_Re(DFT_r_v2_io_in_1_Re),
    .io_in_1_Im(DFT_r_v2_io_in_1_Im),
    .io_in_2_Re(DFT_r_v2_io_in_2_Re),
    .io_in_2_Im(DFT_r_v2_io_in_2_Im),
    .io_out_0_Re(DFT_r_v2_io_out_0_Re),
    .io_out_0_Im(DFT_r_v2_io_out_0_Im),
    .io_out_1_Re(DFT_r_v2_io_out_1_Re),
    .io_out_1_Im(DFT_r_v2_io_out_1_Im),
    .io_out_2_Re(DFT_r_v2_io_out_2_Re),
    .io_out_2_Im(DFT_r_v2_io_out_2_Im)
  );
  DFT_r_v2_10 DFT_r_v2_1 ( // @[FFTDesigns.scala 6457:32]
    .clock(DFT_r_v2_1_clock),
    .reset(DFT_r_v2_1_reset),
    .io_in_0_Re(DFT_r_v2_1_io_in_0_Re),
    .io_in_0_Im(DFT_r_v2_1_io_in_0_Im),
    .io_in_1_Re(DFT_r_v2_1_io_in_1_Re),
    .io_in_1_Im(DFT_r_v2_1_io_in_1_Im),
    .io_in_2_Re(DFT_r_v2_1_io_in_2_Re),
    .io_in_2_Im(DFT_r_v2_1_io_in_2_Im),
    .io_out_0_Re(DFT_r_v2_1_io_out_0_Re),
    .io_out_0_Im(DFT_r_v2_1_io_out_0_Im),
    .io_out_1_Re(DFT_r_v2_1_io_out_1_Re),
    .io_out_1_Im(DFT_r_v2_1_io_out_1_Im),
    .io_out_2_Re(DFT_r_v2_1_io_out_2_Re),
    .io_out_2_Im(DFT_r_v2_1_io_out_2_Im)
  );
  PermutationsWithStreaming_6 PermutationsWithStreaming ( // @[FFTDesigns.scala 6468:32]
    .clock(PermutationsWithStreaming_clock),
    .reset(PermutationsWithStreaming_reset),
    .io_in_0_Re(PermutationsWithStreaming_io_in_0_Re),
    .io_in_0_Im(PermutationsWithStreaming_io_in_0_Im),
    .io_in_1_Re(PermutationsWithStreaming_io_in_1_Re),
    .io_in_1_Im(PermutationsWithStreaming_io_in_1_Im),
    .io_in_2_Re(PermutationsWithStreaming_io_in_2_Re),
    .io_in_2_Im(PermutationsWithStreaming_io_in_2_Im),
    .io_in_3_Re(PermutationsWithStreaming_io_in_3_Re),
    .io_in_3_Im(PermutationsWithStreaming_io_in_3_Im),
    .io_in_en_0(PermutationsWithStreaming_io_in_en_0),
    .io_in_en_1(PermutationsWithStreaming_io_in_en_1),
    .io_in_en_2(PermutationsWithStreaming_io_in_en_2),
    .io_in_en_3(PermutationsWithStreaming_io_in_en_3),
    .io_in_en_4(PermutationsWithStreaming_io_in_en_4),
    .io_in_en_5(PermutationsWithStreaming_io_in_en_5),
    .io_in_en_6(PermutationsWithStreaming_io_in_en_6),
    .io_in_en_7(PermutationsWithStreaming_io_in_en_7),
    .io_in_en_8(PermutationsWithStreaming_io_in_en_8),
    .io_in_en_9(PermutationsWithStreaming_io_in_en_9),
    .io_in_en_10(PermutationsWithStreaming_io_in_en_10),
    .io_in_en_11(PermutationsWithStreaming_io_in_en_11),
    .io_in_en_12(PermutationsWithStreaming_io_in_en_12),
    .io_in_en_13(PermutationsWithStreaming_io_in_en_13),
    .io_in_en_14(PermutationsWithStreaming_io_in_en_14),
    .io_in_en_15(PermutationsWithStreaming_io_in_en_15),
    .io_in_en_16(PermutationsWithStreaming_io_in_en_16),
    .io_in_en_17(PermutationsWithStreaming_io_in_en_17),
    .io_in_en_18(PermutationsWithStreaming_io_in_en_18),
    .io_in_en_19(PermutationsWithStreaming_io_in_en_19),
    .io_in_en_20(PermutationsWithStreaming_io_in_en_20),
    .io_in_en_21(PermutationsWithStreaming_io_in_en_21),
    .io_in_en_22(PermutationsWithStreaming_io_in_en_22),
    .io_in_en_23(PermutationsWithStreaming_io_in_en_23),
    .io_in_en_24(PermutationsWithStreaming_io_in_en_24),
    .io_in_en_25(PermutationsWithStreaming_io_in_en_25),
    .io_in_en_26(PermutationsWithStreaming_io_in_en_26),
    .io_in_en_27(PermutationsWithStreaming_io_in_en_27),
    .io_in_en_28(PermutationsWithStreaming_io_in_en_28),
    .io_in_en_29(PermutationsWithStreaming_io_in_en_29),
    .io_in_en_30(PermutationsWithStreaming_io_in_en_30),
    .io_in_en_31(PermutationsWithStreaming_io_in_en_31),
    .io_in_en_32(PermutationsWithStreaming_io_in_en_32),
    .io_in_en_33(PermutationsWithStreaming_io_in_en_33),
    .io_in_en_34(PermutationsWithStreaming_io_in_en_34),
    .io_in_en_35(PermutationsWithStreaming_io_in_en_35),
    .io_in_en_36(PermutationsWithStreaming_io_in_en_36),
    .io_in_en_37(PermutationsWithStreaming_io_in_en_37),
    .io_in_en_38(PermutationsWithStreaming_io_in_en_38),
    .io_in_en_39(PermutationsWithStreaming_io_in_en_39),
    .io_in_en_40(PermutationsWithStreaming_io_in_en_40),
    .io_in_en_41(PermutationsWithStreaming_io_in_en_41),
    .io_in_en_42(PermutationsWithStreaming_io_in_en_42),
    .io_in_en_43(PermutationsWithStreaming_io_in_en_43),
    .io_in_en_44(PermutationsWithStreaming_io_in_en_44),
    .io_in_en_45(PermutationsWithStreaming_io_in_en_45),
    .io_in_en_46(PermutationsWithStreaming_io_in_en_46),
    .io_in_en_47(PermutationsWithStreaming_io_in_en_47),
    .io_in_en_48(PermutationsWithStreaming_io_in_en_48),
    .io_out_0_Re(PermutationsWithStreaming_io_out_0_Re),
    .io_out_0_Im(PermutationsWithStreaming_io_out_0_Im),
    .io_out_1_Re(PermutationsWithStreaming_io_out_1_Re),
    .io_out_1_Im(PermutationsWithStreaming_io_out_1_Im),
    .io_out_2_Re(PermutationsWithStreaming_io_out_2_Re),
    .io_out_2_Im(PermutationsWithStreaming_io_out_2_Im),
    .io_out_3_Re(PermutationsWithStreaming_io_out_3_Re),
    .io_out_3_Im(PermutationsWithStreaming_io_out_3_Im)
  );
  PermutationsWithStreaming_mr PermutationsWithStreaming_mr ( // @[FFTDesigns.scala 6469:32]
    .clock(PermutationsWithStreaming_mr_clock),
    .reset(PermutationsWithStreaming_mr_reset),
    .io_in_0_Re(PermutationsWithStreaming_mr_io_in_0_Re),
    .io_in_0_Im(PermutationsWithStreaming_mr_io_in_0_Im),
    .io_in_1_Re(PermutationsWithStreaming_mr_io_in_1_Re),
    .io_in_1_Im(PermutationsWithStreaming_mr_io_in_1_Im),
    .io_in_2_Re(PermutationsWithStreaming_mr_io_in_2_Re),
    .io_in_2_Im(PermutationsWithStreaming_mr_io_in_2_Im),
    .io_in_3_Re(PermutationsWithStreaming_mr_io_in_3_Re),
    .io_in_3_Im(PermutationsWithStreaming_mr_io_in_3_Im),
    .io_in_en_0(PermutationsWithStreaming_mr_io_in_en_0),
    .io_in_en_1(PermutationsWithStreaming_mr_io_in_en_1),
    .io_in_en_2(PermutationsWithStreaming_mr_io_in_en_2),
    .io_in_en_3(PermutationsWithStreaming_mr_io_in_en_3),
    .io_in_en_4(PermutationsWithStreaming_mr_io_in_en_4),
    .io_in_en_5(PermutationsWithStreaming_mr_io_in_en_5),
    .io_in_en_6(PermutationsWithStreaming_mr_io_in_en_6),
    .io_in_en_7(PermutationsWithStreaming_mr_io_in_en_7),
    .io_in_en_8(PermutationsWithStreaming_mr_io_in_en_8),
    .io_in_en_9(PermutationsWithStreaming_mr_io_in_en_9),
    .io_in_en_10(PermutationsWithStreaming_mr_io_in_en_10),
    .io_in_en_11(PermutationsWithStreaming_mr_io_in_en_11),
    .io_in_en_12(PermutationsWithStreaming_mr_io_in_en_12),
    .io_in_en_13(PermutationsWithStreaming_mr_io_in_en_13),
    .io_in_en_14(PermutationsWithStreaming_mr_io_in_en_14),
    .io_in_en_15(PermutationsWithStreaming_mr_io_in_en_15),
    .io_in_en_16(PermutationsWithStreaming_mr_io_in_en_16),
    .io_in_en_17(PermutationsWithStreaming_mr_io_in_en_17),
    .io_in_en_18(PermutationsWithStreaming_mr_io_in_en_18),
    .io_in_en_19(PermutationsWithStreaming_mr_io_in_en_19),
    .io_in_en_20(PermutationsWithStreaming_mr_io_in_en_20),
    .io_in_en_21(PermutationsWithStreaming_mr_io_in_en_21),
    .io_in_en_22(PermutationsWithStreaming_mr_io_in_en_22),
    .io_in_en_23(PermutationsWithStreaming_mr_io_in_en_23),
    .io_in_en_24(PermutationsWithStreaming_mr_io_in_en_24),
    .io_in_en_25(PermutationsWithStreaming_mr_io_in_en_25),
    .io_in_en_26(PermutationsWithStreaming_mr_io_in_en_26),
    .io_in_en_27(PermutationsWithStreaming_mr_io_in_en_27),
    .io_in_en_28(PermutationsWithStreaming_mr_io_in_en_28),
    .io_in_en_29(PermutationsWithStreaming_mr_io_in_en_29),
    .io_in_en_30(PermutationsWithStreaming_mr_io_in_en_30),
    .io_in_en_31(PermutationsWithStreaming_mr_io_in_en_31),
    .io_in_en_32(PermutationsWithStreaming_mr_io_in_en_32),
    .io_in_en_33(PermutationsWithStreaming_mr_io_in_en_33),
    .io_in_en_34(PermutationsWithStreaming_mr_io_in_en_34),
    .io_in_en_35(PermutationsWithStreaming_mr_io_in_en_35),
    .io_in_en_36(PermutationsWithStreaming_mr_io_in_en_36),
    .io_in_en_37(PermutationsWithStreaming_mr_io_in_en_37),
    .io_in_en_38(PermutationsWithStreaming_mr_io_in_en_38),
    .io_in_en_39(PermutationsWithStreaming_mr_io_in_en_39),
    .io_in_en_40(PermutationsWithStreaming_mr_io_in_en_40),
    .io_in_en_41(PermutationsWithStreaming_mr_io_in_en_41),
    .io_in_en_42(PermutationsWithStreaming_mr_io_in_en_42),
    .io_in_en_43(PermutationsWithStreaming_mr_io_in_en_43),
    .io_in_en_44(PermutationsWithStreaming_mr_io_in_en_44),
    .io_in_en_45(PermutationsWithStreaming_mr_io_in_en_45),
    .io_in_en_46(PermutationsWithStreaming_mr_io_in_en_46),
    .io_in_en_47(PermutationsWithStreaming_mr_io_in_en_47),
    .io_in_en_48(PermutationsWithStreaming_mr_io_in_en_48),
    .io_out_0_Re(PermutationsWithStreaming_mr_io_out_0_Re),
    .io_out_0_Im(PermutationsWithStreaming_mr_io_out_0_Im),
    .io_out_1_Re(PermutationsWithStreaming_mr_io_out_1_Re),
    .io_out_1_Im(PermutationsWithStreaming_mr_io_out_1_Im),
    .io_out_2_Re(PermutationsWithStreaming_mr_io_out_2_Re),
    .io_out_2_Im(PermutationsWithStreaming_mr_io_out_2_Im),
    .io_out_3_Re(PermutationsWithStreaming_mr_io_out_3_Re),
    .io_out_3_Im(PermutationsWithStreaming_mr_io_out_3_Im),
    .io_out_4_Re(PermutationsWithStreaming_mr_io_out_4_Re),
    .io_out_4_Im(PermutationsWithStreaming_mr_io_out_4_Im),
    .io_out_5_Re(PermutationsWithStreaming_mr_io_out_5_Re),
    .io_out_5_Im(PermutationsWithStreaming_mr_io_out_5_Im)
  );
  PermutationsWithStreaming_mr_1 PermutationsWithStreaming_mr_1 ( // @[FFTDesigns.scala 6470:32]
    .clock(PermutationsWithStreaming_mr_1_clock),
    .reset(PermutationsWithStreaming_mr_1_reset),
    .io_in_0_Re(PermutationsWithStreaming_mr_1_io_in_0_Re),
    .io_in_0_Im(PermutationsWithStreaming_mr_1_io_in_0_Im),
    .io_in_1_Re(PermutationsWithStreaming_mr_1_io_in_1_Re),
    .io_in_1_Im(PermutationsWithStreaming_mr_1_io_in_1_Im),
    .io_in_2_Re(PermutationsWithStreaming_mr_1_io_in_2_Re),
    .io_in_2_Im(PermutationsWithStreaming_mr_1_io_in_2_Im),
    .io_in_3_Re(PermutationsWithStreaming_mr_1_io_in_3_Re),
    .io_in_3_Im(PermutationsWithStreaming_mr_1_io_in_3_Im),
    .io_in_4_Re(PermutationsWithStreaming_mr_1_io_in_4_Re),
    .io_in_4_Im(PermutationsWithStreaming_mr_1_io_in_4_Im),
    .io_in_5_Re(PermutationsWithStreaming_mr_1_io_in_5_Re),
    .io_in_5_Im(PermutationsWithStreaming_mr_1_io_in_5_Im),
    .io_in_en_0(PermutationsWithStreaming_mr_1_io_in_en_0),
    .io_in_en_1(PermutationsWithStreaming_mr_1_io_in_en_1),
    .io_in_en_2(PermutationsWithStreaming_mr_1_io_in_en_2),
    .io_in_en_3(PermutationsWithStreaming_mr_1_io_in_en_3),
    .io_in_en_4(PermutationsWithStreaming_mr_1_io_in_en_4),
    .io_in_en_5(PermutationsWithStreaming_mr_1_io_in_en_5),
    .io_in_en_6(PermutationsWithStreaming_mr_1_io_in_en_6),
    .io_in_en_7(PermutationsWithStreaming_mr_1_io_in_en_7),
    .io_in_en_8(PermutationsWithStreaming_mr_1_io_in_en_8),
    .io_in_en_9(PermutationsWithStreaming_mr_1_io_in_en_9),
    .io_in_en_10(PermutationsWithStreaming_mr_1_io_in_en_10),
    .io_in_en_11(PermutationsWithStreaming_mr_1_io_in_en_11),
    .io_in_en_12(PermutationsWithStreaming_mr_1_io_in_en_12),
    .io_in_en_13(PermutationsWithStreaming_mr_1_io_in_en_13),
    .io_in_en_14(PermutationsWithStreaming_mr_1_io_in_en_14),
    .io_in_en_15(PermutationsWithStreaming_mr_1_io_in_en_15),
    .io_in_en_16(PermutationsWithStreaming_mr_1_io_in_en_16),
    .io_in_en_17(PermutationsWithStreaming_mr_1_io_in_en_17),
    .io_in_en_18(PermutationsWithStreaming_mr_1_io_in_en_18),
    .io_in_en_19(PermutationsWithStreaming_mr_1_io_in_en_19),
    .io_in_en_20(PermutationsWithStreaming_mr_1_io_in_en_20),
    .io_in_en_21(PermutationsWithStreaming_mr_1_io_in_en_21),
    .io_in_en_22(PermutationsWithStreaming_mr_1_io_in_en_22),
    .io_in_en_23(PermutationsWithStreaming_mr_1_io_in_en_23),
    .io_in_en_24(PermutationsWithStreaming_mr_1_io_in_en_24),
    .io_in_en_25(PermutationsWithStreaming_mr_1_io_in_en_25),
    .io_in_en_26(PermutationsWithStreaming_mr_1_io_in_en_26),
    .io_in_en_27(PermutationsWithStreaming_mr_1_io_in_en_27),
    .io_in_en_28(PermutationsWithStreaming_mr_1_io_in_en_28),
    .io_in_en_29(PermutationsWithStreaming_mr_1_io_in_en_29),
    .io_in_en_30(PermutationsWithStreaming_mr_1_io_in_en_30),
    .io_in_en_31(PermutationsWithStreaming_mr_1_io_in_en_31),
    .io_in_en_32(PermutationsWithStreaming_mr_1_io_in_en_32),
    .io_in_en_33(PermutationsWithStreaming_mr_1_io_in_en_33),
    .io_in_en_34(PermutationsWithStreaming_mr_1_io_in_en_34),
    .io_in_en_35(PermutationsWithStreaming_mr_1_io_in_en_35),
    .io_in_en_36(PermutationsWithStreaming_mr_1_io_in_en_36),
    .io_in_en_37(PermutationsWithStreaming_mr_1_io_in_en_37),
    .io_in_en_38(PermutationsWithStreaming_mr_1_io_in_en_38),
    .io_in_en_39(PermutationsWithStreaming_mr_1_io_in_en_39),
    .io_in_en_40(PermutationsWithStreaming_mr_1_io_in_en_40),
    .io_in_en_41(PermutationsWithStreaming_mr_1_io_in_en_41),
    .io_in_en_42(PermutationsWithStreaming_mr_1_io_in_en_42),
    .io_in_en_43(PermutationsWithStreaming_mr_1_io_in_en_43),
    .io_in_en_44(PermutationsWithStreaming_mr_1_io_in_en_44),
    .io_in_en_45(PermutationsWithStreaming_mr_1_io_in_en_45),
    .io_in_en_46(PermutationsWithStreaming_mr_1_io_in_en_46),
    .io_in_en_47(PermutationsWithStreaming_mr_1_io_in_en_47),
    .io_in_en_48(PermutationsWithStreaming_mr_1_io_in_en_48),
    .io_out_0_Re(PermutationsWithStreaming_mr_1_io_out_0_Re),
    .io_out_0_Im(PermutationsWithStreaming_mr_1_io_out_0_Im),
    .io_out_1_Re(PermutationsWithStreaming_mr_1_io_out_1_Re),
    .io_out_1_Im(PermutationsWithStreaming_mr_1_io_out_1_Im),
    .io_out_2_Re(PermutationsWithStreaming_mr_1_io_out_2_Re),
    .io_out_2_Im(PermutationsWithStreaming_mr_1_io_out_2_Im),
    .io_out_3_Re(PermutationsWithStreaming_mr_1_io_out_3_Re),
    .io_out_3_Im(PermutationsWithStreaming_mr_1_io_out_3_Im)
  );
  TwiddleFactorsStreamed_mr_v2 TwiddleFactorsStreamed_mr_v2 ( // @[FFTDesigns.scala 6471:32]
    .clock(TwiddleFactorsStreamed_mr_v2_clock),
    .reset(TwiddleFactorsStreamed_mr_v2_reset),
    .io_in_0_Re(TwiddleFactorsStreamed_mr_v2_io_in_0_Re),
    .io_in_0_Im(TwiddleFactorsStreamed_mr_v2_io_in_0_Im),
    .io_in_1_Re(TwiddleFactorsStreamed_mr_v2_io_in_1_Re),
    .io_in_1_Im(TwiddleFactorsStreamed_mr_v2_io_in_1_Im),
    .io_in_2_Re(TwiddleFactorsStreamed_mr_v2_io_in_2_Re),
    .io_in_2_Im(TwiddleFactorsStreamed_mr_v2_io_in_2_Im),
    .io_in_3_Re(TwiddleFactorsStreamed_mr_v2_io_in_3_Re),
    .io_in_3_Im(TwiddleFactorsStreamed_mr_v2_io_in_3_Im),
    .io_in_4_Re(TwiddleFactorsStreamed_mr_v2_io_in_4_Re),
    .io_in_4_Im(TwiddleFactorsStreamed_mr_v2_io_in_4_Im),
    .io_in_5_Re(TwiddleFactorsStreamed_mr_v2_io_in_5_Re),
    .io_in_5_Im(TwiddleFactorsStreamed_mr_v2_io_in_5_Im),
    .io_in_en_0(TwiddleFactorsStreamed_mr_v2_io_in_en_0),
    .io_in_en_1(TwiddleFactorsStreamed_mr_v2_io_in_en_1),
    .io_out_0_Re(TwiddleFactorsStreamed_mr_v2_io_out_0_Re),
    .io_out_0_Im(TwiddleFactorsStreamed_mr_v2_io_out_0_Im),
    .io_out_1_Re(TwiddleFactorsStreamed_mr_v2_io_out_1_Re),
    .io_out_1_Im(TwiddleFactorsStreamed_mr_v2_io_out_1_Im),
    .io_out_2_Re(TwiddleFactorsStreamed_mr_v2_io_out_2_Re),
    .io_out_2_Im(TwiddleFactorsStreamed_mr_v2_io_out_2_Im),
    .io_out_3_Re(TwiddleFactorsStreamed_mr_v2_io_out_3_Re),
    .io_out_3_Im(TwiddleFactorsStreamed_mr_v2_io_out_3_Im),
    .io_out_4_Re(TwiddleFactorsStreamed_mr_v2_io_out_4_Re),
    .io_out_4_Im(TwiddleFactorsStreamed_mr_v2_io_out_4_Im),
    .io_out_5_Re(TwiddleFactorsStreamed_mr_v2_io_out_5_Re),
    .io_out_5_Im(TwiddleFactorsStreamed_mr_v2_io_out_5_Im)
  );
  assign io_out_validate = out_regdelay; // @[FFTDesigns.scala 6560:23]
  assign io_out_0_Re = results_0_Re; // @[FFTDesigns.scala 6561:14]
  assign io_out_0_Im = results_0_Im; // @[FFTDesigns.scala 6561:14]
  assign io_out_1_Re = results_1_Re; // @[FFTDesigns.scala 6561:14]
  assign io_out_1_Im = results_1_Im; // @[FFTDesigns.scala 6561:14]
  assign io_out_2_Re = results_2_Re; // @[FFTDesigns.scala 6561:14]
  assign io_out_2_Im = results_2_Im; // @[FFTDesigns.scala 6561:14]
  assign io_out_3_Re = results_3_Re; // @[FFTDesigns.scala 6561:14]
  assign io_out_3_Im = results_3_Im; // @[FFTDesigns.scala 6561:14]
  assign FFT_sr_v2_streaming_nrv_clock = clock;
  assign FFT_sr_v2_streaming_nrv_reset = reset;
  assign FFT_sr_v2_streaming_nrv_io_in_0_Re = PermutationsWithStreaming_io_out_0_Re; // @[FFTDesigns.scala 6535:27]
  assign FFT_sr_v2_streaming_nrv_io_in_0_Im = PermutationsWithStreaming_io_out_0_Im; // @[FFTDesigns.scala 6535:27]
  assign FFT_sr_v2_streaming_nrv_io_in_1_Re = PermutationsWithStreaming_io_out_1_Re; // @[FFTDesigns.scala 6535:27]
  assign FFT_sr_v2_streaming_nrv_io_in_1_Im = PermutationsWithStreaming_io_out_1_Im; // @[FFTDesigns.scala 6535:27]
  assign FFT_sr_v2_streaming_nrv_io_in_2_Re = PermutationsWithStreaming_io_out_2_Re; // @[FFTDesigns.scala 6535:27]
  assign FFT_sr_v2_streaming_nrv_io_in_2_Im = PermutationsWithStreaming_io_out_2_Im; // @[FFTDesigns.scala 6535:27]
  assign FFT_sr_v2_streaming_nrv_io_in_3_Re = PermutationsWithStreaming_io_out_3_Re; // @[FFTDesigns.scala 6535:27]
  assign FFT_sr_v2_streaming_nrv_io_in_3_Im = PermutationsWithStreaming_io_out_3_Im; // @[FFTDesigns.scala 6535:27]
  assign FFT_sr_v2_streaming_nrv_io_in_ready = Perm_regdelays1_0_47; // @[FFTDesigns.scala 6536:33]
  assign DFT_r_v2_clock = clock;
  assign DFT_r_v2_reset = reset;
  assign DFT_r_v2_io_in_0_Re = TwiddleFactorsStreamed_mr_v2_io_out_0_Re; // @[FFTDesigns.scala 6547:37]
  assign DFT_r_v2_io_in_0_Im = TwiddleFactorsStreamed_mr_v2_io_out_0_Im; // @[FFTDesigns.scala 6547:37]
  assign DFT_r_v2_io_in_1_Re = TwiddleFactorsStreamed_mr_v2_io_out_1_Re; // @[FFTDesigns.scala 6547:37]
  assign DFT_r_v2_io_in_1_Im = TwiddleFactorsStreamed_mr_v2_io_out_1_Im; // @[FFTDesigns.scala 6547:37]
  assign DFT_r_v2_io_in_2_Re = TwiddleFactorsStreamed_mr_v2_io_out_2_Re; // @[FFTDesigns.scala 6547:37]
  assign DFT_r_v2_io_in_2_Im = TwiddleFactorsStreamed_mr_v2_io_out_2_Im; // @[FFTDesigns.scala 6547:37]
  assign DFT_r_v2_1_clock = clock;
  assign DFT_r_v2_1_reset = reset;
  assign DFT_r_v2_1_io_in_0_Re = TwiddleFactorsStreamed_mr_v2_io_out_3_Re; // @[FFTDesigns.scala 6547:37]
  assign DFT_r_v2_1_io_in_0_Im = TwiddleFactorsStreamed_mr_v2_io_out_3_Im; // @[FFTDesigns.scala 6547:37]
  assign DFT_r_v2_1_io_in_1_Re = TwiddleFactorsStreamed_mr_v2_io_out_4_Re; // @[FFTDesigns.scala 6547:37]
  assign DFT_r_v2_1_io_in_1_Im = TwiddleFactorsStreamed_mr_v2_io_out_4_Im; // @[FFTDesigns.scala 6547:37]
  assign DFT_r_v2_1_io_in_2_Re = TwiddleFactorsStreamed_mr_v2_io_out_5_Re; // @[FFTDesigns.scala 6547:37]
  assign DFT_r_v2_1_io_in_2_Im = TwiddleFactorsStreamed_mr_v2_io_out_5_Im; // @[FFTDesigns.scala 6547:37]
  assign PermutationsWithStreaming_clock = clock;
  assign PermutationsWithStreaming_reset = reset;
  assign PermutationsWithStreaming_io_in_0_Re = io_in_0_Re; // @[FFTDesigns.scala 6486:31]
  assign PermutationsWithStreaming_io_in_0_Im = io_in_0_Im; // @[FFTDesigns.scala 6486:31]
  assign PermutationsWithStreaming_io_in_1_Re = io_in_1_Re; // @[FFTDesigns.scala 6486:31]
  assign PermutationsWithStreaming_io_in_1_Im = io_in_1_Im; // @[FFTDesigns.scala 6486:31]
  assign PermutationsWithStreaming_io_in_2_Re = io_in_2_Re; // @[FFTDesigns.scala 6486:31]
  assign PermutationsWithStreaming_io_in_2_Im = io_in_2_Im; // @[FFTDesigns.scala 6486:31]
  assign PermutationsWithStreaming_io_in_3_Re = io_in_3_Re; // @[FFTDesigns.scala 6486:31]
  assign PermutationsWithStreaming_io_in_3_Im = io_in_3_Im; // @[FFTDesigns.scala 6486:31]
  assign PermutationsWithStreaming_io_in_en_0 = io_in_ready; // @[FFTDesigns.scala 6485:37]
  assign PermutationsWithStreaming_io_in_en_1 = Perm_regdelays1_0_0; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_2 = Perm_regdelays1_0_1; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_3 = Perm_regdelays1_0_2; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_4 = Perm_regdelays1_0_3; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_5 = Perm_regdelays1_0_4; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_6 = Perm_regdelays1_0_5; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_7 = Perm_regdelays1_0_6; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_8 = Perm_regdelays1_0_7; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_9 = Perm_regdelays1_0_8; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_10 = Perm_regdelays1_0_9; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_11 = Perm_regdelays1_0_10; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_12 = Perm_regdelays1_0_11; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_13 = Perm_regdelays1_0_12; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_14 = Perm_regdelays1_0_13; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_15 = Perm_regdelays1_0_14; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_16 = Perm_regdelays1_0_15; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_17 = Perm_regdelays1_0_16; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_18 = Perm_regdelays1_0_17; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_19 = Perm_regdelays1_0_18; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_20 = Perm_regdelays1_0_19; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_21 = Perm_regdelays1_0_20; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_22 = Perm_regdelays1_0_21; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_23 = Perm_regdelays1_0_22; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_24 = Perm_regdelays1_0_23; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_25 = Perm_regdelays1_0_24; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_26 = Perm_regdelays1_0_25; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_27 = Perm_regdelays1_0_26; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_28 = Perm_regdelays1_0_27; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_29 = Perm_regdelays1_0_28; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_30 = Perm_regdelays1_0_29; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_31 = Perm_regdelays1_0_30; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_32 = Perm_regdelays1_0_31; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_33 = Perm_regdelays1_0_32; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_34 = Perm_regdelays1_0_33; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_35 = Perm_regdelays1_0_34; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_36 = Perm_regdelays1_0_35; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_37 = Perm_regdelays1_0_36; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_38 = Perm_regdelays1_0_37; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_39 = Perm_regdelays1_0_38; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_40 = Perm_regdelays1_0_39; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_41 = Perm_regdelays1_0_40; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_42 = Perm_regdelays1_0_41; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_43 = Perm_regdelays1_0_42; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_44 = Perm_regdelays1_0_43; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_45 = Perm_regdelays1_0_44; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_46 = Perm_regdelays1_0_45; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_47 = Perm_regdelays1_0_46; // @[FFTDesigns.scala 6503:37]
  assign PermutationsWithStreaming_io_in_en_48 = Perm_regdelays1_0_47; // @[FFTDesigns.scala 6511:51]
  assign PermutationsWithStreaming_mr_clock = clock;
  assign PermutationsWithStreaming_mr_reset = reset;
  assign PermutationsWithStreaming_mr_io_in_0_Re = FFT_sr_v2_streaming_nrv_io_out_0_Re; // @[FFTDesigns.scala 6490:31]
  assign PermutationsWithStreaming_mr_io_in_0_Im = FFT_sr_v2_streaming_nrv_io_out_0_Im; // @[FFTDesigns.scala 6490:31]
  assign PermutationsWithStreaming_mr_io_in_1_Re = FFT_sr_v2_streaming_nrv_io_out_1_Re; // @[FFTDesigns.scala 6490:31]
  assign PermutationsWithStreaming_mr_io_in_1_Im = FFT_sr_v2_streaming_nrv_io_out_1_Im; // @[FFTDesigns.scala 6490:31]
  assign PermutationsWithStreaming_mr_io_in_2_Re = FFT_sr_v2_streaming_nrv_io_out_2_Re; // @[FFTDesigns.scala 6490:31]
  assign PermutationsWithStreaming_mr_io_in_2_Im = FFT_sr_v2_streaming_nrv_io_out_2_Im; // @[FFTDesigns.scala 6490:31]
  assign PermutationsWithStreaming_mr_io_in_3_Re = FFT_sr_v2_streaming_nrv_io_out_3_Re; // @[FFTDesigns.scala 6490:31]
  assign PermutationsWithStreaming_mr_io_in_3_Im = FFT_sr_v2_streaming_nrv_io_out_3_Im; // @[FFTDesigns.scala 6490:31]
  assign PermutationsWithStreaming_mr_io_in_en_0 = DFT_regdelays1_108; // @[FFTDesigns.scala 6489:37]
  assign PermutationsWithStreaming_mr_io_in_en_1 = Perm_regdelays1_1_0; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_2 = Perm_regdelays1_1_1; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_3 = Perm_regdelays1_1_2; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_4 = Perm_regdelays1_1_3; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_5 = Perm_regdelays1_1_4; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_6 = Perm_regdelays1_1_5; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_7 = Perm_regdelays1_1_6; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_8 = Perm_regdelays1_1_7; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_9 = Perm_regdelays1_1_8; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_10 = Perm_regdelays1_1_9; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_11 = Perm_regdelays1_1_10; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_12 = Perm_regdelays1_1_11; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_13 = Perm_regdelays1_1_12; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_14 = Perm_regdelays1_1_13; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_15 = Perm_regdelays1_1_14; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_16 = Perm_regdelays1_1_15; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_17 = Perm_regdelays1_1_16; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_18 = Perm_regdelays1_1_17; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_19 = Perm_regdelays1_1_18; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_20 = Perm_regdelays1_1_19; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_21 = Perm_regdelays1_1_20; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_22 = Perm_regdelays1_1_21; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_23 = Perm_regdelays1_1_22; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_24 = Perm_regdelays1_1_23; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_25 = Perm_regdelays1_1_24; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_26 = Perm_regdelays1_1_25; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_27 = Perm_regdelays1_1_26; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_28 = Perm_regdelays1_1_27; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_29 = Perm_regdelays1_1_28; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_30 = Perm_regdelays1_1_29; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_31 = Perm_regdelays1_1_30; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_32 = Perm_regdelays1_1_31; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_33 = Perm_regdelays1_1_32; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_34 = Perm_regdelays1_1_33; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_35 = Perm_regdelays1_1_34; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_36 = Perm_regdelays1_1_35; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_37 = Perm_regdelays1_1_36; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_38 = Perm_regdelays1_1_37; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_39 = Perm_regdelays1_1_38; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_40 = Perm_regdelays1_1_39; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_41 = Perm_regdelays1_1_40; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_42 = Perm_regdelays1_1_41; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_43 = Perm_regdelays1_1_42; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_44 = Perm_regdelays1_1_43; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_45 = Perm_regdelays1_1_44; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_46 = Perm_regdelays1_1_45; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_47 = Perm_regdelays1_1_46; // @[FFTDesigns.scala 6505:37]
  assign PermutationsWithStreaming_mr_io_in_en_48 = Perm_regdelays1_1_47; // @[FFTDesigns.scala 6513:51]
  assign PermutationsWithStreaming_mr_1_clock = clock;
  assign PermutationsWithStreaming_mr_1_reset = reset;
  assign PermutationsWithStreaming_mr_1_io_in_0_Re = DFT_r_v2_io_out_0_Re; // @[FFTDesigns.scala 6496:45]
  assign PermutationsWithStreaming_mr_1_io_in_0_Im = DFT_r_v2_io_out_0_Im; // @[FFTDesigns.scala 6496:45]
  assign PermutationsWithStreaming_mr_1_io_in_1_Re = DFT_r_v2_io_out_1_Re; // @[FFTDesigns.scala 6496:45]
  assign PermutationsWithStreaming_mr_1_io_in_1_Im = DFT_r_v2_io_out_1_Im; // @[FFTDesigns.scala 6496:45]
  assign PermutationsWithStreaming_mr_1_io_in_2_Re = DFT_r_v2_io_out_2_Re; // @[FFTDesigns.scala 6496:45]
  assign PermutationsWithStreaming_mr_1_io_in_2_Im = DFT_r_v2_io_out_2_Im; // @[FFTDesigns.scala 6496:45]
  assign PermutationsWithStreaming_mr_1_io_in_3_Re = DFT_r_v2_1_io_out_0_Re; // @[FFTDesigns.scala 6496:45]
  assign PermutationsWithStreaming_mr_1_io_in_3_Im = DFT_r_v2_1_io_out_0_Im; // @[FFTDesigns.scala 6496:45]
  assign PermutationsWithStreaming_mr_1_io_in_4_Re = DFT_r_v2_1_io_out_1_Re; // @[FFTDesigns.scala 6496:45]
  assign PermutationsWithStreaming_mr_1_io_in_4_Im = DFT_r_v2_1_io_out_1_Im; // @[FFTDesigns.scala 6496:45]
  assign PermutationsWithStreaming_mr_1_io_in_5_Re = DFT_r_v2_1_io_out_2_Re; // @[FFTDesigns.scala 6496:45]
  assign PermutationsWithStreaming_mr_1_io_in_5_Im = DFT_r_v2_1_io_out_2_Im; // @[FFTDesigns.scala 6496:45]
  assign PermutationsWithStreaming_mr_1_io_in_en_0 = DFT_regdelays2_3; // @[FFTDesigns.scala 6493:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_1 = Perm_regdelays1_2_0; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_2 = Perm_regdelays1_2_1; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_3 = Perm_regdelays1_2_2; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_4 = Perm_regdelays1_2_3; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_5 = Perm_regdelays1_2_4; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_6 = Perm_regdelays1_2_5; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_7 = Perm_regdelays1_2_6; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_8 = Perm_regdelays1_2_7; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_9 = Perm_regdelays1_2_8; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_10 = Perm_regdelays1_2_9; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_11 = Perm_regdelays1_2_10; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_12 = Perm_regdelays1_2_11; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_13 = Perm_regdelays1_2_12; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_14 = Perm_regdelays1_2_13; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_15 = Perm_regdelays1_2_14; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_16 = Perm_regdelays1_2_15; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_17 = Perm_regdelays1_2_16; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_18 = Perm_regdelays1_2_17; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_19 = Perm_regdelays1_2_18; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_20 = Perm_regdelays1_2_19; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_21 = Perm_regdelays1_2_20; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_22 = Perm_regdelays1_2_21; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_23 = Perm_regdelays1_2_22; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_24 = Perm_regdelays1_2_23; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_25 = Perm_regdelays1_2_24; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_26 = Perm_regdelays1_2_25; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_27 = Perm_regdelays1_2_26; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_28 = Perm_regdelays1_2_27; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_29 = Perm_regdelays1_2_28; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_30 = Perm_regdelays1_2_29; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_31 = Perm_regdelays1_2_30; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_32 = Perm_regdelays1_2_31; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_33 = Perm_regdelays1_2_32; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_34 = Perm_regdelays1_2_33; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_35 = Perm_regdelays1_2_34; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_36 = Perm_regdelays1_2_35; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_37 = Perm_regdelays1_2_36; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_38 = Perm_regdelays1_2_37; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_39 = Perm_regdelays1_2_38; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_40 = Perm_regdelays1_2_39; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_41 = Perm_regdelays1_2_40; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_42 = Perm_regdelays1_2_41; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_43 = Perm_regdelays1_2_42; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_44 = Perm_regdelays1_2_43; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_45 = Perm_regdelays1_2_44; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_46 = Perm_regdelays1_2_45; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_47 = Perm_regdelays1_2_46; // @[FFTDesigns.scala 6507:37]
  assign PermutationsWithStreaming_mr_1_io_in_en_48 = Perm_regdelays1_2_47; // @[FFTDesigns.scala 6515:51]
  assign TwiddleFactorsStreamed_mr_v2_clock = clock;
  assign TwiddleFactorsStreamed_mr_v2_reset = reset;
  assign TwiddleFactorsStreamed_mr_v2_io_in_0_Re = PermutationsWithStreaming_mr_io_out_0_Re; // @[FFTDesigns.scala 6525:27]
  assign TwiddleFactorsStreamed_mr_v2_io_in_0_Im = PermutationsWithStreaming_mr_io_out_0_Im; // @[FFTDesigns.scala 6525:27]
  assign TwiddleFactorsStreamed_mr_v2_io_in_1_Re = PermutationsWithStreaming_mr_io_out_1_Re; // @[FFTDesigns.scala 6525:27]
  assign TwiddleFactorsStreamed_mr_v2_io_in_1_Im = PermutationsWithStreaming_mr_io_out_1_Im; // @[FFTDesigns.scala 6525:27]
  assign TwiddleFactorsStreamed_mr_v2_io_in_2_Re = PermutationsWithStreaming_mr_io_out_2_Re; // @[FFTDesigns.scala 6525:27]
  assign TwiddleFactorsStreamed_mr_v2_io_in_2_Im = PermutationsWithStreaming_mr_io_out_2_Im; // @[FFTDesigns.scala 6525:27]
  assign TwiddleFactorsStreamed_mr_v2_io_in_3_Re = PermutationsWithStreaming_mr_io_out_3_Re; // @[FFTDesigns.scala 6525:27]
  assign TwiddleFactorsStreamed_mr_v2_io_in_3_Im = PermutationsWithStreaming_mr_io_out_3_Im; // @[FFTDesigns.scala 6525:27]
  assign TwiddleFactorsStreamed_mr_v2_io_in_4_Re = PermutationsWithStreaming_mr_io_out_4_Re; // @[FFTDesigns.scala 6525:27]
  assign TwiddleFactorsStreamed_mr_v2_io_in_4_Im = PermutationsWithStreaming_mr_io_out_4_Im; // @[FFTDesigns.scala 6525:27]
  assign TwiddleFactorsStreamed_mr_v2_io_in_5_Re = PermutationsWithStreaming_mr_io_out_5_Re; // @[FFTDesigns.scala 6525:27]
  assign TwiddleFactorsStreamed_mr_v2_io_in_5_Im = PermutationsWithStreaming_mr_io_out_5_Im; // @[FFTDesigns.scala 6525:27]
  assign TwiddleFactorsStreamed_mr_v2_io_in_en_0 = Perm_regdelays1_1_47; // @[FFTDesigns.scala 6524:33]
  assign TwiddleFactorsStreamed_mr_v2_io_in_en_1 = Twid_regdelays_0; // @[FFTDesigns.scala 6528:33]
  always @(posedge clock) begin
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_0 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_0 <= Perm_regdelays1_0_47; // @[FFTDesigns.scala 6534:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_1 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_1 <= DFT_regdelays1_0; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_2 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_2 <= DFT_regdelays1_1; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_3 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_3 <= DFT_regdelays1_2; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_4 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_4 <= DFT_regdelays1_3; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_5 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_5 <= DFT_regdelays1_4; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_6 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_6 <= DFT_regdelays1_5; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_7 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_7 <= DFT_regdelays1_6; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_8 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_8 <= DFT_regdelays1_7; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_9 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_9 <= DFT_regdelays1_8; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_10 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_10 <= DFT_regdelays1_9; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_11 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_11 <= DFT_regdelays1_10; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_12 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_12 <= DFT_regdelays1_11; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_13 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_13 <= DFT_regdelays1_12; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_14 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_14 <= DFT_regdelays1_13; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_15 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_15 <= DFT_regdelays1_14; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_16 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_16 <= DFT_regdelays1_15; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_17 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_17 <= DFT_regdelays1_16; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_18 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_18 <= DFT_regdelays1_17; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_19 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_19 <= DFT_regdelays1_18; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_20 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_20 <= DFT_regdelays1_19; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_21 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_21 <= DFT_regdelays1_20; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_22 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_22 <= DFT_regdelays1_21; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_23 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_23 <= DFT_regdelays1_22; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_24 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_24 <= DFT_regdelays1_23; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_25 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_25 <= DFT_regdelays1_24; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_26 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_26 <= DFT_regdelays1_25; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_27 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_27 <= DFT_regdelays1_26; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_28 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_28 <= DFT_regdelays1_27; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_29 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_29 <= DFT_regdelays1_28; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_30 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_30 <= DFT_regdelays1_29; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_31 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_31 <= DFT_regdelays1_30; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_32 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_32 <= DFT_regdelays1_31; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_33 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_33 <= DFT_regdelays1_32; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_34 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_34 <= DFT_regdelays1_33; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_35 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_35 <= DFT_regdelays1_34; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_36 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_36 <= DFT_regdelays1_35; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_37 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_37 <= DFT_regdelays1_36; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_38 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_38 <= DFT_regdelays1_37; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_39 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_39 <= DFT_regdelays1_38; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_40 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_40 <= DFT_regdelays1_39; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_41 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_41 <= DFT_regdelays1_40; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_42 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_42 <= DFT_regdelays1_41; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_43 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_43 <= DFT_regdelays1_42; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_44 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_44 <= DFT_regdelays1_43; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_45 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_45 <= DFT_regdelays1_44; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_46 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_46 <= DFT_regdelays1_45; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_47 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_47 <= DFT_regdelays1_46; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_48 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_48 <= DFT_regdelays1_47; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_49 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_49 <= DFT_regdelays1_48; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_50 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_50 <= DFT_regdelays1_49; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_51 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_51 <= DFT_regdelays1_50; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_52 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_52 <= DFT_regdelays1_51; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_53 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_53 <= DFT_regdelays1_52; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_54 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_54 <= DFT_regdelays1_53; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_55 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_55 <= DFT_regdelays1_54; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_56 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_56 <= DFT_regdelays1_55; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_57 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_57 <= DFT_regdelays1_56; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_58 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_58 <= DFT_regdelays1_57; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_59 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_59 <= DFT_regdelays1_58; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_60 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_60 <= DFT_regdelays1_59; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_61 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_61 <= DFT_regdelays1_60; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_62 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_62 <= DFT_regdelays1_61; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_63 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_63 <= DFT_regdelays1_62; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_64 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_64 <= DFT_regdelays1_63; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_65 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_65 <= DFT_regdelays1_64; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_66 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_66 <= DFT_regdelays1_65; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_67 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_67 <= DFT_regdelays1_66; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_68 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_68 <= DFT_regdelays1_67; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_69 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_69 <= DFT_regdelays1_68; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_70 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_70 <= DFT_regdelays1_69; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_71 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_71 <= DFT_regdelays1_70; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_72 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_72 <= DFT_regdelays1_71; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_73 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_73 <= DFT_regdelays1_72; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_74 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_74 <= DFT_regdelays1_73; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_75 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_75 <= DFT_regdelays1_74; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_76 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_76 <= DFT_regdelays1_75; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_77 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_77 <= DFT_regdelays1_76; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_78 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_78 <= DFT_regdelays1_77; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_79 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_79 <= DFT_regdelays1_78; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_80 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_80 <= DFT_regdelays1_79; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_81 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_81 <= DFT_regdelays1_80; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_82 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_82 <= DFT_regdelays1_81; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_83 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_83 <= DFT_regdelays1_82; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_84 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_84 <= DFT_regdelays1_83; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_85 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_85 <= DFT_regdelays1_84; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_86 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_86 <= DFT_regdelays1_85; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_87 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_87 <= DFT_regdelays1_86; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_88 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_88 <= DFT_regdelays1_87; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_89 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_89 <= DFT_regdelays1_88; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_90 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_90 <= DFT_regdelays1_89; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_91 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_91 <= DFT_regdelays1_90; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_92 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_92 <= DFT_regdelays1_91; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_93 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_93 <= DFT_regdelays1_92; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_94 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_94 <= DFT_regdelays1_93; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_95 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_95 <= DFT_regdelays1_94; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_96 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_96 <= DFT_regdelays1_95; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_97 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_97 <= DFT_regdelays1_96; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_98 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_98 <= DFT_regdelays1_97; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_99 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_99 <= DFT_regdelays1_98; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_100 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_100 <= DFT_regdelays1_99; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_101 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_101 <= DFT_regdelays1_100; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_102 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_102 <= DFT_regdelays1_101; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_103 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_103 <= DFT_regdelays1_102; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_104 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_104 <= DFT_regdelays1_103; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_105 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_105 <= DFT_regdelays1_104; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_106 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_106 <= DFT_regdelays1_105; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_107 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_107 <= DFT_regdelays1_106; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6474:35]
      DFT_regdelays1_108 <= 1'h0; // @[FFTDesigns.scala 6474:35]
    end else begin
      DFT_regdelays1_108 <= DFT_regdelays1_107; // @[FFTDesigns.scala 6538:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6475:35]
      DFT_regdelays2_0 <= 1'h0; // @[FFTDesigns.scala 6475:35]
    end else begin
      DFT_regdelays2_0 <= Twid_regdelays_1; // @[FFTDesigns.scala 6544:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6475:35]
      DFT_regdelays2_1 <= 1'h0; // @[FFTDesigns.scala 6475:35]
    end else begin
      DFT_regdelays2_1 <= DFT_regdelays2_0; // @[FFTDesigns.scala 6551:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6475:35]
      DFT_regdelays2_2 <= 1'h0; // @[FFTDesigns.scala 6475:35]
    end else begin
      DFT_regdelays2_2 <= DFT_regdelays2_1; // @[FFTDesigns.scala 6551:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6475:35]
      DFT_regdelays2_3 <= 1'h0; // @[FFTDesigns.scala 6475:35]
    end else begin
      DFT_regdelays2_3 <= DFT_regdelays2_2; // @[FFTDesigns.scala 6551:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6476:35]
      Twid_regdelays_0 <= 1'h0; // @[FFTDesigns.scala 6476:35]
    end else begin
      Twid_regdelays_0 <= Perm_regdelays1_1_47; // @[FFTDesigns.scala 6523:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6476:35]
      Twid_regdelays_1 <= 1'h0; // @[FFTDesigns.scala 6476:35]
    end else begin
      Twid_regdelays_1 <= Twid_regdelays_0; // @[FFTDesigns.scala 6527:29]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_0 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_0 <= io_in_ready; // @[FFTDesigns.scala 6484:37]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_1 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_1 <= Perm_regdelays1_0_0; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_2 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_2 <= Perm_regdelays1_0_1; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_3 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_3 <= Perm_regdelays1_0_2; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_4 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_4 <= Perm_regdelays1_0_3; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_5 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_5 <= Perm_regdelays1_0_4; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_6 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_6 <= Perm_regdelays1_0_5; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_7 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_7 <= Perm_regdelays1_0_6; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_8 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_8 <= Perm_regdelays1_0_7; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_9 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_9 <= Perm_regdelays1_0_8; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_10 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_10 <= Perm_regdelays1_0_9; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_11 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_11 <= Perm_regdelays1_0_10; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_12 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_12 <= Perm_regdelays1_0_11; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_13 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_13 <= Perm_regdelays1_0_12; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_14 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_14 <= Perm_regdelays1_0_13; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_15 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_15 <= Perm_regdelays1_0_14; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_16 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_16 <= Perm_regdelays1_0_15; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_17 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_17 <= Perm_regdelays1_0_16; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_18 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_18 <= Perm_regdelays1_0_17; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_19 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_19 <= Perm_regdelays1_0_18; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_20 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_20 <= Perm_regdelays1_0_19; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_21 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_21 <= Perm_regdelays1_0_20; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_22 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_22 <= Perm_regdelays1_0_21; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_23 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_23 <= Perm_regdelays1_0_22; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_24 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_24 <= Perm_regdelays1_0_23; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_25 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_25 <= Perm_regdelays1_0_24; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_26 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_26 <= Perm_regdelays1_0_25; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_27 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_27 <= Perm_regdelays1_0_26; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_28 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_28 <= Perm_regdelays1_0_27; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_29 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_29 <= Perm_regdelays1_0_28; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_30 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_30 <= Perm_regdelays1_0_29; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_31 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_31 <= Perm_regdelays1_0_30; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_32 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_32 <= Perm_regdelays1_0_31; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_33 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_33 <= Perm_regdelays1_0_32; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_34 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_34 <= Perm_regdelays1_0_33; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_35 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_35 <= Perm_regdelays1_0_34; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_36 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_36 <= Perm_regdelays1_0_35; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_37 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_37 <= Perm_regdelays1_0_36; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_38 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_38 <= Perm_regdelays1_0_37; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_39 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_39 <= Perm_regdelays1_0_38; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_40 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_40 <= Perm_regdelays1_0_39; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_41 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_41 <= Perm_regdelays1_0_40; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_42 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_42 <= Perm_regdelays1_0_41; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_43 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_43 <= Perm_regdelays1_0_42; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_44 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_44 <= Perm_regdelays1_0_43; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_45 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_45 <= Perm_regdelays1_0_44; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_46 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_46 <= Perm_regdelays1_0_45; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_0_47 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_0_47 <= Perm_regdelays1_0_46; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_0 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_0 <= DFT_regdelays1_108; // @[FFTDesigns.scala 6488:37]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_1 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_1 <= Perm_regdelays1_1_0; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_2 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_2 <= Perm_regdelays1_1_1; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_3 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_3 <= Perm_regdelays1_1_2; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_4 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_4 <= Perm_regdelays1_1_3; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_5 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_5 <= Perm_regdelays1_1_4; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_6 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_6 <= Perm_regdelays1_1_5; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_7 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_7 <= Perm_regdelays1_1_6; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_8 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_8 <= Perm_regdelays1_1_7; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_9 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_9 <= Perm_regdelays1_1_8; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_10 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_10 <= Perm_regdelays1_1_9; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_11 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_11 <= Perm_regdelays1_1_10; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_12 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_12 <= Perm_regdelays1_1_11; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_13 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_13 <= Perm_regdelays1_1_12; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_14 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_14 <= Perm_regdelays1_1_13; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_15 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_15 <= Perm_regdelays1_1_14; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_16 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_16 <= Perm_regdelays1_1_15; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_17 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_17 <= Perm_regdelays1_1_16; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_18 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_18 <= Perm_regdelays1_1_17; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_19 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_19 <= Perm_regdelays1_1_18; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_20 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_20 <= Perm_regdelays1_1_19; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_21 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_21 <= Perm_regdelays1_1_20; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_22 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_22 <= Perm_regdelays1_1_21; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_23 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_23 <= Perm_regdelays1_1_22; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_24 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_24 <= Perm_regdelays1_1_23; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_25 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_25 <= Perm_regdelays1_1_24; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_26 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_26 <= Perm_regdelays1_1_25; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_27 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_27 <= Perm_regdelays1_1_26; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_28 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_28 <= Perm_regdelays1_1_27; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_29 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_29 <= Perm_regdelays1_1_28; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_30 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_30 <= Perm_regdelays1_1_29; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_31 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_31 <= Perm_regdelays1_1_30; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_32 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_32 <= Perm_regdelays1_1_31; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_33 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_33 <= Perm_regdelays1_1_32; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_34 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_34 <= Perm_regdelays1_1_33; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_35 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_35 <= Perm_regdelays1_1_34; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_36 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_36 <= Perm_regdelays1_1_35; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_37 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_37 <= Perm_regdelays1_1_36; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_38 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_38 <= Perm_regdelays1_1_37; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_39 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_39 <= Perm_regdelays1_1_38; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_40 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_40 <= Perm_regdelays1_1_39; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_41 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_41 <= Perm_regdelays1_1_40; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_42 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_42 <= Perm_regdelays1_1_41; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_43 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_43 <= Perm_regdelays1_1_42; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_44 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_44 <= Perm_regdelays1_1_43; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_45 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_45 <= Perm_regdelays1_1_44; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_46 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_46 <= Perm_regdelays1_1_45; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_1_47 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_1_47 <= Perm_regdelays1_1_46; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_0 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_0 <= DFT_regdelays2_3; // @[FFTDesigns.scala 6492:37]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_1 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_1 <= Perm_regdelays1_2_0; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_2 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_2 <= Perm_regdelays1_2_1; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_3 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_3 <= Perm_regdelays1_2_2; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_4 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_4 <= Perm_regdelays1_2_3; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_5 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_5 <= Perm_regdelays1_2_4; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_6 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_6 <= Perm_regdelays1_2_5; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_7 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_7 <= Perm_regdelays1_2_6; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_8 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_8 <= Perm_regdelays1_2_7; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_9 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_9 <= Perm_regdelays1_2_8; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_10 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_10 <= Perm_regdelays1_2_9; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_11 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_11 <= Perm_regdelays1_2_10; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_12 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_12 <= Perm_regdelays1_2_11; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_13 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_13 <= Perm_regdelays1_2_12; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_14 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_14 <= Perm_regdelays1_2_13; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_15 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_15 <= Perm_regdelays1_2_14; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_16 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_16 <= Perm_regdelays1_2_15; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_17 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_17 <= Perm_regdelays1_2_16; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_18 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_18 <= Perm_regdelays1_2_17; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_19 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_19 <= Perm_regdelays1_2_18; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_20 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_20 <= Perm_regdelays1_2_19; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_21 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_21 <= Perm_regdelays1_2_20; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_22 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_22 <= Perm_regdelays1_2_21; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_23 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_23 <= Perm_regdelays1_2_22; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_24 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_24 <= Perm_regdelays1_2_23; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_25 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_25 <= Perm_regdelays1_2_24; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_26 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_26 <= Perm_regdelays1_2_25; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_27 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_27 <= Perm_regdelays1_2_26; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_28 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_28 <= Perm_regdelays1_2_27; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_29 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_29 <= Perm_regdelays1_2_28; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_30 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_30 <= Perm_regdelays1_2_29; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_31 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_31 <= Perm_regdelays1_2_30; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_32 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_32 <= Perm_regdelays1_2_31; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_33 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_33 <= Perm_regdelays1_2_32; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_34 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_34 <= Perm_regdelays1_2_33; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_35 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_35 <= Perm_regdelays1_2_34; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_36 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_36 <= Perm_regdelays1_2_35; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_37 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_37 <= Perm_regdelays1_2_36; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_38 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_38 <= Perm_regdelays1_2_37; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_39 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_39 <= Perm_regdelays1_2_38; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_40 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_40 <= Perm_regdelays1_2_39; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_41 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_41 <= Perm_regdelays1_2_40; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_42 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_42 <= Perm_regdelays1_2_41; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_43 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_43 <= Perm_regdelays1_2_42; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_44 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_44 <= Perm_regdelays1_2_43; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_45 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_45 <= Perm_regdelays1_2_44; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_46 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_46 <= Perm_regdelays1_2_45; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6477:36]
      Perm_regdelays1_2_47 <= 1'h0; // @[FFTDesigns.scala 6477:36]
    end else begin
      Perm_regdelays1_2_47 <= Perm_regdelays1_2_46; // @[FFTDesigns.scala 6501:35]
    end
    if (reset) begin // @[FFTDesigns.scala 6478:33]
      out_regdelay <= 1'h0; // @[FFTDesigns.scala 6478:33]
    end else begin
      out_regdelay <= Perm_regdelays1_2_47; // @[FFTDesigns.scala 6554:20]
    end
    if (reset) begin // @[FFTDesigns.scala 6479:28]
      results_0_Re <= 32'h0; // @[FFTDesigns.scala 6479:28]
    end else if (Perm_regdelays1_2_47) begin // @[FFTDesigns.scala 6555:49]
      results_0_Re <= PermutationsWithStreaming_mr_1_io_out_0_Re; // @[FFTDesigns.scala 6556:17]
    end else begin
      results_0_Re <= 32'h0; // @[FFTDesigns.scala 6558:17]
    end
    if (reset) begin // @[FFTDesigns.scala 6479:28]
      results_0_Im <= 32'h0; // @[FFTDesigns.scala 6479:28]
    end else if (Perm_regdelays1_2_47) begin // @[FFTDesigns.scala 6555:49]
      results_0_Im <= PermutationsWithStreaming_mr_1_io_out_0_Im; // @[FFTDesigns.scala 6556:17]
    end else begin
      results_0_Im <= 32'h0; // @[FFTDesigns.scala 6558:17]
    end
    if (reset) begin // @[FFTDesigns.scala 6479:28]
      results_1_Re <= 32'h0; // @[FFTDesigns.scala 6479:28]
    end else if (Perm_regdelays1_2_47) begin // @[FFTDesigns.scala 6555:49]
      results_1_Re <= PermutationsWithStreaming_mr_1_io_out_1_Re; // @[FFTDesigns.scala 6556:17]
    end else begin
      results_1_Re <= 32'h0; // @[FFTDesigns.scala 6558:17]
    end
    if (reset) begin // @[FFTDesigns.scala 6479:28]
      results_1_Im <= 32'h0; // @[FFTDesigns.scala 6479:28]
    end else if (Perm_regdelays1_2_47) begin // @[FFTDesigns.scala 6555:49]
      results_1_Im <= PermutationsWithStreaming_mr_1_io_out_1_Im; // @[FFTDesigns.scala 6556:17]
    end else begin
      results_1_Im <= 32'h0; // @[FFTDesigns.scala 6558:17]
    end
    if (reset) begin // @[FFTDesigns.scala 6479:28]
      results_2_Re <= 32'h0; // @[FFTDesigns.scala 6479:28]
    end else if (Perm_regdelays1_2_47) begin // @[FFTDesigns.scala 6555:49]
      results_2_Re <= PermutationsWithStreaming_mr_1_io_out_2_Re; // @[FFTDesigns.scala 6556:17]
    end else begin
      results_2_Re <= 32'h0; // @[FFTDesigns.scala 6558:17]
    end
    if (reset) begin // @[FFTDesigns.scala 6479:28]
      results_2_Im <= 32'h0; // @[FFTDesigns.scala 6479:28]
    end else if (Perm_regdelays1_2_47) begin // @[FFTDesigns.scala 6555:49]
      results_2_Im <= PermutationsWithStreaming_mr_1_io_out_2_Im; // @[FFTDesigns.scala 6556:17]
    end else begin
      results_2_Im <= 32'h0; // @[FFTDesigns.scala 6558:17]
    end
    if (reset) begin // @[FFTDesigns.scala 6479:28]
      results_3_Re <= 32'h0; // @[FFTDesigns.scala 6479:28]
    end else if (Perm_regdelays1_2_47) begin // @[FFTDesigns.scala 6555:49]
      results_3_Re <= PermutationsWithStreaming_mr_1_io_out_3_Re; // @[FFTDesigns.scala 6556:17]
    end else begin
      results_3_Re <= 32'h0; // @[FFTDesigns.scala 6558:17]
    end
    if (reset) begin // @[FFTDesigns.scala 6479:28]
      results_3_Im <= 32'h0; // @[FFTDesigns.scala 6479:28]
    end else if (Perm_regdelays1_2_47) begin // @[FFTDesigns.scala 6555:49]
      results_3_Im <= PermutationsWithStreaming_mr_1_io_out_3_Im; // @[FFTDesigns.scala 6556:17]
    end else begin
      results_3_Im <= 32'h0; // @[FFTDesigns.scala 6558:17]
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
  DFT_regdelays1_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  DFT_regdelays1_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  DFT_regdelays1_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  DFT_regdelays1_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  DFT_regdelays1_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  DFT_regdelays1_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  DFT_regdelays1_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  DFT_regdelays1_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  DFT_regdelays1_8 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  DFT_regdelays1_9 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  DFT_regdelays1_10 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  DFT_regdelays1_11 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  DFT_regdelays1_12 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  DFT_regdelays1_13 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  DFT_regdelays1_14 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  DFT_regdelays1_15 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  DFT_regdelays1_16 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  DFT_regdelays1_17 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  DFT_regdelays1_18 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  DFT_regdelays1_19 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  DFT_regdelays1_20 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  DFT_regdelays1_21 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  DFT_regdelays1_22 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  DFT_regdelays1_23 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  DFT_regdelays1_24 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  DFT_regdelays1_25 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  DFT_regdelays1_26 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  DFT_regdelays1_27 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  DFT_regdelays1_28 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  DFT_regdelays1_29 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  DFT_regdelays1_30 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  DFT_regdelays1_31 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  DFT_regdelays1_32 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  DFT_regdelays1_33 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  DFT_regdelays1_34 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  DFT_regdelays1_35 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  DFT_regdelays1_36 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  DFT_regdelays1_37 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  DFT_regdelays1_38 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  DFT_regdelays1_39 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  DFT_regdelays1_40 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  DFT_regdelays1_41 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  DFT_regdelays1_42 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  DFT_regdelays1_43 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  DFT_regdelays1_44 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  DFT_regdelays1_45 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  DFT_regdelays1_46 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  DFT_regdelays1_47 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  DFT_regdelays1_48 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  DFT_regdelays1_49 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  DFT_regdelays1_50 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  DFT_regdelays1_51 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  DFT_regdelays1_52 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  DFT_regdelays1_53 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  DFT_regdelays1_54 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  DFT_regdelays1_55 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  DFT_regdelays1_56 = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  DFT_regdelays1_57 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  DFT_regdelays1_58 = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  DFT_regdelays1_59 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  DFT_regdelays1_60 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  DFT_regdelays1_61 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  DFT_regdelays1_62 = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  DFT_regdelays1_63 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  DFT_regdelays1_64 = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  DFT_regdelays1_65 = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  DFT_regdelays1_66 = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  DFT_regdelays1_67 = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  DFT_regdelays1_68 = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  DFT_regdelays1_69 = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  DFT_regdelays1_70 = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  DFT_regdelays1_71 = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  DFT_regdelays1_72 = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  DFT_regdelays1_73 = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  DFT_regdelays1_74 = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  DFT_regdelays1_75 = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  DFT_regdelays1_76 = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  DFT_regdelays1_77 = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  DFT_regdelays1_78 = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  DFT_regdelays1_79 = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  DFT_regdelays1_80 = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  DFT_regdelays1_81 = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  DFT_regdelays1_82 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  DFT_regdelays1_83 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  DFT_regdelays1_84 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  DFT_regdelays1_85 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  DFT_regdelays1_86 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  DFT_regdelays1_87 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  DFT_regdelays1_88 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  DFT_regdelays1_89 = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  DFT_regdelays1_90 = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  DFT_regdelays1_91 = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  DFT_regdelays1_92 = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  DFT_regdelays1_93 = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  DFT_regdelays1_94 = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  DFT_regdelays1_95 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  DFT_regdelays1_96 = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  DFT_regdelays1_97 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  DFT_regdelays1_98 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  DFT_regdelays1_99 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  DFT_regdelays1_100 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  DFT_regdelays1_101 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  DFT_regdelays1_102 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  DFT_regdelays1_103 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  DFT_regdelays1_104 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  DFT_regdelays1_105 = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  DFT_regdelays1_106 = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  DFT_regdelays1_107 = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  DFT_regdelays1_108 = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  DFT_regdelays2_0 = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  DFT_regdelays2_1 = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  DFT_regdelays2_2 = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  DFT_regdelays2_3 = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  Twid_regdelays_0 = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  Twid_regdelays_1 = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  Perm_regdelays1_0_0 = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  Perm_regdelays1_0_1 = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  Perm_regdelays1_0_2 = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  Perm_regdelays1_0_3 = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  Perm_regdelays1_0_4 = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  Perm_regdelays1_0_5 = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  Perm_regdelays1_0_6 = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  Perm_regdelays1_0_7 = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  Perm_regdelays1_0_8 = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  Perm_regdelays1_0_9 = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  Perm_regdelays1_0_10 = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  Perm_regdelays1_0_11 = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  Perm_regdelays1_0_12 = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  Perm_regdelays1_0_13 = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  Perm_regdelays1_0_14 = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  Perm_regdelays1_0_15 = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  Perm_regdelays1_0_16 = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  Perm_regdelays1_0_17 = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  Perm_regdelays1_0_18 = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  Perm_regdelays1_0_19 = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  Perm_regdelays1_0_20 = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  Perm_regdelays1_0_21 = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  Perm_regdelays1_0_22 = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  Perm_regdelays1_0_23 = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  Perm_regdelays1_0_24 = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  Perm_regdelays1_0_25 = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  Perm_regdelays1_0_26 = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  Perm_regdelays1_0_27 = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  Perm_regdelays1_0_28 = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  Perm_regdelays1_0_29 = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  Perm_regdelays1_0_30 = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  Perm_regdelays1_0_31 = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  Perm_regdelays1_0_32 = _RAND_147[0:0];
  _RAND_148 = {1{`RANDOM}};
  Perm_regdelays1_0_33 = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  Perm_regdelays1_0_34 = _RAND_149[0:0];
  _RAND_150 = {1{`RANDOM}};
  Perm_regdelays1_0_35 = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  Perm_regdelays1_0_36 = _RAND_151[0:0];
  _RAND_152 = {1{`RANDOM}};
  Perm_regdelays1_0_37 = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  Perm_regdelays1_0_38 = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  Perm_regdelays1_0_39 = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  Perm_regdelays1_0_40 = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  Perm_regdelays1_0_41 = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  Perm_regdelays1_0_42 = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  Perm_regdelays1_0_43 = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  Perm_regdelays1_0_44 = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  Perm_regdelays1_0_45 = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  Perm_regdelays1_0_46 = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  Perm_regdelays1_0_47 = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  Perm_regdelays1_1_0 = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  Perm_regdelays1_1_1 = _RAND_164[0:0];
  _RAND_165 = {1{`RANDOM}};
  Perm_regdelays1_1_2 = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  Perm_regdelays1_1_3 = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  Perm_regdelays1_1_4 = _RAND_167[0:0];
  _RAND_168 = {1{`RANDOM}};
  Perm_regdelays1_1_5 = _RAND_168[0:0];
  _RAND_169 = {1{`RANDOM}};
  Perm_regdelays1_1_6 = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  Perm_regdelays1_1_7 = _RAND_170[0:0];
  _RAND_171 = {1{`RANDOM}};
  Perm_regdelays1_1_8 = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  Perm_regdelays1_1_9 = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  Perm_regdelays1_1_10 = _RAND_173[0:0];
  _RAND_174 = {1{`RANDOM}};
  Perm_regdelays1_1_11 = _RAND_174[0:0];
  _RAND_175 = {1{`RANDOM}};
  Perm_regdelays1_1_12 = _RAND_175[0:0];
  _RAND_176 = {1{`RANDOM}};
  Perm_regdelays1_1_13 = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  Perm_regdelays1_1_14 = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  Perm_regdelays1_1_15 = _RAND_178[0:0];
  _RAND_179 = {1{`RANDOM}};
  Perm_regdelays1_1_16 = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  Perm_regdelays1_1_17 = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  Perm_regdelays1_1_18 = _RAND_181[0:0];
  _RAND_182 = {1{`RANDOM}};
  Perm_regdelays1_1_19 = _RAND_182[0:0];
  _RAND_183 = {1{`RANDOM}};
  Perm_regdelays1_1_20 = _RAND_183[0:0];
  _RAND_184 = {1{`RANDOM}};
  Perm_regdelays1_1_21 = _RAND_184[0:0];
  _RAND_185 = {1{`RANDOM}};
  Perm_regdelays1_1_22 = _RAND_185[0:0];
  _RAND_186 = {1{`RANDOM}};
  Perm_regdelays1_1_23 = _RAND_186[0:0];
  _RAND_187 = {1{`RANDOM}};
  Perm_regdelays1_1_24 = _RAND_187[0:0];
  _RAND_188 = {1{`RANDOM}};
  Perm_regdelays1_1_25 = _RAND_188[0:0];
  _RAND_189 = {1{`RANDOM}};
  Perm_regdelays1_1_26 = _RAND_189[0:0];
  _RAND_190 = {1{`RANDOM}};
  Perm_regdelays1_1_27 = _RAND_190[0:0];
  _RAND_191 = {1{`RANDOM}};
  Perm_regdelays1_1_28 = _RAND_191[0:0];
  _RAND_192 = {1{`RANDOM}};
  Perm_regdelays1_1_29 = _RAND_192[0:0];
  _RAND_193 = {1{`RANDOM}};
  Perm_regdelays1_1_30 = _RAND_193[0:0];
  _RAND_194 = {1{`RANDOM}};
  Perm_regdelays1_1_31 = _RAND_194[0:0];
  _RAND_195 = {1{`RANDOM}};
  Perm_regdelays1_1_32 = _RAND_195[0:0];
  _RAND_196 = {1{`RANDOM}};
  Perm_regdelays1_1_33 = _RAND_196[0:0];
  _RAND_197 = {1{`RANDOM}};
  Perm_regdelays1_1_34 = _RAND_197[0:0];
  _RAND_198 = {1{`RANDOM}};
  Perm_regdelays1_1_35 = _RAND_198[0:0];
  _RAND_199 = {1{`RANDOM}};
  Perm_regdelays1_1_36 = _RAND_199[0:0];
  _RAND_200 = {1{`RANDOM}};
  Perm_regdelays1_1_37 = _RAND_200[0:0];
  _RAND_201 = {1{`RANDOM}};
  Perm_regdelays1_1_38 = _RAND_201[0:0];
  _RAND_202 = {1{`RANDOM}};
  Perm_regdelays1_1_39 = _RAND_202[0:0];
  _RAND_203 = {1{`RANDOM}};
  Perm_regdelays1_1_40 = _RAND_203[0:0];
  _RAND_204 = {1{`RANDOM}};
  Perm_regdelays1_1_41 = _RAND_204[0:0];
  _RAND_205 = {1{`RANDOM}};
  Perm_regdelays1_1_42 = _RAND_205[0:0];
  _RAND_206 = {1{`RANDOM}};
  Perm_regdelays1_1_43 = _RAND_206[0:0];
  _RAND_207 = {1{`RANDOM}};
  Perm_regdelays1_1_44 = _RAND_207[0:0];
  _RAND_208 = {1{`RANDOM}};
  Perm_regdelays1_1_45 = _RAND_208[0:0];
  _RAND_209 = {1{`RANDOM}};
  Perm_regdelays1_1_46 = _RAND_209[0:0];
  _RAND_210 = {1{`RANDOM}};
  Perm_regdelays1_1_47 = _RAND_210[0:0];
  _RAND_211 = {1{`RANDOM}};
  Perm_regdelays1_2_0 = _RAND_211[0:0];
  _RAND_212 = {1{`RANDOM}};
  Perm_regdelays1_2_1 = _RAND_212[0:0];
  _RAND_213 = {1{`RANDOM}};
  Perm_regdelays1_2_2 = _RAND_213[0:0];
  _RAND_214 = {1{`RANDOM}};
  Perm_regdelays1_2_3 = _RAND_214[0:0];
  _RAND_215 = {1{`RANDOM}};
  Perm_regdelays1_2_4 = _RAND_215[0:0];
  _RAND_216 = {1{`RANDOM}};
  Perm_regdelays1_2_5 = _RAND_216[0:0];
  _RAND_217 = {1{`RANDOM}};
  Perm_regdelays1_2_6 = _RAND_217[0:0];
  _RAND_218 = {1{`RANDOM}};
  Perm_regdelays1_2_7 = _RAND_218[0:0];
  _RAND_219 = {1{`RANDOM}};
  Perm_regdelays1_2_8 = _RAND_219[0:0];
  _RAND_220 = {1{`RANDOM}};
  Perm_regdelays1_2_9 = _RAND_220[0:0];
  _RAND_221 = {1{`RANDOM}};
  Perm_regdelays1_2_10 = _RAND_221[0:0];
  _RAND_222 = {1{`RANDOM}};
  Perm_regdelays1_2_11 = _RAND_222[0:0];
  _RAND_223 = {1{`RANDOM}};
  Perm_regdelays1_2_12 = _RAND_223[0:0];
  _RAND_224 = {1{`RANDOM}};
  Perm_regdelays1_2_13 = _RAND_224[0:0];
  _RAND_225 = {1{`RANDOM}};
  Perm_regdelays1_2_14 = _RAND_225[0:0];
  _RAND_226 = {1{`RANDOM}};
  Perm_regdelays1_2_15 = _RAND_226[0:0];
  _RAND_227 = {1{`RANDOM}};
  Perm_regdelays1_2_16 = _RAND_227[0:0];
  _RAND_228 = {1{`RANDOM}};
  Perm_regdelays1_2_17 = _RAND_228[0:0];
  _RAND_229 = {1{`RANDOM}};
  Perm_regdelays1_2_18 = _RAND_229[0:0];
  _RAND_230 = {1{`RANDOM}};
  Perm_regdelays1_2_19 = _RAND_230[0:0];
  _RAND_231 = {1{`RANDOM}};
  Perm_regdelays1_2_20 = _RAND_231[0:0];
  _RAND_232 = {1{`RANDOM}};
  Perm_regdelays1_2_21 = _RAND_232[0:0];
  _RAND_233 = {1{`RANDOM}};
  Perm_regdelays1_2_22 = _RAND_233[0:0];
  _RAND_234 = {1{`RANDOM}};
  Perm_regdelays1_2_23 = _RAND_234[0:0];
  _RAND_235 = {1{`RANDOM}};
  Perm_regdelays1_2_24 = _RAND_235[0:0];
  _RAND_236 = {1{`RANDOM}};
  Perm_regdelays1_2_25 = _RAND_236[0:0];
  _RAND_237 = {1{`RANDOM}};
  Perm_regdelays1_2_26 = _RAND_237[0:0];
  _RAND_238 = {1{`RANDOM}};
  Perm_regdelays1_2_27 = _RAND_238[0:0];
  _RAND_239 = {1{`RANDOM}};
  Perm_regdelays1_2_28 = _RAND_239[0:0];
  _RAND_240 = {1{`RANDOM}};
  Perm_regdelays1_2_29 = _RAND_240[0:0];
  _RAND_241 = {1{`RANDOM}};
  Perm_regdelays1_2_30 = _RAND_241[0:0];
  _RAND_242 = {1{`RANDOM}};
  Perm_regdelays1_2_31 = _RAND_242[0:0];
  _RAND_243 = {1{`RANDOM}};
  Perm_regdelays1_2_32 = _RAND_243[0:0];
  _RAND_244 = {1{`RANDOM}};
  Perm_regdelays1_2_33 = _RAND_244[0:0];
  _RAND_245 = {1{`RANDOM}};
  Perm_regdelays1_2_34 = _RAND_245[0:0];
  _RAND_246 = {1{`RANDOM}};
  Perm_regdelays1_2_35 = _RAND_246[0:0];
  _RAND_247 = {1{`RANDOM}};
  Perm_regdelays1_2_36 = _RAND_247[0:0];
  _RAND_248 = {1{`RANDOM}};
  Perm_regdelays1_2_37 = _RAND_248[0:0];
  _RAND_249 = {1{`RANDOM}};
  Perm_regdelays1_2_38 = _RAND_249[0:0];
  _RAND_250 = {1{`RANDOM}};
  Perm_regdelays1_2_39 = _RAND_250[0:0];
  _RAND_251 = {1{`RANDOM}};
  Perm_regdelays1_2_40 = _RAND_251[0:0];
  _RAND_252 = {1{`RANDOM}};
  Perm_regdelays1_2_41 = _RAND_252[0:0];
  _RAND_253 = {1{`RANDOM}};
  Perm_regdelays1_2_42 = _RAND_253[0:0];
  _RAND_254 = {1{`RANDOM}};
  Perm_regdelays1_2_43 = _RAND_254[0:0];
  _RAND_255 = {1{`RANDOM}};
  Perm_regdelays1_2_44 = _RAND_255[0:0];
  _RAND_256 = {1{`RANDOM}};
  Perm_regdelays1_2_45 = _RAND_256[0:0];
  _RAND_257 = {1{`RANDOM}};
  Perm_regdelays1_2_46 = _RAND_257[0:0];
  _RAND_258 = {1{`RANDOM}};
  Perm_regdelays1_2_47 = _RAND_258[0:0];
  _RAND_259 = {1{`RANDOM}};
  out_regdelay = _RAND_259[0:0];
  _RAND_260 = {1{`RANDOM}};
  results_0_Re = _RAND_260[31:0];
  _RAND_261 = {1{`RANDOM}};
  results_0_Im = _RAND_261[31:0];
  _RAND_262 = {1{`RANDOM}};
  results_1_Re = _RAND_262[31:0];
  _RAND_263 = {1{`RANDOM}};
  results_1_Im = _RAND_263[31:0];
  _RAND_264 = {1{`RANDOM}};
  results_2_Re = _RAND_264[31:0];
  _RAND_265 = {1{`RANDOM}};
  results_2_Im = _RAND_265[31:0];
  _RAND_266 = {1{`RANDOM}};
  results_3_Re = _RAND_266[31:0];
  _RAND_267 = {1{`RANDOM}};
  results_3_Im = _RAND_267[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

