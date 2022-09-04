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
module thd_fft96_32_48(input         clock            ,
                       input         reset            ,
                       input  [31:0] io_in_0_Re       ,
                       input  [31:0] io_in_0_Im       ,
                       input  [31:0] io_in_1_Re       ,
                       input  [31:0] io_in_1_Im       ,
                       input  [31:0] io_in_2_Re       ,
                       input  [31:0] io_in_2_Im       ,
                       input  [31:0] io_in_3_Re       ,
                       input  [31:0] io_in_3_Im       ,
                       input  [31:0] io_in_4_Re       ,
                       input  [31:0] io_in_4_Im       ,
                       input  [31:0] io_in_5_Re       ,
                       input  [31:0] io_in_5_Im       ,
                       input  [31:0] io_in_6_Re       ,
                       input  [31:0] io_in_6_Im       ,
                       input  [31:0] io_in_7_Re       ,
                       input  [31:0] io_in_7_Im       ,
                       input  [31:0] io_in_8_Re       ,
                       input  [31:0] io_in_8_Im       ,
                       input  [31:0] io_in_9_Re       ,
                       input  [31:0] io_in_9_Im       ,
                       input  [31:0] io_in_10_Re      ,
                       input  [31:0] io_in_10_Im      ,
                       input  [31:0] io_in_11_Re      ,
                       input  [31:0] io_in_11_Im      ,
                       input  [31:0] io_in_12_Re      ,
                       input  [31:0] io_in_12_Im      ,
                       input  [31:0] io_in_13_Re      ,
                       input  [31:0] io_in_13_Im      ,
                       input  [31:0] io_in_14_Re      ,
                       input  [31:0] io_in_14_Im      ,
                       input  [31:0] io_in_15_Re      ,
                       input  [31:0] io_in_15_Im      ,
                       input  [31:0] io_in_16_Re      ,
                       input  [31:0] io_in_16_Im      ,
                       input  [31:0] io_in_17_Re      ,
                       input  [31:0] io_in_17_Im      ,
                       input  [31:0] io_in_18_Re      ,
                       input  [31:0] io_in_18_Im      ,
                       input  [31:0] io_in_19_Re      ,
                       input  [31:0] io_in_19_Im      ,
                       input  [31:0] io_in_20_Re      ,
                       input  [31:0] io_in_20_Im      ,
                       input  [31:0] io_in_21_Re      ,
                       input  [31:0] io_in_21_Im      ,
                       input  [31:0] io_in_22_Re      ,
                       input  [31:0] io_in_22_Im      ,
                       input  [31:0] io_in_23_Re      ,
                       input  [31:0] io_in_23_Im      ,
                       input  [31:0] io_in_24_Re      ,
                       input  [31:0] io_in_24_Im      ,
                       input  [31:0] io_in_25_Re      ,
                       input  [31:0] io_in_25_Im      ,
                       input  [31:0] io_in_26_Re      ,
                       input  [31:0] io_in_26_Im      ,
                       input  [31:0] io_in_27_Re      ,
                       input  [31:0] io_in_27_Im      ,
                       input  [31:0] io_in_28_Re      ,
                       input  [31:0] io_in_28_Im      ,
                       input  [31:0] io_in_29_Re      ,
                       input  [31:0] io_in_29_Im      ,
                       input  [31:0] io_in_30_Re      ,
                       input  [31:0] io_in_30_Im      ,
                       input  [31:0] io_in_31_Re      ,
                       input  [31:0] io_in_31_Im      ,
                       input         io_in_ready      ,
                       output        io_out_validate  ,
                       output [31:0] io_out_0_Re      ,
                       output [31:0] io_out_0_Im      ,
                       output [31:0] io_out_1_Re      ,
                       output [31:0] io_out_1_Im      ,   
                       output [31:0] io_out_2_Re      ,
                       output [31:0] io_out_2_Im      ,
                       output [31:0] io_out_3_Re      ,
                       output [31:0] io_out_3_Im      ,
                       output [31:0] io_out_4_Re      ,
                       output [31:0] io_out_4_Im      ,
                       output [31:0] io_out_5_Re      ,
                       output [31:0] io_out_5_Im      ,
                       output [31:0] io_out_6_Re      ,
                       output [31:0] io_out_6_Im      ,
                       output [31:0] io_out_7_Re      ,
                       output [31:0] io_out_7_Im      ,
                       output [31:0] io_out_8_Re      ,
                       output [31:0] io_out_8_Im      ,
                       output [31:0] io_out_9_Re      ,
                       output [31:0] io_out_9_Im      ,
                       output [31:0] io_out_10_Re     ,
                       output [31:0] io_out_10_Im     ,
                       output [31:0] io_out_11_Re     ,
                       output [31:0] io_out_11_Im     ,
                       output [31:0] io_out_12_Re     ,
                       output [31:0] io_out_12_Im     ,
                       output [31:0] io_out_13_Re     ,
                       output [31:0] io_out_13_Im     ,
                       output [31:0] io_out_14_Re     ,
                       output [31:0] io_out_14_Im     ,
                       output [31:0] io_out_15_Re     ,
                       output [31:0] io_out_15_Im     ,
                       output [31:0] io_out_16_Re     ,
                       output [31:0] io_out_16_Im     ,
                       output [31:0] io_out_17_Re     ,
                       output [31:0] io_out_17_Im     ,
                       output [31:0] io_out_18_Re     ,
                       output [31:0] io_out_18_Im     ,
                       output [31:0] io_out_19_Re     ,
                       output [31:0] io_out_19_Im     ,
                       output [31:0] io_out_20_Re     ,
                       output [31:0] io_out_20_Im     ,
                       output [31:0] io_out_21_Re     ,
                       output [31:0] io_out_21_Im     ,
                       output [31:0] io_out_22_Re     ,
                       output [31:0] io_out_22_Im     ,
                       output [31:0] io_out_23_Re     ,
                       output [31:0] io_out_23_Im     ,
                       output [31:0] io_out_24_Re     ,
                       output [31:0] io_out_24_Im     ,
                       output [31:0] io_out_25_Re     ,
                       output [31:0] io_out_25_Im     ,
                       output [31:0] io_out_26_Re     ,
                       output [31:0] io_out_26_Im     ,
                       output [31:0] io_out_27_Re     ,
                       output [31:0] io_out_27_Im     ,
                       output [31:0] io_out_28_Re     ,
                       output [31:0] io_out_28_Im     ,
                       output [31:0] io_out_29_Re     ,
                       output [31:0] io_out_29_Im     ,
                       output [31:0] io_out_30_Re     ,
                       output [31:0] io_out_30_Im     ,
                       output [31:0] io_out_31_Re     ,
                       output [31:0] io_out_31_Im     );

parameter ROW_D=96/32; //32 data in per cycle
parameter COL_D=96;   //96
parameter DEP_D=96;   //96

parameter RDY_CY=27648 ;            //ready signal on for 96x96x96/32 data input
parameter OD_FFT_CY=36;            //1d fft input-output delay

parameter OD_VLD_ST = OD_FFT_CY                ; //39
parameter OD_VLD_FN = OD_FFT_CY+RDY_CY         ; //27687
parameter TD_RDY_ST = OD_FFT_CY+RDY_CY         ; //27687
parameter TD_RDY_FN = OD_FFT_CY+2*RDY_CY       ; //55335
parameter TD_VLD_ST = 2*OD_FFT_CY+RDY_CY       ; //27726
parameter TD_VLD_FN = 2*OD_FFT_CY+2*RDY_CY     ; //55374

parameter THD_RDY_ST = 2*OD_FFT_CY+2*RDY_CY    ; //55374
parameter THD_RDY_FN = 2*OD_FFT_CY+3*RDY_CY    ; //83022
parameter THD_VLD_ST = 3*OD_FFT_CY+2*RDY_CY    ; //55413
parameter THD_VLD_FN = 3*OD_FFT_CY+3*RDY_CY    ; //83061
parameter OUT_VLD_ST = 3*OD_FFT_CY+3*RDY_CY    ; //83061
parameter OUT_VLD_FN = 3*OD_FFT_CY+4*RDY_CY    ; //110709
parameter COUNTER_FN = 5*RDY_CY                ; //5*27648=138,240

//**************************************************
//------------- FSM Controller ---------------------
//**************************************************
// |cnt: not 0; ~|cnt: all bits 0
reg  [19:0] cnt0, cnt1, cnt2, cnt3, cnt4, cnt5;
wire st0_rdy = io_in_ready & ((~|cnt0 & ~|cnt1 & ~|cnt2 & ~|cnt3 & ~|cnt4 & ~|cnt5) | (|cnt0 & cnt0<RDY_CY) | (~|cnt0 & cnt1==5*RDY_CY & cnt2==4*RDY_CY & cnt3==3*RDY_CY & cnt4==2*RDY_CY & cnt5==RDY_CY)) ; 
wire st1_rdy = io_in_ready & ((cnt0==RDY_CY & ~|cnt1 & ~|cnt2 & ~|cnt3 & ~|cnt4 & ~|cnt5) | (|cnt1 & cnt1<RDY_CY) | (cnt0==RDY_CY & ~|cnt1 & cnt2==5*RDY_CY & cnt3==4*RDY_CY & cnt4==3*RDY_CY & cnt5==2*RDY_CY)) ; 
wire st2_rdy = io_in_ready & ((cnt0==2*RDY_CY & cnt1==RDY_CY & ~|cnt2 & ~|cnt3 & ~|cnt4 & ~|cnt5) | (|cnt2 & cnt2<RDY_CY) | (cnt0==2*RDY_CY & cnt1==RDY_CY & ~|cnt2 & cnt3==5*RDY_CY & cnt4==4*RDY_CY & cnt5==3*RDY_CY)) ; 
wire st3_rdy = io_in_ready & ((cnt0==3*RDY_CY & cnt1==2*RDY_CY & cnt2==RDY_CY & ~|cnt3 & ~|cnt4 & ~|cnt5) | (|cnt3 & cnt3<RDY_CY) | (cnt0==3*RDY_CY & cnt1==2*RDY_CY & cnt2==RDY_CY & ~|cnt3 & cnt4==5*RDY_CY & cnt5==4*RDY_CY)) ; 
wire st4_rdy = io_in_ready & ((cnt0==4*RDY_CY & cnt1==3*RDY_CY & cnt2==2*RDY_CY & cnt3==RDY_CY & ~|cnt4 & ~|cnt5) | (|cnt4 & cnt4<RDY_CY) | (cnt0==4*RDY_CY & cnt1==3*RDY_CY & cnt2==2*RDY_CY & cnt3==RDY_CY & ~|cnt4 & cnt5==5*RDY_CY)) ; 
wire st5_rdy = io_in_ready & ((cnt0==5*RDY_CY & cnt1==4*RDY_CY & cnt2==3*RDY_CY & cnt3==2*RDY_CY & cnt4==RDY_CY & ~|cnt5) | (|cnt5 & cnt5<RDY_CY) ) ; 

