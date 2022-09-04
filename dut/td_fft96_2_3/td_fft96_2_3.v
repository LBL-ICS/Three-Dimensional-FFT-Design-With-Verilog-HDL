//*********************************************************************************************//
//----------------    2D-FFT DUT   ----------------------------------------------------------////
//---------------- Author: Xiaokun Yang  ----------------------------------------------------////
//---------------- Lawrence Berkeley Lab ----------------------------------------------------////
//---------------- Date: 7/25/2022 ----------------------------------------------------------//// 
//----- Version 1: 2D FFT96 For Non-Streming Input ------------------------------------------////
//----- Date: 7/27/2022 ---------------------------------------------------------------------////
//----- Version 2:                                                   ------------------------////
//----- Date:           ---------------------------------------------------------------------////
//*********************************************************************************************//
//----- This design-under-test provides functions for Fourier Transform over two dimensions    //
//---------------------------------------------------------------------------------------------//
//----- TD_FFT96                                                                               //
//----- The dut is non-streaming FFT96 based on the 1D FFT96 instances                         //
//----- Latency: 324 clock cycles                                                              //
//----- Hardware cost: 1,526 FP Adders, 356 FP Multipliers, 36,864-Word Memory                 //
//---------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------//
//*********************************************************************************************//
module td_fft96_2_3 (input         clock            ,
                     input         reset            ,
                     input  [31:0] io_in_0_Re       ,
                     input  [31:0] io_in_0_Im       ,
                     input  [31:0] io_in_1_Re       ,
                     input  [31:0] io_in_1_Im       ,
                     input         io_in_ready      ,
                     output        io_out_validate  ,
                     output [31:0] io_out_0_Re      ,
                     output [31:0] io_out_0_Im      ,
                     output [31:0] io_out_1_Re      ,
                     output [31:0] io_out_1_Im      );    

//parameter ADDR_MAX=4067;
parameter ADDR_MAX=4607;

parameter RDY_CY=4608;              //ready signal on for 96x96 data input
parameter OD_FFT_CY=500;            //1d fft input-output delay

parameter OD_VLD_ST = OD_FFT_CY             ; //500
parameter OD_VLD_FN = OD_FFT_CY+RDY_CY      ; //500+4608=5108
parameter TD_RDY_ST = OD_FFT_CY+RDY_CY      ; //500+4608=5108
parameter TD_RDY_FN = OD_FFT_CY+2*RDY_CY    ; //500+2*4608=9716
parameter TD_VLD_ST = 2*OD_FFT_CY+RDY_CY    ; //2*500+4608=5608
parameter TD_VLD_FN = 2*OD_FFT_CY+2*RDY_CY  ; //2*500+2*4608=10216
parameter OUT_VLD_ST = 2*OD_FFT_CY+2*RDY_CY ; //2*500+2*4608=10216
parameter OUT_VLD_FN = 2*OD_FFT_CY+3*RDY_CY ; //2*500+3*4608=14824

//**************************************************
//------------- FSM Controller ---------------------
//**************************************************
// |cnt: not 0; ~|cnt: all bits 0
reg  [15:0] cnt0, cnt1, cnt2, cnt3;
wire st0_rdy = io_in_ready & ((~|cnt0 & ~|cnt1 & ~|cnt2 & ~|cnt3) | (|cnt0 & cnt0<RDY_CY) | (~|cnt0 & cnt1==3*RDY_CY & cnt2==2*RDY_CY & cnt3==RDY_CY)) ; 
wire st1_rdy = io_in_ready & ((cnt0==RDY_CY & ~|cnt1 & ~|cnt2 & ~|cnt3) | (|cnt1 & cnt1<RDY_CY) | (cnt0==RDY_CY & ~|cnt1 & cnt2==3*RDY_CY & cnt3==2*RDY_CY)) ; 
wire st2_rdy = io_in_ready & ((cnt0==2*RDY_CY & cnt1==RDY_CY & ~|cnt2 & ~|cnt3) | (|cnt2 & cnt2<RDY_CY) | (cnt0==2*RDY_CY & cnt1==RDY_CY & ~|cnt2 & cnt3==3*RDY_CY)) ; 
wire st3_rdy = io_in_ready & ((cnt0==3*RDY_CY & cnt1==2*RDY_CY & cnt2==RDY_CY & ~|cnt3) | (|cnt3 & cnt3<RDY_CY)) ; 

