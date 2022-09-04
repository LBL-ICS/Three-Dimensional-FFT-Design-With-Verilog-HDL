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
module FPComplexMultiAdder(
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  output [31:0] io_out_Re,
  output [31:0] io_out_Im
);
  assign io_out_Re = io_in_0_Re; // @[FPComplex.scala 474:14]
  assign io_out_Im = io_in_0_Im; // @[FPComplex.scala 474:14]
endmodule
module cmplx_adj(
  input  [31:0] io_in_Re,
  input  [31:0] io_in_Im,
  input  [7:0]  io_in_adj,
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
  wire [7:0] _new_exp_0_T_1 = exp_0 - io_in_adj; // @[FFTDesigns.scala 3528:28]
  wire [7:0] new_exp_0 = exp_0 != 8'h0 ? _new_exp_0_T_1 : exp_0; // @[FFTDesigns.scala 3527:25 3528:18 3530:18]
  wire [7:0] _new_exp_1_T_1 = exp_1 - io_in_adj; // @[FFTDesigns.scala 3533:28]
  wire [7:0] new_exp_1 = exp_1 != 8'h0 ? _new_exp_1_T_1 : exp_1; // @[FFTDesigns.scala 3532:26 3533:18 3535:18]
  wire  _io_out_Re_T = ~new_sign_1; // @[FFTDesigns.scala 3539:21]
  wire [31:0] _io_out_Re_T_2 = {_io_out_Re_T,new_exp_1,frac_1}; // @[FFTDesigns.scala 3539:49]
  wire [31:0] _io_out_Im_T_1 = {new_sign_0,new_exp_0,frac_0}; // @[FFTDesigns.scala 3540:48]
  wire [31:0] _io_out_Im_T_3 = {new_sign_1,new_exp_1,frac_1}; // @[FFTDesigns.scala 3543:48]
  assign io_out_Re = io_is_flip ? _io_out_Re_T_2 : _io_out_Im_T_1; // @[FFTDesigns.scala 3538:21 3539:17 3542:17]
  assign io_out_Im = io_is_flip ? _io_out_Im_T_1 : _io_out_Im_T_3; // @[FFTDesigns.scala 3538:21 3540:17 3543:17]
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
  wire [31:0] cmplx_adj_io_in_Re; // @[FPComplex.scala 333:33]
  wire [31:0] cmplx_adj_io_in_Im; // @[FPComplex.scala 333:33]
  wire [7:0] cmplx_adj_io_in_adj; // @[FPComplex.scala 333:33]
  wire  cmplx_adj_io_is_neg; // @[FPComplex.scala 333:33]
  wire  cmplx_adj_io_is_flip; // @[FPComplex.scala 333:33]
  wire [31:0] cmplx_adj_io_out_Re; // @[FPComplex.scala 333:33]
  wire [31:0] cmplx_adj_io_out_Im; // @[FPComplex.scala 333:33]
  reg [31:0] result_0_Re; // @[FPComplex.scala 344:31]
  reg [31:0] result_0_Im; // @[FPComplex.scala 344:31]
  cmplx_adj cmplx_adj ( // @[FPComplex.scala 333:33]
    .io_in_Re(cmplx_adj_io_in_Re),
    .io_in_Im(cmplx_adj_io_in_Im),
    .io_in_adj(cmplx_adj_io_in_adj),
    .io_is_neg(cmplx_adj_io_is_neg),
    .io_is_flip(cmplx_adj_io_is_flip),
    .io_out_Re(cmplx_adj_io_out_Re),
    .io_out_Im(cmplx_adj_io_out_Im)
  );
  assign io_out_s_Re = result_0_Re; // @[FPComplex.scala 353:20]
  assign io_out_s_Im = result_0_Im; // @[FPComplex.scala 353:20]
  assign cmplx_adj_io_in_Re = io_in_a_Re; // @[FPComplex.scala 334:24]
  assign cmplx_adj_io_in_Im = io_in_a_Im; // @[FPComplex.scala 334:24]
  assign cmplx_adj_io_in_adj = 8'h1; // @[FPComplex.scala 337:30]
  assign cmplx_adj_io_is_neg = 1'h1; // @[FPComplex.scala 339:32]
  assign cmplx_adj_io_is_flip = 1'h0; // @[FPComplex.scala 335:29]
  always @(posedge clock) begin
    if (reset) begin // @[FPComplex.scala 344:31]
      result_0_Re <= 32'h0; // @[FPComplex.scala 344:31]
    end else begin
      result_0_Re <= cmplx_adj_io_out_Re; // @[FPComplex.scala 347:25]
    end
    if (reset) begin // @[FPComplex.scala 344:31]
      result_0_Im <= 32'h0; // @[FPComplex.scala 344:31]
    end else begin
      result_0_Im <= cmplx_adj_io_out_Im; // @[FPComplex.scala 347:25]
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
module multiplier(
  input  [23:0] io_in_a,
  input  [23:0] io_in_b,
  output [47:0] io_out_s
);
  assign io_out_s = io_in_a * io_in_b; // @[Arithmetic.scala 84:23]
endmodule
module full_adder_4(
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
  full_adder_4 adderN ( // @[FPArithmetic.scala 503:24]
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
module FPComplexMult_reducable_v2_1(
  input         clock,
  input         reset,
  input  [31:0] io_in_a_Re,
  input  [31:0] io_in_a_Im,
  output [31:0] io_out_s_Re,
  output [31:0] io_out_s_Im
);
  wire [31:0] cmplx_adj_io_in_Re; // @[FPComplex.scala 293:33]
  wire [31:0] cmplx_adj_io_in_Im; // @[FPComplex.scala 293:33]
  wire [7:0] cmplx_adj_io_in_adj; // @[FPComplex.scala 293:33]
  wire  cmplx_adj_io_is_neg; // @[FPComplex.scala 293:33]
  wire  cmplx_adj_io_is_flip; // @[FPComplex.scala 293:33]
  wire [31:0] cmplx_adj_io_out_Re; // @[FPComplex.scala 293:33]
  wire [31:0] cmplx_adj_io_out_Im; // @[FPComplex.scala 293:33]
  wire  FP_multiplier_clock; // @[FPComplex.scala 321:29]
  wire  FP_multiplier_reset; // @[FPComplex.scala 321:29]
  wire [31:0] FP_multiplier_io_in_a; // @[FPComplex.scala 321:29]
  wire [31:0] FP_multiplier_io_in_b; // @[FPComplex.scala 321:29]
  wire [31:0] FP_multiplier_io_out_s; // @[FPComplex.scala 321:29]
  wire  FP_multiplier_1_clock; // @[FPComplex.scala 321:29]
  wire  FP_multiplier_1_reset; // @[FPComplex.scala 321:29]
  wire [31:0] FP_multiplier_1_io_in_a; // @[FPComplex.scala 321:29]
  wire [31:0] FP_multiplier_1_io_in_b; // @[FPComplex.scala 321:29]
  wire [31:0] FP_multiplier_1_io_out_s; // @[FPComplex.scala 321:29]
  cmplx_adj cmplx_adj ( // @[FPComplex.scala 293:33]
    .io_in_Re(cmplx_adj_io_in_Re),
    .io_in_Im(cmplx_adj_io_in_Im),
    .io_in_adj(cmplx_adj_io_in_adj),
    .io_is_neg(cmplx_adj_io_is_neg),
    .io_is_flip(cmplx_adj_io_is_flip),
    .io_out_Re(cmplx_adj_io_out_Re),
    .io_out_Im(cmplx_adj_io_out_Im)
  );
  FP_multiplier FP_multiplier ( // @[FPComplex.scala 321:29]
    .clock(FP_multiplier_clock),
    .reset(FP_multiplier_reset),
    .io_in_a(FP_multiplier_io_in_a),
    .io_in_b(FP_multiplier_io_in_b),
    .io_out_s(FP_multiplier_io_out_s)
  );
  FP_multiplier FP_multiplier_1 ( // @[FPComplex.scala 321:29]
    .clock(FP_multiplier_1_clock),
    .reset(FP_multiplier_1_reset),
    .io_in_a(FP_multiplier_1_io_in_a),
    .io_in_b(FP_multiplier_1_io_in_b),
    .io_out_s(FP_multiplier_1_io_out_s)
  );
  assign io_out_s_Re = FP_multiplier_io_out_s; // @[FPComplex.scala 328:21]
  assign io_out_s_Im = FP_multiplier_1_io_out_s; // @[FPComplex.scala 329:21]
  assign cmplx_adj_io_in_Re = io_in_a_Re; // @[FPComplex.scala 294:24]
  assign cmplx_adj_io_in_Im = io_in_a_Im; // @[FPComplex.scala 294:24]
  assign cmplx_adj_io_in_adj = 8'h0; // @[FPComplex.scala 318:30]
  assign cmplx_adj_io_is_neg = 1'h0; // @[FPComplex.scala 319:30]
  assign cmplx_adj_io_is_flip = 1'h1; // @[FPComplex.scala 295:29]
  assign FP_multiplier_clock = clock;
  assign FP_multiplier_reset = reset;
  assign FP_multiplier_io_in_a = cmplx_adj_io_out_Re; // @[FPComplex.scala 324:29]
  assign FP_multiplier_io_in_b = 32'hbf5db3d6; // @[FPComplex.scala 325:29]
  assign FP_multiplier_1_clock = clock;
  assign FP_multiplier_1_reset = reset;
  assign FP_multiplier_1_io_in_a = cmplx_adj_io_out_Im; // @[FPComplex.scala 326:29]
  assign FP_multiplier_1_io_in_b = 32'hbf5db3d6; // @[FPComplex.scala 327:29]
endmodule
module DFT_r_v2(
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
  FPComplexMultiAdder FPComplexMultiAdder ( // @[FFTDesigns.scala 275:36]
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
  FPComplexMultiAdder FPComplexMultiAdder_1 ( // @[FFTDesigns.scala 394:29]
    .io_in_0_Re(FPComplexMultiAdder_1_io_in_0_Re),
    .io_in_0_Im(FPComplexMultiAdder_1_io_in_0_Im),
    .io_out_Re(FPComplexMultiAdder_1_io_out_Re),
    .io_out_Im(FPComplexMultiAdder_1_io_out_Im)
  );
  FPComplexMultiAdder FPComplexMultiAdder_2 ( // @[FFTDesigns.scala 394:29]
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
module RAM_Block(
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
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem_0_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_0_Im; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_1_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_1_Im; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_2_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_2_Im; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_3_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_3_Im; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_4_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_4_Im; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_5_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_5_Im; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_6_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_6_Im; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_7_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_7_Im; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_8_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_8_Im; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_9_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_9_Im; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_10_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_10_Im; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_11_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_11_Im; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_12_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_12_Im; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_13_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_13_Im; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_14_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_14_Im; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_15_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_15_Im; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_16_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_16_Im; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_17_Re; // @[FFTDesigns.scala 2659:18]
  reg [31:0] mem_17_Im; // @[FFTDesigns.scala 2659:18]
  wire [31:0] _GEN_73 = 5'h1 == io_in_raddr ? mem_1_Im : mem_0_Im; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_74 = 5'h2 == io_in_raddr ? mem_2_Im : _GEN_73; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_75 = 5'h3 == io_in_raddr ? mem_3_Im : _GEN_74; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_76 = 5'h4 == io_in_raddr ? mem_4_Im : _GEN_75; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_77 = 5'h5 == io_in_raddr ? mem_5_Im : _GEN_76; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_78 = 5'h6 == io_in_raddr ? mem_6_Im : _GEN_77; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_79 = 5'h7 == io_in_raddr ? mem_7_Im : _GEN_78; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_80 = 5'h8 == io_in_raddr ? mem_8_Im : _GEN_79; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_81 = 5'h9 == io_in_raddr ? mem_9_Im : _GEN_80; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_82 = 5'ha == io_in_raddr ? mem_10_Im : _GEN_81; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_83 = 5'hb == io_in_raddr ? mem_11_Im : _GEN_82; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_84 = 5'hc == io_in_raddr ? mem_12_Im : _GEN_83; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_85 = 5'hd == io_in_raddr ? mem_13_Im : _GEN_84; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_86 = 5'he == io_in_raddr ? mem_14_Im : _GEN_85; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_87 = 5'hf == io_in_raddr ? mem_15_Im : _GEN_86; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_88 = 5'h10 == io_in_raddr ? mem_16_Im : _GEN_87; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_89 = 5'h11 == io_in_raddr ? mem_17_Im : _GEN_88; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_91 = 5'h1 == io_in_raddr ? mem_1_Re : mem_0_Re; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_92 = 5'h2 == io_in_raddr ? mem_2_Re : _GEN_91; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_93 = 5'h3 == io_in_raddr ? mem_3_Re : _GEN_92; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_94 = 5'h4 == io_in_raddr ? mem_4_Re : _GEN_93; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_95 = 5'h5 == io_in_raddr ? mem_5_Re : _GEN_94; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_96 = 5'h6 == io_in_raddr ? mem_6_Re : _GEN_95; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_97 = 5'h7 == io_in_raddr ? mem_7_Re : _GEN_96; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_98 = 5'h8 == io_in_raddr ? mem_8_Re : _GEN_97; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_99 = 5'h9 == io_in_raddr ? mem_9_Re : _GEN_98; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_100 = 5'ha == io_in_raddr ? mem_10_Re : _GEN_99; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_101 = 5'hb == io_in_raddr ? mem_11_Re : _GEN_100; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_102 = 5'hc == io_in_raddr ? mem_12_Re : _GEN_101; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_103 = 5'hd == io_in_raddr ? mem_13_Re : _GEN_102; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_104 = 5'he == io_in_raddr ? mem_14_Re : _GEN_103; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_105 = 5'hf == io_in_raddr ? mem_15_Re : _GEN_104; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_106 = 5'h10 == io_in_raddr ? mem_16_Re : _GEN_105; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_107 = 5'h11 == io_in_raddr ? mem_17_Re : _GEN_106; // @[FFTDesigns.scala 2665:{21,21}]
  wire [31:0] _GEN_108 = io_re ? _GEN_89 : 32'h0; // @[FFTDesigns.scala 2664:18 2665:21 2668:24]
  wire [31:0] _GEN_109 = io_re ? _GEN_107 : 32'h0; // @[FFTDesigns.scala 2664:18 2665:21 2667:24]
  assign io_out_data_Re = io_en ? _GEN_109 : 32'h0; // @[FFTDesigns.scala 2660:16 2671:22]
  assign io_out_data_Im = io_en ? _GEN_108 : 32'h0; // @[FFTDesigns.scala 2660:16 2672:22]
  always @(posedge clock) begin
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h0 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_0_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h0 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_0_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h1 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_1_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h1 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_1_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h2 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_2_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h2 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_2_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h3 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_3_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h3 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_3_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h4 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_4_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h4 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_4_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h5 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_5_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h5 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_5_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h6 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_6_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h6 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_6_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h7 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_7_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h7 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_7_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h8 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_8_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h8 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_8_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h9 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_9_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h9 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_9_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'ha == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_10_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'ha == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_10_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'hb == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_11_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'hb == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_11_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'hc == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_12_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'hc == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_12_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'hd == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_13_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'hd == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_13_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'he == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_14_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'he == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_14_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'hf == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_15_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'hf == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_15_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h10 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_16_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h10 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_16_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h11 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_17_Re <= io_in_data_Re; // @[FFTDesigns.scala 2662:26]
        end
      end
    end
    if (io_en) begin // @[FFTDesigns.scala 2660:16]
      if (io_wr) begin // @[FFTDesigns.scala 2661:18]
        if (5'h11 == io_in_waddr) begin // @[FFTDesigns.scala 2662:26]
          mem_17_Im <= io_in_data_Im; // @[FFTDesigns.scala 2662:26]
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
  input  [1:0]  io_in_config_0,
  input  [1:0]  io_in_config_1,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im,
  output [31:0] io_out_2_Re,
  output [31:0] io_out_2_Im
);
  wire  _T = io_in_config_0 == 2'h0; // @[FFTDesigns.scala 2567:35]
  wire  _T_1 = io_in_config_1 == 2'h0; // @[FFTDesigns.scala 2567:35]
  wire  _T_3 = io_in_config_0 == 2'h1; // @[FFTDesigns.scala 2567:35]
  wire  _T_4 = io_in_config_1 == 2'h1; // @[FFTDesigns.scala 2567:35]
  wire  _T_6 = io_in_config_0 == 2'h2; // @[FFTDesigns.scala 2567:35]
  wire  _T_7 = io_in_config_1 == 2'h2; // @[FFTDesigns.scala 2567:35]
  wire [1:0] _pms_pmx_T = _T_1 ? 2'h1 : 2'h2; // @[Mux.scala 47:70]
  wire [1:0] pms_0 = _T ? 2'h0 : _pms_pmx_T; // @[Mux.scala 47:70]
  wire [1:0] _pms_pmx_T_1 = _T_4 ? 2'h1 : 2'h2; // @[Mux.scala 47:70]
  wire [1:0] pms_1 = _T_3 ? 2'h0 : _pms_pmx_T_1; // @[Mux.scala 47:70]
  wire [1:0] _pms_pmx_T_2 = _T_7 ? 2'h1 : 2'h2; // @[Mux.scala 47:70]
  wire [1:0] pms_2 = _T_6 ? 2'h0 : _pms_pmx_T_2; // @[Mux.scala 47:70]
  wire [31:0] _GEN_1 = 2'h1 == pms_0 ? io_in_1_Im : io_in_0_Im; // @[FFTDesigns.scala 2576:{17,17}]
  wire [31:0] _GEN_4 = 2'h1 == pms_0 ? io_in_1_Re : io_in_0_Re; // @[FFTDesigns.scala 2576:{17,17}]
  wire [31:0] _GEN_7 = 2'h1 == pms_1 ? io_in_1_Im : io_in_0_Im; // @[FFTDesigns.scala 2576:{17,17}]
  wire [31:0] _GEN_10 = 2'h1 == pms_1 ? io_in_1_Re : io_in_0_Re; // @[FFTDesigns.scala 2576:{17,17}]
  wire [31:0] _GEN_13 = 2'h1 == pms_2 ? io_in_1_Im : io_in_0_Im; // @[FFTDesigns.scala 2576:{17,17}]
  wire [31:0] _GEN_16 = 2'h1 == pms_2 ? io_in_1_Re : io_in_0_Re; // @[FFTDesigns.scala 2576:{17,17}]
  assign io_out_0_Re = 2'h2 == pms_0 ? io_in_2_Re : _GEN_4; // @[FFTDesigns.scala 2576:{17,17}]
  assign io_out_0_Im = 2'h2 == pms_0 ? io_in_2_Im : _GEN_1; // @[FFTDesigns.scala 2576:{17,17}]
  assign io_out_1_Re = 2'h2 == pms_1 ? io_in_2_Re : _GEN_10; // @[FFTDesigns.scala 2576:{17,17}]
  assign io_out_1_Im = 2'h2 == pms_1 ? io_in_2_Im : _GEN_7; // @[FFTDesigns.scala 2576:{17,17}]
  assign io_out_2_Re = 2'h2 == pms_2 ? io_in_2_Re : _GEN_16; // @[FFTDesigns.scala 2576:{17,17}]
  assign io_out_2_Im = 2'h2 == pms_2 ? io_in_2_Im : _GEN_13; // @[FFTDesigns.scala 2576:{17,17}]
endmodule
module M0_Config_ROM(
  input  [3:0] io_in_cnt,
  output [4:0] io_out_0,
  output [4:0] io_out_1,
  output [4:0] io_out_2
);
  wire [4:0] _GEN_1 = 4'h1 == io_in_cnt ? 5'h1 : 5'h0; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_2 = 4'h2 == io_in_cnt ? 5'h2 : _GEN_1; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_3 = 4'h3 == io_in_cnt ? 5'h6 : _GEN_2; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_4 = 4'h4 == io_in_cnt ? 5'h7 : _GEN_3; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_5 = 4'h5 == io_in_cnt ? 5'h8 : _GEN_4; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_6 = 4'h6 == io_in_cnt ? 5'h3 : _GEN_5; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_7 = 4'h7 == io_in_cnt ? 5'h4 : _GEN_6; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_10 = 4'h1 == io_in_cnt ? 5'h4 : 5'h3; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_11 = 4'h2 == io_in_cnt ? 5'h5 : _GEN_10; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_12 = 4'h3 == io_in_cnt ? 5'h0 : _GEN_11; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_13 = 4'h4 == io_in_cnt ? 5'h1 : _GEN_12; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_14 = 4'h5 == io_in_cnt ? 5'h2 : _GEN_13; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_15 = 4'h6 == io_in_cnt ? 5'h6 : _GEN_14; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_16 = 4'h7 == io_in_cnt ? 5'h7 : _GEN_15; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_19 = 4'h1 == io_in_cnt ? 5'h7 : 5'h6; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_20 = 4'h2 == io_in_cnt ? 5'h8 : _GEN_19; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_21 = 4'h3 == io_in_cnt ? 5'h3 : _GEN_20; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_22 = 4'h4 == io_in_cnt ? 5'h4 : _GEN_21; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_23 = 4'h5 == io_in_cnt ? 5'h5 : _GEN_22; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_24 = 4'h6 == io_in_cnt ? 5'h0 : _GEN_23; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_25 = 4'h7 == io_in_cnt ? 5'h1 : _GEN_24; // @[FFTDesigns.scala 2600:{17,17}]
  assign io_out_0 = 4'h8 == io_in_cnt ? 5'h5 : _GEN_7; // @[FFTDesigns.scala 2600:{17,17}]
  assign io_out_1 = 4'h8 == io_in_cnt ? 5'h8 : _GEN_16; // @[FFTDesigns.scala 2600:{17,17}]
  assign io_out_2 = 4'h8 == io_in_cnt ? 5'h2 : _GEN_25; // @[FFTDesigns.scala 2600:{17,17}]
endmodule
module M1_Config_ROM(
  input  [3:0] io_in_cnt,
  output [4:0] io_out_0,
  output [4:0] io_out_1,
  output [4:0] io_out_2
);
  wire [4:0] _GEN_1 = 4'h1 == io_in_cnt ? 5'h1 : 5'h0; // @[FFTDesigns.scala 2623:{17,17}]
  wire [4:0] _GEN_2 = 4'h2 == io_in_cnt ? 5'h2 : _GEN_1; // @[FFTDesigns.scala 2623:{17,17}]
  wire [4:0] _GEN_3 = 4'h3 == io_in_cnt ? 5'h3 : _GEN_2; // @[FFTDesigns.scala 2623:{17,17}]
  wire [4:0] _GEN_4 = 4'h4 == io_in_cnt ? 5'h4 : _GEN_3; // @[FFTDesigns.scala 2623:{17,17}]
  wire [4:0] _GEN_5 = 4'h5 == io_in_cnt ? 5'h5 : _GEN_4; // @[FFTDesigns.scala 2623:{17,17}]
  wire [4:0] _GEN_6 = 4'h6 == io_in_cnt ? 5'h6 : _GEN_5; // @[FFTDesigns.scala 2623:{17,17}]
  wire [4:0] _GEN_7 = 4'h7 == io_in_cnt ? 5'h7 : _GEN_6; // @[FFTDesigns.scala 2623:{17,17}]
  wire [4:0] _GEN_10 = 4'h1 == io_in_cnt ? 5'h4 : 5'h3; // @[FFTDesigns.scala 2623:{17,17}]
  wire [4:0] _GEN_11 = 4'h2 == io_in_cnt ? 5'h5 : _GEN_10; // @[FFTDesigns.scala 2623:{17,17}]
  wire [4:0] _GEN_12 = 4'h3 == io_in_cnt ? 5'h6 : _GEN_11; // @[FFTDesigns.scala 2623:{17,17}]
  wire [4:0] _GEN_13 = 4'h4 == io_in_cnt ? 5'h7 : _GEN_12; // @[FFTDesigns.scala 2623:{17,17}]
  wire [4:0] _GEN_14 = 4'h5 == io_in_cnt ? 5'h8 : _GEN_13; // @[FFTDesigns.scala 2623:{17,17}]
  wire [4:0] _GEN_15 = 4'h6 == io_in_cnt ? 5'h0 : _GEN_14; // @[FFTDesigns.scala 2623:{17,17}]
  wire [4:0] _GEN_16 = 4'h7 == io_in_cnt ? 5'h1 : _GEN_15; // @[FFTDesigns.scala 2623:{17,17}]
  wire [4:0] _GEN_19 = 4'h1 == io_in_cnt ? 5'h7 : 5'h6; // @[FFTDesigns.scala 2623:{17,17}]
  wire [4:0] _GEN_20 = 4'h2 == io_in_cnt ? 5'h8 : _GEN_19; // @[FFTDesigns.scala 2623:{17,17}]
  wire [4:0] _GEN_21 = 4'h3 == io_in_cnt ? 5'h0 : _GEN_20; // @[FFTDesigns.scala 2623:{17,17}]
  wire [4:0] _GEN_22 = 4'h4 == io_in_cnt ? 5'h1 : _GEN_21; // @[FFTDesigns.scala 2623:{17,17}]
  wire [4:0] _GEN_23 = 4'h5 == io_in_cnt ? 5'h2 : _GEN_22; // @[FFTDesigns.scala 2623:{17,17}]
  wire [4:0] _GEN_24 = 4'h6 == io_in_cnt ? 5'h3 : _GEN_23; // @[FFTDesigns.scala 2623:{17,17}]
  wire [4:0] _GEN_25 = 4'h7 == io_in_cnt ? 5'h4 : _GEN_24; // @[FFTDesigns.scala 2623:{17,17}]
  assign io_out_0 = 4'h8 == io_in_cnt ? 5'h8 : _GEN_7; // @[FFTDesigns.scala 2623:{17,17}]
  assign io_out_1 = 4'h8 == io_in_cnt ? 5'h2 : _GEN_16; // @[FFTDesigns.scala 2623:{17,17}]
  assign io_out_2 = 4'h8 == io_in_cnt ? 5'h5 : _GEN_25; // @[FFTDesigns.scala 2623:{17,17}]
endmodule
module Streaming_Permute_Config(
  input  [3:0] io_in_cnt,
  output [1:0] io_out_0,
  output [1:0] io_out_1
);
  wire [1:0] _GEN_3 = 4'h3 == io_in_cnt ? 2'h2 : 2'h0; // @[FFTDesigns.scala 2646:{17,17}]
  wire [1:0] _GEN_4 = 4'h4 == io_in_cnt ? 2'h2 : _GEN_3; // @[FFTDesigns.scala 2646:{17,17}]
  wire [1:0] _GEN_5 = 4'h5 == io_in_cnt ? 2'h2 : _GEN_4; // @[FFTDesigns.scala 2646:{17,17}]
  wire [1:0] _GEN_6 = 4'h6 == io_in_cnt ? 2'h1 : _GEN_5; // @[FFTDesigns.scala 2646:{17,17}]
  wire [1:0] _GEN_7 = 4'h7 == io_in_cnt ? 2'h1 : _GEN_6; // @[FFTDesigns.scala 2646:{17,17}]
  wire [1:0] _GEN_12 = 4'h3 == io_in_cnt ? 2'h0 : 2'h1; // @[FFTDesigns.scala 2646:{17,17}]
  wire [1:0] _GEN_13 = 4'h4 == io_in_cnt ? 2'h0 : _GEN_12; // @[FFTDesigns.scala 2646:{17,17}]
  wire [1:0] _GEN_14 = 4'h5 == io_in_cnt ? 2'h0 : _GEN_13; // @[FFTDesigns.scala 2646:{17,17}]
  wire [1:0] _GEN_15 = 4'h6 == io_in_cnt ? 2'h2 : _GEN_14; // @[FFTDesigns.scala 2646:{17,17}]
  wire [1:0] _GEN_16 = 4'h7 == io_in_cnt ? 2'h2 : _GEN_15; // @[FFTDesigns.scala 2646:{17,17}]
  assign io_out_0 = 4'h8 == io_in_cnt ? 2'h1 : _GEN_7; // @[FFTDesigns.scala 2646:{17,17}]
  assign io_out_1 = 4'h8 == io_in_cnt ? 2'h2 : _GEN_16; // @[FFTDesigns.scala 2646:{17,17}]
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
`endif // RANDOMIZE_REG_INIT
  wire  RAM_Block_clock; // @[FFTDesigns.scala 2334:24]
  wire [4:0] RAM_Block_io_in_raddr; // @[FFTDesigns.scala 2334:24]
  wire [4:0] RAM_Block_io_in_waddr; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_io_in_data_Re; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_io_in_data_Im; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_io_re; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_io_wr; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_io_en; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_io_out_data_Re; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_io_out_data_Im; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_1_clock; // @[FFTDesigns.scala 2334:24]
  wire [4:0] RAM_Block_1_io_in_raddr; // @[FFTDesigns.scala 2334:24]
  wire [4:0] RAM_Block_1_io_in_waddr; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_1_io_in_data_Re; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_1_io_in_data_Im; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_1_io_re; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_1_io_wr; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_1_io_en; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_1_io_out_data_Re; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_1_io_out_data_Im; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_2_clock; // @[FFTDesigns.scala 2334:24]
  wire [4:0] RAM_Block_2_io_in_raddr; // @[FFTDesigns.scala 2334:24]
  wire [4:0] RAM_Block_2_io_in_waddr; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_2_io_in_data_Re; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_2_io_in_data_Im; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_2_io_re; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_2_io_wr; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_2_io_en; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_2_io_out_data_Re; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_2_io_out_data_Im; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_3_clock; // @[FFTDesigns.scala 2338:24]
  wire [4:0] RAM_Block_3_io_in_raddr; // @[FFTDesigns.scala 2338:24]
  wire [4:0] RAM_Block_3_io_in_waddr; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_3_io_in_data_Re; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_3_io_in_data_Im; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_3_io_re; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_3_io_wr; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_3_io_en; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_3_io_out_data_Re; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_3_io_out_data_Im; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_4_clock; // @[FFTDesigns.scala 2338:24]
  wire [4:0] RAM_Block_4_io_in_raddr; // @[FFTDesigns.scala 2338:24]
  wire [4:0] RAM_Block_4_io_in_waddr; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_4_io_in_data_Re; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_4_io_in_data_Im; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_4_io_re; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_4_io_wr; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_4_io_en; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_4_io_out_data_Re; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_4_io_out_data_Im; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_5_clock; // @[FFTDesigns.scala 2338:24]
  wire [4:0] RAM_Block_5_io_in_raddr; // @[FFTDesigns.scala 2338:24]
  wire [4:0] RAM_Block_5_io_in_waddr; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_5_io_in_data_Re; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_5_io_in_data_Im; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_5_io_re; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_5_io_wr; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_5_io_en; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_5_io_out_data_Re; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_5_io_out_data_Im; // @[FFTDesigns.scala 2338:24]
  wire [31:0] PermutationModuleStreamed_io_in_0_Re; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_in_0_Im; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_in_1_Re; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_in_1_Im; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_in_2_Re; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_in_2_Im; // @[FFTDesigns.scala 2341:26]
  wire [1:0] PermutationModuleStreamed_io_in_config_0; // @[FFTDesigns.scala 2341:26]
  wire [1:0] PermutationModuleStreamed_io_in_config_1; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_out_0_Re; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_out_0_Im; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_out_1_Re; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_out_1_Im; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_out_2_Re; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_out_2_Im; // @[FFTDesigns.scala 2341:26]
  wire [3:0] M0_Config_ROM_io_in_cnt; // @[FFTDesigns.scala 2342:27]
  wire [4:0] M0_Config_ROM_io_out_0; // @[FFTDesigns.scala 2342:27]
  wire [4:0] M0_Config_ROM_io_out_1; // @[FFTDesigns.scala 2342:27]
  wire [4:0] M0_Config_ROM_io_out_2; // @[FFTDesigns.scala 2342:27]
  wire [3:0] M1_Config_ROM_io_in_cnt; // @[FFTDesigns.scala 2343:27]
  wire [4:0] M1_Config_ROM_io_out_0; // @[FFTDesigns.scala 2343:27]
  wire [4:0] M1_Config_ROM_io_out_1; // @[FFTDesigns.scala 2343:27]
  wire [4:0] M1_Config_ROM_io_out_2; // @[FFTDesigns.scala 2343:27]
  wire [3:0] Streaming_Permute_Config_io_in_cnt; // @[FFTDesigns.scala 2344:29]
  wire [1:0] Streaming_Permute_Config_io_out_0; // @[FFTDesigns.scala 2344:29]
  wire [1:0] Streaming_Permute_Config_io_out_1; // @[FFTDesigns.scala 2344:29]
  reg  offset_switch; // @[FFTDesigns.scala 2327:28]
  wire [9:0] hi = {io_in_en_18,io_in_en_17,io_in_en_16,io_in_en_15,io_in_en_14,io_in_en_13,io_in_en_12,io_in_en_11,
    io_in_en_10,io_in_en_9}; // @[FFTDesigns.scala 2328:19]
  wire [18:0] _T = {hi,io_in_en_8,io_in_en_7,io_in_en_6,io_in_en_5,io_in_en_4,io_in_en_3,io_in_en_2,io_in_en_1,
    io_in_en_0}; // @[FFTDesigns.scala 2328:19]
  wire  _T_1 = |_T; // @[FFTDesigns.scala 2328:26]
  reg [3:0] cnt; // @[FFTDesigns.scala 2345:22]
  wire  _offset_switch_T = ~offset_switch; // @[FFTDesigns.scala 2349:26]
  wire [3:0] _cnt_T_1 = cnt + 4'h1; // @[FFTDesigns.scala 2351:20]
  wire  _GEN_2 = cnt == 4'h8 ? ~offset_switch : offset_switch; // @[FFTDesigns.scala 2347:32 2349:23 2352:23]
  wire [4:0] _T_6 = 4'h9 * _offset_switch_T; // @[FFTDesigns.scala 2361:54]
  wire [4:0] _T_8 = M0_Config_ROM_io_out_0 + _T_6; // @[FFTDesigns.scala 2361:44]
  wire [4:0] _T_9 = 4'h9 * offset_switch; // @[FFTDesigns.scala 2362:41]
  wire [4:0] _GEN_45 = {{1'd0}, cnt}; // @[FFTDesigns.scala 2362:31]
  wire [4:0] _T_11 = _GEN_45 + _T_9; // @[FFTDesigns.scala 2362:31]
  wire [4:0] _T_15 = _GEN_45 + _T_6; // @[FFTDesigns.scala 2364:31]
  wire [4:0] _T_18 = M1_Config_ROM_io_out_0 + _T_9; // @[FFTDesigns.scala 2365:44]
  wire [4:0] _T_22 = M0_Config_ROM_io_out_1 + _T_6; // @[FFTDesigns.scala 2361:44]
  wire [4:0] _T_32 = M1_Config_ROM_io_out_1 + _T_9; // @[FFTDesigns.scala 2365:44]
  wire [4:0] _T_36 = M0_Config_ROM_io_out_2 + _T_6; // @[FFTDesigns.scala 2361:44]
  wire [4:0] _T_46 = M1_Config_ROM_io_out_2 + _T_9; // @[FFTDesigns.scala 2365:44]
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
  RAM_Block RAM_Block_2 ( // @[FFTDesigns.scala 2334:24]
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
  RAM_Block RAM_Block_4 ( // @[FFTDesigns.scala 2338:24]
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
  RAM_Block RAM_Block_5 ( // @[FFTDesigns.scala 2338:24]
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
  PermutationModuleStreamed PermutationModuleStreamed ( // @[FFTDesigns.scala 2341:26]
    .io_in_0_Re(PermutationModuleStreamed_io_in_0_Re),
    .io_in_0_Im(PermutationModuleStreamed_io_in_0_Im),
    .io_in_1_Re(PermutationModuleStreamed_io_in_1_Re),
    .io_in_1_Im(PermutationModuleStreamed_io_in_1_Im),
    .io_in_2_Re(PermutationModuleStreamed_io_in_2_Re),
    .io_in_2_Im(PermutationModuleStreamed_io_in_2_Im),
    .io_in_config_0(PermutationModuleStreamed_io_in_config_0),
    .io_in_config_1(PermutationModuleStreamed_io_in_config_1),
    .io_out_0_Re(PermutationModuleStreamed_io_out_0_Re),
    .io_out_0_Im(PermutationModuleStreamed_io_out_0_Im),
    .io_out_1_Re(PermutationModuleStreamed_io_out_1_Re),
    .io_out_1_Im(PermutationModuleStreamed_io_out_1_Im),
    .io_out_2_Re(PermutationModuleStreamed_io_out_2_Re),
    .io_out_2_Im(PermutationModuleStreamed_io_out_2_Im)
  );
  M0_Config_ROM M0_Config_ROM ( // @[FFTDesigns.scala 2342:27]
    .io_in_cnt(M0_Config_ROM_io_in_cnt),
    .io_out_0(M0_Config_ROM_io_out_0),
    .io_out_1(M0_Config_ROM_io_out_1),
    .io_out_2(M0_Config_ROM_io_out_2)
  );
  M1_Config_ROM M1_Config_ROM ( // @[FFTDesigns.scala 2343:27]
    .io_in_cnt(M1_Config_ROM_io_in_cnt),
    .io_out_0(M1_Config_ROM_io_out_0),
    .io_out_1(M1_Config_ROM_io_out_1),
    .io_out_2(M1_Config_ROM_io_out_2)
  );
  Streaming_Permute_Config Streaming_Permute_Config ( // @[FFTDesigns.scala 2344:29]
    .io_in_cnt(Streaming_Permute_Config_io_in_cnt),
    .io_out_0(Streaming_Permute_Config_io_out_0),
    .io_out_1(Streaming_Permute_Config_io_out_1)
  );
  assign io_out_0_Re = RAM_Block_3_io_out_data_Re; // @[FFTDesigns.scala 2346:30 2370:19 2389:19]
  assign io_out_0_Im = RAM_Block_3_io_out_data_Im; // @[FFTDesigns.scala 2346:30 2370:19 2389:19]
  assign io_out_1_Re = RAM_Block_4_io_out_data_Re; // @[FFTDesigns.scala 2346:30 2370:19 2389:19]
  assign io_out_1_Im = RAM_Block_4_io_out_data_Im; // @[FFTDesigns.scala 2346:30 2370:19 2389:19]
  assign io_out_2_Re = RAM_Block_5_io_out_data_Re; // @[FFTDesigns.scala 2346:30 2370:19 2389:19]
  assign io_out_2_Im = RAM_Block_5_io_out_data_Im; // @[FFTDesigns.scala 2346:30 2370:19 2389:19]
  assign RAM_Block_clock = clock;
  assign RAM_Block_io_in_raddr = _T_1 ? _T_8 : 5'h0; // @[FFTDesigns.scala 2346:30 2361:24 2380:24]
  assign RAM_Block_io_in_waddr = _T_1 ? _T_11 : 5'h0; // @[FFTDesigns.scala 2346:30 2362:24 2381:24]
  assign RAM_Block_io_in_data_Re = io_in_0_Re; // @[FFTDesigns.scala 2346:30 2363:23 2382:23]
  assign RAM_Block_io_in_data_Im = io_in_0_Im; // @[FFTDesigns.scala 2346:30 2363:23 2382:23]
  assign RAM_Block_io_re = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_io_wr = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_io_en = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_1_clock = clock;
  assign RAM_Block_1_io_in_raddr = _T_1 ? _T_22 : 5'h0; // @[FFTDesigns.scala 2346:30 2361:24 2380:24]
  assign RAM_Block_1_io_in_waddr = _T_1 ? _T_11 : 5'h0; // @[FFTDesigns.scala 2346:30 2362:24 2381:24]
  assign RAM_Block_1_io_in_data_Re = io_in_1_Re; // @[FFTDesigns.scala 2346:30 2363:23 2382:23]
  assign RAM_Block_1_io_in_data_Im = io_in_1_Im; // @[FFTDesigns.scala 2346:30 2363:23 2382:23]
  assign RAM_Block_1_io_re = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_1_io_wr = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_1_io_en = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_2_clock = clock;
  assign RAM_Block_2_io_in_raddr = _T_1 ? _T_36 : 5'h0; // @[FFTDesigns.scala 2346:30 2361:24 2380:24]
  assign RAM_Block_2_io_in_waddr = _T_1 ? _T_11 : 5'h0; // @[FFTDesigns.scala 2346:30 2362:24 2381:24]
  assign RAM_Block_2_io_in_data_Re = io_in_2_Re; // @[FFTDesigns.scala 2346:30 2363:23 2382:23]
  assign RAM_Block_2_io_in_data_Im = io_in_2_Im; // @[FFTDesigns.scala 2346:30 2363:23 2382:23]
  assign RAM_Block_2_io_re = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_2_io_wr = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_2_io_en = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_3_clock = clock;
  assign RAM_Block_3_io_in_raddr = _T_1 ? _T_15 : 5'h0; // @[FFTDesigns.scala 2346:30 2364:24 2383:24]
  assign RAM_Block_3_io_in_waddr = _T_1 ? _T_18 : 5'h0; // @[FFTDesigns.scala 2346:30 2365:24 2384:24]
  assign RAM_Block_3_io_in_data_Re = PermutationModuleStreamed_io_out_0_Re; // @[FFTDesigns.scala 2346:30 2366:23 2385:23]
  assign RAM_Block_3_io_in_data_Im = PermutationModuleStreamed_io_out_0_Im; // @[FFTDesigns.scala 2346:30 2366:23 2385:23]
  assign RAM_Block_3_io_re = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_3_io_wr = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_3_io_en = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_4_clock = clock;
  assign RAM_Block_4_io_in_raddr = _T_1 ? _T_15 : 5'h0; // @[FFTDesigns.scala 2346:30 2364:24 2383:24]
  assign RAM_Block_4_io_in_waddr = _T_1 ? _T_32 : 5'h0; // @[FFTDesigns.scala 2346:30 2365:24 2384:24]
  assign RAM_Block_4_io_in_data_Re = PermutationModuleStreamed_io_out_1_Re; // @[FFTDesigns.scala 2346:30 2366:23 2385:23]
  assign RAM_Block_4_io_in_data_Im = PermutationModuleStreamed_io_out_1_Im; // @[FFTDesigns.scala 2346:30 2366:23 2385:23]
  assign RAM_Block_4_io_re = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_4_io_wr = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_4_io_en = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_5_clock = clock;
  assign RAM_Block_5_io_in_raddr = _T_1 ? _T_15 : 5'h0; // @[FFTDesigns.scala 2346:30 2364:24 2383:24]
  assign RAM_Block_5_io_in_waddr = _T_1 ? _T_46 : 5'h0; // @[FFTDesigns.scala 2346:30 2365:24 2384:24]
  assign RAM_Block_5_io_in_data_Re = PermutationModuleStreamed_io_out_2_Re; // @[FFTDesigns.scala 2346:30 2366:23 2385:23]
  assign RAM_Block_5_io_in_data_Im = PermutationModuleStreamed_io_out_2_Im; // @[FFTDesigns.scala 2346:30 2366:23 2385:23]
  assign RAM_Block_5_io_re = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_5_io_wr = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_5_io_en = |_T; // @[FFTDesigns.scala 2346:26]
  assign PermutationModuleStreamed_io_in_0_Re = RAM_Block_io_out_data_Re; // @[FFTDesigns.scala 2346:30 2368:24 2387:24]
  assign PermutationModuleStreamed_io_in_0_Im = RAM_Block_io_out_data_Im; // @[FFTDesigns.scala 2346:30 2368:24 2387:24]
  assign PermutationModuleStreamed_io_in_1_Re = RAM_Block_1_io_out_data_Re; // @[FFTDesigns.scala 2346:30 2368:24 2387:24]
  assign PermutationModuleStreamed_io_in_1_Im = RAM_Block_1_io_out_data_Im; // @[FFTDesigns.scala 2346:30 2368:24 2387:24]
  assign PermutationModuleStreamed_io_in_2_Re = RAM_Block_2_io_out_data_Re; // @[FFTDesigns.scala 2346:30 2368:24 2387:24]
  assign PermutationModuleStreamed_io_in_2_Im = RAM_Block_2_io_out_data_Im; // @[FFTDesigns.scala 2346:30 2368:24 2387:24]
  assign PermutationModuleStreamed_io_in_config_0 = Streaming_Permute_Config_io_out_0; // @[FFTDesigns.scala 2346:30 2367:31 2386:31]
  assign PermutationModuleStreamed_io_in_config_1 = Streaming_Permute_Config_io_out_1; // @[FFTDesigns.scala 2346:30 2367:31 2386:31]
  assign M0_Config_ROM_io_in_cnt = cnt; // @[FFTDesigns.scala 2394:22]
  assign M1_Config_ROM_io_in_cnt = cnt; // @[FFTDesigns.scala 2395:22]
  assign Streaming_Permute_Config_io_in_cnt = cnt; // @[FFTDesigns.scala 2396:24]
  always @(posedge clock) begin
    offset_switch <= _T_1 & _GEN_2; // @[FFTDesigns.scala 2346:30 2391:21]
    if (reset) begin // @[FFTDesigns.scala 2345:22]
      cnt <= 4'h0; // @[FFTDesigns.scala 2345:22]
    end else if (_T_1) begin // @[FFTDesigns.scala 2346:30]
      if (cnt == 4'h8) begin // @[FFTDesigns.scala 2347:32]
        cnt <= 4'h0; // @[FFTDesigns.scala 2348:13]
      end else begin
        cnt <= _cnt_T_1; // @[FFTDesigns.scala 2351:13]
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
  cnt = _RAND_1[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module M0_Config_ROM_1(
  input  [3:0] io_in_cnt,
  output [4:0] io_out_0,
  output [4:0] io_out_1,
  output [4:0] io_out_2
);
  wire [4:0] _GEN_1 = 4'h1 == io_in_cnt ? 5'h3 : 5'h0; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_2 = 4'h2 == io_in_cnt ? 5'h6 : _GEN_1; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_3 = 4'h3 == io_in_cnt ? 5'h2 : _GEN_2; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_4 = 4'h4 == io_in_cnt ? 5'h5 : _GEN_3; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_5 = 4'h5 == io_in_cnt ? 5'h8 : _GEN_4; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_6 = 4'h6 == io_in_cnt ? 5'h1 : _GEN_5; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_7 = 4'h7 == io_in_cnt ? 5'h4 : _GEN_6; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_10 = 4'h1 == io_in_cnt ? 5'h4 : 5'h1; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_11 = 4'h2 == io_in_cnt ? 5'h7 : _GEN_10; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_12 = 4'h3 == io_in_cnt ? 5'h0 : _GEN_11; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_13 = 4'h4 == io_in_cnt ? 5'h3 : _GEN_12; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_14 = 4'h5 == io_in_cnt ? 5'h6 : _GEN_13; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_15 = 4'h6 == io_in_cnt ? 5'h2 : _GEN_14; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_16 = 4'h7 == io_in_cnt ? 5'h5 : _GEN_15; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_19 = 4'h1 == io_in_cnt ? 5'h5 : 5'h2; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_20 = 4'h2 == io_in_cnt ? 5'h8 : _GEN_19; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_21 = 4'h3 == io_in_cnt ? 5'h1 : _GEN_20; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_22 = 4'h4 == io_in_cnt ? 5'h4 : _GEN_21; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_23 = 4'h5 == io_in_cnt ? 5'h7 : _GEN_22; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_24 = 4'h6 == io_in_cnt ? 5'h0 : _GEN_23; // @[FFTDesigns.scala 2600:{17,17}]
  wire [4:0] _GEN_25 = 4'h7 == io_in_cnt ? 5'h3 : _GEN_24; // @[FFTDesigns.scala 2600:{17,17}]
  assign io_out_0 = 4'h8 == io_in_cnt ? 5'h7 : _GEN_7; // @[FFTDesigns.scala 2600:{17,17}]
  assign io_out_1 = 4'h8 == io_in_cnt ? 5'h8 : _GEN_16; // @[FFTDesigns.scala 2600:{17,17}]
  assign io_out_2 = 4'h8 == io_in_cnt ? 5'h6 : _GEN_25; // @[FFTDesigns.scala 2600:{17,17}]
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
`endif // RANDOMIZE_REG_INIT
  wire  RAM_Block_clock; // @[FFTDesigns.scala 2334:24]
  wire [4:0] RAM_Block_io_in_raddr; // @[FFTDesigns.scala 2334:24]
  wire [4:0] RAM_Block_io_in_waddr; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_io_in_data_Re; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_io_in_data_Im; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_io_re; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_io_wr; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_io_en; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_io_out_data_Re; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_io_out_data_Im; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_1_clock; // @[FFTDesigns.scala 2334:24]
  wire [4:0] RAM_Block_1_io_in_raddr; // @[FFTDesigns.scala 2334:24]
  wire [4:0] RAM_Block_1_io_in_waddr; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_1_io_in_data_Re; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_1_io_in_data_Im; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_1_io_re; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_1_io_wr; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_1_io_en; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_1_io_out_data_Re; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_1_io_out_data_Im; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_2_clock; // @[FFTDesigns.scala 2334:24]
  wire [4:0] RAM_Block_2_io_in_raddr; // @[FFTDesigns.scala 2334:24]
  wire [4:0] RAM_Block_2_io_in_waddr; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_2_io_in_data_Re; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_2_io_in_data_Im; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_2_io_re; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_2_io_wr; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_2_io_en; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_2_io_out_data_Re; // @[FFTDesigns.scala 2334:24]
  wire [31:0] RAM_Block_2_io_out_data_Im; // @[FFTDesigns.scala 2334:24]
  wire  RAM_Block_3_clock; // @[FFTDesigns.scala 2338:24]
  wire [4:0] RAM_Block_3_io_in_raddr; // @[FFTDesigns.scala 2338:24]
  wire [4:0] RAM_Block_3_io_in_waddr; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_3_io_in_data_Re; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_3_io_in_data_Im; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_3_io_re; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_3_io_wr; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_3_io_en; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_3_io_out_data_Re; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_3_io_out_data_Im; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_4_clock; // @[FFTDesigns.scala 2338:24]
  wire [4:0] RAM_Block_4_io_in_raddr; // @[FFTDesigns.scala 2338:24]
  wire [4:0] RAM_Block_4_io_in_waddr; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_4_io_in_data_Re; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_4_io_in_data_Im; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_4_io_re; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_4_io_wr; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_4_io_en; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_4_io_out_data_Re; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_4_io_out_data_Im; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_5_clock; // @[FFTDesigns.scala 2338:24]
  wire [4:0] RAM_Block_5_io_in_raddr; // @[FFTDesigns.scala 2338:24]
  wire [4:0] RAM_Block_5_io_in_waddr; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_5_io_in_data_Re; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_5_io_in_data_Im; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_5_io_re; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_5_io_wr; // @[FFTDesigns.scala 2338:24]
  wire  RAM_Block_5_io_en; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_5_io_out_data_Re; // @[FFTDesigns.scala 2338:24]
  wire [31:0] RAM_Block_5_io_out_data_Im; // @[FFTDesigns.scala 2338:24]
  wire [31:0] PermutationModuleStreamed_io_in_0_Re; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_in_0_Im; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_in_1_Re; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_in_1_Im; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_in_2_Re; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_in_2_Im; // @[FFTDesigns.scala 2341:26]
  wire [1:0] PermutationModuleStreamed_io_in_config_0; // @[FFTDesigns.scala 2341:26]
  wire [1:0] PermutationModuleStreamed_io_in_config_1; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_out_0_Re; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_out_0_Im; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_out_1_Re; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_out_1_Im; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_out_2_Re; // @[FFTDesigns.scala 2341:26]
  wire [31:0] PermutationModuleStreamed_io_out_2_Im; // @[FFTDesigns.scala 2341:26]
  wire [3:0] M0_Config_ROM_io_in_cnt; // @[FFTDesigns.scala 2342:27]
  wire [4:0] M0_Config_ROM_io_out_0; // @[FFTDesigns.scala 2342:27]
  wire [4:0] M0_Config_ROM_io_out_1; // @[FFTDesigns.scala 2342:27]
  wire [4:0] M0_Config_ROM_io_out_2; // @[FFTDesigns.scala 2342:27]
  wire [3:0] M1_Config_ROM_io_in_cnt; // @[FFTDesigns.scala 2343:27]
  wire [4:0] M1_Config_ROM_io_out_0; // @[FFTDesigns.scala 2343:27]
  wire [4:0] M1_Config_ROM_io_out_1; // @[FFTDesigns.scala 2343:27]
  wire [4:0] M1_Config_ROM_io_out_2; // @[FFTDesigns.scala 2343:27]
  wire [3:0] Streaming_Permute_Config_io_in_cnt; // @[FFTDesigns.scala 2344:29]
  wire [1:0] Streaming_Permute_Config_io_out_0; // @[FFTDesigns.scala 2344:29]
  wire [1:0] Streaming_Permute_Config_io_out_1; // @[FFTDesigns.scala 2344:29]
  reg  offset_switch; // @[FFTDesigns.scala 2327:28]
  wire [9:0] hi = {io_in_en_18,io_in_en_17,io_in_en_16,io_in_en_15,io_in_en_14,io_in_en_13,io_in_en_12,io_in_en_11,
    io_in_en_10,io_in_en_9}; // @[FFTDesigns.scala 2328:19]
  wire [18:0] _T = {hi,io_in_en_8,io_in_en_7,io_in_en_6,io_in_en_5,io_in_en_4,io_in_en_3,io_in_en_2,io_in_en_1,
    io_in_en_0}; // @[FFTDesigns.scala 2328:19]
  wire  _T_1 = |_T; // @[FFTDesigns.scala 2328:26]
  reg [3:0] cnt; // @[FFTDesigns.scala 2345:22]
  wire  _offset_switch_T = ~offset_switch; // @[FFTDesigns.scala 2349:26]
  wire [3:0] _cnt_T_1 = cnt + 4'h1; // @[FFTDesigns.scala 2351:20]
  wire  _GEN_2 = cnt == 4'h8 ? ~offset_switch : offset_switch; // @[FFTDesigns.scala 2347:32 2349:23 2352:23]
  wire [4:0] _T_6 = 4'h9 * _offset_switch_T; // @[FFTDesigns.scala 2361:54]
  wire [4:0] _T_8 = M0_Config_ROM_io_out_0 + _T_6; // @[FFTDesigns.scala 2361:44]
  wire [4:0] _T_9 = 4'h9 * offset_switch; // @[FFTDesigns.scala 2362:41]
  wire [4:0] _GEN_45 = {{1'd0}, cnt}; // @[FFTDesigns.scala 2362:31]
  wire [4:0] _T_11 = _GEN_45 + _T_9; // @[FFTDesigns.scala 2362:31]
  wire [4:0] _T_15 = _GEN_45 + _T_6; // @[FFTDesigns.scala 2364:31]
  wire [4:0] _T_18 = M1_Config_ROM_io_out_0 + _T_9; // @[FFTDesigns.scala 2365:44]
  wire [4:0] _T_22 = M0_Config_ROM_io_out_1 + _T_6; // @[FFTDesigns.scala 2361:44]
  wire [4:0] _T_32 = M1_Config_ROM_io_out_1 + _T_9; // @[FFTDesigns.scala 2365:44]
  wire [4:0] _T_36 = M0_Config_ROM_io_out_2 + _T_6; // @[FFTDesigns.scala 2361:44]
  wire [4:0] _T_46 = M1_Config_ROM_io_out_2 + _T_9; // @[FFTDesigns.scala 2365:44]
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
  RAM_Block RAM_Block_2 ( // @[FFTDesigns.scala 2334:24]
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
  RAM_Block RAM_Block_4 ( // @[FFTDesigns.scala 2338:24]
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
  RAM_Block RAM_Block_5 ( // @[FFTDesigns.scala 2338:24]
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
  PermutationModuleStreamed PermutationModuleStreamed ( // @[FFTDesigns.scala 2341:26]
    .io_in_0_Re(PermutationModuleStreamed_io_in_0_Re),
    .io_in_0_Im(PermutationModuleStreamed_io_in_0_Im),
    .io_in_1_Re(PermutationModuleStreamed_io_in_1_Re),
    .io_in_1_Im(PermutationModuleStreamed_io_in_1_Im),
    .io_in_2_Re(PermutationModuleStreamed_io_in_2_Re),
    .io_in_2_Im(PermutationModuleStreamed_io_in_2_Im),
    .io_in_config_0(PermutationModuleStreamed_io_in_config_0),
    .io_in_config_1(PermutationModuleStreamed_io_in_config_1),
    .io_out_0_Re(PermutationModuleStreamed_io_out_0_Re),
    .io_out_0_Im(PermutationModuleStreamed_io_out_0_Im),
    .io_out_1_Re(PermutationModuleStreamed_io_out_1_Re),
    .io_out_1_Im(PermutationModuleStreamed_io_out_1_Im),
    .io_out_2_Re(PermutationModuleStreamed_io_out_2_Re),
    .io_out_2_Im(PermutationModuleStreamed_io_out_2_Im)
  );
  M0_Config_ROM_1 M0_Config_ROM ( // @[FFTDesigns.scala 2342:27]
    .io_in_cnt(M0_Config_ROM_io_in_cnt),
    .io_out_0(M0_Config_ROM_io_out_0),
    .io_out_1(M0_Config_ROM_io_out_1),
    .io_out_2(M0_Config_ROM_io_out_2)
  );
  M1_Config_ROM M1_Config_ROM ( // @[FFTDesigns.scala 2343:27]
    .io_in_cnt(M1_Config_ROM_io_in_cnt),
    .io_out_0(M1_Config_ROM_io_out_0),
    .io_out_1(M1_Config_ROM_io_out_1),
    .io_out_2(M1_Config_ROM_io_out_2)
  );
  Streaming_Permute_Config Streaming_Permute_Config ( // @[FFTDesigns.scala 2344:29]
    .io_in_cnt(Streaming_Permute_Config_io_in_cnt),
    .io_out_0(Streaming_Permute_Config_io_out_0),
    .io_out_1(Streaming_Permute_Config_io_out_1)
  );
  assign io_out_0_Re = RAM_Block_3_io_out_data_Re; // @[FFTDesigns.scala 2346:30 2370:19 2389:19]
  assign io_out_0_Im = RAM_Block_3_io_out_data_Im; // @[FFTDesigns.scala 2346:30 2370:19 2389:19]
  assign io_out_1_Re = RAM_Block_4_io_out_data_Re; // @[FFTDesigns.scala 2346:30 2370:19 2389:19]
  assign io_out_1_Im = RAM_Block_4_io_out_data_Im; // @[FFTDesigns.scala 2346:30 2370:19 2389:19]
  assign io_out_2_Re = RAM_Block_5_io_out_data_Re; // @[FFTDesigns.scala 2346:30 2370:19 2389:19]
  assign io_out_2_Im = RAM_Block_5_io_out_data_Im; // @[FFTDesigns.scala 2346:30 2370:19 2389:19]
  assign RAM_Block_clock = clock;
  assign RAM_Block_io_in_raddr = _T_1 ? _T_8 : 5'h0; // @[FFTDesigns.scala 2346:30 2361:24 2380:24]
  assign RAM_Block_io_in_waddr = _T_1 ? _T_11 : 5'h0; // @[FFTDesigns.scala 2346:30 2362:24 2381:24]
  assign RAM_Block_io_in_data_Re = io_in_0_Re; // @[FFTDesigns.scala 2346:30 2363:23 2382:23]
  assign RAM_Block_io_in_data_Im = io_in_0_Im; // @[FFTDesigns.scala 2346:30 2363:23 2382:23]
  assign RAM_Block_io_re = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_io_wr = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_io_en = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_1_clock = clock;
  assign RAM_Block_1_io_in_raddr = _T_1 ? _T_22 : 5'h0; // @[FFTDesigns.scala 2346:30 2361:24 2380:24]
  assign RAM_Block_1_io_in_waddr = _T_1 ? _T_11 : 5'h0; // @[FFTDesigns.scala 2346:30 2362:24 2381:24]
  assign RAM_Block_1_io_in_data_Re = io_in_1_Re; // @[FFTDesigns.scala 2346:30 2363:23 2382:23]
  assign RAM_Block_1_io_in_data_Im = io_in_1_Im; // @[FFTDesigns.scala 2346:30 2363:23 2382:23]
  assign RAM_Block_1_io_re = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_1_io_wr = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_1_io_en = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_2_clock = clock;
  assign RAM_Block_2_io_in_raddr = _T_1 ? _T_36 : 5'h0; // @[FFTDesigns.scala 2346:30 2361:24 2380:24]
  assign RAM_Block_2_io_in_waddr = _T_1 ? _T_11 : 5'h0; // @[FFTDesigns.scala 2346:30 2362:24 2381:24]
  assign RAM_Block_2_io_in_data_Re = io_in_2_Re; // @[FFTDesigns.scala 2346:30 2363:23 2382:23]
  assign RAM_Block_2_io_in_data_Im = io_in_2_Im; // @[FFTDesigns.scala 2346:30 2363:23 2382:23]
  assign RAM_Block_2_io_re = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_2_io_wr = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_2_io_en = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_3_clock = clock;
  assign RAM_Block_3_io_in_raddr = _T_1 ? _T_15 : 5'h0; // @[FFTDesigns.scala 2346:30 2364:24 2383:24]
  assign RAM_Block_3_io_in_waddr = _T_1 ? _T_18 : 5'h0; // @[FFTDesigns.scala 2346:30 2365:24 2384:24]
  assign RAM_Block_3_io_in_data_Re = PermutationModuleStreamed_io_out_0_Re; // @[FFTDesigns.scala 2346:30 2366:23 2385:23]
  assign RAM_Block_3_io_in_data_Im = PermutationModuleStreamed_io_out_0_Im; // @[FFTDesigns.scala 2346:30 2366:23 2385:23]
  assign RAM_Block_3_io_re = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_3_io_wr = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_3_io_en = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_4_clock = clock;
  assign RAM_Block_4_io_in_raddr = _T_1 ? _T_15 : 5'h0; // @[FFTDesigns.scala 2346:30 2364:24 2383:24]
  assign RAM_Block_4_io_in_waddr = _T_1 ? _T_32 : 5'h0; // @[FFTDesigns.scala 2346:30 2365:24 2384:24]
  assign RAM_Block_4_io_in_data_Re = PermutationModuleStreamed_io_out_1_Re; // @[FFTDesigns.scala 2346:30 2366:23 2385:23]
  assign RAM_Block_4_io_in_data_Im = PermutationModuleStreamed_io_out_1_Im; // @[FFTDesigns.scala 2346:30 2366:23 2385:23]
  assign RAM_Block_4_io_re = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_4_io_wr = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_4_io_en = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_5_clock = clock;
  assign RAM_Block_5_io_in_raddr = _T_1 ? _T_15 : 5'h0; // @[FFTDesigns.scala 2346:30 2364:24 2383:24]
  assign RAM_Block_5_io_in_waddr = _T_1 ? _T_46 : 5'h0; // @[FFTDesigns.scala 2346:30 2365:24 2384:24]
  assign RAM_Block_5_io_in_data_Re = PermutationModuleStreamed_io_out_2_Re; // @[FFTDesigns.scala 2346:30 2366:23 2385:23]
  assign RAM_Block_5_io_in_data_Im = PermutationModuleStreamed_io_out_2_Im; // @[FFTDesigns.scala 2346:30 2366:23 2385:23]
  assign RAM_Block_5_io_re = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_5_io_wr = |_T; // @[FFTDesigns.scala 2346:26]
  assign RAM_Block_5_io_en = |_T; // @[FFTDesigns.scala 2346:26]
  assign PermutationModuleStreamed_io_in_0_Re = RAM_Block_io_out_data_Re; // @[FFTDesigns.scala 2346:30 2368:24 2387:24]
  assign PermutationModuleStreamed_io_in_0_Im = RAM_Block_io_out_data_Im; // @[FFTDesigns.scala 2346:30 2368:24 2387:24]
  assign PermutationModuleStreamed_io_in_1_Re = RAM_Block_1_io_out_data_Re; // @[FFTDesigns.scala 2346:30 2368:24 2387:24]
  assign PermutationModuleStreamed_io_in_1_Im = RAM_Block_1_io_out_data_Im; // @[FFTDesigns.scala 2346:30 2368:24 2387:24]
  assign PermutationModuleStreamed_io_in_2_Re = RAM_Block_2_io_out_data_Re; // @[FFTDesigns.scala 2346:30 2368:24 2387:24]
  assign PermutationModuleStreamed_io_in_2_Im = RAM_Block_2_io_out_data_Im; // @[FFTDesigns.scala 2346:30 2368:24 2387:24]
  assign PermutationModuleStreamed_io_in_config_0 = Streaming_Permute_Config_io_out_0; // @[FFTDesigns.scala 2346:30 2367:31 2386:31]
  assign PermutationModuleStreamed_io_in_config_1 = Streaming_Permute_Config_io_out_1; // @[FFTDesigns.scala 2346:30 2367:31 2386:31]
  assign M0_Config_ROM_io_in_cnt = cnt; // @[FFTDesigns.scala 2394:22]
  assign M1_Config_ROM_io_in_cnt = cnt; // @[FFTDesigns.scala 2395:22]
  assign Streaming_Permute_Config_io_in_cnt = cnt; // @[FFTDesigns.scala 2396:24]
  always @(posedge clock) begin
    offset_switch <= _T_1 & _GEN_2; // @[FFTDesigns.scala 2346:30 2391:21]
    if (reset) begin // @[FFTDesigns.scala 2345:22]
      cnt <= 4'h0; // @[FFTDesigns.scala 2345:22]
    end else if (_T_1) begin // @[FFTDesigns.scala 2346:30]
      if (cnt == 4'h8) begin // @[FFTDesigns.scala 2347:32]
        cnt <= 4'h0; // @[FFTDesigns.scala 2348:13]
      end else begin
        cnt <= _cnt_T_1; // @[FFTDesigns.scala 2351:13]
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
  cnt = _RAND_1[3:0];
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
  output [31:0] io_out_data_2_Re,
  output [31:0] io_out_data_2_Im
);
  wire [31:0] _GEN_21 = 4'h3 == io_in_addr[3:0] ? 32'h3f441b7c : 32'h3f800000; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_22 = 4'h4 == io_in_addr[3:0] ? 32'h3f441b7c : _GEN_21; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_23 = 4'h5 == io_in_addr[3:0] ? 32'h3f441b7c : _GEN_22; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_24 = 4'h6 == io_in_addr[3:0] ? 32'h3e31d0d0 : _GEN_23; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_25 = 4'h7 == io_in_addr[3:0] ? 32'h3e31d0d0 : _GEN_24; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_30 = 4'h3 == io_in_addr[3:0] ? 32'hbf248dba : 32'h80800000; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_31 = 4'h4 == io_in_addr[3:0] ? 32'hbf248dba : _GEN_30; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_32 = 4'h5 == io_in_addr[3:0] ? 32'hbf248dba : _GEN_31; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_33 = 4'h6 == io_in_addr[3:0] ? 32'hbf7c1c5c : _GEN_32; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_34 = 4'h7 == io_in_addr[3:0] ? 32'hbf7c1c5c : _GEN_33; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_39 = 4'h3 == io_in_addr[3:0] ? 32'h3e31d0d0 : 32'h3f800000; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_40 = 4'h4 == io_in_addr[3:0] ? 32'h3e31d0d0 : _GEN_39; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_41 = 4'h5 == io_in_addr[3:0] ? 32'h3e31d0d0 : _GEN_40; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_42 = 4'h6 == io_in_addr[3:0] ? 32'hbf708fb2 : _GEN_41; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_43 = 4'h7 == io_in_addr[3:0] ? 32'hbf708fb2 : _GEN_42; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_48 = 4'h3 == io_in_addr[3:0] ? 32'hbf7c1c5c : 32'h80800000; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_49 = 4'h4 == io_in_addr[3:0] ? 32'hbf7c1c5c : _GEN_48; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_50 = 4'h5 == io_in_addr[3:0] ? 32'hbf7c1c5c : _GEN_49; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_51 = 4'h6 == io_in_addr[3:0] ? 32'hbeaf1d40 : _GEN_50; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_52 = 4'h7 == io_in_addr[3:0] ? 32'hbeaf1d40 : _GEN_51; // @[FFTDesigns.scala 2059:{25,25}]
  assign io_out_data_1_Re = 4'h8 == io_in_addr[3:0] ? 32'h3e31d0d0 : _GEN_25; // @[FFTDesigns.scala 2058:{25,25}]
  assign io_out_data_1_Im = 4'h8 == io_in_addr[3:0] ? 32'hbf7c1c5c : _GEN_34; // @[FFTDesigns.scala 2059:{25,25}]
  assign io_out_data_2_Re = 4'h8 == io_in_addr[3:0] ? 32'hbf708fb2 : _GEN_43; // @[FFTDesigns.scala 2058:{25,25}]
  assign io_out_data_2_Im = 4'h8 == io_in_addr[3:0] ? 32'hbeaf1d40 : _GEN_52; // @[FFTDesigns.scala 2059:{25,25}]
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
module TwiddleFactorsStreamed(
  input         clock,
  input         reset,
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  input  [31:0] io_in_2_Re,
  input  [31:0] io_in_2_Im,
  input         io_in_en_0,
  input         io_in_en_1,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im,
  output [31:0] io_out_2_Re,
  output [31:0] io_out_2_Im
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [4:0] TwiddleFactorROM_io_in_addr; // @[FFTDesigns.scala 2072:26]
  wire [31:0] TwiddleFactorROM_io_out_data_1_Re; // @[FFTDesigns.scala 2072:26]
  wire [31:0] TwiddleFactorROM_io_out_data_1_Im; // @[FFTDesigns.scala 2072:26]
  wire [31:0] TwiddleFactorROM_io_out_data_2_Re; // @[FFTDesigns.scala 2072:26]
  wire [31:0] TwiddleFactorROM_io_out_data_2_Im; // @[FFTDesigns.scala 2072:26]
  wire  FPComplexMult_clock; // @[FFTDesigns.scala 2087:30]
  wire  FPComplexMult_reset; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_io_in_a_Re; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_io_in_a_Im; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_io_in_b_Re; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_io_in_b_Im; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_io_out_s_Re; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_io_out_s_Im; // @[FFTDesigns.scala 2087:30]
  wire  FPComplexMult_1_clock; // @[FFTDesigns.scala 2087:30]
  wire  FPComplexMult_1_reset; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_1_io_in_a_Re; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_1_io_in_a_Im; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_1_io_in_b_Re; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_1_io_in_b_Im; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_1_io_out_s_Re; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_1_io_out_s_Im; // @[FFTDesigns.scala 2087:30]
  wire  FPComplexMult_2_clock; // @[FFTDesigns.scala 2087:30]
  wire  FPComplexMult_2_reset; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_2_io_in_a_Re; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_2_io_in_a_Im; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_2_io_in_b_Re; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_2_io_in_b_Im; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_2_io_out_s_Re; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_2_io_out_s_Im; // @[FFTDesigns.scala 2087:30]
  reg [3:0] cnt; // @[FFTDesigns.scala 2080:24]
  wire [1:0] _T = {io_in_en_1,io_in_en_0}; // @[FFTDesigns.scala 2081:21]
  wire  _T_1 = |_T; // @[FFTDesigns.scala 2081:28]
  wire [3:0] _cnt_T_1 = cnt + 4'h1; // @[FFTDesigns.scala 2094:22]
  TwiddleFactorROM TwiddleFactorROM ( // @[FFTDesigns.scala 2072:26]
    .io_in_addr(TwiddleFactorROM_io_in_addr),
    .io_out_data_1_Re(TwiddleFactorROM_io_out_data_1_Re),
    .io_out_data_1_Im(TwiddleFactorROM_io_out_data_1_Im),
    .io_out_data_2_Re(TwiddleFactorROM_io_out_data_2_Re),
    .io_out_data_2_Im(TwiddleFactorROM_io_out_data_2_Im)
  );
  FPComplexMult FPComplexMult ( // @[FFTDesigns.scala 2087:30]
    .clock(FPComplexMult_clock),
    .reset(FPComplexMult_reset),
    .io_in_a_Re(FPComplexMult_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_io_out_s_Im)
  );
  FPComplexMult FPComplexMult_1 ( // @[FFTDesigns.scala 2087:30]
    .clock(FPComplexMult_1_clock),
    .reset(FPComplexMult_1_reset),
    .io_in_a_Re(FPComplexMult_1_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_1_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_1_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_1_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_1_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_1_io_out_s_Im)
  );
  FPComplexMult FPComplexMult_2 ( // @[FFTDesigns.scala 2087:30]
    .clock(FPComplexMult_2_clock),
    .reset(FPComplexMult_2_reset),
    .io_in_a_Re(FPComplexMult_2_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_2_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_2_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_2_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_2_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_2_io_out_s_Im)
  );
  assign io_out_0_Re = FPComplexMult_io_out_s_Re; // @[FFTDesigns.scala 2108:19]
  assign io_out_0_Im = FPComplexMult_io_out_s_Im; // @[FFTDesigns.scala 2108:19]
  assign io_out_1_Re = FPComplexMult_1_io_out_s_Re; // @[FFTDesigns.scala 2108:19]
  assign io_out_1_Im = FPComplexMult_1_io_out_s_Im; // @[FFTDesigns.scala 2108:19]
  assign io_out_2_Re = FPComplexMult_2_io_out_s_Re; // @[FFTDesigns.scala 2108:19]
  assign io_out_2_Im = FPComplexMult_2_io_out_s_Im; // @[FFTDesigns.scala 2108:19]
  assign TwiddleFactorROM_io_in_addr = {{1'd0}, cnt}; // @[FFTDesigns.scala 2110:24]
  assign FPComplexMult_clock = clock;
  assign FPComplexMult_reset = reset;
  assign FPComplexMult_io_in_a_Re = _T_1 ? io_in_0_Re : 32'h0; // @[FFTDesigns.scala 2090:32 2097:31 2102:31]
  assign FPComplexMult_io_in_a_Im = _T_1 ? io_in_0_Im : 32'h0; // @[FFTDesigns.scala 2090:32 2097:31 2102:31]
  assign FPComplexMult_io_in_b_Re = _T_1 ? 32'h3f800000 : 32'h0; // @[FFTDesigns.scala 2090:32 2098:31 2103:31]
  assign FPComplexMult_io_in_b_Im = _T_1 ? 32'h80800000 : 32'h0; // @[FFTDesigns.scala 2090:32 2098:31 2103:31]
  assign FPComplexMult_1_clock = clock;
  assign FPComplexMult_1_reset = reset;
  assign FPComplexMult_1_io_in_a_Re = _T_1 ? io_in_1_Re : 32'h0; // @[FFTDesigns.scala 2090:32 2097:31 2102:31]
  assign FPComplexMult_1_io_in_a_Im = _T_1 ? io_in_1_Im : 32'h0; // @[FFTDesigns.scala 2090:32 2097:31 2102:31]
  assign FPComplexMult_1_io_in_b_Re = _T_1 ? TwiddleFactorROM_io_out_data_1_Re : 32'h0; // @[FFTDesigns.scala 2090:32 2098:31 2103:31]
  assign FPComplexMult_1_io_in_b_Im = _T_1 ? TwiddleFactorROM_io_out_data_1_Im : 32'h0; // @[FFTDesigns.scala 2090:32 2098:31 2103:31]
  assign FPComplexMult_2_clock = clock;
  assign FPComplexMult_2_reset = reset;
  assign FPComplexMult_2_io_in_a_Re = _T_1 ? io_in_2_Re : 32'h0; // @[FFTDesigns.scala 2090:32 2097:31 2102:31]
  assign FPComplexMult_2_io_in_a_Im = _T_1 ? io_in_2_Im : 32'h0; // @[FFTDesigns.scala 2090:32 2097:31 2102:31]
  assign FPComplexMult_2_io_in_b_Re = _T_1 ? TwiddleFactorROM_io_out_data_2_Re : 32'h0; // @[FFTDesigns.scala 2090:32 2098:31 2103:31]
  assign FPComplexMult_2_io_in_b_Im = _T_1 ? TwiddleFactorROM_io_out_data_2_Im : 32'h0; // @[FFTDesigns.scala 2090:32 2098:31 2103:31]
  always @(posedge clock) begin
    if (reset) begin // @[FFTDesigns.scala 2080:24]
      cnt <= 4'h0; // @[FFTDesigns.scala 2080:24]
    end else if (_T_1) begin // @[FFTDesigns.scala 2090:32]
      if (cnt == 4'h8) begin // @[FFTDesigns.scala 2091:34]
        cnt <= 4'h0; // @[FFTDesigns.scala 2092:15]
      end else begin
        cnt <= _cnt_T_1; // @[FFTDesigns.scala 2094:15]
      end
    end else begin
      cnt <= 4'h0; // @[FFTDesigns.scala 2105:13]
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
  output [31:0] io_out_data_2_Re,
  output [31:0] io_out_data_2_Im
);
  wire [31:0] _GEN_19 = 4'h1 == io_in_addr[3:0] ? 32'h3f791976 : 32'h3f800000; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_20 = 4'h2 == io_in_addr[3:0] ? 32'h3f64c51a : _GEN_19; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_21 = 4'h3 == io_in_addr[3:0] ? 32'h3f441b7c : _GEN_20; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_22 = 4'h4 == io_in_addr[3:0] ? 32'h3f18df62 : _GEN_21; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_23 = 4'h5 == io_in_addr[3:0] ? 32'h3ecacaf4 : _GEN_22; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_24 = 4'h6 == io_in_addr[3:0] ? 32'h3e31d0d0 : _GEN_23; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_25 = 4'h7 == io_in_addr[3:0] ? 32'hbd6e2940 : _GEN_24; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_28 = 4'h1 == io_in_addr[3:0] ? 32'hbe6c2690 : 32'h80800000; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_29 = 4'h2 == io_in_addr[3:0] ? 32'hbee5c900 : _GEN_28; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_30 = 4'h3 == io_in_addr[3:0] ? 32'hbf248dba : _GEN_29; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_31 = 4'h4 == io_in_addr[3:0] ? 32'hbf4d57f2 : _GEN_30; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_32 = 4'h5 == io_in_addr[3:0] ? 32'hbf6b1034 : _GEN_31; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_33 = 4'h6 == io_in_addr[3:0] ? 32'hbf7c1c5c : _GEN_32; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_34 = 4'h7 == io_in_addr[3:0] ? 32'hbf7f911e : _GEN_33; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_37 = 4'h1 == io_in_addr[3:0] ? 32'h3f64c51a : 32'h3f800000; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_38 = 4'h2 == io_in_addr[3:0] ? 32'h3f18df62 : _GEN_37; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_39 = 4'h3 == io_in_addr[3:0] ? 32'h3e31d0d0 : _GEN_38; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_40 = 4'h4 == io_in_addr[3:0] ? 32'hbe92d7dc : _GEN_39; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_41 = 4'h5 == io_in_addr[3:0] ? 32'hbf2fad88 : _GEN_40; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_42 = 4'h6 == io_in_addr[3:0] ? 32'hbf708fb2 : _GEN_41; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_43 = 4'h7 == io_in_addr[3:0] ? 32'hbf7e44de : _GEN_42; // @[FFTDesigns.scala 2058:{25,25}]
  wire [31:0] _GEN_46 = 4'h1 == io_in_addr[3:0] ? 32'hbee5c900 : 32'h80800000; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_47 = 4'h2 == io_in_addr[3:0] ? 32'hbf4d57f2 : _GEN_46; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_48 = 4'h3 == io_in_addr[3:0] ? 32'hbf7c1c5c : _GEN_47; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_49 = 4'h4 == io_in_addr[3:0] ? 32'hbf753ecc : _GEN_48; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_50 = 4'h5 == io_in_addr[3:0] ? 32'hbf3a3528 : _GEN_49; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_51 = 4'h6 == io_in_addr[3:0] ? 32'hbeaf1d40 : _GEN_50; // @[FFTDesigns.scala 2059:{25,25}]
  wire [31:0] _GEN_52 = 4'h7 == io_in_addr[3:0] ? 32'h3dedc210 : _GEN_51; // @[FFTDesigns.scala 2059:{25,25}]
  assign io_out_data_1_Re = 4'h8 == io_in_addr[3:0] ? 32'hbe92d7dc : _GEN_25; // @[FFTDesigns.scala 2058:{25,25}]
  assign io_out_data_1_Im = 4'h8 == io_in_addr[3:0] ? 32'hbf753ecc : _GEN_34; // @[FFTDesigns.scala 2059:{25,25}]
  assign io_out_data_2_Re = 4'h8 == io_in_addr[3:0] ? 32'hbf55e286 : _GEN_43; // @[FFTDesigns.scala 2058:{25,25}]
  assign io_out_data_2_Im = 4'h8 == io_in_addr[3:0] ? 32'h3f0cac9e : _GEN_52; // @[FFTDesigns.scala 2059:{25,25}]
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
  input         io_in_en_0,
  input         io_in_en_1,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im,
  output [31:0] io_out_2_Re,
  output [31:0] io_out_2_Im
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [4:0] TwiddleFactorROM_io_in_addr; // @[FFTDesigns.scala 2072:26]
  wire [31:0] TwiddleFactorROM_io_out_data_1_Re; // @[FFTDesigns.scala 2072:26]
  wire [31:0] TwiddleFactorROM_io_out_data_1_Im; // @[FFTDesigns.scala 2072:26]
  wire [31:0] TwiddleFactorROM_io_out_data_2_Re; // @[FFTDesigns.scala 2072:26]
  wire [31:0] TwiddleFactorROM_io_out_data_2_Im; // @[FFTDesigns.scala 2072:26]
  wire  FPComplexMult_clock; // @[FFTDesigns.scala 2087:30]
  wire  FPComplexMult_reset; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_io_in_a_Re; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_io_in_a_Im; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_io_in_b_Re; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_io_in_b_Im; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_io_out_s_Re; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_io_out_s_Im; // @[FFTDesigns.scala 2087:30]
  wire  FPComplexMult_1_clock; // @[FFTDesigns.scala 2087:30]
  wire  FPComplexMult_1_reset; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_1_io_in_a_Re; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_1_io_in_a_Im; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_1_io_in_b_Re; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_1_io_in_b_Im; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_1_io_out_s_Re; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_1_io_out_s_Im; // @[FFTDesigns.scala 2087:30]
  wire  FPComplexMult_2_clock; // @[FFTDesigns.scala 2087:30]
  wire  FPComplexMult_2_reset; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_2_io_in_a_Re; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_2_io_in_a_Im; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_2_io_in_b_Re; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_2_io_in_b_Im; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_2_io_out_s_Re; // @[FFTDesigns.scala 2087:30]
  wire [31:0] FPComplexMult_2_io_out_s_Im; // @[FFTDesigns.scala 2087:30]
  reg [3:0] cnt; // @[FFTDesigns.scala 2080:24]
  wire [1:0] _T = {io_in_en_1,io_in_en_0}; // @[FFTDesigns.scala 2081:21]
  wire  _T_1 = |_T; // @[FFTDesigns.scala 2081:28]
  wire [3:0] _cnt_T_1 = cnt + 4'h1; // @[FFTDesigns.scala 2094:22]
  TwiddleFactorROM_1 TwiddleFactorROM ( // @[FFTDesigns.scala 2072:26]
    .io_in_addr(TwiddleFactorROM_io_in_addr),
    .io_out_data_1_Re(TwiddleFactorROM_io_out_data_1_Re),
    .io_out_data_1_Im(TwiddleFactorROM_io_out_data_1_Im),
    .io_out_data_2_Re(TwiddleFactorROM_io_out_data_2_Re),
    .io_out_data_2_Im(TwiddleFactorROM_io_out_data_2_Im)
  );
  FPComplexMult FPComplexMult ( // @[FFTDesigns.scala 2087:30]
    .clock(FPComplexMult_clock),
    .reset(FPComplexMult_reset),
    .io_in_a_Re(FPComplexMult_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_io_out_s_Im)
  );
  FPComplexMult FPComplexMult_1 ( // @[FFTDesigns.scala 2087:30]
    .clock(FPComplexMult_1_clock),
    .reset(FPComplexMult_1_reset),
    .io_in_a_Re(FPComplexMult_1_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_1_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_1_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_1_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_1_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_1_io_out_s_Im)
  );
  FPComplexMult FPComplexMult_2 ( // @[FFTDesigns.scala 2087:30]
    .clock(FPComplexMult_2_clock),
    .reset(FPComplexMult_2_reset),
    .io_in_a_Re(FPComplexMult_2_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_2_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_2_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_2_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_2_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_2_io_out_s_Im)
  );
  assign io_out_0_Re = FPComplexMult_io_out_s_Re; // @[FFTDesigns.scala 2108:19]
  assign io_out_0_Im = FPComplexMult_io_out_s_Im; // @[FFTDesigns.scala 2108:19]
  assign io_out_1_Re = FPComplexMult_1_io_out_s_Re; // @[FFTDesigns.scala 2108:19]
  assign io_out_1_Im = FPComplexMult_1_io_out_s_Im; // @[FFTDesigns.scala 2108:19]
  assign io_out_2_Re = FPComplexMult_2_io_out_s_Re; // @[FFTDesigns.scala 2108:19]
  assign io_out_2_Im = FPComplexMult_2_io_out_s_Im; // @[FFTDesigns.scala 2108:19]
  assign TwiddleFactorROM_io_in_addr = {{1'd0}, cnt}; // @[FFTDesigns.scala 2110:24]
  assign FPComplexMult_clock = clock;
  assign FPComplexMult_reset = reset;
  assign FPComplexMult_io_in_a_Re = _T_1 ? io_in_0_Re : 32'h0; // @[FFTDesigns.scala 2090:32 2097:31 2102:31]
  assign FPComplexMult_io_in_a_Im = _T_1 ? io_in_0_Im : 32'h0; // @[FFTDesigns.scala 2090:32 2097:31 2102:31]
  assign FPComplexMult_io_in_b_Re = _T_1 ? 32'h3f800000 : 32'h0; // @[FFTDesigns.scala 2090:32 2098:31 2103:31]
  assign FPComplexMult_io_in_b_Im = _T_1 ? 32'h80800000 : 32'h0; // @[FFTDesigns.scala 2090:32 2098:31 2103:31]
  assign FPComplexMult_1_clock = clock;
  assign FPComplexMult_1_reset = reset;
  assign FPComplexMult_1_io_in_a_Re = _T_1 ? io_in_1_Re : 32'h0; // @[FFTDesigns.scala 2090:32 2097:31 2102:31]
  assign FPComplexMult_1_io_in_a_Im = _T_1 ? io_in_1_Im : 32'h0; // @[FFTDesigns.scala 2090:32 2097:31 2102:31]
  assign FPComplexMult_1_io_in_b_Re = _T_1 ? TwiddleFactorROM_io_out_data_1_Re : 32'h0; // @[FFTDesigns.scala 2090:32 2098:31 2103:31]
  assign FPComplexMult_1_io_in_b_Im = _T_1 ? TwiddleFactorROM_io_out_data_1_Im : 32'h0; // @[FFTDesigns.scala 2090:32 2098:31 2103:31]
  assign FPComplexMult_2_clock = clock;
  assign FPComplexMult_2_reset = reset;
  assign FPComplexMult_2_io_in_a_Re = _T_1 ? io_in_2_Re : 32'h0; // @[FFTDesigns.scala 2090:32 2097:31 2102:31]
  assign FPComplexMult_2_io_in_a_Im = _T_1 ? io_in_2_Im : 32'h0; // @[FFTDesigns.scala 2090:32 2097:31 2102:31]
  assign FPComplexMult_2_io_in_b_Re = _T_1 ? TwiddleFactorROM_io_out_data_2_Re : 32'h0; // @[FFTDesigns.scala 2090:32 2098:31 2103:31]
  assign FPComplexMult_2_io_in_b_Im = _T_1 ? TwiddleFactorROM_io_out_data_2_Im : 32'h0; // @[FFTDesigns.scala 2090:32 2098:31 2103:31]
  always @(posedge clock) begin
    if (reset) begin // @[FFTDesigns.scala 2080:24]
      cnt <= 4'h0; // @[FFTDesigns.scala 2080:24]
    end else if (_T_1) begin // @[FFTDesigns.scala 2090:32]
      if (cnt == 4'h8) begin // @[FFTDesigns.scala 2091:34]
        cnt <= 4'h0; // @[FFTDesigns.scala 2092:15]
      end else begin
        cnt <= _cnt_T_1; // @[FFTDesigns.scala 2094:15]
      end
    end else begin
      cnt <= 4'h0; // @[FFTDesigns.scala 2105:13]
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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FFT_2733_streaming(
  input         clock,
  input         reset,
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  input  [31:0] io_in_2_Re,
  input  [31:0] io_in_2_Im,
  input         io_in_ready,
  output        io_out_validate,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im,
  output [31:0] io_out_2_Re,
  output [31:0] io_out_2_Im,
  output [31:0] io_out_test_0_Re,
  output [31:0] io_out_test_0_Im,
  output [31:0] io_out_test_1_Re,
  output [31:0] io_out_test_1_Im,
  output [31:0] io_out_test_2_Re,
  output [31:0] io_out_test_2_Im
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
`endif // RANDOMIZE_REG_INIT
  wire  DFT_r_v2_clock; // @[FFTDesigns.scala 3669:30]
  wire  DFT_r_v2_reset; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_io_in_0_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_io_in_0_Im; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_io_in_1_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_io_in_1_Im; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_io_in_2_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_io_in_2_Im; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_io_out_0_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_io_out_0_Im; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_io_out_1_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_io_out_1_Im; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_io_out_2_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_io_out_2_Im; // @[FFTDesigns.scala 3669:30]
  wire  DFT_r_v2_1_clock; // @[FFTDesigns.scala 3669:30]
  wire  DFT_r_v2_1_reset; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_1_io_in_0_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_1_io_in_0_Im; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_1_io_in_1_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_1_io_in_1_Im; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_1_io_in_2_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_1_io_in_2_Im; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_1_io_out_0_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_1_io_out_0_Im; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_1_io_out_1_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_1_io_out_1_Im; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_1_io_out_2_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_1_io_out_2_Im; // @[FFTDesigns.scala 3669:30]
  wire  DFT_r_v2_2_clock; // @[FFTDesigns.scala 3669:30]
  wire  DFT_r_v2_2_reset; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_2_io_in_0_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_2_io_in_0_Im; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_2_io_in_1_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_2_io_in_1_Im; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_2_io_in_2_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_2_io_in_2_Im; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_2_io_out_0_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_2_io_out_0_Im; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_2_io_out_1_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_2_io_out_1_Im; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_2_io_out_2_Re; // @[FFTDesigns.scala 3669:30]
  wire [31:0] DFT_r_v2_2_io_out_2_Im; // @[FFTDesigns.scala 3669:30]
  wire  PermutationsWithStreaming_clock; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_reset; // @[FFTDesigns.scala 3676:30]
  wire [31:0] PermutationsWithStreaming_io_in_0_Re; // @[FFTDesigns.scala 3676:30]
  wire [31:0] PermutationsWithStreaming_io_in_0_Im; // @[FFTDesigns.scala 3676:30]
  wire [31:0] PermutationsWithStreaming_io_in_1_Re; // @[FFTDesigns.scala 3676:30]
  wire [31:0] PermutationsWithStreaming_io_in_1_Im; // @[FFTDesigns.scala 3676:30]
  wire [31:0] PermutationsWithStreaming_io_in_2_Re; // @[FFTDesigns.scala 3676:30]
  wire [31:0] PermutationsWithStreaming_io_in_2_Im; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_0; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_1; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_2; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_3; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_4; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_5; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_6; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_7; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_8; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_9; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_10; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_11; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_12; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_13; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_14; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_15; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_16; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_17; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_io_in_en_18; // @[FFTDesigns.scala 3676:30]
  wire [31:0] PermutationsWithStreaming_io_out_0_Re; // @[FFTDesigns.scala 3676:30]
  wire [31:0] PermutationsWithStreaming_io_out_0_Im; // @[FFTDesigns.scala 3676:30]
  wire [31:0] PermutationsWithStreaming_io_out_1_Re; // @[FFTDesigns.scala 3676:30]
  wire [31:0] PermutationsWithStreaming_io_out_1_Im; // @[FFTDesigns.scala 3676:30]
  wire [31:0] PermutationsWithStreaming_io_out_2_Re; // @[FFTDesigns.scala 3676:30]
  wire [31:0] PermutationsWithStreaming_io_out_2_Im; // @[FFTDesigns.scala 3676:30]
  wire  PermutationsWithStreaming_1_clock; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_reset; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_1_io_in_0_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_1_io_in_0_Im; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_1_io_in_1_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_1_io_in_1_Im; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_1_io_in_2_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_1_io_in_2_Im; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_0; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_1; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_2; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_3; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_4; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_5; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_6; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_7; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_8; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_9; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_10; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_11; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_12; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_13; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_14; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_15; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_16; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_17; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_1_io_in_en_18; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_1_io_out_0_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_1_io_out_0_Im; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_1_io_out_1_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_1_io_out_1_Im; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_1_io_out_2_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_1_io_out_2_Im; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_clock; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_reset; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_2_io_in_0_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_2_io_in_0_Im; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_2_io_in_1_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_2_io_in_1_Im; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_2_io_in_2_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_2_io_in_2_Im; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_0; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_1; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_2; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_3; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_4; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_5; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_6; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_7; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_8; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_9; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_10; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_11; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_12; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_13; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_14; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_15; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_16; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_17; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_2_io_in_en_18; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_2_io_out_0_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_2_io_out_0_Im; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_2_io_out_1_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_2_io_out_1_Im; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_2_io_out_2_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_2_io_out_2_Im; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_3_clock; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_3_reset; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_3_io_in_0_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_3_io_in_0_Im; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_3_io_in_1_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_3_io_in_1_Im; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_3_io_in_2_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_3_io_in_2_Im; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_3_io_in_en_0; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_3_io_in_en_1; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_3_io_in_en_2; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_3_io_in_en_3; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_3_io_in_en_4; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_3_io_in_en_5; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_3_io_in_en_6; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_3_io_in_en_7; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_3_io_in_en_8; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_3_io_in_en_9; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_3_io_in_en_10; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_3_io_in_en_11; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_3_io_in_en_12; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_3_io_in_en_13; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_3_io_in_en_14; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_3_io_in_en_15; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_3_io_in_en_16; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_3_io_in_en_17; // @[FFTDesigns.scala 3679:30]
  wire  PermutationsWithStreaming_3_io_in_en_18; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_3_io_out_0_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_3_io_out_0_Im; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_3_io_out_1_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_3_io_out_1_Im; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_3_io_out_2_Re; // @[FFTDesigns.scala 3679:30]
  wire [31:0] PermutationsWithStreaming_3_io_out_2_Im; // @[FFTDesigns.scala 3679:30]
  wire  TwiddleFactorsStreamed_clock; // @[FFTDesigns.scala 3684:28]
  wire  TwiddleFactorsStreamed_reset; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_io_in_0_Re; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_io_in_0_Im; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_io_in_1_Re; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_io_in_1_Im; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_io_in_2_Re; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_io_in_2_Im; // @[FFTDesigns.scala 3684:28]
  wire  TwiddleFactorsStreamed_io_in_en_0; // @[FFTDesigns.scala 3684:28]
  wire  TwiddleFactorsStreamed_io_in_en_1; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_io_out_0_Re; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_io_out_0_Im; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_io_out_1_Re; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_io_out_1_Im; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_io_out_2_Re; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_io_out_2_Im; // @[FFTDesigns.scala 3684:28]
  wire  TwiddleFactorsStreamed_1_clock; // @[FFTDesigns.scala 3684:28]
  wire  TwiddleFactorsStreamed_1_reset; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_in_0_Re; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_in_0_Im; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_in_1_Re; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_in_1_Im; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_in_2_Re; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_in_2_Im; // @[FFTDesigns.scala 3684:28]
  wire  TwiddleFactorsStreamed_1_io_in_en_0; // @[FFTDesigns.scala 3684:28]
  wire  TwiddleFactorsStreamed_1_io_in_en_1; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_out_0_Re; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_out_0_Im; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_out_1_Re; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_out_1_Im; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_out_2_Re; // @[FFTDesigns.scala 3684:28]
  wire [31:0] TwiddleFactorsStreamed_1_io_out_2_Im; // @[FFTDesigns.scala 3684:28]
  reg  DFT_regdelays_0_0; // @[FFTDesigns.scala 3663:32]
  reg  DFT_regdelays_0_1; // @[FFTDesigns.scala 3663:32]
  reg  DFT_regdelays_0_2; // @[FFTDesigns.scala 3663:32]
  reg  DFT_regdelays_0_3; // @[FFTDesigns.scala 3663:32]
  reg  DFT_regdelays_1_0; // @[FFTDesigns.scala 3663:32]
  reg  DFT_regdelays_1_1; // @[FFTDesigns.scala 3663:32]
  reg  DFT_regdelays_1_2; // @[FFTDesigns.scala 3663:32]
  reg  DFT_regdelays_1_3; // @[FFTDesigns.scala 3663:32]
  reg  DFT_regdelays_2_0; // @[FFTDesigns.scala 3663:32]
  reg  DFT_regdelays_2_1; // @[FFTDesigns.scala 3663:32]
  reg  DFT_regdelays_2_2; // @[FFTDesigns.scala 3663:32]
  reg  DFT_regdelays_2_3; // @[FFTDesigns.scala 3663:32]
  reg  Twid_regdelays_0_0; // @[FFTDesigns.scala 3664:33]
  reg  Twid_regdelays_0_1; // @[FFTDesigns.scala 3664:33]
  reg  Twid_regdelays_1_0; // @[FFTDesigns.scala 3664:33]
  reg  Twid_regdelays_1_1; // @[FFTDesigns.scala 3664:33]
  reg  Perm_regdelays_0_0; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_0_1; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_0_2; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_0_3; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_0_4; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_0_5; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_0_6; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_0_7; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_0_8; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_0_9; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_0_10; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_0_11; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_0_12; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_0_13; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_0_14; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_0_15; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_0_16; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_0_17; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_0; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_1; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_2; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_3; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_4; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_5; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_6; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_7; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_8; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_9; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_10; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_11; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_12; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_13; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_14; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_15; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_16; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_1_17; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_0; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_1; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_2; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_3; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_4; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_5; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_6; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_7; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_8; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_9; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_10; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_11; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_12; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_13; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_14; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_15; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_16; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_2_17; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_3_0; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_3_1; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_3_2; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_3_3; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_3_4; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_3_5; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_3_6; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_3_7; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_3_8; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_3_9; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_3_10; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_3_11; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_3_12; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_3_13; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_3_14; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_3_15; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_3_16; // @[FFTDesigns.scala 3665:33]
  reg  Perm_regdelays_3_17; // @[FFTDesigns.scala 3665:33]
  reg  out_regdelay; // @[FFTDesigns.scala 3666:31]
  reg [31:0] results_0_Re; // @[FFTDesigns.scala 3753:26]
  reg [31:0] results_0_Im; // @[FFTDesigns.scala 3753:26]
  reg [31:0] results_1_Re; // @[FFTDesigns.scala 3753:26]
  reg [31:0] results_1_Im; // @[FFTDesigns.scala 3753:26]
  reg [31:0] results_2_Re; // @[FFTDesigns.scala 3753:26]
  reg [31:0] results_2_Im; // @[FFTDesigns.scala 3753:26]
  DFT_r_v2 DFT_r_v2 ( // @[FFTDesigns.scala 3669:30]
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
  DFT_r_v2 DFT_r_v2_1 ( // @[FFTDesigns.scala 3669:30]
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
  DFT_r_v2 DFT_r_v2_2 ( // @[FFTDesigns.scala 3669:30]
    .clock(DFT_r_v2_2_clock),
    .reset(DFT_r_v2_2_reset),
    .io_in_0_Re(DFT_r_v2_2_io_in_0_Re),
    .io_in_0_Im(DFT_r_v2_2_io_in_0_Im),
    .io_in_1_Re(DFT_r_v2_2_io_in_1_Re),
    .io_in_1_Im(DFT_r_v2_2_io_in_1_Im),
    .io_in_2_Re(DFT_r_v2_2_io_in_2_Re),
    .io_in_2_Im(DFT_r_v2_2_io_in_2_Im),
    .io_out_0_Re(DFT_r_v2_2_io_out_0_Re),
    .io_out_0_Im(DFT_r_v2_2_io_out_0_Im),
    .io_out_1_Re(DFT_r_v2_2_io_out_1_Re),
    .io_out_1_Im(DFT_r_v2_2_io_out_1_Im),
    .io_out_2_Re(DFT_r_v2_2_io_out_2_Re),
    .io_out_2_Im(DFT_r_v2_2_io_out_2_Im)
  );
  PermutationsWithStreaming PermutationsWithStreaming ( // @[FFTDesigns.scala 3676:30]
    .clock(PermutationsWithStreaming_clock),
    .reset(PermutationsWithStreaming_reset),
    .io_in_0_Re(PermutationsWithStreaming_io_in_0_Re),
    .io_in_0_Im(PermutationsWithStreaming_io_in_0_Im),
    .io_in_1_Re(PermutationsWithStreaming_io_in_1_Re),
    .io_in_1_Im(PermutationsWithStreaming_io_in_1_Im),
    .io_in_2_Re(PermutationsWithStreaming_io_in_2_Re),
    .io_in_2_Im(PermutationsWithStreaming_io_in_2_Im),
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
    .io_out_0_Re(PermutationsWithStreaming_io_out_0_Re),
    .io_out_0_Im(PermutationsWithStreaming_io_out_0_Im),
    .io_out_1_Re(PermutationsWithStreaming_io_out_1_Re),
    .io_out_1_Im(PermutationsWithStreaming_io_out_1_Im),
    .io_out_2_Re(PermutationsWithStreaming_io_out_2_Re),
    .io_out_2_Im(PermutationsWithStreaming_io_out_2_Im)
  );
  PermutationsWithStreaming_1 PermutationsWithStreaming_1 ( // @[FFTDesigns.scala 3679:30]
    .clock(PermutationsWithStreaming_1_clock),
    .reset(PermutationsWithStreaming_1_reset),
    .io_in_0_Re(PermutationsWithStreaming_1_io_in_0_Re),
    .io_in_0_Im(PermutationsWithStreaming_1_io_in_0_Im),
    .io_in_1_Re(PermutationsWithStreaming_1_io_in_1_Re),
    .io_in_1_Im(PermutationsWithStreaming_1_io_in_1_Im),
    .io_in_2_Re(PermutationsWithStreaming_1_io_in_2_Re),
    .io_in_2_Im(PermutationsWithStreaming_1_io_in_2_Im),
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
    .io_in_en_17(PermutationsWithStreaming_1_io_in_en_17),
    .io_in_en_18(PermutationsWithStreaming_1_io_in_en_18),
    .io_out_0_Re(PermutationsWithStreaming_1_io_out_0_Re),
    .io_out_0_Im(PermutationsWithStreaming_1_io_out_0_Im),
    .io_out_1_Re(PermutationsWithStreaming_1_io_out_1_Re),
    .io_out_1_Im(PermutationsWithStreaming_1_io_out_1_Im),
    .io_out_2_Re(PermutationsWithStreaming_1_io_out_2_Re),
    .io_out_2_Im(PermutationsWithStreaming_1_io_out_2_Im)
  );
  PermutationsWithStreaming_1 PermutationsWithStreaming_2 ( // @[FFTDesigns.scala 3679:30]
    .clock(PermutationsWithStreaming_2_clock),
    .reset(PermutationsWithStreaming_2_reset),
    .io_in_0_Re(PermutationsWithStreaming_2_io_in_0_Re),
    .io_in_0_Im(PermutationsWithStreaming_2_io_in_0_Im),
    .io_in_1_Re(PermutationsWithStreaming_2_io_in_1_Re),
    .io_in_1_Im(PermutationsWithStreaming_2_io_in_1_Im),
    .io_in_2_Re(PermutationsWithStreaming_2_io_in_2_Re),
    .io_in_2_Im(PermutationsWithStreaming_2_io_in_2_Im),
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
    .io_in_en_17(PermutationsWithStreaming_2_io_in_en_17),
    .io_in_en_18(PermutationsWithStreaming_2_io_in_en_18),
    .io_out_0_Re(PermutationsWithStreaming_2_io_out_0_Re),
    .io_out_0_Im(PermutationsWithStreaming_2_io_out_0_Im),
    .io_out_1_Re(PermutationsWithStreaming_2_io_out_1_Re),
    .io_out_1_Im(PermutationsWithStreaming_2_io_out_1_Im),
    .io_out_2_Re(PermutationsWithStreaming_2_io_out_2_Re),
    .io_out_2_Im(PermutationsWithStreaming_2_io_out_2_Im)
  );
  PermutationsWithStreaming_1 PermutationsWithStreaming_3 ( // @[FFTDesigns.scala 3679:30]
    .clock(PermutationsWithStreaming_3_clock),
    .reset(PermutationsWithStreaming_3_reset),
    .io_in_0_Re(PermutationsWithStreaming_3_io_in_0_Re),
    .io_in_0_Im(PermutationsWithStreaming_3_io_in_0_Im),
    .io_in_1_Re(PermutationsWithStreaming_3_io_in_1_Re),
    .io_in_1_Im(PermutationsWithStreaming_3_io_in_1_Im),
    .io_in_2_Re(PermutationsWithStreaming_3_io_in_2_Re),
    .io_in_2_Im(PermutationsWithStreaming_3_io_in_2_Im),
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
    .io_in_en_17(PermutationsWithStreaming_3_io_in_en_17),
    .io_in_en_18(PermutationsWithStreaming_3_io_in_en_18),
    .io_out_0_Re(PermutationsWithStreaming_3_io_out_0_Re),
    .io_out_0_Im(PermutationsWithStreaming_3_io_out_0_Im),
    .io_out_1_Re(PermutationsWithStreaming_3_io_out_1_Re),
    .io_out_1_Im(PermutationsWithStreaming_3_io_out_1_Im),
    .io_out_2_Re(PermutationsWithStreaming_3_io_out_2_Re),
    .io_out_2_Im(PermutationsWithStreaming_3_io_out_2_Im)
  );
  TwiddleFactorsStreamed TwiddleFactorsStreamed ( // @[FFTDesigns.scala 3684:28]
    .clock(TwiddleFactorsStreamed_clock),
    .reset(TwiddleFactorsStreamed_reset),
    .io_in_0_Re(TwiddleFactorsStreamed_io_in_0_Re),
    .io_in_0_Im(TwiddleFactorsStreamed_io_in_0_Im),
    .io_in_1_Re(TwiddleFactorsStreamed_io_in_1_Re),
    .io_in_1_Im(TwiddleFactorsStreamed_io_in_1_Im),
    .io_in_2_Re(TwiddleFactorsStreamed_io_in_2_Re),
    .io_in_2_Im(TwiddleFactorsStreamed_io_in_2_Im),
    .io_in_en_0(TwiddleFactorsStreamed_io_in_en_0),
    .io_in_en_1(TwiddleFactorsStreamed_io_in_en_1),
    .io_out_0_Re(TwiddleFactorsStreamed_io_out_0_Re),
    .io_out_0_Im(TwiddleFactorsStreamed_io_out_0_Im),
    .io_out_1_Re(TwiddleFactorsStreamed_io_out_1_Re),
    .io_out_1_Im(TwiddleFactorsStreamed_io_out_1_Im),
    .io_out_2_Re(TwiddleFactorsStreamed_io_out_2_Re),
    .io_out_2_Im(TwiddleFactorsStreamed_io_out_2_Im)
  );
  TwiddleFactorsStreamed_1 TwiddleFactorsStreamed_1 ( // @[FFTDesigns.scala 3684:28]
    .clock(TwiddleFactorsStreamed_1_clock),
    .reset(TwiddleFactorsStreamed_1_reset),
    .io_in_0_Re(TwiddleFactorsStreamed_1_io_in_0_Re),
    .io_in_0_Im(TwiddleFactorsStreamed_1_io_in_0_Im),
    .io_in_1_Re(TwiddleFactorsStreamed_1_io_in_1_Re),
    .io_in_1_Im(TwiddleFactorsStreamed_1_io_in_1_Im),
    .io_in_2_Re(TwiddleFactorsStreamed_1_io_in_2_Re),
    .io_in_2_Im(TwiddleFactorsStreamed_1_io_in_2_Im),
    .io_in_en_0(TwiddleFactorsStreamed_1_io_in_en_0),
    .io_in_en_1(TwiddleFactorsStreamed_1_io_in_en_1),
    .io_out_0_Re(TwiddleFactorsStreamed_1_io_out_0_Re),
    .io_out_0_Im(TwiddleFactorsStreamed_1_io_out_0_Im),
    .io_out_1_Re(TwiddleFactorsStreamed_1_io_out_1_Re),
    .io_out_1_Im(TwiddleFactorsStreamed_1_io_out_1_Im),
    .io_out_2_Re(TwiddleFactorsStreamed_1_io_out_2_Re),
    .io_out_2_Im(TwiddleFactorsStreamed_1_io_out_2_Im)
  );
  assign io_out_validate = out_regdelay; // @[FFTDesigns.scala 3762:21]
  assign io_out_0_Re = results_0_Re; // @[FFTDesigns.scala 3763:12]
  assign io_out_0_Im = results_0_Im; // @[FFTDesigns.scala 3763:12]
  assign io_out_1_Re = results_1_Re; // @[FFTDesigns.scala 3763:12]
  assign io_out_1_Im = results_1_Im; // @[FFTDesigns.scala 3763:12]
  assign io_out_2_Re = results_2_Re; // @[FFTDesigns.scala 3763:12]
  assign io_out_2_Im = results_2_Im; // @[FFTDesigns.scala 3763:12]
  assign io_out_test_0_Re = PermutationsWithStreaming_io_out_0_Re; // @[FFTDesigns.scala 3764:17]
  assign io_out_test_0_Im = PermutationsWithStreaming_io_out_0_Im; // @[FFTDesigns.scala 3764:17]
  assign io_out_test_1_Re = PermutationsWithStreaming_io_out_1_Re; // @[FFTDesigns.scala 3764:17]
  assign io_out_test_1_Im = PermutationsWithStreaming_io_out_1_Im; // @[FFTDesigns.scala 3764:17]
  assign io_out_test_2_Re = PermutationsWithStreaming_io_out_2_Re; // @[FFTDesigns.scala 3764:17]
  assign io_out_test_2_Im = PermutationsWithStreaming_io_out_2_Im; // @[FFTDesigns.scala 3764:17]
  assign DFT_r_v2_clock = clock;
  assign DFT_r_v2_reset = reset;
  assign DFT_r_v2_io_in_0_Re = PermutationsWithStreaming_io_out_0_Re; // @[FFTDesigns.scala 3719:41]
  assign DFT_r_v2_io_in_0_Im = PermutationsWithStreaming_io_out_0_Im; // @[FFTDesigns.scala 3719:41]
  assign DFT_r_v2_io_in_1_Re = PermutationsWithStreaming_io_out_1_Re; // @[FFTDesigns.scala 3719:41]
  assign DFT_r_v2_io_in_1_Im = PermutationsWithStreaming_io_out_1_Im; // @[FFTDesigns.scala 3719:41]
  assign DFT_r_v2_io_in_2_Re = PermutationsWithStreaming_io_out_2_Re; // @[FFTDesigns.scala 3719:41]
  assign DFT_r_v2_io_in_2_Im = PermutationsWithStreaming_io_out_2_Im; // @[FFTDesigns.scala 3719:41]
  assign DFT_r_v2_1_clock = clock;
  assign DFT_r_v2_1_reset = reset;
  assign DFT_r_v2_1_io_in_0_Re = TwiddleFactorsStreamed_io_out_0_Re; // @[FFTDesigns.scala 3726:41]
  assign DFT_r_v2_1_io_in_0_Im = TwiddleFactorsStreamed_io_out_0_Im; // @[FFTDesigns.scala 3726:41]
  assign DFT_r_v2_1_io_in_1_Re = TwiddleFactorsStreamed_io_out_1_Re; // @[FFTDesigns.scala 3726:41]
  assign DFT_r_v2_1_io_in_1_Im = TwiddleFactorsStreamed_io_out_1_Im; // @[FFTDesigns.scala 3726:41]
  assign DFT_r_v2_1_io_in_2_Re = TwiddleFactorsStreamed_io_out_2_Re; // @[FFTDesigns.scala 3726:41]
  assign DFT_r_v2_1_io_in_2_Im = TwiddleFactorsStreamed_io_out_2_Im; // @[FFTDesigns.scala 3726:41]
  assign DFT_r_v2_2_clock = clock;
  assign DFT_r_v2_2_reset = reset;
  assign DFT_r_v2_2_io_in_0_Re = TwiddleFactorsStreamed_1_io_out_0_Re; // @[FFTDesigns.scala 3726:41]
  assign DFT_r_v2_2_io_in_0_Im = TwiddleFactorsStreamed_1_io_out_0_Im; // @[FFTDesigns.scala 3726:41]
  assign DFT_r_v2_2_io_in_1_Re = TwiddleFactorsStreamed_1_io_out_1_Re; // @[FFTDesigns.scala 3726:41]
  assign DFT_r_v2_2_io_in_1_Im = TwiddleFactorsStreamed_1_io_out_1_Im; // @[FFTDesigns.scala 3726:41]
  assign DFT_r_v2_2_io_in_2_Re = TwiddleFactorsStreamed_1_io_out_2_Re; // @[FFTDesigns.scala 3726:41]
  assign DFT_r_v2_2_io_in_2_Im = TwiddleFactorsStreamed_1_io_out_2_Im; // @[FFTDesigns.scala 3726:41]
  assign PermutationsWithStreaming_clock = clock;
  assign PermutationsWithStreaming_reset = reset;
  assign PermutationsWithStreaming_io_in_0_Re = io_in_0_Re; // @[FFTDesigns.scala 3693:32]
  assign PermutationsWithStreaming_io_in_0_Im = io_in_0_Im; // @[FFTDesigns.scala 3693:32]
  assign PermutationsWithStreaming_io_in_1_Re = io_in_1_Re; // @[FFTDesigns.scala 3693:32]
  assign PermutationsWithStreaming_io_in_1_Im = io_in_1_Im; // @[FFTDesigns.scala 3693:32]
  assign PermutationsWithStreaming_io_in_2_Re = io_in_2_Re; // @[FFTDesigns.scala 3693:32]
  assign PermutationsWithStreaming_io_in_2_Im = io_in_2_Im; // @[FFTDesigns.scala 3693:32]
  assign PermutationsWithStreaming_io_in_en_0 = io_in_ready; // @[FFTDesigns.scala 3692:38]
  assign PermutationsWithStreaming_io_in_en_1 = Perm_regdelays_0_0; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_io_in_en_2 = Perm_regdelays_0_1; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_io_in_en_3 = Perm_regdelays_0_2; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_io_in_en_4 = Perm_regdelays_0_3; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_io_in_en_5 = Perm_regdelays_0_4; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_io_in_en_6 = Perm_regdelays_0_5; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_io_in_en_7 = Perm_regdelays_0_6; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_io_in_en_8 = Perm_regdelays_0_7; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_io_in_en_9 = Perm_regdelays_0_8; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_io_in_en_10 = Perm_regdelays_0_9; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_io_in_en_11 = Perm_regdelays_0_10; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_io_in_en_12 = Perm_regdelays_0_11; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_io_in_en_13 = Perm_regdelays_0_12; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_io_in_en_14 = Perm_regdelays_0_13; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_io_in_en_15 = Perm_regdelays_0_14; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_io_in_en_16 = Perm_regdelays_0_15; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_io_in_en_17 = Perm_regdelays_0_16; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_io_in_en_18 = Perm_regdelays_0_17; // @[FFTDesigns.scala 3707:44]
  assign PermutationsWithStreaming_1_clock = clock;
  assign PermutationsWithStreaming_1_reset = reset;
  assign PermutationsWithStreaming_1_io_in_0_Re = DFT_r_v2_io_out_0_Re; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_1_io_in_0_Im = DFT_r_v2_io_out_0_Im; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_1_io_in_1_Re = DFT_r_v2_io_out_1_Re; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_1_io_in_1_Im = DFT_r_v2_io_out_1_Im; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_1_io_in_2_Re = DFT_r_v2_io_out_2_Re; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_1_io_in_2_Im = DFT_r_v2_io_out_2_Im; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_1_io_in_en_0 = DFT_regdelays_0_3; // @[FFTDesigns.scala 3696:38]
  assign PermutationsWithStreaming_1_io_in_en_1 = Perm_regdelays_1_0; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_1_io_in_en_2 = Perm_regdelays_1_1; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_1_io_in_en_3 = Perm_regdelays_1_2; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_1_io_in_en_4 = Perm_regdelays_1_3; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_1_io_in_en_5 = Perm_regdelays_1_4; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_1_io_in_en_6 = Perm_regdelays_1_5; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_1_io_in_en_7 = Perm_regdelays_1_6; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_1_io_in_en_8 = Perm_regdelays_1_7; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_1_io_in_en_9 = Perm_regdelays_1_8; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_1_io_in_en_10 = Perm_regdelays_1_9; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_1_io_in_en_11 = Perm_regdelays_1_10; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_1_io_in_en_12 = Perm_regdelays_1_11; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_1_io_in_en_13 = Perm_regdelays_1_12; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_1_io_in_en_14 = Perm_regdelays_1_13; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_1_io_in_en_15 = Perm_regdelays_1_14; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_1_io_in_en_16 = Perm_regdelays_1_15; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_1_io_in_en_17 = Perm_regdelays_1_16; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_1_io_in_en_18 = Perm_regdelays_1_17; // @[FFTDesigns.scala 3707:44]
  assign PermutationsWithStreaming_2_clock = clock;
  assign PermutationsWithStreaming_2_reset = reset;
  assign PermutationsWithStreaming_2_io_in_0_Re = DFT_r_v2_1_io_out_0_Re; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_2_io_in_0_Im = DFT_r_v2_1_io_out_0_Im; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_2_io_in_1_Re = DFT_r_v2_1_io_out_1_Re; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_2_io_in_1_Im = DFT_r_v2_1_io_out_1_Im; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_2_io_in_2_Re = DFT_r_v2_1_io_out_2_Re; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_2_io_in_2_Im = DFT_r_v2_1_io_out_2_Im; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_2_io_in_en_0 = DFT_regdelays_1_3; // @[FFTDesigns.scala 3696:38]
  assign PermutationsWithStreaming_2_io_in_en_1 = Perm_regdelays_2_0; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_2_io_in_en_2 = Perm_regdelays_2_1; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_2_io_in_en_3 = Perm_regdelays_2_2; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_2_io_in_en_4 = Perm_regdelays_2_3; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_2_io_in_en_5 = Perm_regdelays_2_4; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_2_io_in_en_6 = Perm_regdelays_2_5; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_2_io_in_en_7 = Perm_regdelays_2_6; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_2_io_in_en_8 = Perm_regdelays_2_7; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_2_io_in_en_9 = Perm_regdelays_2_8; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_2_io_in_en_10 = Perm_regdelays_2_9; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_2_io_in_en_11 = Perm_regdelays_2_10; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_2_io_in_en_12 = Perm_regdelays_2_11; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_2_io_in_en_13 = Perm_regdelays_2_12; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_2_io_in_en_14 = Perm_regdelays_2_13; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_2_io_in_en_15 = Perm_regdelays_2_14; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_2_io_in_en_16 = Perm_regdelays_2_15; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_2_io_in_en_17 = Perm_regdelays_2_16; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_2_io_in_en_18 = Perm_regdelays_2_17; // @[FFTDesigns.scala 3707:44]
  assign PermutationsWithStreaming_3_clock = clock;
  assign PermutationsWithStreaming_3_reset = reset;
  assign PermutationsWithStreaming_3_io_in_0_Re = DFT_r_v2_2_io_out_0_Re; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_3_io_in_0_Im = DFT_r_v2_2_io_out_0_Im; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_3_io_in_1_Re = DFT_r_v2_2_io_out_1_Re; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_3_io_in_1_Im = DFT_r_v2_2_io_out_1_Im; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_3_io_in_2_Re = DFT_r_v2_2_io_out_2_Re; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_3_io_in_2_Im = DFT_r_v2_2_io_out_2_Im; // @[FFTDesigns.scala 3699:45]
  assign PermutationsWithStreaming_3_io_in_en_0 = DFT_regdelays_2_3; // @[FFTDesigns.scala 3696:38]
  assign PermutationsWithStreaming_3_io_in_en_1 = Perm_regdelays_3_0; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_3_io_in_en_2 = Perm_regdelays_3_1; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_3_io_in_en_3 = Perm_regdelays_3_2; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_3_io_in_en_4 = Perm_regdelays_3_3; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_3_io_in_en_5 = Perm_regdelays_3_4; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_3_io_in_en_6 = Perm_regdelays_3_5; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_3_io_in_en_7 = Perm_regdelays_3_6; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_3_io_in_en_8 = Perm_regdelays_3_7; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_3_io_in_en_9 = Perm_regdelays_3_8; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_3_io_in_en_10 = Perm_regdelays_3_9; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_3_io_in_en_11 = Perm_regdelays_3_10; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_3_io_in_en_12 = Perm_regdelays_3_11; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_3_io_in_en_13 = Perm_regdelays_3_12; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_3_io_in_en_14 = Perm_regdelays_3_13; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_3_io_in_en_15 = Perm_regdelays_3_14; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_3_io_in_en_16 = Perm_regdelays_3_15; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_3_io_in_en_17 = Perm_regdelays_3_16; // @[FFTDesigns.scala 3705:36]
  assign PermutationsWithStreaming_3_io_in_en_18 = Perm_regdelays_3_17; // @[FFTDesigns.scala 3707:44]
  assign TwiddleFactorsStreamed_clock = clock;
  assign TwiddleFactorsStreamed_reset = reset;
  assign TwiddleFactorsStreamed_io_in_0_Re = PermutationsWithStreaming_1_io_out_0_Re; // @[FFTDesigns.scala 3741:32]
  assign TwiddleFactorsStreamed_io_in_0_Im = PermutationsWithStreaming_1_io_out_0_Im; // @[FFTDesigns.scala 3741:32]
  assign TwiddleFactorsStreamed_io_in_1_Re = PermutationsWithStreaming_1_io_out_1_Re; // @[FFTDesigns.scala 3741:32]
  assign TwiddleFactorsStreamed_io_in_1_Im = PermutationsWithStreaming_1_io_out_1_Im; // @[FFTDesigns.scala 3741:32]
  assign TwiddleFactorsStreamed_io_in_2_Re = PermutationsWithStreaming_1_io_out_2_Re; // @[FFTDesigns.scala 3741:32]
  assign TwiddleFactorsStreamed_io_in_2_Im = PermutationsWithStreaming_1_io_out_2_Im; // @[FFTDesigns.scala 3741:32]
  assign TwiddleFactorsStreamed_io_in_en_0 = Perm_regdelays_1_17; // @[FFTDesigns.scala 3740:38]
  assign TwiddleFactorsStreamed_io_in_en_1 = Twid_regdelays_0_0; // @[FFTDesigns.scala 3749:36]
  assign TwiddleFactorsStreamed_1_clock = clock;
  assign TwiddleFactorsStreamed_1_reset = reset;
  assign TwiddleFactorsStreamed_1_io_in_0_Re = PermutationsWithStreaming_2_io_out_0_Re; // @[FFTDesigns.scala 3745:32]
  assign TwiddleFactorsStreamed_1_io_in_0_Im = PermutationsWithStreaming_2_io_out_0_Im; // @[FFTDesigns.scala 3745:32]
  assign TwiddleFactorsStreamed_1_io_in_1_Re = PermutationsWithStreaming_2_io_out_1_Re; // @[FFTDesigns.scala 3745:32]
  assign TwiddleFactorsStreamed_1_io_in_1_Im = PermutationsWithStreaming_2_io_out_1_Im; // @[FFTDesigns.scala 3745:32]
  assign TwiddleFactorsStreamed_1_io_in_2_Re = PermutationsWithStreaming_2_io_out_2_Re; // @[FFTDesigns.scala 3745:32]
  assign TwiddleFactorsStreamed_1_io_in_2_Im = PermutationsWithStreaming_2_io_out_2_Im; // @[FFTDesigns.scala 3745:32]
  assign TwiddleFactorsStreamed_1_io_in_en_0 = Perm_regdelays_2_17; // @[FFTDesigns.scala 3744:38]
  assign TwiddleFactorsStreamed_1_io_in_en_1 = Twid_regdelays_1_0; // @[FFTDesigns.scala 3749:36]
  always @(posedge clock) begin
    if (reset) begin // @[FFTDesigns.scala 3663:32]
      DFT_regdelays_0_0 <= 1'h0; // @[FFTDesigns.scala 3663:32]
    end else begin
      DFT_regdelays_0_0 <= Perm_regdelays_0_17; // @[FFTDesigns.scala 3716:33]
    end
    if (reset) begin // @[FFTDesigns.scala 3663:32]
      DFT_regdelays_0_1 <= 1'h0; // @[FFTDesigns.scala 3663:32]
    end else begin
      DFT_regdelays_0_1 <= DFT_regdelays_0_0; // @[FFTDesigns.scala 3731:31]
    end
    if (reset) begin // @[FFTDesigns.scala 3663:32]
      DFT_regdelays_0_2 <= 1'h0; // @[FFTDesigns.scala 3663:32]
    end else begin
      DFT_regdelays_0_2 <= DFT_regdelays_0_1; // @[FFTDesigns.scala 3731:31]
    end
    if (reset) begin // @[FFTDesigns.scala 3663:32]
      DFT_regdelays_0_3 <= 1'h0; // @[FFTDesigns.scala 3663:32]
    end else begin
      DFT_regdelays_0_3 <= DFT_regdelays_0_2; // @[FFTDesigns.scala 3731:31]
    end
    if (reset) begin // @[FFTDesigns.scala 3663:32]
      DFT_regdelays_1_0 <= 1'h0; // @[FFTDesigns.scala 3663:32]
    end else begin
      DFT_regdelays_1_0 <= Twid_regdelays_0_1; // @[FFTDesigns.scala 3723:33]
    end
    if (reset) begin // @[FFTDesigns.scala 3663:32]
      DFT_regdelays_1_1 <= 1'h0; // @[FFTDesigns.scala 3663:32]
    end else begin
      DFT_regdelays_1_1 <= DFT_regdelays_1_0; // @[FFTDesigns.scala 3731:31]
    end
    if (reset) begin // @[FFTDesigns.scala 3663:32]
      DFT_regdelays_1_2 <= 1'h0; // @[FFTDesigns.scala 3663:32]
    end else begin
      DFT_regdelays_1_2 <= DFT_regdelays_1_1; // @[FFTDesigns.scala 3731:31]
    end
    if (reset) begin // @[FFTDesigns.scala 3663:32]
      DFT_regdelays_1_3 <= 1'h0; // @[FFTDesigns.scala 3663:32]
    end else begin
      DFT_regdelays_1_3 <= DFT_regdelays_1_2; // @[FFTDesigns.scala 3731:31]
    end
    if (reset) begin // @[FFTDesigns.scala 3663:32]
      DFT_regdelays_2_0 <= 1'h0; // @[FFTDesigns.scala 3663:32]
    end else begin
      DFT_regdelays_2_0 <= Twid_regdelays_1_1; // @[FFTDesigns.scala 3723:33]
    end
    if (reset) begin // @[FFTDesigns.scala 3663:32]
      DFT_regdelays_2_1 <= 1'h0; // @[FFTDesigns.scala 3663:32]
    end else begin
      DFT_regdelays_2_1 <= DFT_regdelays_2_0; // @[FFTDesigns.scala 3731:31]
    end
    if (reset) begin // @[FFTDesigns.scala 3663:32]
      DFT_regdelays_2_2 <= 1'h0; // @[FFTDesigns.scala 3663:32]
    end else begin
      DFT_regdelays_2_2 <= DFT_regdelays_2_1; // @[FFTDesigns.scala 3731:31]
    end
    if (reset) begin // @[FFTDesigns.scala 3663:32]
      DFT_regdelays_2_3 <= 1'h0; // @[FFTDesigns.scala 3663:32]
    end else begin
      DFT_regdelays_2_3 <= DFT_regdelays_2_2; // @[FFTDesigns.scala 3731:31]
    end
    if (reset) begin // @[FFTDesigns.scala 3664:33]
      Twid_regdelays_0_0 <= 1'h0; // @[FFTDesigns.scala 3664:33]
    end else begin
      Twid_regdelays_0_0 <= Perm_regdelays_1_17; // @[FFTDesigns.scala 3739:34]
    end
    if (reset) begin // @[FFTDesigns.scala 3664:33]
      Twid_regdelays_0_1 <= 1'h0; // @[FFTDesigns.scala 3664:33]
    end else begin
      Twid_regdelays_0_1 <= Twid_regdelays_0_0; // @[FFTDesigns.scala 3748:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3664:33]
      Twid_regdelays_1_0 <= 1'h0; // @[FFTDesigns.scala 3664:33]
    end else begin
      Twid_regdelays_1_0 <= Perm_regdelays_2_17; // @[FFTDesigns.scala 3743:34]
    end
    if (reset) begin // @[FFTDesigns.scala 3664:33]
      Twid_regdelays_1_1 <= 1'h0; // @[FFTDesigns.scala 3664:33]
    end else begin
      Twid_regdelays_1_1 <= Twid_regdelays_1_0; // @[FFTDesigns.scala 3748:32]
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
      Perm_regdelays_0_4 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_0_4 <= Perm_regdelays_0_3; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_0_5 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_0_5 <= Perm_regdelays_0_4; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_0_6 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_0_6 <= Perm_regdelays_0_5; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_0_7 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_0_7 <= Perm_regdelays_0_6; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_0_8 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_0_8 <= Perm_regdelays_0_7; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_0_9 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_0_9 <= Perm_regdelays_0_8; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_0_10 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_0_10 <= Perm_regdelays_0_9; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_0_11 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_0_11 <= Perm_regdelays_0_10; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_0_12 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_0_12 <= Perm_regdelays_0_11; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_0_13 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_0_13 <= Perm_regdelays_0_12; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_0_14 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_0_14 <= Perm_regdelays_0_13; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_0_15 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_0_15 <= Perm_regdelays_0_14; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_0_16 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_0_16 <= Perm_regdelays_0_15; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_0_17 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_0_17 <= Perm_regdelays_0_16; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_1_0 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_1_0 <= DFT_regdelays_0_3; // @[FFTDesigns.scala 3695:34]
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
      Perm_regdelays_1_4 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_1_4 <= Perm_regdelays_1_3; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_1_5 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_1_5 <= Perm_regdelays_1_4; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_1_6 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_1_6 <= Perm_regdelays_1_5; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_1_7 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_1_7 <= Perm_regdelays_1_6; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_1_8 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_1_8 <= Perm_regdelays_1_7; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_1_9 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_1_9 <= Perm_regdelays_1_8; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_1_10 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_1_10 <= Perm_regdelays_1_9; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_1_11 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_1_11 <= Perm_regdelays_1_10; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_1_12 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_1_12 <= Perm_regdelays_1_11; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_1_13 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_1_13 <= Perm_regdelays_1_12; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_1_14 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_1_14 <= Perm_regdelays_1_13; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_1_15 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_1_15 <= Perm_regdelays_1_14; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_1_16 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_1_16 <= Perm_regdelays_1_15; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_1_17 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_1_17 <= Perm_regdelays_1_16; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_2_0 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_2_0 <= DFT_regdelays_1_3; // @[FFTDesigns.scala 3695:34]
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
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_2_4 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_2_4 <= Perm_regdelays_2_3; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_2_5 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_2_5 <= Perm_regdelays_2_4; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_2_6 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_2_6 <= Perm_regdelays_2_5; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_2_7 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_2_7 <= Perm_regdelays_2_6; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_2_8 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_2_8 <= Perm_regdelays_2_7; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_2_9 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_2_9 <= Perm_regdelays_2_8; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_2_10 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_2_10 <= Perm_regdelays_2_9; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_2_11 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_2_11 <= Perm_regdelays_2_10; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_2_12 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_2_12 <= Perm_regdelays_2_11; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_2_13 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_2_13 <= Perm_regdelays_2_12; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_2_14 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_2_14 <= Perm_regdelays_2_13; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_2_15 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_2_15 <= Perm_regdelays_2_14; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_2_16 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_2_16 <= Perm_regdelays_2_15; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_2_17 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_2_17 <= Perm_regdelays_2_16; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_3_0 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_3_0 <= DFT_regdelays_2_3; // @[FFTDesigns.scala 3695:34]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_3_1 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_3_1 <= Perm_regdelays_3_0; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_3_2 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_3_2 <= Perm_regdelays_3_1; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_3_3 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_3_3 <= Perm_regdelays_3_2; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_3_4 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_3_4 <= Perm_regdelays_3_3; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_3_5 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_3_5 <= Perm_regdelays_3_4; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_3_6 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_3_6 <= Perm_regdelays_3_5; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_3_7 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_3_7 <= Perm_regdelays_3_6; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_3_8 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_3_8 <= Perm_regdelays_3_7; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_3_9 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_3_9 <= Perm_regdelays_3_8; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_3_10 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_3_10 <= Perm_regdelays_3_9; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_3_11 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_3_11 <= Perm_regdelays_3_10; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_3_12 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_3_12 <= Perm_regdelays_3_11; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_3_13 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_3_13 <= Perm_regdelays_3_12; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_3_14 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_3_14 <= Perm_regdelays_3_13; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_3_15 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_3_15 <= Perm_regdelays_3_14; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_3_16 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_3_16 <= Perm_regdelays_3_15; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3665:33]
      Perm_regdelays_3_17 <= 1'h0; // @[FFTDesigns.scala 3665:33]
    end else begin
      Perm_regdelays_3_17 <= Perm_regdelays_3_16; // @[FFTDesigns.scala 3704:32]
    end
    if (reset) begin // @[FFTDesigns.scala 3666:31]
      out_regdelay <= 1'h0; // @[FFTDesigns.scala 3666:31]
    end else begin
      out_regdelay <= Perm_regdelays_3_17; // @[FFTDesigns.scala 3761:18]
    end
    if (reset) begin // @[FFTDesigns.scala 3753:26]
      results_0_Re <= 32'h0; // @[FFTDesigns.scala 3753:26]
    end else if (Perm_regdelays_3_17) begin // @[FFTDesigns.scala 3754:59]
      results_0_Re <= PermutationsWithStreaming_3_io_out_0_Re; // @[FFTDesigns.scala 3755:15]
    end else begin
      results_0_Re <= 32'h0; // @[FFTDesigns.scala 3758:20]
    end
    if (reset) begin // @[FFTDesigns.scala 3753:26]
      results_0_Im <= 32'h0; // @[FFTDesigns.scala 3753:26]
    end else if (Perm_regdelays_3_17) begin // @[FFTDesigns.scala 3754:59]
      results_0_Im <= PermutationsWithStreaming_3_io_out_0_Im; // @[FFTDesigns.scala 3755:15]
    end else begin
      results_0_Im <= 32'h0; // @[FFTDesigns.scala 3758:20]
    end
    if (reset) begin // @[FFTDesigns.scala 3753:26]
      results_1_Re <= 32'h0; // @[FFTDesigns.scala 3753:26]
    end else if (Perm_regdelays_3_17) begin // @[FFTDesigns.scala 3754:59]
      results_1_Re <= PermutationsWithStreaming_3_io_out_1_Re; // @[FFTDesigns.scala 3755:15]
    end else begin
      results_1_Re <= 32'h0; // @[FFTDesigns.scala 3758:20]
    end
    if (reset) begin // @[FFTDesigns.scala 3753:26]
      results_1_Im <= 32'h0; // @[FFTDesigns.scala 3753:26]
    end else if (Perm_regdelays_3_17) begin // @[FFTDesigns.scala 3754:59]
      results_1_Im <= PermutationsWithStreaming_3_io_out_1_Im; // @[FFTDesigns.scala 3755:15]
    end else begin
      results_1_Im <= 32'h0; // @[FFTDesigns.scala 3758:20]
    end
    if (reset) begin // @[FFTDesigns.scala 3753:26]
      results_2_Re <= 32'h0; // @[FFTDesigns.scala 3753:26]
    end else if (Perm_regdelays_3_17) begin // @[FFTDesigns.scala 3754:59]
      results_2_Re <= PermutationsWithStreaming_3_io_out_2_Re; // @[FFTDesigns.scala 3755:15]
    end else begin
      results_2_Re <= 32'h0; // @[FFTDesigns.scala 3758:20]
    end
    if (reset) begin // @[FFTDesigns.scala 3753:26]
      results_2_Im <= 32'h0; // @[FFTDesigns.scala 3753:26]
    end else if (Perm_regdelays_3_17) begin // @[FFTDesigns.scala 3754:59]
      results_2_Im <= PermutationsWithStreaming_3_io_out_2_Im; // @[FFTDesigns.scala 3755:15]
    end else begin
      results_2_Im <= 32'h0; // @[FFTDesigns.scala 3758:20]
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
  DFT_regdelays_0_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  DFT_regdelays_0_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  DFT_regdelays_0_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  DFT_regdelays_1_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  DFT_regdelays_1_1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  DFT_regdelays_1_2 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  DFT_regdelays_1_3 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  DFT_regdelays_2_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  DFT_regdelays_2_1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  DFT_regdelays_2_2 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  DFT_regdelays_2_3 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  Twid_regdelays_0_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  Twid_regdelays_0_1 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  Twid_regdelays_1_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  Twid_regdelays_1_1 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  Perm_regdelays_0_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  Perm_regdelays_0_1 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  Perm_regdelays_0_2 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  Perm_regdelays_0_3 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  Perm_regdelays_0_4 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  Perm_regdelays_0_5 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  Perm_regdelays_0_6 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  Perm_regdelays_0_7 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  Perm_regdelays_0_8 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  Perm_regdelays_0_9 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  Perm_regdelays_0_10 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  Perm_regdelays_0_11 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  Perm_regdelays_0_12 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  Perm_regdelays_0_13 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  Perm_regdelays_0_14 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  Perm_regdelays_0_15 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  Perm_regdelays_0_16 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  Perm_regdelays_0_17 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  Perm_regdelays_1_0 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  Perm_regdelays_1_1 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  Perm_regdelays_1_2 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  Perm_regdelays_1_3 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  Perm_regdelays_1_4 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  Perm_regdelays_1_5 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  Perm_regdelays_1_6 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  Perm_regdelays_1_7 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  Perm_regdelays_1_8 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  Perm_regdelays_1_9 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  Perm_regdelays_1_10 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  Perm_regdelays_1_11 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  Perm_regdelays_1_12 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  Perm_regdelays_1_13 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  Perm_regdelays_1_14 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  Perm_regdelays_1_15 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  Perm_regdelays_1_16 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  Perm_regdelays_1_17 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  Perm_regdelays_2_0 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  Perm_regdelays_2_1 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  Perm_regdelays_2_2 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  Perm_regdelays_2_3 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  Perm_regdelays_2_4 = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  Perm_regdelays_2_5 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  Perm_regdelays_2_6 = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  Perm_regdelays_2_7 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  Perm_regdelays_2_8 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  Perm_regdelays_2_9 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  Perm_regdelays_2_10 = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  Perm_regdelays_2_11 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  Perm_regdelays_2_12 = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  Perm_regdelays_2_13 = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  Perm_regdelays_2_14 = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  Perm_regdelays_2_15 = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  Perm_regdelays_2_16 = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  Perm_regdelays_2_17 = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  Perm_regdelays_3_0 = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  Perm_regdelays_3_1 = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  Perm_regdelays_3_2 = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  Perm_regdelays_3_3 = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  Perm_regdelays_3_4 = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  Perm_regdelays_3_5 = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  Perm_regdelays_3_6 = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  Perm_regdelays_3_7 = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  Perm_regdelays_3_8 = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  Perm_regdelays_3_9 = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  Perm_regdelays_3_10 = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  Perm_regdelays_3_11 = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  Perm_regdelays_3_12 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  Perm_regdelays_3_13 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  Perm_regdelays_3_14 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  Perm_regdelays_3_15 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  Perm_regdelays_3_16 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  Perm_regdelays_3_17 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  out_regdelay = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  results_0_Re = _RAND_89[31:0];
  _RAND_90 = {1{`RANDOM}};
  results_0_Im = _RAND_90[31:0];
  _RAND_91 = {1{`RANDOM}};
  results_1_Re = _RAND_91[31:0];
  _RAND_92 = {1{`RANDOM}};
  results_1_Im = _RAND_92[31:0];
  _RAND_93 = {1{`RANDOM}};
  results_2_Re = _RAND_93[31:0];
  _RAND_94 = {1{`RANDOM}};
  results_2_Im = _RAND_94[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