wire cnt0_en = st0_rdy | (|cnt0 & (cnt0!=COUNTER_FN));
wire cnt1_en = st1_rdy | (|cnt1 & (cnt1!=COUNTER_FN));
wire cnt2_en = st2_rdy | (|cnt2 & (cnt2!=COUNTER_FN));
wire cnt3_en = st3_rdy | (|cnt3 & (cnt3!=COUNTER_FN));
wire cnt4_en = st4_rdy | (|cnt4 & (cnt4!=COUNTER_FN));
wire cnt5_en = st5_rdy | (|cnt5 & (cnt5!=COUNTER_FN));
wire [19:0] nxt_cnt0 = (cnt0==COUNTER_FN) ? 20'd0 : 
                                          cnt0_en ? (cnt0+20'd1) : cnt0;
wire [19:0] nxt_cnt1 = (cnt1==COUNTER_FN) ? 20'd0 :      
                                          cnt1_en ? (cnt1+20'd1) : cnt1;
wire [19:0] nxt_cnt2 = (cnt2==COUNTER_FN) ? 20'd0 :      
                                          cnt2_en ? (cnt2+20'd1) : cnt2;
wire [19:0] nxt_cnt3 = (cnt3==COUNTER_FN) ? 20'd0 :      
                                          cnt3_en ? (cnt3+20'd1) : cnt3;
wire [19:0] nxt_cnt4 = (cnt4==COUNTER_FN) ? 20'd0 :      
	                                  cnt4_en ? (cnt4+20'd1) : cnt4;
wire [19:0] nxt_cnt5 = (cnt5==COUNTER_FN) ? 20'd0 :      
	                                  cnt5_en ? (cnt5+20'd1) : cnt5;

always @(posedge clock) begin
  if(reset) begin
    cnt0<=20'd0    ;
    cnt1<=20'd0    ;
    cnt2<=20'd0    ;
    cnt3<=20'd0    ;
    cnt4<=20'd0    ;
    cnt5<=20'd0    ;
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
wire [31:0] ft_in_0_Re      = io_in_0_Re  ;
wire [31:0] ft_in_0_Im      = io_in_0_Im  ;
wire [31:0] ft_in_1_Re      = io_in_1_Re  ;
wire [31:0] ft_in_1_Im      = io_in_1_Im  ;
wire [31:0] ft_in_2_Re      = io_in_2_Re  ;
wire [31:0] ft_in_2_Im      = io_in_2_Im  ;
wire [31:0] ft_in_3_Re      = io_in_3_Re  ;
wire [31:0] ft_in_3_Im      = io_in_3_Im  ;
wire [31:0] ft_in_4_Re      = io_in_4_Re  ;
wire [31:0] ft_in_4_Im      = io_in_4_Im  ;
wire [31:0] ft_in_5_Re      = io_in_5_Re  ;
wire [31:0] ft_in_5_Im      = io_in_5_Im  ;
wire [31:0] ft_in_6_Re      = io_in_6_Re  ;
wire [31:0] ft_in_6_Im      = io_in_6_Im  ;
wire [31:0] ft_in_7_Re      = io_in_7_Re  ;
wire [31:0] ft_in_7_Im      = io_in_7_Im  ;
wire [31:0] ft_in_8_Re      = io_in_8_Re  ;
wire [31:0] ft_in_8_Im      = io_in_8_Im  ;
wire [31:0] ft_in_9_Re      = io_in_9_Re  ;
wire [31:0] ft_in_9_Im      = io_in_9_Im  ;
wire [31:0] ft_in_10_Re     = io_in_10_Re ;
wire [31:0] ft_in_10_Im     = io_in_10_Im ;
wire [31:0] ft_in_11_Re     = io_in_11_Re ;
wire [31:0] ft_in_11_Im     = io_in_11_Im ;
wire [31:0] ft_in_12_Re     = io_in_12_Re ;
wire [31:0] ft_in_12_Im     = io_in_12_Im ;
wire [31:0] ft_in_13_Re     = io_in_13_Re ;
wire [31:0] ft_in_13_Im     = io_in_13_Im ;
wire [31:0] ft_in_14_Re     = io_in_14_Re ;
wire [31:0] ft_in_14_Im     = io_in_14_Im ;
wire [31:0] ft_in_15_Re     = io_in_15_Re ;
wire [31:0] ft_in_15_Im     = io_in_15_Im ;
wire [31:0] ft_in_16_Re     = io_in_16_Re ;
wire [31:0] ft_in_16_Im     = io_in_16_Im ;
wire [31:0] ft_in_17_Re     = io_in_17_Re ;
wire [31:0] ft_in_17_Im     = io_in_17_Im ;
wire [31:0] ft_in_18_Re     = io_in_18_Re ;
wire [31:0] ft_in_18_Im     = io_in_18_Im ;
wire [31:0] ft_in_19_Re     = io_in_19_Re ;
wire [31:0] ft_in_19_Im     = io_in_19_Im ;
wire [31:0] ft_in_20_Re     = io_in_20_Re ;
wire [31:0] ft_in_20_Im     = io_in_20_Im ;
wire [31:0] ft_in_21_Re     = io_in_21_Re ;
wire [31:0] ft_in_21_Im     = io_in_21_Im ;
wire [31:0] ft_in_22_Re     = io_in_22_Re ;
wire [31:0] ft_in_22_Im     = io_in_22_Im ;
wire [31:0] ft_in_23_Re     = io_in_23_Re ;
wire [31:0] ft_in_23_Im     = io_in_23_Im ;
wire [31:0] ft_in_24_Re     = io_in_24_Re ;
wire [31:0] ft_in_24_Im     = io_in_24_Im ;
wire [31:0] ft_in_25_Re     = io_in_25_Re ;
wire [31:0] ft_in_25_Im     = io_in_25_Im ;
wire [31:0] ft_in_26_Re     = io_in_26_Re ;
wire [31:0] ft_in_26_Im     = io_in_26_Im ;
wire [31:0] ft_in_27_Re     = io_in_27_Re ;
wire [31:0] ft_in_27_Im     = io_in_27_Im ;
wire [31:0] ft_in_28_Re     = io_in_28_Re ;
wire [31:0] ft_in_28_Im     = io_in_28_Im ;
wire [31:0] ft_in_29_Re     = io_in_29_Re ;
wire [31:0] ft_in_29_Im     = io_in_29_Im ;
wire [31:0] ft_in_30_Re     = io_in_30_Re ;
wire [31:0] ft_in_30_Im     = io_in_30_Im ;
wire [31:0] ft_in_31_Re     = io_in_31_Re ;
wire [31:0] ft_in_31_Im     = io_in_31_Im ;

wire        ft_in_ready     = io_in_ready;

wire        ft_out_validate ;
wire [31:0] ft_out_0_Re     ;
wire [31:0] ft_out_0_Im     ;
wire [31:0] ft_out_1_Re     ;
wire [31:0] ft_out_1_Im     ;
wire [31:0] ft_out_2_Re     ;
wire [31:0] ft_out_2_Im     ;
wire [31:0] ft_out_3_Re     ;
wire [31:0] ft_out_3_Im     ;
wire [31:0] ft_out_4_Re     ;
wire [31:0] ft_out_4_Im     ;
wire [31:0] ft_out_5_Re     ;
wire [31:0] ft_out_5_Im     ;
wire [31:0] ft_out_6_Re     ;
wire [31:0] ft_out_6_Im     ;
wire [31:0] ft_out_7_Re     ;
wire [31:0] ft_out_7_Im     ;
wire [31:0] ft_out_8_Re     ;
wire [31:0] ft_out_8_Im     ;
wire [31:0] ft_out_9_Re     ;
wire [31:0] ft_out_9_Im     ;
wire [31:0] ft_out_10_Re    ;
wire [31:0] ft_out_10_Im    ;
wire [31:0] ft_out_11_Re    ;
wire [31:0] ft_out_11_Im    ;
wire [31:0] ft_out_12_Re    ;
wire [31:0] ft_out_12_Im    ;
wire [31:0] ft_out_13_Re    ;
wire [31:0] ft_out_13_Im    ;
wire [31:0] ft_out_14_Re    ;
wire [31:0] ft_out_14_Im    ;
wire [31:0] ft_out_15_Re    ;
wire [31:0] ft_out_15_Im    ;
wire [31:0] ft_out_16_Re    ;
wire [31:0] ft_out_16_Im    ;
wire [31:0] ft_out_17_Re    ;
wire [31:0] ft_out_17_Im    ;
wire [31:0] ft_out_18_Re    ;
wire [31:0] ft_out_18_Im    ;
wire [31:0] ft_out_19_Re    ;
wire [31:0] ft_out_19_Im    ;
wire [31:0] ft_out_20_Re    ;
wire [31:0] ft_out_20_Im    ;
wire [31:0] ft_out_21_Re    ;
wire [31:0] ft_out_21_Im    ;
wire [31:0] ft_out_22_Re    ;
wire [31:0] ft_out_22_Im    ;
wire [31:0] ft_out_23_Re    ;
wire [31:0] ft_out_23_Im    ;
wire [31:0] ft_out_24_Re    ;
wire [31:0] ft_out_24_Im    ;
wire [31:0] ft_out_25_Re    ;
wire [31:0] ft_out_25_Im    ;
wire [31:0] ft_out_26_Re    ;
wire [31:0] ft_out_26_Im    ;
wire [31:0] ft_out_27_Re    ;
wire [31:0] ft_out_27_Im    ;
wire [31:0] ft_out_28_Re    ;
wire [31:0] ft_out_28_Im    ;
wire [31:0] ft_out_29_Re    ;
wire [31:0] ft_out_29_Im    ;
wire [31:0] ft_out_30_Re    ;
wire [31:0] ft_out_30_Im    ;
wire [31:0] ft_out_31_Re    ;
wire [31:0] ft_out_31_Im    ;

od_fft96_32_48 ft_od_fft96_32_48 (
                              .clock           (clock          ) ,
                              .reset           (reset          ) ,
                              .io_in_0_Re      (ft_in_0_Re     ) ,
                              .io_in_0_Im      (ft_in_0_Im     ) ,
                              .io_in_1_Re      (ft_in_1_Re     ) ,
                              .io_in_1_Im      (ft_in_1_Im     ) ,
                              .io_in_2_Re      (ft_in_2_Re     ) ,
                              .io_in_2_Im      (ft_in_2_Im     ) ,
                              .io_in_3_Re      (ft_in_3_Re     ) ,
                              .io_in_3_Im      (ft_in_3_Im     ) ,
                              .io_in_4_Re      (ft_in_4_Re     ) ,
                              .io_in_4_Im      (ft_in_4_Im     ) ,
                              .io_in_5_Re      (ft_in_5_Re     ) ,
                              .io_in_5_Im      (ft_in_5_Im     ) ,
                              .io_in_6_Re      (ft_in_6_Re     ) ,
                              .io_in_6_Im      (ft_in_6_Im     ) ,
                              .io_in_7_Re      (ft_in_7_Re     ) ,
                              .io_in_7_Im      (ft_in_7_Im     ) ,
                              .io_in_8_Re      (ft_in_8_Re     ) ,
                              .io_in_8_Im      (ft_in_8_Im     ) ,
                              .io_in_9_Re      (ft_in_9_Re     ) ,
                              .io_in_9_Im      (ft_in_9_Im     ) ,
                              .io_in_10_Re     (ft_in_10_Re    ) ,
                              .io_in_10_Im     (ft_in_10_Im    ) ,
                              .io_in_11_Re     (ft_in_11_Re    ) ,
                              .io_in_11_Im     (ft_in_11_Im    ) ,
                              .io_in_12_Re     (ft_in_12_Re    ) ,
                              .io_in_12_Im     (ft_in_12_Im    ) ,
                              .io_in_13_Re     (ft_in_13_Re    ) ,
                              .io_in_13_Im     (ft_in_13_Im    ) ,
                              .io_in_14_Re     (ft_in_14_Re    ) ,
                              .io_in_14_Im     (ft_in_14_Im    ) ,
                              .io_in_15_Re     (ft_in_15_Re    ) ,
                              .io_in_15_Im     (ft_in_15_Im    ) ,
                              .io_in_16_Re     (ft_in_16_Re    ) ,
                              .io_in_16_Im     (ft_in_16_Im    ) ,
                              .io_in_17_Re     (ft_in_17_Re    ) ,
                              .io_in_17_Im     (ft_in_17_Im    ) ,
                              .io_in_18_Re     (ft_in_18_Re    ) ,
                              .io_in_18_Im     (ft_in_18_Im    ) ,
                              .io_in_19_Re     (ft_in_19_Re    ) ,
                              .io_in_19_Im     (ft_in_19_Im    ) ,
                              .io_in_20_Re     (ft_in_20_Re    ) ,
                              .io_in_20_Im     (ft_in_20_Im    ) ,
                              .io_in_21_Re     (ft_in_21_Re    ) ,
                              .io_in_21_Im     (ft_in_21_Im    ) ,
                              .io_in_22_Re     (ft_in_22_Re    ) ,
                              .io_in_22_Im     (ft_in_22_Im    ) ,
                              .io_in_23_Re     (ft_in_23_Re    ) ,
                              .io_in_23_Im     (ft_in_23_Im    ) ,
                              .io_in_24_Re     (ft_in_24_Re    ) ,
                              .io_in_24_Im     (ft_in_24_Im    ) ,
                              .io_in_25_Re     (ft_in_25_Re    ) ,
                              .io_in_25_Im     (ft_in_25_Im    ) ,
                              .io_in_26_Re     (ft_in_26_Re    ) ,
                              .io_in_26_Im     (ft_in_26_Im    ) ,
                              .io_in_27_Re     (ft_in_27_Re    ) ,
                              .io_in_27_Im     (ft_in_27_Im    ) ,
                              .io_in_28_Re     (ft_in_28_Re    ) ,
                              .io_in_28_Im     (ft_in_28_Im    ) ,
                              .io_in_29_Re     (ft_in_29_Re    ) ,
                              .io_in_29_Im     (ft_in_29_Im    ) ,
                              .io_in_30_Re     (ft_in_30_Re    ) ,
                              .io_in_30_Im     (ft_in_30_Im    ) ,
                              .io_in_31_Re     (ft_in_31_Re    ) ,
                              .io_in_31_Im     (ft_in_31_Im    ) ,
                              .io_in_ready     (ft_in_ready    ) ,
                              .io_out_validate (ft_out_validate) ,
                              .io_out_0_Re     (ft_out_0_Re    ) ,
                              .io_out_0_Im     (ft_out_0_Im    ) ,
                              .io_out_1_Re     (ft_out_1_Re    ) ,
                              .io_out_1_Im     (ft_out_1_Im    ) ,
                              .io_out_2_Re     (ft_out_2_Re    ) ,
                              .io_out_2_Im     (ft_out_2_Im    ) ,
                              .io_out_3_Re     (ft_out_3_Re    ) ,
                              .io_out_3_Im     (ft_out_3_Im    ) ,
                              .io_out_4_Re     (ft_out_4_Re    ) ,
                              .io_out_4_Im     (ft_out_4_Im    ) ,
                              .io_out_5_Re     (ft_out_5_Re    ) ,
                              .io_out_5_Im     (ft_out_5_Im    ) ,
                              .io_out_6_Re     (ft_out_6_Re    ) ,
                              .io_out_6_Im     (ft_out_6_Im    ) ,
                              .io_out_7_Re     (ft_out_7_Re    ) ,
                              .io_out_7_Im     (ft_out_7_Im    ) ,
                              .io_out_8_Re     (ft_out_8_Re    ) ,
                              .io_out_8_Im     (ft_out_8_Im    ) ,
                              .io_out_9_Re     (ft_out_9_Re    ) ,
                              .io_out_9_Im     (ft_out_9_Im    ) ,
                              .io_out_10_Re    (ft_out_10_Re   ) ,
                              .io_out_10_Im    (ft_out_10_Im   ) ,
                              .io_out_11_Re    (ft_out_11_Re   ) ,
                              .io_out_11_Im    (ft_out_11_Im   ) ,
                              .io_out_12_Re    (ft_out_12_Re   ) ,
                              .io_out_12_Im    (ft_out_12_Im   ) ,
                              .io_out_13_Re    (ft_out_13_Re   ) ,
                              .io_out_13_Im    (ft_out_13_Im   ) ,
                              .io_out_14_Re    (ft_out_14_Re   ) ,
                              .io_out_14_Im    (ft_out_14_Im   ) ,
                              .io_out_15_Re    (ft_out_15_Re   ) ,
                              .io_out_15_Im    (ft_out_15_Im   ) ,
                              .io_out_16_Re    (ft_out_16_Re   ) ,
                              .io_out_16_Im    (ft_out_16_Im   ) ,
                              .io_out_17_Re    (ft_out_17_Re   ) ,
                              .io_out_17_Im    (ft_out_17_Im   ) ,
                              .io_out_18_Re    (ft_out_18_Re   ) ,
                              .io_out_18_Im    (ft_out_18_Im   ) ,
                              .io_out_19_Re    (ft_out_19_Re   ) ,
                              .io_out_19_Im    (ft_out_19_Im   ) ,
                              .io_out_20_Re    (ft_out_20_Re   ) ,
                              .io_out_20_Im    (ft_out_20_Im   ) ,
                              .io_out_21_Re    (ft_out_21_Re   ) ,
                              .io_out_21_Im    (ft_out_21_Im   ) ,
                              .io_out_22_Re    (ft_out_22_Re   ) ,
                              .io_out_22_Im    (ft_out_22_Im   ) ,
                              .io_out_23_Re    (ft_out_23_Re   ) ,
                              .io_out_23_Im    (ft_out_23_Im   ) ,
                              .io_out_24_Re    (ft_out_24_Re   ) ,
                              .io_out_24_Im    (ft_out_24_Im   ) ,
                              .io_out_25_Re    (ft_out_25_Re   ) ,
                              .io_out_25_Im    (ft_out_25_Im   ) ,
                              .io_out_26_Re    (ft_out_26_Re   ) ,
                              .io_out_26_Im    (ft_out_26_Im   ) ,
                              .io_out_27_Re    (ft_out_27_Re   ) ,
                              .io_out_27_Im    (ft_out_27_Im   ) ,
                              .io_out_28_Re    (ft_out_28_Re   ) ,
                              .io_out_28_Im    (ft_out_28_Im   ) ,
                              .io_out_29_Re    (ft_out_29_Re   ) ,
                              .io_out_29_Im    (ft_out_29_Im   ) ,
                              .io_out_30_Re    (ft_out_30_Re   ) ,
                              .io_out_30_Im    (ft_out_30_Im   ) ,
                              .io_out_31_Re    (ft_out_31_Re   ) ,
                              .io_out_31_Im    (ft_out_31_Im   ) 
                             );

// First Ping-Pong Buffer
wire b0_mem_wr = st0_od_vld | st2_od_vld | st4_od_vld;
wire b1_mem_wr = st1_od_vld | st3_od_vld | st5_od_vld;
wire b0_mem_rd = st0_td_rdy | st2_td_rdy | st4_td_rdy;
wire b1_mem_rd = st1_td_rdy | st3_td_rdy | st5_td_rdy;

wire [63:0] b0_mem_wrdata0   = b0_mem_wr ? {ft_out_0_Re, ft_out_0_Im}   : 64'h0    ;
wire [63:0] b0_mem_wrdata1   = b0_mem_wr ? {ft_out_1_Re, ft_out_1_Im}   : 64'h0    ;
wire [63:0] b0_mem_wrdata2   = b0_mem_wr ? {ft_out_2_Re, ft_out_2_Im}   : 64'h0    ;
wire [63:0] b0_mem_wrdata3   = b0_mem_wr ? {ft_out_3_Re, ft_out_3_Im}   : 64'h0    ;
wire [63:0] b0_mem_wrdata4   = b0_mem_wr ? {ft_out_4_Re, ft_out_4_Im}   : 64'h0    ;
wire [63:0] b0_mem_wrdata5   = b0_mem_wr ? {ft_out_5_Re, ft_out_5_Im}   : 64'h0    ;
wire [63:0] b0_mem_wrdata6   = b0_mem_wr ? {ft_out_6_Re, ft_out_6_Im}   : 64'h0    ;
wire [63:0] b0_mem_wrdata7   = b0_mem_wr ? {ft_out_7_Re, ft_out_7_Im}   : 64'h0    ;
wire [63:0] b0_mem_wrdata8   = b0_mem_wr ? {ft_out_8_Re, ft_out_8_Im}   : 64'h0    ;
wire [63:0] b0_mem_wrdata9   = b0_mem_wr ? {ft_out_9_Re, ft_out_9_Im}   : 64'h0    ;
wire [63:0] b0_mem_wrdata10  = b0_mem_wr ? {ft_out_10_Re, ft_out_10_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata11  = b0_mem_wr ? {ft_out_11_Re, ft_out_11_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata12  = b0_mem_wr ? {ft_out_12_Re, ft_out_12_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata13  = b0_mem_wr ? {ft_out_13_Re, ft_out_13_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata14  = b0_mem_wr ? {ft_out_14_Re, ft_out_14_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata15  = b0_mem_wr ? {ft_out_15_Re, ft_out_15_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata16  = b0_mem_wr ? {ft_out_16_Re, ft_out_16_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata17  = b0_mem_wr ? {ft_out_17_Re, ft_out_17_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata18  = b0_mem_wr ? {ft_out_18_Re, ft_out_18_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata19  = b0_mem_wr ? {ft_out_19_Re, ft_out_19_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata20  = b0_mem_wr ? {ft_out_20_Re, ft_out_20_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata21  = b0_mem_wr ? {ft_out_21_Re, ft_out_21_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata22  = b0_mem_wr ? {ft_out_22_Re, ft_out_22_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata23  = b0_mem_wr ? {ft_out_23_Re, ft_out_23_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata24  = b0_mem_wr ? {ft_out_24_Re, ft_out_24_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata25  = b0_mem_wr ? {ft_out_25_Re, ft_out_25_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata26  = b0_mem_wr ? {ft_out_26_Re, ft_out_26_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata27  = b0_mem_wr ? {ft_out_27_Re, ft_out_27_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata28  = b0_mem_wr ? {ft_out_28_Re, ft_out_28_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata29  = b0_mem_wr ? {ft_out_29_Re, ft_out_29_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata30  = b0_mem_wr ? {ft_out_30_Re, ft_out_30_Im} : 64'h0    ;
wire [63:0] b0_mem_wrdata31  = b0_mem_wr ? {ft_out_31_Re, ft_out_31_Im} : 64'h0    ;

wire [63:0] b1_mem_wrdata0   = b1_mem_wr ? {ft_out_0_Re, ft_out_0_Im}   : 64'h0    ;
wire [63:0] b1_mem_wrdata1   = b1_mem_wr ? {ft_out_1_Re, ft_out_1_Im}   : 64'h0    ;
wire [63:0] b1_mem_wrdata2   = b1_mem_wr ? {ft_out_2_Re, ft_out_2_Im}   : 64'h0    ;
wire [63:0] b1_mem_wrdata3   = b1_mem_wr ? {ft_out_3_Re, ft_out_3_Im}   : 64'h0    ;
wire [63:0] b1_mem_wrdata4   = b1_mem_wr ? {ft_out_4_Re, ft_out_4_Im}   : 64'h0    ;
wire [63:0] b1_mem_wrdata5   = b1_mem_wr ? {ft_out_5_Re, ft_out_5_Im}   : 64'h0    ;
wire [63:0] b1_mem_wrdata6   = b1_mem_wr ? {ft_out_6_Re, ft_out_6_Im}   : 64'h0    ;
wire [63:0] b1_mem_wrdata7   = b1_mem_wr ? {ft_out_7_Re, ft_out_7_Im}   : 64'h0    ;
wire [63:0] b1_mem_wrdata8   = b1_mem_wr ? {ft_out_8_Re, ft_out_8_Im}   : 64'h0    ;
wire [63:0] b1_mem_wrdata9   = b1_mem_wr ? {ft_out_9_Re, ft_out_9_Im}   : 64'h0    ;
wire [63:0] b1_mem_wrdata10  = b1_mem_wr ? {ft_out_10_Re, ft_out_10_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata11  = b1_mem_wr ? {ft_out_11_Re, ft_out_11_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata12  = b1_mem_wr ? {ft_out_12_Re, ft_out_12_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata13  = b1_mem_wr ? {ft_out_13_Re, ft_out_13_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata14  = b1_mem_wr ? {ft_out_14_Re, ft_out_14_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata15  = b1_mem_wr ? {ft_out_15_Re, ft_out_15_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata16  = b1_mem_wr ? {ft_out_16_Re, ft_out_16_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata17  = b1_mem_wr ? {ft_out_17_Re, ft_out_17_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata18  = b1_mem_wr ? {ft_out_18_Re, ft_out_18_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata19  = b1_mem_wr ? {ft_out_19_Re, ft_out_19_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata20  = b1_mem_wr ? {ft_out_20_Re, ft_out_20_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata21  = b1_mem_wr ? {ft_out_21_Re, ft_out_21_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata22  = b1_mem_wr ? {ft_out_22_Re, ft_out_22_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata23  = b1_mem_wr ? {ft_out_23_Re, ft_out_23_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata24  = b1_mem_wr ? {ft_out_24_Re, ft_out_24_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata25  = b1_mem_wr ? {ft_out_25_Re, ft_out_25_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata26  = b1_mem_wr ? {ft_out_26_Re, ft_out_26_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata27  = b1_mem_wr ? {ft_out_27_Re, ft_out_27_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata28  = b1_mem_wr ? {ft_out_28_Re, ft_out_28_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata29  = b1_mem_wr ? {ft_out_29_Re, ft_out_29_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata30  = b1_mem_wr ? {ft_out_30_Re, ft_out_30_Im} : 64'h0    ;
wire [63:0] b1_mem_wrdata31  = b1_mem_wr ? {ft_out_31_Re, ft_out_31_Im} : 64'h0    ;

wire [63:0] b0_mem_rddata0  ;
wire [63:0] b0_mem_rddata1  ;
wire [63:0] b0_mem_rddata2  ;
wire [63:0] b0_mem_rddata3  ;
wire [63:0] b0_mem_rddata4  ;
wire [63:0] b0_mem_rddata5  ;
wire [63:0] b0_mem_rddata6  ;
wire [63:0] b0_mem_rddata7  ;
wire [63:0] b0_mem_rddata8  ;
wire [63:0] b0_mem_rddata9  ;
wire [63:0] b0_mem_rddata10 ;
wire [63:0] b0_mem_rddata11 ;
wire [63:0] b0_mem_rddata12 ;
wire [63:0] b0_mem_rddata13 ;
wire [63:0] b0_mem_rddata14 ;
wire [63:0] b0_mem_rddata15 ;
wire [63:0] b0_mem_rddata16 ;
wire [63:0] b0_mem_rddata17 ;
wire [63:0] b0_mem_rddata18 ;
wire [63:0] b0_mem_rddata19 ;
wire [63:0] b0_mem_rddata20 ;
wire [63:0] b0_mem_rddata21 ;
wire [63:0] b0_mem_rddata22 ;
wire [63:0] b0_mem_rddata23 ;
wire [63:0] b0_mem_rddata24 ;
wire [63:0] b0_mem_rddata25 ;
wire [63:0] b0_mem_rddata26 ;
wire [63:0] b0_mem_rddata27 ;
wire [63:0] b0_mem_rddata28 ;
wire [63:0] b0_mem_rddata29 ;
wire [63:0] b0_mem_rddata30 ;
wire [63:0] b0_mem_rddata31 ;
wire [63:0] b1_mem_rddata0  ;
wire [63:0] b1_mem_rddata1  ;
wire [63:0] b1_mem_rddata2  ;
wire [63:0] b1_mem_rddata3  ;
wire [63:0] b1_mem_rddata4  ;
wire [63:0] b1_mem_rddata5  ;
wire [63:0] b1_mem_rddata6  ;
wire [63:0] b1_mem_rddata7  ;
wire [63:0] b1_mem_rddata8  ;
wire [63:0] b1_mem_rddata9  ;
wire [63:0] b1_mem_rddata10 ;
wire [63:0] b1_mem_rddata11 ;
wire [63:0] b1_mem_rddata12 ;
wire [63:0] b1_mem_rddata13 ;
wire [63:0] b1_mem_rddata14 ;
wire [63:0] b1_mem_rddata15 ;
wire [63:0] b1_mem_rddata16 ;
wire [63:0] b1_mem_rddata17 ;
wire [63:0] b1_mem_rddata18 ;
wire [63:0] b1_mem_rddata19 ;
wire [63:0] b1_mem_rddata20 ;
wire [63:0] b1_mem_rddata21 ;
wire [63:0] b1_mem_rddata22 ;
wire [63:0] b1_mem_rddata23 ;
wire [63:0] b1_mem_rddata24 ;
wire [63:0] b1_mem_rddata25 ;
wire [63:0] b1_mem_rddata26 ;
wire [63:0] b1_mem_rddata27 ;
wire [63:0] b1_mem_rddata28 ;
wire [63:0] b1_mem_rddata29 ;
wire [63:0] b1_mem_rddata30 ;
wire [63:0] b1_mem_rddata31 ;

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


buf_ctl b0_bfu_ctl (.clock            (clock          ),
                    .reset            (reset          ),
                    .mem_wr           (b0_mem_wr      ),
                    .mem_rd           (b0_mem_rd      ),
                    .row_no           (b0_row_no      ),
                    .col_no           (b0_col_no      ),
                    .dep_no           (b0_dep_no      ),
                    .mem_wrdata0      (b0_mem_wrdata0 ),
                    .mem_wrdata1      (b0_mem_wrdata1 ),
                    .mem_wrdata2      (b0_mem_wrdata2 ),
                    .mem_wrdata3      (b0_mem_wrdata3 ),
                    .mem_wrdata4      (b0_mem_wrdata4 ),
                    .mem_wrdata5      (b0_mem_wrdata5 ),
                    .mem_wrdata6      (b0_mem_wrdata6 ),
                    .mem_wrdata7      (b0_mem_wrdata7 ),
                    .mem_wrdata8      (b0_mem_wrdata8 ),
                    .mem_wrdata9      (b0_mem_wrdata9 ),
                    .mem_wrdata10     (b0_mem_wrdata10),
                    .mem_wrdata11     (b0_mem_wrdata11),
                    .mem_wrdata12     (b0_mem_wrdata12),
                    .mem_wrdata13     (b0_mem_wrdata13),
                    .mem_wrdata14     (b0_mem_wrdata14),
                    .mem_wrdata15     (b0_mem_wrdata15),
                    .mem_wrdata16     (b0_mem_wrdata16),
                    .mem_wrdata17     (b0_mem_wrdata17),
                    .mem_wrdata18     (b0_mem_wrdata18),
                    .mem_wrdata19     (b0_mem_wrdata19),
                    .mem_wrdata20     (b0_mem_wrdata20),
                    .mem_wrdata21     (b0_mem_wrdata21),
                    .mem_wrdata22     (b0_mem_wrdata22),
                    .mem_wrdata23     (b0_mem_wrdata23),
                    .mem_wrdata24     (b0_mem_wrdata24),
                    .mem_wrdata25     (b0_mem_wrdata25),
                    .mem_wrdata26     (b0_mem_wrdata26),
                    .mem_wrdata27     (b0_mem_wrdata27),
                    .mem_wrdata28     (b0_mem_wrdata28),
                    .mem_wrdata29     (b0_mem_wrdata29),
                    .mem_wrdata30     (b0_mem_wrdata30),
                    .mem_wrdata31     (b0_mem_wrdata31),
                    .mem_rddata0      (b0_mem_rddata0 ),
                    .mem_rddata1      (b0_mem_rddata1 ),
                    .mem_rddata2      (b0_mem_rddata2 ),
                    .mem_rddata3      (b0_mem_rddata3 ),
                    .mem_rddata4      (b0_mem_rddata4 ),
                    .mem_rddata5      (b0_mem_rddata5 ),
                    .mem_rddata6      (b0_mem_rddata6 ),
                    .mem_rddata7      (b0_mem_rddata7 ),
                    .mem_rddata8      (b0_mem_rddata8 ),
                    .mem_rddata9      (b0_mem_rddata9 ),
                    .mem_rddata10     (b0_mem_rddata10),
                    .mem_rddata11     (b0_mem_rddata11),
                    .mem_rddata12     (b0_mem_rddata12),
                    .mem_rddata13     (b0_mem_rddata13),
                    .mem_rddata14     (b0_mem_rddata14),
                    .mem_rddata15     (b0_mem_rddata15),
                    .mem_rddata16     (b0_mem_rddata16),
                    .mem_rddata17     (b0_mem_rddata17),
                    .mem_rddata18     (b0_mem_rddata18),
                    .mem_rddata19     (b0_mem_rddata19),
                    .mem_rddata20     (b0_mem_rddata20),
                    .mem_rddata21     (b0_mem_rddata21),
                    .mem_rddata22     (b0_mem_rddata22),
                    .mem_rddata23     (b0_mem_rddata23),
                    .mem_rddata24     (b0_mem_rddata24),
                    .mem_rddata25     (b0_mem_rddata25),
                    .mem_rddata26     (b0_mem_rddata26),
                    .mem_rddata27     (b0_mem_rddata27),
                    .mem_rddata28     (b0_mem_rddata28),
                    .mem_rddata29     (b0_mem_rddata29),
                    .mem_rddata30     (b0_mem_rddata30),
                    .mem_rddata31     (b0_mem_rddata31));

buf_ctl b1_bfu_ctl (.clock            (clock         ),
                    .reset            (reset         ),
                    .mem_wr           (b1_mem_wr     ),
                    .mem_rd           (b1_mem_rd     ),
                    .row_no           (b1_row_no   ),
                    .col_no           (b1_col_no     ),
                    .dep_no           (b1_dep_no     ),
                    .mem_wrdata0      (b1_mem_wrdata0),
                    .mem_wrdata1      (b1_mem_wrdata1),
                    .mem_wrdata2      (b1_mem_wrdata2 ),
                    .mem_wrdata3      (b1_mem_wrdata3 ),
                    .mem_wrdata4      (b1_mem_wrdata4 ),
                    .mem_wrdata5      (b1_mem_wrdata5 ),
                    .mem_wrdata6      (b1_mem_wrdata6 ),
                    .mem_wrdata7      (b1_mem_wrdata7 ),
                    .mem_wrdata8      (b1_mem_wrdata8 ),
                    .mem_wrdata9      (b1_mem_wrdata9 ),
                    .mem_wrdata10     (b1_mem_wrdata10),
                    .mem_wrdata11     (b1_mem_wrdata11),
                    .mem_wrdata12     (b1_mem_wrdata12),
                    .mem_wrdata13     (b1_mem_wrdata13),
                    .mem_wrdata14     (b1_mem_wrdata14),
                    .mem_wrdata15     (b1_mem_wrdata15),
                    .mem_wrdata16     (b1_mem_wrdata16),
                    .mem_wrdata17     (b1_mem_wrdata17),
                    .mem_wrdata18     (b1_mem_wrdata18),
                    .mem_wrdata19     (b1_mem_wrdata19),
                    .mem_wrdata20     (b1_mem_wrdata20),
                    .mem_wrdata21     (b1_mem_wrdata21),
                    .mem_wrdata22     (b1_mem_wrdata22),
                    .mem_wrdata23     (b1_mem_wrdata23),
                    .mem_wrdata24     (b1_mem_wrdata24),
                    .mem_wrdata25     (b1_mem_wrdata25),
                    .mem_wrdata26     (b1_mem_wrdata26),
                    .mem_wrdata27     (b1_mem_wrdata27),
                    .mem_wrdata28     (b1_mem_wrdata28),
                    .mem_wrdata29     (b1_mem_wrdata29),
                    .mem_wrdata30     (b1_mem_wrdata30),
                    .mem_wrdata31     (b1_mem_wrdata31),
                    .mem_rddata0      (b1_mem_rddata0 ),
                    .mem_rddata1      (b1_mem_rddata1 ),
                    .mem_rddata2      (b1_mem_rddata2 ),
                    .mem_rddata3      (b1_mem_rddata3 ),
                    .mem_rddata4      (b1_mem_rddata4 ),
                    .mem_rddata5      (b1_mem_rddata5 ),
                    .mem_rddata6      (b1_mem_rddata6 ),
                    .mem_rddata7      (b1_mem_rddata7 ),
                    .mem_rddata8      (b1_mem_rddata8 ),
                    .mem_rddata9      (b1_mem_rddata9 ),
                    .mem_rddata10     (b1_mem_rddata10),
                    .mem_rddata11     (b1_mem_rddata11),
                    .mem_rddata12     (b1_mem_rddata12),
                    .mem_rddata13     (b1_mem_rddata13),
                    .mem_rddata14     (b1_mem_rddata14),
                    .mem_rddata15     (b1_mem_rddata15),
                    .mem_rddata16     (b1_mem_rddata16),
                    .mem_rddata17     (b1_mem_rddata17),
                    .mem_rddata18     (b1_mem_rddata18),
                    .mem_rddata19     (b1_mem_rddata19),
                    .mem_rddata20     (b1_mem_rddata20),
                    .mem_rddata21     (b1_mem_rddata21),
                    .mem_rddata22     (b1_mem_rddata22),
                    .mem_rddata23     (b1_mem_rddata23),
                    .mem_rddata24     (b1_mem_rddata24),
                    .mem_rddata25     (b1_mem_rddata25),
                    .mem_rddata26     (b1_mem_rddata26),
                    .mem_rddata27     (b1_mem_rddata27),
                    .mem_rddata28     (b1_mem_rddata28),
                    .mem_rddata29     (b1_mem_rddata29),
                    .mem_rddata30     (b1_mem_rddata30),
                    .mem_rddata31     (b1_mem_rddata31));

// Second One-Dimensional FFT96
wire st_0_2_4_td_rdy = st0_td_rdy | st2_td_rdy | st4_td_rdy;
wire st_1_3_5_td_rdy = st1_td_rdy | st3_td_rdy | st5_td_rdy;
wire [31:0] sd_in_0_Re      = st_0_2_4_td_rdy ? b0_mem_rddata0[63:32] :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata0[63:32] : 32'h0;
wire [31:0] sd_in_0_Im      = st_0_2_4_td_rdy ? b0_mem_rddata0[31:0]  :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata0[31:0]  : 32'h0;
wire [31:0] sd_in_1_Re      = st_0_2_4_td_rdy ? b0_mem_rddata1[63:32] :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata1[63:32] :32'h0;
wire [31:0] sd_in_1_Im      = st_0_2_4_td_rdy ? b0_mem_rddata1[31:0]  :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata1[31:0]  : 32'h0;
wire [31:0] sd_in_2_Re      = st_0_2_4_td_rdy ? b0_mem_rddata2[63:32] :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata2[63:32] : 32'h0;
wire [31:0] sd_in_2_Im      = st_0_2_4_td_rdy ? b0_mem_rddata2[31:0]  :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata2[31:0]  : 32'h0;
wire [31:0] sd_in_3_Re      = st_0_2_4_td_rdy ? b0_mem_rddata3[63:32] :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata3[63:32] : 32'h0;
wire [31:0] sd_in_3_Im      = st_0_2_4_td_rdy ? b0_mem_rddata3[31:0]  :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata3[31:0]  : 32'h0;
wire [31:0] sd_in_4_Re      = st_0_2_4_td_rdy ? b0_mem_rddata4[63:32] :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata4[63:32] : 32'h0;
wire [31:0] sd_in_4_Im      = st_0_2_4_td_rdy ? b0_mem_rddata4[31:0]  :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata4[31:0]  : 32'h0;
wire [31:0] sd_in_5_Re      = st_0_2_4_td_rdy ? b0_mem_rddata5[63:32] :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata5[63:32] : 32'h0;
wire [31:0] sd_in_5_Im      = st_0_2_4_td_rdy ? b0_mem_rddata5[31:0]  :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata5[31:0]  : 32'h0;
wire [31:0] sd_in_6_Re      = st_0_2_4_td_rdy ? b0_mem_rddata6[63:32] :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata6[63:32] : 32'h0;
wire [31:0] sd_in_6_Im      = st_0_2_4_td_rdy ? b0_mem_rddata6[31:0]  :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata6[31:0]  : 32'h0;
wire [31:0] sd_in_7_Re      = st_0_2_4_td_rdy ? b0_mem_rddata7[63:32] :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata7[63:32] : 32'h0;
wire [31:0] sd_in_7_Im      = st_0_2_4_td_rdy ? b0_mem_rddata7[31:0]  :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata7[31:0]  : 32'h0;
wire [31:0] sd_in_8_Re      = st_0_2_4_td_rdy ? b0_mem_rddata8[63:32] :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata8[63:32] : 32'h0;
wire [31:0] sd_in_8_Im      = st_0_2_4_td_rdy ? b0_mem_rddata8[31:0]  :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata8[31:0]  : 32'h0;
wire [31:0] sd_in_9_Re      = st_0_2_4_td_rdy ? b0_mem_rddata9[63:32] :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata9[63:32] : 32'h0;
wire [31:0] sd_in_9_Im      = st_0_2_4_td_rdy ? b0_mem_rddata9[31:0]  :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata9[31:0]  : 32'h0;
wire [31:0] sd_in_10_Re     = st_0_2_4_td_rdy ? b0_mem_rddata10[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata10[63:32] : 32'h0;
wire [31:0] sd_in_10_Im     = st_0_2_4_td_rdy ? b0_mem_rddata10[31:0]  :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata10[31:0]  : 32'h0;
wire [31:0] sd_in_11_Re     = st_0_2_4_td_rdy ? b0_mem_rddata11[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata11[63:32] :32'h0;
wire [31:0] sd_in_11_Im     = st_0_2_4_td_rdy ? b0_mem_rddata11[31:0]  :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata11[31:0]  : 32'h0;
wire [31:0] sd_in_12_Re     = st_0_2_4_td_rdy ? b0_mem_rddata12[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata12[63:32] : 32'h0;
wire [31:0] sd_in_12_Im     = st_0_2_4_td_rdy ? b0_mem_rddata12[31:0]  :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata12[31:0]  : 32'h0;
wire [31:0] sd_in_13_Re     = st_0_2_4_td_rdy ? b0_mem_rddata13[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata13[63:32] : 32'h0;
wire [31:0] sd_in_13_Im     = st_0_2_4_td_rdy ? b0_mem_rddata13[31:0]  :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata13[31:0]  : 32'h0;
wire [31:0] sd_in_14_Re     = st_0_2_4_td_rdy ? b0_mem_rddata14[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata14[63:32] : 32'h0;
wire [31:0] sd_in_14_Im     = st_0_2_4_td_rdy ? b0_mem_rddata14[31:0]  :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata14[31:0]  : 32'h0;
wire [31:0] sd_in_15_Re     = st_0_2_4_td_rdy ? b0_mem_rddata15[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata15[63:32] : 32'h0;
wire [31:0] sd_in_15_Im     = st_0_2_4_td_rdy ? b0_mem_rddata15[31:0]  :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata15[31:0]  : 32'h0;
wire [31:0] sd_in_16_Re     = st_0_2_4_td_rdy ? b0_mem_rddata16[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata16[63:32] : 32'h0;
wire [31:0] sd_in_16_Im     = st_0_2_4_td_rdy ? b0_mem_rddata16[31:0]  :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata16[31:0]  : 32'h0;
wire [31:0] sd_in_17_Re     = st_0_2_4_td_rdy ? b0_mem_rddata17[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata17[63:32] : 32'h0;
wire [31:0] sd_in_17_Im     = st_0_2_4_td_rdy ? b0_mem_rddata17[31:0]  :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata17[31:0]  : 32'h0;
wire [31:0] sd_in_18_Re     = st_0_2_4_td_rdy ? b0_mem_rddata18[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata18[63:32] : 32'h0;
wire [31:0] sd_in_18_Im     = st_0_2_4_td_rdy ? b0_mem_rddata18[31:0]  :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata18[31:0]  : 32'h0;
wire [31:0] sd_in_19_Re     = st_0_2_4_td_rdy ? b0_mem_rddata19[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata19[63:32] : 32'h0;
wire [31:0] sd_in_19_Im     = st_0_2_4_td_rdy ? b0_mem_rddata19[31:0]  :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata19[31:0]  : 32'h0;
wire [31:0] sd_in_20_Re     = st_0_2_4_td_rdy ? b0_mem_rddata20[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata20[63:32] : 32'h0;
wire [31:0] sd_in_20_Im     = st_0_2_4_td_rdy ? b0_mem_rddata20[31:0]  :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata20[31:0]  : 32'h0;
wire [31:0] sd_in_21_Re     = st_0_2_4_td_rdy ? b0_mem_rddata21[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata21[63:32] :32'h0;
wire [31:0] sd_in_21_Im     = st_0_2_4_td_rdy ? b0_mem_rddata21[31:0]  :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata21[31:0]  : 32'h0;
wire [31:0] sd_in_22_Re     = st_0_2_4_td_rdy ? b0_mem_rddata22[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata22[63:32] : 32'h0;
wire [31:0] sd_in_22_Im     = st_0_2_4_td_rdy ? b0_mem_rddata22[31:0]  :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata22[31:0]  : 32'h0;
wire [31:0] sd_in_23_Re     = st_0_2_4_td_rdy ? b0_mem_rddata23[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata23[63:32] : 32'h0;
wire [31:0] sd_in_23_Im     = st_0_2_4_td_rdy ? b0_mem_rddata23[31:0]  :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata23[31:0]  : 32'h0;
wire [31:0] sd_in_24_Re     = st_0_2_4_td_rdy ? b0_mem_rddata24[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata24[63:32] : 32'h0;
wire [31:0] sd_in_24_Im     = st_0_2_4_td_rdy ? b0_mem_rddata24[31:0]  :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata24[31:0]  : 32'h0;
wire [31:0] sd_in_25_Re     = st_0_2_4_td_rdy ? b0_mem_rddata25[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata25[63:32] : 32'h0;
wire [31:0] sd_in_25_Im     = st_0_2_4_td_rdy ? b0_mem_rddata25[31:0]  :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata25[31:0]  : 32'h0;
wire [31:0] sd_in_26_Re     = st_0_2_4_td_rdy ? b0_mem_rddata26[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata26[63:32] : 32'h0;
wire [31:0] sd_in_26_Im     = st_0_2_4_td_rdy ? b0_mem_rddata26[31:0]  :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata26[31:0]  : 32'h0;
wire [31:0] sd_in_27_Re     = st_0_2_4_td_rdy ? b0_mem_rddata27[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata27[63:32] : 32'h0;
wire [31:0] sd_in_27_Im     = st_0_2_4_td_rdy ? b0_mem_rddata27[31:0]  :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata27[31:0]  : 32'h0;
wire [31:0] sd_in_28_Re     = st_0_2_4_td_rdy ? b0_mem_rddata28[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata28[63:32] : 32'h0;
wire [31:0] sd_in_28_Im     = st_0_2_4_td_rdy ? b0_mem_rddata28[31:0]  :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata28[31:0]  : 32'h0;
wire [31:0] sd_in_29_Re     = st_0_2_4_td_rdy ? b0_mem_rddata29[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata29[63:32] : 32'h0;
wire [31:0] sd_in_29_Im     = st_0_2_4_td_rdy ? b0_mem_rddata29[31:0]  :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata29[31:0]  : 32'h0;
wire [31:0] sd_in_30_Re     = st_0_2_4_td_rdy ? b0_mem_rddata30[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata30[63:32] : 32'h0;
wire [31:0] sd_in_30_Im     = st_0_2_4_td_rdy ? b0_mem_rddata30[31:0]  :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata30[31:0]  : 32'h0;
wire [31:0] sd_in_31_Re     = st_0_2_4_td_rdy ? b0_mem_rddata31[63:32] :
	                                               st_1_3_5_td_rdy ? b1_mem_rddata31[63:32] : 32'h0;
wire [31:0] sd_in_31_Im     = st_0_2_4_td_rdy ? b0_mem_rddata31[31:0]  :
	                                                st_1_3_5_td_rdy ? b1_mem_rddata31[31:0]  : 32'h0;

wire        sd_in_ready     = st0_td_rdy | st1_td_rdy | st2_td_rdy | st3_td_rdy | st4_td_rdy | st5_td_rdy;

wire        sd_out_validate ;
wire [31:0] sd_out_0_Re     ;
wire [31:0] sd_out_0_Im     ;
wire [31:0] sd_out_1_Re     ;
wire [31:0] sd_out_1_Im     ;
wire [31:0] sd_out_2_Re     ;
wire [31:0] sd_out_2_Im     ;
wire [31:0] sd_out_3_Re     ;
wire [31:0] sd_out_3_Im     ;
wire [31:0] sd_out_4_Re     ;
wire [31:0] sd_out_4_Im     ;
wire [31:0] sd_out_5_Re     ;
wire [31:0] sd_out_5_Im     ;
wire [31:0] sd_out_6_Re     ;
wire [31:0] sd_out_6_Im     ;
wire [31:0] sd_out_7_Re     ;
wire [31:0] sd_out_7_Im     ;
wire [31:0] sd_out_8_Re     ;
wire [31:0] sd_out_8_Im     ;
wire [31:0] sd_out_9_Re     ;
wire [31:0] sd_out_9_Im     ;
wire [31:0] sd_out_10_Re    ;
wire [31:0] sd_out_10_Im    ;
wire [31:0] sd_out_11_Re    ;
wire [31:0] sd_out_11_Im    ;
wire [31:0] sd_out_12_Re    ;
wire [31:0] sd_out_12_Im    ;
wire [31:0] sd_out_13_Re    ;
wire [31:0] sd_out_13_Im    ;
wire [31:0] sd_out_14_Re    ;
wire [31:0] sd_out_14_Im    ;
wire [31:0] sd_out_15_Re    ;
wire [31:0] sd_out_15_Im    ;
wire [31:0] sd_out_16_Re    ;
wire [31:0] sd_out_16_Im    ;
wire [31:0] sd_out_17_Re    ;
wire [31:0] sd_out_17_Im    ;
wire [31:0] sd_out_18_Re    ;
wire [31:0] sd_out_18_Im    ;
wire [31:0] sd_out_19_Re    ;
wire [31:0] sd_out_19_Im    ;
wire [31:0] sd_out_20_Re    ;
wire [31:0] sd_out_20_Im    ;
wire [31:0] sd_out_21_Re    ;
wire [31:0] sd_out_21_Im    ;
wire [31:0] sd_out_22_Re    ;
wire [31:0] sd_out_22_Im    ;
wire [31:0] sd_out_23_Re    ;
wire [31:0] sd_out_23_Im    ;
wire [31:0] sd_out_24_Re    ;
wire [31:0] sd_out_24_Im    ;
wire [31:0] sd_out_25_Re    ;
wire [31:0] sd_out_25_Im    ;
wire [31:0] sd_out_26_Re    ;
wire [31:0] sd_out_26_Im    ;
wire [31:0] sd_out_27_Re    ;
wire [31:0] sd_out_27_Im    ;
wire [31:0] sd_out_28_Re    ;
wire [31:0] sd_out_28_Im    ;
wire [31:0] sd_out_29_Re    ;
wire [31:0] sd_out_29_Im    ;
wire [31:0] sd_out_30_Re    ;
wire [31:0] sd_out_30_Im    ;
wire [31:0] sd_out_31_Re    ;
wire [31:0] sd_out_31_Im    ;

od_fft96_32_48 sd_od_fft96_32_48 (
                              .clock           (clock          ) ,
                              .reset           (reset          ) ,
                              .io_in_0_Re      (sd_in_0_Re     ) ,
                              .io_in_0_Im      (sd_in_0_Im     ) ,
                              .io_in_1_Re      (sd_in_1_Re     ) ,
                              .io_in_1_Im      (sd_in_1_Im     ) ,
                              .io_in_2_Re      (sd_in_2_Re     ) ,
                              .io_in_2_Im      (sd_in_2_Im     ) ,
                              .io_in_3_Re      (sd_in_3_Re     ) ,
                              .io_in_3_Im      (sd_in_3_Im     ) ,
                              .io_in_4_Re      (sd_in_4_Re     ) ,
                              .io_in_4_Im      (sd_in_4_Im     ) ,
                              .io_in_5_Re      (sd_in_5_Re     ) ,
                              .io_in_5_Im      (sd_in_5_Im     ) ,
                              .io_in_6_Re      (sd_in_6_Re     ) ,
                              .io_in_6_Im      (sd_in_6_Im     ) ,
                              .io_in_7_Re      (sd_in_7_Re     ) ,
                              .io_in_7_Im      (sd_in_7_Im     ) ,
                              .io_in_8_Re      (sd_in_8_Re     ) ,
                              .io_in_8_Im      (sd_in_8_Im     ) ,
                              .io_in_9_Re      (sd_in_9_Re     ) ,
                              .io_in_9_Im      (sd_in_9_Im     ) ,
                              .io_in_10_Re     (sd_in_10_Re    ) ,
                              .io_in_10_Im     (sd_in_10_Im    ) ,
                              .io_in_11_Re     (sd_in_11_Re    ) ,
                              .io_in_11_Im     (sd_in_11_Im    ) ,
                              .io_in_12_Re     (sd_in_12_Re    ) ,
                              .io_in_12_Im     (sd_in_12_Im    ) ,
                              .io_in_13_Re     (sd_in_13_Re    ) ,
                              .io_in_13_Im     (sd_in_13_Im    ) ,
                              .io_in_14_Re     (sd_in_14_Re    ) ,
                              .io_in_14_Im     (sd_in_14_Im    ) ,
                              .io_in_15_Re     (sd_in_15_Re    ) ,
                              .io_in_15_Im     (sd_in_15_Im    ) ,
                              .io_in_16_Re     (sd_in_16_Re    ) ,
                              .io_in_16_Im     (sd_in_16_Im    ) ,
                              .io_in_17_Re     (sd_in_17_Re    ) ,
                              .io_in_17_Im     (sd_in_17_Im    ) ,
                              .io_in_18_Re     (sd_in_18_Re    ) ,
                              .io_in_18_Im     (sd_in_18_Im    ) ,
                              .io_in_19_Re     (sd_in_19_Re    ) ,
                              .io_in_19_Im     (sd_in_19_Im    ) ,
                              .io_in_20_Re     (sd_in_20_Re    ) ,
                              .io_in_20_Im     (sd_in_20_Im    ) ,
                              .io_in_21_Re     (sd_in_21_Re    ) ,
                              .io_in_21_Im     (sd_in_21_Im    ) ,
                              .io_in_22_Re     (sd_in_22_Re    ) ,
                              .io_in_22_Im     (sd_in_22_Im    ) ,
                              .io_in_23_Re     (sd_in_23_Re    ) ,
                              .io_in_23_Im     (sd_in_23_Im    ) ,
                              .io_in_24_Re     (sd_in_24_Re    ) ,
                              .io_in_24_Im     (sd_in_24_Im    ) ,
                              .io_in_25_Re     (sd_in_25_Re    ) ,
                              .io_in_25_Im     (sd_in_25_Im    ) ,
                              .io_in_26_Re     (sd_in_26_Re    ) ,
                              .io_in_26_Im     (sd_in_26_Im    ) ,
                              .io_in_27_Re     (sd_in_27_Re    ) ,
                              .io_in_27_Im     (sd_in_27_Im    ) ,
                              .io_in_28_Re     (sd_in_28_Re    ) ,
                              .io_in_28_Im     (sd_in_28_Im    ) ,
                              .io_in_29_Re     (sd_in_29_Re    ) ,
                              .io_in_29_Im     (sd_in_29_Im    ) ,
                              .io_in_30_Re     (sd_in_30_Re    ) ,
                              .io_in_30_Im     (sd_in_30_Im    ) ,
                              .io_in_31_Re     (sd_in_31_Re    ) ,
                              .io_in_31_Im     (sd_in_31_Im    ) ,
                              .io_in_ready     (sd_in_ready    ) ,
                              .io_out_validate (sd_out_validate) ,
                              .io_out_0_Re     (sd_out_0_Re    ) ,
                              .io_out_0_Im     (sd_out_0_Im    ) ,
                              .io_out_1_Re     (sd_out_1_Re    ) ,
                              .io_out_1_Im     (sd_out_1_Im    ) ,
                              .io_out_2_Re     (sd_out_2_Re    ) ,
                              .io_out_2_Im     (sd_out_2_Im    ) ,
                              .io_out_3_Re     (sd_out_3_Re    ) ,
                              .io_out_3_Im     (sd_out_3_Im    ) ,
                              .io_out_4_Re     (sd_out_4_Re    ) ,
                              .io_out_4_Im     (sd_out_4_Im    ) ,
                              .io_out_5_Re     (sd_out_5_Re    ) ,
                              .io_out_5_Im     (sd_out_5_Im    ) ,
                              .io_out_6_Re     (sd_out_6_Re    ) ,
                              .io_out_6_Im     (sd_out_6_Im    ) ,
                              .io_out_7_Re     (sd_out_7_Re    ) ,
                              .io_out_7_Im     (sd_out_7_Im    ) ,
                              .io_out_8_Re     (sd_out_8_Re    ) ,
                              .io_out_8_Im     (sd_out_8_Im    ) ,
                              .io_out_9_Re     (sd_out_9_Re    ) ,
                              .io_out_9_Im     (sd_out_9_Im    ) ,
                              .io_out_10_Re    (sd_out_10_Re   ) ,
                              .io_out_10_Im    (sd_out_10_Im   ) ,
                              .io_out_11_Re    (sd_out_11_Re   ) ,
                              .io_out_11_Im    (sd_out_11_Im   ) ,
                              .io_out_12_Re    (sd_out_12_Re   ) ,
                              .io_out_12_Im    (sd_out_12_Im   ) ,
                              .io_out_13_Re    (sd_out_13_Re   ) ,
                              .io_out_13_Im    (sd_out_13_Im   ) ,
                              .io_out_14_Re    (sd_out_14_Re   ) ,
                              .io_out_14_Im    (sd_out_14_Im   ) ,
                              .io_out_15_Re    (sd_out_15_Re   ) ,
                              .io_out_15_Im    (sd_out_15_Im   ) ,
                              .io_out_16_Re    (sd_out_16_Re   ) ,
                              .io_out_16_Im    (sd_out_16_Im   ) ,
                              .io_out_17_Re    (sd_out_17_Re   ) ,
                              .io_out_17_Im    (sd_out_17_Im   ) ,
                              .io_out_18_Re    (sd_out_18_Re   ) ,
                              .io_out_18_Im    (sd_out_18_Im   ) ,
                              .io_out_19_Re    (sd_out_19_Re   ) ,
                              .io_out_19_Im    (sd_out_19_Im   ) ,
                              .io_out_20_Re    (sd_out_20_Re   ) ,
                              .io_out_20_Im    (sd_out_20_Im   ) ,
                              .io_out_21_Re    (sd_out_21_Re   ) ,
                              .io_out_21_Im    (sd_out_21_Im   ) ,
                              .io_out_22_Re    (sd_out_22_Re   ) ,
                              .io_out_22_Im    (sd_out_22_Im   ) ,
                              .io_out_23_Re    (sd_out_23_Re   ) ,
                              .io_out_23_Im    (sd_out_23_Im   ) ,
                              .io_out_24_Re    (sd_out_24_Re   ) ,
                              .io_out_24_Im    (sd_out_24_Im   ) ,
                              .io_out_25_Re    (sd_out_25_Re   ) ,
                              .io_out_25_Im    (sd_out_25_Im   ) ,
                              .io_out_26_Re    (sd_out_26_Re   ) ,
                              .io_out_26_Im    (sd_out_26_Im   ) ,
                              .io_out_27_Re    (sd_out_27_Re   ) ,
                              .io_out_27_Im    (sd_out_27_Im   ) ,
                              .io_out_28_Re    (sd_out_28_Re   ) ,
                              .io_out_28_Im    (sd_out_28_Im   ) ,
                              .io_out_29_Re    (sd_out_29_Re   ) ,
                              .io_out_29_Im    (sd_out_29_Im   ) ,
                              .io_out_30_Re    (sd_out_30_Re   ) ,
                              .io_out_30_Im    (sd_out_30_Im   ) ,
                              .io_out_31_Re    (sd_out_31_Re   ) ,
                              .io_out_31_Im    (sd_out_31_Im   ) 
                             );


wire b2_mem_wr = st0_td_vld | st2_td_vld | st4_td_vld;
wire b3_mem_wr = st1_td_vld | st3_td_vld | st5_td_vld;
wire b2_mem_rd = st0_thd_rdy | st2_thd_rdy | st4_thd_rdy;
wire b3_mem_rd = st1_thd_rdy | st3_thd_rdy | st5_thd_rdy;

wire [63:0] b2_mem_wrdata0  = b2_mem_wr ? {sd_out_0_Re , sd_out_0_Im}  : 64'h0    ;
wire [63:0] b2_mem_wrdata1  = b2_mem_wr ? {sd_out_1_Re , sd_out_1_Im}  : 64'h0    ;
wire [63:0] b2_mem_wrdata2  = b2_mem_wr ? {sd_out_2_Re , sd_out_2_Im}  : 64'h0    ;
wire [63:0] b2_mem_wrdata3  = b2_mem_wr ? {sd_out_3_Re , sd_out_3_Im}  : 64'h0    ;
wire [63:0] b2_mem_wrdata4  = b2_mem_wr ? {sd_out_4_Re , sd_out_4_Im}  : 64'h0    ;
wire [63:0] b2_mem_wrdata5  = b2_mem_wr ? {sd_out_5_Re , sd_out_5_Im}  : 64'h0    ;
wire [63:0] b2_mem_wrdata6  = b2_mem_wr ? {sd_out_6_Re , sd_out_6_Im}  : 64'h0    ;
wire [63:0] b2_mem_wrdata7  = b2_mem_wr ? {sd_out_7_Re , sd_out_7_Im}  : 64'h0    ;
wire [63:0] b2_mem_wrdata8  = b2_mem_wr ? {sd_out_8_Re , sd_out_8_Im}  : 64'h0    ;
wire [63:0] b2_mem_wrdata9  = b2_mem_wr ? {sd_out_9_Re , sd_out_9_Im}  : 64'h0    ;
wire [63:0] b2_mem_wrdata10 = b2_mem_wr ? {sd_out_10_Re, sd_out_10_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata11 = b2_mem_wr ? {sd_out_11_Re, sd_out_11_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata12 = b2_mem_wr ? {sd_out_12_Re, sd_out_12_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata13 = b2_mem_wr ? {sd_out_13_Re, sd_out_13_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata14 = b2_mem_wr ? {sd_out_14_Re, sd_out_14_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata15 = b2_mem_wr ? {sd_out_15_Re, sd_out_15_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata16 = b2_mem_wr ? {sd_out_16_Re, sd_out_16_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata17 = b2_mem_wr ? {sd_out_17_Re, sd_out_17_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata18 = b2_mem_wr ? {sd_out_18_Re, sd_out_18_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata19 = b2_mem_wr ? {sd_out_19_Re, sd_out_19_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata20 = b2_mem_wr ? {sd_out_20_Re, sd_out_20_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata21 = b2_mem_wr ? {sd_out_21_Re, sd_out_21_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata22 = b2_mem_wr ? {sd_out_22_Re, sd_out_22_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata23 = b2_mem_wr ? {sd_out_23_Re, sd_out_23_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata24 = b2_mem_wr ? {sd_out_24_Re, sd_out_24_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata25 = b2_mem_wr ? {sd_out_25_Re, sd_out_25_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata26 = b2_mem_wr ? {sd_out_26_Re, sd_out_26_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata27 = b2_mem_wr ? {sd_out_27_Re, sd_out_27_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata28 = b2_mem_wr ? {sd_out_28_Re, sd_out_28_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata29 = b2_mem_wr ? {sd_out_29_Re, sd_out_29_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata30 = b2_mem_wr ? {sd_out_30_Re, sd_out_30_Im} : 64'h0    ;
wire [63:0] b2_mem_wrdata31 = b2_mem_wr ? {sd_out_31_Re, sd_out_31_Im} : 64'h0    ;

wire [63:0] b3_mem_wrdata0  = b3_mem_wr ? {sd_out_0_Re , sd_out_0_Im}  : 64'h0    ;
wire [63:0] b3_mem_wrdata1  = b3_mem_wr ? {sd_out_1_Re , sd_out_1_Im}  : 64'h0    ;
wire [63:0] b3_mem_wrdata2  = b3_mem_wr ? {sd_out_2_Re , sd_out_2_Im}  : 64'h0    ;
wire [63:0] b3_mem_wrdata3  = b3_mem_wr ? {sd_out_3_Re , sd_out_3_Im}  : 64'h0    ;
wire [63:0] b3_mem_wrdata4  = b3_mem_wr ? {sd_out_4_Re , sd_out_4_Im}  : 64'h0    ;
wire [63:0] b3_mem_wrdata5  = b3_mem_wr ? {sd_out_5_Re , sd_out_5_Im}  : 64'h0    ;
wire [63:0] b3_mem_wrdata6  = b3_mem_wr ? {sd_out_6_Re , sd_out_6_Im}  : 64'h0    ;
wire [63:0] b3_mem_wrdata7  = b3_mem_wr ? {sd_out_7_Re , sd_out_7_Im}  : 64'h0    ;
wire [63:0] b3_mem_wrdata8  = b3_mem_wr ? {sd_out_8_Re , sd_out_8_Im}  : 64'h0    ;
wire [63:0] b3_mem_wrdata9  = b3_mem_wr ? {sd_out_9_Re , sd_out_9_Im}  : 64'h0    ;
wire [63:0] b3_mem_wrdata10 = b3_mem_wr ? {sd_out_10_Re, sd_out_10_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata11 = b3_mem_wr ? {sd_out_11_Re, sd_out_11_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata12 = b3_mem_wr ? {sd_out_12_Re, sd_out_12_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata13 = b3_mem_wr ? {sd_out_13_Re, sd_out_13_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata14 = b3_mem_wr ? {sd_out_14_Re, sd_out_14_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata15 = b3_mem_wr ? {sd_out_15_Re, sd_out_15_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata16 = b3_mem_wr ? {sd_out_16_Re, sd_out_16_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata17 = b3_mem_wr ? {sd_out_17_Re, sd_out_17_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata18 = b3_mem_wr ? {sd_out_18_Re, sd_out_18_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata19 = b3_mem_wr ? {sd_out_19_Re, sd_out_19_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata20 = b3_mem_wr ? {sd_out_20_Re, sd_out_20_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata21 = b3_mem_wr ? {sd_out_21_Re, sd_out_21_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata22 = b3_mem_wr ? {sd_out_22_Re, sd_out_22_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata23 = b3_mem_wr ? {sd_out_23_Re, sd_out_23_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata24 = b3_mem_wr ? {sd_out_24_Re, sd_out_24_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata25 = b3_mem_wr ? {sd_out_25_Re, sd_out_25_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata26 = b3_mem_wr ? {sd_out_26_Re, sd_out_26_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata27 = b3_mem_wr ? {sd_out_27_Re, sd_out_27_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata28 = b3_mem_wr ? {sd_out_28_Re, sd_out_28_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata29 = b3_mem_wr ? {sd_out_29_Re, sd_out_29_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata30 = b3_mem_wr ? {sd_out_30_Re, sd_out_30_Im} : 64'h0    ;
wire [63:0] b3_mem_wrdata31 = b3_mem_wr ? {sd_out_31_Re, sd_out_31_Im} : 64'h0    ;

wire [63:0] b2_mem_rddata0  ;
wire [63:0] b2_mem_rddata1  ;
wire [63:0] b2_mem_rddata2  ;
wire [63:0] b2_mem_rddata3  ;
wire [63:0] b2_mem_rddata4  ;
wire [63:0] b2_mem_rddata5  ;
wire [63:0] b2_mem_rddata6  ;
wire [63:0] b2_mem_rddata7  ;
wire [63:0] b2_mem_rddata8  ;
wire [63:0] b2_mem_rddata9  ;
wire [63:0] b2_mem_rddata10 ;
wire [63:0] b2_mem_rddata11 ;
wire [63:0] b2_mem_rddata12 ;
wire [63:0] b2_mem_rddata13 ;
wire [63:0] b2_mem_rddata14 ;
wire [63:0] b2_mem_rddata15 ;
wire [63:0] b2_mem_rddata16 ;
wire [63:0] b2_mem_rddata17 ;
wire [63:0] b2_mem_rddata18 ;
wire [63:0] b2_mem_rddata19 ;
wire [63:0] b2_mem_rddata20 ;
wire [63:0] b2_mem_rddata21 ;
wire [63:0] b2_mem_rddata22 ;
wire [63:0] b2_mem_rddata23 ;
wire [63:0] b2_mem_rddata24 ;
wire [63:0] b2_mem_rddata25 ;
wire [63:0] b2_mem_rddata26 ;
wire [63:0] b2_mem_rddata27 ;
wire [63:0] b2_mem_rddata28 ;
wire [63:0] b2_mem_rddata29 ;
wire [63:0] b2_mem_rddata30 ;
wire [63:0] b2_mem_rddata31 ;
wire [63:0] b3_mem_rddata0  ;
wire [63:0] b3_mem_rddata1  ;
wire [63:0] b3_mem_rddata2  ;
wire [63:0] b3_mem_rddata3  ;
wire [63:0] b3_mem_rddata4  ;
wire [63:0] b3_mem_rddata5  ;
wire [63:0] b3_mem_rddata6  ;
wire [63:0] b3_mem_rddata7  ;
wire [63:0] b3_mem_rddata8  ;
wire [63:0] b3_mem_rddata9  ;
wire [63:0] b3_mem_rddata10 ;
wire [63:0] b3_mem_rddata11 ;
wire [63:0] b3_mem_rddata12 ;
wire [63:0] b3_mem_rddata13 ;
wire [63:0] b3_mem_rddata14 ;
wire [63:0] b3_mem_rddata15 ;
wire [63:0] b3_mem_rddata16 ;
wire [63:0] b3_mem_rddata17 ;
wire [63:0] b3_mem_rddata18 ;
wire [63:0] b3_mem_rddata19 ;
wire [63:0] b3_mem_rddata20 ;
wire [63:0] b3_mem_rddata21 ;
wire [63:0] b3_mem_rddata22 ;
wire [63:0] b3_mem_rddata23 ;
wire [63:0] b3_mem_rddata24 ;
wire [63:0] b3_mem_rddata25 ;
wire [63:0] b3_mem_rddata26 ;
wire [63:0] b3_mem_rddata27 ;
wire [63:0] b3_mem_rddata28 ;
wire [63:0] b3_mem_rddata29 ;
wire [63:0] b3_mem_rddata30 ;
wire [63:0] b3_mem_rddata31 ;

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
                    .mem_wrdata2      (b2_mem_wrdata2 ),
                    .mem_wrdata3      (b2_mem_wrdata3 ),
                    .mem_wrdata4      (b2_mem_wrdata4 ),
                    .mem_wrdata5      (b2_mem_wrdata5 ),
                    .mem_wrdata6      (b2_mem_wrdata6 ),
                    .mem_wrdata7      (b2_mem_wrdata7 ),
                    .mem_wrdata8      (b2_mem_wrdata8 ),
                    .mem_wrdata9      (b2_mem_wrdata9 ),
                    .mem_wrdata10     (b2_mem_wrdata10),
                    .mem_wrdata11     (b2_mem_wrdata11),
                    .mem_wrdata12     (b2_mem_wrdata12),
                    .mem_wrdata13     (b2_mem_wrdata13),
                    .mem_wrdata14     (b2_mem_wrdata14),
                    .mem_wrdata15     (b2_mem_wrdata15),
                    .mem_wrdata16     (b2_mem_wrdata16),
                    .mem_wrdata17     (b2_mem_wrdata17),
                    .mem_wrdata18     (b2_mem_wrdata18),
                    .mem_wrdata19     (b2_mem_wrdata19),
                    .mem_wrdata20     (b2_mem_wrdata20),
                    .mem_wrdata21     (b2_mem_wrdata21),
                    .mem_wrdata22     (b2_mem_wrdata22),
                    .mem_wrdata23     (b2_mem_wrdata23),
                    .mem_wrdata24     (b2_mem_wrdata24),
                    .mem_wrdata25     (b2_mem_wrdata25),
                    .mem_wrdata26     (b2_mem_wrdata26),
                    .mem_wrdata27     (b2_mem_wrdata27),
                    .mem_wrdata28     (b2_mem_wrdata28),
                    .mem_wrdata29     (b2_mem_wrdata29),
                    .mem_wrdata30     (b2_mem_wrdata30),
                    .mem_wrdata31     (b2_mem_wrdata31),
                    .mem_rddata0      (b2_mem_rddata0 ),
                    .mem_rddata1      (b2_mem_rddata1 ),
                    .mem_rddata2      (b2_mem_rddata2 ),
                    .mem_rddata3      (b2_mem_rddata3 ),
                    .mem_rddata4      (b2_mem_rddata4 ),
                    .mem_rddata5      (b2_mem_rddata5 ),
                    .mem_rddata6      (b2_mem_rddata6 ),
                    .mem_rddata7      (b2_mem_rddata7 ),
                    .mem_rddata8      (b2_mem_rddata8 ),
                    .mem_rddata9      (b2_mem_rddata9 ),
                    .mem_rddata10     (b2_mem_rddata10),
                    .mem_rddata11     (b2_mem_rddata11),
                    .mem_rddata12     (b2_mem_rddata12),
                    .mem_rddata13     (b2_mem_rddata13),
                    .mem_rddata14     (b2_mem_rddata14),
                    .mem_rddata15     (b2_mem_rddata15),
                    .mem_rddata16     (b2_mem_rddata16),
                    .mem_rddata17     (b2_mem_rddata17),
                    .mem_rddata18     (b2_mem_rddata18),
                    .mem_rddata19     (b2_mem_rddata19),
                    .mem_rddata20     (b2_mem_rddata20),
                    .mem_rddata21     (b2_mem_rddata21),
                    .mem_rddata22     (b2_mem_rddata22),
                    .mem_rddata23     (b2_mem_rddata23),
                    .mem_rddata24     (b2_mem_rddata24),
                    .mem_rddata25     (b2_mem_rddata25),
                    .mem_rddata26     (b2_mem_rddata26),
                    .mem_rddata27     (b2_mem_rddata27),
                    .mem_rddata28     (b2_mem_rddata28),
                    .mem_rddata29     (b2_mem_rddata29),
                    .mem_rddata30     (b2_mem_rddata30),
                    .mem_rddata31     (b2_mem_rddata31));

buf_ctl b3_bfu_ctl (.clock            (clock          ),
                    .reset            (reset          ),
                    .mem_wr           (b3_mem_wr      ),
                    .mem_rd           (b3_mem_rd      ),
                    .row_no           (b3_row_no      ),
                    .col_no           (b3_col_no      ),
                    .dep_no           (b3_dep_no      ),
                    .mem_wrdata0      (b3_mem_wrdata0),
                    .mem_wrdata1      (b3_mem_wrdata1),
                    .mem_wrdata2      (b3_mem_wrdata2 ),
                    .mem_wrdata3      (b3_mem_wrdata3 ),
                    .mem_wrdata4      (b3_mem_wrdata4 ),
                    .mem_wrdata5      (b3_mem_wrdata5 ),
                    .mem_wrdata6      (b3_mem_wrdata6 ),
                    .mem_wrdata7      (b3_mem_wrdata7 ),
                    .mem_wrdata8      (b3_mem_wrdata8 ),
                    .mem_wrdata9      (b3_mem_wrdata9 ),
                    .mem_wrdata10     (b3_mem_wrdata10),
                    .mem_wrdata11     (b3_mem_wrdata11),
                    .mem_wrdata12     (b3_mem_wrdata12),
                    .mem_wrdata13     (b3_mem_wrdata13),
                    .mem_wrdata14     (b3_mem_wrdata14),
                    .mem_wrdata15     (b3_mem_wrdata15),
                    .mem_wrdata16     (b3_mem_wrdata16),
                    .mem_wrdata17     (b3_mem_wrdata17),
                    .mem_wrdata18     (b3_mem_wrdata18),
                    .mem_wrdata19     (b3_mem_wrdata19),
                    .mem_wrdata20     (b3_mem_wrdata20),
                    .mem_wrdata21     (b3_mem_wrdata21),
                    .mem_wrdata22     (b3_mem_wrdata22),
                    .mem_wrdata23     (b3_mem_wrdata23),
                    .mem_wrdata24     (b3_mem_wrdata24),
                    .mem_wrdata25     (b3_mem_wrdata25),
                    .mem_wrdata26     (b3_mem_wrdata26),
                    .mem_wrdata27     (b3_mem_wrdata27),
                    .mem_wrdata28     (b3_mem_wrdata28),
                    .mem_wrdata29     (b3_mem_wrdata29),
                    .mem_wrdata30     (b3_mem_wrdata30),
                    .mem_wrdata31     (b3_mem_wrdata31),
                    .mem_rddata0      (b3_mem_rddata0 ),
                    .mem_rddata1      (b3_mem_rddata1 ),
                    .mem_rddata2      (b3_mem_rddata2 ),
                    .mem_rddata3      (b3_mem_rddata3 ),
                    .mem_rddata4      (b3_mem_rddata4 ),
                    .mem_rddata5      (b3_mem_rddata5 ),
                    .mem_rddata6      (b3_mem_rddata6 ),
                    .mem_rddata7      (b3_mem_rddata7 ),
                    .mem_rddata8      (b3_mem_rddata8 ),
                    .mem_rddata9      (b3_mem_rddata9 ),
                    .mem_rddata10     (b3_mem_rddata10),
                    .mem_rddata11     (b3_mem_rddata11),
                    .mem_rddata12     (b3_mem_rddata12),
                    .mem_rddata13     (b3_mem_rddata13),
                    .mem_rddata14     (b3_mem_rddata14),
                    .mem_rddata15     (b3_mem_rddata15),
                    .mem_rddata16     (b3_mem_rddata16),
                    .mem_rddata17     (b3_mem_rddata17),
                    .mem_rddata18     (b3_mem_rddata18),
                    .mem_rddata19     (b3_mem_rddata19),
                    .mem_rddata20     (b3_mem_rddata20),
                    .mem_rddata21     (b3_mem_rddata21),
                    .mem_rddata22     (b3_mem_rddata22),
                    .mem_rddata23     (b3_mem_rddata23),
                    .mem_rddata24     (b3_mem_rddata24),
                    .mem_rddata25     (b3_mem_rddata25),
                    .mem_rddata26     (b3_mem_rddata26),
                    .mem_rddata27     (b3_mem_rddata27),
                    .mem_rddata28     (b3_mem_rddata28),
                    .mem_rddata29     (b3_mem_rddata29),
                    .mem_rddata30     (b3_mem_rddata30),
                    .mem_rddata31     (b3_mem_rddata31));

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
wire [31:0] thd_in_2_Re      = st_0_2_4_thd_rdy ? b2_mem_rddata2[63:32] :
	                                                st_1_3_5_thd_rdy ? b3_mem_rddata2[63:32] : 32'h0;
wire [31:0] thd_in_2_Im      = st_0_2_4_thd_rdy ? b2_mem_rddata2[31:0]  :
	                                                st_1_3_5_thd_rdy ? b3_mem_rddata2[31:0]  : 32'h0;
wire [31:0] thd_in_3_Re      = st_0_2_4_thd_rdy ? b2_mem_rddata3[63:32] :
	                                                st_1_3_5_thd_rdy ? b3_mem_rddata3[63:32] : 32'h0;
wire [31:0] thd_in_3_Im      = st_0_2_4_thd_rdy ? b2_mem_rddata3[31:0]  :
	                                                st_1_3_5_thd_rdy ? b3_mem_rddata3[31:0]  : 32'h0;
wire [31:0] thd_in_4_Re      = st_0_2_4_thd_rdy ? b2_mem_rddata4[63:32] :
	                                                st_1_3_5_thd_rdy ? b3_mem_rddata4[63:32] : 32'h0;
wire [31:0] thd_in_4_Im      = st_0_2_4_thd_rdy ? b2_mem_rddata4[31:0]  :
	                                                st_1_3_5_thd_rdy ? b3_mem_rddata4[31:0]  : 32'h0;
wire [31:0] thd_in_5_Re      = st_0_2_4_thd_rdy ? b2_mem_rddata5[63:32] :
	                                                st_1_3_5_thd_rdy ? b3_mem_rddata5[63:32] : 32'h0;
wire [31:0] thd_in_5_Im      = st_0_2_4_thd_rdy ? b2_mem_rddata5[31:0]  :
	                                                st_1_3_5_thd_rdy ? b3_mem_rddata5[31:0]  : 32'h0;
wire [31:0] thd_in_6_Re      = st_0_2_4_thd_rdy ? b2_mem_rddata6[63:32] :
	                                                st_1_3_5_thd_rdy ? b3_mem_rddata6[63:32] : 32'h0;
wire [31:0] thd_in_6_Im      = st_0_2_4_thd_rdy ? b2_mem_rddata6[31:0]  :
	                                                st_1_3_5_thd_rdy ? b3_mem_rddata6[31:0]  : 32'h0;
wire [31:0] thd_in_7_Re      = st_0_2_4_thd_rdy ? b2_mem_rddata7[63:32] :
	                                                st_1_3_5_thd_rdy ? b3_mem_rddata7[63:32] : 32'h0;
wire [31:0] thd_in_7_Im      = st_0_2_4_thd_rdy ? b2_mem_rddata7[31:0]  :
	                                                st_1_3_5_thd_rdy ? b3_mem_rddata7[31:0]  : 32'h0;
wire [31:0] thd_in_8_Re      = st_0_2_4_thd_rdy ? b2_mem_rddata8[63:32] :
	                                                st_1_3_5_thd_rdy ? b3_mem_rddata8[63:32] : 32'h0;
wire [31:0] thd_in_8_Im      = st_0_2_4_thd_rdy ? b2_mem_rddata8[31:0]  :
	                                                st_1_3_5_thd_rdy ? b3_mem_rddata8[31:0]  : 32'h0;
wire [31:0] thd_in_9_Re      = st_0_2_4_thd_rdy ? b2_mem_rddata9[63:32] :
	                                                st_1_3_5_thd_rdy ? b3_mem_rddata9[63:32] : 32'h0;
wire [31:0] thd_in_9_Im      = st_0_2_4_thd_rdy ? b2_mem_rddata9[31:0]  :
	                                                st_1_3_5_thd_rdy ? b3_mem_rddata9[31:0]  : 32'h0;
wire [31:0] thd_in_10_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata10[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata10[63:32] : 32'h0;
wire [31:0] thd_in_10_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata10[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata10[31:0]  : 32'h0;
wire [31:0] thd_in_11_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata11[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata11[63:32] :32'h0;
wire [31:0] thd_in_11_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata11[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata11[31:0]  : 32'h0;
wire [31:0] thd_in_12_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata12[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata12[63:32] : 32'h0;
wire [31:0] thd_in_12_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata12[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata12[31:0]  : 32'h0;
wire [31:0] thd_in_13_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata13[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata13[63:32] : 32'h0;
wire [31:0] thd_in_13_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata13[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata13[31:0]  : 32'h0;
wire [31:0] thd_in_14_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata14[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata14[63:32] : 32'h0;
wire [31:0] thd_in_14_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata14[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata14[31:0]  : 32'h0;
wire [31:0] thd_in_15_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata15[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata15[63:32] : 32'h0;
wire [31:0] thd_in_15_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata15[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata15[31:0]  : 32'h0;
wire [31:0] thd_in_16_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata16[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata16[63:32] : 32'h0;
wire [31:0] thd_in_16_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata16[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata16[31:0]  : 32'h0;
wire [31:0] thd_in_17_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata17[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata17[63:32] : 32'h0;
wire [31:0] thd_in_17_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata17[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata17[31:0]  : 32'h0;
wire [31:0] thd_in_18_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata18[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata18[63:32] : 32'h0;
wire [31:0] thd_in_18_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata18[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata18[31:0]  : 32'h0;
wire [31:0] thd_in_19_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata19[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata19[63:32] : 32'h0;
wire [31:0] thd_in_19_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata19[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata19[31:0]  : 32'h0;
wire [31:0] thd_in_20_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata20[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata20[63:32] : 32'h0;
wire [31:0] thd_in_20_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata20[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata20[31:0]  : 32'h0;
wire [31:0] thd_in_21_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata21[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata21[63:32] :32'h0;
wire [31:0] thd_in_21_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata21[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata21[31:0]  : 32'h0;
wire [31:0] thd_in_22_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata22[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata22[63:32] : 32'h0;
wire [31:0] thd_in_22_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata22[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata22[31:0]  : 32'h0;
wire [31:0] thd_in_23_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata23[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata23[63:32] : 32'h0;
wire [31:0] thd_in_23_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata23[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata23[31:0]  : 32'h0;
wire [31:0] thd_in_24_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata24[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata24[63:32] : 32'h0;
wire [31:0] thd_in_24_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata24[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata24[31:0]  : 32'h0;
wire [31:0] thd_in_25_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata25[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata25[63:32] : 32'h0;
wire [31:0] thd_in_25_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata25[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata25[31:0]  : 32'h0;
wire [31:0] thd_in_26_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata26[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata26[63:32] : 32'h0;
wire [31:0] thd_in_26_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata26[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata26[31:0]  : 32'h0;
wire [31:0] thd_in_27_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata27[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata27[63:32] : 32'h0;
wire [31:0] thd_in_27_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata27[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata27[31:0]  : 32'h0;
wire [31:0] thd_in_28_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata28[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata28[63:32] : 32'h0;
wire [31:0] thd_in_28_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata28[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata28[31:0]  : 32'h0;
wire [31:0] thd_in_29_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata29[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata29[63:32] : 32'h0;
wire [31:0] thd_in_29_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata29[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata29[31:0]  : 32'h0;
wire [31:0] thd_in_30_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata30[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata30[63:32] : 32'h0;
wire [31:0] thd_in_30_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata30[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata30[31:0]  : 32'h0;
wire [31:0] thd_in_31_Re     = st_0_2_4_thd_rdy ? b2_mem_rddata31[63:32] :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata31[63:32] : 32'h0;
wire [31:0] thd_in_31_Im     = st_0_2_4_thd_rdy ? b2_mem_rddata31[31:0]  :
	                                               st_1_3_5_thd_rdy ? b3_mem_rddata31[31:0]  : 32'h0;

wire        thd_in_ready     = st0_thd_rdy | st1_thd_rdy | st2_thd_rdy | st3_thd_rdy | st4_thd_rdy | st5_thd_rdy;

wire        thd_out_validate ;

wire [31:0] thd_out_0_Re     ;
wire [31:0] thd_out_0_Im     ;
wire [31:0] thd_out_1_Re     ;
wire [31:0] thd_out_1_Im     ;
wire [31:0] thd_out_2_Re     ;
wire [31:0] thd_out_2_Im     ;
wire [31:0] thd_out_3_Re     ;
wire [31:0] thd_out_3_Im     ;
wire [31:0] thd_out_4_Re     ;
wire [31:0] thd_out_4_Im     ;
wire [31:0] thd_out_5_Re     ;
wire [31:0] thd_out_5_Im     ;
wire [31:0] thd_out_6_Re     ;
wire [31:0] thd_out_6_Im     ;
wire [31:0] thd_out_7_Re     ;
wire [31:0] thd_out_7_Im     ;
wire [31:0] thd_out_8_Re     ;
wire [31:0] thd_out_8_Im     ;
wire [31:0] thd_out_9_Re     ;
wire [31:0] thd_out_9_Im     ;
wire [31:0] thd_out_10_Re    ;
wire [31:0] thd_out_10_Im    ;
wire [31:0] thd_out_11_Re    ;
wire [31:0] thd_out_11_Im    ;
wire [31:0] thd_out_12_Re    ;
wire [31:0] thd_out_12_Im    ;
wire [31:0] thd_out_13_Re    ;
wire [31:0] thd_out_13_Im    ;
wire [31:0] thd_out_14_Re    ;
wire [31:0] thd_out_14_Im    ;
wire [31:0] thd_out_15_Re    ;
wire [31:0] thd_out_15_Im    ;
wire [31:0] thd_out_16_Re    ;
wire [31:0] thd_out_16_Im    ;
wire [31:0] thd_out_17_Re    ;
wire [31:0] thd_out_17_Im    ;
wire [31:0] thd_out_18_Re    ;
wire [31:0] thd_out_18_Im    ;
wire [31:0] thd_out_19_Re    ;
wire [31:0] thd_out_19_Im    ;
wire [31:0] thd_out_20_Re    ;
wire [31:0] thd_out_20_Im    ;
wire [31:0] thd_out_21_Re    ;
wire [31:0] thd_out_21_Im    ;
wire [31:0] thd_out_22_Re    ;
wire [31:0] thd_out_22_Im    ;
wire [31:0] thd_out_23_Re    ;
wire [31:0] thd_out_23_Im    ;
wire [31:0] thd_out_24_Re    ;
wire [31:0] thd_out_24_Im    ;
wire [31:0] thd_out_25_Re    ;
wire [31:0] thd_out_25_Im    ;
wire [31:0] thd_out_26_Re    ;
wire [31:0] thd_out_26_Im    ;
wire [31:0] thd_out_27_Re    ;
wire [31:0] thd_out_27_Im    ;
wire [31:0] thd_out_28_Re    ;
wire [31:0] thd_out_28_Im    ;
wire [31:0] thd_out_29_Re    ;
wire [31:0] thd_out_29_Im    ;
wire [31:0] thd_out_30_Re    ;
wire [31:0] thd_out_30_Im    ;
wire [31:0] thd_out_31_Re    ;
wire [31:0] thd_out_31_Im    ;

od_fft96_32_48 thd_od_fft96_32_48 (
                              .clock           (clock           ) ,
                              .reset           (reset           ) ,
                              .io_in_0_Re      (thd_in_0_Re     ) ,
                              .io_in_0_Im      (thd_in_0_Im     ) ,
                              .io_in_1_Re      (thd_in_1_Re     ) ,
                              .io_in_1_Im      (thd_in_1_Im     ) ,
                              .io_in_2_Re      (thd_in_2_Re     ) ,
                              .io_in_2_Im      (thd_in_2_Im     ) ,
                              .io_in_3_Re      (thd_in_3_Re     ) ,
                              .io_in_3_Im      (thd_in_3_Im     ) ,
                              .io_in_4_Re      (thd_in_4_Re     ) ,
                              .io_in_4_Im      (thd_in_4_Im     ) ,
                              .io_in_5_Re      (thd_in_5_Re     ) ,
                              .io_in_5_Im      (thd_in_5_Im     ) ,
                              .io_in_6_Re      (thd_in_6_Re     ) ,
                              .io_in_6_Im      (thd_in_6_Im     ) ,
                              .io_in_7_Re      (thd_in_7_Re     ) ,
                              .io_in_7_Im      (thd_in_7_Im     ) ,
                              .io_in_8_Re      (thd_in_8_Re     ) ,
                              .io_in_8_Im      (thd_in_8_Im     ) ,
                              .io_in_9_Re      (thd_in_9_Re     ) ,
                              .io_in_9_Im      (thd_in_9_Im     ) ,
                              .io_in_10_Re     (thd_in_10_Re    ) ,
                              .io_in_10_Im     (thd_in_10_Im    ) ,
                              .io_in_11_Re     (thd_in_11_Re    ) ,
                              .io_in_11_Im     (thd_in_11_Im    ) ,
                              .io_in_12_Re     (thd_in_12_Re    ) ,
                              .io_in_12_Im     (thd_in_12_Im    ) ,
                              .io_in_13_Re     (thd_in_13_Re    ) ,
                              .io_in_13_Im     (thd_in_13_Im    ) ,
                              .io_in_14_Re     (thd_in_14_Re    ) ,
                              .io_in_14_Im     (thd_in_14_Im    ) ,
                              .io_in_15_Re     (thd_in_15_Re    ) ,
                              .io_in_15_Im     (thd_in_15_Im    ) ,
                              .io_in_16_Re     (thd_in_16_Re    ) ,
                              .io_in_16_Im     (thd_in_16_Im    ) ,
                              .io_in_17_Re     (thd_in_17_Re    ) ,
                              .io_in_17_Im     (thd_in_17_Im    ) ,
                              .io_in_18_Re     (thd_in_18_Re    ) ,
                              .io_in_18_Im     (thd_in_18_Im    ) ,
                              .io_in_19_Re     (thd_in_19_Re    ) ,
                              .io_in_19_Im     (thd_in_19_Im    ) ,
                              .io_in_20_Re     (thd_in_20_Re    ) ,
                              .io_in_20_Im     (thd_in_20_Im    ) ,
                              .io_in_21_Re     (thd_in_21_Re    ) ,
                              .io_in_21_Im     (thd_in_21_Im    ) ,
                              .io_in_22_Re     (thd_in_22_Re    ) ,
                              .io_in_22_Im     (thd_in_22_Im    ) ,
                              .io_in_23_Re     (thd_in_23_Re    ) ,
                              .io_in_23_Im     (thd_in_23_Im    ) ,
                              .io_in_24_Re     (thd_in_24_Re    ) ,
                              .io_in_24_Im     (thd_in_24_Im    ) ,
                              .io_in_25_Re     (thd_in_25_Re    ) ,
                              .io_in_25_Im     (thd_in_25_Im    ) ,
                              .io_in_26_Re     (thd_in_26_Re    ) ,
                              .io_in_26_Im     (thd_in_26_Im    ) ,
                              .io_in_27_Re     (thd_in_27_Re    ) ,
                              .io_in_27_Im     (thd_in_27_Im    ) ,
                              .io_in_28_Re     (thd_in_28_Re    ) ,
                              .io_in_28_Im     (thd_in_28_Im    ) ,
                              .io_in_29_Re     (thd_in_29_Re    ) ,
                              .io_in_29_Im     (thd_in_29_Im    ) ,
                              .io_in_30_Re     (thd_in_30_Re    ) ,
                              .io_in_30_Im     (thd_in_30_Im    ) ,
                              .io_in_31_Re     (thd_in_31_Re    ) ,
                              .io_in_31_Im     (thd_in_31_Im    ) ,
                              .io_in_ready     (thd_in_ready    ) ,
                              .io_out_validate (thd_out_validate) ,
                              .io_out_0_Re     (thd_out_0_Re    ) ,
                              .io_out_0_Im     (thd_out_0_Im    ) ,
                              .io_out_1_Re     (thd_out_1_Re    ) ,
                              .io_out_1_Im     (thd_out_1_Im    ) ,
                              .io_out_2_Re     (thd_out_2_Re    ) ,
                              .io_out_2_Im     (thd_out_2_Im    ) ,
                              .io_out_3_Re     (thd_out_3_Re    ) ,
                              .io_out_3_Im     (thd_out_3_Im    ) ,
                              .io_out_4_Re     (thd_out_4_Re    ) ,
                              .io_out_4_Im     (thd_out_4_Im    ) ,
                              .io_out_5_Re     (thd_out_5_Re    ) ,
                              .io_out_5_Im     (thd_out_5_Im    ) ,
                              .io_out_6_Re     (thd_out_6_Re    ) ,
                              .io_out_6_Im     (thd_out_6_Im    ) ,
                              .io_out_7_Re     (thd_out_7_Re    ) ,
                              .io_out_7_Im     (thd_out_7_Im    ) ,
                              .io_out_8_Re     (thd_out_8_Re    ) ,
                              .io_out_8_Im     (thd_out_8_Im    ) ,
                              .io_out_9_Re     (thd_out_9_Re    ) ,
                              .io_out_9_Im     (thd_out_9_Im    ) ,
                              .io_out_10_Re    (thd_out_10_Re   ) ,
                              .io_out_10_Im    (thd_out_10_Im   ) ,
                              .io_out_11_Re    (thd_out_11_Re   ) ,
                              .io_out_11_Im    (thd_out_11_Im   ) ,
                              .io_out_12_Re    (thd_out_12_Re   ) ,
                              .io_out_12_Im    (thd_out_12_Im   ) ,
                              .io_out_13_Re    (thd_out_13_Re   ) ,
                              .io_out_13_Im    (thd_out_13_Im   ) ,
                              .io_out_14_Re    (thd_out_14_Re   ) ,
                              .io_out_14_Im    (thd_out_14_Im   ) ,
                              .io_out_15_Re    (thd_out_15_Re   ) ,
                              .io_out_15_Im    (thd_out_15_Im   ) ,
                              .io_out_16_Re    (thd_out_16_Re   ) ,
                              .io_out_16_Im    (thd_out_16_Im   ) ,
                              .io_out_17_Re    (thd_out_17_Re   ) ,
                              .io_out_17_Im    (thd_out_17_Im   ) ,
                              .io_out_18_Re    (thd_out_18_Re   ) ,
                              .io_out_18_Im    (thd_out_18_Im   ) ,
                              .io_out_19_Re    (thd_out_19_Re   ) ,
                              .io_out_19_Im    (thd_out_19_Im   ) ,
                              .io_out_20_Re    (thd_out_20_Re   ) ,
                              .io_out_20_Im    (thd_out_20_Im   ) ,
                              .io_out_21_Re    (thd_out_21_Re   ) ,
                              .io_out_21_Im    (thd_out_21_Im   ) ,
                              .io_out_22_Re    (thd_out_22_Re   ) ,
                              .io_out_22_Im    (thd_out_22_Im   ) ,
                              .io_out_23_Re    (thd_out_23_Re   ) ,
                              .io_out_23_Im    (thd_out_23_Im   ) ,
                              .io_out_24_Re    (thd_out_24_Re   ) ,
                              .io_out_24_Im    (thd_out_24_Im   ) ,
                              .io_out_25_Re    (thd_out_25_Re   ) ,
                              .io_out_25_Im    (thd_out_25_Im   ) ,
                              .io_out_26_Re    (thd_out_26_Re   ) ,
                              .io_out_26_Im    (thd_out_26_Im   ) ,
                              .io_out_27_Re    (thd_out_27_Re   ) ,
                              .io_out_27_Im    (thd_out_27_Im   ) ,
                              .io_out_28_Re    (thd_out_28_Re   ) ,
                              .io_out_28_Im    (thd_out_28_Im   ) ,
                              .io_out_29_Re    (thd_out_29_Re   ) ,
                              .io_out_29_Im    (thd_out_29_Im   ) ,
                              .io_out_30_Re    (thd_out_30_Re   ) ,
                              .io_out_30_Im    (thd_out_30_Im   ) ,
                              .io_out_31_Re    (thd_out_31_Re   ) ,
                              .io_out_31_Im    (thd_out_31_Im   ) 
                             );

wire b4_mem_wr = st0_thd_vld | st2_thd_vld | st4_thd_vld;
wire b5_mem_wr = st1_thd_vld | st3_thd_vld | st5_thd_vld;
wire b4_mem_rd = st0_out_vld | st2_out_vld | st4_out_vld;
wire b5_mem_rd = st1_out_vld | st3_out_vld | st5_out_vld;

wire [63:0] b4_mem_wrdata0   = b4_mem_wr ? {thd_out_0_Re , thd_out_0_Im}  : 64'h0    ;
wire [63:0] b4_mem_wrdata1   = b4_mem_wr ? {thd_out_1_Re , thd_out_1_Im}  : 64'h0    ;
wire [63:0] b4_mem_wrdata2   = b4_mem_wr ? {thd_out_2_Re , thd_out_2_Im}  : 64'h0    ;
wire [63:0] b4_mem_wrdata3   = b4_mem_wr ? {thd_out_3_Re , thd_out_3_Im}  : 64'h0    ;
wire [63:0] b4_mem_wrdata4   = b4_mem_wr ? {thd_out_4_Re , thd_out_4_Im}  : 64'h0    ;
wire [63:0] b4_mem_wrdata5   = b4_mem_wr ? {thd_out_5_Re , thd_out_5_Im}  : 64'h0    ;
wire [63:0] b4_mem_wrdata6   = b4_mem_wr ? {thd_out_6_Re , thd_out_6_Im}  : 64'h0    ;
wire [63:0] b4_mem_wrdata7   = b4_mem_wr ? {thd_out_7_Re , thd_out_7_Im}  : 64'h0    ;
wire [63:0] b4_mem_wrdata8   = b4_mem_wr ? {thd_out_8_Re , thd_out_8_Im}  : 64'h0    ;
wire [63:0] b4_mem_wrdata9   = b4_mem_wr ? {thd_out_9_Re , thd_out_9_Im}  : 64'h0    ;
wire [63:0] b4_mem_wrdata10  = b4_mem_wr ? {thd_out_10_Re, thd_out_10_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata11  = b4_mem_wr ? {thd_out_11_Re, thd_out_11_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata12  = b4_mem_wr ? {thd_out_12_Re, thd_out_12_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata13  = b4_mem_wr ? {thd_out_13_Re, thd_out_13_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata14  = b4_mem_wr ? {thd_out_14_Re, thd_out_14_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata15  = b4_mem_wr ? {thd_out_15_Re, thd_out_15_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata16  = b4_mem_wr ? {thd_out_16_Re, thd_out_16_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata17  = b4_mem_wr ? {thd_out_17_Re, thd_out_17_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata18  = b4_mem_wr ? {thd_out_18_Re, thd_out_18_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata19  = b4_mem_wr ? {thd_out_19_Re, thd_out_19_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata20  = b4_mem_wr ? {thd_out_20_Re, thd_out_20_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata21  = b4_mem_wr ? {thd_out_21_Re, thd_out_21_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata22  = b4_mem_wr ? {thd_out_22_Re, thd_out_22_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata23  = b4_mem_wr ? {thd_out_23_Re, thd_out_23_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata24  = b4_mem_wr ? {thd_out_24_Re, thd_out_24_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata25  = b4_mem_wr ? {thd_out_25_Re, thd_out_25_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata26  = b4_mem_wr ? {thd_out_26_Re, thd_out_26_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata27  = b4_mem_wr ? {thd_out_27_Re, thd_out_27_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata28  = b4_mem_wr ? {thd_out_28_Re, thd_out_28_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata29  = b4_mem_wr ? {thd_out_29_Re, thd_out_29_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata30  = b4_mem_wr ? {thd_out_30_Re, thd_out_30_Im} : 64'h0    ;
wire [63:0] b4_mem_wrdata31  = b4_mem_wr ? {thd_out_31_Re, thd_out_31_Im} : 64'h0    ;

wire [63:0] b5_mem_wrdata0   = b5_mem_wr ? {thd_out_0_Re , thd_out_0_Im}   : 64'h0    ;
wire [63:0] b5_mem_wrdata1   = b5_mem_wr ? {thd_out_1_Re , thd_out_1_Im}   : 64'h0    ;
wire [63:0] b5_mem_wrdata2   = b5_mem_wr ? {thd_out_2_Re , thd_out_2_Im}   : 64'h0    ;
wire [63:0] b5_mem_wrdata3   = b5_mem_wr ? {thd_out_3_Re , thd_out_3_Im}   : 64'h0    ;
wire [63:0] b5_mem_wrdata4   = b5_mem_wr ? {thd_out_4_Re , thd_out_4_Im}   : 64'h0    ;
wire [63:0] b5_mem_wrdata5   = b5_mem_wr ? {thd_out_5_Re , thd_out_5_Im}   : 64'h0    ;
wire [63:0] b5_mem_wrdata6   = b5_mem_wr ? {thd_out_6_Re , thd_out_6_Im}   : 64'h0    ;
wire [63:0] b5_mem_wrdata7   = b5_mem_wr ? {thd_out_7_Re , thd_out_7_Im}   : 64'h0    ;
wire [63:0] b5_mem_wrdata8   = b5_mem_wr ? {thd_out_8_Re , thd_out_8_Im}   : 64'h0    ;
wire [63:0] b5_mem_wrdata9   = b5_mem_wr ? {thd_out_9_Re , thd_out_9_Im}   : 64'h0    ;
wire [63:0] b5_mem_wrdata10  = b5_mem_wr ? {thd_out_10_Re, thd_out_10_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata11  = b5_mem_wr ? {thd_out_11_Re, thd_out_11_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata12  = b5_mem_wr ? {thd_out_12_Re, thd_out_12_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata13  = b5_mem_wr ? {thd_out_13_Re, thd_out_13_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata14  = b5_mem_wr ? {thd_out_14_Re, thd_out_14_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata15  = b5_mem_wr ? {thd_out_15_Re, thd_out_15_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata16  = b5_mem_wr ? {thd_out_16_Re, thd_out_16_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata17  = b5_mem_wr ? {thd_out_17_Re, thd_out_17_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata18  = b5_mem_wr ? {thd_out_18_Re, thd_out_18_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata19  = b5_mem_wr ? {thd_out_19_Re, thd_out_19_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata20  = b5_mem_wr ? {thd_out_20_Re, thd_out_20_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata21  = b5_mem_wr ? {thd_out_21_Re, thd_out_21_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata22  = b5_mem_wr ? {thd_out_22_Re, thd_out_22_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata23  = b5_mem_wr ? {thd_out_23_Re, thd_out_23_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata24  = b5_mem_wr ? {thd_out_24_Re, thd_out_24_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata25  = b5_mem_wr ? {thd_out_25_Re, thd_out_25_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata26  = b5_mem_wr ? {thd_out_26_Re, thd_out_26_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata27  = b5_mem_wr ? {thd_out_27_Re, thd_out_27_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata28  = b5_mem_wr ? {thd_out_28_Re, thd_out_28_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata29  = b5_mem_wr ? {thd_out_29_Re, thd_out_29_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata30  = b5_mem_wr ? {thd_out_30_Re, thd_out_30_Im} : 64'h0    ;
wire [63:0] b5_mem_wrdata31  = b5_mem_wr ? {thd_out_31_Re, thd_out_31_Im} : 64'h0    ;

wire [63:0] b4_mem_rddata0  ;
wire [63:0] b4_mem_rddata1  ;
wire [63:0] b4_mem_rddata2  ;
wire [63:0] b4_mem_rddata3  ;
wire [63:0] b4_mem_rddata4  ;
wire [63:0] b4_mem_rddata5  ;
wire [63:0] b4_mem_rddata6  ;
wire [63:0] b4_mem_rddata7  ;
wire [63:0] b4_mem_rddata8  ;
wire [63:0] b4_mem_rddata9  ;
wire [63:0] b4_mem_rddata10 ;
wire [63:0] b4_mem_rddata11 ;
wire [63:0] b4_mem_rddata12 ;
wire [63:0] b4_mem_rddata13 ;
wire [63:0] b4_mem_rddata14 ;
wire [63:0] b4_mem_rddata15 ;
wire [63:0] b4_mem_rddata16 ;
wire [63:0] b4_mem_rddata17 ;
wire [63:0] b4_mem_rddata18 ;
wire [63:0] b4_mem_rddata19 ;
wire [63:0] b4_mem_rddata20 ;
wire [63:0] b4_mem_rddata21 ;
wire [63:0] b4_mem_rddata22 ;
wire [63:0] b4_mem_rddata23 ;
wire [63:0] b4_mem_rddata24 ;
wire [63:0] b4_mem_rddata25 ;
wire [63:0] b4_mem_rddata26 ;
wire [63:0] b4_mem_rddata27 ;
wire [63:0] b4_mem_rddata28 ;
wire [63:0] b4_mem_rddata29 ;
wire [63:0] b4_mem_rddata30 ;
wire [63:0] b4_mem_rddata31 ;
wire [63:0] b5_mem_rddata0  ;
wire [63:0] b5_mem_rddata1  ;
wire [63:0] b5_mem_rddata2  ;
wire [63:0] b5_mem_rddata3  ;
wire [63:0] b5_mem_rddata4  ;
wire [63:0] b5_mem_rddata5  ;
wire [63:0] b5_mem_rddata6  ;
wire [63:0] b5_mem_rddata7  ;
wire [63:0] b5_mem_rddata8  ;
wire [63:0] b5_mem_rddata9  ;
wire [63:0] b5_mem_rddata10 ;
wire [63:0] b5_mem_rddata11 ;
wire [63:0] b5_mem_rddata12 ;
wire [63:0] b5_mem_rddata13 ;
wire [63:0] b5_mem_rddata14 ;
wire [63:0] b5_mem_rddata15 ;
wire [63:0] b5_mem_rddata16 ;
wire [63:0] b5_mem_rddata17 ;
wire [63:0] b5_mem_rddata18 ;
wire [63:0] b5_mem_rddata19 ;
wire [63:0] b5_mem_rddata20 ;
wire [63:0] b5_mem_rddata21 ;
wire [63:0] b5_mem_rddata22 ;
wire [63:0] b5_mem_rddata23 ;
wire [63:0] b5_mem_rddata24 ;
wire [63:0] b5_mem_rddata25 ;
wire [63:0] b5_mem_rddata26 ;
wire [63:0] b5_mem_rddata27 ;
wire [63:0] b5_mem_rddata28 ;
wire [63:0] b5_mem_rddata29 ;
wire [63:0] b5_mem_rddata30 ;
wire [63:0] b5_mem_rddata31 ;

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
                    .mem_wrdata2      (b4_mem_wrdata2 ),
                    .mem_wrdata3      (b4_mem_wrdata3 ),
                    .mem_wrdata4      (b4_mem_wrdata4 ),
                    .mem_wrdata5      (b4_mem_wrdata5 ),
                    .mem_wrdata6      (b4_mem_wrdata6 ),
                    .mem_wrdata7      (b4_mem_wrdata7 ),
                    .mem_wrdata8      (b4_mem_wrdata8 ),
                    .mem_wrdata9      (b4_mem_wrdata9 ),
                    .mem_wrdata10     (b4_mem_wrdata10),
                    .mem_wrdata11     (b4_mem_wrdata11),
                    .mem_wrdata12     (b4_mem_wrdata12),
                    .mem_wrdata13     (b4_mem_wrdata13),
                    .mem_wrdata14     (b4_mem_wrdata14),
                    .mem_wrdata15     (b4_mem_wrdata15),
                    .mem_wrdata16     (b4_mem_wrdata16),
                    .mem_wrdata17     (b4_mem_wrdata17),
                    .mem_wrdata18     (b4_mem_wrdata18),
                    .mem_wrdata19     (b4_mem_wrdata19),
                    .mem_wrdata20     (b4_mem_wrdata20),
                    .mem_wrdata21     (b4_mem_wrdata21),
                    .mem_wrdata22     (b4_mem_wrdata22),
                    .mem_wrdata23     (b4_mem_wrdata23),
                    .mem_wrdata24     (b4_mem_wrdata24),
                    .mem_wrdata25     (b4_mem_wrdata25),
                    .mem_wrdata26     (b4_mem_wrdata26),
                    .mem_wrdata27     (b4_mem_wrdata27),
                    .mem_wrdata28     (b4_mem_wrdata28),
                    .mem_wrdata29     (b4_mem_wrdata29),
                    .mem_wrdata30     (b4_mem_wrdata30),
                    .mem_wrdata31     (b4_mem_wrdata31),
                    .mem_rddata0      (b4_mem_rddata0 ),
                    .mem_rddata1      (b4_mem_rddata1 ),
                    .mem_rddata2      (b4_mem_rddata2 ),
                    .mem_rddata3      (b4_mem_rddata3 ),
                    .mem_rddata4      (b4_mem_rddata4 ),
                    .mem_rddata5      (b4_mem_rddata5 ),
                    .mem_rddata6      (b4_mem_rddata6 ),
                    .mem_rddata7      (b4_mem_rddata7 ),
                    .mem_rddata8      (b4_mem_rddata8 ),
                    .mem_rddata9      (b4_mem_rddata9 ),
                    .mem_rddata10     (b4_mem_rddata10),
                    .mem_rddata11     (b4_mem_rddata11),
                    .mem_rddata12     (b4_mem_rddata12),
                    .mem_rddata13     (b4_mem_rddata13),
                    .mem_rddata14     (b4_mem_rddata14),
                    .mem_rddata15     (b4_mem_rddata15),
                    .mem_rddata16     (b4_mem_rddata16),
                    .mem_rddata17     (b4_mem_rddata17),
                    .mem_rddata18     (b4_mem_rddata18),
                    .mem_rddata19     (b4_mem_rddata19),
                    .mem_rddata20     (b4_mem_rddata20),
                    .mem_rddata21     (b4_mem_rddata21),
                    .mem_rddata22     (b4_mem_rddata22),
                    .mem_rddata23     (b4_mem_rddata23),
                    .mem_rddata24     (b4_mem_rddata24),
                    .mem_rddata25     (b4_mem_rddata25),
                    .mem_rddata26     (b4_mem_rddata26),
                    .mem_rddata27     (b4_mem_rddata27),
                    .mem_rddata28     (b4_mem_rddata28),
                    .mem_rddata29     (b4_mem_rddata29),
                    .mem_rddata30     (b4_mem_rddata30),
                    .mem_rddata31     (b4_mem_rddata31));

buf_ctl b5_bfu_ctl (.clock            (clock      ),
                    .reset            (reset      ),
                    .mem_wr           (b5_mem_wr     ),
                    .mem_rd           (b5_mem_rd     ),
                    .row_no           (b5_row_no   ),
                    .col_no           (b5_col_no   ),
                    .dep_no           (b5_dep_no   ),
                    .mem_wrdata0      (b5_mem_wrdata0),
                    .mem_wrdata1      (b5_mem_wrdata1),
                    .mem_wrdata2      (b5_mem_wrdata2 ),
                    .mem_wrdata3      (b5_mem_wrdata3 ),
                    .mem_wrdata4      (b5_mem_wrdata4 ),
                    .mem_wrdata5      (b5_mem_wrdata5 ),
                    .mem_wrdata6      (b5_mem_wrdata6 ),
                    .mem_wrdata7      (b5_mem_wrdata7 ),
                    .mem_wrdata8      (b5_mem_wrdata8 ),
                    .mem_wrdata9      (b5_mem_wrdata9 ),
                    .mem_wrdata10     (b5_mem_wrdata10),
                    .mem_wrdata11     (b5_mem_wrdata11),
                    .mem_wrdata12     (b5_mem_wrdata12),
                    .mem_wrdata13     (b5_mem_wrdata13),
                    .mem_wrdata14     (b5_mem_wrdata14),
                    .mem_wrdata15     (b5_mem_wrdata15),
                    .mem_wrdata16     (b5_mem_wrdata16),
                    .mem_wrdata17     (b5_mem_wrdata17),
                    .mem_wrdata18     (b5_mem_wrdata18),
                    .mem_wrdata19     (b5_mem_wrdata19),
                    .mem_wrdata20     (b5_mem_wrdata20),
                    .mem_wrdata21     (b5_mem_wrdata21),
                    .mem_wrdata22     (b5_mem_wrdata22),
                    .mem_wrdata23     (b5_mem_wrdata23),
                    .mem_wrdata24     (b5_mem_wrdata24),
                    .mem_wrdata25     (b5_mem_wrdata25),
                    .mem_wrdata26     (b5_mem_wrdata26),
                    .mem_wrdata27     (b5_mem_wrdata27),
                    .mem_wrdata28     (b5_mem_wrdata28),
                    .mem_wrdata29     (b5_mem_wrdata29),
                    .mem_wrdata30     (b5_mem_wrdata30),
                    .mem_wrdata31     (b5_mem_wrdata31),
                    .mem_rddata0      (b5_mem_rddata0 ),
                    .mem_rddata1      (b5_mem_rddata1 ),
                    .mem_rddata2      (b5_mem_rddata2 ),
                    .mem_rddata3      (b5_mem_rddata3 ),
                    .mem_rddata4      (b5_mem_rddata4 ),
                    .mem_rddata5      (b5_mem_rddata5 ),
                    .mem_rddata6      (b5_mem_rddata6 ),
                    .mem_rddata7      (b5_mem_rddata7 ),
                    .mem_rddata8      (b5_mem_rddata8 ),
                    .mem_rddata9      (b5_mem_rddata9 ),
                    .mem_rddata10     (b5_mem_rddata10),
                    .mem_rddata11     (b5_mem_rddata11),
                    .mem_rddata12     (b5_mem_rddata12),
                    .mem_rddata13     (b5_mem_rddata13),
                    .mem_rddata14     (b5_mem_rddata14),
                    .mem_rddata15     (b5_mem_rddata15),
                    .mem_rddata16     (b5_mem_rddata16),
                    .mem_rddata17     (b5_mem_rddata17),
                    .mem_rddata18     (b5_mem_rddata18),
                    .mem_rddata19     (b5_mem_rddata19),
                    .mem_rddata20     (b5_mem_rddata20),
                    .mem_rddata21     (b5_mem_rddata21),
                    .mem_rddata22     (b5_mem_rddata22),
                    .mem_rddata23     (b5_mem_rddata23),
                    .mem_rddata24     (b5_mem_rddata24),
                    .mem_rddata25     (b5_mem_rddata25),
                    .mem_rddata26     (b5_mem_rddata26),
                    .mem_rddata27     (b5_mem_rddata27),
                    .mem_rddata28     (b5_mem_rddata28),
                    .mem_rddata29     (b5_mem_rddata29),
                    .mem_rddata30     (b5_mem_rddata30),
                    .mem_rddata31     (b5_mem_rddata31));

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
assign io_out_2_Re  = st_0_2_4_out_vld ? b4_mem_rddata2[63:32] :
	                                        st_1_3_5_out_vld ? b5_mem_rddata2[63:32] : 32'h0;
assign io_out_2_Im  = st_0_2_4_out_vld ? b4_mem_rddata2[31:0]  :
	                                        st_1_3_5_out_vld ? b5_mem_rddata2[31:0]  : 32'h0;
assign io_out_3_Re  = st_0_2_4_out_vld ? b4_mem_rddata3[63:32] :
	                                        st_1_3_5_out_vld ? b5_mem_rddata3[63:32] : 32'h0;
assign io_out_3_Im  = st_0_2_4_out_vld ? b4_mem_rddata3[31:0]  :
	                                        st_1_3_5_out_vld ? b5_mem_rddata3[31:0]  : 32'h0;
assign io_out_4_Re  = st_0_2_4_out_vld ? b4_mem_rddata4[63:32] :
	                                        st_1_3_5_out_vld ? b5_mem_rddata4[63:32] : 32'h0;
assign io_out_4_Im  = st_0_2_4_out_vld ? b4_mem_rddata4[31:0]  :
	                                        st_1_3_5_out_vld ? b5_mem_rddata4[31:0]  : 32'h0;
assign io_out_5_Re  = st_0_2_4_out_vld ? b4_mem_rddata5[63:32] :
	                                        st_1_3_5_out_vld ? b5_mem_rddata5[63:32] : 32'h0;
assign io_out_5_Im  = st_0_2_4_out_vld ? b4_mem_rddata5[31:0]  :
	                                        st_1_3_5_out_vld ? b5_mem_rddata5[31:0]  : 32'h0;
assign io_out_6_Re  = st_0_2_4_out_vld ? b4_mem_rddata6[63:32] :
	                                        st_1_3_5_out_vld ? b5_mem_rddata6[63:32] : 32'h0;
assign io_out_6_Im  = st_0_2_4_out_vld ? b4_mem_rddata6[31:0]  :
	                                        st_1_3_5_out_vld ? b5_mem_rddata6[31:0]  : 32'h0;
assign io_out_7_Re  = st_0_2_4_out_vld ? b4_mem_rddata7[63:32] :
	                                        st_1_3_5_out_vld ? b5_mem_rddata7[63:32] : 32'h0;
assign io_out_7_Im  = st_0_2_4_out_vld ? b4_mem_rddata7[31:0]  :
	                                        st_1_3_5_out_vld ? b5_mem_rddata7[31:0]  : 32'h0;
assign io_out_8_Re  = st_0_2_4_out_vld ? b4_mem_rddata8[63:32] :
                     	                        st_1_3_5_out_vld ? b5_mem_rddata8[63:32] : 32'h0;
assign io_out_8_Im  = st_0_2_4_out_vld ? b4_mem_rddata8[31:0]  :
	                                        st_1_3_5_out_vld ? b5_mem_rddata8[31:0]  : 32'h0;
assign io_out_9_Re  = st_0_2_4_out_vld ? b4_mem_rddata9[63:32] :
	                                        st_1_3_5_out_vld ? b5_mem_rddata9[63:32] : 32'h0;
assign io_out_9_Im  = st_0_2_4_out_vld ? b4_mem_rddata9[31:0]  :
	                                        st_1_3_5_out_vld ? b5_mem_rddata9[31:0]  : 32'h0;
assign io_out_10_Re = st_0_2_4_out_vld ? b4_mem_rddata10[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata10[63:32] : 32'h0;
assign io_out_10_Im = st_0_2_4_out_vld ? b4_mem_rddata10[31:0]  :
	                                         st_1_3_5_out_vld ? b5_mem_rddata10[31:0]  : 32'h0;
assign io_out_11_Re = st_0_2_4_out_vld ? b4_mem_rddata11[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata11[63:32] :32'h0;
assign io_out_11_Im = st_0_2_4_out_vld ? b4_mem_rddata11[31:0]  :
	                                         st_1_3_5_out_vld ? b5_mem_rddata11[31:0]  : 32'h0;
assign io_out_12_Re = st_0_2_4_out_vld ? b4_mem_rddata12[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata12[63:32] : 32'h0;
assign io_out_12_Im = st_0_2_4_out_vld ? b4_mem_rddata12[31:0]  :
	                                         st_1_3_5_out_vld ? b5_mem_rddata12[31:0]  : 32'h0;
assign io_out_13_Re = st_0_2_4_out_vld ? b4_mem_rddata13[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata13[63:32] : 32'h0;
assign io_out_13_Im = st_0_2_4_out_vld ? b4_mem_rddata13[31:0]  :
	                                         st_1_3_5_out_vld ? b5_mem_rddata13[31:0]  : 32'h0;
assign io_out_14_Re = st_0_2_4_out_vld ? b4_mem_rddata14[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata14[63:32] : 32'h0;
assign io_out_14_Im = st_0_2_4_out_vld ? b4_mem_rddata14[31:0]  :
	                                         st_1_3_5_out_vld ? b5_mem_rddata14[31:0]  : 32'h0;
assign io_out_15_Re = st_0_2_4_out_vld ? b4_mem_rddata15[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata15[63:32] : 32'h0;
assign io_out_15_Im = st_0_2_4_out_vld ? b4_mem_rddata15[31:0]  :
	                                         st_1_3_5_out_vld ? b5_mem_rddata15[31:0]  : 32'h0;
assign io_out_16_Re = st_0_2_4_out_vld ? b4_mem_rddata16[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata16[63:32] : 32'h0;
assign io_out_16_Im = st_0_2_4_out_vld ? b4_mem_rddata16[31:0]  :
	                                         st_1_3_5_out_vld ? b5_mem_rddata16[31:0]  : 32'h0;
assign io_out_17_Re = st_0_2_4_out_vld ? b4_mem_rddata17[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata17[63:32] : 32'h0;
assign io_out_17_Im = st_0_2_4_out_vld ? b4_mem_rddata17[31:0]  :
	                                         st_1_3_5_out_vld ? b5_mem_rddata17[31:0]  : 32'h0;
assign io_out_18_Re = st_0_2_4_out_vld ? b4_mem_rddata18[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata18[63:32] : 32'h0;
assign io_out_18_Im = st_0_2_4_out_vld ? b4_mem_rddata18[31:0]  :
	                                         st_1_3_5_out_vld ? b5_mem_rddata18[31:0]  : 32'h0;
assign io_out_19_Re = st_0_2_4_out_vld ? b4_mem_rddata19[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata19[63:32] : 32'h0;
assign io_out_19_Im = st_0_2_4_out_vld ? b4_mem_rddata19[31:0]  :
	                                         st_1_3_5_out_vld ? b5_mem_rddata19[31:0]  : 32'h0;
assign io_out_20_Re = st_0_2_4_out_vld ? b4_mem_rddata20[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata20[63:32] : 32'h0;
assign io_out_20_Im = st_0_2_4_out_vld ? b4_mem_rddata20[31:0]  :
	                                         st_1_3_5_out_vld ? b5_mem_rddata20[31:0]  : 32'h0;
assign io_out_21_Re = st_0_2_4_out_vld ? b4_mem_rddata21[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata21[63:32] :32'h0;
assign io_out_21_Im = st_0_2_4_out_vld ? b4_mem_rddata21[31:0]  :
	                                         st_1_3_5_out_vld ? b5_mem_rddata21[31:0]  : 32'h0;
assign io_out_22_Re = st_0_2_4_out_vld ? b4_mem_rddata22[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata22[63:32] : 32'h0;
assign io_out_22_Im = st_0_2_4_out_vld ? b4_mem_rddata22[31:0]  :
	                                         st_1_3_5_out_vld ? b5_mem_rddata22[31:0]  : 32'h0;
assign io_out_23_Re = st_0_2_4_out_vld ? b4_mem_rddata23[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata23[63:32] : 32'h0;
assign io_out_23_Im = st_0_2_4_out_vld ? b4_mem_rddata23[31:0]  :
	                                         st_1_3_5_out_vld ? b5_mem_rddata23[31:0]  : 32'h0;
assign io_out_24_Re = st_0_2_4_out_vld ? b4_mem_rddata24[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata24[63:32] : 32'h0;
assign io_out_24_Im = st_0_2_4_out_vld ? b4_mem_rddata24[31:0]  :
	                                         st_1_3_5_out_vld ? b5_mem_rddata24[31:0]  : 32'h0;
assign io_out_25_Re = st_0_2_4_out_vld ? b4_mem_rddata25[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata25[63:32] : 32'h0;
assign io_out_25_Im = st_0_2_4_out_vld ? b4_mem_rddata25[31:0]  :
	                                         st_1_3_5_out_vld ? b5_mem_rddata25[31:0]  : 32'h0;
assign io_out_26_Re = st_0_2_4_out_vld ? b4_mem_rddata26[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata26[63:32] : 32'h0;
assign io_out_26_Im = st_0_2_4_out_vld ? b4_mem_rddata26[31:0]  :
	                                         st_1_3_5_out_vld ? b5_mem_rddata26[31:0]  : 32'h0;
assign io_out_27_Re = st_0_2_4_out_vld ? b4_mem_rddata27[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata27[63:32] : 32'h0;
assign io_out_27_Im = st_0_2_4_out_vld ? b4_mem_rddata27[31:0]  :
	                                         st_1_3_5_out_vld ? b5_mem_rddata27[31:0]  : 32'h0;
assign io_out_28_Re = st_0_2_4_out_vld ? b4_mem_rddata28[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata28[63:32] : 32'h0;
assign io_out_28_Im = st_0_2_4_out_vld ? b4_mem_rddata28[31:0]  :
	                                         st_1_3_5_out_vld ? b5_mem_rddata28[31:0]  : 32'h0;
assign io_out_29_Re = st_0_2_4_out_vld ? b4_mem_rddata29[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata29[63:32] : 32'h0;
assign io_out_29_Im = st_0_2_4_out_vld ? b4_mem_rddata29[31:0]  :
	                                         st_1_3_5_out_vld ? b5_mem_rddata29[31:0]  : 32'h0;
assign io_out_30_Re = st_0_2_4_out_vld ? b4_mem_rddata30[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata30[63:32] : 32'h0;
assign io_out_30_Im = st_0_2_4_out_vld ? b4_mem_rddata30[31:0]  :
	                                         st_1_3_5_out_vld ? b5_mem_rddata30[31:0]  : 32'h0;
assign io_out_31_Re = st_0_2_4_out_vld ? b4_mem_rddata31[63:32] :
	                                         st_1_3_5_out_vld ? b5_mem_rddata31[63:32] : 32'h0;
assign io_out_31_Im = st_0_2_4_out_vld ? b4_mem_rddata31[31:0]  :
	                                         st_1_3_5_out_vld ? b3_mem_rddata31[31:0]  : 32'h0;

endmodule
