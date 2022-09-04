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
module PermutationsBasic(
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
  input  [31:0] io_in_6_Re,
  input  [31:0] io_in_6_Im,
  input  [31:0] io_in_7_Re,
  input  [31:0] io_in_7_Im,
  input  [31:0] io_in_8_Re,
  input  [31:0] io_in_8_Im,
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
  output [31:0] io_out_5_Im,
  output [31:0] io_out_6_Re,
  output [31:0] io_out_6_Im,
  output [31:0] io_out_7_Re,
  output [31:0] io_out_7_Im,
  output [31:0] io_out_8_Re,
  output [31:0] io_out_8_Im
);
  assign io_out_0_Re = io_in_0_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_0_Im = io_in_0_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_1_Re = io_in_3_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_1_Im = io_in_3_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_2_Re = io_in_6_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_2_Im = io_in_6_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_3_Re = io_in_1_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_3_Im = io_in_1_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_4_Re = io_in_4_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_4_Im = io_in_4_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_5_Re = io_in_7_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_5_Im = io_in_7_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_6_Re = io_in_2_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_6_Im = io_in_2_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_7_Re = io_in_5_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_7_Im = io_in_5_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_8_Re = io_in_8_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_8_Im = io_in_8_Im; // @[FFTDesigns.scala 2315:17]
