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
                input  [63:0] mem_wrdata2      ,
                input  [63:0] mem_wrdata3      ,
                input  [63:0] mem_wrdata4      ,
                input  [63:0] mem_wrdata5      ,
                input  [63:0] mem_wrdata6      ,
                input  [63:0] mem_wrdata7      ,
                input  [63:0] mem_wrdata8      ,
                input  [63:0] mem_wrdata9      ,
                input  [63:0] mem_wrdata10     ,
                input  [63:0] mem_wrdata11     ,
                input  [63:0] mem_wrdata12     ,
                input  [63:0] mem_wrdata13     ,
                input  [63:0] mem_wrdata14     ,
                input  [63:0] mem_wrdata15     ,
                input  [63:0] mem_wrdata16     ,
                input  [63:0] mem_wrdata17     ,
                input  [63:0] mem_wrdata18     ,
                input  [63:0] mem_wrdata19     ,
                input  [63:0] mem_wrdata20     ,
                input  [63:0] mem_wrdata21     ,
                input  [63:0] mem_wrdata22     ,
                input  [63:0] mem_wrdata23     ,
                input  [63:0] mem_wrdata24     ,
                input  [63:0] mem_wrdata25     ,
                input  [63:0] mem_wrdata26     ,
                input  [63:0] mem_wrdata27     ,
                input  [63:0] mem_wrdata28     ,
                input  [63:0] mem_wrdata29     ,
                input  [63:0] mem_wrdata30     ,
                input  [63:0] mem_wrdata31     ,
                output [63:0] mem_rddata0      ,
                output [63:0] mem_rddata1      ,
                output [63:0] mem_rddata2      ,
                output [63:0] mem_rddata3      ,
                output [63:0] mem_rddata4      ,
                output [63:0] mem_rddata5      ,
                output [63:0] mem_rddata6      ,
                output [63:0] mem_rddata7      ,
                output [63:0] mem_rddata8      ,
                output [63:0] mem_rddata9      ,
                output [63:0] mem_rddata10     ,
                output [63:0] mem_rddata11     ,
                output [63:0] mem_rddata12     ,
                output [63:0] mem_rddata13     ,
                output [63:0] mem_rddata14     ,
                output [63:0] mem_rddata15     ,
                output [63:0] mem_rddata16     ,
                output [63:0] mem_rddata17     ,
                output [63:0] mem_rddata18     ,
                output [63:0] mem_rddata19     ,
                output [63:0] mem_rddata20     ,
                output [63:0] mem_rddata21     ,
                output [63:0] mem_rddata22     ,
                output [63:0] mem_rddata23     ,
                output [63:0] mem_rddata24     ,
                output [63:0] mem_rddata25     ,
                output [63:0] mem_rddata26     ,
                output [63:0] mem_rddata27     ,
                output [63:0] mem_rddata28     ,
                output [63:0] mem_rddata29     ,
                output [63:0] mem_rddata30     ,
                output [63:0] mem_rddata31     );

parameter CUBIC_D=96;

reg [63:0] mem[0:CUBIC_D*CUBIC_D*CUBIC_D-1];

