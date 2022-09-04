//*********************************************************************************************//
//----------------    2D-FFT DUT   ----------------------------------------------------------////
//---------------- Author: Xiaokun Yang  ----------------------------------------------------////
//---------------- Lawrence Berkeley Lab ----------------------------------------------------////
//---------------- Date: 7/25/2022 ----------------------------------------------------------//// 
//----- Version 1: 3D FFT96 For Non-Streming Input ------------------------------------------////
//----- Date: 8/1/2022 ----------------------------------------------------------------------////
//----- Version 2:                                                   ------------------------////
//----- Date:           ---------------------------------------------------------------------////
//*********************************************************************************************//
//----- This design-under-test provides functions for Fourier Transform over three dimensions  //
//---------------------------------------------------------------------------------------------//
//----- THD_FFT96                                                                              //
//----- The dut is non-streaming FFT96 based on the 1D FFT96 instances                         //
//----- Latency:  clock cycles                                                              //
//----- Hardware cost:  FP Adders,  FP Multipliers, -Word Memory                 //
//---------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------//
//*********************************************************************************************//
module thd_fft96_2_3(input         clock            ,
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

parameter ROW_D=96/2; //2 data in per cycle
parameter COL_D=96;   //96
parameter DEP_D=96;   //96

parameter RDY_CY=442368;            //ready signal on for 96x96x96 data input
parameter OD_FFT_CY=500;            //1d fft input-output delay

parameter OD_VLD_ST = OD_FFT_CY             ; //500
parameter OD_VLD_FN = OD_FFT_CY+RDY_CY      ; //500+442368=442,868
parameter TD_RDY_ST = OD_FFT_CY+RDY_CY      ; //500+442368=442,868
parameter TD_RDY_FN = OD_FFT_CY+2*RDY_CY    ; //500+2*442368=885,236
parameter TD_VLD_ST = 2*OD_FFT_CY+RDY_CY    ; //2*500+442368=443,368
parameter TD_VLD_FN = 2*OD_FFT_CY+2*RDY_CY  ; //2*500+2*442368=885,736

parameter THD_RDY_ST = 2*OD_FFT_CY+2*RDY_CY    ; //2*500+2*442368=885,736
parameter THD_RDY_FN = 2*OD_FFT_CY+3*RDY_CY    ; //2*500+3*442368=1,328,104
parameter THD_VLD_ST = 3*OD_FFT_CY+2*RDY_CY    ; //3*500+2*442368=886,236
parameter THD_VLD_FN = 3*OD_FFT_CY+3*RDY_CY    ; //3*500+3*442368=1,328,604
parameter OUT_VLD_ST = 3*OD_FFT_CY+3*RDY_CY    ; //3*500+3*442368=1,328,604
parameter OUT_VLD_FN = 3*OD_FFT_CY+4*RDY_CY    ; //3*500+4*442368=1,770,927, for a 50MHz MOF, it takes 35.41944 ms. 
parameter COUNTER_FN = 5*RDY_CY                ; //5*442368=2,214,840

//**************************************************
//------------- FSM Controller ---------------------
//**************************************************
// |cnt: not 0; ~|cnt: all bits 0
//reg  [23:0] cnt0, cnt1, cnt2, cnt3, cnt4;
//wire st0_rdy = io_in_ready & ((~|cnt0 & ~|cnt1 & ~|cnt2 & ~|cnt3 & ~|cnt4) | (|cnt0 & cnt0<RDY_CY) | (~|cnt0 & cnt1==4*RDY_CY & cnt2==3*RDY_CY & cnt3==2*RDY_CY & cnt4==RDY_CY)) ; 
//wire st1_rdy = io_in_ready & ((cnt0==RDY_CY & ~|cnt1 & ~|cnt2 & ~|cnt3 & ~|cnt4) | (|cnt1 & cnt1<RDY_CY) | (cnt0==RDY_CY & ~|cnt1 & cnt2==4*RDY_CY & cnt3==3*RDY_CY & cnt4==2*RDY_CY)) ; 
//wire st2_rdy = io_in_ready & ((cnt0==2*RDY_CY & cnt1==RDY_CY & ~|cnt2 & ~|cnt3 & ~|cnt4) | (|cnt2 & cnt2<RDY_CY) | (cnt0==2*RDY_CY & cnt1==RDY_CY & ~|cnt2 & cnt3==4*RDY_CY & cnt4==3*RDY_CY)) ; 
//wire st3_rdy = io_in_ready & ((cnt0==3*RDY_CY & cnt1==2*RDY_CY & cnt2==RDY_CY & ~|cnt3 & ~|cnt4) | (|cnt3 & cnt3<RDY_CY) | (cnt0==3*RDY_CY & cnt1==2*RDY_CY & cnt2==RDY_CY & ~|cnt3 & cnt4==4*RDY_CY)) ; 
//wire st4_rdy = io_in_ready & ((cnt0==4*RDY_CY & cnt1==3*RDY_CY & cnt2==2*RDY_CY & cnt3==RDY_CY & ~|cnt4) | (|cnt3 & cnt3<RDY_CY) ) ; 
reg  [23:0] cnt0, cnt1, cnt2, cnt3, cnt4, cnt5;
wire st0_rdy = io_in_ready & ((~|cnt0 & ~|cnt1 & ~|cnt2 & ~|cnt3 & ~|cnt4 & ~|cnt5) | (|cnt0 & cnt0<RDY_CY) | (~|cnt0 & cnt1==5*RDY_CY & cnt2==4*RDY_CY & cnt3==3*RDY_CY & cnt4==2*RDY_CY & cnt5==RDY_CY)) ; 
wire st1_rdy = io_in_ready & ((cnt0==RDY_CY & ~|cnt1 & ~|cnt2 & ~|cnt3 & ~|cnt4 & ~|cnt5) | (|cnt1 & cnt1<RDY_CY) | (cnt0==RDY_CY & ~|cnt1 & cnt2==5*RDY_CY & cnt3==4*RDY_CY & cnt4==3*RDY_CY & cnt5==2*RDY_CY)) ; 
wire st2_rdy = io_in_ready & ((cnt0==2*RDY_CY & cnt1==RDY_CY & ~|cnt2 & ~|cnt3 & ~|cnt4 & ~|cnt5) | (|cnt2 & cnt2<RDY_CY) | (cnt0==2*RDY_CY & cnt1==RDY_CY & ~|cnt2 & cnt3==5*RDY_CY & cnt4==4*RDY_CY & cnt5==3*RDY_CY)) ; 
wire st3_rdy = io_in_ready & ((cnt0==3*RDY_CY & cnt1==2*RDY_CY & cnt2==RDY_CY & ~|cnt3 & ~|cnt4 & ~|cnt5) | (|cnt3 & cnt3<RDY_CY) | (cnt0==3*RDY_CY & cnt1==2*RDY_CY & cnt2==RDY_CY & ~|cnt3 & cnt4==5*RDY_CY & cnt5==4*RDY_CY)) ; 
wire st4_rdy = io_in_ready & ((cnt0==4*RDY_CY & cnt1==3*RDY_CY & cnt2==2*RDY_CY & cnt3==RDY_CY & ~|cnt4 & ~|cnt5) | (|cnt4 & cnt4<RDY_CY) | (cnt0==4*RDY_CY & cnt1==3*RDY_CY & cnt2==2*RDY_CY & cnt3==RDY_CY & ~|cnt4 & cnt5==5*RDY_CY)) ; 
wire st5_rdy = io_in_ready & ((cnt0==5*RDY_CY & cnt1==4*RDY_CY & cnt2==3*RDY_CY & cnt3==2*RDY_CY & cnt4==RDY_CY & ~|cnt5) | (|cnt5 & cnt5<RDY_CY) ) ; 

//wire cnt0_en = st0_rdy | (|cnt0 & (cnt0!=OUT_VLD_FN));
//wire cnt1_en = st1_rdy | (|cnt1 & (cnt1!=OUT_VLD_FN));
//wire cnt2_en = st2_rdy | (|cnt2 & (cnt2!=OUT_VLD_FN));
//wire cnt3_en = st3_rdy | (|cnt3 & (cnt3!=OUT_VLD_FN));
//wire cnt4_en = st4_rdy | (|cnt4 & (cnt4!=OUT_VLD_FN));
//wire cnt5_en = st5_rdy | (|cnt5 & (cnt5!=OUT_VLD_FN));
wire cnt0_en = st0_rdy | (|cnt0 & (cnt0!=COUNTER_FN));
wire cnt1_en = st1_rdy | (|cnt1 & (cnt1!=COUNTER_FN));
wire cnt2_en = st2_rdy | (|cnt2 & (cnt2!=COUNTER_FN));
wire cnt3_en = st3_rdy | (|cnt3 & (cnt3!=COUNTER_FN));
wire cnt4_en = st4_rdy | (|cnt4 & (cnt4!=COUNTER_FN));
wire cnt5_en = st5_rdy | (|cnt5 & (cnt5!=COUNTER_FN));
wire [23:0] nxt_cnt0 = (cnt0==COUNTER_FN) ? 24'd0 : 
                                          cnt0_en ? (cnt0+24'd1) : cnt0;
wire [23:0] nxt_cnt1 = (cnt1==COUNTER_FN) ? 24'd0 :      
                                          cnt1_en ? (cnt1+24'd1) : cnt1;
wire [23:0] nxt_cnt2 = (cnt2==COUNTER_FN) ? 24'd0 :      
                                          cnt2_en ? (cnt2+24'd1) : cnt2;
wire [23:0] nxt_cnt3 = (cnt3==COUNTER_FN) ? 24'd0 :      
                                          cnt3_en ? (cnt3+24'd1) : cnt3;
wire [23:0] nxt_cnt4 = (cnt4==COUNTER_FN) ? 24'd0 :      
	                                  cnt4_en ? (cnt4+24'd1) : cnt4;
wire [23:0] nxt_cnt5 = (cnt5==COUNTER_FN) ? 24'd0 :      
	                                  cnt5_en ? (cnt5+24'd1) : cnt5;

always @(posedge clock) begin
  if(reset) begin
    cnt0<=24'd0    ;
    cnt1<=24'd0    ;
    cnt2<=24'd0    ;
    cnt3<=24'd0    ;
    cnt4<=24'd0    ;
    cnt5<=24'd0    ;
  end else begin
    cnt0<=nxt_cnt0;
    cnt1<=nxt_cnt1;
    cnt2<=nxt_cnt2;
    cnt3<=nxt_cnt3;
    cnt4<=nxt_cnt4;
    cnt5<=nxt_cnt5;
  end
end

wire st0_od_vld       = (cnt0>OD_VLD_ST-1)  & (cnt0<OD_VLD_FN)  ;
wire st0_td_rdy       = (cnt0>TD_RDY_ST-1)  & (cnt0<TD_RDY_FN)  ;
wire st0_td_vld       = (cnt0>TD_VLD_ST-1)  & (cnt0<TD_VLD_FN)  ;
wire st0_thd_rdy      = (cnt0>THD_RDY_ST-1) & (cnt0<THD_RDY_FN)  ;
wire st0_thd_vld      = (cnt0>THD_VLD_ST-1) & (cnt0<THD_VLD_FN)  ;
wire st0_out_vld      = (cnt0>OUT_VLD_ST-1) & (cnt0<OUT_VLD_FN)  ;

wire st1_od_vld       = (cnt1>OD_VLD_ST-1)  & (cnt1<OD_VLD_FN)  ;
wire st1_td_rdy       = (cnt1>TD_RDY_ST-1)  & (cnt1<TD_RDY_FN)  ;
wire st1_td_vld       = (cnt1>TD_VLD_ST-1)  & (cnt1<TD_VLD_FN)  ;
wire st1_thd_rdy      = (cnt1>THD_RDY_ST-1) & (cnt1<THD_RDY_FN)  ;
wire st1_thd_vld      = (cnt1>THD_VLD_ST-1) & (cnt1<THD_VLD_FN)  ;
wire st1_out_vld      = (cnt1>OUT_VLD_ST-1) & (cnt1<OUT_VLD_FN)  ;

wire st2_od_vld       = (cnt2>OD_VLD_ST-1)  & (cnt2<OD_VLD_FN)  ;
wire st2_td_rdy       = (cnt2>TD_RDY_ST-1)  & (cnt2<TD_RDY_FN)  ;
wire st2_td_vld       = (cnt2>TD_VLD_ST-1)  & (cnt2<TD_VLD_FN)  ;
wire st2_thd_rdy      = (cnt2>THD_RDY_ST-1) & (cnt2<THD_RDY_FN)  ;
wire st2_thd_vld      = (cnt2>THD_VLD_ST-1) & (cnt2<THD_VLD_FN)  ;
wire st2_out_vld      = (cnt2>OUT_VLD_ST-1) & (cnt2<OUT_VLD_FN)  ;

wire st3_od_vld       = (cnt3>OD_VLD_ST-1)  & (cnt3<OD_VLD_FN)  ;
wire st3_td_rdy       = (cnt3>TD_RDY_ST-1)  & (cnt3<TD_RDY_FN)  ;
wire st3_td_vld       = (cnt3>TD_VLD_ST-1)  & (cnt3<TD_VLD_FN)  ;
wire st3_thd_rdy      = (cnt3>THD_RDY_ST-1) & (cnt3<THD_RDY_FN)  ;
wire st3_thd_vld      = (cnt3>THD_VLD_ST-1) & (cnt3<THD_VLD_FN)  ;
wire st3_out_vld      = (cnt3>OUT_VLD_ST-1) & (cnt3<OUT_VLD_FN)  ;

wire st4_od_vld       = (cnt4>OD_VLD_ST-1)  & (cnt4<OD_VLD_FN)  ;
wire st4_td_rdy       = (cnt4>TD_RDY_ST-1)  & (cnt4<TD_RDY_FN)  ;
wire st4_td_vld       = (cnt4>TD_VLD_ST-1)  & (cnt4<TD_VLD_FN)  ;
wire st4_thd_rdy      = (cnt4>THD_RDY_ST-1) & (cnt4<THD_RDY_FN)  ;
wire st4_thd_vld      = (cnt4>THD_VLD_ST-1) & (cnt4<THD_VLD_FN)  ;
wire st4_out_vld      = (cnt4>OUT_VLD_ST-1) & (cnt4<OUT_VLD_FN)  ;

wire st5_od_vld       = (cnt5>OD_VLD_ST-1)  & (cnt5<OD_VLD_FN)  ;
wire st5_td_rdy       = (cnt5>TD_RDY_ST-1)  & (cnt5<TD_RDY_FN)  ;
wire st5_td_vld       = (cnt5>TD_VLD_ST-1)  & (cnt5<TD_VLD_FN)  ;
wire st5_thd_rdy      = (cnt5>THD_RDY_ST-1) & (cnt5<THD_RDY_FN)  ;
wire st5_thd_vld      = (cnt5>THD_VLD_ST-1) & (cnt5<THD_VLD_FN)  ;
wire st5_out_vld      = (cnt5>OUT_VLD_ST-1) & (cnt5<OUT_VLD_FN)  ;
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
wire b0_mem_wr = st0_od_vld | st2_od_vld | st4_od_vld;
wire b1_mem_wr = st1_od_vld | st3_od_vld | st5_od_vld;
wire b0_mem_rd = st0_td_rdy | st2_td_rdy | st4_td_rdy;
wire b1_mem_rd = st1_td_rdy | st3_td_rdy | st5_td_rdy;

wire [63:0] b0_mem_wrdata0  = b0_mem_wr ? {ft_out_0_Re, ft_out_0_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata1  = b0_mem_wr ? {ft_out_1_Re, ft_out_1_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata0  = b1_mem_wr ? {ft_out_0_Re, ft_out_0_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata1  = b1_mem_wr ? {ft_out_1_Re, ft_out_1_Im} : 64'h0    ;

wire [63:0] b0_mem_rddata0  ;
wire [63:0] b0_mem_rddata1  ;
wire [63:0] b1_mem_rddata0  ;
wire [63:0] b1_mem_rddata1  ;

reg  [6:0] b0_row_no         ;
reg  [6:0] b1_row_no         ;
reg  [6:0] b0_col_no         ;
reg  [6:0] b1_col_no         ;
reg  [6:0] b0_dep_no         ;
reg  [6:0] b1_dep_no         ;
wire b0_row_no_dim = b0_row_no==ROW_D-1;
wire b1_row_no_dim = b1_row_no==ROW_D-1;
wire b0_col_no_dim = b0_col_no==COL_D-1;
wire b1_col_no_dim = b1_col_no==COL_D-1;
wire b0_dep_no_dim = b0_dep_no==DEP_D-1;
wire b1_dep_no_dim = b1_dep_no==DEP_D-1;
wire [6:0] nxt_b0_row_no  = b0_row_no_dim ? 7'd0 :
                             b0_mem_wr|b0_mem_rd ? b0_row_no+7'd1 : b0_row_no       ;
wire [6:0] nxt_b1_row_no  = b1_row_no_dim ? 7'd0 :
	                     b1_mem_wr|b1_mem_rd ? b1_row_no+7'd1 : b1_row_no       ;
wire [6:0] nxt_b0_col_no  = b0_col_no_dim&b0_row_no_dim ? 7'd0 :
                         ((b0_mem_wr|b0_mem_rd)&b0_row_no_dim) ? b0_col_no+7'd1 : b0_col_no       ;
wire [6:0] nxt_b1_col_no  = b1_col_no_dim&b1_row_no_dim ? 7'd0 :
	                 ((b1_mem_wr|b1_mem_rd)&b1_row_no_dim) ? b1_col_no+7'd1 : b1_col_no       ;
wire [6:0] nxt_b0_dep_no  = b0_dep_no_dim&b0_col_no_dim&b0_row_no_dim ? 7'd0 :
                                       ((b0_mem_wr|b0_mem_rd)&b0_col_no_dim&b0_row_no_dim) ? b0_dep_no+7'd1 : b0_dep_no       ;
wire [6:0] nxt_b1_dep_no  = b1_dep_no_dim&b1_col_no_dim&b1_row_no_dim ? 7'd0 :
	                               ((b1_mem_wr|b1_mem_rd)&b1_col_no_dim&b1_row_no_dim) ? b1_dep_no+7'd1 : b1_dep_no      ;
always @(posedge clock) begin
  if(reset) begin
    b0_row_no<=7'd0           ;
    b1_row_no<=7'd0           ;
    b0_col_no<=7'd0           ;
    b1_col_no<=7'd0           ;
    b0_dep_no<=7'd0           ;
    b1_dep_no<=7'd0           ;
  end else begin
    b0_row_no<=nxt_b0_row_no;
    b1_row_no<=nxt_b1_row_no;
    b0_col_no<=nxt_b0_col_no;
    b1_col_no<=nxt_b1_col_no;
    b0_dep_no<=nxt_b0_dep_no;
    b1_dep_no<=nxt_b1_dep_no;
  end
end


buf_ctl b0_bfu_ctl (.clock            (clock         ),
                    .reset            (reset         ),
                    .mem_wr           (b0_mem_wr     ),
                    .mem_rd           (b0_mem_rd     ),
                    .row_no           (b0_row_no     ),
                    .col_no           (b0_col_no     ),
                    .dep_no           (b0_dep_no     ),
                    .mem_wrdata0      (b0_mem_wrdata0),
                    .mem_wrdata1      (b0_mem_wrdata1),
                    .mem_rddata0      (b0_mem_rddata0),
                    .mem_rddata1      (b0_mem_rddata1));

buf_ctl b1_bfu_ctl (.clock            (clock         ),
                    .reset            (reset         ),
                    .mem_wr           (b1_mem_wr     ),
                    .mem_rd           (b1_mem_rd     ),
                    .row_no           (b1_row_no   ),
                    .col_no           (b1_col_no     ),
                    .dep_no           (b1_dep_no     ),
                    .mem_wrdata0      (b1_mem_wrdata0),
                    .mem_wrdata1      (b1_mem_wrdata1),
                    .mem_rddata0      (b1_mem_rddata0),
                    .mem_rddata1      (b1_mem_rddata1));

// Second One-Dimensional FFT96
wire st_0_2_4_td_rdy = st0_td_rdy | st2_td_rdy | st4_td_rdy;
wire st_1_3_5_td_rdy = st1_td_rdy | st3_td_rdy | st5_td_rdy;
wire [31:0] sd_in_0_Re      = st_0_2_4_td_rdy ? b0_mem_rddata0[63:32] :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata0[63:32] : 32'h0;
wire [31:0] sd_in_0_Im      = st_0_2_4_td_rdy ? b0_mem_rddata0[31:0]  :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata0[31:0] : 32'h0;
wire [31:0] sd_in_1_Re      = st_0_2_4_td_rdy ? b0_mem_rddata1[63:32] :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata1[63:32] :32'h0;
wire [31:0] sd_in_1_Im      = st_0_2_4_td_rdy ? b0_mem_rddata1[31:0]  :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata1[31:0] : 32'h0;

wire        sd_in_ready     = st0_td_rdy | st1_td_rdy | st2_td_rdy | st3_td_rdy | st4_td_rdy | st5_td_rdy;

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

wire b2_mem_wr = st0_td_vld | st2_td_vld | st4_td_vld;
wire b3_mem_wr = st1_td_vld | st3_td_vld | st5_td_vld;
wire b2_mem_rd = st0_thd_rdy | st2_thd_rdy | st4_thd_rdy;
wire b3_mem_rd = st1_thd_rdy | st3_thd_rdy | st5_thd_rdy;

wire [63:0] b2_mem_wrdata0  = b2_mem_wr ? {sd_out_0_Re, sd_out_0_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata1  = b2_mem_wr ? {sd_out_1_Re, sd_out_1_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata0  = b3_mem_wr ? {sd_out_0_Re, sd_out_0_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata1  = b3_mem_wr ? {sd_out_1_Re, sd_out_1_Im} : 64'h0    ;

wire [63:0] b2_mem_rddata0  ;
wire [63:0] b2_mem_rddata1  ;
wire [63:0] b3_mem_rddata0  ;
wire [63:0] b3_mem_rddata1  ;

reg  [6:0] b2_row_no         ;
reg  [6:0] b3_row_no         ;
reg  [6:0] b2_col_no         ;
reg  [6:0] b3_col_no         ;
reg  [6:0] b2_dep_no         ;
reg  [6:0] b3_dep_no         ;
wire b2_row_no_dim = b2_row_no==ROW_D-1;
wire b3_row_no_dim = b3_row_no==ROW_D-1;
wire b2_col_no_dim = b2_col_no==COL_D-1;
wire b3_col_no_dim = b3_col_no==COL_D-1;
wire b2_dep_no_dim = b2_dep_no==DEP_D-1;
wire b3_dep_no_dim = b3_dep_no==DEP_D-1;
wire [6:0] nxt_b2_row_no  = b2_row_no_dim ? 7'd0 :
                             b2_mem_wr|b2_mem_rd ? b2_row_no+7'd1 : b2_row_no       ;
wire [6:0] nxt_b3_row_no  = b3_row_no_dim ? 7'd0 :
	                     b3_mem_wr|b3_mem_rd ? b3_row_no+7'd1 : b3_row_no       ;
wire [6:0] nxt_b2_col_no  = b2_col_no_dim&b2_row_no_dim ? 7'd0 :
                         ((b2_mem_wr|b2_mem_rd)&b2_row_no_dim) ? b2_col_no+7'd1 : b2_col_no       ;
wire [6:0] nxt_b3_col_no  = b3_col_no_dim&b3_row_no_dim ? 7'd0 :
	                 ((b3_mem_wr|b3_mem_rd)&b3_row_no_dim) ? b3_col_no+7'd1 : b3_col_no       ;
wire [6:0] nxt_b2_dep_no  = b2_dep_no_dim&b2_col_no_dim&b2_row_no_dim ? 7'd0 :
                                       ((b2_mem_wr|b2_mem_rd)&b2_col_no_dim&b2_row_no_dim) ? b2_dep_no+7'd1 : b2_dep_no       ;
wire [6:0] nxt_b3_dep_no  = b3_dep_no_dim&b3_col_no_dim&b3_row_no_dim ? 7'd0 :
	                               ((b3_mem_wr|b3_mem_rd)&b3_col_no_dim&b3_row_no_dim) ? b3_dep_no+7'd1 : b3_dep_no      ;
always @(posedge clock) begin
  if(reset) begin
    b2_row_no<=7'd0           ;
    b3_row_no<=7'd0           ;
    b2_col_no<=7'd0           ;
    b3_col_no<=7'd0           ;
    b2_dep_no<=7'd0           ;
    b3_dep_no<=7'd0           ;
  end else begin
    b2_row_no<=nxt_b2_row_no;
    b3_row_no<=nxt_b3_row_no;
    b2_col_no<=nxt_b2_col_no;
    b3_col_no<=nxt_b3_col_no;
    b2_dep_no<=nxt_b2_dep_no;
    b3_dep_no<=nxt_b3_dep_no;
  end
end

buf_ctl b2_bfu_ctl (.clock            (clock      ),
                    .reset            (reset      ),
                    .mem_wr           (b2_mem_wr     ),
                    .mem_rd           (b2_mem_rd     ),
                    .row_no           (b2_row_no   ),
                    .col_no           (b2_col_no   ),
                    .dep_no           (b2_dep_no   ),
                    .mem_wrdata0      (b2_mem_wrdata0),
                    .mem_wrdata1      (b2_mem_wrdata1),
                    .mem_rddata0      (b2_mem_rddata0),
                    .mem_rddata1      (b2_mem_rddata1));

buf_ctl b3_bfu_ctl (.clock            (clock      ),
                    .reset            (reset      ),
                    .mem_wr           (b3_mem_wr     ),
                    .mem_rd           (b3_mem_rd     ),
                    .row_no           (b3_row_no   ),
                    .col_no           (b3_col_no   ),
                    .dep_no           (b3_dep_no   ),
                    .mem_wrdata0      (b3_mem_wrdata0),
                    .mem_wrdata1      (b3_mem_wrdata1),
                    .mem_rddata0      (b3_mem_rddata0),
                    .mem_rddata1      (b3_mem_rddata1));

// Third One-Dimensional FFT96
wire st_0_2_4_thd_rdy = st0_thd_rdy | st2_thd_rdy | st4_thd_rdy;
wire st_1_3_5_thd_rdy = st1_thd_rdy | st3_thd_rdy | st5_thd_rdy;
wire [31:0] thd_in_0_Re      = st_0_2_4_thd_rdy ? b2_mem_rddata0[63:32] :
	                                                 st_1_3_5_thd_rdy ? b3_mem_rddata0[63:32] : 32'h0;
wire [31:0] thd_in_0_Im      = st_0_2_4_thd_rdy ? b2_mem_rddata0[31:0]  :
	                                                 st_1_3_5_thd_rdy ? b3_mem_rddata0[31:0] : 32'h0;
wire [31:0] thd_in_1_Re      = st_0_2_4_thd_rdy ? b2_mem_rddata1[63:32] :
	                                                 st_1_3_5_thd_rdy ? b3_mem_rddata1[63:32] :32'h0;
wire [31:0] thd_in_1_Im      = st_0_2_4_thd_rdy ? b2_mem_rddata1[31:0]  :
	                                                 st_1_3_5_thd_rdy ? b3_mem_rddata1[31:0] : 32'h0;

wire        thd_in_ready     = st0_thd_rdy | st1_thd_rdy | st2_thd_rdy | st3_thd_rdy | st4_thd_rdy | st5_thd_rdy;

wire        thd_out_validate ;
wire [31:0] thd_out_0_Re     ;
wire [31:0] thd_out_0_Im     ;
wire [31:0] thd_out_1_Re     ;
wire [31:0] thd_out_1_Im     ;

od_fft96_2_3 thd_od_fft96_2_3 (
                              .clock           (clock          ) ,
                              .reset           (reset          ) ,
                              .io_in_0_Re      (thd_in_0_Re     ) ,
                              .io_in_0_Im      (thd_in_0_Im     ) ,
                              .io_in_1_Re      (thd_in_1_Re     ) ,
                              .io_in_1_Im      (thd_in_1_Im     ) ,
                              .io_in_ready     (thd_in_ready    ) ,
                              .io_out_validate (thd_out_validate) ,
                              .io_out_0_Re     (thd_out_0_Re    ) ,
                              .io_out_0_Im     (thd_out_0_Im    ) ,
                              .io_out_1_Re     (thd_out_1_Re    ) ,
                              .io_out_1_Im     (thd_out_1_Im    )
                             );

wire b4_mem_wr = st0_thd_vld | st2_thd_vld | st4_thd_vld;
wire b5_mem_wr = st1_thd_vld | st3_thd_vld | st5_thd_vld;
wire b4_mem_rd = st0_out_vld | st2_out_vld | st4_out_vld;
wire b5_mem_rd = st1_out_vld | st3_out_vld | st5_out_vld;

wire [63:0] b4_mem_wrdata0  = b4_mem_wr ? {thd_out_0_Re, thd_out_0_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata1  = b4_mem_wr ? {thd_out_1_Re, thd_out_1_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata0  = b5_mem_wr ? {thd_out_0_Re, thd_out_0_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata1  = b5_mem_wr ? {thd_out_1_Re, thd_out_1_Im} : 64'h0    ;

wire [63:0] b4_mem_rddata0  ;
wire [63:0] b4_mem_rddata1  ;
wire [63:0] b5_mem_rddata0  ;
wire [63:0] b5_mem_rddata1  ;

reg  [6:0] b4_row_no         ;
reg  [6:0] b5_row_no         ;
reg  [6:0] b4_col_no         ;
reg  [6:0] b5_col_no         ;
reg  [6:0] b4_dep_no         ;
reg  [6:0] b5_dep_no         ;
wire b4_row_no_dim = b4_row_no==ROW_D-1;
wire b5_row_no_dim = b5_row_no==ROW_D-1;
wire b4_col_no_dim = b4_col_no==COL_D-1;
wire b5_col_no_dim = b5_col_no==COL_D-1;
wire b4_dep_no_dim = b4_dep_no==DEP_D-1;
wire b5_dep_no_dim = b5_dep_no==DEP_D-1;
wire [6:0] nxt_b4_row_no  = b4_row_no_dim ? 7'd0 :
                             b4_mem_wr|b4_mem_rd ? b4_row_no+7'd1 : b4_row_no       ;
wire [6:0] nxt_b5_row_no  = b5_row_no_dim ? 7'd0 :
	                     b5_mem_wr|b5_mem_rd ? b5_row_no+7'd1 : b5_row_no       ;
wire [6:0] nxt_b4_col_no  = b4_col_no_dim&b4_row_no_dim ? 7'd0 :
                         ((b4_mem_wr|b4_mem_rd)&b4_row_no_dim) ? b4_col_no+7'd1 : b4_col_no       ;
wire [6:0] nxt_b5_col_no  = b5_col_no_dim&b5_row_no_dim ? 7'd0 :
	                 ((b5_mem_wr|b5_mem_rd)&b5_row_no_dim) ? b5_col_no+7'd1 : b5_col_no       ;
wire [6:0] nxt_b4_dep_no  = b4_dep_no_dim&b4_col_no_dim&b4_row_no_dim ? 7'd0 :
                                       ((b4_mem_wr|b4_mem_rd)&b4_col_no_dim&b4_row_no_dim) ? b4_dep_no+7'd1 : b4_dep_no       ;
wire [6:0] nxt_b5_dep_no  = b5_dep_no_dim&b5_col_no_dim&b5_row_no_dim ? 7'd0 :
	                               ((b5_mem_wr|b5_mem_rd)&b5_col_no_dim&b5_row_no_dim) ? b5_dep_no+7'd1 : b5_dep_no      ;
always @(posedge clock) begin
  if(reset) begin
    b4_row_no<=7'd0           ;
    b5_row_no<=7'd0           ;
    b4_col_no<=7'd0           ;
    b5_col_no<=7'd0           ;
    b4_dep_no<=7'd0           ;
    b5_dep_no<=7'd0           ;
  end else begin
    b4_row_no<=nxt_b4_row_no;
    b5_row_no<=nxt_b5_row_no;
    b4_col_no<=nxt_b4_col_no;
    b5_col_no<=nxt_b5_col_no;
    b4_dep_no<=nxt_b4_dep_no;
    b5_dep_no<=nxt_b5_dep_no;
  end
end

buf_ctl b4_bfu_ctl (.clock            (clock      ),
                    .reset            (reset      ),
                    .mem_wr           (b4_mem_wr     ),
                    .mem_rd           (b4_mem_rd     ),
                    .row_no           (b4_row_no     ),
                    .col_no           (b4_col_no     ),
                    .dep_no           (b4_dep_no     ),
                    .mem_wrdata0      (b4_mem_wrdata0),
                    .mem_wrdata1      (b4_mem_wrdata1),
                    .mem_rddata0      (b4_mem_rddata0),
                    .mem_rddata1      (b4_mem_rddata1));

buf_ctl b5_bfu_ctl (.clock            (clock      ),
                    .reset            (reset      ),
                    .mem_wr           (b5_mem_wr     ),
                    .mem_rd           (b5_mem_rd     ),
                    .row_no           (b5_row_no   ),
                    .col_no           (b5_col_no   ),
                    .dep_no           (b5_dep_no   ),
                    .mem_wrdata0      (b5_mem_wrdata0),
                    .mem_wrdata1      (b5_mem_wrdata1),
                    .mem_rddata0      (b5_mem_rddata0),
                    .mem_rddata1      (b5_mem_rddata1));

// output validate
assign io_out_validate = st0_out_vld | st1_out_vld | st2_out_vld | st3_out_vld | st4_out_vld | st5_out_vld; 

wire st_0_2_4_out_vld = st0_out_vld | st2_out_vld | st4_out_vld ;
wire st_1_3_5_out_vld = st1_out_vld | st3_out_vld | st5_out_vld;
assign io_out_0_Re  = st_0_2_4_out_vld ? b4_mem_rddata0[63:32] : 
   	                                      st_1_3_5_out_vld ? b5_mem_rddata0[63:32] : 32'h0;
assign io_out_0_Im  = st_0_2_4_out_vld ? b4_mem_rddata0[31:0] : 
   	                                     st_1_3_5_out_vld ? b5_mem_rddata0[31:0]  : 32'h0;
assign io_out_1_Re  = st_0_2_4_out_vld ? b4_mem_rddata1[63:32] : 
   	                                      st_1_3_5_out_vld ? b5_mem_rddata1[63:32] : 32'h0;
assign io_out_1_Im  = st_0_2_4_out_vld ? b4_mem_rddata1[31:0] : 
   	                                     st_1_3_5_out_vld ? b5_mem_rddata1[31:0]  : 32'h0;

endmodule