wire cnt0_en = st0_rdy | (|cnt0 & (cnt0!=OUT_VLD_FN));
wire cnt1_en = st1_rdy | (|cnt1 & (cnt1!=OUT_VLD_FN));
wire cnt2_en = st2_rdy | (|cnt2 & (cnt2!=OUT_VLD_FN));
wire cnt3_en = st3_rdy | (|cnt3 & (cnt3!=OUT_VLD_FN));
wire [15:0] nxt_cnt0 = (cnt0==OUT_VLD_FN) ? 16'd0 : 
	                                  cnt0_en ? (cnt0+16'd1) : cnt0;
wire [15:0] nxt_cnt1 = (cnt1==OUT_VLD_FN) ? 16'd0 :      
	                                  cnt1_en ? (cnt1+16'd1) : cnt1;
wire [15:0] nxt_cnt2 = (cnt2==OUT_VLD_FN) ? 16'd0 :      
	                                  cnt2_en ? (cnt2+16'd1) : cnt2;
wire [15:0] nxt_cnt3 = (cnt3==OUT_VLD_FN) ? 16'd0 :      
	                                  cnt3_en ? (cnt3+16'd1) : cnt3;

always @(posedge clock) begin
  if(reset) begin
    cnt0<=16'd0    ;
    cnt1<=16'd0    ;
    cnt2<=16'd0    ;
    cnt3<=16'd0    ;
  end else begin
    cnt0<=nxt_cnt0;
    cnt1<=nxt_cnt1;
    cnt2<=nxt_cnt2;
    cnt3<=nxt_cnt3;
  end
end

wire st0_od_vld      = (cnt0>OD_VLD_ST-1)  & (cnt0<OD_VLD_FN)  ;
wire st0_td_rdy      = (cnt0>TD_RDY_ST-1)  & (cnt0<TD_RDY_FN)  ;
wire st0_td_vld      = (cnt0>TD_VLD_ST-1)  & (cnt0<TD_VLD_FN)  ;
wire st0_td_validate = (cnt0>OUT_VLD_ST-1) & (cnt0<OUT_VLD_FN)  ;

wire st1_od_vld      = (cnt1>OD_VLD_ST-1)  & (cnt1<OD_VLD_FN)  ;
wire st1_td_rdy      = (cnt1>TD_RDY_ST-1)  & (cnt1<TD_RDY_FN)  ;
wire st1_td_vld      = (cnt1>TD_VLD_ST-1)  & (cnt1<TD_VLD_FN)  ;
wire st1_td_validate = (cnt1>OUT_VLD_ST-1) & (cnt1<OUT_VLD_FN)  ;

wire st2_od_vld      = (cnt2>OD_VLD_ST-1)  & (cnt2<OD_VLD_FN)  ;
wire st2_td_rdy      = (cnt2>TD_RDY_ST-1)  & (cnt2<TD_RDY_FN)  ;
wire st2_td_vld      = (cnt2>TD_VLD_ST-1)  & (cnt2<TD_VLD_FN)  ;
wire st2_td_validate = (cnt2>OUT_VLD_ST-1) & (cnt2<OUT_VLD_FN)  ;

wire st3_od_vld      = (cnt3>OD_VLD_ST-1)  & (cnt3<OD_VLD_FN)  ;
wire st3_td_rdy      = (cnt3>TD_RDY_ST-1)  & (cnt3<TD_RDY_FN)  ;
wire st3_td_vld      = (cnt3>TD_VLD_ST-1)  & (cnt3<TD_VLD_FN)  ;
wire st3_td_validate = (cnt3>OUT_VLD_ST-1) & (cnt3<OUT_VLD_FN)  ;
//**************************************************
//-------------  Datapath --------------------------
//**************************************************
// First One-Dimensinal FFT96
wire [31:0] ft_in_0_Re      = io_in_0_Re ;
wire [31:0] ft_in_0_Im      = io_in_0_Im ;
wire [31:0] ft_in_1_Re      = io_in_1_Re ;
wire [31:0] ft_in_1_Im      = io_in_1_Im ;
wire        ft_in_ready     = io_in_ready;

wire        ft_out_validate ;
wire [31:0] ft_out_0_Re     ;
wire [31:0] ft_out_0_Im     ;
wire [31:0] ft_out_1_Re     ;
wire [31:0] ft_out_1_Im     ;

od_fft96_2_3 ft_od_fft96_2_3 (
                              .clock           (clock          ) ,
                              .reset           (reset          ) ,
                              .io_in_0_Re      (ft_in_0_Re     ) ,
                              .io_in_0_Im      (ft_in_0_Im     ) ,
                              .io_in_1_Re      (ft_in_1_Re     ) ,
                              .io_in_1_Im      (ft_in_1_Im     ) ,
                              .io_in_ready     (ft_in_ready    ) ,
                              .io_out_validate (ft_out_validate) ,
                              .io_out_0_Re     (ft_out_0_Re    ) ,
                              .io_out_0_Im     (ft_out_0_Im    ) ,
                              .io_out_1_Re     (ft_out_1_Re    ) ,
                              .io_out_1_Im     (ft_out_1_Im    )
                             );

// First Ping-Pong Buffer
wire b0_mem_wr = st0_od_vld | st2_od_vld;
wire b1_mem_wr = st1_od_vld | st3_od_vld;
wire b0_mem_rd = st0_td_rdy | st2_td_rdy;
wire b1_mem_rd = st1_td_rdy | st3_td_rdy;

wire [63:0] b0_mem_wrdata0  = b0_mem_wr ? {ft_out_0_Re, ft_out_0_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata1  = b0_mem_wr ? {ft_out_1_Re, ft_out_1_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata0  = b1_mem_wr ? {ft_out_0_Re, ft_out_0_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata1  = b1_mem_wr ? {ft_out_1_Re, ft_out_1_Im} : 64'h0    ;

wire [63:0] b0_mem_rddata0  ;
wire [63:0] b0_mem_rddata1  ;
wire [63:0] b1_mem_rddata0  ;
wire [63:0] b1_mem_rddata1  ;

reg  [15:0] b0_mem_addr         ;
reg  [15:0] b1_mem_addr         ;
wire [15:0] nxt_b0_mem_addr     ;
wire [15:0] nxt_b1_mem_addr     ; 

assign nxt_b0_mem_addr  = (b0_mem_addr==ADDR_MAX) ? 16'd0 :
	                                            (b0_mem_wr|b0_mem_rd) ? b0_mem_addr+16'd1 : b0_mem_addr       ;
assign nxt_b1_mem_addr  = (b1_mem_addr==ADDR_MAX) ? 16'd0 :
	                                            (b1_mem_wr|b1_mem_rd) ? b1_mem_addr+16'd1 : b1_mem_addr       ;
always @(posedge clock) begin
  if(reset) begin
    b0_mem_addr<=16'd0           ;
    b1_mem_addr<=16'd0           ;
  end else begin
    b0_mem_addr<=nxt_b0_mem_addr;
    b1_mem_addr<=nxt_b1_mem_addr;
  end
end


buf_ctl b0_bfu_ctl (.clock            (clock         ),
                    .reset            (reset         ),
                    .mem_wr           (b0_mem_wr     ),
                    .mem_rd           (b0_mem_rd     ),
                    .mem_addr         (b0_mem_addr   ),
                    .mem_wrdata0      (b0_mem_wrdata0),
                    .mem_wrdata1      (b0_mem_wrdata1),
                    .mem_rddata0      (b0_mem_rddata0),
                    .mem_rddata1      (b0_mem_rddata1));

buf_ctl b1_bfu_ctl (.clock            (clock         ),
                    .reset            (reset         ),
                    .mem_wr           (b1_mem_wr     ),
                    .mem_rd           (b1_mem_rd     ),
                    .mem_addr         (b1_mem_addr   ),
                    .mem_wrdata0      (b1_mem_wrdata0),
                    .mem_wrdata1      (b1_mem_wrdata1),
                    .mem_rddata0      (b1_mem_rddata0),
                    .mem_rddata1      (b1_mem_rddata1));

// Second One-Dimensional FFT96
wire [31:0] sd_in_0_Re      = (st0_td_rdy | st2_td_rdy) ? b0_mem_rddata0[63:32] :
	                                              (st1_td_rdy | st3_td_rdy) ? b1_mem_rddata0[63:32] : 32'h0;
wire [31:0] sd_in_0_Im      = (st0_td_rdy | st2_td_rdy) ? b0_mem_rddata0[31:0]  :
	                                              (st1_td_rdy | st3_td_rdy) ? b1_mem_rddata0[31:0] : 32'h0;
wire [31:0] sd_in_1_Re      = (st0_td_rdy | st2_td_rdy) ? b0_mem_rddata1[63:32] :
	                                              (st1_td_rdy | st3_td_rdy) ? b1_mem_rddata1[63:32] :32'h0;
wire [31:0] sd_in_1_Im      = (st0_td_rdy | st2_td_rdy) ? b0_mem_rddata1[31:0]  :
	                                              (st1_td_rdy | st3_td_rdy) ? b1_mem_rddata1[31:0] : 32'h0;

wire        sd_in_ready     = st0_td_rdy | st1_td_rdy | st2_td_rdy | st3_td_rdy;

wire        sd_out_validate ;
wire [31:0] sd_out_0_Re     ;
wire [31:0] sd_out_0_Im     ;
wire [31:0] sd_out_1_Re     ;
wire [31:0] sd_out_1_Im     ;

od_fft96_2_3 sd_od_fft96_2_3 (
                              .clock           (clock          ) ,
                              .reset           (reset          ) ,
                              .io_in_0_Re      (sd_in_0_Re     ) ,
                              .io_in_0_Im      (sd_in_0_Im     ) ,
                              .io_in_1_Re      (sd_in_1_Re     ) ,
                              .io_in_1_Im      (sd_in_1_Im     ) ,
                              .io_in_ready     (sd_in_ready    ) ,
                              .io_out_validate (sd_out_validate) ,
                              .io_out_0_Re     (sd_out_0_Re    ) ,
                              .io_out_0_Im     (sd_out_0_Im    ) ,
                              .io_out_1_Re     (sd_out_1_Re    ) ,
                              .io_out_1_Im     (sd_out_1_Im    )
                             );

wire b2_mem_wr = st0_td_vld | st2_td_vld;
wire b3_mem_wr = st1_td_vld | st3_td_vld;
wire b2_mem_rd = st0_td_validate | st2_td_validate;
wire b3_mem_rd = st1_td_validate | st3_td_validate;

wire [63:0] b2_mem_wrdata0  = b2_mem_wr ? {sd_out_0_Re, sd_out_0_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata1  = b2_mem_wr ? {sd_out_1_Re, sd_out_1_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata0  = b3_mem_wr ? {sd_out_0_Re, sd_out_0_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata1  = b3_mem_wr ? {sd_out_1_Re, sd_out_1_Im} : 64'h0    ;

wire [63:0] b2_mem_rddata0  ;
wire [63:0] b2_mem_rddata1  ;
wire [63:0] b3_mem_rddata0  ;
wire [63:0] b3_mem_rddata1  ;

reg  [15:0] b2_mem_addr         ;
reg  [15:0] b3_mem_addr         ;
wire [15:0] nxt_b2_mem_addr  = (b2_mem_addr==ADDR_MAX) ? 16'd0 :
	                                 (b2_mem_wr|b2_mem_rd) ? b2_mem_addr+16'd1 : b2_mem_addr       ;
wire [15:0] nxt_b3_mem_addr  = (b3_mem_addr==ADDR_MAX) ? 16'd0 :
	                                 (b3_mem_wr|b3_mem_rd) ? b3_mem_addr+16'd1 : b3_mem_addr       ;
always @(posedge clock) begin
  if(reset) begin
    b2_mem_addr<=16'd0           ;
    b3_mem_addr<=16'd0           ;
  end else begin
    b2_mem_addr<=nxt_b2_mem_addr;
    b3_mem_addr<=nxt_b3_mem_addr;
  end
end

buf_ctl b2_bfu_ctl (.clock            (clock      ),
                    .reset            (reset      ),
                    .mem_wr           (b2_mem_wr     ),
                    .mem_rd           (b2_mem_rd     ),
                    .mem_addr         (b2_mem_addr   ),
                    .mem_wrdata0      (b2_mem_wrdata0),
                    .mem_wrdata1      (b2_mem_wrdata1),
                    .mem_rddata0      (b2_mem_rddata0),
                    .mem_rddata1      (b2_mem_rddata1));

buf_ctl b3_bfu_ctl (.clock            (clock      ),
                    .reset            (reset      ),
                    .mem_wr           (b3_mem_wr     ),
                    .mem_rd           (b3_mem_rd     ),
                    .mem_addr         (b3_mem_addr   ),
                    .mem_wrdata0      (b3_mem_wrdata0),
                    .mem_wrdata1      (b3_mem_wrdata1),
                    .mem_rddata0      (b3_mem_rddata0),
                    .mem_rddata1      (b3_mem_rddata1));

assign io_out_validate = st0_td_validate | st1_td_validate | st2_td_validate | st3_td_validate; 
assign io_out_0_Re  = (st0_td_validate | st2_td_validate) ? b2_mem_rddata0[63:32] : 
   	                                    (st1_td_validate |  st3_td_validate) ? b3_mem_rddata0[63:32] : 32'h0;
assign io_out_0_Im  = (st0_td_validate | st2_td_validate) ? b2_mem_rddata0[31:0] : 
   	                                    (st1_td_validate |  st3_td_validate) ? b3_mem_rddata0[31:0]  : 32'h0;
assign io_out_1_Re  = (st0_td_validate | st2_td_validate) ? b2_mem_rddata1[63:32] : 
   	                                    (st1_td_validate |  st3_td_validate) ? b3_mem_rddata1[63:32] : 32'h0;
assign io_out_1_Im  = (st0_td_validate | st2_td_validate) ? b2_mem_rddata1[31:0] : 
   	                                    (st1_td_validate |  st3_td_validate) ? b3_mem_rddata1[31:0]  : 32'h0;

endmodule