wire [19:0] mem_wraddr0  = mem_wr ? (32*row_no+0)*96*96+dep_no*96+col_no : 20'd0; 
wire [19:0] mem_wraddr1  = mem_wr ? (32*row_no+1)*96*96+dep_no*96+col_no : 20'd0;
wire [19:0] mem_wraddr2  = mem_wr ? (32*row_no+2)*96*96+dep_no*96+col_no : 20'd0; 
wire [19:0] mem_wraddr3  = mem_wr ? (32*row_no+3)*96*96+dep_no*96+col_no : 20'd0;
wire [19:0] mem_wraddr4  = mem_wr ? (32*row_no+4)*96*96+dep_no*96+col_no : 20'd0; 
wire [19:0] mem_wraddr5  = mem_wr ? (32*row_no+5)*96*96+dep_no*96+col_no : 20'd0;
wire [19:0] mem_wraddr6  = mem_wr ? (32*row_no+6)*96*96+dep_no*96+col_no : 20'd0; 
wire [19:0] mem_wraddr7  = mem_wr ? (32*row_no+7)*96*96+dep_no*96+col_no : 20'd0;
wire [19:0] mem_wraddr8  = mem_wr ? (32*row_no+8)*96*96+dep_no*96+col_no : 20'd0; 
wire [19:0] mem_wraddr9  = mem_wr ? (32*row_no+9)*96*96+dep_no*96+col_no : 20'd0;
wire [19:0] mem_wraddr10 = mem_wr ? (32*row_no+10)*96*96+dep_no*96+col_no : 20'd0; 
wire [19:0] mem_wraddr11 = mem_wr ? (32*row_no+11)*96*96+dep_no*96+col_no : 20'd0;
wire [19:0] mem_wraddr12 = mem_wr ? (32*row_no+12)*96*96+dep_no*96+col_no : 20'd0; 
wire [19:0] mem_wraddr13 = mem_wr ? (32*row_no+13)*96*96+dep_no*96+col_no : 20'd0;
wire [19:0] mem_wraddr14 = mem_wr ? (32*row_no+14)*96*96+dep_no*96+col_no : 20'd0; 
wire [19:0] mem_wraddr15 = mem_wr ? (32*row_no+15)*96*96+dep_no*96+col_no : 20'd0;
wire [19:0] mem_wraddr16 = mem_wr ? (32*row_no+16)*96*96+dep_no*96+col_no : 20'd0; 
wire [19:0] mem_wraddr17 = mem_wr ? (32*row_no+17)*96*96+dep_no*96+col_no : 20'd0;
wire [19:0] mem_wraddr18 = mem_wr ? (32*row_no+18)*96*96+dep_no*96+col_no : 20'd0; 
wire [19:0] mem_wraddr19 = mem_wr ? (32*row_no+19)*96*96+dep_no*96+col_no : 20'd0;
wire [19:0] mem_wraddr20 = mem_wr ? (32*row_no+20)*96*96+dep_no*96+col_no : 20'd0; 
wire [19:0] mem_wraddr21 = mem_wr ? (32*row_no+21)*96*96+dep_no*96+col_no : 20'd0;
wire [19:0] mem_wraddr22 = mem_wr ? (32*row_no+22)*96*96+dep_no*96+col_no : 20'd0; 
wire [19:0] mem_wraddr23 = mem_wr ? (32*row_no+23)*96*96+dep_no*96+col_no : 20'd0;
wire [19:0] mem_wraddr24 = mem_wr ? (32*row_no+24)*96*96+dep_no*96+col_no : 20'd0; 
wire [19:0] mem_wraddr25 = mem_wr ? (32*row_no+25)*96*96+dep_no*96+col_no : 20'd0;
wire [19:0] mem_wraddr26 = mem_wr ? (32*row_no+26)*96*96+dep_no*96+col_no : 20'd0; 
wire [19:0] mem_wraddr27 = mem_wr ? (32*row_no+27)*96*96+dep_no*96+col_no : 20'd0;
wire [19:0] mem_wraddr28 = mem_wr ? (32*row_no+28)*96*96+dep_no*96+col_no : 20'd0; 
wire [19:0] mem_wraddr29 = mem_wr ? (32*row_no+29)*96*96+dep_no*96+col_no : 20'd0;
wire [19:0] mem_wraddr30 = mem_wr ? (32*row_no+30)*96*96+dep_no*96+col_no : 20'd0; 
wire [19:0] mem_wraddr31 = mem_wr ? (32*row_no+31)*96*96+dep_no*96+col_no : 20'd0;