endmodule
module FPComplexMult_reducable_v2_12(
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
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
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
  reg [31:0] result_1_Re; // @[FPComplex.scala 344:31]
  reg [31:0] result_1_Im; // @[FPComplex.scala 344:31]
  cmplx_adj cmplx_adj ( // @[FPComplex.scala 333:33]
    .io_in_Re(cmplx_adj_io_in_Re),
    .io_in_Im(cmplx_adj_io_in_Im),
    .io_in_adj(cmplx_adj_io_in_adj),
    .io_is_neg(cmplx_adj_io_is_neg),
    .io_is_flip(cmplx_adj_io_is_flip),
    .io_out_Re(cmplx_adj_io_out_Re),
    .io_out_Im(cmplx_adj_io_out_Im)
  );
  assign io_out_s_Re = result_1_Re; // @[FPComplex.scala 353:20]
  assign io_out_s_Im = result_1_Im; // @[FPComplex.scala 353:20]
  assign cmplx_adj_io_in_Re = io_in_a_Re; // @[FPComplex.scala 334:24]
  assign cmplx_adj_io_in_Im = io_in_a_Im; // @[FPComplex.scala 334:24]
  assign cmplx_adj_io_in_adj = 8'h0; // @[FPComplex.scala 337:30]
  assign cmplx_adj_io_is_neg = 1'h0; // @[FPComplex.scala 341:32]
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
    if (reset) begin // @[FPComplex.scala 344:31]
      result_1_Re <= 32'h0; // @[FPComplex.scala 344:31]
    end else begin
      result_1_Re <= result_0_Re; // @[FPComplex.scala 349:25]
    end
    if (reset) begin // @[FPComplex.scala 344:31]
      result_1_Im <= 32'h0; // @[FPComplex.scala 344:31]
    end else begin
      result_1_Im <= result_0_Im; // @[FPComplex.scala 349:25]
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
  _RAND_2 = {1{`RANDOM}};
  result_1_Re = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  result_1_Im = _RAND_3[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FPComplexMult_reducable_v2_16(
  input         clock,
  input         reset,
  input  [31:0] io_in_a_Re,
  input  [31:0] io_in_a_Im,
  input  [31:0] io_in_b_Re,
  input  [31:0] io_in_b_Im,
  output [31:0] io_out_s_Re,
  output [31:0] io_out_s_Im
);
  wire  FP_subber_clock; // @[FPComplex.scala 372:26]
  wire  FP_subber_reset; // @[FPComplex.scala 372:26]
  wire [31:0] FP_subber_io_in_a; // @[FPComplex.scala 372:26]
  wire [31:0] FP_subber_io_in_b; // @[FPComplex.scala 372:26]
  wire [31:0] FP_subber_io_out_s; // @[FPComplex.scala 372:26]
  wire  FP_adder_clock; // @[FPComplex.scala 373:26]
  wire  FP_adder_reset; // @[FPComplex.scala 373:26]
  wire [31:0] FP_adder_io_in_a; // @[FPComplex.scala 373:26]
  wire [31:0] FP_adder_io_in_b; // @[FPComplex.scala 373:26]
  wire [31:0] FP_adder_io_out_s; // @[FPComplex.scala 373:26]
  wire  FP_multiplier_clock; // @[FPComplex.scala 431:30]
  wire  FP_multiplier_reset; // @[FPComplex.scala 431:30]
  wire [31:0] FP_multiplier_io_in_a; // @[FPComplex.scala 431:30]
  wire [31:0] FP_multiplier_io_in_b; // @[FPComplex.scala 431:30]
  wire [31:0] FP_multiplier_io_out_s; // @[FPComplex.scala 431:30]
  wire  FP_multiplier_1_clock; // @[FPComplex.scala 431:30]
  wire  FP_multiplier_1_reset; // @[FPComplex.scala 431:30]
  wire [31:0] FP_multiplier_1_io_in_a; // @[FPComplex.scala 431:30]
  wire [31:0] FP_multiplier_1_io_in_b; // @[FPComplex.scala 431:30]
  wire [31:0] FP_multiplier_1_io_out_s; // @[FPComplex.scala 431:30]
  wire  FP_multiplier_2_clock; // @[FPComplex.scala 450:30]
  wire  FP_multiplier_2_reset; // @[FPComplex.scala 450:30]
  wire [31:0] FP_multiplier_2_io_in_a; // @[FPComplex.scala 450:30]
  wire [31:0] FP_multiplier_2_io_in_b; // @[FPComplex.scala 450:30]
  wire [31:0] FP_multiplier_2_io_out_s; // @[FPComplex.scala 450:30]
  wire  FP_multiplier_3_clock; // @[FPComplex.scala 450:30]
  wire  FP_multiplier_3_reset; // @[FPComplex.scala 450:30]
  wire [31:0] FP_multiplier_3_io_in_a; // @[FPComplex.scala 450:30]
  wire [31:0] FP_multiplier_3_io_in_b; // @[FPComplex.scala 450:30]
  wire [31:0] FP_multiplier_3_io_out_s; // @[FPComplex.scala 450:30]
  FP_subber FP_subber ( // @[FPComplex.scala 372:26]
    .clock(FP_subber_clock),
    .reset(FP_subber_reset),
    .io_in_a(FP_subber_io_in_a),
    .io_in_b(FP_subber_io_in_b),
    .io_out_s(FP_subber_io_out_s)
  );
  FP_adder FP_adder ( // @[FPComplex.scala 373:26]
    .clock(FP_adder_clock),
    .reset(FP_adder_reset),
    .io_in_a(FP_adder_io_in_a),
    .io_in_b(FP_adder_io_in_b),
    .io_out_s(FP_adder_io_out_s)
  );
  FP_multiplier FP_multiplier ( // @[FPComplex.scala 431:30]
    .clock(FP_multiplier_clock),
    .reset(FP_multiplier_reset),
    .io_in_a(FP_multiplier_io_in_a),
    .io_in_b(FP_multiplier_io_in_b),
    .io_out_s(FP_multiplier_io_out_s)
  );
  FP_multiplier FP_multiplier_1 ( // @[FPComplex.scala 431:30]
    .clock(FP_multiplier_1_clock),
    .reset(FP_multiplier_1_reset),
    .io_in_a(FP_multiplier_1_io_in_a),
    .io_in_b(FP_multiplier_1_io_in_b),
    .io_out_s(FP_multiplier_1_io_out_s)
  );
  FP_multiplier FP_multiplier_2 ( // @[FPComplex.scala 450:30]
    .clock(FP_multiplier_2_clock),
    .reset(FP_multiplier_2_reset),
    .io_in_a(FP_multiplier_2_io_in_a),
    .io_in_b(FP_multiplier_2_io_in_b),
    .io_out_s(FP_multiplier_2_io_out_s)
  );
  FP_multiplier FP_multiplier_3 ( // @[FPComplex.scala 450:30]
    .clock(FP_multiplier_3_clock),
    .reset(FP_multiplier_3_reset),
    .io_in_a(FP_multiplier_3_io_in_a),
    .io_in_b(FP_multiplier_3_io_in_b),
    .io_out_s(FP_multiplier_3_io_out_s)
  );
  assign io_out_s_Re = FP_subber_io_out_s; // @[FPComplex.scala 464:19]
  assign io_out_s_Im = FP_adder_io_out_s; // @[FPComplex.scala 465:19]
  assign FP_subber_clock = clock;
  assign FP_subber_reset = reset;
  assign FP_subber_io_in_a = FP_multiplier_io_out_s; // @[FPComplex.scala 421:30 438:25]
  assign FP_subber_io_in_b = FP_multiplier_3_io_out_s; // @[FPComplex.scala 421:30 458:25]
  assign FP_adder_clock = clock;
  assign FP_adder_reset = reset;
  assign FP_adder_io_in_a = FP_multiplier_2_io_out_s; // @[FPComplex.scala 421:30 457:25]
  assign FP_adder_io_in_b = FP_multiplier_1_io_out_s; // @[FPComplex.scala 421:30 439:25]
  assign FP_multiplier_clock = clock;
  assign FP_multiplier_reset = reset;
  assign FP_multiplier_io_in_a = io_in_a_Re; // @[FPComplex.scala 434:33]
  assign FP_multiplier_io_in_b = io_in_b_Re; // @[FPComplex.scala 435:33]
  assign FP_multiplier_1_clock = clock;
  assign FP_multiplier_1_reset = reset;
  assign FP_multiplier_1_io_in_a = io_in_a_Im; // @[FPComplex.scala 436:33]
  assign FP_multiplier_1_io_in_b = io_in_b_Re; // @[FPComplex.scala 437:33]
  assign FP_multiplier_2_clock = clock;
  assign FP_multiplier_2_reset = reset;
  assign FP_multiplier_2_io_in_a = io_in_a_Re; // @[FPComplex.scala 453:33]
  assign FP_multiplier_2_io_in_b = io_in_b_Im; // @[FPComplex.scala 454:33]
  assign FP_multiplier_3_clock = clock;
  assign FP_multiplier_3_reset = reset;
  assign FP_multiplier_3_io_in_a = io_in_a_Im; // @[FPComplex.scala 455:33]
  assign FP_multiplier_3_io_in_b = io_in_b_Im; // @[FPComplex.scala 456:33]
endmodule
module TwiddleFactors(
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
  input  [31:0] io_in_6_Re,
  input  [31:0] io_in_6_Im,
  input  [31:0] io_in_7_Re,
  input  [31:0] io_in_7_Im,
  input  [31:0] io_in_8_Re,
  input  [31:0] io_in_8_Im,
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
  output [31:0] io_out_5_Im,
  output [31:0] io_out_6_Re,
  output [31:0] io_out_6_Im,
  output [31:0] io_out_7_Re,
  output [31:0] io_out_7_Im,
  output [31:0] io_out_8_Re,
  output [31:0] io_out_8_Im
);
  wire  FPComplexMult_reducable_v2_clock; // @[FFTDesigns.scala 2298:28]
  wire  FPComplexMult_reducable_v2_reset; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_io_in_a_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_io_in_a_Im; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_io_out_s_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_io_out_s_Im; // @[FFTDesigns.scala 2298:28]
  wire  FPComplexMult_reducable_v2_1_clock; // @[FFTDesigns.scala 2298:28]
  wire  FPComplexMult_reducable_v2_1_reset; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_1_io_in_a_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_1_io_in_a_Im; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_1_io_out_s_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_1_io_out_s_Im; // @[FFTDesigns.scala 2298:28]
  wire  FPComplexMult_reducable_v2_2_clock; // @[FFTDesigns.scala 2298:28]
  wire  FPComplexMult_reducable_v2_2_reset; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_2_io_in_a_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_2_io_in_a_Im; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_2_io_out_s_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_2_io_out_s_Im; // @[FFTDesigns.scala 2298:28]
  wire  FPComplexMult_reducable_v2_3_clock; // @[FFTDesigns.scala 2298:28]
  wire  FPComplexMult_reducable_v2_3_reset; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_3_io_in_a_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_3_io_in_a_Im; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_3_io_out_s_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_3_io_out_s_Im; // @[FFTDesigns.scala 2298:28]
  wire  FPComplexMult_reducable_v2_4_clock; // @[FFTDesigns.scala 2298:28]
  wire  FPComplexMult_reducable_v2_4_reset; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_4_io_in_a_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_4_io_in_a_Im; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_4_io_in_b_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_4_io_in_b_Im; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_4_io_out_s_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_4_io_out_s_Im; // @[FFTDesigns.scala 2298:28]
  wire  FPComplexMult_reducable_v2_5_clock; // @[FFTDesigns.scala 2298:28]
  wire  FPComplexMult_reducable_v2_5_reset; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_5_io_in_a_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_5_io_in_a_Im; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_5_io_in_b_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_5_io_in_b_Im; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_5_io_out_s_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_5_io_out_s_Im; // @[FFTDesigns.scala 2298:28]
  wire  FPComplexMult_reducable_v2_6_clock; // @[FFTDesigns.scala 2298:28]
  wire  FPComplexMult_reducable_v2_6_reset; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_6_io_in_a_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_6_io_in_a_Im; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_6_io_out_s_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_6_io_out_s_Im; // @[FFTDesigns.scala 2298:28]
  wire  FPComplexMult_reducable_v2_7_clock; // @[FFTDesigns.scala 2298:28]
  wire  FPComplexMult_reducable_v2_7_reset; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_7_io_in_a_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_7_io_in_a_Im; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_7_io_in_b_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_7_io_in_b_Im; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_7_io_out_s_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_7_io_out_s_Im; // @[FFTDesigns.scala 2298:28]
  wire  FPComplexMult_reducable_v2_8_clock; // @[FFTDesigns.scala 2298:28]
  wire  FPComplexMult_reducable_v2_8_reset; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_8_io_in_a_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_8_io_in_a_Im; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_8_io_in_b_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_8_io_in_b_Im; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_8_io_out_s_Re; // @[FFTDesigns.scala 2298:28]
  wire [31:0] FPComplexMult_reducable_v2_8_io_out_s_Im; // @[FFTDesigns.scala 2298:28]
  FPComplexMult_reducable_v2_12 FPComplexMult_reducable_v2 ( // @[FFTDesigns.scala 2298:28]
    .clock(FPComplexMult_reducable_v2_clock),
    .reset(FPComplexMult_reducable_v2_reset),
    .io_in_a_Re(FPComplexMult_reducable_v2_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_reducable_v2_io_in_a_Im),
    .io_out_s_Re(FPComplexMult_reducable_v2_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_reducable_v2_io_out_s_Im)
  );
  FPComplexMult_reducable_v2_12 FPComplexMult_reducable_v2_1 ( // @[FFTDesigns.scala 2298:28]
    .clock(FPComplexMult_reducable_v2_1_clock),
    .reset(FPComplexMult_reducable_v2_1_reset),
    .io_in_a_Re(FPComplexMult_reducable_v2_1_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_reducable_v2_1_io_in_a_Im),
    .io_out_s_Re(FPComplexMult_reducable_v2_1_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_reducable_v2_1_io_out_s_Im)
  );
  FPComplexMult_reducable_v2_12 FPComplexMult_reducable_v2_2 ( // @[FFTDesigns.scala 2298:28]
    .clock(FPComplexMult_reducable_v2_2_clock),
    .reset(FPComplexMult_reducable_v2_2_reset),
    .io_in_a_Re(FPComplexMult_reducable_v2_2_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_reducable_v2_2_io_in_a_Im),
    .io_out_s_Re(FPComplexMult_reducable_v2_2_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_reducable_v2_2_io_out_s_Im)
  );
  FPComplexMult_reducable_v2_12 FPComplexMult_reducable_v2_3 ( // @[FFTDesigns.scala 2298:28]
    .clock(FPComplexMult_reducable_v2_3_clock),
    .reset(FPComplexMult_reducable_v2_3_reset),
    .io_in_a_Re(FPComplexMult_reducable_v2_3_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_reducable_v2_3_io_in_a_Im),
    .io_out_s_Re(FPComplexMult_reducable_v2_3_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_reducable_v2_3_io_out_s_Im)
  );
  FPComplexMult_reducable_v2_16 FPComplexMult_reducable_v2_4 ( // @[FFTDesigns.scala 2298:28]
    .clock(FPComplexMult_reducable_v2_4_clock),
    .reset(FPComplexMult_reducable_v2_4_reset),
    .io_in_a_Re(FPComplexMult_reducable_v2_4_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_reducable_v2_4_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_reducable_v2_4_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_reducable_v2_4_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_reducable_v2_4_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_reducable_v2_4_io_out_s_Im)
  );
  FPComplexMult_reducable_v2_16 FPComplexMult_reducable_v2_5 ( // @[FFTDesigns.scala 2298:28]
    .clock(FPComplexMult_reducable_v2_5_clock),
    .reset(FPComplexMult_reducable_v2_5_reset),
    .io_in_a_Re(FPComplexMult_reducable_v2_5_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_reducable_v2_5_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_reducable_v2_5_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_reducable_v2_5_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_reducable_v2_5_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_reducable_v2_5_io_out_s_Im)
  );
  FPComplexMult_reducable_v2_12 FPComplexMult_reducable_v2_6 ( // @[FFTDesigns.scala 2298:28]
    .clock(FPComplexMult_reducable_v2_6_clock),
    .reset(FPComplexMult_reducable_v2_6_reset),
    .io_in_a_Re(FPComplexMult_reducable_v2_6_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_reducable_v2_6_io_in_a_Im),
    .io_out_s_Re(FPComplexMult_reducable_v2_6_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_reducable_v2_6_io_out_s_Im)
  );
  FPComplexMult_reducable_v2_16 FPComplexMult_reducable_v2_7 ( // @[FFTDesigns.scala 2298:28]
    .clock(FPComplexMult_reducable_v2_7_clock),
    .reset(FPComplexMult_reducable_v2_7_reset),
    .io_in_a_Re(FPComplexMult_reducable_v2_7_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_reducable_v2_7_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_reducable_v2_7_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_reducable_v2_7_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_reducable_v2_7_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_reducable_v2_7_io_out_s_Im)
  );
  FPComplexMult_reducable_v2_16 FPComplexMult_reducable_v2_8 ( // @[FFTDesigns.scala 2298:28]
    .clock(FPComplexMult_reducable_v2_8_clock),
    .reset(FPComplexMult_reducable_v2_8_reset),
    .io_in_a_Re(FPComplexMult_reducable_v2_8_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_reducable_v2_8_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_reducable_v2_8_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_reducable_v2_8_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_reducable_v2_8_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_reducable_v2_8_io_out_s_Im)
  );
  assign io_out_0_Re = FPComplexMult_reducable_v2_io_out_s_Re; // @[FFTDesigns.scala 2305:17]
  assign io_out_0_Im = FPComplexMult_reducable_v2_io_out_s_Im; // @[FFTDesigns.scala 2305:17]
  assign io_out_1_Re = FPComplexMult_reducable_v2_1_io_out_s_Re; // @[FFTDesigns.scala 2305:17]
  assign io_out_1_Im = FPComplexMult_reducable_v2_1_io_out_s_Im; // @[FFTDesigns.scala 2305:17]
  assign io_out_2_Re = FPComplexMult_reducable_v2_2_io_out_s_Re; // @[FFTDesigns.scala 2305:17]
  assign io_out_2_Im = FPComplexMult_reducable_v2_2_io_out_s_Im; // @[FFTDesigns.scala 2305:17]
  assign io_out_3_Re = FPComplexMult_reducable_v2_3_io_out_s_Re; // @[FFTDesigns.scala 2305:17]
  assign io_out_3_Im = FPComplexMult_reducable_v2_3_io_out_s_Im; // @[FFTDesigns.scala 2305:17]
  assign io_out_4_Re = FPComplexMult_reducable_v2_4_io_out_s_Re; // @[FFTDesigns.scala 2305:17]
  assign io_out_4_Im = FPComplexMult_reducable_v2_4_io_out_s_Im; // @[FFTDesigns.scala 2305:17]
  assign io_out_5_Re = FPComplexMult_reducable_v2_5_io_out_s_Re; // @[FFTDesigns.scala 2305:17]
  assign io_out_5_Im = FPComplexMult_reducable_v2_5_io_out_s_Im; // @[FFTDesigns.scala 2305:17]
  assign io_out_6_Re = FPComplexMult_reducable_v2_6_io_out_s_Re; // @[FFTDesigns.scala 2305:17]
  assign io_out_6_Im = FPComplexMult_reducable_v2_6_io_out_s_Im; // @[FFTDesigns.scala 2305:17]
  assign io_out_7_Re = FPComplexMult_reducable_v2_7_io_out_s_Re; // @[FFTDesigns.scala 2305:17]
  assign io_out_7_Im = FPComplexMult_reducable_v2_7_io_out_s_Im; // @[FFTDesigns.scala 2305:17]
  assign io_out_8_Re = FPComplexMult_reducable_v2_8_io_out_s_Re; // @[FFTDesigns.scala 2305:17]
  assign io_out_8_Im = FPComplexMult_reducable_v2_8_io_out_s_Im; // @[FFTDesigns.scala 2305:17]
  assign FPComplexMult_reducable_v2_clock = clock;
  assign FPComplexMult_reducable_v2_reset = reset;
  assign FPComplexMult_reducable_v2_io_in_a_Re = io_in_0_Re; // @[FFTDesigns.scala 2302:27]
  assign FPComplexMult_reducable_v2_io_in_a_Im = io_in_0_Im; // @[FFTDesigns.scala 2302:27]
  assign FPComplexMult_reducable_v2_1_clock = clock;
  assign FPComplexMult_reducable_v2_1_reset = reset;
  assign FPComplexMult_reducable_v2_1_io_in_a_Re = io_in_1_Re; // @[FFTDesigns.scala 2302:27]
  assign FPComplexMult_reducable_v2_1_io_in_a_Im = io_in_1_Im; // @[FFTDesigns.scala 2302:27]
  assign FPComplexMult_reducable_v2_2_clock = clock;
  assign FPComplexMult_reducable_v2_2_reset = reset;
  assign FPComplexMult_reducable_v2_2_io_in_a_Re = io_in_2_Re; // @[FFTDesigns.scala 2302:27]
  assign FPComplexMult_reducable_v2_2_io_in_a_Im = io_in_2_Im; // @[FFTDesigns.scala 2302:27]
  assign FPComplexMult_reducable_v2_3_clock = clock;
  assign FPComplexMult_reducable_v2_3_reset = reset;
  assign FPComplexMult_reducable_v2_3_io_in_a_Re = io_in_3_Re; // @[FFTDesigns.scala 2302:27]
  assign FPComplexMult_reducable_v2_3_io_in_a_Im = io_in_3_Im; // @[FFTDesigns.scala 2302:27]
  assign FPComplexMult_reducable_v2_4_clock = clock;
  assign FPComplexMult_reducable_v2_4_reset = reset;
  assign FPComplexMult_reducable_v2_4_io_in_a_Re = io_in_4_Re; // @[FFTDesigns.scala 2302:27]
  assign FPComplexMult_reducable_v2_4_io_in_a_Im = io_in_4_Im; // @[FFTDesigns.scala 2302:27]
  assign FPComplexMult_reducable_v2_4_io_in_b_Re = 32'h3f441b7c; // @[FFTDesigns.scala 2303:30]
  assign FPComplexMult_reducable_v2_4_io_in_b_Im = 32'hbf248dba; // @[FFTDesigns.scala 2304:30]
  assign FPComplexMult_reducable_v2_5_clock = clock;
  assign FPComplexMult_reducable_v2_5_reset = reset;
  assign FPComplexMult_reducable_v2_5_io_in_a_Re = io_in_5_Re; // @[FFTDesigns.scala 2302:27]
  assign FPComplexMult_reducable_v2_5_io_in_a_Im = io_in_5_Im; // @[FFTDesigns.scala 2302:27]
  assign FPComplexMult_reducable_v2_5_io_in_b_Re = 32'h3e31d0d0; // @[FFTDesigns.scala 2303:30]
  assign FPComplexMult_reducable_v2_5_io_in_b_Im = 32'hbf7c1c5c; // @[FFTDesigns.scala 2304:30]
  assign FPComplexMult_reducable_v2_6_clock = clock;
  assign FPComplexMult_reducable_v2_6_reset = reset;
  assign FPComplexMult_reducable_v2_6_io_in_a_Re = io_in_6_Re; // @[FFTDesigns.scala 2302:27]
  assign FPComplexMult_reducable_v2_6_io_in_a_Im = io_in_6_Im; // @[FFTDesigns.scala 2302:27]
  assign FPComplexMult_reducable_v2_7_clock = clock;
  assign FPComplexMult_reducable_v2_7_reset = reset;
  assign FPComplexMult_reducable_v2_7_io_in_a_Re = io_in_7_Re; // @[FFTDesigns.scala 2302:27]
  assign FPComplexMult_reducable_v2_7_io_in_a_Im = io_in_7_Im; // @[FFTDesigns.scala 2302:27]
  assign FPComplexMult_reducable_v2_7_io_in_b_Re = 32'h3e31d0d0; // @[FFTDesigns.scala 2303:30]
  assign FPComplexMult_reducable_v2_7_io_in_b_Im = 32'hbf7c1c5c; // @[FFTDesigns.scala 2304:30]
  assign FPComplexMult_reducable_v2_8_clock = clock;
  assign FPComplexMult_reducable_v2_8_reset = reset;
  assign FPComplexMult_reducable_v2_8_io_in_a_Re = io_in_8_Re; // @[FFTDesigns.scala 2302:27]
  assign FPComplexMult_reducable_v2_8_io_in_a_Im = io_in_8_Im; // @[FFTDesigns.scala 2302:27]
  assign FPComplexMult_reducable_v2_8_io_in_b_Re = 32'hbf708fb2; // @[FFTDesigns.scala 2303:30]
  assign FPComplexMult_reducable_v2_8_io_in_b_Im = 32'hbeaf1d40; // @[FFTDesigns.scala 2304:30]
endmodule
module FFT_sr_v2_nrv(
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
  input  [31:0] io_in_6_Re,
  input  [31:0] io_in_6_Im,
  input  [31:0] io_in_7_Re,
  input  [31:0] io_in_7_Im,
  input  [31:0] io_in_8_Re,
  input  [31:0] io_in_8_Im,
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
  output [31:0] io_out_5_Im,
  output [31:0] io_out_6_Re,
  output [31:0] io_out_6_Im,
  output [31:0] io_out_7_Re,
  output [31:0] io_out_7_Im,
  output [31:0] io_out_8_Re,
  output [31:0] io_out_8_Im
);
  wire  DFT_r_v2_clock; // @[FFTDesigns.scala 3122:34]
  wire  DFT_r_v2_reset; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_io_in_0_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_io_in_0_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_io_in_1_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_io_in_1_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_io_in_2_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_io_in_2_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_io_out_0_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_io_out_0_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_io_out_1_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_io_out_1_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_io_out_2_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_io_out_2_Im; // @[FFTDesigns.scala 3122:34]
  wire  DFT_r_v2_1_clock; // @[FFTDesigns.scala 3122:34]
  wire  DFT_r_v2_1_reset; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_1_io_in_0_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_1_io_in_0_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_1_io_in_1_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_1_io_in_1_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_1_io_in_2_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_1_io_in_2_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_1_io_out_0_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_1_io_out_0_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_1_io_out_1_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_1_io_out_1_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_1_io_out_2_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_1_io_out_2_Im; // @[FFTDesigns.scala 3122:34]
  wire  DFT_r_v2_2_clock; // @[FFTDesigns.scala 3122:34]
  wire  DFT_r_v2_2_reset; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_2_io_in_0_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_2_io_in_0_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_2_io_in_1_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_2_io_in_1_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_2_io_in_2_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_2_io_in_2_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_2_io_out_0_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_2_io_out_0_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_2_io_out_1_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_2_io_out_1_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_2_io_out_2_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_2_io_out_2_Im; // @[FFTDesigns.scala 3122:34]
  wire  DFT_r_v2_3_clock; // @[FFTDesigns.scala 3122:34]
  wire  DFT_r_v2_3_reset; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_3_io_in_0_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_3_io_in_0_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_3_io_in_1_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_3_io_in_1_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_3_io_in_2_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_3_io_in_2_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_3_io_out_0_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_3_io_out_0_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_3_io_out_1_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_3_io_out_1_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_3_io_out_2_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_3_io_out_2_Im; // @[FFTDesigns.scala 3122:34]
  wire  DFT_r_v2_4_clock; // @[FFTDesigns.scala 3122:34]
  wire  DFT_r_v2_4_reset; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_4_io_in_0_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_4_io_in_0_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_4_io_in_1_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_4_io_in_1_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_4_io_in_2_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_4_io_in_2_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_4_io_out_0_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_4_io_out_0_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_4_io_out_1_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_4_io_out_1_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_4_io_out_2_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_4_io_out_2_Im; // @[FFTDesigns.scala 3122:34]
  wire  DFT_r_v2_5_clock; // @[FFTDesigns.scala 3122:34]
  wire  DFT_r_v2_5_reset; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_5_io_in_0_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_5_io_in_0_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_5_io_in_1_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_5_io_in_1_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_5_io_in_2_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_5_io_in_2_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_5_io_out_0_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_5_io_out_0_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_5_io_out_1_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_5_io_out_1_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_5_io_out_2_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_5_io_out_2_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] PermutationsBasic_io_in_0_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_in_0_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_in_1_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_in_1_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_in_2_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_in_2_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_in_3_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_in_3_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_in_4_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_in_4_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_in_5_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_in_5_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_in_6_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_in_6_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_in_7_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_in_7_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_in_8_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_in_8_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_0_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_0_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_1_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_1_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_2_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_2_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_3_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_3_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_4_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_4_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_5_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_5_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_6_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_6_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_7_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_7_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_8_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_8_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_1_io_in_0_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_in_0_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_in_1_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_in_1_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_in_2_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_in_2_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_in_3_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_in_3_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_in_4_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_in_4_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_in_5_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_in_5_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_in_6_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_in_6_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_in_7_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_in_7_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_in_8_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_in_8_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_0_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_0_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_1_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_1_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_2_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_2_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_3_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_3_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_4_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_4_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_5_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_5_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_6_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_6_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_7_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_7_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_8_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_8_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_in_0_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_in_0_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_in_1_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_in_1_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_in_2_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_in_2_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_in_3_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_in_3_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_in_4_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_in_4_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_in_5_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_in_5_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_in_6_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_in_6_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_in_7_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_in_7_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_in_8_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_in_8_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_out_0_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_out_0_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_out_1_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_out_1_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_out_2_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_out_2_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_out_3_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_out_3_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_out_4_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_out_4_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_out_5_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_out_5_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_out_6_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_out_6_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_out_7_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_out_7_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_out_8_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_2_io_out_8_Im; // @[FFTDesigns.scala 3129:37]
  wire  TwiddleFactors_clock; // @[FFTDesigns.scala 3133:24]
  wire  TwiddleFactors_reset; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_in_0_Re; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_in_0_Im; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_in_1_Re; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_in_1_Im; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_in_2_Re; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_in_2_Im; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_in_3_Re; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_in_3_Im; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_in_4_Re; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_in_4_Im; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_in_5_Re; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_in_5_Im; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_in_6_Re; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_in_6_Im; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_in_7_Re; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_in_7_Im; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_in_8_Re; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_in_8_Im; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_out_0_Re; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_out_0_Im; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_out_1_Re; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_out_1_Im; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_out_2_Re; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_out_2_Im; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_out_3_Re; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_out_3_Im; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_out_4_Re; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_out_4_Im; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_out_5_Re; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_out_5_Im; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_out_6_Re; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_out_6_Im; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_out_7_Re; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_out_7_Im; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_out_8_Re; // @[FFTDesigns.scala 3133:24]
  wire [31:0] TwiddleFactors_io_out_8_Im; // @[FFTDesigns.scala 3133:24]
  DFT_r_v2 DFT_r_v2 ( // @[FFTDesigns.scala 3122:34]
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
  DFT_r_v2 DFT_r_v2_1 ( // @[FFTDesigns.scala 3122:34]
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
  DFT_r_v2 DFT_r_v2_2 ( // @[FFTDesigns.scala 3122:34]
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
  DFT_r_v2 DFT_r_v2_3 ( // @[FFTDesigns.scala 3122:34]
    .clock(DFT_r_v2_3_clock),
    .reset(DFT_r_v2_3_reset),
    .io_in_0_Re(DFT_r_v2_3_io_in_0_Re),
    .io_in_0_Im(DFT_r_v2_3_io_in_0_Im),
    .io_in_1_Re(DFT_r_v2_3_io_in_1_Re),
    .io_in_1_Im(DFT_r_v2_3_io_in_1_Im),
    .io_in_2_Re(DFT_r_v2_3_io_in_2_Re),
    .io_in_2_Im(DFT_r_v2_3_io_in_2_Im),
    .io_out_0_Re(DFT_r_v2_3_io_out_0_Re),
    .io_out_0_Im(DFT_r_v2_3_io_out_0_Im),
    .io_out_1_Re(DFT_r_v2_3_io_out_1_Re),
    .io_out_1_Im(DFT_r_v2_3_io_out_1_Im),
    .io_out_2_Re(DFT_r_v2_3_io_out_2_Re),
    .io_out_2_Im(DFT_r_v2_3_io_out_2_Im)
  );
  DFT_r_v2 DFT_r_v2_4 ( // @[FFTDesigns.scala 3122:34]
    .clock(DFT_r_v2_4_clock),
    .reset(DFT_r_v2_4_reset),
    .io_in_0_Re(DFT_r_v2_4_io_in_0_Re),
    .io_in_0_Im(DFT_r_v2_4_io_in_0_Im),
    .io_in_1_Re(DFT_r_v2_4_io_in_1_Re),
    .io_in_1_Im(DFT_r_v2_4_io_in_1_Im),
    .io_in_2_Re(DFT_r_v2_4_io_in_2_Re),
    .io_in_2_Im(DFT_r_v2_4_io_in_2_Im),
    .io_out_0_Re(DFT_r_v2_4_io_out_0_Re),
    .io_out_0_Im(DFT_r_v2_4_io_out_0_Im),
    .io_out_1_Re(DFT_r_v2_4_io_out_1_Re),
    .io_out_1_Im(DFT_r_v2_4_io_out_1_Im),
    .io_out_2_Re(DFT_r_v2_4_io_out_2_Re),
    .io_out_2_Im(DFT_r_v2_4_io_out_2_Im)
  );
  DFT_r_v2 DFT_r_v2_5 ( // @[FFTDesigns.scala 3122:34]
    .clock(DFT_r_v2_5_clock),
    .reset(DFT_r_v2_5_reset),
    .io_in_0_Re(DFT_r_v2_5_io_in_0_Re),
    .io_in_0_Im(DFT_r_v2_5_io_in_0_Im),
    .io_in_1_Re(DFT_r_v2_5_io_in_1_Re),
    .io_in_1_Im(DFT_r_v2_5_io_in_1_Im),
    .io_in_2_Re(DFT_r_v2_5_io_in_2_Re),
    .io_in_2_Im(DFT_r_v2_5_io_in_2_Im),
    .io_out_0_Re(DFT_r_v2_5_io_out_0_Re),
    .io_out_0_Im(DFT_r_v2_5_io_out_0_Im),
    .io_out_1_Re(DFT_r_v2_5_io_out_1_Re),
    .io_out_1_Im(DFT_r_v2_5_io_out_1_Im),
    .io_out_2_Re(DFT_r_v2_5_io_out_2_Re),
    .io_out_2_Im(DFT_r_v2_5_io_out_2_Im)
  );
  PermutationsBasic PermutationsBasic ( // @[FFTDesigns.scala 3127:35]
    .io_in_0_Re(PermutationsBasic_io_in_0_Re),
    .io_in_0_Im(PermutationsBasic_io_in_0_Im),
    .io_in_1_Re(PermutationsBasic_io_in_1_Re),
    .io_in_1_Im(PermutationsBasic_io_in_1_Im),
    .io_in_2_Re(PermutationsBasic_io_in_2_Re),
    .io_in_2_Im(PermutationsBasic_io_in_2_Im),
    .io_in_3_Re(PermutationsBasic_io_in_3_Re),
    .io_in_3_Im(PermutationsBasic_io_in_3_Im),
    .io_in_4_Re(PermutationsBasic_io_in_4_Re),
    .io_in_4_Im(PermutationsBasic_io_in_4_Im),
    .io_in_5_Re(PermutationsBasic_io_in_5_Re),
    .io_in_5_Im(PermutationsBasic_io_in_5_Im),
    .io_in_6_Re(PermutationsBasic_io_in_6_Re),
    .io_in_6_Im(PermutationsBasic_io_in_6_Im),
    .io_in_7_Re(PermutationsBasic_io_in_7_Re),
    .io_in_7_Im(PermutationsBasic_io_in_7_Im),
    .io_in_8_Re(PermutationsBasic_io_in_8_Re),
    .io_in_8_Im(PermutationsBasic_io_in_8_Im),
    .io_out_0_Re(PermutationsBasic_io_out_0_Re),
    .io_out_0_Im(PermutationsBasic_io_out_0_Im),
    .io_out_1_Re(PermutationsBasic_io_out_1_Re),
    .io_out_1_Im(PermutationsBasic_io_out_1_Im),
    .io_out_2_Re(PermutationsBasic_io_out_2_Re),
    .io_out_2_Im(PermutationsBasic_io_out_2_Im),
    .io_out_3_Re(PermutationsBasic_io_out_3_Re),
    .io_out_3_Im(PermutationsBasic_io_out_3_Im),
    .io_out_4_Re(PermutationsBasic_io_out_4_Re),
    .io_out_4_Im(PermutationsBasic_io_out_4_Im),
    .io_out_5_Re(PermutationsBasic_io_out_5_Re),
    .io_out_5_Im(PermutationsBasic_io_out_5_Im),
    .io_out_6_Re(PermutationsBasic_io_out_6_Re),
    .io_out_6_Im(PermutationsBasic_io_out_6_Im),
    .io_out_7_Re(PermutationsBasic_io_out_7_Re),
    .io_out_7_Im(PermutationsBasic_io_out_7_Im),
    .io_out_8_Re(PermutationsBasic_io_out_8_Re),
    .io_out_8_Im(PermutationsBasic_io_out_8_Im)
  );
  PermutationsBasic PermutationsBasic_1 ( // @[FFTDesigns.scala 3129:37]
    .io_in_0_Re(PermutationsBasic_1_io_in_0_Re),
    .io_in_0_Im(PermutationsBasic_1_io_in_0_Im),
    .io_in_1_Re(PermutationsBasic_1_io_in_1_Re),
    .io_in_1_Im(PermutationsBasic_1_io_in_1_Im),
    .io_in_2_Re(PermutationsBasic_1_io_in_2_Re),
    .io_in_2_Im(PermutationsBasic_1_io_in_2_Im),
    .io_in_3_Re(PermutationsBasic_1_io_in_3_Re),
    .io_in_3_Im(PermutationsBasic_1_io_in_3_Im),
    .io_in_4_Re(PermutationsBasic_1_io_in_4_Re),
    .io_in_4_Im(PermutationsBasic_1_io_in_4_Im),
    .io_in_5_Re(PermutationsBasic_1_io_in_5_Re),
    .io_in_5_Im(PermutationsBasic_1_io_in_5_Im),
    .io_in_6_Re(PermutationsBasic_1_io_in_6_Re),
    .io_in_6_Im(PermutationsBasic_1_io_in_6_Im),
    .io_in_7_Re(PermutationsBasic_1_io_in_7_Re),
    .io_in_7_Im(PermutationsBasic_1_io_in_7_Im),
    .io_in_8_Re(PermutationsBasic_1_io_in_8_Re),
    .io_in_8_Im(PermutationsBasic_1_io_in_8_Im),
    .io_out_0_Re(PermutationsBasic_1_io_out_0_Re),
    .io_out_0_Im(PermutationsBasic_1_io_out_0_Im),
    .io_out_1_Re(PermutationsBasic_1_io_out_1_Re),
    .io_out_1_Im(PermutationsBasic_1_io_out_1_Im),
    .io_out_2_Re(PermutationsBasic_1_io_out_2_Re),
    .io_out_2_Im(PermutationsBasic_1_io_out_2_Im),
    .io_out_3_Re(PermutationsBasic_1_io_out_3_Re),
    .io_out_3_Im(PermutationsBasic_1_io_out_3_Im),
    .io_out_4_Re(PermutationsBasic_1_io_out_4_Re),
    .io_out_4_Im(PermutationsBasic_1_io_out_4_Im),
    .io_out_5_Re(PermutationsBasic_1_io_out_5_Re),
    .io_out_5_Im(PermutationsBasic_1_io_out_5_Im),
    .io_out_6_Re(PermutationsBasic_1_io_out_6_Re),
    .io_out_6_Im(PermutationsBasic_1_io_out_6_Im),
    .io_out_7_Re(PermutationsBasic_1_io_out_7_Re),
    .io_out_7_Im(PermutationsBasic_1_io_out_7_Im),
    .io_out_8_Re(PermutationsBasic_1_io_out_8_Re),
    .io_out_8_Im(PermutationsBasic_1_io_out_8_Im)
  );
  PermutationsBasic PermutationsBasic_2 ( // @[FFTDesigns.scala 3129:37]
    .io_in_0_Re(PermutationsBasic_2_io_in_0_Re),
    .io_in_0_Im(PermutationsBasic_2_io_in_0_Im),
    .io_in_1_Re(PermutationsBasic_2_io_in_1_Re),
    .io_in_1_Im(PermutationsBasic_2_io_in_1_Im),
    .io_in_2_Re(PermutationsBasic_2_io_in_2_Re),
    .io_in_2_Im(PermutationsBasic_2_io_in_2_Im),
    .io_in_3_Re(PermutationsBasic_2_io_in_3_Re),
    .io_in_3_Im(PermutationsBasic_2_io_in_3_Im),
    .io_in_4_Re(PermutationsBasic_2_io_in_4_Re),
    .io_in_4_Im(PermutationsBasic_2_io_in_4_Im),
    .io_in_5_Re(PermutationsBasic_2_io_in_5_Re),
    .io_in_5_Im(PermutationsBasic_2_io_in_5_Im),
    .io_in_6_Re(PermutationsBasic_2_io_in_6_Re),
    .io_in_6_Im(PermutationsBasic_2_io_in_6_Im),
    .io_in_7_Re(PermutationsBasic_2_io_in_7_Re),
    .io_in_7_Im(PermutationsBasic_2_io_in_7_Im),
    .io_in_8_Re(PermutationsBasic_2_io_in_8_Re),
    .io_in_8_Im(PermutationsBasic_2_io_in_8_Im),
    .io_out_0_Re(PermutationsBasic_2_io_out_0_Re),
    .io_out_0_Im(PermutationsBasic_2_io_out_0_Im),
    .io_out_1_Re(PermutationsBasic_2_io_out_1_Re),
    .io_out_1_Im(PermutationsBasic_2_io_out_1_Im),
    .io_out_2_Re(PermutationsBasic_2_io_out_2_Re),
    .io_out_2_Im(PermutationsBasic_2_io_out_2_Im),
    .io_out_3_Re(PermutationsBasic_2_io_out_3_Re),
    .io_out_3_Im(PermutationsBasic_2_io_out_3_Im),
    .io_out_4_Re(PermutationsBasic_2_io_out_4_Re),
    .io_out_4_Im(PermutationsBasic_2_io_out_4_Im),
    .io_out_5_Re(PermutationsBasic_2_io_out_5_Re),
    .io_out_5_Im(PermutationsBasic_2_io_out_5_Im),
    .io_out_6_Re(PermutationsBasic_2_io_out_6_Re),
    .io_out_6_Im(PermutationsBasic_2_io_out_6_Im),
    .io_out_7_Re(PermutationsBasic_2_io_out_7_Re),
    .io_out_7_Im(PermutationsBasic_2_io_out_7_Im),
    .io_out_8_Re(PermutationsBasic_2_io_out_8_Re),
    .io_out_8_Im(PermutationsBasic_2_io_out_8_Im)
  );
  TwiddleFactors TwiddleFactors ( // @[FFTDesigns.scala 3133:24]
    .clock(TwiddleFactors_clock),
    .reset(TwiddleFactors_reset),
    .io_in_0_Re(TwiddleFactors_io_in_0_Re),
    .io_in_0_Im(TwiddleFactors_io_in_0_Im),
    .io_in_1_Re(TwiddleFactors_io_in_1_Re),
    .io_in_1_Im(TwiddleFactors_io_in_1_Im),
    .io_in_2_Re(TwiddleFactors_io_in_2_Re),
    .io_in_2_Im(TwiddleFactors_io_in_2_Im),
    .io_in_3_Re(TwiddleFactors_io_in_3_Re),
    .io_in_3_Im(TwiddleFactors_io_in_3_Im),
    .io_in_4_Re(TwiddleFactors_io_in_4_Re),
    .io_in_4_Im(TwiddleFactors_io_in_4_Im),
    .io_in_5_Re(TwiddleFactors_io_in_5_Re),
    .io_in_5_Im(TwiddleFactors_io_in_5_Im),
    .io_in_6_Re(TwiddleFactors_io_in_6_Re),
    .io_in_6_Im(TwiddleFactors_io_in_6_Im),
    .io_in_7_Re(TwiddleFactors_io_in_7_Re),
    .io_in_7_Im(TwiddleFactors_io_in_7_Im),
    .io_in_8_Re(TwiddleFactors_io_in_8_Re),
    .io_in_8_Im(TwiddleFactors_io_in_8_Im),
    .io_out_0_Re(TwiddleFactors_io_out_0_Re),
    .io_out_0_Im(TwiddleFactors_io_out_0_Im),
    .io_out_1_Re(TwiddleFactors_io_out_1_Re),
    .io_out_1_Im(TwiddleFactors_io_out_1_Im),
    .io_out_2_Re(TwiddleFactors_io_out_2_Re),
    .io_out_2_Im(TwiddleFactors_io_out_2_Im),
    .io_out_3_Re(TwiddleFactors_io_out_3_Re),
    .io_out_3_Im(TwiddleFactors_io_out_3_Im),
    .io_out_4_Re(TwiddleFactors_io_out_4_Re),
    .io_out_4_Im(TwiddleFactors_io_out_4_Im),
    .io_out_5_Re(TwiddleFactors_io_out_5_Re),
    .io_out_5_Im(TwiddleFactors_io_out_5_Im),
    .io_out_6_Re(TwiddleFactors_io_out_6_Re),
    .io_out_6_Im(TwiddleFactors_io_out_6_Im),
    .io_out_7_Re(TwiddleFactors_io_out_7_Re),
    .io_out_7_Im(TwiddleFactors_io_out_7_Im),
    .io_out_8_Re(TwiddleFactors_io_out_8_Re),
    .io_out_8_Im(TwiddleFactors_io_out_8_Im)
  );
  assign io_out_0_Re = PermutationsBasic_2_io_out_0_Re; // @[FFTDesigns.scala 3159:12]
  assign io_out_0_Im = PermutationsBasic_2_io_out_0_Im; // @[FFTDesigns.scala 3159:12]
  assign io_out_1_Re = PermutationsBasic_2_io_out_1_Re; // @[FFTDesigns.scala 3159:12]
  assign io_out_1_Im = PermutationsBasic_2_io_out_1_Im; // @[FFTDesigns.scala 3159:12]
  assign io_out_2_Re = PermutationsBasic_2_io_out_2_Re; // @[FFTDesigns.scala 3159:12]
  assign io_out_2_Im = PermutationsBasic_2_io_out_2_Im; // @[FFTDesigns.scala 3159:12]
  assign io_out_3_Re = PermutationsBasic_2_io_out_3_Re; // @[FFTDesigns.scala 3159:12]
  assign io_out_3_Im = PermutationsBasic_2_io_out_3_Im; // @[FFTDesigns.scala 3159:12]
  assign io_out_4_Re = PermutationsBasic_2_io_out_4_Re; // @[FFTDesigns.scala 3159:12]
  assign io_out_4_Im = PermutationsBasic_2_io_out_4_Im; // @[FFTDesigns.scala 3159:12]
  assign io_out_5_Re = PermutationsBasic_2_io_out_5_Re; // @[FFTDesigns.scala 3159:12]
  assign io_out_5_Im = PermutationsBasic_2_io_out_5_Im; // @[FFTDesigns.scala 3159:12]
  assign io_out_6_Re = PermutationsBasic_2_io_out_6_Re; // @[FFTDesigns.scala 3159:12]
  assign io_out_6_Im = PermutationsBasic_2_io_out_6_Im; // @[FFTDesigns.scala 3159:12]
  assign io_out_7_Re = PermutationsBasic_2_io_out_7_Re; // @[FFTDesigns.scala 3159:12]
  assign io_out_7_Im = PermutationsBasic_2_io_out_7_Im; // @[FFTDesigns.scala 3159:12]
  assign io_out_8_Re = PermutationsBasic_2_io_out_8_Re; // @[FFTDesigns.scala 3159:12]
  assign io_out_8_Im = PermutationsBasic_2_io_out_8_Im; // @[FFTDesigns.scala 3159:12]
  assign DFT_r_v2_clock = clock;
  assign DFT_r_v2_reset = reset;
  assign DFT_r_v2_io_in_0_Re = PermutationsBasic_io_out_0_Re; // @[FFTDesigns.scala 3145:39]
  assign DFT_r_v2_io_in_0_Im = PermutationsBasic_io_out_0_Im; // @[FFTDesigns.scala 3145:39]
  assign DFT_r_v2_io_in_1_Re = PermutationsBasic_io_out_1_Re; // @[FFTDesigns.scala 3145:39]
  assign DFT_r_v2_io_in_1_Im = PermutationsBasic_io_out_1_Im; // @[FFTDesigns.scala 3145:39]
  assign DFT_r_v2_io_in_2_Re = PermutationsBasic_io_out_2_Re; // @[FFTDesigns.scala 3145:39]
  assign DFT_r_v2_io_in_2_Im = PermutationsBasic_io_out_2_Im; // @[FFTDesigns.scala 3145:39]
  assign DFT_r_v2_1_clock = clock;
  assign DFT_r_v2_1_reset = reset;
  assign DFT_r_v2_1_io_in_0_Re = PermutationsBasic_io_out_3_Re; // @[FFTDesigns.scala 3145:39]
  assign DFT_r_v2_1_io_in_0_Im = PermutationsBasic_io_out_3_Im; // @[FFTDesigns.scala 3145:39]
  assign DFT_r_v2_1_io_in_1_Re = PermutationsBasic_io_out_4_Re; // @[FFTDesigns.scala 3145:39]
  assign DFT_r_v2_1_io_in_1_Im = PermutationsBasic_io_out_4_Im; // @[FFTDesigns.scala 3145:39]
  assign DFT_r_v2_1_io_in_2_Re = PermutationsBasic_io_out_5_Re; // @[FFTDesigns.scala 3145:39]
  assign DFT_r_v2_1_io_in_2_Im = PermutationsBasic_io_out_5_Im; // @[FFTDesigns.scala 3145:39]
  assign DFT_r_v2_2_clock = clock;
  assign DFT_r_v2_2_reset = reset;
  assign DFT_r_v2_2_io_in_0_Re = PermutationsBasic_io_out_6_Re; // @[FFTDesigns.scala 3145:39]
  assign DFT_r_v2_2_io_in_0_Im = PermutationsBasic_io_out_6_Im; // @[FFTDesigns.scala 3145:39]
  assign DFT_r_v2_2_io_in_1_Re = PermutationsBasic_io_out_7_Re; // @[FFTDesigns.scala 3145:39]
  assign DFT_r_v2_2_io_in_1_Im = PermutationsBasic_io_out_7_Im; // @[FFTDesigns.scala 3145:39]
  assign DFT_r_v2_2_io_in_2_Re = PermutationsBasic_io_out_8_Re; // @[FFTDesigns.scala 3145:39]
  assign DFT_r_v2_2_io_in_2_Im = PermutationsBasic_io_out_8_Im; // @[FFTDesigns.scala 3145:39]
  assign DFT_r_v2_3_clock = clock;
  assign DFT_r_v2_3_reset = reset;
  assign DFT_r_v2_3_io_in_0_Re = TwiddleFactors_io_out_0_Re; // @[FFTDesigns.scala 3147:39]
  assign DFT_r_v2_3_io_in_0_Im = TwiddleFactors_io_out_0_Im; // @[FFTDesigns.scala 3147:39]
  assign DFT_r_v2_3_io_in_1_Re = TwiddleFactors_io_out_1_Re; // @[FFTDesigns.scala 3147:39]
  assign DFT_r_v2_3_io_in_1_Im = TwiddleFactors_io_out_1_Im; // @[FFTDesigns.scala 3147:39]
  assign DFT_r_v2_3_io_in_2_Re = TwiddleFactors_io_out_2_Re; // @[FFTDesigns.scala 3147:39]
  assign DFT_r_v2_3_io_in_2_Im = TwiddleFactors_io_out_2_Im; // @[FFTDesigns.scala 3147:39]
  assign DFT_r_v2_4_clock = clock;
  assign DFT_r_v2_4_reset = reset;
  assign DFT_r_v2_4_io_in_0_Re = TwiddleFactors_io_out_3_Re; // @[FFTDesigns.scala 3147:39]
  assign DFT_r_v2_4_io_in_0_Im = TwiddleFactors_io_out_3_Im; // @[FFTDesigns.scala 3147:39]
  assign DFT_r_v2_4_io_in_1_Re = TwiddleFactors_io_out_4_Re; // @[FFTDesigns.scala 3147:39]
  assign DFT_r_v2_4_io_in_1_Im = TwiddleFactors_io_out_4_Im; // @[FFTDesigns.scala 3147:39]
  assign DFT_r_v2_4_io_in_2_Re = TwiddleFactors_io_out_5_Re; // @[FFTDesigns.scala 3147:39]
  assign DFT_r_v2_4_io_in_2_Im = TwiddleFactors_io_out_5_Im; // @[FFTDesigns.scala 3147:39]
  assign DFT_r_v2_5_clock = clock;
  assign DFT_r_v2_5_reset = reset;
  assign DFT_r_v2_5_io_in_0_Re = TwiddleFactors_io_out_6_Re; // @[FFTDesigns.scala 3147:39]
  assign DFT_r_v2_5_io_in_0_Im = TwiddleFactors_io_out_6_Im; // @[FFTDesigns.scala 3147:39]
  assign DFT_r_v2_5_io_in_1_Re = TwiddleFactors_io_out_7_Re; // @[FFTDesigns.scala 3147:39]
  assign DFT_r_v2_5_io_in_1_Im = TwiddleFactors_io_out_7_Im; // @[FFTDesigns.scala 3147:39]
  assign DFT_r_v2_5_io_in_2_Re = TwiddleFactors_io_out_8_Re; // @[FFTDesigns.scala 3147:39]
  assign DFT_r_v2_5_io_in_2_Im = TwiddleFactors_io_out_8_Im; // @[FFTDesigns.scala 3147:39]
  assign PermutationsBasic_io_in_0_Re = io_in_0_Re; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_io_in_0_Im = io_in_0_Im; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_io_in_1_Re = io_in_1_Re; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_io_in_1_Im = io_in_1_Im; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_io_in_2_Re = io_in_2_Re; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_io_in_2_Im = io_in_2_Im; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_io_in_3_Re = io_in_3_Re; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_io_in_3_Im = io_in_3_Im; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_io_in_4_Re = io_in_4_Re; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_io_in_4_Im = io_in_4_Im; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_io_in_5_Re = io_in_5_Re; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_io_in_5_Im = io_in_5_Im; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_io_in_6_Re = io_in_6_Re; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_io_in_6_Im = io_in_6_Im; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_io_in_7_Re = io_in_7_Re; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_io_in_7_Im = io_in_7_Im; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_io_in_8_Re = io_in_8_Re; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_io_in_8_Im = io_in_8_Im; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_1_io_in_0_Re = DFT_r_v2_io_out_0_Re; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_1_io_in_0_Im = DFT_r_v2_io_out_0_Im; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_1_io_in_1_Re = DFT_r_v2_io_out_1_Re; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_1_io_in_1_Im = DFT_r_v2_io_out_1_Im; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_1_io_in_2_Re = DFT_r_v2_io_out_2_Re; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_1_io_in_2_Im = DFT_r_v2_io_out_2_Im; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_1_io_in_3_Re = DFT_r_v2_1_io_out_0_Re; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_1_io_in_3_Im = DFT_r_v2_1_io_out_0_Im; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_1_io_in_4_Re = DFT_r_v2_1_io_out_1_Re; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_1_io_in_4_Im = DFT_r_v2_1_io_out_1_Im; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_1_io_in_5_Re = DFT_r_v2_1_io_out_2_Re; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_1_io_in_5_Im = DFT_r_v2_1_io_out_2_Im; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_1_io_in_6_Re = DFT_r_v2_2_io_out_0_Re; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_1_io_in_6_Im = DFT_r_v2_2_io_out_0_Im; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_1_io_in_7_Re = DFT_r_v2_2_io_out_1_Re; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_1_io_in_7_Im = DFT_r_v2_2_io_out_1_Im; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_1_io_in_8_Re = DFT_r_v2_2_io_out_2_Re; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_1_io_in_8_Im = DFT_r_v2_2_io_out_2_Im; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_2_io_in_0_Re = DFT_r_v2_3_io_out_0_Re; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_2_io_in_0_Im = DFT_r_v2_3_io_out_0_Im; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_2_io_in_1_Re = DFT_r_v2_3_io_out_1_Re; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_2_io_in_1_Im = DFT_r_v2_3_io_out_1_Im; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_2_io_in_2_Re = DFT_r_v2_3_io_out_2_Re; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_2_io_in_2_Im = DFT_r_v2_3_io_out_2_Im; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_2_io_in_3_Re = DFT_r_v2_4_io_out_0_Re; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_2_io_in_3_Im = DFT_r_v2_4_io_out_0_Im; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_2_io_in_4_Re = DFT_r_v2_4_io_out_1_Re; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_2_io_in_4_Im = DFT_r_v2_4_io_out_1_Im; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_2_io_in_5_Re = DFT_r_v2_4_io_out_2_Re; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_2_io_in_5_Im = DFT_r_v2_4_io_out_2_Im; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_2_io_in_6_Re = DFT_r_v2_5_io_out_0_Re; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_2_io_in_6_Im = DFT_r_v2_5_io_out_0_Im; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_2_io_in_7_Re = DFT_r_v2_5_io_out_1_Re; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_2_io_in_7_Im = DFT_r_v2_5_io_out_1_Im; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_2_io_in_8_Re = DFT_r_v2_5_io_out_2_Re; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_2_io_in_8_Im = DFT_r_v2_5_io_out_2_Im; // @[FFTDesigns.scala 3149:43]
  assign TwiddleFactors_clock = clock;
  assign TwiddleFactors_reset = reset;
  assign TwiddleFactors_io_in_0_Re = PermutationsBasic_1_io_out_0_Re; // @[FFTDesigns.scala 3153:38]
  assign TwiddleFactors_io_in_0_Im = PermutationsBasic_1_io_out_0_Im; // @[FFTDesigns.scala 3153:38]
  assign TwiddleFactors_io_in_1_Re = PermutationsBasic_1_io_out_1_Re; // @[FFTDesigns.scala 3153:38]
  assign TwiddleFactors_io_in_1_Im = PermutationsBasic_1_io_out_1_Im; // @[FFTDesigns.scala 3153:38]
  assign TwiddleFactors_io_in_2_Re = PermutationsBasic_1_io_out_2_Re; // @[FFTDesigns.scala 3153:38]
  assign TwiddleFactors_io_in_2_Im = PermutationsBasic_1_io_out_2_Im; // @[FFTDesigns.scala 3153:38]
  assign TwiddleFactors_io_in_3_Re = PermutationsBasic_1_io_out_3_Re; // @[FFTDesigns.scala 3153:38]
  assign TwiddleFactors_io_in_3_Im = PermutationsBasic_1_io_out_3_Im; // @[FFTDesigns.scala 3153:38]
  assign TwiddleFactors_io_in_4_Re = PermutationsBasic_1_io_out_4_Re; // @[FFTDesigns.scala 3153:38]
  assign TwiddleFactors_io_in_4_Im = PermutationsBasic_1_io_out_4_Im; // @[FFTDesigns.scala 3153:38]
  assign TwiddleFactors_io_in_5_Re = PermutationsBasic_1_io_out_5_Re; // @[FFTDesigns.scala 3153:38]
  assign TwiddleFactors_io_in_5_Im = PermutationsBasic_1_io_out_5_Im; // @[FFTDesigns.scala 3153:38]
  assign TwiddleFactors_io_in_6_Re = PermutationsBasic_1_io_out_6_Re; // @[FFTDesigns.scala 3153:38]
  assign TwiddleFactors_io_in_6_Im = PermutationsBasic_1_io_out_6_Im; // @[FFTDesigns.scala 3153:38]
  assign TwiddleFactors_io_in_7_Re = PermutationsBasic_1_io_out_7_Re; // @[FFTDesigns.scala 3153:38]
  assign TwiddleFactors_io_in_7_Im = PermutationsBasic_1_io_out_7_Im; // @[FFTDesigns.scala 3153:38]
  assign TwiddleFactors_io_in_8_Re = PermutationsBasic_1_io_out_8_Re; // @[FFTDesigns.scala 3153:38]
  assign TwiddleFactors_io_in_8_Im = PermutationsBasic_1_io_out_8_Im; // @[FFTDesigns.scala 3153:38]
endmodule
module FPComplexMultiAdder_36(
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
  FPComplexMultiAdder_36 FPComplexMultiAdder ( // @[FFTDesigns.scala 1839:26]
    .clock(FPComplexMultiAdder_clock),
    .reset(FPComplexMultiAdder_reset),
    .io_in_0_Re(FPComplexMultiAdder_io_in_0_Re),
    .io_in_0_Im(FPComplexMultiAdder_io_in_0_Im),
    .io_in_1_Re(FPComplexMultiAdder_io_in_1_Re),
    .io_in_1_Im(FPComplexMultiAdder_io_in_1_Im),
    .io_out_Re(FPComplexMultiAdder_io_out_Re),
    .io_out_Im(FPComplexMultiAdder_io_out_Im)
  );
  FPComplexMultiAdder_36 FPComplexMultiAdder_1 ( // @[FFTDesigns.scala 1839:26]
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
module DFT_r_v2_12(
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
module PermutationsBasic_6(
  input  [31:0] io_in_0_Re,
  input  [31:0] io_in_0_Im,
  input  [31:0] io_in_1_Re,
  input  [31:0] io_in_1_Im,
  output [31:0] io_out_0_Re,
  output [31:0] io_out_0_Im,
  output [31:0] io_out_1_Re,
  output [31:0] io_out_1_Im
);
  assign io_out_0_Re = io_in_0_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_0_Im = io_in_0_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_1_Re = io_in_1_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_1_Im = io_in_1_Im; // @[FFTDesigns.scala 2315:17]
endmodule
module FFT_sr_v2_nrv_2(
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
  wire  DFT_r_v2_clock; // @[FFTDesigns.scala 3122:34]
  wire  DFT_r_v2_reset; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_io_in_0_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_io_in_0_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_io_in_1_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_io_in_1_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_io_out_0_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_io_out_0_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_io_out_1_Re; // @[FFTDesigns.scala 3122:34]
  wire [31:0] DFT_r_v2_io_out_1_Im; // @[FFTDesigns.scala 3122:34]
  wire [31:0] PermutationsBasic_io_in_0_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_in_0_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_in_1_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_in_1_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_0_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_0_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_1_Re; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_io_out_1_Im; // @[FFTDesigns.scala 3127:35]
  wire [31:0] PermutationsBasic_1_io_in_0_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_in_0_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_in_1_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_in_1_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_0_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_0_Im; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_1_Re; // @[FFTDesigns.scala 3129:37]
  wire [31:0] PermutationsBasic_1_io_out_1_Im; // @[FFTDesigns.scala 3129:37]
  DFT_r_v2_12 DFT_r_v2 ( // @[FFTDesigns.scala 3122:34]
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
  PermutationsBasic_6 PermutationsBasic ( // @[FFTDesigns.scala 3127:35]
    .io_in_0_Re(PermutationsBasic_io_in_0_Re),
    .io_in_0_Im(PermutationsBasic_io_in_0_Im),
    .io_in_1_Re(PermutationsBasic_io_in_1_Re),
    .io_in_1_Im(PermutationsBasic_io_in_1_Im),
    .io_out_0_Re(PermutationsBasic_io_out_0_Re),
    .io_out_0_Im(PermutationsBasic_io_out_0_Im),
    .io_out_1_Re(PermutationsBasic_io_out_1_Re),
    .io_out_1_Im(PermutationsBasic_io_out_1_Im)
  );
  PermutationsBasic_6 PermutationsBasic_1 ( // @[FFTDesigns.scala 3129:37]
    .io_in_0_Re(PermutationsBasic_1_io_in_0_Re),
    .io_in_0_Im(PermutationsBasic_1_io_in_0_Im),
    .io_in_1_Re(PermutationsBasic_1_io_in_1_Re),
    .io_in_1_Im(PermutationsBasic_1_io_in_1_Im),
    .io_out_0_Re(PermutationsBasic_1_io_out_0_Re),
    .io_out_0_Im(PermutationsBasic_1_io_out_0_Im),
    .io_out_1_Re(PermutationsBasic_1_io_out_1_Re),
    .io_out_1_Im(PermutationsBasic_1_io_out_1_Im)
  );
  assign io_out_0_Re = PermutationsBasic_1_io_out_0_Re; // @[FFTDesigns.scala 3159:12]
  assign io_out_0_Im = PermutationsBasic_1_io_out_0_Im; // @[FFTDesigns.scala 3159:12]
  assign io_out_1_Re = PermutationsBasic_1_io_out_1_Re; // @[FFTDesigns.scala 3159:12]
  assign io_out_1_Im = PermutationsBasic_1_io_out_1_Im; // @[FFTDesigns.scala 3159:12]
  assign DFT_r_v2_clock = clock;
  assign DFT_r_v2_reset = reset;
  assign DFT_r_v2_io_in_0_Re = PermutationsBasic_io_out_0_Re; // @[FFTDesigns.scala 3145:39]
  assign DFT_r_v2_io_in_0_Im = PermutationsBasic_io_out_0_Im; // @[FFTDesigns.scala 3145:39]
  assign DFT_r_v2_io_in_1_Re = PermutationsBasic_io_out_1_Re; // @[FFTDesigns.scala 3145:39]
  assign DFT_r_v2_io_in_1_Im = PermutationsBasic_io_out_1_Im; // @[FFTDesigns.scala 3145:39]
  assign PermutationsBasic_io_in_0_Re = io_in_0_Re; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_io_in_0_Im = io_in_0_Im; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_io_in_1_Re = io_in_1_Re; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_io_in_1_Im = io_in_1_Im; // @[FFTDesigns.scala 3137:31]
  assign PermutationsBasic_1_io_in_0_Re = DFT_r_v2_io_out_0_Re; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_1_io_in_0_Im = DFT_r_v2_io_out_0_Im; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_1_io_in_1_Re = DFT_r_v2_io_out_1_Re; // @[FFTDesigns.scala 3149:43]
  assign PermutationsBasic_1_io_in_1_Im = DFT_r_v2_io_out_1_Im; // @[FFTDesigns.scala 3149:43]
endmodule
module PermutationsBasic_24(
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
  input  [31:0] io_in_6_Re,
  input  [31:0] io_in_6_Im,
  input  [31:0] io_in_7_Re,
  input  [31:0] io_in_7_Im,
  input  [31:0] io_in_8_Re,
  input  [31:0] io_in_8_Im,
  input  [31:0] io_in_9_Re,
  input  [31:0] io_in_9_Im,
  input  [31:0] io_in_10_Re,
  input  [31:0] io_in_10_Im,
  input  [31:0] io_in_11_Re,
  input  [31:0] io_in_11_Im,
  input  [31:0] io_in_12_Re,
  input  [31:0] io_in_12_Im,
  input  [31:0] io_in_13_Re,
  input  [31:0] io_in_13_Im,
  input  [31:0] io_in_14_Re,
  input  [31:0] io_in_14_Im,
  input  [31:0] io_in_15_Re,
  input  [31:0] io_in_15_Im,
  input  [31:0] io_in_16_Re,
  input  [31:0] io_in_16_Im,
  input  [31:0] io_in_17_Re,
  input  [31:0] io_in_17_Im,
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
  output [31:0] io_out_5_Im,
  output [31:0] io_out_6_Re,
  output [31:0] io_out_6_Im,
  output [31:0] io_out_7_Re,
  output [31:0] io_out_7_Im,
  output [31:0] io_out_8_Re,
  output [31:0] io_out_8_Im,
  output [31:0] io_out_9_Re,
  output [31:0] io_out_9_Im,
  output [31:0] io_out_10_Re,
  output [31:0] io_out_10_Im,
  output [31:0] io_out_11_Re,
  output [31:0] io_out_11_Im,
  output [31:0] io_out_12_Re,
  output [31:0] io_out_12_Im,
  output [31:0] io_out_13_Re,
  output [31:0] io_out_13_Im,
  output [31:0] io_out_14_Re,
  output [31:0] io_out_14_Im,
  output [31:0] io_out_15_Re,
  output [31:0] io_out_15_Im,
  output [31:0] io_out_16_Re,
  output [31:0] io_out_16_Im,
  output [31:0] io_out_17_Re,
  output [31:0] io_out_17_Im
);
  assign io_out_0_Re = io_in_0_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_0_Im = io_in_0_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_1_Re = io_in_2_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_1_Im = io_in_2_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_2_Re = io_in_4_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_2_Im = io_in_4_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_3_Re = io_in_6_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_3_Im = io_in_6_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_4_Re = io_in_8_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_4_Im = io_in_8_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_5_Re = io_in_10_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_5_Im = io_in_10_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_6_Re = io_in_12_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_6_Im = io_in_12_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_7_Re = io_in_14_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_7_Im = io_in_14_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_8_Re = io_in_16_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_8_Im = io_in_16_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_9_Re = io_in_1_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_9_Im = io_in_1_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_10_Re = io_in_3_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_10_Im = io_in_3_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_11_Re = io_in_5_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_11_Im = io_in_5_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_12_Re = io_in_7_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_12_Im = io_in_7_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_13_Re = io_in_9_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_13_Im = io_in_9_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_14_Re = io_in_11_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_14_Im = io_in_11_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_15_Re = io_in_13_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_15_Im = io_in_13_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_16_Re = io_in_15_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_16_Im = io_in_15_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_17_Re = io_in_17_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_17_Im = io_in_17_Im; // @[FFTDesigns.scala 2315:17]
endmodule
module PermutationsBasic_25(
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
  input  [31:0] io_in_6_Re,
  input  [31:0] io_in_6_Im,
  input  [31:0] io_in_7_Re,
  input  [31:0] io_in_7_Im,
  input  [31:0] io_in_8_Re,
  input  [31:0] io_in_8_Im,
  input  [31:0] io_in_9_Re,
  input  [31:0] io_in_9_Im,
  input  [31:0] io_in_10_Re,
  input  [31:0] io_in_10_Im,
  input  [31:0] io_in_11_Re,
  input  [31:0] io_in_11_Im,
  input  [31:0] io_in_12_Re,
  input  [31:0] io_in_12_Im,
  input  [31:0] io_in_13_Re,
  input  [31:0] io_in_13_Im,
  input  [31:0] io_in_14_Re,
  input  [31:0] io_in_14_Im,
  input  [31:0] io_in_15_Re,
  input  [31:0] io_in_15_Im,
  input  [31:0] io_in_16_Re,
  input  [31:0] io_in_16_Im,
  input  [31:0] io_in_17_Re,
  input  [31:0] io_in_17_Im,
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
  output [31:0] io_out_5_Im,
  output [31:0] io_out_6_Re,
  output [31:0] io_out_6_Im,
  output [31:0] io_out_7_Re,
  output [31:0] io_out_7_Im,
  output [31:0] io_out_8_Re,
  output [31:0] io_out_8_Im,
  output [31:0] io_out_9_Re,
  output [31:0] io_out_9_Im,
  output [31:0] io_out_10_Re,
  output [31:0] io_out_10_Im,
  output [31:0] io_out_11_Re,
  output [31:0] io_out_11_Im,
  output [31:0] io_out_12_Re,
  output [31:0] io_out_12_Im,
  output [31:0] io_out_13_Re,
  output [31:0] io_out_13_Im,
  output [31:0] io_out_14_Re,
  output [31:0] io_out_14_Im,
  output [31:0] io_out_15_Re,
  output [31:0] io_out_15_Im,
  output [31:0] io_out_16_Re,
  output [31:0] io_out_16_Im,
  output [31:0] io_out_17_Re,
  output [31:0] io_out_17_Im
);
  assign io_out_0_Re = io_in_0_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_0_Im = io_in_0_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_1_Re = io_in_9_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_1_Im = io_in_9_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_2_Re = io_in_1_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_2_Im = io_in_1_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_3_Re = io_in_10_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_3_Im = io_in_10_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_4_Re = io_in_2_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_4_Im = io_in_2_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_5_Re = io_in_11_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_5_Im = io_in_11_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_6_Re = io_in_3_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_6_Im = io_in_3_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_7_Re = io_in_12_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_7_Im = io_in_12_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_8_Re = io_in_4_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_8_Im = io_in_4_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_9_Re = io_in_13_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_9_Im = io_in_13_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_10_Re = io_in_5_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_10_Im = io_in_5_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_11_Re = io_in_14_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_11_Im = io_in_14_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_12_Re = io_in_6_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_12_Im = io_in_6_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_13_Re = io_in_15_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_13_Im = io_in_15_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_14_Re = io_in_7_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_14_Im = io_in_7_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_15_Re = io_in_16_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_15_Im = io_in_16_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_16_Re = io_in_8_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_16_Im = io_in_8_Im; // @[FFTDesigns.scala 2315:17]
  assign io_out_17_Re = io_in_17_Re; // @[FFTDesigns.scala 2315:17]
  assign io_out_17_Im = io_in_17_Im; // @[FFTDesigns.scala 2315:17]
endmodule
module FPComplexMult_reducable_2(
  input         clock,
  input         reset,
  input  [31:0] io_in_a_Re,
  input  [31:0] io_in_a_Im,
  input  [31:0] io_in_b_Re,
  output [31:0] io_out_s_Re,
  output [31:0] io_out_s_Im
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  FP_subber_clock; // @[FPComplex.scala 162:24]
  wire  FP_subber_reset; // @[FPComplex.scala 162:24]
  wire [31:0] FP_subber_io_in_a; // @[FPComplex.scala 162:24]
  wire [31:0] FP_subber_io_in_b; // @[FPComplex.scala 162:24]
  wire [31:0] FP_subber_io_out_s; // @[FPComplex.scala 162:24]
  wire  FP_adder_clock; // @[FPComplex.scala 163:24]
  wire  FP_adder_reset; // @[FPComplex.scala 163:24]
  wire [31:0] FP_adder_io_in_a; // @[FPComplex.scala 163:24]
  wire [31:0] FP_adder_io_in_b; // @[FPComplex.scala 163:24]
  wire [31:0] FP_adder_io_out_s; // @[FPComplex.scala 163:24]
  wire  FP_multiplier_clock; // @[FPComplex.scala 240:28]
  wire  FP_multiplier_reset; // @[FPComplex.scala 240:28]
  wire [31:0] FP_multiplier_io_in_a; // @[FPComplex.scala 240:28]
  wire [31:0] FP_multiplier_io_in_b; // @[FPComplex.scala 240:28]
  wire [31:0] FP_multiplier_io_out_s; // @[FPComplex.scala 240:28]
  wire  FP_multiplier_1_clock; // @[FPComplex.scala 240:28]
  wire  FP_multiplier_1_reset; // @[FPComplex.scala 240:28]
  wire [31:0] FP_multiplier_1_io_in_a; // @[FPComplex.scala 240:28]
  wire [31:0] FP_multiplier_1_io_in_b; // @[FPComplex.scala 240:28]
  wire [31:0] FP_multiplier_1_io_out_s; // @[FPComplex.scala 240:28]
  wire  sign_0 = io_in_a_Re[31]; // @[FPComplex.scala 165:26]
  wire  sign_1 = io_in_a_Im[31]; // @[FPComplex.scala 166:26]
  wire [7:0] exp_0 = io_in_a_Re[30:23]; // @[FPComplex.scala 168:25]
  wire [7:0] exp_1 = io_in_a_Im[30:23]; // @[FPComplex.scala 169:25]
  wire [22:0] frac_0 = io_in_a_Re[22:0]; // @[FPComplex.scala 171:26]
  wire [22:0] frac_1 = io_in_a_Im[22:0]; // @[FPComplex.scala 172:26]
  wire  new_sign_0 = sign_0 ^ io_in_b_Re[31]; // @[FPComplex.scala 180:28]
  wire  new_sign_3 = sign_1 ^ io_in_b_Re[31]; // @[FPComplex.scala 183:28]
  wire [7:0] _new_exp1_0_T_1 = exp_0 - 8'h1; // @[FPComplex.scala 186:31]
  wire [7:0] new_exp1_0 = exp_0 != 8'h0 ? _new_exp1_0_T_1 : exp_0; // @[FPComplex.scala 185:27 186:21 188:21]
  wire [7:0] _new_exp1_1_T_1 = exp_1 - 8'h1; // @[FPComplex.scala 191:31]
  wire [7:0] new_exp1_1 = exp_1 != 8'h0 ? _new_exp1_1_T_1 : exp_1; // @[FPComplex.scala 190:27 191:21 193:21]
  reg [31:0] regs1_0; // @[FPComplex.scala 213:26]
  reg [31:0] regs1_1; // @[FPComplex.scala 213:26]
  wire [31:0] _regs1_0_T_1 = {new_sign_0,new_exp1_0,frac_0}; // @[FPComplex.scala 215:46]
  wire [31:0] _regs1_1_T_1 = {new_sign_3,new_exp1_1,frac_1}; // @[FPComplex.scala 216:46]
  FP_subber FP_subber ( // @[FPComplex.scala 162:24]
    .clock(FP_subber_clock),
    .reset(FP_subber_reset),
    .io_in_a(FP_subber_io_in_a),
    .io_in_b(FP_subber_io_in_b),
    .io_out_s(FP_subber_io_out_s)
  );
  FP_adder FP_adder ( // @[FPComplex.scala 163:24]
    .clock(FP_adder_clock),
    .reset(FP_adder_reset),
    .io_in_a(FP_adder_io_in_a),
    .io_in_b(FP_adder_io_in_b),
    .io_out_s(FP_adder_io_out_s)
  );
  FP_multiplier FP_multiplier ( // @[FPComplex.scala 240:28]
    .clock(FP_multiplier_clock),
    .reset(FP_multiplier_reset),
    .io_in_a(FP_multiplier_io_in_a),
    .io_in_b(FP_multiplier_io_in_b),
    .io_out_s(FP_multiplier_io_out_s)
  );
  FP_multiplier FP_multiplier_1 ( // @[FPComplex.scala 240:28]
    .clock(FP_multiplier_1_clock),
    .reset(FP_multiplier_1_reset),
    .io_in_a(FP_multiplier_1_io_in_a),
    .io_in_b(FP_multiplier_1_io_in_b),
    .io_out_s(FP_multiplier_1_io_out_s)
  );
  assign io_out_s_Re = FP_subber_io_out_s; // @[FPComplex.scala 254:17]
  assign io_out_s_Im = FP_adder_io_out_s; // @[FPComplex.scala 255:17]
  assign FP_subber_clock = clock;
  assign FP_subber_reset = reset;
  assign FP_subber_io_in_a = regs1_0; // @[FPComplex.scala 211:28 217:23]
  assign FP_subber_io_in_b = FP_multiplier_1_io_out_s; // @[FPComplex.scala 211:28 248:23]
  assign FP_adder_clock = clock;
  assign FP_adder_reset = reset;
  assign FP_adder_io_in_a = FP_multiplier_io_out_s; // @[FPComplex.scala 211:28 247:23]
  assign FP_adder_io_in_b = regs1_1; // @[FPComplex.scala 211:28 218:23]
  assign FP_multiplier_clock = clock;
  assign FP_multiplier_reset = reset;
  assign FP_multiplier_io_in_a = io_in_a_Re; // @[FPComplex.scala 243:31]
  assign FP_multiplier_io_in_b = 32'hbf5db3d6; // @[FPComplex.scala 244:31]
  assign FP_multiplier_1_clock = clock;
  assign FP_multiplier_1_reset = reset;
  assign FP_multiplier_1_io_in_a = io_in_a_Im; // @[FPComplex.scala 245:31]
  assign FP_multiplier_1_io_in_b = 32'hbf5db3d6; // @[FPComplex.scala 246:31]
  always @(posedge clock) begin
    if (reset) begin // @[FPComplex.scala 213:26]
      regs1_0 <= 32'h0; // @[FPComplex.scala 213:26]
    end else begin
      regs1_0 <= _regs1_0_T_1; // @[FPComplex.scala 215:16]
    end
    if (reset) begin // @[FPComplex.scala 213:26]
      regs1_1 <= 32'h0; // @[FPComplex.scala 213:26]
    end else begin
      regs1_1 <= _regs1_1_T_1; // @[FPComplex.scala 216:16]
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
  regs1_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  regs1_1 = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TwiddleFactors_mr(
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
  input  [31:0] io_in_6_Re,
  input  [31:0] io_in_6_Im,
  input  [31:0] io_in_7_Re,
  input  [31:0] io_in_7_Im,
  input  [31:0] io_in_8_Re,
  input  [31:0] io_in_8_Im,
  input  [31:0] io_in_9_Re,
  input  [31:0] io_in_9_Im,
  input  [31:0] io_in_10_Re,
  input  [31:0] io_in_10_Im,
  input  [31:0] io_in_11_Re,
  input  [31:0] io_in_11_Im,
  input  [31:0] io_in_12_Re,
  input  [31:0] io_in_12_Im,
  input  [31:0] io_in_13_Re,
  input  [31:0] io_in_13_Im,
  input  [31:0] io_in_14_Re,
  input  [31:0] io_in_14_Im,
  input  [31:0] io_in_15_Re,
  input  [31:0] io_in_15_Im,
  input  [31:0] io_in_16_Re,
  input  [31:0] io_in_16_Im,
  input  [31:0] io_in_17_Re,
  input  [31:0] io_in_17_Im,
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
  output [31:0] io_out_5_Im,
  output [31:0] io_out_6_Re,
  output [31:0] io_out_6_Im,
  output [31:0] io_out_7_Re,
  output [31:0] io_out_7_Im,
  output [31:0] io_out_8_Re,
  output [31:0] io_out_8_Im,
  output [31:0] io_out_9_Re,
  output [31:0] io_out_9_Im,
  output [31:0] io_out_10_Re,
  output [31:0] io_out_10_Im,
  output [31:0] io_out_11_Re,
  output [31:0] io_out_11_Im,
  output [31:0] io_out_12_Re,
  output [31:0] io_out_12_Im,
  output [31:0] io_out_13_Re,
  output [31:0] io_out_13_Im,
  output [31:0] io_out_14_Re,
  output [31:0] io_out_14_Im,
  output [31:0] io_out_15_Re,
  output [31:0] io_out_15_Im,
  output [31:0] io_out_16_Re,
  output [31:0] io_out_16_Im,
  output [31:0] io_out_17_Re,
  output [31:0] io_out_17_Im
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
`endif // RANDOMIZE_REG_INIT
  wire [31:0] cmplx_adj_io_in_Re; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_io_in_Im; // @[FFTDesigns.scala 3212:22]
  wire [7:0] cmplx_adj_io_in_adj; // @[FFTDesigns.scala 3212:22]
  wire  cmplx_adj_io_is_neg; // @[FFTDesigns.scala 3212:22]
  wire  cmplx_adj_io_is_flip; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_io_out_Re; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_io_out_Im; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_1_io_in_Re; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_1_io_in_Im; // @[FFTDesigns.scala 3212:22]
  wire [7:0] cmplx_adj_1_io_in_adj; // @[FFTDesigns.scala 3212:22]
  wire  cmplx_adj_1_io_is_neg; // @[FFTDesigns.scala 3212:22]
  wire  cmplx_adj_1_io_is_flip; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_1_io_out_Re; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_1_io_out_Im; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_2_io_in_Re; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_2_io_in_Im; // @[FFTDesigns.scala 3212:22]
  wire [7:0] cmplx_adj_2_io_in_adj; // @[FFTDesigns.scala 3212:22]
  wire  cmplx_adj_2_io_is_neg; // @[FFTDesigns.scala 3212:22]
  wire  cmplx_adj_2_io_is_flip; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_2_io_out_Re; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_2_io_out_Im; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_3_io_in_Re; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_3_io_in_Im; // @[FFTDesigns.scala 3212:22]
  wire [7:0] cmplx_adj_3_io_in_adj; // @[FFTDesigns.scala 3212:22]
  wire  cmplx_adj_3_io_is_neg; // @[FFTDesigns.scala 3212:22]
  wire  cmplx_adj_3_io_is_flip; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_3_io_out_Re; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_3_io_out_Im; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_4_io_in_Re; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_4_io_in_Im; // @[FFTDesigns.scala 3212:22]
  wire [7:0] cmplx_adj_4_io_in_adj; // @[FFTDesigns.scala 3212:22]
  wire  cmplx_adj_4_io_is_neg; // @[FFTDesigns.scala 3212:22]
  wire  cmplx_adj_4_io_is_flip; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_4_io_out_Re; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_4_io_out_Im; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_5_io_in_Re; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_5_io_in_Im; // @[FFTDesigns.scala 3212:22]
  wire [7:0] cmplx_adj_5_io_in_adj; // @[FFTDesigns.scala 3212:22]
  wire  cmplx_adj_5_io_is_neg; // @[FFTDesigns.scala 3212:22]
  wire  cmplx_adj_5_io_is_flip; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_5_io_out_Re; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_5_io_out_Im; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_6_io_in_Re; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_6_io_in_Im; // @[FFTDesigns.scala 3212:22]
  wire [7:0] cmplx_adj_6_io_in_adj; // @[FFTDesigns.scala 3212:22]
  wire  cmplx_adj_6_io_is_neg; // @[FFTDesigns.scala 3212:22]
  wire  cmplx_adj_6_io_is_flip; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_6_io_out_Re; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_6_io_out_Im; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_7_io_in_Re; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_7_io_in_Im; // @[FFTDesigns.scala 3212:22]
  wire [7:0] cmplx_adj_7_io_in_adj; // @[FFTDesigns.scala 3212:22]
  wire  cmplx_adj_7_io_is_neg; // @[FFTDesigns.scala 3212:22]
  wire  cmplx_adj_7_io_is_flip; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_7_io_out_Re; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_7_io_out_Im; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_8_io_in_Re; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_8_io_in_Im; // @[FFTDesigns.scala 3212:22]
  wire [7:0] cmplx_adj_8_io_in_adj; // @[FFTDesigns.scala 3212:22]
  wire  cmplx_adj_8_io_is_neg; // @[FFTDesigns.scala 3212:22]
  wire  cmplx_adj_8_io_is_flip; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_8_io_out_Re; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_8_io_out_Im; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_9_io_in_Re; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_9_io_in_Im; // @[FFTDesigns.scala 3212:22]
  wire [7:0] cmplx_adj_9_io_in_adj; // @[FFTDesigns.scala 3212:22]
  wire  cmplx_adj_9_io_is_neg; // @[FFTDesigns.scala 3212:22]
  wire  cmplx_adj_9_io_is_flip; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_9_io_out_Re; // @[FFTDesigns.scala 3212:22]
  wire [31:0] cmplx_adj_9_io_out_Im; // @[FFTDesigns.scala 3212:22]
  wire  FPComplexMult_reducable_clock; // @[FFTDesigns.scala 3228:28]
  wire  FPComplexMult_reducable_reset; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_io_in_a_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_io_in_a_Im; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_io_in_b_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_io_in_b_Im; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_io_out_s_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_io_out_s_Im; // @[FFTDesigns.scala 3228:28]
  wire  FPComplexMult_reducable_1_clock; // @[FFTDesigns.scala 3228:28]
  wire  FPComplexMult_reducable_1_reset; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_1_io_in_a_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_1_io_in_a_Im; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_1_io_in_b_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_1_io_in_b_Im; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_1_io_out_s_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_1_io_out_s_Im; // @[FFTDesigns.scala 3228:28]
  wire  FPComplexMult_reducable_2_clock; // @[FFTDesigns.scala 3228:28]
  wire  FPComplexMult_reducable_2_reset; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_2_io_in_a_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_2_io_in_a_Im; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_2_io_in_b_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_2_io_out_s_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_2_io_out_s_Im; // @[FFTDesigns.scala 3228:28]
  wire  FPComplexMult_reducable_3_clock; // @[FFTDesigns.scala 3228:28]
  wire  FPComplexMult_reducable_3_reset; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_3_io_in_a_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_3_io_in_a_Im; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_3_io_in_b_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_3_io_in_b_Im; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_3_io_out_s_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_3_io_out_s_Im; // @[FFTDesigns.scala 3228:28]
  wire  FPComplexMult_reducable_4_clock; // @[FFTDesigns.scala 3228:28]
  wire  FPComplexMult_reducable_4_reset; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_4_io_in_a_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_4_io_in_a_Im; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_4_io_in_b_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_4_io_in_b_Im; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_4_io_out_s_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_4_io_out_s_Im; // @[FFTDesigns.scala 3228:28]
  wire  FPComplexMult_reducable_5_clock; // @[FFTDesigns.scala 3228:28]
  wire  FPComplexMult_reducable_5_reset; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_5_io_in_a_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_5_io_in_a_Im; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_5_io_in_b_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_5_io_out_s_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_5_io_out_s_Im; // @[FFTDesigns.scala 3228:28]
  wire  FPComplexMult_reducable_6_clock; // @[FFTDesigns.scala 3228:28]
  wire  FPComplexMult_reducable_6_reset; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_6_io_in_a_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_6_io_in_a_Im; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_6_io_in_b_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_6_io_in_b_Im; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_6_io_out_s_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_6_io_out_s_Im; // @[FFTDesigns.scala 3228:28]
  wire  FPComplexMult_reducable_7_clock; // @[FFTDesigns.scala 3228:28]
  wire  FPComplexMult_reducable_7_reset; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_7_io_in_a_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_7_io_in_a_Im; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_7_io_in_b_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_7_io_in_b_Im; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_7_io_out_s_Re; // @[FFTDesigns.scala 3228:28]
  wire [31:0] FPComplexMult_reducable_7_io_out_s_Im; // @[FFTDesigns.scala 3228:28]
  reg [31:0] reg_syncs_0_0_Re; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_0_0_Im; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_0_1_Re; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_0_1_Im; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_0_2_Re; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_0_2_Im; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_0_3_Re; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_0_3_Im; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_0_4_Re; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_0_4_Im; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_0_5_Re; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_0_5_Im; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_0_6_Re; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_0_6_Im; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_0_7_Re; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_0_7_Im; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_0_8_Re; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_0_8_Im; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_0_9_Re; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_0_9_Im; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_1_0_Re; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_1_0_Im; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_1_1_Re; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_1_1_Im; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_1_2_Re; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_1_2_Im; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_1_3_Re; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_1_3_Im; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_1_4_Re; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_1_4_Im; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_1_5_Re; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_1_5_Im; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_1_6_Re; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_1_6_Im; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_1_7_Re; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_1_7_Im; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_1_8_Re; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_1_8_Im; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_1_9_Re; // @[FFTDesigns.scala 3238:27]
  reg [31:0] reg_syncs_1_9_Im; // @[FFTDesigns.scala 3238:27]
  wire [31:0] adj_wire_0_Re = cmplx_adj_io_out_Re; // @[FFTDesigns.scala 3215:24 3221:42]
  wire [31:0] adj_wire_0_Im = cmplx_adj_io_out_Im; // @[FFTDesigns.scala 3215:24 3221:42]
  wire [31:0] adj_wire_1_Re = cmplx_adj_1_io_out_Re; // @[FFTDesigns.scala 3215:24 3221:42]
  wire [31:0] adj_wire_1_Im = cmplx_adj_1_io_out_Im; // @[FFTDesigns.scala 3215:24 3221:42]
  wire [31:0] adj_wire_2_Re = cmplx_adj_2_io_out_Re; // @[FFTDesigns.scala 3215:24 3221:42]
  wire [31:0] adj_wire_2_Im = cmplx_adj_2_io_out_Im; // @[FFTDesigns.scala 3215:24 3221:42]
  wire [31:0] adj_wire_4_Re = cmplx_adj_3_io_out_Re; // @[FFTDesigns.scala 3215:24 3221:42]
  wire [31:0] adj_wire_4_Im = cmplx_adj_3_io_out_Im; // @[FFTDesigns.scala 3215:24 3221:42]
  wire [31:0] adj_wire_6_Re = cmplx_adj_4_io_out_Re; // @[FFTDesigns.scala 3215:24 3221:42]
  wire [31:0] adj_wire_6_Im = cmplx_adj_4_io_out_Im; // @[FFTDesigns.scala 3215:24 3221:42]
  wire [31:0] adj_wire_8_Re = cmplx_adj_5_io_out_Re; // @[FFTDesigns.scala 3215:24 3221:42]
  wire [31:0] adj_wire_8_Im = cmplx_adj_5_io_out_Im; // @[FFTDesigns.scala 3215:24 3221:42]
  wire [31:0] adj_wire_10_Re = cmplx_adj_6_io_out_Re; // @[FFTDesigns.scala 3215:24 3221:42]
  wire [31:0] adj_wire_10_Im = cmplx_adj_6_io_out_Im; // @[FFTDesigns.scala 3215:24 3221:42]
  wire [31:0] adj_wire_12_Re = cmplx_adj_7_io_out_Re; // @[FFTDesigns.scala 3215:24 3221:42]
  wire [31:0] adj_wire_12_Im = cmplx_adj_7_io_out_Im; // @[FFTDesigns.scala 3215:24 3221:42]
  wire [31:0] adj_wire_14_Re = cmplx_adj_8_io_out_Re; // @[FFTDesigns.scala 3215:24 3221:42]
  wire [31:0] adj_wire_14_Im = cmplx_adj_8_io_out_Im; // @[FFTDesigns.scala 3215:24 3221:42]
  wire [31:0] adj_wire_16_Re = cmplx_adj_9_io_out_Re; // @[FFTDesigns.scala 3215:24 3221:42]
  wire [31:0] adj_wire_16_Im = cmplx_adj_9_io_out_Im; // @[FFTDesigns.scala 3215:24 3221:42]
  cmplx_adj cmplx_adj ( // @[FFTDesigns.scala 3212:22]
    .io_in_Re(cmplx_adj_io_in_Re),
    .io_in_Im(cmplx_adj_io_in_Im),
    .io_in_adj(cmplx_adj_io_in_adj),
    .io_is_neg(cmplx_adj_io_is_neg),
    .io_is_flip(cmplx_adj_io_is_flip),
    .io_out_Re(cmplx_adj_io_out_Re),
    .io_out_Im(cmplx_adj_io_out_Im)
  );
  cmplx_adj cmplx_adj_1 ( // @[FFTDesigns.scala 3212:22]
    .io_in_Re(cmplx_adj_1_io_in_Re),
    .io_in_Im(cmplx_adj_1_io_in_Im),
    .io_in_adj(cmplx_adj_1_io_in_adj),
    .io_is_neg(cmplx_adj_1_io_is_neg),
    .io_is_flip(cmplx_adj_1_io_is_flip),
    .io_out_Re(cmplx_adj_1_io_out_Re),
    .io_out_Im(cmplx_adj_1_io_out_Im)
  );
  cmplx_adj cmplx_adj_2 ( // @[FFTDesigns.scala 3212:22]
    .io_in_Re(cmplx_adj_2_io_in_Re),
    .io_in_Im(cmplx_adj_2_io_in_Im),
    .io_in_adj(cmplx_adj_2_io_in_adj),
    .io_is_neg(cmplx_adj_2_io_is_neg),
    .io_is_flip(cmplx_adj_2_io_is_flip),
    .io_out_Re(cmplx_adj_2_io_out_Re),
    .io_out_Im(cmplx_adj_2_io_out_Im)
  );
  cmplx_adj cmplx_adj_3 ( // @[FFTDesigns.scala 3212:22]
    .io_in_Re(cmplx_adj_3_io_in_Re),
    .io_in_Im(cmplx_adj_3_io_in_Im),
    .io_in_adj(cmplx_adj_3_io_in_adj),
    .io_is_neg(cmplx_adj_3_io_is_neg),
    .io_is_flip(cmplx_adj_3_io_is_flip),
    .io_out_Re(cmplx_adj_3_io_out_Re),
    .io_out_Im(cmplx_adj_3_io_out_Im)
  );
  cmplx_adj cmplx_adj_4 ( // @[FFTDesigns.scala 3212:22]
    .io_in_Re(cmplx_adj_4_io_in_Re),
    .io_in_Im(cmplx_adj_4_io_in_Im),
    .io_in_adj(cmplx_adj_4_io_in_adj),
    .io_is_neg(cmplx_adj_4_io_is_neg),
    .io_is_flip(cmplx_adj_4_io_is_flip),
    .io_out_Re(cmplx_adj_4_io_out_Re),
    .io_out_Im(cmplx_adj_4_io_out_Im)
  );
  cmplx_adj cmplx_adj_5 ( // @[FFTDesigns.scala 3212:22]
    .io_in_Re(cmplx_adj_5_io_in_Re),
    .io_in_Im(cmplx_adj_5_io_in_Im),
    .io_in_adj(cmplx_adj_5_io_in_adj),
    .io_is_neg(cmplx_adj_5_io_is_neg),
    .io_is_flip(cmplx_adj_5_io_is_flip),
    .io_out_Re(cmplx_adj_5_io_out_Re),
    .io_out_Im(cmplx_adj_5_io_out_Im)
  );
  cmplx_adj cmplx_adj_6 ( // @[FFTDesigns.scala 3212:22]
    .io_in_Re(cmplx_adj_6_io_in_Re),
    .io_in_Im(cmplx_adj_6_io_in_Im),
    .io_in_adj(cmplx_adj_6_io_in_adj),
    .io_is_neg(cmplx_adj_6_io_is_neg),
    .io_is_flip(cmplx_adj_6_io_is_flip),
    .io_out_Re(cmplx_adj_6_io_out_Re),
    .io_out_Im(cmplx_adj_6_io_out_Im)
  );
  cmplx_adj cmplx_adj_7 ( // @[FFTDesigns.scala 3212:22]
    .io_in_Re(cmplx_adj_7_io_in_Re),
    .io_in_Im(cmplx_adj_7_io_in_Im),
    .io_in_adj(cmplx_adj_7_io_in_adj),
    .io_is_neg(cmplx_adj_7_io_is_neg),
    .io_is_flip(cmplx_adj_7_io_is_flip),
    .io_out_Re(cmplx_adj_7_io_out_Re),
    .io_out_Im(cmplx_adj_7_io_out_Im)
  );
  cmplx_adj cmplx_adj_8 ( // @[FFTDesigns.scala 3212:22]
    .io_in_Re(cmplx_adj_8_io_in_Re),
    .io_in_Im(cmplx_adj_8_io_in_Im),
    .io_in_adj(cmplx_adj_8_io_in_adj),
    .io_is_neg(cmplx_adj_8_io_is_neg),
    .io_is_flip(cmplx_adj_8_io_is_flip),
    .io_out_Re(cmplx_adj_8_io_out_Re),
    .io_out_Im(cmplx_adj_8_io_out_Im)
  );
  cmplx_adj cmplx_adj_9 ( // @[FFTDesigns.scala 3212:22]
    .io_in_Re(cmplx_adj_9_io_in_Re),
    .io_in_Im(cmplx_adj_9_io_in_Im),
    .io_in_adj(cmplx_adj_9_io_in_adj),
    .io_is_neg(cmplx_adj_9_io_is_neg),
    .io_is_flip(cmplx_adj_9_io_is_flip),
    .io_out_Re(cmplx_adj_9_io_out_Re),
    .io_out_Im(cmplx_adj_9_io_out_Im)
  );
  FPComplexMult_reducable_v2_16 FPComplexMult_reducable ( // @[FFTDesigns.scala 3228:28]
    .clock(FPComplexMult_reducable_clock),
    .reset(FPComplexMult_reducable_reset),
    .io_in_a_Re(FPComplexMult_reducable_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_reducable_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_reducable_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_reducable_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_reducable_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_reducable_io_out_s_Im)
  );
  FPComplexMult_reducable_v2_16 FPComplexMult_reducable_1 ( // @[FFTDesigns.scala 3228:28]
    .clock(FPComplexMult_reducable_1_clock),
    .reset(FPComplexMult_reducable_1_reset),
    .io_in_a_Re(FPComplexMult_reducable_1_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_reducable_1_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_reducable_1_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_reducable_1_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_reducable_1_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_reducable_1_io_out_s_Im)
  );
  FPComplexMult_reducable_2 FPComplexMult_reducable_2 ( // @[FFTDesigns.scala 3228:28]
    .clock(FPComplexMult_reducable_2_clock),
    .reset(FPComplexMult_reducable_2_reset),
    .io_in_a_Re(FPComplexMult_reducable_2_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_reducable_2_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_reducable_2_io_in_b_Re),
    .io_out_s_Re(FPComplexMult_reducable_2_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_reducable_2_io_out_s_Im)
  );
  FPComplexMult_reducable_v2_16 FPComplexMult_reducable_3 ( // @[FFTDesigns.scala 3228:28]
    .clock(FPComplexMult_reducable_3_clock),
    .reset(FPComplexMult_reducable_3_reset),
    .io_in_a_Re(FPComplexMult_reducable_3_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_reducable_3_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_reducable_3_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_reducable_3_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_reducable_3_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_reducable_3_io_out_s_Im)
  );
  FPComplexMult_reducable_v2_16 FPComplexMult_reducable_4 ( // @[FFTDesigns.scala 3228:28]
    .clock(FPComplexMult_reducable_4_clock),
    .reset(FPComplexMult_reducable_4_reset),
    .io_in_a_Re(FPComplexMult_reducable_4_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_reducable_4_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_reducable_4_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_reducable_4_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_reducable_4_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_reducable_4_io_out_s_Im)
  );
  FPComplexMult_reducable_2 FPComplexMult_reducable_5 ( // @[FFTDesigns.scala 3228:28]
    .clock(FPComplexMult_reducable_5_clock),
    .reset(FPComplexMult_reducable_5_reset),
    .io_in_a_Re(FPComplexMult_reducable_5_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_reducable_5_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_reducable_5_io_in_b_Re),
    .io_out_s_Re(FPComplexMult_reducable_5_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_reducable_5_io_out_s_Im)
  );
  FPComplexMult_reducable_v2_16 FPComplexMult_reducable_6 ( // @[FFTDesigns.scala 3228:28]
    .clock(FPComplexMult_reducable_6_clock),
    .reset(FPComplexMult_reducable_6_reset),
    .io_in_a_Re(FPComplexMult_reducable_6_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_reducable_6_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_reducable_6_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_reducable_6_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_reducable_6_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_reducable_6_io_out_s_Im)
  );
  FPComplexMult_reducable_v2_16 FPComplexMult_reducable_7 ( // @[FFTDesigns.scala 3228:28]
    .clock(FPComplexMult_reducable_7_clock),
    .reset(FPComplexMult_reducable_7_reset),
    .io_in_a_Re(FPComplexMult_reducable_7_io_in_a_Re),
    .io_in_a_Im(FPComplexMult_reducable_7_io_in_a_Im),
    .io_in_b_Re(FPComplexMult_reducable_7_io_in_b_Re),
    .io_in_b_Im(FPComplexMult_reducable_7_io_in_b_Im),
    .io_out_s_Re(FPComplexMult_reducable_7_io_out_s_Re),
    .io_out_s_Im(FPComplexMult_reducable_7_io_out_s_Im)
  );
  assign io_out_0_Re = reg_syncs_1_0_Re; // @[FFTDesigns.scala 3250:30 3252:42]
  assign io_out_0_Im = reg_syncs_1_0_Im; // @[FFTDesigns.scala 3250:30 3252:42]
  assign io_out_1_Re = reg_syncs_1_1_Re; // @[FFTDesigns.scala 3250:30 3252:42]
  assign io_out_1_Im = reg_syncs_1_1_Im; // @[FFTDesigns.scala 3250:30 3252:42]
  assign io_out_2_Re = reg_syncs_1_2_Re; // @[FFTDesigns.scala 3250:30 3252:42]
  assign io_out_2_Im = reg_syncs_1_2_Im; // @[FFTDesigns.scala 3250:30 3252:42]
  assign io_out_3_Re = FPComplexMult_reducable_io_out_s_Re; // @[FFTDesigns.scala 3250:30 3255:33]
  assign io_out_3_Im = FPComplexMult_reducable_io_out_s_Im; // @[FFTDesigns.scala 3250:30 3255:33]
  assign io_out_4_Re = reg_syncs_1_3_Re; // @[FFTDesigns.scala 3250:30 3252:42]
  assign io_out_4_Im = reg_syncs_1_3_Im; // @[FFTDesigns.scala 3250:30 3252:42]
  assign io_out_5_Re = FPComplexMult_reducable_1_io_out_s_Re; // @[FFTDesigns.scala 3250:30 3255:33]
  assign io_out_5_Im = FPComplexMult_reducable_1_io_out_s_Im; // @[FFTDesigns.scala 3250:30 3255:33]
  assign io_out_6_Re = reg_syncs_1_4_Re; // @[FFTDesigns.scala 3250:30 3252:42]
  assign io_out_6_Im = reg_syncs_1_4_Im; // @[FFTDesigns.scala 3250:30 3252:42]
  assign io_out_7_Re = FPComplexMult_reducable_2_io_out_s_Re; // @[FFTDesigns.scala 3250:30 3255:33]
  assign io_out_7_Im = FPComplexMult_reducable_2_io_out_s_Im; // @[FFTDesigns.scala 3250:30 3255:33]
  assign io_out_8_Re = reg_syncs_1_5_Re; // @[FFTDesigns.scala 3250:30 3252:42]
  assign io_out_8_Im = reg_syncs_1_5_Im; // @[FFTDesigns.scala 3250:30 3252:42]
  assign io_out_9_Re = FPComplexMult_reducable_3_io_out_s_Re; // @[FFTDesigns.scala 3250:30 3255:33]
  assign io_out_9_Im = FPComplexMult_reducable_3_io_out_s_Im; // @[FFTDesigns.scala 3250:30 3255:33]
  assign io_out_10_Re = reg_syncs_1_6_Re; // @[FFTDesigns.scala 3250:30 3252:42]
  assign io_out_10_Im = reg_syncs_1_6_Im; // @[FFTDesigns.scala 3250:30 3252:42]
  assign io_out_11_Re = FPComplexMult_reducable_4_io_out_s_Re; // @[FFTDesigns.scala 3250:30 3255:33]
  assign io_out_11_Im = FPComplexMult_reducable_4_io_out_s_Im; // @[FFTDesigns.scala 3250:30 3255:33]
  assign io_out_12_Re = reg_syncs_1_7_Re; // @[FFTDesigns.scala 3250:30 3252:42]
  assign io_out_12_Im = reg_syncs_1_7_Im; // @[FFTDesigns.scala 3250:30 3252:42]
  assign io_out_13_Re = FPComplexMult_reducable_5_io_out_s_Re; // @[FFTDesigns.scala 3250:30 3255:33]
  assign io_out_13_Im = FPComplexMult_reducable_5_io_out_s_Im; // @[FFTDesigns.scala 3250:30 3255:33]
  assign io_out_14_Re = reg_syncs_1_8_Re; // @[FFTDesigns.scala 3250:30 3252:42]
  assign io_out_14_Im = reg_syncs_1_8_Im; // @[FFTDesigns.scala 3250:30 3252:42]
  assign io_out_15_Re = FPComplexMult_reducable_6_io_out_s_Re; // @[FFTDesigns.scala 3250:30 3255:33]
  assign io_out_15_Im = FPComplexMult_reducable_6_io_out_s_Im; // @[FFTDesigns.scala 3250:30 3255:33]
  assign io_out_16_Re = reg_syncs_1_9_Re; // @[FFTDesigns.scala 3250:30 3252:42]
  assign io_out_16_Im = reg_syncs_1_9_Im; // @[FFTDesigns.scala 3250:30 3252:42]
  assign io_out_17_Re = FPComplexMult_reducable_7_io_out_s_Re; // @[FFTDesigns.scala 3250:30 3255:33]
  assign io_out_17_Im = FPComplexMult_reducable_7_io_out_s_Im; // @[FFTDesigns.scala 3250:30 3255:33]
  assign cmplx_adj_io_in_Re = io_in_0_Re; // @[FFTDesigns.scala 3217:27]
  assign cmplx_adj_io_in_Im = io_in_0_Im; // @[FFTDesigns.scala 3217:27]
  assign cmplx_adj_io_in_adj = 8'h0; // @[FFTDesigns.scala 3218:31]
  assign cmplx_adj_io_is_neg = 1'h0; // @[FFTDesigns.scala 3219:31]
  assign cmplx_adj_io_is_flip = 1'h0; // @[FFTDesigns.scala 3220:32]
  assign cmplx_adj_1_io_in_Re = io_in_1_Re; // @[FFTDesigns.scala 3217:27]
  assign cmplx_adj_1_io_in_Im = io_in_1_Im; // @[FFTDesigns.scala 3217:27]
  assign cmplx_adj_1_io_in_adj = 8'h0; // @[FFTDesigns.scala 3218:31]
  assign cmplx_adj_1_io_is_neg = 1'h0; // @[FFTDesigns.scala 3219:31]
  assign cmplx_adj_1_io_is_flip = 1'h0; // @[FFTDesigns.scala 3220:32]
  assign cmplx_adj_2_io_in_Re = io_in_2_Re; // @[FFTDesigns.scala 3217:27]
  assign cmplx_adj_2_io_in_Im = io_in_2_Im; // @[FFTDesigns.scala 3217:27]
  assign cmplx_adj_2_io_in_adj = 8'h0; // @[FFTDesigns.scala 3218:31]
  assign cmplx_adj_2_io_is_neg = 1'h0; // @[FFTDesigns.scala 3219:31]
  assign cmplx_adj_2_io_is_flip = 1'h0; // @[FFTDesigns.scala 3220:32]
  assign cmplx_adj_3_io_in_Re = io_in_4_Re; // @[FFTDesigns.scala 3217:27]
  assign cmplx_adj_3_io_in_Im = io_in_4_Im; // @[FFTDesigns.scala 3217:27]
  assign cmplx_adj_3_io_in_adj = 8'h0; // @[FFTDesigns.scala 3218:31]
  assign cmplx_adj_3_io_is_neg = 1'h0; // @[FFTDesigns.scala 3219:31]
  assign cmplx_adj_3_io_is_flip = 1'h0; // @[FFTDesigns.scala 3220:32]
  assign cmplx_adj_4_io_in_Re = io_in_6_Re; // @[FFTDesigns.scala 3217:27]
  assign cmplx_adj_4_io_in_Im = io_in_6_Im; // @[FFTDesigns.scala 3217:27]
  assign cmplx_adj_4_io_in_adj = 8'h0; // @[FFTDesigns.scala 3218:31]
  assign cmplx_adj_4_io_is_neg = 1'h0; // @[FFTDesigns.scala 3219:31]
  assign cmplx_adj_4_io_is_flip = 1'h0; // @[FFTDesigns.scala 3220:32]
  assign cmplx_adj_5_io_in_Re = io_in_8_Re; // @[FFTDesigns.scala 3217:27]
  assign cmplx_adj_5_io_in_Im = io_in_8_Im; // @[FFTDesigns.scala 3217:27]
  assign cmplx_adj_5_io_in_adj = 8'h0; // @[FFTDesigns.scala 3218:31]
  assign cmplx_adj_5_io_is_neg = 1'h0; // @[FFTDesigns.scala 3219:31]
  assign cmplx_adj_5_io_is_flip = 1'h0; // @[FFTDesigns.scala 3220:32]
  assign cmplx_adj_6_io_in_Re = io_in_10_Re; // @[FFTDesigns.scala 3217:27]
  assign cmplx_adj_6_io_in_Im = io_in_10_Im; // @[FFTDesigns.scala 3217:27]
  assign cmplx_adj_6_io_in_adj = 8'h0; // @[FFTDesigns.scala 3218:31]
  assign cmplx_adj_6_io_is_neg = 1'h0; // @[FFTDesigns.scala 3219:31]
  assign cmplx_adj_6_io_is_flip = 1'h0; // @[FFTDesigns.scala 3220:32]
  assign cmplx_adj_7_io_in_Re = io_in_12_Re; // @[FFTDesigns.scala 3217:27]
  assign cmplx_adj_7_io_in_Im = io_in_12_Im; // @[FFTDesigns.scala 3217:27]
  assign cmplx_adj_7_io_in_adj = 8'h0; // @[FFTDesigns.scala 3218:31]
  assign cmplx_adj_7_io_is_neg = 1'h0; // @[FFTDesigns.scala 3219:31]
  assign cmplx_adj_7_io_is_flip = 1'h0; // @[FFTDesigns.scala 3220:32]
  assign cmplx_adj_8_io_in_Re = io_in_14_Re; // @[FFTDesigns.scala 3217:27]
  assign cmplx_adj_8_io_in_Im = io_in_14_Im; // @[FFTDesigns.scala 3217:27]
  assign cmplx_adj_8_io_in_adj = 8'h0; // @[FFTDesigns.scala 3218:31]
  assign cmplx_adj_8_io_is_neg = 1'h0; // @[FFTDesigns.scala 3219:31]
  assign cmplx_adj_8_io_is_flip = 1'h0; // @[FFTDesigns.scala 3220:32]
  assign cmplx_adj_9_io_in_Re = io_in_16_Re; // @[FFTDesigns.scala 3217:27]
  assign cmplx_adj_9_io_in_Im = io_in_16_Im; // @[FFTDesigns.scala 3217:27]
  assign cmplx_adj_9_io_in_adj = 8'h0; // @[FFTDesigns.scala 3218:31]
  assign cmplx_adj_9_io_is_neg = 1'h0; // @[FFTDesigns.scala 3219:31]
  assign cmplx_adj_9_io_is_flip = 1'h0; // @[FFTDesigns.scala 3220:32]
  assign FPComplexMult_reducable_clock = clock;
  assign FPComplexMult_reducable_reset = reset;
  assign FPComplexMult_reducable_io_in_a_Re = io_in_3_Re; // @[FFTDesigns.scala 3215:24 3224:33]
  assign FPComplexMult_reducable_io_in_a_Im = io_in_3_Im; // @[FFTDesigns.scala 3215:24 3224:33]
  assign FPComplexMult_reducable_io_in_b_Re = 32'h3f708fb2; // @[FFTDesigns.scala 3232:28]
  assign FPComplexMult_reducable_io_in_b_Im = 32'hbeaf1d40; // @[FFTDesigns.scala 3234:28]
  assign FPComplexMult_reducable_1_clock = clock;
  assign FPComplexMult_reducable_1_reset = reset;
  assign FPComplexMult_reducable_1_io_in_a_Re = io_in_5_Re; // @[FFTDesigns.scala 3215:24 3224:33]
  assign FPComplexMult_reducable_1_io_in_a_Im = io_in_5_Im; // @[FFTDesigns.scala 3215:24 3224:33]
  assign FPComplexMult_reducable_1_io_in_b_Re = 32'h3f441b7c; // @[FFTDesigns.scala 3232:28]
  assign FPComplexMult_reducable_1_io_in_b_Im = 32'hbf248dba; // @[FFTDesigns.scala 3234:28]
  assign FPComplexMult_reducable_2_clock = clock;
  assign FPComplexMult_reducable_2_reset = reset;
  assign FPComplexMult_reducable_2_io_in_a_Re = io_in_7_Re; // @[FFTDesigns.scala 3215:24 3224:33]
  assign FPComplexMult_reducable_2_io_in_a_Im = io_in_7_Im; // @[FFTDesigns.scala 3215:24 3224:33]
  assign FPComplexMult_reducable_2_io_in_b_Re = 32'h3f000000; // @[FFTDesigns.scala 3232:28]
  assign FPComplexMult_reducable_3_clock = clock;
  assign FPComplexMult_reducable_3_reset = reset;
  assign FPComplexMult_reducable_3_io_in_a_Re = io_in_9_Re; // @[FFTDesigns.scala 3215:24 3224:33]
  assign FPComplexMult_reducable_3_io_in_a_Im = io_in_9_Im; // @[FFTDesigns.scala 3215:24 3224:33]
  assign FPComplexMult_reducable_3_io_in_b_Re = 32'h3e31d0d0; // @[FFTDesigns.scala 3232:28]
  assign FPComplexMult_reducable_3_io_in_b_Im = 32'hbf7c1c5c; // @[FFTDesigns.scala 3234:28]
  assign FPComplexMult_reducable_4_clock = clock;
  assign FPComplexMult_reducable_4_reset = reset;
  assign FPComplexMult_reducable_4_io_in_a_Re = io_in_11_Re; // @[FFTDesigns.scala 3215:24 3224:33]
  assign FPComplexMult_reducable_4_io_in_a_Im = io_in_11_Im; // @[FFTDesigns.scala 3215:24 3224:33]
  assign FPComplexMult_reducable_4_io_in_b_Re = 32'hbe31d0d0; // @[FFTDesigns.scala 3232:28]
  assign FPComplexMult_reducable_4_io_in_b_Im = 32'hbf7c1c5c; // @[FFTDesigns.scala 3234:28]
  assign FPComplexMult_reducable_5_clock = clock;
  assign FPComplexMult_reducable_5_reset = reset;
  assign FPComplexMult_reducable_5_io_in_a_Re = io_in_13_Re; // @[FFTDesigns.scala 3215:24 3224:33]
  assign FPComplexMult_reducable_5_io_in_a_Im = io_in_13_Im; // @[FFTDesigns.scala 3215:24 3224:33]
  assign FPComplexMult_reducable_5_io_in_b_Re = 32'hbefffffc; // @[FFTDesigns.scala 3232:28]
  assign FPComplexMult_reducable_6_clock = clock;
  assign FPComplexMult_reducable_6_reset = reset;
  assign FPComplexMult_reducable_6_io_in_a_Re = io_in_15_Re; // @[FFTDesigns.scala 3215:24 3224:33]
  assign FPComplexMult_reducable_6_io_in_a_Im = io_in_15_Im; // @[FFTDesigns.scala 3215:24 3224:33]
  assign FPComplexMult_reducable_6_io_in_b_Re = 32'hbf441b7c; // @[FFTDesigns.scala 3232:28]
  assign FPComplexMult_reducable_6_io_in_b_Im = 32'hbf248dba; // @[FFTDesigns.scala 3234:28]
  assign FPComplexMult_reducable_7_clock = clock;
  assign FPComplexMult_reducable_7_reset = reset;
  assign FPComplexMult_reducable_7_io_in_a_Re = io_in_17_Re; // @[FFTDesigns.scala 3215:24 3224:33]
  assign FPComplexMult_reducable_7_io_in_a_Im = io_in_17_Im; // @[FFTDesigns.scala 3215:24 3224:33]
  assign FPComplexMult_reducable_7_io_in_b_Re = 32'hbf708fb2; // @[FFTDesigns.scala 3232:28]
  assign FPComplexMult_reducable_7_io_in_b_Im = 32'hbeaf1d40; // @[FFTDesigns.scala 3234:28]
  always @(posedge clock) begin
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_0_0_Re <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_0_0_Re <= adj_wire_0_Re; // @[FFTDesigns.scala 3244:29]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_0_0_Im <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_0_0_Im <= adj_wire_0_Im; // @[FFTDesigns.scala 3244:29]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_0_1_Re <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_0_1_Re <= adj_wire_1_Re; // @[FFTDesigns.scala 3244:29]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_0_1_Im <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_0_1_Im <= adj_wire_1_Im; // @[FFTDesigns.scala 3244:29]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_0_2_Re <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_0_2_Re <= adj_wire_2_Re; // @[FFTDesigns.scala 3244:29]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_0_2_Im <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_0_2_Im <= adj_wire_2_Im; // @[FFTDesigns.scala 3244:29]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_0_3_Re <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_0_3_Re <= adj_wire_4_Re; // @[FFTDesigns.scala 3244:29]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_0_3_Im <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_0_3_Im <= adj_wire_4_Im; // @[FFTDesigns.scala 3244:29]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_0_4_Re <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_0_4_Re <= adj_wire_6_Re; // @[FFTDesigns.scala 3244:29]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_0_4_Im <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_0_4_Im <= adj_wire_6_Im; // @[FFTDesigns.scala 3244:29]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_0_5_Re <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_0_5_Re <= adj_wire_8_Re; // @[FFTDesigns.scala 3244:29]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_0_5_Im <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_0_5_Im <= adj_wire_8_Im; // @[FFTDesigns.scala 3244:29]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_0_6_Re <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_0_6_Re <= adj_wire_10_Re; // @[FFTDesigns.scala 3244:29]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_0_6_Im <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_0_6_Im <= adj_wire_10_Im; // @[FFTDesigns.scala 3244:29]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_0_7_Re <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_0_7_Re <= adj_wire_12_Re; // @[FFTDesigns.scala 3244:29]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_0_7_Im <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_0_7_Im <= adj_wire_12_Im; // @[FFTDesigns.scala 3244:29]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_0_8_Re <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_0_8_Re <= adj_wire_14_Re; // @[FFTDesigns.scala 3244:29]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_0_8_Im <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_0_8_Im <= adj_wire_14_Im; // @[FFTDesigns.scala 3244:29]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_0_9_Re <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_0_9_Re <= adj_wire_16_Re; // @[FFTDesigns.scala 3244:29]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_0_9_Im <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_0_9_Im <= adj_wire_16_Im; // @[FFTDesigns.scala 3244:29]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_1_0_Re <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_1_0_Re <= reg_syncs_0_0_Re; // @[FFTDesigns.scala 3247:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_1_0_Im <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_1_0_Im <= reg_syncs_0_0_Im; // @[FFTDesigns.scala 3247:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_1_1_Re <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_1_1_Re <= reg_syncs_0_1_Re; // @[FFTDesigns.scala 3247:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_1_1_Im <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_1_1_Im <= reg_syncs_0_1_Im; // @[FFTDesigns.scala 3247:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_1_2_Re <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_1_2_Re <= reg_syncs_0_2_Re; // @[FFTDesigns.scala 3247:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_1_2_Im <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_1_2_Im <= reg_syncs_0_2_Im; // @[FFTDesigns.scala 3247:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_1_3_Re <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_1_3_Re <= reg_syncs_0_3_Re; // @[FFTDesigns.scala 3247:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_1_3_Im <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_1_3_Im <= reg_syncs_0_3_Im; // @[FFTDesigns.scala 3247:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_1_4_Re <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_1_4_Re <= reg_syncs_0_4_Re; // @[FFTDesigns.scala 3247:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_1_4_Im <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_1_4_Im <= reg_syncs_0_4_Im; // @[FFTDesigns.scala 3247:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_1_5_Re <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_1_5_Re <= reg_syncs_0_5_Re; // @[FFTDesigns.scala 3247:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_1_5_Im <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_1_5_Im <= reg_syncs_0_5_Im; // @[FFTDesigns.scala 3247:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_1_6_Re <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_1_6_Re <= reg_syncs_0_6_Re; // @[FFTDesigns.scala 3247:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_1_6_Im <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_1_6_Im <= reg_syncs_0_6_Im; // @[FFTDesigns.scala 3247:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_1_7_Re <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_1_7_Re <= reg_syncs_0_7_Re; // @[FFTDesigns.scala 3247:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_1_7_Im <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_1_7_Im <= reg_syncs_0_7_Im; // @[FFTDesigns.scala 3247:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_1_8_Re <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_1_8_Re <= reg_syncs_0_8_Re; // @[FFTDesigns.scala 3247:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_1_8_Im <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_1_8_Im <= reg_syncs_0_8_Im; // @[FFTDesigns.scala 3247:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_1_9_Re <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_1_9_Re <= reg_syncs_0_9_Re; // @[FFTDesigns.scala 3247:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3238:27]
      reg_syncs_1_9_Im <= 32'h0; // @[FFTDesigns.scala 3238:27]
    end else begin
      reg_syncs_1_9_Im <= reg_syncs_0_9_Im; // @[FFTDesigns.scala 3247:24]
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
  reg_syncs_0_0_Re = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  reg_syncs_0_0_Im = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  reg_syncs_0_1_Re = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  reg_syncs_0_1_Im = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  reg_syncs_0_2_Re = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  reg_syncs_0_2_Im = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  reg_syncs_0_3_Re = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  reg_syncs_0_3_Im = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  reg_syncs_0_4_Re = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  reg_syncs_0_4_Im = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  reg_syncs_0_5_Re = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  reg_syncs_0_5_Im = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  reg_syncs_0_6_Re = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  reg_syncs_0_6_Im = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  reg_syncs_0_7_Re = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  reg_syncs_0_7_Im = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  reg_syncs_0_8_Re = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  reg_syncs_0_8_Im = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  reg_syncs_0_9_Re = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  reg_syncs_0_9_Im = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  reg_syncs_1_0_Re = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  reg_syncs_1_0_Im = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  reg_syncs_1_1_Re = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  reg_syncs_1_1_Im = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  reg_syncs_1_2_Re = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  reg_syncs_1_2_Im = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  reg_syncs_1_3_Re = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  reg_syncs_1_3_Im = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  reg_syncs_1_4_Re = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  reg_syncs_1_4_Im = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  reg_syncs_1_5_Re = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  reg_syncs_1_5_Im = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  reg_syncs_1_6_Re = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  reg_syncs_1_6_Im = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  reg_syncs_1_7_Re = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  reg_syncs_1_7_Im = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  reg_syncs_1_8_Re = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  reg_syncs_1_8_Im = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  reg_syncs_1_9_Re = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  reg_syncs_1_9_Im = _RAND_39[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FFT_mr18_basic(
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
  input  [31:0] io_in_6_Re,
  input  [31:0] io_in_6_Im,
  input  [31:0] io_in_7_Re,
  input  [31:0] io_in_7_Im,
  input  [31:0] io_in_8_Re,
  input  [31:0] io_in_8_Im,
  input  [31:0] io_in_9_Re,
  input  [31:0] io_in_9_Im,
  input  [31:0] io_in_10_Re,
  input  [31:0] io_in_10_Im,
  input  [31:0] io_in_11_Re,
  input  [31:0] io_in_11_Im,
  input  [31:0] io_in_12_Re,
  input  [31:0] io_in_12_Im,
  input  [31:0] io_in_13_Re,
  input  [31:0] io_in_13_Im,
  input  [31:0] io_in_14_Re,
  input  [31:0] io_in_14_Im,
  input  [31:0] io_in_15_Re,
  input  [31:0] io_in_15_Im,
  input  [31:0] io_in_16_Re,
  input  [31:0] io_in_16_Im,
  input  [31:0] io_in_17_Re,
  input  [31:0] io_in_17_Im,
  input         io_in_ready,
  output        io_out_validate,
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
  output [31:0] io_out_5_Im,
  output [31:0] io_out_6_Re,
  output [31:0] io_out_6_Im,
  output [31:0] io_out_7_Re,
  output [31:0] io_out_7_Im,
  output [31:0] io_out_8_Re,
  output [31:0] io_out_8_Im,
  output [31:0] io_out_9_Re,
  output [31:0] io_out_9_Im,
  output [31:0] io_out_10_Re,
  output [31:0] io_out_10_Im,
  output [31:0] io_out_11_Re,
  output [31:0] io_out_11_Im,
  output [31:0] io_out_12_Re,
  output [31:0] io_out_12_Im,
  output [31:0] io_out_13_Re,
  output [31:0] io_out_13_Im,
  output [31:0] io_out_14_Re,
  output [31:0] io_out_14_Im,
  output [31:0] io_out_15_Re,
  output [31:0] io_out_15_Im,
  output [31:0] io_out_16_Re,
  output [31:0] io_out_16_Im,
  output [31:0] io_out_17_Re,
  output [31:0] io_out_17_Im
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
`endif // RANDOMIZE_REG_INIT
  wire  FFT_sr_v2_nrv_clock; // @[FFTDesigns.scala 3438:28]
  wire  FFT_sr_v2_nrv_reset; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_in_0_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_in_0_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_in_1_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_in_1_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_in_2_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_in_2_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_in_3_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_in_3_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_in_4_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_in_4_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_in_5_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_in_5_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_in_6_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_in_6_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_in_7_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_in_7_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_in_8_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_in_8_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_out_0_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_out_0_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_out_1_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_out_1_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_out_2_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_out_2_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_out_3_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_out_3_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_out_4_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_out_4_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_out_5_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_out_5_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_out_6_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_out_6_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_out_7_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_out_7_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_out_8_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_io_out_8_Im; // @[FFTDesigns.scala 3438:28]
  wire  FFT_sr_v2_nrv_1_clock; // @[FFTDesigns.scala 3438:28]
  wire  FFT_sr_v2_nrv_1_reset; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_in_0_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_in_0_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_in_1_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_in_1_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_in_2_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_in_2_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_in_3_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_in_3_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_in_4_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_in_4_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_in_5_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_in_5_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_in_6_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_in_6_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_in_7_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_in_7_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_in_8_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_in_8_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_out_0_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_out_0_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_out_1_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_out_1_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_out_2_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_out_2_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_out_3_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_out_3_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_out_4_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_out_4_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_out_5_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_out_5_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_out_6_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_out_6_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_out_7_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_out_7_Im; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_out_8_Re; // @[FFTDesigns.scala 3438:28]
  wire [31:0] FFT_sr_v2_nrv_1_io_out_8_Im; // @[FFTDesigns.scala 3438:28]
  wire  FFT_sr_v2_nrv_2_clock; // @[FFTDesigns.scala 3442:28]
  wire  FFT_sr_v2_nrv_2_reset; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_2_io_in_0_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_2_io_in_0_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_2_io_in_1_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_2_io_in_1_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_2_io_out_0_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_2_io_out_0_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_2_io_out_1_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_2_io_out_1_Im; // @[FFTDesigns.scala 3442:28]
  wire  FFT_sr_v2_nrv_3_clock; // @[FFTDesigns.scala 3442:28]
  wire  FFT_sr_v2_nrv_3_reset; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_3_io_in_0_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_3_io_in_0_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_3_io_in_1_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_3_io_in_1_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_3_io_out_0_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_3_io_out_0_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_3_io_out_1_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_3_io_out_1_Im; // @[FFTDesigns.scala 3442:28]
  wire  FFT_sr_v2_nrv_4_clock; // @[FFTDesigns.scala 3442:28]
  wire  FFT_sr_v2_nrv_4_reset; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_4_io_in_0_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_4_io_in_0_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_4_io_in_1_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_4_io_in_1_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_4_io_out_0_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_4_io_out_0_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_4_io_out_1_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_4_io_out_1_Im; // @[FFTDesigns.scala 3442:28]
  wire  FFT_sr_v2_nrv_5_clock; // @[FFTDesigns.scala 3442:28]
  wire  FFT_sr_v2_nrv_5_reset; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_5_io_in_0_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_5_io_in_0_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_5_io_in_1_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_5_io_in_1_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_5_io_out_0_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_5_io_out_0_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_5_io_out_1_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_5_io_out_1_Im; // @[FFTDesigns.scala 3442:28]
  wire  FFT_sr_v2_nrv_6_clock; // @[FFTDesigns.scala 3442:28]
  wire  FFT_sr_v2_nrv_6_reset; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_6_io_in_0_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_6_io_in_0_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_6_io_in_1_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_6_io_in_1_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_6_io_out_0_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_6_io_out_0_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_6_io_out_1_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_6_io_out_1_Im; // @[FFTDesigns.scala 3442:28]
  wire  FFT_sr_v2_nrv_7_clock; // @[FFTDesigns.scala 3442:28]
  wire  FFT_sr_v2_nrv_7_reset; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_7_io_in_0_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_7_io_in_0_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_7_io_in_1_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_7_io_in_1_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_7_io_out_0_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_7_io_out_0_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_7_io_out_1_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_7_io_out_1_Im; // @[FFTDesigns.scala 3442:28]
  wire  FFT_sr_v2_nrv_8_clock; // @[FFTDesigns.scala 3442:28]
  wire  FFT_sr_v2_nrv_8_reset; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_8_io_in_0_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_8_io_in_0_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_8_io_in_1_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_8_io_in_1_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_8_io_out_0_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_8_io_out_0_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_8_io_out_1_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_8_io_out_1_Im; // @[FFTDesigns.scala 3442:28]
  wire  FFT_sr_v2_nrv_9_clock; // @[FFTDesigns.scala 3442:28]
  wire  FFT_sr_v2_nrv_9_reset; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_9_io_in_0_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_9_io_in_0_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_9_io_in_1_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_9_io_in_1_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_9_io_out_0_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_9_io_out_0_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_9_io_out_1_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_9_io_out_1_Im; // @[FFTDesigns.scala 3442:28]
  wire  FFT_sr_v2_nrv_10_clock; // @[FFTDesigns.scala 3442:28]
  wire  FFT_sr_v2_nrv_10_reset; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_10_io_in_0_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_10_io_in_0_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_10_io_in_1_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_10_io_in_1_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_10_io_out_0_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_10_io_out_0_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_10_io_out_1_Re; // @[FFTDesigns.scala 3442:28]
  wire [31:0] FFT_sr_v2_nrv_10_io_out_1_Im; // @[FFTDesigns.scala 3442:28]
  wire [31:0] PermutationsBasic_io_in_0_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_0_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_1_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_1_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_2_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_2_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_3_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_3_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_4_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_4_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_5_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_5_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_6_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_6_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_7_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_7_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_8_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_8_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_9_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_9_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_10_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_10_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_11_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_11_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_12_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_12_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_13_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_13_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_14_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_14_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_15_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_15_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_16_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_16_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_17_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_in_17_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_0_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_0_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_1_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_1_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_2_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_2_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_3_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_3_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_4_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_4_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_5_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_5_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_6_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_6_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_7_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_7_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_8_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_8_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_9_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_9_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_10_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_10_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_11_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_11_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_12_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_12_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_13_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_13_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_14_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_14_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_15_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_15_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_16_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_16_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_17_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_io_out_17_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_1_io_in_0_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_0_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_1_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_1_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_2_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_2_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_3_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_3_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_4_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_4_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_5_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_5_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_6_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_6_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_7_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_7_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_8_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_8_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_9_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_9_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_10_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_10_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_11_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_11_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_12_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_12_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_13_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_13_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_14_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_14_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_15_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_15_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_16_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_16_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_17_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_in_17_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_0_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_0_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_1_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_1_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_2_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_2_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_3_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_3_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_4_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_4_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_5_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_5_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_6_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_6_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_7_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_7_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_8_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_8_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_9_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_9_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_10_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_10_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_11_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_11_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_12_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_12_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_13_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_13_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_14_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_14_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_15_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_15_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_16_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_16_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_17_Re; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_1_io_out_17_Im; // @[FFTDesigns.scala 3447:27]
  wire [31:0] PermutationsBasic_2_io_in_0_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_0_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_1_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_1_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_2_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_2_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_3_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_3_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_4_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_4_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_5_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_5_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_6_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_6_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_7_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_7_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_8_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_8_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_9_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_9_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_10_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_10_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_11_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_11_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_12_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_12_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_13_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_13_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_14_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_14_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_15_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_15_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_16_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_16_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_17_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_in_17_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_0_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_0_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_1_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_1_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_2_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_2_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_3_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_3_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_4_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_4_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_5_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_5_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_6_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_6_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_7_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_7_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_8_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_8_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_9_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_9_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_10_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_10_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_11_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_11_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_12_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_12_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_13_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_13_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_14_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_14_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_15_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_15_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_16_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_16_Im; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_17_Re; // @[FFTDesigns.scala 3450:27]
  wire [31:0] PermutationsBasic_2_io_out_17_Im; // @[FFTDesigns.scala 3450:27]
  wire  TwiddleFactors_mr_clock; // @[FFTDesigns.scala 3454:29]
  wire  TwiddleFactors_mr_reset; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_0_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_0_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_1_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_1_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_2_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_2_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_3_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_3_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_4_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_4_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_5_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_5_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_6_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_6_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_7_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_7_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_8_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_8_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_9_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_9_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_10_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_10_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_11_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_11_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_12_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_12_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_13_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_13_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_14_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_14_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_15_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_15_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_16_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_16_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_17_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_in_17_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_0_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_0_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_1_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_1_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_2_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_2_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_3_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_3_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_4_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_4_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_5_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_5_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_6_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_6_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_7_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_7_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_8_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_8_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_9_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_9_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_10_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_10_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_11_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_11_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_12_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_12_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_13_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_13_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_14_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_14_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_15_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_15_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_16_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_16_Im; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_17_Re; // @[FFTDesigns.scala 3454:29]
  wire [31:0] TwiddleFactors_mr_io_out_17_Im; // @[FFTDesigns.scala 3454:29]
  reg  regdelays_0; // @[FFTDesigns.scala 3427:28]
  reg  regdelays_1; // @[FFTDesigns.scala 3427:28]
  reg  regdelays_2; // @[FFTDesigns.scala 3427:28]
  reg  regdelays_3; // @[FFTDesigns.scala 3427:28]
  reg  regdelays_4; // @[FFTDesigns.scala 3427:28]
  reg  regdelays_5; // @[FFTDesigns.scala 3427:28]
  reg  regdelays_6; // @[FFTDesigns.scala 3427:28]
  reg  regdelays_7; // @[FFTDesigns.scala 3427:28]
  reg  regdelays_8; // @[FFTDesigns.scala 3427:28]
  reg  regdelays_9; // @[FFTDesigns.scala 3427:28]
  reg  regdelays_10; // @[FFTDesigns.scala 3427:28]
  reg  regdelays_11; // @[FFTDesigns.scala 3427:28]
  reg  regdelays_12; // @[FFTDesigns.scala 3427:28]
  reg  out_regdelay; // @[FFTDesigns.scala 3435:31]
  reg [31:0] out_results_0_Re; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_0_Im; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_1_Re; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_1_Im; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_2_Re; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_2_Im; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_3_Re; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_3_Im; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_4_Re; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_4_Im; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_5_Re; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_5_Im; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_6_Re; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_6_Im; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_7_Re; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_7_Im; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_8_Re; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_8_Im; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_9_Re; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_9_Im; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_10_Re; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_10_Im; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_11_Re; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_11_Im; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_12_Re; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_12_Im; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_13_Re; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_13_Im; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_14_Re; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_14_Im; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_15_Re; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_15_Im; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_16_Re; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_16_Im; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_17_Re; // @[FFTDesigns.scala 3463:30]
  reg [31:0] out_results_17_Im; // @[FFTDesigns.scala 3463:30]
  FFT_sr_v2_nrv FFT_sr_v2_nrv ( // @[FFTDesigns.scala 3438:28]
    .clock(FFT_sr_v2_nrv_clock),
    .reset(FFT_sr_v2_nrv_reset),
    .io_in_0_Re(FFT_sr_v2_nrv_io_in_0_Re),
    .io_in_0_Im(FFT_sr_v2_nrv_io_in_0_Im),
    .io_in_1_Re(FFT_sr_v2_nrv_io_in_1_Re),
    .io_in_1_Im(FFT_sr_v2_nrv_io_in_1_Im),
    .io_in_2_Re(FFT_sr_v2_nrv_io_in_2_Re),
    .io_in_2_Im(FFT_sr_v2_nrv_io_in_2_Im),
    .io_in_3_Re(FFT_sr_v2_nrv_io_in_3_Re),
    .io_in_3_Im(FFT_sr_v2_nrv_io_in_3_Im),
    .io_in_4_Re(FFT_sr_v2_nrv_io_in_4_Re),
    .io_in_4_Im(FFT_sr_v2_nrv_io_in_4_Im),
    .io_in_5_Re(FFT_sr_v2_nrv_io_in_5_Re),
    .io_in_5_Im(FFT_sr_v2_nrv_io_in_5_Im),
    .io_in_6_Re(FFT_sr_v2_nrv_io_in_6_Re),
    .io_in_6_Im(FFT_sr_v2_nrv_io_in_6_Im),
    .io_in_7_Re(FFT_sr_v2_nrv_io_in_7_Re),
    .io_in_7_Im(FFT_sr_v2_nrv_io_in_7_Im),
    .io_in_8_Re(FFT_sr_v2_nrv_io_in_8_Re),
    .io_in_8_Im(FFT_sr_v2_nrv_io_in_8_Im),
    .io_out_0_Re(FFT_sr_v2_nrv_io_out_0_Re),
    .io_out_0_Im(FFT_sr_v2_nrv_io_out_0_Im),
    .io_out_1_Re(FFT_sr_v2_nrv_io_out_1_Re),
    .io_out_1_Im(FFT_sr_v2_nrv_io_out_1_Im),
    .io_out_2_Re(FFT_sr_v2_nrv_io_out_2_Re),
    .io_out_2_Im(FFT_sr_v2_nrv_io_out_2_Im),
    .io_out_3_Re(FFT_sr_v2_nrv_io_out_3_Re),
    .io_out_3_Im(FFT_sr_v2_nrv_io_out_3_Im),
    .io_out_4_Re(FFT_sr_v2_nrv_io_out_4_Re),
    .io_out_4_Im(FFT_sr_v2_nrv_io_out_4_Im),
    .io_out_5_Re(FFT_sr_v2_nrv_io_out_5_Re),
    .io_out_5_Im(FFT_sr_v2_nrv_io_out_5_Im),
    .io_out_6_Re(FFT_sr_v2_nrv_io_out_6_Re),
    .io_out_6_Im(FFT_sr_v2_nrv_io_out_6_Im),
    .io_out_7_Re(FFT_sr_v2_nrv_io_out_7_Re),
    .io_out_7_Im(FFT_sr_v2_nrv_io_out_7_Im),
    .io_out_8_Re(FFT_sr_v2_nrv_io_out_8_Re),
    .io_out_8_Im(FFT_sr_v2_nrv_io_out_8_Im)
  );
  FFT_sr_v2_nrv FFT_sr_v2_nrv_1 ( // @[FFTDesigns.scala 3438:28]
    .clock(FFT_sr_v2_nrv_1_clock),
    .reset(FFT_sr_v2_nrv_1_reset),
    .io_in_0_Re(FFT_sr_v2_nrv_1_io_in_0_Re),
    .io_in_0_Im(FFT_sr_v2_nrv_1_io_in_0_Im),
    .io_in_1_Re(FFT_sr_v2_nrv_1_io_in_1_Re),
    .io_in_1_Im(FFT_sr_v2_nrv_1_io_in_1_Im),
    .io_in_2_Re(FFT_sr_v2_nrv_1_io_in_2_Re),
    .io_in_2_Im(FFT_sr_v2_nrv_1_io_in_2_Im),
    .io_in_3_Re(FFT_sr_v2_nrv_1_io_in_3_Re),
    .io_in_3_Im(FFT_sr_v2_nrv_1_io_in_3_Im),
    .io_in_4_Re(FFT_sr_v2_nrv_1_io_in_4_Re),
    .io_in_4_Im(FFT_sr_v2_nrv_1_io_in_4_Im),
    .io_in_5_Re(FFT_sr_v2_nrv_1_io_in_5_Re),
    .io_in_5_Im(FFT_sr_v2_nrv_1_io_in_5_Im),
    .io_in_6_Re(FFT_sr_v2_nrv_1_io_in_6_Re),
    .io_in_6_Im(FFT_sr_v2_nrv_1_io_in_6_Im),
    .io_in_7_Re(FFT_sr_v2_nrv_1_io_in_7_Re),
    .io_in_7_Im(FFT_sr_v2_nrv_1_io_in_7_Im),
    .io_in_8_Re(FFT_sr_v2_nrv_1_io_in_8_Re),
    .io_in_8_Im(FFT_sr_v2_nrv_1_io_in_8_Im),
    .io_out_0_Re(FFT_sr_v2_nrv_1_io_out_0_Re),
    .io_out_0_Im(FFT_sr_v2_nrv_1_io_out_0_Im),
    .io_out_1_Re(FFT_sr_v2_nrv_1_io_out_1_Re),
    .io_out_1_Im(FFT_sr_v2_nrv_1_io_out_1_Im),
    .io_out_2_Re(FFT_sr_v2_nrv_1_io_out_2_Re),
    .io_out_2_Im(FFT_sr_v2_nrv_1_io_out_2_Im),
    .io_out_3_Re(FFT_sr_v2_nrv_1_io_out_3_Re),
    .io_out_3_Im(FFT_sr_v2_nrv_1_io_out_3_Im),
    .io_out_4_Re(FFT_sr_v2_nrv_1_io_out_4_Re),
    .io_out_4_Im(FFT_sr_v2_nrv_1_io_out_4_Im),
    .io_out_5_Re(FFT_sr_v2_nrv_1_io_out_5_Re),
    .io_out_5_Im(FFT_sr_v2_nrv_1_io_out_5_Im),
    .io_out_6_Re(FFT_sr_v2_nrv_1_io_out_6_Re),
    .io_out_6_Im(FFT_sr_v2_nrv_1_io_out_6_Im),
    .io_out_7_Re(FFT_sr_v2_nrv_1_io_out_7_Re),
    .io_out_7_Im(FFT_sr_v2_nrv_1_io_out_7_Im),
    .io_out_8_Re(FFT_sr_v2_nrv_1_io_out_8_Re),
    .io_out_8_Im(FFT_sr_v2_nrv_1_io_out_8_Im)
  );
  FFT_sr_v2_nrv_2 FFT_sr_v2_nrv_2 ( // @[FFTDesigns.scala 3442:28]
    .clock(FFT_sr_v2_nrv_2_clock),
    .reset(FFT_sr_v2_nrv_2_reset),
    .io_in_0_Re(FFT_sr_v2_nrv_2_io_in_0_Re),
    .io_in_0_Im(FFT_sr_v2_nrv_2_io_in_0_Im),
    .io_in_1_Re(FFT_sr_v2_nrv_2_io_in_1_Re),
    .io_in_1_Im(FFT_sr_v2_nrv_2_io_in_1_Im),
    .io_out_0_Re(FFT_sr_v2_nrv_2_io_out_0_Re),
    .io_out_0_Im(FFT_sr_v2_nrv_2_io_out_0_Im),
    .io_out_1_Re(FFT_sr_v2_nrv_2_io_out_1_Re),
    .io_out_1_Im(FFT_sr_v2_nrv_2_io_out_1_Im)
  );
  FFT_sr_v2_nrv_2 FFT_sr_v2_nrv_3 ( // @[FFTDesigns.scala 3442:28]
    .clock(FFT_sr_v2_nrv_3_clock),
    .reset(FFT_sr_v2_nrv_3_reset),
    .io_in_0_Re(FFT_sr_v2_nrv_3_io_in_0_Re),
    .io_in_0_Im(FFT_sr_v2_nrv_3_io_in_0_Im),
    .io_in_1_Re(FFT_sr_v2_nrv_3_io_in_1_Re),
    .io_in_1_Im(FFT_sr_v2_nrv_3_io_in_1_Im),
    .io_out_0_Re(FFT_sr_v2_nrv_3_io_out_0_Re),
    .io_out_0_Im(FFT_sr_v2_nrv_3_io_out_0_Im),
    .io_out_1_Re(FFT_sr_v2_nrv_3_io_out_1_Re),
    .io_out_1_Im(FFT_sr_v2_nrv_3_io_out_1_Im)
  );
  FFT_sr_v2_nrv_2 FFT_sr_v2_nrv_4 ( // @[FFTDesigns.scala 3442:28]
    .clock(FFT_sr_v2_nrv_4_clock),
    .reset(FFT_sr_v2_nrv_4_reset),
    .io_in_0_Re(FFT_sr_v2_nrv_4_io_in_0_Re),
    .io_in_0_Im(FFT_sr_v2_nrv_4_io_in_0_Im),
    .io_in_1_Re(FFT_sr_v2_nrv_4_io_in_1_Re),
    .io_in_1_Im(FFT_sr_v2_nrv_4_io_in_1_Im),
    .io_out_0_Re(FFT_sr_v2_nrv_4_io_out_0_Re),
    .io_out_0_Im(FFT_sr_v2_nrv_4_io_out_0_Im),
    .io_out_1_Re(FFT_sr_v2_nrv_4_io_out_1_Re),
    .io_out_1_Im(FFT_sr_v2_nrv_4_io_out_1_Im)
  );
  FFT_sr_v2_nrv_2 FFT_sr_v2_nrv_5 ( // @[FFTDesigns.scala 3442:28]
    .clock(FFT_sr_v2_nrv_5_clock),
    .reset(FFT_sr_v2_nrv_5_reset),
    .io_in_0_Re(FFT_sr_v2_nrv_5_io_in_0_Re),
    .io_in_0_Im(FFT_sr_v2_nrv_5_io_in_0_Im),
    .io_in_1_Re(FFT_sr_v2_nrv_5_io_in_1_Re),
    .io_in_1_Im(FFT_sr_v2_nrv_5_io_in_1_Im),
    .io_out_0_Re(FFT_sr_v2_nrv_5_io_out_0_Re),
    .io_out_0_Im(FFT_sr_v2_nrv_5_io_out_0_Im),
    .io_out_1_Re(FFT_sr_v2_nrv_5_io_out_1_Re),
    .io_out_1_Im(FFT_sr_v2_nrv_5_io_out_1_Im)
  );
  FFT_sr_v2_nrv_2 FFT_sr_v2_nrv_6 ( // @[FFTDesigns.scala 3442:28]
    .clock(FFT_sr_v2_nrv_6_clock),
    .reset(FFT_sr_v2_nrv_6_reset),
    .io_in_0_Re(FFT_sr_v2_nrv_6_io_in_0_Re),
    .io_in_0_Im(FFT_sr_v2_nrv_6_io_in_0_Im),
    .io_in_1_Re(FFT_sr_v2_nrv_6_io_in_1_Re),
    .io_in_1_Im(FFT_sr_v2_nrv_6_io_in_1_Im),
    .io_out_0_Re(FFT_sr_v2_nrv_6_io_out_0_Re),
    .io_out_0_Im(FFT_sr_v2_nrv_6_io_out_0_Im),
    .io_out_1_Re(FFT_sr_v2_nrv_6_io_out_1_Re),
    .io_out_1_Im(FFT_sr_v2_nrv_6_io_out_1_Im)
  );
  FFT_sr_v2_nrv_2 FFT_sr_v2_nrv_7 ( // @[FFTDesigns.scala 3442:28]
    .clock(FFT_sr_v2_nrv_7_clock),
    .reset(FFT_sr_v2_nrv_7_reset),
    .io_in_0_Re(FFT_sr_v2_nrv_7_io_in_0_Re),
    .io_in_0_Im(FFT_sr_v2_nrv_7_io_in_0_Im),
    .io_in_1_Re(FFT_sr_v2_nrv_7_io_in_1_Re),
    .io_in_1_Im(FFT_sr_v2_nrv_7_io_in_1_Im),
    .io_out_0_Re(FFT_sr_v2_nrv_7_io_out_0_Re),
    .io_out_0_Im(FFT_sr_v2_nrv_7_io_out_0_Im),
    .io_out_1_Re(FFT_sr_v2_nrv_7_io_out_1_Re),
    .io_out_1_Im(FFT_sr_v2_nrv_7_io_out_1_Im)
  );
  FFT_sr_v2_nrv_2 FFT_sr_v2_nrv_8 ( // @[FFTDesigns.scala 3442:28]
    .clock(FFT_sr_v2_nrv_8_clock),
    .reset(FFT_sr_v2_nrv_8_reset),
    .io_in_0_Re(FFT_sr_v2_nrv_8_io_in_0_Re),
    .io_in_0_Im(FFT_sr_v2_nrv_8_io_in_0_Im),
    .io_in_1_Re(FFT_sr_v2_nrv_8_io_in_1_Re),
    .io_in_1_Im(FFT_sr_v2_nrv_8_io_in_1_Im),
    .io_out_0_Re(FFT_sr_v2_nrv_8_io_out_0_Re),
    .io_out_0_Im(FFT_sr_v2_nrv_8_io_out_0_Im),
    .io_out_1_Re(FFT_sr_v2_nrv_8_io_out_1_Re),
    .io_out_1_Im(FFT_sr_v2_nrv_8_io_out_1_Im)
  );
  FFT_sr_v2_nrv_2 FFT_sr_v2_nrv_9 ( // @[FFTDesigns.scala 3442:28]
    .clock(FFT_sr_v2_nrv_9_clock),
    .reset(FFT_sr_v2_nrv_9_reset),
    .io_in_0_Re(FFT_sr_v2_nrv_9_io_in_0_Re),
    .io_in_0_Im(FFT_sr_v2_nrv_9_io_in_0_Im),
    .io_in_1_Re(FFT_sr_v2_nrv_9_io_in_1_Re),
    .io_in_1_Im(FFT_sr_v2_nrv_9_io_in_1_Im),
    .io_out_0_Re(FFT_sr_v2_nrv_9_io_out_0_Re),
    .io_out_0_Im(FFT_sr_v2_nrv_9_io_out_0_Im),
    .io_out_1_Re(FFT_sr_v2_nrv_9_io_out_1_Re),
    .io_out_1_Im(FFT_sr_v2_nrv_9_io_out_1_Im)
  );
  FFT_sr_v2_nrv_2 FFT_sr_v2_nrv_10 ( // @[FFTDesigns.scala 3442:28]
    .clock(FFT_sr_v2_nrv_10_clock),
    .reset(FFT_sr_v2_nrv_10_reset),
    .io_in_0_Re(FFT_sr_v2_nrv_10_io_in_0_Re),
    .io_in_0_Im(FFT_sr_v2_nrv_10_io_in_0_Im),
    .io_in_1_Re(FFT_sr_v2_nrv_10_io_in_1_Re),
    .io_in_1_Im(FFT_sr_v2_nrv_10_io_in_1_Im),
    .io_out_0_Re(FFT_sr_v2_nrv_10_io_out_0_Re),
    .io_out_0_Im(FFT_sr_v2_nrv_10_io_out_0_Im),
    .io_out_1_Re(FFT_sr_v2_nrv_10_io_out_1_Re),
    .io_out_1_Im(FFT_sr_v2_nrv_10_io_out_1_Im)
  );
  PermutationsBasic_24 PermutationsBasic ( // @[FFTDesigns.scala 3450:27]
    .io_in_0_Re(PermutationsBasic_io_in_0_Re),
    .io_in_0_Im(PermutationsBasic_io_in_0_Im),
    .io_in_1_Re(PermutationsBasic_io_in_1_Re),
    .io_in_1_Im(PermutationsBasic_io_in_1_Im),
    .io_in_2_Re(PermutationsBasic_io_in_2_Re),
    .io_in_2_Im(PermutationsBasic_io_in_2_Im),
    .io_in_3_Re(PermutationsBasic_io_in_3_Re),
    .io_in_3_Im(PermutationsBasic_io_in_3_Im),
    .io_in_4_Re(PermutationsBasic_io_in_4_Re),
    .io_in_4_Im(PermutationsBasic_io_in_4_Im),
    .io_in_5_Re(PermutationsBasic_io_in_5_Re),
    .io_in_5_Im(PermutationsBasic_io_in_5_Im),
    .io_in_6_Re(PermutationsBasic_io_in_6_Re),
    .io_in_6_Im(PermutationsBasic_io_in_6_Im),
    .io_in_7_Re(PermutationsBasic_io_in_7_Re),
    .io_in_7_Im(PermutationsBasic_io_in_7_Im),
    .io_in_8_Re(PermutationsBasic_io_in_8_Re),
    .io_in_8_Im(PermutationsBasic_io_in_8_Im),
    .io_in_9_Re(PermutationsBasic_io_in_9_Re),
    .io_in_9_Im(PermutationsBasic_io_in_9_Im),
    .io_in_10_Re(PermutationsBasic_io_in_10_Re),
    .io_in_10_Im(PermutationsBasic_io_in_10_Im),
    .io_in_11_Re(PermutationsBasic_io_in_11_Re),
    .io_in_11_Im(PermutationsBasic_io_in_11_Im),
    .io_in_12_Re(PermutationsBasic_io_in_12_Re),
    .io_in_12_Im(PermutationsBasic_io_in_12_Im),
    .io_in_13_Re(PermutationsBasic_io_in_13_Re),
    .io_in_13_Im(PermutationsBasic_io_in_13_Im),
    .io_in_14_Re(PermutationsBasic_io_in_14_Re),
    .io_in_14_Im(PermutationsBasic_io_in_14_Im),
    .io_in_15_Re(PermutationsBasic_io_in_15_Re),
    .io_in_15_Im(PermutationsBasic_io_in_15_Im),
    .io_in_16_Re(PermutationsBasic_io_in_16_Re),
    .io_in_16_Im(PermutationsBasic_io_in_16_Im),
    .io_in_17_Re(PermutationsBasic_io_in_17_Re),
    .io_in_17_Im(PermutationsBasic_io_in_17_Im),
    .io_out_0_Re(PermutationsBasic_io_out_0_Re),
    .io_out_0_Im(PermutationsBasic_io_out_0_Im),
    .io_out_1_Re(PermutationsBasic_io_out_1_Re),
    .io_out_1_Im(PermutationsBasic_io_out_1_Im),
    .io_out_2_Re(PermutationsBasic_io_out_2_Re),
    .io_out_2_Im(PermutationsBasic_io_out_2_Im),
    .io_out_3_Re(PermutationsBasic_io_out_3_Re),
    .io_out_3_Im(PermutationsBasic_io_out_3_Im),
    .io_out_4_Re(PermutationsBasic_io_out_4_Re),
    .io_out_4_Im(PermutationsBasic_io_out_4_Im),
    .io_out_5_Re(PermutationsBasic_io_out_5_Re),
    .io_out_5_Im(PermutationsBasic_io_out_5_Im),
    .io_out_6_Re(PermutationsBasic_io_out_6_Re),
    .io_out_6_Im(PermutationsBasic_io_out_6_Im),
    .io_out_7_Re(PermutationsBasic_io_out_7_Re),
    .io_out_7_Im(PermutationsBasic_io_out_7_Im),
    .io_out_8_Re(PermutationsBasic_io_out_8_Re),
    .io_out_8_Im(PermutationsBasic_io_out_8_Im),
    .io_out_9_Re(PermutationsBasic_io_out_9_Re),
    .io_out_9_Im(PermutationsBasic_io_out_9_Im),
    .io_out_10_Re(PermutationsBasic_io_out_10_Re),
    .io_out_10_Im(PermutationsBasic_io_out_10_Im),
    .io_out_11_Re(PermutationsBasic_io_out_11_Re),
    .io_out_11_Im(PermutationsBasic_io_out_11_Im),
    .io_out_12_Re(PermutationsBasic_io_out_12_Re),
    .io_out_12_Im(PermutationsBasic_io_out_12_Im),
    .io_out_13_Re(PermutationsBasic_io_out_13_Re),
    .io_out_13_Im(PermutationsBasic_io_out_13_Im),
    .io_out_14_Re(PermutationsBasic_io_out_14_Re),
    .io_out_14_Im(PermutationsBasic_io_out_14_Im),
    .io_out_15_Re(PermutationsBasic_io_out_15_Re),
    .io_out_15_Im(PermutationsBasic_io_out_15_Im),
    .io_out_16_Re(PermutationsBasic_io_out_16_Re),
    .io_out_16_Im(PermutationsBasic_io_out_16_Im),
    .io_out_17_Re(PermutationsBasic_io_out_17_Re),
    .io_out_17_Im(PermutationsBasic_io_out_17_Im)
  );
  PermutationsBasic_25 PermutationsBasic_1 ( // @[FFTDesigns.scala 3447:27]
    .io_in_0_Re(PermutationsBasic_1_io_in_0_Re),
    .io_in_0_Im(PermutationsBasic_1_io_in_0_Im),
    .io_in_1_Re(PermutationsBasic_1_io_in_1_Re),
    .io_in_1_Im(PermutationsBasic_1_io_in_1_Im),
    .io_in_2_Re(PermutationsBasic_1_io_in_2_Re),
    .io_in_2_Im(PermutationsBasic_1_io_in_2_Im),
    .io_in_3_Re(PermutationsBasic_1_io_in_3_Re),
    .io_in_3_Im(PermutationsBasic_1_io_in_3_Im),
    .io_in_4_Re(PermutationsBasic_1_io_in_4_Re),
    .io_in_4_Im(PermutationsBasic_1_io_in_4_Im),
    .io_in_5_Re(PermutationsBasic_1_io_in_5_Re),
    .io_in_5_Im(PermutationsBasic_1_io_in_5_Im),
    .io_in_6_Re(PermutationsBasic_1_io_in_6_Re),
    .io_in_6_Im(PermutationsBasic_1_io_in_6_Im),
    .io_in_7_Re(PermutationsBasic_1_io_in_7_Re),
    .io_in_7_Im(PermutationsBasic_1_io_in_7_Im),
    .io_in_8_Re(PermutationsBasic_1_io_in_8_Re),
    .io_in_8_Im(PermutationsBasic_1_io_in_8_Im),
    .io_in_9_Re(PermutationsBasic_1_io_in_9_Re),
    .io_in_9_Im(PermutationsBasic_1_io_in_9_Im),
    .io_in_10_Re(PermutationsBasic_1_io_in_10_Re),
    .io_in_10_Im(PermutationsBasic_1_io_in_10_Im),
    .io_in_11_Re(PermutationsBasic_1_io_in_11_Re),
    .io_in_11_Im(PermutationsBasic_1_io_in_11_Im),
    .io_in_12_Re(PermutationsBasic_1_io_in_12_Re),
    .io_in_12_Im(PermutationsBasic_1_io_in_12_Im),
    .io_in_13_Re(PermutationsBasic_1_io_in_13_Re),
    .io_in_13_Im(PermutationsBasic_1_io_in_13_Im),
    .io_in_14_Re(PermutationsBasic_1_io_in_14_Re),
    .io_in_14_Im(PermutationsBasic_1_io_in_14_Im),
    .io_in_15_Re(PermutationsBasic_1_io_in_15_Re),
    .io_in_15_Im(PermutationsBasic_1_io_in_15_Im),
    .io_in_16_Re(PermutationsBasic_1_io_in_16_Re),
    .io_in_16_Im(PermutationsBasic_1_io_in_16_Im),
    .io_in_17_Re(PermutationsBasic_1_io_in_17_Re),
    .io_in_17_Im(PermutationsBasic_1_io_in_17_Im),
    .io_out_0_Re(PermutationsBasic_1_io_out_0_Re),
    .io_out_0_Im(PermutationsBasic_1_io_out_0_Im),
    .io_out_1_Re(PermutationsBasic_1_io_out_1_Re),
    .io_out_1_Im(PermutationsBasic_1_io_out_1_Im),
    .io_out_2_Re(PermutationsBasic_1_io_out_2_Re),
    .io_out_2_Im(PermutationsBasic_1_io_out_2_Im),
    .io_out_3_Re(PermutationsBasic_1_io_out_3_Re),
    .io_out_3_Im(PermutationsBasic_1_io_out_3_Im),
    .io_out_4_Re(PermutationsBasic_1_io_out_4_Re),
    .io_out_4_Im(PermutationsBasic_1_io_out_4_Im),
    .io_out_5_Re(PermutationsBasic_1_io_out_5_Re),
    .io_out_5_Im(PermutationsBasic_1_io_out_5_Im),
    .io_out_6_Re(PermutationsBasic_1_io_out_6_Re),
    .io_out_6_Im(PermutationsBasic_1_io_out_6_Im),
    .io_out_7_Re(PermutationsBasic_1_io_out_7_Re),
    .io_out_7_Im(PermutationsBasic_1_io_out_7_Im),
    .io_out_8_Re(PermutationsBasic_1_io_out_8_Re),
    .io_out_8_Im(PermutationsBasic_1_io_out_8_Im),
    .io_out_9_Re(PermutationsBasic_1_io_out_9_Re),
    .io_out_9_Im(PermutationsBasic_1_io_out_9_Im),
    .io_out_10_Re(PermutationsBasic_1_io_out_10_Re),
    .io_out_10_Im(PermutationsBasic_1_io_out_10_Im),
    .io_out_11_Re(PermutationsBasic_1_io_out_11_Re),
    .io_out_11_Im(PermutationsBasic_1_io_out_11_Im),
    .io_out_12_Re(PermutationsBasic_1_io_out_12_Re),
    .io_out_12_Im(PermutationsBasic_1_io_out_12_Im),
    .io_out_13_Re(PermutationsBasic_1_io_out_13_Re),
    .io_out_13_Im(PermutationsBasic_1_io_out_13_Im),
    .io_out_14_Re(PermutationsBasic_1_io_out_14_Re),
    .io_out_14_Im(PermutationsBasic_1_io_out_14_Im),
    .io_out_15_Re(PermutationsBasic_1_io_out_15_Re),
    .io_out_15_Im(PermutationsBasic_1_io_out_15_Im),
    .io_out_16_Re(PermutationsBasic_1_io_out_16_Re),
    .io_out_16_Im(PermutationsBasic_1_io_out_16_Im),
    .io_out_17_Re(PermutationsBasic_1_io_out_17_Re),
    .io_out_17_Im(PermutationsBasic_1_io_out_17_Im)
  );
  PermutationsBasic_24 PermutationsBasic_2 ( // @[FFTDesigns.scala 3450:27]
    .io_in_0_Re(PermutationsBasic_2_io_in_0_Re),
    .io_in_0_Im(PermutationsBasic_2_io_in_0_Im),
    .io_in_1_Re(PermutationsBasic_2_io_in_1_Re),
    .io_in_1_Im(PermutationsBasic_2_io_in_1_Im),
    .io_in_2_Re(PermutationsBasic_2_io_in_2_Re),
    .io_in_2_Im(PermutationsBasic_2_io_in_2_Im),
    .io_in_3_Re(PermutationsBasic_2_io_in_3_Re),
    .io_in_3_Im(PermutationsBasic_2_io_in_3_Im),
    .io_in_4_Re(PermutationsBasic_2_io_in_4_Re),
    .io_in_4_Im(PermutationsBasic_2_io_in_4_Im),
    .io_in_5_Re(PermutationsBasic_2_io_in_5_Re),
    .io_in_5_Im(PermutationsBasic_2_io_in_5_Im),
    .io_in_6_Re(PermutationsBasic_2_io_in_6_Re),
    .io_in_6_Im(PermutationsBasic_2_io_in_6_Im),
    .io_in_7_Re(PermutationsBasic_2_io_in_7_Re),
    .io_in_7_Im(PermutationsBasic_2_io_in_7_Im),
    .io_in_8_Re(PermutationsBasic_2_io_in_8_Re),
    .io_in_8_Im(PermutationsBasic_2_io_in_8_Im),
    .io_in_9_Re(PermutationsBasic_2_io_in_9_Re),
    .io_in_9_Im(PermutationsBasic_2_io_in_9_Im),
    .io_in_10_Re(PermutationsBasic_2_io_in_10_Re),
    .io_in_10_Im(PermutationsBasic_2_io_in_10_Im),
    .io_in_11_Re(PermutationsBasic_2_io_in_11_Re),
    .io_in_11_Im(PermutationsBasic_2_io_in_11_Im),
    .io_in_12_Re(PermutationsBasic_2_io_in_12_Re),
    .io_in_12_Im(PermutationsBasic_2_io_in_12_Im),
    .io_in_13_Re(PermutationsBasic_2_io_in_13_Re),
    .io_in_13_Im(PermutationsBasic_2_io_in_13_Im),
    .io_in_14_Re(PermutationsBasic_2_io_in_14_Re),
    .io_in_14_Im(PermutationsBasic_2_io_in_14_Im),
    .io_in_15_Re(PermutationsBasic_2_io_in_15_Re),
    .io_in_15_Im(PermutationsBasic_2_io_in_15_Im),
    .io_in_16_Re(PermutationsBasic_2_io_in_16_Re),
    .io_in_16_Im(PermutationsBasic_2_io_in_16_Im),
    .io_in_17_Re(PermutationsBasic_2_io_in_17_Re),
    .io_in_17_Im(PermutationsBasic_2_io_in_17_Im),
    .io_out_0_Re(PermutationsBasic_2_io_out_0_Re),
    .io_out_0_Im(PermutationsBasic_2_io_out_0_Im),
    .io_out_1_Re(PermutationsBasic_2_io_out_1_Re),
    .io_out_1_Im(PermutationsBasic_2_io_out_1_Im),
    .io_out_2_Re(PermutationsBasic_2_io_out_2_Re),
    .io_out_2_Im(PermutationsBasic_2_io_out_2_Im),
    .io_out_3_Re(PermutationsBasic_2_io_out_3_Re),
    .io_out_3_Im(PermutationsBasic_2_io_out_3_Im),
    .io_out_4_Re(PermutationsBasic_2_io_out_4_Re),
    .io_out_4_Im(PermutationsBasic_2_io_out_4_Im),
    .io_out_5_Re(PermutationsBasic_2_io_out_5_Re),
    .io_out_5_Im(PermutationsBasic_2_io_out_5_Im),
    .io_out_6_Re(PermutationsBasic_2_io_out_6_Re),
    .io_out_6_Im(PermutationsBasic_2_io_out_6_Im),
    .io_out_7_Re(PermutationsBasic_2_io_out_7_Re),
    .io_out_7_Im(PermutationsBasic_2_io_out_7_Im),
    .io_out_8_Re(PermutationsBasic_2_io_out_8_Re),
    .io_out_8_Im(PermutationsBasic_2_io_out_8_Im),
    .io_out_9_Re(PermutationsBasic_2_io_out_9_Re),
    .io_out_9_Im(PermutationsBasic_2_io_out_9_Im),
    .io_out_10_Re(PermutationsBasic_2_io_out_10_Re),
    .io_out_10_Im(PermutationsBasic_2_io_out_10_Im),
    .io_out_11_Re(PermutationsBasic_2_io_out_11_Re),
    .io_out_11_Im(PermutationsBasic_2_io_out_11_Im),
    .io_out_12_Re(PermutationsBasic_2_io_out_12_Re),
    .io_out_12_Im(PermutationsBasic_2_io_out_12_Im),
    .io_out_13_Re(PermutationsBasic_2_io_out_13_Re),
    .io_out_13_Im(PermutationsBasic_2_io_out_13_Im),
    .io_out_14_Re(PermutationsBasic_2_io_out_14_Re),
    .io_out_14_Im(PermutationsBasic_2_io_out_14_Im),
    .io_out_15_Re(PermutationsBasic_2_io_out_15_Re),
    .io_out_15_Im(PermutationsBasic_2_io_out_15_Im),
    .io_out_16_Re(PermutationsBasic_2_io_out_16_Re),
    .io_out_16_Im(PermutationsBasic_2_io_out_16_Im),
    .io_out_17_Re(PermutationsBasic_2_io_out_17_Re),
    .io_out_17_Im(PermutationsBasic_2_io_out_17_Im)
  );
  TwiddleFactors_mr TwiddleFactors_mr ( // @[FFTDesigns.scala 3454:29]
    .clock(TwiddleFactors_mr_clock),
    .reset(TwiddleFactors_mr_reset),
    .io_in_0_Re(TwiddleFactors_mr_io_in_0_Re),
    .io_in_0_Im(TwiddleFactors_mr_io_in_0_Im),
    .io_in_1_Re(TwiddleFactors_mr_io_in_1_Re),
    .io_in_1_Im(TwiddleFactors_mr_io_in_1_Im),
    .io_in_2_Re(TwiddleFactors_mr_io_in_2_Re),
    .io_in_2_Im(TwiddleFactors_mr_io_in_2_Im),
    .io_in_3_Re(TwiddleFactors_mr_io_in_3_Re),
    .io_in_3_Im(TwiddleFactors_mr_io_in_3_Im),
    .io_in_4_Re(TwiddleFactors_mr_io_in_4_Re),
    .io_in_4_Im(TwiddleFactors_mr_io_in_4_Im),
    .io_in_5_Re(TwiddleFactors_mr_io_in_5_Re),
    .io_in_5_Im(TwiddleFactors_mr_io_in_5_Im),
    .io_in_6_Re(TwiddleFactors_mr_io_in_6_Re),
    .io_in_6_Im(TwiddleFactors_mr_io_in_6_Im),
    .io_in_7_Re(TwiddleFactors_mr_io_in_7_Re),
    .io_in_7_Im(TwiddleFactors_mr_io_in_7_Im),
    .io_in_8_Re(TwiddleFactors_mr_io_in_8_Re),
    .io_in_8_Im(TwiddleFactors_mr_io_in_8_Im),
    .io_in_9_Re(TwiddleFactors_mr_io_in_9_Re),
    .io_in_9_Im(TwiddleFactors_mr_io_in_9_Im),
    .io_in_10_Re(TwiddleFactors_mr_io_in_10_Re),
    .io_in_10_Im(TwiddleFactors_mr_io_in_10_Im),
    .io_in_11_Re(TwiddleFactors_mr_io_in_11_Re),
    .io_in_11_Im(TwiddleFactors_mr_io_in_11_Im),
    .io_in_12_Re(TwiddleFactors_mr_io_in_12_Re),
    .io_in_12_Im(TwiddleFactors_mr_io_in_12_Im),
    .io_in_13_Re(TwiddleFactors_mr_io_in_13_Re),
    .io_in_13_Im(TwiddleFactors_mr_io_in_13_Im),
    .io_in_14_Re(TwiddleFactors_mr_io_in_14_Re),
    .io_in_14_Im(TwiddleFactors_mr_io_in_14_Im),
    .io_in_15_Re(TwiddleFactors_mr_io_in_15_Re),
    .io_in_15_Im(TwiddleFactors_mr_io_in_15_Im),
    .io_in_16_Re(TwiddleFactors_mr_io_in_16_Re),
    .io_in_16_Im(TwiddleFactors_mr_io_in_16_Im),
    .io_in_17_Re(TwiddleFactors_mr_io_in_17_Re),
    .io_in_17_Im(TwiddleFactors_mr_io_in_17_Im),
    .io_out_0_Re(TwiddleFactors_mr_io_out_0_Re),
    .io_out_0_Im(TwiddleFactors_mr_io_out_0_Im),
    .io_out_1_Re(TwiddleFactors_mr_io_out_1_Re),
    .io_out_1_Im(TwiddleFactors_mr_io_out_1_Im),
    .io_out_2_Re(TwiddleFactors_mr_io_out_2_Re),
    .io_out_2_Im(TwiddleFactors_mr_io_out_2_Im),
    .io_out_3_Re(TwiddleFactors_mr_io_out_3_Re),
    .io_out_3_Im(TwiddleFactors_mr_io_out_3_Im),
    .io_out_4_Re(TwiddleFactors_mr_io_out_4_Re),
    .io_out_4_Im(TwiddleFactors_mr_io_out_4_Im),
    .io_out_5_Re(TwiddleFactors_mr_io_out_5_Re),
    .io_out_5_Im(TwiddleFactors_mr_io_out_5_Im),
    .io_out_6_Re(TwiddleFactors_mr_io_out_6_Re),
    .io_out_6_Im(TwiddleFactors_mr_io_out_6_Im),
    .io_out_7_Re(TwiddleFactors_mr_io_out_7_Re),
    .io_out_7_Im(TwiddleFactors_mr_io_out_7_Im),
    .io_out_8_Re(TwiddleFactors_mr_io_out_8_Re),
    .io_out_8_Im(TwiddleFactors_mr_io_out_8_Im),
    .io_out_9_Re(TwiddleFactors_mr_io_out_9_Re),
    .io_out_9_Im(TwiddleFactors_mr_io_out_9_Im),
    .io_out_10_Re(TwiddleFactors_mr_io_out_10_Re),
    .io_out_10_Im(TwiddleFactors_mr_io_out_10_Im),
    .io_out_11_Re(TwiddleFactors_mr_io_out_11_Re),
    .io_out_11_Im(TwiddleFactors_mr_io_out_11_Im),
    .io_out_12_Re(TwiddleFactors_mr_io_out_12_Re),
    .io_out_12_Im(TwiddleFactors_mr_io_out_12_Im),
    .io_out_13_Re(TwiddleFactors_mr_io_out_13_Re),
    .io_out_13_Im(TwiddleFactors_mr_io_out_13_Im),
    .io_out_14_Re(TwiddleFactors_mr_io_out_14_Re),
    .io_out_14_Im(TwiddleFactors_mr_io_out_14_Im),
    .io_out_15_Re(TwiddleFactors_mr_io_out_15_Re),
    .io_out_15_Im(TwiddleFactors_mr_io_out_15_Im),
    .io_out_16_Re(TwiddleFactors_mr_io_out_16_Re),
    .io_out_16_Im(TwiddleFactors_mr_io_out_16_Im),
    .io_out_17_Re(TwiddleFactors_mr_io_out_17_Re),
    .io_out_17_Im(TwiddleFactors_mr_io_out_17_Im)
  );
  assign io_out_validate = out_regdelay; // @[FFTDesigns.scala 3473:21]
  assign io_out_0_Re = out_results_0_Re; // @[FFTDesigns.scala 3474:12]
  assign io_out_0_Im = out_results_0_Im; // @[FFTDesigns.scala 3474:12]
  assign io_out_1_Re = out_results_1_Re; // @[FFTDesigns.scala 3474:12]
  assign io_out_1_Im = out_results_1_Im; // @[FFTDesigns.scala 3474:12]
  assign io_out_2_Re = out_results_2_Re; // @[FFTDesigns.scala 3474:12]
  assign io_out_2_Im = out_results_2_Im; // @[FFTDesigns.scala 3474:12]
  assign io_out_3_Re = out_results_3_Re; // @[FFTDesigns.scala 3474:12]
  assign io_out_3_Im = out_results_3_Im; // @[FFTDesigns.scala 3474:12]
  assign io_out_4_Re = out_results_4_Re; // @[FFTDesigns.scala 3474:12]
  assign io_out_4_Im = out_results_4_Im; // @[FFTDesigns.scala 3474:12]
  assign io_out_5_Re = out_results_5_Re; // @[FFTDesigns.scala 3474:12]
  assign io_out_5_Im = out_results_5_Im; // @[FFTDesigns.scala 3474:12]
  assign io_out_6_Re = out_results_6_Re; // @[FFTDesigns.scala 3474:12]
  assign io_out_6_Im = out_results_6_Im; // @[FFTDesigns.scala 3474:12]
  assign io_out_7_Re = out_results_7_Re; // @[FFTDesigns.scala 3474:12]
  assign io_out_7_Im = out_results_7_Im; // @[FFTDesigns.scala 3474:12]
  assign io_out_8_Re = out_results_8_Re; // @[FFTDesigns.scala 3474:12]
  assign io_out_8_Im = out_results_8_Im; // @[FFTDesigns.scala 3474:12]
  assign io_out_9_Re = out_results_9_Re; // @[FFTDesigns.scala 3474:12]
  assign io_out_9_Im = out_results_9_Im; // @[FFTDesigns.scala 3474:12]
  assign io_out_10_Re = out_results_10_Re; // @[FFTDesigns.scala 3474:12]
  assign io_out_10_Im = out_results_10_Im; // @[FFTDesigns.scala 3474:12]
  assign io_out_11_Re = out_results_11_Re; // @[FFTDesigns.scala 3474:12]
  assign io_out_11_Im = out_results_11_Im; // @[FFTDesigns.scala 3474:12]
  assign io_out_12_Re = out_results_12_Re; // @[FFTDesigns.scala 3474:12]
  assign io_out_12_Im = out_results_12_Im; // @[FFTDesigns.scala 3474:12]
  assign io_out_13_Re = out_results_13_Re; // @[FFTDesigns.scala 3474:12]
  assign io_out_13_Im = out_results_13_Im; // @[FFTDesigns.scala 3474:12]
  assign io_out_14_Re = out_results_14_Re; // @[FFTDesigns.scala 3474:12]
  assign io_out_14_Im = out_results_14_Im; // @[FFTDesigns.scala 3474:12]
  assign io_out_15_Re = out_results_15_Re; // @[FFTDesigns.scala 3474:12]
  assign io_out_15_Im = out_results_15_Im; // @[FFTDesigns.scala 3474:12]
  assign io_out_16_Re = out_results_16_Re; // @[FFTDesigns.scala 3474:12]
  assign io_out_16_Im = out_results_16_Im; // @[FFTDesigns.scala 3474:12]
  assign io_out_17_Re = out_results_17_Re; // @[FFTDesigns.scala 3474:12]
  assign io_out_17_Im = out_results_17_Im; // @[FFTDesigns.scala 3474:12]
  assign FFT_sr_v2_nrv_clock = clock;
  assign FFT_sr_v2_nrv_reset = reset;
  assign FFT_sr_v2_nrv_io_in_0_Re = PermutationsBasic_io_out_0_Re; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_io_in_0_Im = PermutationsBasic_io_out_0_Im; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_io_in_1_Re = PermutationsBasic_io_out_1_Re; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_io_in_1_Im = PermutationsBasic_io_out_1_Im; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_io_in_2_Re = PermutationsBasic_io_out_2_Re; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_io_in_2_Im = PermutationsBasic_io_out_2_Im; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_io_in_3_Re = PermutationsBasic_io_out_3_Re; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_io_in_3_Im = PermutationsBasic_io_out_3_Im; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_io_in_4_Re = PermutationsBasic_io_out_4_Re; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_io_in_4_Im = PermutationsBasic_io_out_4_Im; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_io_in_5_Re = PermutationsBasic_io_out_5_Re; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_io_in_5_Im = PermutationsBasic_io_out_5_Im; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_io_in_6_Re = PermutationsBasic_io_out_6_Re; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_io_in_6_Im = PermutationsBasic_io_out_6_Im; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_io_in_7_Re = PermutationsBasic_io_out_7_Re; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_io_in_7_Im = PermutationsBasic_io_out_7_Im; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_io_in_8_Re = PermutationsBasic_io_out_8_Re; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_io_in_8_Im = PermutationsBasic_io_out_8_Im; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_1_clock = clock;
  assign FFT_sr_v2_nrv_1_reset = reset;
  assign FFT_sr_v2_nrv_1_io_in_0_Re = PermutationsBasic_io_out_9_Re; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_1_io_in_0_Im = PermutationsBasic_io_out_9_Im; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_1_io_in_1_Re = PermutationsBasic_io_out_10_Re; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_1_io_in_1_Im = PermutationsBasic_io_out_10_Im; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_1_io_in_2_Re = PermutationsBasic_io_out_11_Re; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_1_io_in_2_Im = PermutationsBasic_io_out_11_Im; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_1_io_in_3_Re = PermutationsBasic_io_out_12_Re; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_1_io_in_3_Im = PermutationsBasic_io_out_12_Im; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_1_io_in_4_Re = PermutationsBasic_io_out_13_Re; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_1_io_in_4_Im = PermutationsBasic_io_out_13_Im; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_1_io_in_5_Re = PermutationsBasic_io_out_14_Re; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_1_io_in_5_Im = PermutationsBasic_io_out_14_Im; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_1_io_in_6_Re = PermutationsBasic_io_out_15_Re; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_1_io_in_6_Im = PermutationsBasic_io_out_15_Im; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_1_io_in_7_Re = PermutationsBasic_io_out_16_Re; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_1_io_in_7_Im = PermutationsBasic_io_out_16_Im; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_1_io_in_8_Re = PermutationsBasic_io_out_17_Re; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_1_io_in_8_Im = PermutationsBasic_io_out_17_Im; // @[FFTDesigns.scala 3477:32]
  assign FFT_sr_v2_nrv_2_clock = clock;
  assign FFT_sr_v2_nrv_2_reset = reset;
  assign FFT_sr_v2_nrv_2_io_in_0_Re = TwiddleFactors_mr_io_out_0_Re; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_2_io_in_0_Im = TwiddleFactors_mr_io_out_0_Im; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_2_io_in_1_Re = TwiddleFactors_mr_io_out_1_Re; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_2_io_in_1_Im = TwiddleFactors_mr_io_out_1_Im; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_3_clock = clock;
  assign FFT_sr_v2_nrv_3_reset = reset;
  assign FFT_sr_v2_nrv_3_io_in_0_Re = TwiddleFactors_mr_io_out_2_Re; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_3_io_in_0_Im = TwiddleFactors_mr_io_out_2_Im; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_3_io_in_1_Re = TwiddleFactors_mr_io_out_3_Re; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_3_io_in_1_Im = TwiddleFactors_mr_io_out_3_Im; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_4_clock = clock;
  assign FFT_sr_v2_nrv_4_reset = reset;
  assign FFT_sr_v2_nrv_4_io_in_0_Re = TwiddleFactors_mr_io_out_4_Re; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_4_io_in_0_Im = TwiddleFactors_mr_io_out_4_Im; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_4_io_in_1_Re = TwiddleFactors_mr_io_out_5_Re; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_4_io_in_1_Im = TwiddleFactors_mr_io_out_5_Im; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_5_clock = clock;
  assign FFT_sr_v2_nrv_5_reset = reset;
  assign FFT_sr_v2_nrv_5_io_in_0_Re = TwiddleFactors_mr_io_out_6_Re; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_5_io_in_0_Im = TwiddleFactors_mr_io_out_6_Im; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_5_io_in_1_Re = TwiddleFactors_mr_io_out_7_Re; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_5_io_in_1_Im = TwiddleFactors_mr_io_out_7_Im; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_6_clock = clock;
  assign FFT_sr_v2_nrv_6_reset = reset;
  assign FFT_sr_v2_nrv_6_io_in_0_Re = TwiddleFactors_mr_io_out_8_Re; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_6_io_in_0_Im = TwiddleFactors_mr_io_out_8_Im; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_6_io_in_1_Re = TwiddleFactors_mr_io_out_9_Re; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_6_io_in_1_Im = TwiddleFactors_mr_io_out_9_Im; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_7_clock = clock;
  assign FFT_sr_v2_nrv_7_reset = reset;
  assign FFT_sr_v2_nrv_7_io_in_0_Re = TwiddleFactors_mr_io_out_10_Re; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_7_io_in_0_Im = TwiddleFactors_mr_io_out_10_Im; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_7_io_in_1_Re = TwiddleFactors_mr_io_out_11_Re; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_7_io_in_1_Im = TwiddleFactors_mr_io_out_11_Im; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_8_clock = clock;
  assign FFT_sr_v2_nrv_8_reset = reset;
  assign FFT_sr_v2_nrv_8_io_in_0_Re = TwiddleFactors_mr_io_out_12_Re; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_8_io_in_0_Im = TwiddleFactors_mr_io_out_12_Im; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_8_io_in_1_Re = TwiddleFactors_mr_io_out_13_Re; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_8_io_in_1_Im = TwiddleFactors_mr_io_out_13_Im; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_9_clock = clock;
  assign FFT_sr_v2_nrv_9_reset = reset;
  assign FFT_sr_v2_nrv_9_io_in_0_Re = TwiddleFactors_mr_io_out_14_Re; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_9_io_in_0_Im = TwiddleFactors_mr_io_out_14_Im; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_9_io_in_1_Re = TwiddleFactors_mr_io_out_15_Re; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_9_io_in_1_Im = TwiddleFactors_mr_io_out_15_Im; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_10_clock = clock;
  assign FFT_sr_v2_nrv_10_reset = reset;
  assign FFT_sr_v2_nrv_10_io_in_0_Re = TwiddleFactors_mr_io_out_16_Re; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_10_io_in_0_Im = TwiddleFactors_mr_io_out_16_Im; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_10_io_in_1_Re = TwiddleFactors_mr_io_out_17_Re; // @[FFTDesigns.scala 3479:32]
  assign FFT_sr_v2_nrv_10_io_in_1_Im = TwiddleFactors_mr_io_out_17_Im; // @[FFTDesigns.scala 3479:32]
  assign PermutationsBasic_io_in_0_Re = io_in_ready ? io_in_0_Re : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_0_Im = io_in_ready ? io_in_0_Im : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_1_Re = io_in_ready ? io_in_1_Re : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_1_Im = io_in_ready ? io_in_1_Im : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_2_Re = io_in_ready ? io_in_2_Re : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_2_Im = io_in_ready ? io_in_2_Im : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_3_Re = io_in_ready ? io_in_3_Re : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_3_Im = io_in_ready ? io_in_3_Im : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_4_Re = io_in_ready ? io_in_4_Re : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_4_Im = io_in_ready ? io_in_4_Im : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_5_Re = io_in_ready ? io_in_5_Re : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_5_Im = io_in_ready ? io_in_5_Im : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_6_Re = io_in_ready ? io_in_6_Re : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_6_Im = io_in_ready ? io_in_6_Im : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_7_Re = io_in_ready ? io_in_7_Re : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_7_Im = io_in_ready ? io_in_7_Im : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_8_Re = io_in_ready ? io_in_8_Re : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_8_Im = io_in_ready ? io_in_8_Im : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_9_Re = io_in_ready ? io_in_9_Re : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_9_Im = io_in_ready ? io_in_9_Im : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_10_Re = io_in_ready ? io_in_10_Re : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_10_Im = io_in_ready ? io_in_10_Im : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_11_Re = io_in_ready ? io_in_11_Re : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_11_Im = io_in_ready ? io_in_11_Im : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_12_Re = io_in_ready ? io_in_12_Re : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_12_Im = io_in_ready ? io_in_12_Im : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_13_Re = io_in_ready ? io_in_13_Re : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_13_Im = io_in_ready ? io_in_13_Im : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_14_Re = io_in_ready ? io_in_14_Re : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_14_Im = io_in_ready ? io_in_14_Im : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_15_Re = io_in_ready ? io_in_15_Re : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_15_Im = io_in_ready ? io_in_15_Im : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_16_Re = io_in_ready ? io_in_16_Re : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_16_Im = io_in_ready ? io_in_16_Im : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_17_Re = io_in_ready ? io_in_17_Re : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_io_in_17_Im = io_in_ready ? io_in_17_Im : 32'h0; // @[FFTDesigns.scala 3455:22 3456:33 3459:38]
  assign PermutationsBasic_1_io_in_0_Re = FFT_sr_v2_nrv_io_out_0_Re; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_0_Im = FFT_sr_v2_nrv_io_out_0_Im; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_1_Re = FFT_sr_v2_nrv_io_out_1_Re; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_1_Im = FFT_sr_v2_nrv_io_out_1_Im; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_2_Re = FFT_sr_v2_nrv_io_out_2_Re; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_2_Im = FFT_sr_v2_nrv_io_out_2_Im; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_3_Re = FFT_sr_v2_nrv_io_out_3_Re; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_3_Im = FFT_sr_v2_nrv_io_out_3_Im; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_4_Re = FFT_sr_v2_nrv_io_out_4_Re; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_4_Im = FFT_sr_v2_nrv_io_out_4_Im; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_5_Re = FFT_sr_v2_nrv_io_out_5_Re; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_5_Im = FFT_sr_v2_nrv_io_out_5_Im; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_6_Re = FFT_sr_v2_nrv_io_out_6_Re; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_6_Im = FFT_sr_v2_nrv_io_out_6_Im; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_7_Re = FFT_sr_v2_nrv_io_out_7_Re; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_7_Im = FFT_sr_v2_nrv_io_out_7_Im; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_8_Re = FFT_sr_v2_nrv_io_out_8_Re; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_8_Im = FFT_sr_v2_nrv_io_out_8_Im; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_9_Re = FFT_sr_v2_nrv_1_io_out_0_Re; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_9_Im = FFT_sr_v2_nrv_1_io_out_0_Im; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_10_Re = FFT_sr_v2_nrv_1_io_out_1_Re; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_10_Im = FFT_sr_v2_nrv_1_io_out_1_Im; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_11_Re = FFT_sr_v2_nrv_1_io_out_2_Re; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_11_Im = FFT_sr_v2_nrv_1_io_out_2_Im; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_12_Re = FFT_sr_v2_nrv_1_io_out_3_Re; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_12_Im = FFT_sr_v2_nrv_1_io_out_3_Im; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_13_Re = FFT_sr_v2_nrv_1_io_out_4_Re; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_13_Im = FFT_sr_v2_nrv_1_io_out_4_Im; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_14_Re = FFT_sr_v2_nrv_1_io_out_5_Re; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_14_Im = FFT_sr_v2_nrv_1_io_out_5_Im; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_15_Re = FFT_sr_v2_nrv_1_io_out_6_Re; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_15_Im = FFT_sr_v2_nrv_1_io_out_6_Im; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_16_Re = FFT_sr_v2_nrv_1_io_out_7_Re; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_16_Im = FFT_sr_v2_nrv_1_io_out_7_Im; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_17_Re = FFT_sr_v2_nrv_1_io_out_8_Re; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_1_io_in_17_Im = FFT_sr_v2_nrv_1_io_out_8_Im; // @[FFTDesigns.scala 3478:45]
  assign PermutationsBasic_2_io_in_0_Re = FFT_sr_v2_nrv_2_io_out_0_Re; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_0_Im = FFT_sr_v2_nrv_2_io_out_0_Im; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_1_Re = FFT_sr_v2_nrv_2_io_out_1_Re; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_1_Im = FFT_sr_v2_nrv_2_io_out_1_Im; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_2_Re = FFT_sr_v2_nrv_3_io_out_0_Re; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_2_Im = FFT_sr_v2_nrv_3_io_out_0_Im; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_3_Re = FFT_sr_v2_nrv_3_io_out_1_Re; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_3_Im = FFT_sr_v2_nrv_3_io_out_1_Im; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_4_Re = FFT_sr_v2_nrv_4_io_out_0_Re; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_4_Im = FFT_sr_v2_nrv_4_io_out_0_Im; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_5_Re = FFT_sr_v2_nrv_4_io_out_1_Re; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_5_Im = FFT_sr_v2_nrv_4_io_out_1_Im; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_6_Re = FFT_sr_v2_nrv_5_io_out_0_Re; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_6_Im = FFT_sr_v2_nrv_5_io_out_0_Im; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_7_Re = FFT_sr_v2_nrv_5_io_out_1_Re; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_7_Im = FFT_sr_v2_nrv_5_io_out_1_Im; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_8_Re = FFT_sr_v2_nrv_6_io_out_0_Re; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_8_Im = FFT_sr_v2_nrv_6_io_out_0_Im; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_9_Re = FFT_sr_v2_nrv_6_io_out_1_Re; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_9_Im = FFT_sr_v2_nrv_6_io_out_1_Im; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_10_Re = FFT_sr_v2_nrv_7_io_out_0_Re; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_10_Im = FFT_sr_v2_nrv_7_io_out_0_Im; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_11_Re = FFT_sr_v2_nrv_7_io_out_1_Re; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_11_Im = FFT_sr_v2_nrv_7_io_out_1_Im; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_12_Re = FFT_sr_v2_nrv_8_io_out_0_Re; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_12_Im = FFT_sr_v2_nrv_8_io_out_0_Im; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_13_Re = FFT_sr_v2_nrv_8_io_out_1_Re; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_13_Im = FFT_sr_v2_nrv_8_io_out_1_Im; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_14_Re = FFT_sr_v2_nrv_9_io_out_0_Re; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_14_Im = FFT_sr_v2_nrv_9_io_out_0_Im; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_15_Re = FFT_sr_v2_nrv_9_io_out_1_Re; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_15_Im = FFT_sr_v2_nrv_9_io_out_1_Im; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_16_Re = FFT_sr_v2_nrv_10_io_out_0_Re; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_16_Im = FFT_sr_v2_nrv_10_io_out_0_Im; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_17_Re = FFT_sr_v2_nrv_10_io_out_1_Re; // @[FFTDesigns.scala 3480:45]
  assign PermutationsBasic_2_io_in_17_Im = FFT_sr_v2_nrv_10_io_out_1_Im; // @[FFTDesigns.scala 3480:45]
  assign TwiddleFactors_mr_clock = clock;
  assign TwiddleFactors_mr_reset = reset;
  assign TwiddleFactors_mr_io_in_0_Re = PermutationsBasic_1_io_out_0_Re; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_0_Im = PermutationsBasic_1_io_out_0_Im; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_1_Re = PermutationsBasic_1_io_out_1_Re; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_1_Im = PermutationsBasic_1_io_out_1_Im; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_2_Re = PermutationsBasic_1_io_out_2_Re; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_2_Im = PermutationsBasic_1_io_out_2_Im; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_3_Re = PermutationsBasic_1_io_out_3_Re; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_3_Im = PermutationsBasic_1_io_out_3_Im; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_4_Re = PermutationsBasic_1_io_out_4_Re; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_4_Im = PermutationsBasic_1_io_out_4_Im; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_5_Re = PermutationsBasic_1_io_out_5_Re; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_5_Im = PermutationsBasic_1_io_out_5_Im; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_6_Re = PermutationsBasic_1_io_out_6_Re; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_6_Im = PermutationsBasic_1_io_out_6_Im; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_7_Re = PermutationsBasic_1_io_out_7_Re; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_7_Im = PermutationsBasic_1_io_out_7_Im; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_8_Re = PermutationsBasic_1_io_out_8_Re; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_8_Im = PermutationsBasic_1_io_out_8_Im; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_9_Re = PermutationsBasic_1_io_out_9_Re; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_9_Im = PermutationsBasic_1_io_out_9_Im; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_10_Re = PermutationsBasic_1_io_out_10_Re; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_10_Im = PermutationsBasic_1_io_out_10_Im; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_11_Re = PermutationsBasic_1_io_out_11_Re; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_11_Im = PermutationsBasic_1_io_out_11_Im; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_12_Re = PermutationsBasic_1_io_out_12_Re; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_12_Im = PermutationsBasic_1_io_out_12_Im; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_13_Re = PermutationsBasic_1_io_out_13_Re; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_13_Im = PermutationsBasic_1_io_out_13_Im; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_14_Re = PermutationsBasic_1_io_out_14_Re; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_14_Im = PermutationsBasic_1_io_out_14_Im; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_15_Re = PermutationsBasic_1_io_out_15_Re; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_15_Im = PermutationsBasic_1_io_out_15_Im; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_16_Re = PermutationsBasic_1_io_out_16_Re; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_16_Im = PermutationsBasic_1_io_out_16_Im; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_17_Re = PermutationsBasic_1_io_out_17_Re; // @[FFTDesigns.scala 3462:20]
  assign TwiddleFactors_mr_io_in_17_Im = PermutationsBasic_1_io_out_17_Im; // @[FFTDesigns.scala 3462:20]
  always @(posedge clock) begin
    if (reset) begin // @[FFTDesigns.scala 3427:28]
      regdelays_0 <= 1'h0; // @[FFTDesigns.scala 3427:28]
    end else begin
      regdelays_0 <= io_in_ready; // @[FFTDesigns.scala 3430:22]
    end
    if (reset) begin // @[FFTDesigns.scala 3427:28]
      regdelays_1 <= 1'h0; // @[FFTDesigns.scala 3427:28]
    end else begin
      regdelays_1 <= regdelays_0; // @[FFTDesigns.scala 3432:22]
    end
    if (reset) begin // @[FFTDesigns.scala 3427:28]
      regdelays_2 <= 1'h0; // @[FFTDesigns.scala 3427:28]
    end else begin
      regdelays_2 <= regdelays_1; // @[FFTDesigns.scala 3432:22]
    end
    if (reset) begin // @[FFTDesigns.scala 3427:28]
      regdelays_3 <= 1'h0; // @[FFTDesigns.scala 3427:28]
    end else begin
      regdelays_3 <= regdelays_2; // @[FFTDesigns.scala 3432:22]
    end
    if (reset) begin // @[FFTDesigns.scala 3427:28]
      regdelays_4 <= 1'h0; // @[FFTDesigns.scala 3427:28]
    end else begin
      regdelays_4 <= regdelays_3; // @[FFTDesigns.scala 3432:22]
    end
    if (reset) begin // @[FFTDesigns.scala 3427:28]
      regdelays_5 <= 1'h0; // @[FFTDesigns.scala 3427:28]
    end else begin
      regdelays_5 <= regdelays_4; // @[FFTDesigns.scala 3432:22]
    end
    if (reset) begin // @[FFTDesigns.scala 3427:28]
      regdelays_6 <= 1'h0; // @[FFTDesigns.scala 3427:28]
    end else begin
      regdelays_6 <= regdelays_5; // @[FFTDesigns.scala 3432:22]
    end
    if (reset) begin // @[FFTDesigns.scala 3427:28]
      regdelays_7 <= 1'h0; // @[FFTDesigns.scala 3427:28]
    end else begin
      regdelays_7 <= regdelays_6; // @[FFTDesigns.scala 3432:22]
    end
    if (reset) begin // @[FFTDesigns.scala 3427:28]
      regdelays_8 <= 1'h0; // @[FFTDesigns.scala 3427:28]
    end else begin
      regdelays_8 <= regdelays_7; // @[FFTDesigns.scala 3432:22]
    end
    if (reset) begin // @[FFTDesigns.scala 3427:28]
      regdelays_9 <= 1'h0; // @[FFTDesigns.scala 3427:28]
    end else begin
      regdelays_9 <= regdelays_8; // @[FFTDesigns.scala 3432:22]
    end
    if (reset) begin // @[FFTDesigns.scala 3427:28]
      regdelays_10 <= 1'h0; // @[FFTDesigns.scala 3427:28]
    end else begin
      regdelays_10 <= regdelays_9; // @[FFTDesigns.scala 3432:22]
    end
    if (reset) begin // @[FFTDesigns.scala 3427:28]
      regdelays_11 <= 1'h0; // @[FFTDesigns.scala 3427:28]
    end else begin
      regdelays_11 <= regdelays_10; // @[FFTDesigns.scala 3432:22]
    end
    if (reset) begin // @[FFTDesigns.scala 3427:28]
      regdelays_12 <= 1'h0; // @[FFTDesigns.scala 3427:28]
    end else begin
      regdelays_12 <= regdelays_11; // @[FFTDesigns.scala 3432:22]
    end
    if (reset) begin // @[FFTDesigns.scala 3435:31]
      out_regdelay <= 1'h0; // @[FFTDesigns.scala 3435:31]
    end else begin
      out_regdelay <= regdelays_12;
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_0_Re <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_0_Re <= PermutationsBasic_2_io_out_0_Re; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_0_Re <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_0_Im <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_0_Im <= PermutationsBasic_2_io_out_0_Im; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_0_Im <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_1_Re <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_1_Re <= PermutationsBasic_2_io_out_1_Re; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_1_Re <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_1_Im <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_1_Im <= PermutationsBasic_2_io_out_1_Im; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_1_Im <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_2_Re <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_2_Re <= PermutationsBasic_2_io_out_2_Re; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_2_Re <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_2_Im <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_2_Im <= PermutationsBasic_2_io_out_2_Im; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_2_Im <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_3_Re <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_3_Re <= PermutationsBasic_2_io_out_3_Re; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_3_Re <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_3_Im <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_3_Im <= PermutationsBasic_2_io_out_3_Im; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_3_Im <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_4_Re <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_4_Re <= PermutationsBasic_2_io_out_4_Re; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_4_Re <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_4_Im <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_4_Im <= PermutationsBasic_2_io_out_4_Im; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_4_Im <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_5_Re <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_5_Re <= PermutationsBasic_2_io_out_5_Re; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_5_Re <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_5_Im <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_5_Im <= PermutationsBasic_2_io_out_5_Im; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_5_Im <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_6_Re <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_6_Re <= PermutationsBasic_2_io_out_6_Re; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_6_Re <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_6_Im <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_6_Im <= PermutationsBasic_2_io_out_6_Im; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_6_Im <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_7_Re <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_7_Re <= PermutationsBasic_2_io_out_7_Re; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_7_Re <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_7_Im <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_7_Im <= PermutationsBasic_2_io_out_7_Im; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_7_Im <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_8_Re <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_8_Re <= PermutationsBasic_2_io_out_8_Re; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_8_Re <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_8_Im <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_8_Im <= PermutationsBasic_2_io_out_8_Im; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_8_Im <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_9_Re <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_9_Re <= PermutationsBasic_2_io_out_9_Re; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_9_Re <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_9_Im <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_9_Im <= PermutationsBasic_2_io_out_9_Im; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_9_Im <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_10_Re <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_10_Re <= PermutationsBasic_2_io_out_10_Re; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_10_Re <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_10_Im <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_10_Im <= PermutationsBasic_2_io_out_10_Im; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_10_Im <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_11_Re <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_11_Re <= PermutationsBasic_2_io_out_11_Re; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_11_Re <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_11_Im <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_11_Im <= PermutationsBasic_2_io_out_11_Im; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_11_Im <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_12_Re <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_12_Re <= PermutationsBasic_2_io_out_12_Re; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_12_Re <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_12_Im <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_12_Im <= PermutationsBasic_2_io_out_12_Im; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_12_Im <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_13_Re <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_13_Re <= PermutationsBasic_2_io_out_13_Re; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_13_Re <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_13_Im <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_13_Im <= PermutationsBasic_2_io_out_13_Im; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_13_Im <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_14_Re <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_14_Re <= PermutationsBasic_2_io_out_14_Re; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_14_Re <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_14_Im <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_14_Im <= PermutationsBasic_2_io_out_14_Im; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_14_Im <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_15_Re <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_15_Re <= PermutationsBasic_2_io_out_15_Re; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_15_Re <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_15_Im <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_15_Im <= PermutationsBasic_2_io_out_15_Im; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_15_Im <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_16_Re <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_16_Re <= PermutationsBasic_2_io_out_16_Re; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_16_Re <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_16_Im <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_16_Im <= PermutationsBasic_2_io_out_16_Im; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_16_Im <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_17_Re <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_17_Re <= PermutationsBasic_2_io_out_17_Re; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_17_Re <= 32'h0; // @[FFTDesigns.scala 3469:24]
    end
    if (reset) begin // @[FFTDesigns.scala 3463:30]
      out_results_17_Im <= 32'h0; // @[FFTDesigns.scala 3463:30]
    end else if (regdelays_12) begin // @[FFTDesigns.scala 3464:37]
      out_results_17_Im <= PermutationsBasic_2_io_out_17_Im; // @[FFTDesigns.scala 3465:19]
    end else begin
      out_results_17_Im <= 32'h0; // @[FFTDesigns.scala 3469:24]
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
  regdelays_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  regdelays_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  regdelays_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  regdelays_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  regdelays_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  regdelays_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  regdelays_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  regdelays_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  regdelays_8 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  regdelays_9 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  regdelays_10 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  regdelays_11 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  regdelays_12 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  out_regdelay = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  out_results_0_Re = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  out_results_0_Im = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  out_results_1_Re = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  out_results_1_Im = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  out_results_2_Re = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  out_results_2_Im = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  out_results_3_Re = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  out_results_3_Im = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  out_results_4_Re = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  out_results_4_Im = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  out_results_5_Re = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  out_results_5_Im = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  out_results_6_Re = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  out_results_6_Im = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  out_results_7_Re = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  out_results_7_Im = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  out_results_8_Re = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  out_results_8_Im = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  out_results_9_Re = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  out_results_9_Im = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  out_results_10_Re = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  out_results_10_Im = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  out_results_11_Re = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  out_results_11_Im = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  out_results_12_Re = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  out_results_12_Im = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  out_results_13_Re = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  out_results_13_Im = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  out_results_14_Re = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  out_results_14_Im = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  out_results_15_Re = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  out_results_15_Im = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  out_results_16_Re = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  out_results_16_Im = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  out_results_17_Re = _RAND_48[31:0];
  _RAND_49 = {1{`RANDOM}};
  out_results_17_Im = _RAND_49[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

