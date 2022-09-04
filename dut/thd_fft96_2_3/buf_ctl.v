//*********************************************************************************************//
//----------------    Buffer Controller  ----------------------------------------------------////
//---------------- Author: Xiaokun Yang  ----------------------------------------------------////
//---------------- Lawrence Berkeley Lab ----------------------------------------------------////
//---------------- Date: 7/25/2022 ----------------------------------------------------------//// 
//----- Version 1: Buffer Constrol Module ---------------------------------------------------////
//----- Date: 7/28/2022 ---------------------------------------------------------------------////
//----- Version 2:                                                   ------------------------////
//----- Date:           ---------------------------------------------------------------------////
//*********************************************************************************************//
//*********************************************************************************************//
module buf_ctl (input         clock            ,
                input         reset            ,
                input         mem_wr           ,
                input         mem_rd           ,
                input  [6:0]  row_no           ,
                input  [6:0]  col_no           ,
                input  [6:0]  dep_no           ,
                input  [63:0] mem_wrdata0      ,
                input  [63:0] mem_wrdata1      ,
                output [63:0] mem_rddata0      ,
                output [63:0] mem_rddata1      );

parameter CUBIC_D=96;

reg [63:0] mem[0:CUBIC_D*CUBIC_D*CUBIC_D-1];

wire [19:0] mem_wraddr0 = mem_wr ? (2*row_no+0)*96*96+dep_no*96+col_no : 20'd0; 
wire [19:0] mem_wraddr1 = mem_wr ? (2*row_no+1)*96*96+dep_no*96+col_no : 20'd0;

integer i;
always @(posedge clock) begin 
  if(reset) begin
    for(i=0; i<CUBIC_D*CUBIC_D*CUBIC_D; i=i+1) begin
      mem[i]<=64'h0;
    end
  end else if(mem_wr) begin 
      //mem[row_no*96*96+dep_no*96+col_no  ]  = mem_wrdata0   ; 
      //mem[row_no*96*96+dep_no*96+col_no+1]  = mem_wrdata1   ;
      mem[mem_wraddr0]  = mem_wrdata0   ; 
      mem[mem_wraddr1]  = mem_wrdata1   ;
  end
end

wire [19:0] mem_rdaddr0  = mem_rd ? dep_no*96*96+col_no*96+(2*row_no+0) : 20'd0;
wire [19:0] mem_rdaddr1  = mem_rd ? dep_no*96*96+col_no*96+(2*row_no+1) : 20'd0;
assign mem_rddata0  = mem_rd ? mem[mem_rdaddr0]  : 64'h0;
assign mem_rddata1  = mem_rd ? mem[mem_rdaddr1]  : 64'h0;

endmodule