integer i;
always @(posedge clock) begin 
  if(reset) begin
    for(i=0; i<CUBIC_D*CUBIC_D*CUBIC_D; i=i+1) begin
      mem[i]<=64'h0;
    end
  end else if(mem_wr) begin 
      mem[mem_wraddr0]   = mem_wrdata0   ; 
      mem[mem_wraddr1]   = mem_wrdata1   ;
      mem[mem_wraddr2]   = mem_wrdata2   ; 
      mem[mem_wraddr3]   = mem_wrdata3   ;
      mem[mem_wraddr4]   = mem_wrdata4   ;
      mem[mem_wraddr5]   = mem_wrdata5   ; 
      mem[mem_wraddr6]   = mem_wrdata6   ;
      mem[mem_wraddr7]   = mem_wrdata7   ; 
      mem[mem_wraddr8]   = mem_wrdata8   ;
      mem[mem_wraddr9]   = mem_wrdata9   ;
      mem[mem_wraddr10]  = mem_wrdata10   ; 
      mem[mem_wraddr11]  = mem_wrdata11   ;
      mem[mem_wraddr12]  = mem_wrdata12   ; 
      mem[mem_wraddr13]  = mem_wrdata13   ;
      mem[mem_wraddr14]  = mem_wrdata14   ;
      mem[mem_wraddr15]  = mem_wrdata15   ; 
      mem[mem_wraddr16]  = mem_wrdata16   ;
      mem[mem_wraddr17]  = mem_wrdata17   ; 
      mem[mem_wraddr18]  = mem_wrdata18   ;
      mem[mem_wraddr19]  = mem_wrdata19   ;
      mem[mem_wraddr20]  = mem_wrdata20   ; 
      mem[mem_wraddr21]  = mem_wrdata21   ;
      mem[mem_wraddr22]  = mem_wrdata22   ; 
      mem[mem_wraddr23]  = mem_wrdata23   ;
      mem[mem_wraddr24]  = mem_wrdata24   ;
      mem[mem_wraddr25]  = mem_wrdata25   ; 
      mem[mem_wraddr26]  = mem_wrdata26   ;
      mem[mem_wraddr27]  = mem_wrdata27   ; 
      mem[mem_wraddr28]  = mem_wrdata28   ;
      mem[mem_wraddr29]  = mem_wrdata29   ;
      mem[mem_wraddr30]  = mem_wrdata30   ; 
      mem[mem_wraddr31]  = mem_wrdata31   ;
  end
end

wire [19:0] mem_rdaddr0  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+0) : 20'd0;
wire [19:0] mem_rdaddr1  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+1) : 20'd0;
wire [19:0] mem_rdaddr2  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+2) : 20'd0;
wire [19:0] mem_rdaddr3  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+3) : 20'd0;
wire [19:0] mem_rdaddr4  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+4) : 20'd0;
wire [19:0] mem_rdaddr5  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+5) : 20'd0;
wire [19:0] mem_rdaddr6  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+6) : 20'd0;
wire [19:0] mem_rdaddr7  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+7) : 20'd0;
wire [19:0] mem_rdaddr8  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+8) : 20'd0;
wire [19:0] mem_rdaddr9  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+9) : 20'd0;
wire [19:0] mem_rdaddr10  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+10) : 20'd0;
wire [19:0] mem_rdaddr11  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+11) : 20'd0;
wire [19:0] mem_rdaddr12  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+12) : 20'd0;
wire [19:0] mem_rdaddr13  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+13) : 20'd0;
wire [19:0] mem_rdaddr14  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+14) : 20'd0;
wire [19:0] mem_rdaddr15  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+15) : 20'd0;
wire [19:0] mem_rdaddr16  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+16) : 20'd0;
wire [19:0] mem_rdaddr17  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+17) : 20'd0;
wire [19:0] mem_rdaddr18  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+18) : 20'd0;
wire [19:0] mem_rdaddr19  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+19) : 20'd0;
wire [19:0] mem_rdaddr20  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+20) : 20'd0;
wire [19:0] mem_rdaddr21  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+21) : 20'd0;
wire [19:0] mem_rdaddr22  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+22) : 20'd0;
wire [19:0] mem_rdaddr23  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+23) : 20'd0;
wire [19:0] mem_rdaddr24  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+24) : 20'd0;
wire [19:0] mem_rdaddr25  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+25) : 20'd0;
wire [19:0] mem_rdaddr26  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+26) : 20'd0;
wire [19:0] mem_rdaddr27  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+27) : 20'd0;
wire [19:0] mem_rdaddr28  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+28) : 20'd0;
wire [19:0] mem_rdaddr29  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+29) : 20'd0;
wire [19:0] mem_rdaddr30  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+30) : 20'd0;
wire [19:0] mem_rdaddr31  = mem_rd ? dep_no*96*96+col_no*96+(32*row_no+31) : 20'd0;
assign mem_rddata0   = mem_rd ? mem[mem_rdaddr0]   : 64'h0;
assign mem_rddata1   = mem_rd ? mem[mem_rdaddr1]   : 64'h0;
assign mem_rddata2   = mem_rd ? mem[mem_rdaddr2]   : 64'h0;
assign mem_rddata3   = mem_rd ? mem[mem_rdaddr3]   : 64'h0;
assign mem_rddata4   = mem_rd ? mem[mem_rdaddr4]   : 64'h0;
assign mem_rddata5   = mem_rd ? mem[mem_rdaddr5]   : 64'h0;
assign mem_rddata6   = mem_rd ? mem[mem_rdaddr6]   : 64'h0;
assign mem_rddata7   = mem_rd ? mem[mem_rdaddr7]   : 64'h0;
assign mem_rddata8   = mem_rd ? mem[mem_rdaddr8]   : 64'h0;
assign mem_rddata9   = mem_rd ? mem[mem_rdaddr9]   : 64'h0;
assign mem_rddata10  = mem_rd ? mem[mem_rdaddr10]  : 64'h0;
assign mem_rddata11  = mem_rd ? mem[mem_rdaddr11]  : 64'h0;
assign mem_rddata12  = mem_rd ? mem[mem_rdaddr12]  : 64'h0;
assign mem_rddata13  = mem_rd ? mem[mem_rdaddr13]  : 64'h0;
assign mem_rddata14  = mem_rd ? mem[mem_rdaddr14]  : 64'h0;
assign mem_rddata15  = mem_rd ? mem[mem_rdaddr15]  : 64'h0;
assign mem_rddata16  = mem_rd ? mem[mem_rdaddr16]  : 64'h0;
assign mem_rddata17  = mem_rd ? mem[mem_rdaddr17]  : 64'h0;
assign mem_rddata18  = mem_rd ? mem[mem_rdaddr18]  : 64'h0;
assign mem_rddata19  = mem_rd ? mem[mem_rdaddr19]  : 64'h0;
assign mem_rddata20  = mem_rd ? mem[mem_rdaddr20]  : 64'h0;
assign mem_rddata21  = mem_rd ? mem[mem_rdaddr21]  : 64'h0;
assign mem_rddata22  = mem_rd ? mem[mem_rdaddr22]  : 64'h0;
assign mem_rddata23  = mem_rd ? mem[mem_rdaddr23]  : 64'h0;
assign mem_rddata24  = mem_rd ? mem[mem_rdaddr24]  : 64'h0;
assign mem_rddata25  = mem_rd ? mem[mem_rdaddr25]  : 64'h0;
assign mem_rddata26  = mem_rd ? mem[mem_rdaddr26]  : 64'h0;
assign mem_rddata27  = mem_rd ? mem[mem_rdaddr27]  : 64'h0;
assign mem_rddata28  = mem_rd ? mem[mem_rdaddr28]  : 64'h0;
assign mem_rddata29  = mem_rd ? mem[mem_rdaddr29]  : 64'h0;
assign mem_rddata30  = mem_rd ? mem[mem_rdaddr30]  : 64'h0;
assign mem_rddata31  = mem_rd ? mem[mem_rdaddr31]  : 64'h0;

endmodule
