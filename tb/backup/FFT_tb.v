//*********************************************************************************************//
//----------------    FFT Testbench   -------------------------------------------------------////
//---------------- Author: Xiaokun Yang  ----------------------------------------------------////
//---------------- Lawrence Berkeley Lab ----------------------------------------------------////
//---------------- Date: 7/7/2022  ----------------------------------------------------------//// 
//----- Version 1: DFT2, DFT3, FFT4, FFT8, FFT9 (FFT_sr)-------------------------------------////
//----- Date: 7/6/2022 ----------------------------------------------------------------------////
//----- Version 2: Synmetric Optimization on DFT and FFT (FFT_sr_v2) ------------------------////
//----- Date: 7/10/2022 ---------------------------------------------------------------------////
//----- Version 3: Mixed Radix FFT ----------------------------------------------------------////
//----- Date: 7/12/2022 ---------------------------------------------------------------------////
//----- Version 4: Streaming FFT (fft_sr_v2_streaming)---------------------------------------////
//----- Date: 7/14/2022 ---------------------------------------------------------------------////
//*********************************************************************************************//
//----- This testbench support verification to the following designs based on                  //
//the defines in the tcl script:                                                               //
//---------------------------------------------------------------------------------------------//
//----- DFT_R2, DFT_R3 (DFT_r)                                                                 //
//----- DFT_r(2, 32); DFT_r(3, 32);                                                            //
//---------------------------------------------------------------------------------------------//
//----- FFT_SR4_R2, FFT_SR8_R2, FFT_SR16_R2 (FFT_sr and FFT_sr_v2, v2 has the symmetric design)// 
//----- FFT_sr(4,2,4,32); FFT_sr(8,2,8,32); FFT_sr(16,2,16,32);                                //
//----- FFT_sr_v2(4,2,4,32); FFT_sr_v2(8,2,8,32); FFT_sr_v2(16,2,16,32);                       //
//---------------------------------------------------------------------------------------------//
//----- FFT_SR9_R3, FFT_SR27_R3 (FFT_sr and FFT_sr_v2, v2 has the symmetric design)            //                            
//----- FFT_sr(9,3,9,32); FFT_sr(27,3,27,32);                                                  //
//----- FFT_sr_v2(9,3,9,32); FFT_sr_v2(27,3,27,32);                                            //
//---------------------------------------------------------------------------------------------//
//----- FFT_MR6_BASIC, FFT_MR12_BASIC, FFT_MR18_BASIC, FFT_MR36_BASIC (FFT_mr_basic)           //
//----- FFT_mr_basic(6,2,3,2,3,6,32);                                                          //
//----- FFT_mr_basic(12,4,3,2,3,12,32);                                                        //
//----- FFT_mr_basic(18,2,9,2,3,18,32);                                                        //
//----- FFT_mr_basic(36,4,9,2,3,36,32);                                                        //
//---------------------------------------------------------------------------------------------//
//----- FFT_422_STREAMING, FFT_822_STREAMING, FFT_824_STREAMING, FFT_sr_v2_streaming           //
//----- FFT_933_STREAMING, FFT_2733_STREAMING, FFT_2739_STREAMING, FFT_sr_v2_streaming         //
//----- FFT_sr_v2_streaming(4,2,2,32);                                                         //
//----- FFT_sr_v2_streaming(8,2,2,32);                                                         //
//----- FFT_sr_v2_streaming(8,2,4,32);                                                         //
//----- FFT_sr_v2_streaming(9,3,3,32);                                                         //
//----- FFT_sr_v2_streaming(27,3,3,32);                                                        //
//----- FFT_sr_v2_streaming(27,3,9,32);                                                        //
//---------------------------------------------------------------------------------------------//
// Versions of the Chisel HCL:                                                                 //
// The DFT_r is based on the original design but has the ready and validate                    //
// DFT_r_v1 is the original design but no ready and validate                                   //
// DFT_r_v2 have the symmetric computation                                                     //
// FFT_sr is the original FFT design                                                           //
// FFT_sr_v2 is based on the symmetric computation                                             //
//                                                                                             //
//*********************************************************************************************//
`define TEST_SIZE 10000

`ifdef DFT_R2
    `define FFT_ST_WT2        //this is thw streaming width "w", used for interfacing
    `define GOLDEN_FFT2       //for golden input and output
    `define FFT_LEN 2         //this number is the DFT lenght "n", used for  
    `define FFT_WT 2          //this number is the DFT streaming weight "w", used for data fed in 
`endif

`ifdef DFT_R3
    `define FFT_ST_WT2
    `define FFT_ST_WT3
    `define GOLDEN_FFT3
    `define FFT_LEN 3
    `define FFT_WT 3
`endif

`ifdef FFT_SR8_R2
    `define FFT_ST_WT2
    `define FFT_ST_WT3
    `define FFT_ST_WT4 
    `define FFT_ST_WT6 
    `define FFT_ST_WT8 
    `define GOLDEN_FFT8
    `define FFT_LEN 8
    `define FFT_WT 8
`endif 

`ifdef FFT_SR16_R2
    `define FFT_ST_WT2
    `define FFT_ST_WT3
    `define FFT_ST_WT4 
    `define FFT_ST_WT6 
    `define FFT_ST_WT8 
    `define FFT_ST_WT9 
    `define FFT_ST_WT12 
    `define FFT_ST_WT16 
    `define GOLDEN_FFT16
    `define FFT_LEN 16 
    `define FFT_WT 16
`endif 

`ifdef FFT_SR9_R3
    `define FFT_ST_WT2
    `define FFT_ST_WT3
    `define FFT_ST_WT4 
    `define FFT_ST_WT6 
    `define FFT_ST_WT8 
    `define FFT_ST_WT9 
    `define GOLDEN_FFT9
    `define FFT_LEN 9 
    `define FFT_WT 9
`endif 

`ifdef FFT_SR27_R3
    `define FFT_ST_WT2
    `define FFT_ST_WT3
    `define FFT_ST_WT4 
    `define FFT_ST_WT6 
    `define FFT_ST_WT8 
    `define FFT_ST_WT9 
    `define FFT_ST_WT12 
    `define FFT_ST_WT16 
    `define FFT_ST_WT18 
    `define FFT_ST_WT27 
    `define GOLDEN_FFT27
    `define FFT_LEN 27 
    `define FFT_WT 27
`endif

`ifdef FFT_MR6_BASIC
    `define FFT_ST_WT2
    `define FFT_ST_WT3
    `define FFT_ST_WT4 
    `define FFT_ST_WT6 
    `define GOLDEN_FFT6
    `define FFT_LEN 6 
    `define FFT_WT 6
`endif

`ifdef FFT_MR12_BASIC
    `define FFT_ST_WT2
    `define FFT_ST_WT3
    `define FFT_ST_WT4 
    `define FFT_ST_WT6 
    `define FFT_ST_WT8 
    `define FFT_ST_WT9 
    `define FFT_ST_WT12 
    `define GOLDEN_FFT12
    `define FFT_LEN 12 
    `define FFT_WT 12
`endif 

`ifdef FFT_MR18_BASIC
    `define FFT_ST_WT2
    `define FFT_ST_WT3
    `define FFT_ST_WT4 
    `define FFT_ST_WT6 
    `define FFT_ST_WT8 
    `define FFT_ST_WT9 
    `define FFT_ST_WT12 
    `define FFT_ST_WT16 
    `define FFT_ST_WT18 
    `define GOLDEN_FFT18
    `define FFT_LEN 18 
    `define FFT_WT 18
`endif

`ifdef FFT_MR36_BASIC
    `define FFT_ST_WT2
    `define FFT_ST_WT3
    `define FFT_ST_WT4 
    `define FFT_ST_WT6 
    `define FFT_ST_WT8 
    `define FFT_ST_WT9 
    `define FFT_ST_WT12 
    `define FFT_ST_WT16 
    `define FFT_ST_WT18 
    `define FFT_ST_WT27 
    `define FFT_ST_WT36 
    `define GOLDEN_FFT36
    `define FFT_LEN 36 
    `define FFT_WT 36
`endif

`ifdef FFT_MR96_BASIC
    `define FFT_ST_WT2
    `define FFT_ST_WT3
    `define FFT_ST_WT4 
    `define FFT_ST_WT6 
    `define FFT_ST_WT8 
    `define FFT_ST_WT9 
    `define FFT_ST_WT12 
    `define FFT_ST_WT16 
    `define FFT_ST_WT18 
    `define FFT_ST_WT27 
    `define FFT_ST_WT36 
    `define FFT_ST_WT96 
    `define GOLDEN_FFT96
    `define FFT_LEN 96 
    `define FFT_WT 96
`endif

`ifdef FFT_422_STREAMING
    `define FFT_ST_WT2
    `define GOLDEN_FFT4
    `define FFT_LEN 4 
    `define FFT_WT 2
`endif

`ifdef FFT_822_STREAMING
    `define FFT_ST_WT2
    `define GOLDEN_FFT8
    `define FFT_LEN 8 
    `define FFT_WT 2
`endif 

`ifdef FFT_824_STREAMING
    `define FFT_ST_WT2
    `define FFT_ST_WT3
    `define FFT_ST_WT4 
    `define GOLDEN_FFT8
    `define FFT_LEN 8 
    `define FFT_WT 4 
`endif 

`ifdef FFT_933_STREAMING 
    `define FFT_ST_WT2
    `define FFT_ST_WT3
    `define GOLDEN_FFT9
    `define FFT_LEN 9 
    `define FFT_WT 3 
`endif 

`ifdef FFT_2733_STREAMING
    `define FFT_ST_WT2
    `define FFT_ST_WT3
    `define GOLDEN_FFT27
    `define FFT_LEN 27 
    `define FFT_WT 3 
`endif

`ifdef FFT_2739_STREAMING
    `define FFT_ST_WT2
    `define FFT_ST_WT3
    `define FFT_ST_WT4 
    `define FFT_ST_WT6 
    `define FFT_ST_WT8 
    `define FFT_ST_WT9 
    `define GOLDEN_FFT27
    `define FFT_LEN 27 
    `define FFT_WT 9 
`endif

module FFT_tb();
  reg         clock      ;
  reg         reset      ;
  reg         io_in_ready     ;
  wire        io_out_validate ;

//---------------------------------------------------------
//--- wire and reg declaration 
//---------------------------------------------------------
`ifdef FFT_ST_WT2
  reg  [31:0] io_in_0_Re ;
  reg  [31:0] io_in_0_Im ;
  reg  [31:0] io_in_1_Re ;
  reg  [31:0] io_in_1_Im ;
  wire [31:0] io_out_0_Re;
  wire [31:0] io_out_0_Im;
  wire [31:0] io_out_1_Re;
  wire [31:0] io_out_1_Im;
  `ifdef FFT_ST_WT3
  reg  [31:0] io_in_2_Re ;
  reg  [31:0] io_in_2_Im ;
  wire [31:0] io_out_2_Re;
  wire [31:0] io_out_2_Im;
    `ifdef FFT_ST_WT4
  reg  [31:0] io_in_3_Re ;
  reg  [31:0] io_in_3_Im ;
  wire [31:0] io_out_3_Re;
  wire [31:0] io_out_3_Im;
      `ifdef FFT_ST_WT6
  reg  [31:0] io_in_4_Re ;
  reg  [31:0] io_in_4_Im ;
  reg  [31:0] io_in_5_Re ;
  reg  [31:0] io_in_5_Im ;
  wire [31:0] io_out_4_Re;
  wire [31:0] io_out_4_Im;
  wire [31:0] io_out_5_Re;
  wire [31:0] io_out_5_Im;
        `ifdef FFT_ST_WT8
  reg  [31:0] io_in_6_Re ;
  reg  [31:0] io_in_6_Im ;
  reg  [31:0] io_in_7_Re ;
  reg  [31:0] io_in_7_Im ;
  wire [31:0] io_out_6_Re;
  wire [31:0] io_out_6_Im;
  wire [31:0] io_out_7_Re;
  wire [31:0] io_out_7_Im;
          `ifdef FFT_ST_WT9 
  reg  [31:0] io_in_8_Re ;
  reg  [31:0] io_in_8_Im ;
  wire [31:0] io_out_8_Re ;
  wire [31:0] io_out_8_Im ;
            `ifdef FFT_ST_WT12 
  reg  [31:0] io_in_9_Re ;
  reg  [31:0] io_in_9_Im ;
  reg  [31:0] io_in_10_Re ;
  reg  [31:0] io_in_10_Im ;
  reg  [31:0] io_in_11_Re ;
  reg  [31:0] io_in_11_Im ;
  wire [31:0] io_out_9_Re ;
  wire [31:0] io_out_9_Im ;
  wire [31:0] io_out_10_Re ;
  wire [31:0] io_out_10_Im ;
  wire [31:0] io_out_11_Re ;
  wire [31:0] io_out_11_Im ;
              `ifdef FFT_ST_WT16 
  reg  [31:0] io_in_12_Re ;
  reg  [31:0] io_in_12_Im ;
  reg  [31:0] io_in_13_Re ;
  reg  [31:0] io_in_13_Im ;
  reg  [31:0] io_in_14_Re ;
  reg  [31:0] io_in_14_Im ;
  reg  [31:0] io_in_15_Re ;
  reg  [31:0] io_in_15_Im ;
  wire [31:0] io_out_12_Re ;
  wire [31:0] io_out_12_Im ;
  wire [31:0] io_out_13_Re ;
  wire [31:0] io_out_13_Im ;
  wire [31:0] io_out_14_Re ;
  wire [31:0] io_out_14_Im ;
  wire [31:0] io_out_15_Re ;
  wire [31:0] io_out_15_Im ;
                `ifdef FFT_ST_WT18 
  reg  [31:0] io_in_16_Re ;
  reg  [31:0] io_in_16_Im ;
  reg  [31:0] io_in_17_Re ;
  reg  [31:0] io_in_17_Im ;
  wire [31:0] io_out_16_Re ;
  wire [31:0] io_out_16_Im ;
  wire [31:0] io_out_17_Re ;
  wire [31:0] io_out_17_Im ;
                  `ifdef FFT_ST_WT27 
  reg  [31:0] io_in_18_Re ;
  reg  [31:0] io_in_18_Im ;
  reg  [31:0] io_in_19_Re ;
  reg  [31:0] io_in_19_Im ;
  reg  [31:0] io_in_20_Re ;
  reg  [31:0] io_in_20_Im ;
  reg  [31:0] io_in_21_Re ;
  reg  [31:0] io_in_21_Im ;
  reg  [31:0] io_in_22_Re ;
  reg  [31:0] io_in_22_Im ;
  reg  [31:0] io_in_23_Re ;
  reg  [31:0] io_in_23_Im ;
  reg  [31:0] io_in_24_Re ;
  reg  [31:0] io_in_24_Im ;
  reg  [31:0] io_in_25_Re ;
  reg  [31:0] io_in_25_Im ;
  reg  [31:0] io_in_26_Re ;
  reg  [31:0] io_in_26_Im ;
  wire [31:0] io_out_18_Re ;
  wire [31:0] io_out_18_Im ;
  wire [31:0] io_out_19_Re ;
  wire [31:0] io_out_19_Im ;
  wire [31:0] io_out_20_Re ;
  wire [31:0] io_out_20_Im ;
  wire [31:0] io_out_21_Re ;
  wire [31:0] io_out_21_Im ;
  wire [31:0] io_out_22_Re ;
  wire [31:0] io_out_22_Im ;
  wire [31:0] io_out_23_Re ;
  wire [31:0] io_out_23_Im ;
  wire [31:0] io_out_24_Re ;
  wire [31:0] io_out_24_Im ;
  wire [31:0] io_out_25_Re ;
  wire [31:0] io_out_25_Im ;
  wire [31:0] io_out_26_Re ;
  wire [31:0] io_out_26_Im ;
                    `ifdef FFT_ST_WT36 
  reg  [31:0] io_in_27_Re ;
  reg  [31:0] io_in_27_Im ;
  reg  [31:0] io_in_28_Re ;
  reg  [31:0] io_in_28_Im ;
  reg  [31:0] io_in_29_Re ;
  reg  [31:0] io_in_29_Im ;
  reg  [31:0] io_in_30_Re ;
  reg  [31:0] io_in_30_Im ;
  reg  [31:0] io_in_31_Re ;
  reg  [31:0] io_in_31_Im ;
  reg  [31:0] io_in_32_Re ;
  reg  [31:0] io_in_32_Im ;
  reg  [31:0] io_in_33_Re ;
  reg  [31:0] io_in_33_Im ;
  reg  [31:0] io_in_34_Re ;
  reg  [31:0] io_in_34_Im ;
  reg  [31:0] io_in_35_Re ;
  reg  [31:0] io_in_35_Im ;
  wire [31:0] io_out_27_Re ;
  wire [31:0] io_out_27_Im ;
  wire [31:0] io_out_28_Re ;
  wire [31:0] io_out_28_Im ;
  wire [31:0] io_out_29_Re ;
  wire [31:0] io_out_29_Im ;
  wire [31:0] io_out_30_Re ;
  wire [31:0] io_out_30_Im ;
  wire [31:0] io_out_31_Re ;
  wire [31:0] io_out_31_Im ;
  wire [31:0] io_out_32_Re ;
  wire [31:0] io_out_32_Im ;
  wire [31:0] io_out_33_Re ;
  wire [31:0] io_out_33_Im ;
  wire [31:0] io_out_34_Re ;
  wire [31:0] io_out_34_Im ;
  wire [31:0] io_out_35_Re ;
  wire [31:0] io_out_35_Im ;
                      `ifdef FFT_ST_WT96 
  reg  [31:0] io_in_36_Re ;
  reg  [31:0] io_in_36_Im ;
  reg  [31:0] io_in_37_Re ;
  reg  [31:0] io_in_37_Im ;
  reg  [31:0] io_in_38_Re ;
  reg  [31:0] io_in_38_Im ;
  reg  [31:0] io_in_39_Re ;
  reg  [31:0] io_in_39_Im ;
  reg  [31:0] io_in_40_Re ;
  reg  [31:0] io_in_40_Im ;
  reg  [31:0] io_in_41_Re ;
  reg  [31:0] io_in_41_Im ;
  reg  [31:0] io_in_42_Re ;
  reg  [31:0] io_in_42_Im ;
  reg  [31:0] io_in_43_Re ;
  reg  [31:0] io_in_43_Im ;
  reg  [31:0] io_in_44_Re ;
  reg  [31:0] io_in_44_Im ;
  reg  [31:0] io_in_45_Re ;
  reg  [31:0] io_in_45_Im ;
  reg  [31:0] io_in_46_Re ;
  reg  [31:0] io_in_46_Im ;
  reg  [31:0] io_in_47_Re ;
  reg  [31:0] io_in_47_Im ;
  reg  [31:0] io_in_48_Re ;
  reg  [31:0] io_in_48_Im ;
  reg  [31:0] io_in_49_Re ;
  reg  [31:0] io_in_49_Im ;
  reg  [31:0] io_in_50_Re ;
  reg  [31:0] io_in_50_Im ;
  reg  [31:0] io_in_51_Re ;
  reg  [31:0] io_in_51_Im ;
  reg  [31:0] io_in_52_Re ;
  reg  [31:0] io_in_52_Im ;
  reg  [31:0] io_in_53_Re ;
  reg  [31:0] io_in_53_Im ;
  reg  [31:0] io_in_54_Re ;
  reg  [31:0] io_in_54_Im ;
  reg  [31:0] io_in_55_Re ;
  reg  [31:0] io_in_55_Im ;
  reg  [31:0] io_in_56_Re ;
  reg  [31:0] io_in_56_Im ;
  reg  [31:0] io_in_57_Re ;
  reg  [31:0] io_in_57_Im ;
  reg  [31:0] io_in_58_Re ;
  reg  [31:0] io_in_58_Im ;
  reg  [31:0] io_in_59_Re ;
  reg  [31:0] io_in_59_Im ;
  reg  [31:0] io_in_60_Re ;
  reg  [31:0] io_in_60_Im ;
  reg  [31:0] io_in_61_Re ;
  reg  [31:0] io_in_61_Im ;
  reg  [31:0] io_in_62_Re ;
  reg  [31:0] io_in_62_Im ;
  reg  [31:0] io_in_63_Re ;
  reg  [31:0] io_in_63_Im ;
  reg  [31:0] io_in_64_Re ;
  reg  [31:0] io_in_64_Im ;
  reg  [31:0] io_in_65_Re ;
  reg  [31:0] io_in_65_Im ;
  reg  [31:0] io_in_66_Re ;
  reg  [31:0] io_in_66_Im ;
  reg  [31:0] io_in_67_Re ;
  reg  [31:0] io_in_67_Im ;
  reg  [31:0] io_in_68_Re ;
  reg  [31:0] io_in_68_Im ;
  reg  [31:0] io_in_69_Re ;
  reg  [31:0] io_in_69_Im ;
  reg  [31:0] io_in_70_Re ;
  reg  [31:0] io_in_70_Im ;
  reg  [31:0] io_in_71_Re ;
  reg  [31:0] io_in_71_Im ;
  reg  [31:0] io_in_72_Re ;
  reg  [31:0] io_in_72_Im ;
  reg  [31:0] io_in_73_Re ;
  reg  [31:0] io_in_73_Im ;
  reg  [31:0] io_in_74_Re ;
  reg  [31:0] io_in_74_Im ;
  reg  [31:0] io_in_75_Re ;
  reg  [31:0] io_in_75_Im ;
  reg  [31:0] io_in_76_Re ;
  reg  [31:0] io_in_76_Im ;
  reg  [31:0] io_in_77_Re ;
  reg  [31:0] io_in_77_Im ;
  reg  [31:0] io_in_78_Re ;
  reg  [31:0] io_in_78_Im ;
  reg  [31:0] io_in_79_Re ;
  reg  [31:0] io_in_79_Im ;
  reg  [31:0] io_in_80_Re ;
  reg  [31:0] io_in_80_Im ;
  reg  [31:0] io_in_81_Re ;
  reg  [31:0] io_in_81_Im ;
  reg  [31:0] io_in_82_Re ;
  reg  [31:0] io_in_82_Im ;
  reg  [31:0] io_in_83_Re ;
  reg  [31:0] io_in_83_Im ;
  reg  [31:0] io_in_84_Re ;
  reg  [31:0] io_in_84_Im ;
  reg  [31:0] io_in_85_Re ;
  reg  [31:0] io_in_85_Im ;
  reg  [31:0] io_in_86_Re ;
  reg  [31:0] io_in_86_Im ;
  reg  [31:0] io_in_87_Re ;
  reg  [31:0] io_in_87_Im ;
  reg  [31:0] io_in_88_Re ;
  reg  [31:0] io_in_88_Im ;
  reg  [31:0] io_in_89_Re ;
  reg  [31:0] io_in_89_Im ;
  reg  [31:0] io_in_90_Re ;
  reg  [31:0] io_in_90_Im ;
  reg  [31:0] io_in_91_Re ;
  reg  [31:0] io_in_91_Im ;
  reg  [31:0] io_in_92_Re ;
  reg  [31:0] io_in_92_Im ;
  reg  [31:0] io_in_93_Re ;
  reg  [31:0] io_in_93_Im ;
  reg  [31:0] io_in_94_Re ;
  reg  [31:0] io_in_94_Im ;
  reg  [31:0] io_in_95_Re ;
  reg  [31:0] io_in_95_Im ;
  wire [31:0] io_out_36_Re ;
  wire [31:0] io_out_36_Im ;
  wire [31:0] io_out_37_Re ;
  wire [31:0] io_out_37_Im ;
  wire [31:0] io_out_38_Re ;
  wire [31:0] io_out_38_Im ;
  wire [31:0] io_out_39_Re ;
  wire [31:0] io_out_39_Im ;
  wire [31:0] io_out_40_Re ;
  wire [31:0] io_out_40_Im ;
  wire [31:0] io_out_41_Re ;
  wire [31:0] io_out_41_Im ;
  wire [31:0] io_out_42_Re ;
  wire [31:0] io_out_42_Im ;
  wire [31:0] io_out_43_Re ;
  wire [31:0] io_out_43_Im ;
  wire [31:0] io_out_44_Re ;
  wire [31:0] io_out_44_Im ;
  wire [31:0] io_out_45_Re ;
  wire [31:0] io_out_45_Im ;
  wire [31:0] io_out_46_Re ;
  wire [31:0] io_out_46_Im ;
  wire [31:0] io_out_47_Re ;
  wire [31:0] io_out_47_Im ;
  wire [31:0] io_out_48_Re ;
  wire [31:0] io_out_48_Im ;
  wire [31:0] io_out_49_Re ;
  wire [31:0] io_out_49_Im ;
  wire [31:0] io_out_50_Re ;
  wire [31:0] io_out_50_Im ;
  wire [31:0] io_out_51_Re ;
  wire [31:0] io_out_51_Im ;
  wire [31:0] io_out_52_Re ;
  wire [31:0] io_out_52_Im ;
  wire [31:0] io_out_53_Re ;
  wire [31:0] io_out_53_Im ;
  wire [31:0] io_out_54_Re ;
  wire [31:0] io_out_54_Im ;
  wire [31:0] io_out_55_Re ;
  wire [31:0] io_out_55_Im ;
  wire [31:0] io_out_56_Re ;
  wire [31:0] io_out_56_Im ;
  wire [31:0] io_out_57_Re ;
  wire [31:0] io_out_57_Im ;
  wire [31:0] io_out_58_Re ;
  wire [31:0] io_out_58_Im ;
  wire [31:0] io_out_59_Re ;
  wire [31:0] io_out_59_Im ;
  wire [31:0] io_out_60_Re ;
  wire [31:0] io_out_60_Im ;
  wire [31:0] io_out_61_Re ;
  wire [31:0] io_out_61_Im ;
  wire [31:0] io_out_62_Re ;
  wire [31:0] io_out_62_Im ;
  wire [31:0] io_out_63_Re ;
  wire [31:0] io_out_63_Im ;
  wire [31:0] io_out_64_Re ;
  wire [31:0] io_out_64_Im ;
  wire [31:0] io_out_65_Re ;
  wire [31:0] io_out_65_Im ;
  wire [31:0] io_out_66_Re ;
  wire [31:0] io_out_66_Im ;
  wire [31:0] io_out_67_Re ;
  wire [31:0] io_out_67_Im ;
  wire [31:0] io_out_68_Re ;
  wire [31:0] io_out_68_Im ;
  wire [31:0] io_out_69_Re ;
  wire [31:0] io_out_69_Im ;
  wire [31:0] io_out_70_Re ;
  wire [31:0] io_out_70_Im ;
  wire [31:0] io_out_71_Re ;
  wire [31:0] io_out_71_Im ;
  wire [31:0] io_out_72_Re ;
  wire [31:0] io_out_72_Im ;
  wire [31:0] io_out_73_Re ;
  wire [31:0] io_out_73_Im ;
  wire [31:0] io_out_74_Re ;
  wire [31:0] io_out_74_Im ;
  wire [31:0] io_out_75_Re ;
  wire [31:0] io_out_75_Im ;
  wire [31:0] io_out_76_Re ;
  wire [31:0] io_out_76_Im ;
  wire [31:0] io_out_77_Re ;
  wire [31:0] io_out_77_Im ;
  wire [31:0] io_out_78_Re ;
  wire [31:0] io_out_78_Im ;
  wire [31:0] io_out_79_Re ;
  wire [31:0] io_out_79_Im ;
  wire [31:0] io_out_80_Re ;
  wire [31:0] io_out_80_Im ;
  wire [31:0] io_out_81_Re ;
  wire [31:0] io_out_81_Im ;
  wire [31:0] io_out_82_Re ;
  wire [31:0] io_out_82_Im ;
  wire [31:0] io_out_83_Re ;
  wire [31:0] io_out_83_Im ;
  wire [31:0] io_out_84_Re ;
  wire [31:0] io_out_84_Im ;
  wire [31:0] io_out_85_Re ;
  wire [31:0] io_out_85_Im ;
  wire [31:0] io_out_86_Re ;
  wire [31:0] io_out_86_Im ;
  wire [31:0] io_out_87_Re ;
  wire [31:0] io_out_87_Im ;
  wire [31:0] io_out_88_Re ;
  wire [31:0] io_out_88_Im ;
  wire [31:0] io_out_89_Re ;
  wire [31:0] io_out_89_Im ;
  wire [31:0] io_out_90_Re ;
  wire [31:0] io_out_90_Im ;
  wire [31:0] io_out_91_Re ;
  wire [31:0] io_out_91_Im ;
  wire [31:0] io_out_92_Re ;
  wire [31:0] io_out_92_Im ;
  wire [31:0] io_out_93_Re ;
  wire [31:0] io_out_93_Im ;
  wire [31:0] io_out_94_Re ;
  wire [31:0] io_out_94_Im ;
  wire [31:0] io_out_95_Re ;
  wire [31:0] io_out_95_Im ;
		      `endif
                    `endif
                  `endif
	        `endif
              `endif
	    `endif
	  `endif
        `endif
      `endif
    `endif
  `endif
`endif

//---------------------------------------------------------
//--- golden model and input file 
//---------------------------------------------------------
reg [31:0]  output_io_out[2*`FFT_LEN*`TEST_SIZE-1:0];
reg [31:0]  input_io_in[2*`FFT_LEN*`TEST_SIZE-1:0];

//---------------------------------------------------------
//--- Load memory array 
//---------------------------------------------------------
initial begin
`ifdef GOLDEN_FFT2
   $readmemh("../golden/golden_dft2/inputfile.txt" ,input_io_in);
   $readmemh("../golden/golden_dft2/outputfile.txt",output_io_out);
`elsif GOLDEN_FFT3
   $readmemh("../golden/golden_dft3/inputfile.txt" ,input_io_in);
   $readmemh("../golden/golden_dft3/outputfile.txt",output_io_out);
`elsif GOLDEN_FFT4
   $readmemh("../golden/golden_fft4/inputfile.txt" ,input_io_in);
   $readmemh("../golden/golden_fft4/outputfile.txt",output_io_out);
`elsif GOLDEN_FFT8
   $readmemh("../golden/golden_fft8/inputfile.txt" ,input_io_in);
   $readmemh("../golden/golden_fft8/outputfile.txt",output_io_out);
`elsif GOLDEN_FFT16
   $readmemh("../golden/golden_fft16/inputfile.txt" ,input_io_in);
   $readmemh("../golden/golden_fft16/outputfile.txt",output_io_out);
`elsif GOLDEN_FFT9
   $readmemh("../golden/golden_fft9/inputfile.txt" ,input_io_in);
   $readmemh("../golden/golden_fft9/outputfile.txt",output_io_out);
`elsif GOLDEN_FFT27
   $readmemh("../golden/golden_fft27/inputfile.txt" ,input_io_in);
   $readmemh("../golden/golden_fft27/outputfile.txt",output_io_out);
`elsif GOLDEN_FFT6
   $readmemh("../golden/golden_fft6/inputfile.txt" ,input_io_in);
   $readmemh("../golden/golden_fft6/outputfile.txt",output_io_out);
`elsif GOLDEN_FFT12
   $readmemh("../golden/golden_fft12/inputfile.txt" ,input_io_in);
   $readmemh("../golden/golden_fft12/outputfile.txt",output_io_out);
`elsif GOLDEN_FFT18
   $readmemh("../golden/golden_fft18/inputfile.txt" ,input_io_in);
   $readmemh("../golden/golden_fft18/outputfile.txt",output_io_out);
`elsif GOLDEN_FFT36
   $readmemh("../golden/golden_fft36/inputfile.txt" ,input_io_in);
   $readmemh("../golden/golden_fft36/outputfile.txt",output_io_out);
`elsif GOLDEN_FFT96
   $readmemh("../golden/golden_fft96/inputfile.txt" ,input_io_in);
   $readmemh("../golden/golden_fft96/outputfile.txt",output_io_out);
`endif
end


//---------------------------------------------------------
//--- Instantiation 
//---------------------------------------------------------
`ifdef DFT_R2
  `ifdef DFT_R2_V2_RV
DFT_r2_v2_rv u_DFT_r2_v2_rv (
  `else 
DFT_r2 u_DFT_r2 (
  `endif
`elsif DFT_R3
  `ifdef DFT_R3_V2_RV
DFT_r3_v2_rv u_DFT_r3_v2_rv (
  `else 
DFT_r3 u_DFT_r3 (
  `endif
`elsif FFT_SR4_R2
  `ifdef FFT_SR4_R2_V2
FFT_sr4_r2_v2 u_FFT_sr4_r2_v2 (
  `else
FFT_sr4_r2 u_FFT_sr4_r2 (
  `endif
`elsif FFT_SR8_R2
  `ifdef FFT_SR8_R2_V2
FFT_sr8_r2_v2 u_FFT_sr8_r2_v2 (
  `else
FFT_sr8_r2 u_FFT_sr8_r2 (
  `endif
`elsif FFT_SR16_R2
  `ifdef FFT_SR16_R2_V2
FFT_sr16_r2_v2 u_FFT_sr16_r2_v2 (
  `endif
`elsif FFT_SR9_R3
  `ifdef FFT_SR9_R3_V2
FFT_sr9_r3_v2 u_FFT_sr9_r3_v2 (
  `else
FFT_sr9_r3 u_FFT_sr9_r3 (
  `endif
`elsif FFT_SR27_R3
  `ifdef FFT_SR27_R3_V2
FFT_sr27_r3_v2 u_FFT_sr27_r3_v2 (
  `else
FFT_sr27_r3 u_FFT_sr27_r3 (
  `endif
`elsif FFT_MR6_BASIC
FFT_mr6_basic u_FFT_mr6_basic (
`elsif FFT_MR12_BASIC
FFT_mr12_basic u_FFT_mr12_basic (
`elsif FFT_MR18_BASIC
FFT_mr18_basic u_FFT_mr18_basic (
`elsif FFT_MR36_BASIC
FFT_mr36_basic u_FFT_mr36_basic (
`elsif FFT_MR96_BASIC
FFT_mr96_basic u_FFT_mr96_basic (
`elsif FFT_422_STREAMING
FFT_422_streaming u_FFT_422_streaming   (          
`elsif FFT_822_STREAMING                
FFT_822_streaming u_FFT_822_streaming   (
`elsif FFT_824_STREAMING                
FFT_824_streaming u_FFT_824_streaming   (
`elsif FFT_933_STREAMING                
FFT_933_streaming u_FFT_933_streaming   (
`elsif FFT_2733_STREAMING               
FFT_2733_streaming u_FFT_2733_streaming (
`elsif FFT_2739_STREAMING               
FFT_2739_streaming u_FFT_2739_streaming (
`endif
                 .clock           (clock           ),
                 .reset           (reset           ),
		 .io_in_ready     (io_in_ready     ),
		 .io_out_validate (io_out_validate ),
`ifdef FFT_ST_WT2
                 .io_in_0_Re      (io_in_0_Re      ),
                 .io_in_0_Im      (io_in_0_Im      ),
                 .io_in_1_Re      (io_in_1_Re      ),
                 .io_in_1_Im      (io_in_1_Im      ),
                 .io_out_0_Re     (io_out_0_Re     ),
                 .io_out_0_Im     (io_out_0_Im     ),
                 .io_out_1_Re     (io_out_1_Re     ),
                 .io_out_1_Im     (io_out_1_Im     )
  `ifdef FFT_ST_WT3
	         ,
                 .io_in_2_Re      (io_in_2_Re      ),
                 .io_in_2_Im      (io_in_2_Im      ),
                 .io_out_2_Re     (io_out_2_Re     ),
                 .io_out_2_Im     (io_out_2_Im     )
    `ifdef FFT_ST_WT4
	         ,
                 .io_in_3_Re      (io_in_3_Re      ),
                 .io_in_3_Im      (io_in_3_Im      ),
                 .io_out_3_Re      (io_out_3_Re    ),
                 .io_out_3_Im      (io_out_3_Im    )
      `ifdef FFT_ST_WT6
	         ,
                 .io_in_4_Re      (io_in_4_Re      ),
                 .io_in_4_Im      (io_in_4_Im      ),
                 .io_in_5_Re      (io_in_5_Re      ),
                 .io_in_5_Im      (io_in_5_Im      ),
                 .io_out_4_Re     (io_out_4_Re     ),
                 .io_out_4_Im     (io_out_4_Im     ),
                 .io_out_5_Re     (io_out_5_Re     ),
                 .io_out_5_Im     (io_out_5_Im     )
        `ifdef FFT_ST_WT8
	         ,
                 .io_in_6_Re      (io_in_6_Re      ),
                 .io_in_6_Im      (io_in_6_Im      ),
                 .io_in_7_Re      (io_in_7_Re      ),
                 .io_in_7_Im      (io_in_7_Im      ),
                 .io_out_6_Re     (io_out_6_Re     ),
                 .io_out_6_Im     (io_out_6_Im     ),
                 .io_out_7_Re     (io_out_7_Re     ),
                 .io_out_7_Im     (io_out_7_Im     )
          `ifdef FFT_ST_WT9
	         ,
                 .io_in_8_Re      (io_in_8_Re      ),
                 .io_in_8_Im      (io_in_8_Im      ),
                 .io_out_8_Re     (io_out_8_Re     ),
                 .io_out_8_Im     (io_out_8_Im     )
            `ifdef FFT_ST_WT12
	         ,
                 .io_in_9_Re      (io_in_9_Re      ),
                 .io_in_9_Im      (io_in_9_Im      ),
                 .io_in_10_Re     (io_in_10_Re     ),
                 .io_in_10_Im     (io_in_10_Im     ),
                 .io_in_11_Re     (io_in_11_Re     ),
                 .io_in_11_Im     (io_in_11_Im     ),
                 .io_out_9_Re     (io_out_9_Re     ),
                 .io_out_9_Im     (io_out_9_Im     ),
                 .io_out_10_Re    (io_out_10_Re    ),
                 .io_out_10_Im    (io_out_10_Im    ),
                 .io_out_11_Re    (io_out_11_Re    ),
                 .io_out_11_Im    (io_out_11_Im    )
              `ifdef FFT_ST_WT16
	         ,
                 .io_in_12_Re     (io_in_12_Re     ),
                 .io_in_12_Im     (io_in_12_Im     ),
                 .io_in_13_Re     (io_in_13_Re     ),
                 .io_in_13_Im     (io_in_13_Im     ),
                 .io_in_14_Re     (io_in_14_Re     ),
                 .io_in_14_Im     (io_in_14_Im     ),
                 .io_in_15_Re     (io_in_15_Re     ),
                 .io_in_15_Im     (io_in_15_Im     ),
                 .io_out_12_Re    (io_out_12_Re    ),
                 .io_out_12_Im    (io_out_12_Im    ),
                 .io_out_13_Re    (io_out_13_Re    ),
                 .io_out_13_Im    (io_out_13_Im    ),
                 .io_out_14_Re    (io_out_14_Re    ),
                 .io_out_14_Im    (io_out_14_Im    ),
                 .io_out_15_Re    (io_out_15_Re    ),
                 .io_out_15_Im    (io_out_15_Im    )
                `ifdef FFT_ST_WT18
	         ,
                 .io_in_16_Re     (io_in_16_Re     ),
                 .io_in_16_Im     (io_in_16_Im     ),
                 .io_in_17_Re     (io_in_17_Re     ),
                 .io_in_17_Im     (io_in_17_Im     ),
                 .io_out_16_Re    (io_out_16_Re    ),
                 .io_out_16_Im    (io_out_16_Im    ),
                 .io_out_17_Re    (io_out_17_Re    ),
                 .io_out_17_Im    (io_out_17_Im    )
                  `ifdef FFT_ST_WT27
	         ,
                 .io_in_18_Re     (io_in_18_Re     ),
                 .io_in_18_Im     (io_in_18_Im     ),
                 .io_in_19_Re     (io_in_19_Re     ),
                 .io_in_19_Im     (io_in_19_Im     ),
                 .io_in_20_Re     (io_in_20_Re     ),
                 .io_in_20_Im     (io_in_20_Im     ),
                 .io_in_21_Re     (io_in_21_Re     ),
                 .io_in_21_Im     (io_in_21_Im     ),
                 .io_in_22_Re     (io_in_22_Re     ),
                 .io_in_22_Im     (io_in_22_Im     ),
                 .io_in_23_Re     (io_in_23_Re     ),
                 .io_in_23_Im     (io_in_23_Im     ),
                 .io_in_24_Re     (io_in_24_Re     ),
                 .io_in_24_Im     (io_in_24_Im     ),
                 .io_in_25_Re     (io_in_25_Re     ),
                 .io_in_25_Im     (io_in_25_Im     ),
                 .io_in_26_Re     (io_in_26_Re     ),
                 .io_in_26_Im     (io_in_26_Im     ),
                 .io_out_18_Re    (io_out_18_Re    ),
                 .io_out_18_Im    (io_out_18_Im    ),
                 .io_out_19_Re    (io_out_19_Re    ),
                 .io_out_19_Im    (io_out_19_Im    ),
                 .io_out_20_Re    (io_out_20_Re    ),
                 .io_out_20_Im    (io_out_20_Im    ),
                 .io_out_21_Re    (io_out_21_Re    ),
                 .io_out_21_Im    (io_out_21_Im    ),
                 .io_out_22_Re    (io_out_22_Re    ),
                 .io_out_22_Im    (io_out_22_Im    ),
                 .io_out_23_Re    (io_out_23_Re    ),
                 .io_out_23_Im    (io_out_23_Im    ),
                 .io_out_24_Re    (io_out_24_Re    ),
                 .io_out_24_Im    (io_out_24_Im    ),
                 .io_out_25_Re    (io_out_25_Re    ),
                 .io_out_25_Im    (io_out_25_Im    ),
                 .io_out_26_Re    (io_out_26_Re    ),
                 .io_out_26_Im    (io_out_26_Im    )
                    `ifdef FFT_ST_WT36
	         ,
                 .io_in_27_Re     (io_in_27_Re     ),
                 .io_in_27_Im     (io_in_27_Im     ),
                 .io_in_28_Re     (io_in_28_Re     ),
                 .io_in_28_Im     (io_in_28_Im     ),
                 .io_in_29_Re     (io_in_29_Re     ),
                 .io_in_29_Im     (io_in_29_Im     ),
                 .io_in_30_Re     (io_in_30_Re     ),
                 .io_in_30_Im     (io_in_30_Im     ),
                 .io_in_31_Re     (io_in_31_Re     ),
                 .io_in_31_Im     (io_in_31_Im     ),
                 .io_in_32_Re     (io_in_32_Re     ),
                 .io_in_32_Im     (io_in_32_Im     ),
                 .io_in_33_Re     (io_in_33_Re     ),
                 .io_in_33_Im     (io_in_33_Im     ),
                 .io_in_34_Re     (io_in_34_Re     ),
                 .io_in_34_Im     (io_in_34_Im     ),
                 .io_in_35_Re     (io_in_35_Re     ),
                 .io_in_35_Im     (io_in_35_Im     ),
                 .io_out_27_Re    (io_out_27_Re    ),
                 .io_out_27_Im    (io_out_27_Im    ),
                 .io_out_28_Re    (io_out_28_Re    ),
                 .io_out_28_Im    (io_out_28_Im    ),
                 .io_out_29_Re    (io_out_29_Re    ),
                 .io_out_29_Im    (io_out_29_Im    ),
                 .io_out_30_Re    (io_out_30_Re    ),
                 .io_out_30_Im    (io_out_30_Im    ),
                 .io_out_31_Re    (io_out_31_Re    ),
                 .io_out_31_Im    (io_out_31_Im    ),
                 .io_out_32_Re    (io_out_32_Re    ),
                 .io_out_32_Im    (io_out_32_Im    ),
                 .io_out_33_Re    (io_out_33_Re    ),
                 .io_out_33_Im    (io_out_33_Im    ),
                 .io_out_34_Re    (io_out_34_Re    ),
                 .io_out_34_Im    (io_out_34_Im    ),
                 .io_out_35_Re    (io_out_35_Re    ),
                 .io_out_35_Im    (io_out_35_Im    )
                      `ifdef FFT_ST_WT96 
		 ,
                 .io_in_36_Re     (io_in_36_Re    ),
                 .io_in_36_Im     (io_in_36_Im    ),
                 .io_in_37_Re     (io_in_37_Re    ),
                 .io_in_37_Im     (io_in_37_Im    ),
                 .io_in_38_Re     (io_in_38_Re    ),
                 .io_in_38_Im     (io_in_38_Im    ),
                 .io_in_39_Re     (io_in_39_Re    ),
                 .io_in_39_Im     (io_in_39_Im    ),
                 .io_in_40_Re     (io_in_40_Re    ),
                 .io_in_40_Im     (io_in_40_Im    ),
                 .io_in_41_Re     (io_in_41_Re    ),
                 .io_in_41_Im     (io_in_41_Im    ),
                 .io_in_42_Re     (io_in_42_Re    ),
                 .io_in_42_Im     (io_in_42_Im    ),
                 .io_in_43_Re     (io_in_43_Re    ),
                 .io_in_43_Im     (io_in_43_Im    ),
                 .io_in_44_Re     (io_in_44_Re    ),
                 .io_in_44_Im     (io_in_44_Im    ),
                 .io_in_45_Re     (io_in_45_Re    ),
                 .io_in_45_Im     (io_in_45_Im    ),
                 .io_in_46_Re     (io_in_46_Re    ),
                 .io_in_46_Im     (io_in_46_Im    ),
                 .io_in_47_Re     (io_in_47_Re    ),
                 .io_in_47_Im     (io_in_47_Im    ),
                 .io_in_48_Re     (io_in_48_Re    ),
                 .io_in_48_Im     (io_in_48_Im    ),
                 .io_in_49_Re     (io_in_49_Re    ),
                 .io_in_49_Im     (io_in_49_Im    ),
                 .io_in_50_Re     (io_in_50_Re    ),
                 .io_in_50_Im     (io_in_50_Im    ),
                 .io_in_51_Re     (io_in_51_Re    ),
                 .io_in_51_Im     (io_in_51_Im    ),
                 .io_in_52_Re     (io_in_52_Re    ),
                 .io_in_52_Im     (io_in_52_Im    ),
                 .io_in_53_Re     (io_in_53_Re    ),
                 .io_in_53_Im     (io_in_53_Im    ),
                 .io_in_54_Re     (io_in_54_Re    ),
                 .io_in_54_Im     (io_in_54_Im    ),
                 .io_in_55_Re     (io_in_55_Re    ),
                 .io_in_55_Im     (io_in_55_Im    ),
                 .io_in_56_Re     (io_in_56_Re    ),
                 .io_in_56_Im     (io_in_56_Im    ),
                 .io_in_57_Re     (io_in_57_Re    ),
                 .io_in_57_Im     (io_in_57_Im    ),
                 .io_in_58_Re     (io_in_58_Re    ),
                 .io_in_58_Im     (io_in_58_Im    ),
                 .io_in_59_Re     (io_in_59_Re    ),
                 .io_in_59_Im     (io_in_59_Im    ),
                 .io_in_60_Re     (io_in_60_Re    ),
                 .io_in_60_Im     (io_in_60_Im    ),
                 .io_in_61_Re     (io_in_61_Re    ),
                 .io_in_61_Im     (io_in_61_Im    ),
                 .io_in_62_Re     (io_in_62_Re    ),
                 .io_in_62_Im     (io_in_62_Im    ),
                 .io_in_63_Re     (io_in_63_Re    ),
                 .io_in_63_Im     (io_in_63_Im    ),
                 .io_in_64_Re     (io_in_64_Re    ),
                 .io_in_64_Im     (io_in_64_Im    ),
                 .io_in_65_Re     (io_in_65_Re    ),
                 .io_in_65_Im     (io_in_65_Im    ),
                 .io_in_66_Re     (io_in_66_Re    ),
                 .io_in_66_Im     (io_in_66_Im    ),
                 .io_in_67_Re     (io_in_67_Re    ),
                 .io_in_67_Im     (io_in_67_Im    ),
                 .io_in_68_Re     (io_in_68_Re    ),
                 .io_in_68_Im     (io_in_68_Im    ),
                 .io_in_69_Re     (io_in_69_Re    ),
                 .io_in_69_Im     (io_in_69_Im    ),
                 .io_in_70_Re     (io_in_70_Re    ),
                 .io_in_70_Im     (io_in_70_Im    ),
                 .io_in_71_Re     (io_in_71_Re    ),
                 .io_in_71_Im     (io_in_71_Im    ),
                 .io_in_72_Re     (io_in_72_Re    ),
                 .io_in_72_Im     (io_in_72_Im    ),
                 .io_in_73_Re     (io_in_73_Re    ),
                 .io_in_73_Im     (io_in_73_Im    ),
                 .io_in_74_Re     (io_in_74_Re    ),
                 .io_in_74_Im     (io_in_74_Im    ),
                 .io_in_75_Re     (io_in_75_Re    ),
                 .io_in_75_Im     (io_in_75_Im    ),
                 .io_in_76_Re     (io_in_76_Re    ),
                 .io_in_76_Im     (io_in_76_Im    ),
                 .io_in_77_Re     (io_in_77_Re    ),
                 .io_in_77_Im     (io_in_77_Im    ),
                 .io_in_78_Re     (io_in_78_Re    ),
                 .io_in_78_Im     (io_in_78_Im    ),
                 .io_in_79_Re     (io_in_79_Re    ),
                 .io_in_79_Im     (io_in_79_Im    ),
                 .io_in_80_Re     (io_in_80_Re    ),
                 .io_in_80_Im     (io_in_80_Im    ),
                 .io_in_81_Re     (io_in_81_Re    ),
                 .io_in_81_Im     (io_in_81_Im    ),
                 .io_in_82_Re     (io_in_82_Re    ),
                 .io_in_82_Im     (io_in_82_Im    ),
                 .io_in_83_Re     (io_in_83_Re    ),
                 .io_in_83_Im     (io_in_83_Im    ),
                 .io_in_84_Re     (io_in_84_Re    ),
                 .io_in_84_Im     (io_in_84_Im    ),
                 .io_in_85_Re     (io_in_85_Re    ),
                 .io_in_85_Im     (io_in_85_Im    ),
                 .io_in_86_Re     (io_in_86_Re    ),
                 .io_in_86_Im     (io_in_86_Im    ),
                 .io_in_87_Re     (io_in_87_Re    ),
                 .io_in_87_Im     (io_in_87_Im    ),
                 .io_in_88_Re     (io_in_88_Re    ),
                 .io_in_88_Im     (io_in_88_Im    ),
                 .io_in_89_Re     (io_in_89_Re    ),
                 .io_in_89_Im     (io_in_89_Im    ),
                 .io_in_90_Re     (io_in_90_Re    ),
                 .io_in_90_Im     (io_in_90_Im    ),
                 .io_in_91_Re     (io_in_91_Re    ),
                 .io_in_91_Im     (io_in_91_Im    ),
                 .io_in_92_Re     (io_in_92_Re    ),
                 .io_in_92_Im     (io_in_92_Im    ),
                 .io_in_93_Re     (io_in_93_Re    ),
                 .io_in_93_Im     (io_in_93_Im    ),
                 .io_in_94_Re     (io_in_94_Re    ),
                 .io_in_94_Im     (io_in_94_Im    ),
                 .io_in_95_Re     (io_in_95_Re    ),
                 .io_in_95_Im     (io_in_95_Im    ),
                 .io_out_36_Re    (io_out_36_Re   ),
                 .io_out_36_Im    (io_out_36_Im   ),
                 .io_out_37_Re    (io_out_37_Re   ),
                 .io_out_37_Im    (io_out_37_Im   ),
                 .io_out_38_Re    (io_out_38_Re   ),
                 .io_out_38_Im    (io_out_38_Im   ),
                 .io_out_39_Re    (io_out_39_Re   ),
                 .io_out_39_Im    (io_out_39_Im   ),
                 .io_out_40_Re    (io_out_40_Re   ),
                 .io_out_40_Im    (io_out_40_Im   ),
                 .io_out_41_Re    (io_out_41_Re   ),
                 .io_out_41_Im    (io_out_41_Im   ),
                 .io_out_42_Re    (io_out_42_Re   ),
                 .io_out_42_Im    (io_out_42_Im   ),
                 .io_out_43_Re    (io_out_43_Re   ),
                 .io_out_43_Im    (io_out_43_Im   ),
                 .io_out_44_Re    (io_out_44_Re   ),
                 .io_out_44_Im    (io_out_44_Im   ),
                 .io_out_45_Re    (io_out_45_Re   ),
                 .io_out_45_Im    (io_out_45_Im   ),
                 .io_out_46_Re    (io_out_46_Re   ),
                 .io_out_46_Im    (io_out_46_Im   ),
                 .io_out_47_Re    (io_out_47_Re   ),
                 .io_out_47_Im    (io_out_47_Im   ),
                 .io_out_48_Re    (io_out_48_Re   ),
                 .io_out_48_Im    (io_out_48_Im   ),
                 .io_out_49_Re    (io_out_49_Re   ),
                 .io_out_49_Im    (io_out_49_Im   ),
                 .io_out_50_Re    (io_out_50_Re   ),
                 .io_out_50_Im    (io_out_50_Im   ),
                 .io_out_51_Re    (io_out_51_Re   ),
                 .io_out_51_Im    (io_out_51_Im   ),
                 .io_out_52_Re    (io_out_52_Re   ),
                 .io_out_52_Im    (io_out_52_Im   ),
                 .io_out_53_Re    (io_out_53_Re   ),
                 .io_out_53_Im    (io_out_53_Im   ),
                 .io_out_54_Re    (io_out_54_Re   ),
                 .io_out_54_Im    (io_out_54_Im   ),
                 .io_out_55_Re    (io_out_55_Re   ),
                 .io_out_55_Im    (io_out_55_Im   ),
                 .io_out_56_Re    (io_out_56_Re   ),
                 .io_out_56_Im    (io_out_56_Im   ),
                 .io_out_57_Re    (io_out_57_Re   ),
                 .io_out_57_Im    (io_out_57_Im   ),
                 .io_out_58_Re    (io_out_58_Re   ),
                 .io_out_58_Im    (io_out_58_Im   ),
                 .io_out_59_Re    (io_out_59_Re   ),
                 .io_out_59_Im    (io_out_59_Im   ),
                 .io_out_60_Re    (io_out_60_Re   ),
                 .io_out_60_Im    (io_out_60_Im   ),
                 .io_out_61_Re    (io_out_61_Re   ),
                 .io_out_61_Im    (io_out_61_Im   ),
                 .io_out_62_Re    (io_out_62_Re   ),
                 .io_out_62_Im    (io_out_62_Im   ),
                 .io_out_63_Re    (io_out_63_Re   ),
                 .io_out_63_Im    (io_out_63_Im   ),
                 .io_out_64_Re    (io_out_64_Re   ),
                 .io_out_64_Im    (io_out_64_Im   ),
                 .io_out_65_Re    (io_out_65_Re   ),
                 .io_out_65_Im    (io_out_65_Im   ),
                 .io_out_66_Re    (io_out_66_Re   ),
                 .io_out_66_Im    (io_out_66_Im   ),
                 .io_out_67_Re    (io_out_67_Re   ),
                 .io_out_67_Im    (io_out_67_Im   ),
                 .io_out_68_Re    (io_out_68_Re   ),
                 .io_out_68_Im    (io_out_68_Im   ),
                 .io_out_69_Re    (io_out_69_Re   ),
                 .io_out_69_Im    (io_out_69_Im   ),
                 .io_out_70_Re    (io_out_70_Re   ),
                 .io_out_70_Im    (io_out_70_Im   ),
                 .io_out_71_Re    (io_out_71_Re   ),
                 .io_out_71_Im    (io_out_71_Im   ),
                 .io_out_72_Re    (io_out_72_Re   ),
                 .io_out_72_Im    (io_out_72_Im   ),
                 .io_out_73_Re    (io_out_73_Re   ),
                 .io_out_73_Im    (io_out_73_Im   ),
                 .io_out_74_Re    (io_out_74_Re   ),
                 .io_out_74_Im    (io_out_74_Im   ),
                 .io_out_75_Re    (io_out_75_Re   ),
                 .io_out_75_Im    (io_out_75_Im   ),
                 .io_out_76_Re    (io_out_76_Re   ),
                 .io_out_76_Im    (io_out_76_Im   ),
                 .io_out_77_Re    (io_out_77_Re   ),
                 .io_out_77_Im    (io_out_77_Im   ),
                 .io_out_78_Re    (io_out_78_Re   ),
                 .io_out_78_Im    (io_out_78_Im   ),
                 .io_out_79_Re    (io_out_79_Re   ),
                 .io_out_79_Im    (io_out_79_Im   ),
                 .io_out_80_Re    (io_out_80_Re   ),
                 .io_out_80_Im    (io_out_80_Im   ),
                 .io_out_81_Re    (io_out_81_Re   ),
                 .io_out_81_Im    (io_out_81_Im   ),
                 .io_out_82_Re    (io_out_82_Re   ),
                 .io_out_82_Im    (io_out_82_Im   ),
                 .io_out_83_Re    (io_out_83_Re   ),
                 .io_out_83_Im    (io_out_83_Im   ),
                 .io_out_84_Re    (io_out_84_Re   ),
                 .io_out_84_Im    (io_out_84_Im   ),
                 .io_out_85_Re    (io_out_85_Re   ),
                 .io_out_85_Im    (io_out_85_Im   ),
                 .io_out_86_Re    (io_out_86_Re   ),
                 .io_out_86_Im    (io_out_86_Im   ),
                 .io_out_87_Re    (io_out_87_Re   ),
                 .io_out_87_Im    (io_out_87_Im   ),
                 .io_out_88_Re    (io_out_88_Re   ),
                 .io_out_88_Im    (io_out_88_Im   ),
                 .io_out_89_Re    (io_out_89_Re   ),
                 .io_out_89_Im    (io_out_89_Im   ),
                 .io_out_90_Re    (io_out_90_Re   ),
                 .io_out_90_Im    (io_out_90_Im   ),
                 .io_out_91_Re    (io_out_91_Re   ),
                 .io_out_91_Im    (io_out_91_Im   ),
                 .io_out_92_Re    (io_out_92_Re   ),
                 .io_out_92_Im    (io_out_92_Im   ),
                 .io_out_93_Re    (io_out_93_Re   ),
                 .io_out_93_Im    (io_out_93_Im   ),
                 .io_out_94_Re    (io_out_94_Re   ),
                 .io_out_94_Im    (io_out_94_Im   ),
                 .io_out_95_Re    (io_out_95_Re   ),
                 .io_out_95_Im    (io_out_95_Im   )
		      `endif
                    `endif
                  `endif
	        `endif
              `endif
	    `endif
	  `endif
        `endif
      `endif
    `endif
  `endif
`endif
);


//FFT_422_STREAMING
//FFT_822_STREAMING 
//FFT_824_STREAMING
//FFT_933_STREAMING
//FFT_2733_STREAMING
//FFT_2739_STREAMING
//GOLDEN_FFT4
//GOLDEN_FFT8
//GOLDEN_FFT9
//GOLDEN_FFT27

//---------------------------------------------------------------------
//------- BFM
//---------------------------------------------------------------------
task initial_input;
begin
`ifdef FFT_ST_WT2
   io_in_0_Re = 32'h0;
   io_in_0_Im = 32'h0;
   io_in_1_Re = 32'h0;
   io_in_1_Im = 32'h0;
  `ifdef FFT_ST_WT3
   io_in_2_Re = 32'h0;
   io_in_2_Im = 32'h0;
    `ifdef FFT_ST_WT4
   io_in_3_Re = 32'h0;
   io_in_3_Im = 32'h0;
      `ifdef FFT_ST_WT6
   io_in_4_Re = 32'h0;
   io_in_4_Im = 32'h0;
   io_in_5_Re = 32'h0;
   io_in_5_Im = 32'h0;
        `ifdef FFT_ST_WT8
   io_in_6_Re = 32'h0;
   io_in_6_Im = 32'h0;
   io_in_7_Re = 32'h0;
   io_in_7_Im = 32'h0;
           `ifdef FFT_ST_WT9
   io_in_8_Re = 32'h0;
   io_in_8_Im = 32'h0;
             `ifdef FFT_ST_WT12
   io_in_9_Re = 32'h0;
   io_in_9_Im = 32'h0;
   io_in_10_Re = 32'h0;
   io_in_10_Im = 32'h0;
   io_in_11_Re = 32'h0;
   io_in_11_Im = 32'h0;
               `ifdef FFT_ST_WT16
   io_in_12_Re = 32'h0;
   io_in_12_Im = 32'h0;
   io_in_13_Re = 32'h0;
   io_in_13_Im = 32'h0;
   io_in_14_Re = 32'h0;
   io_in_14_Im = 32'h0;
   io_in_15_Re = 32'h0;
   io_in_15_Im = 32'h0;
                 `ifdef FFT_ST_WT18
   io_in_16_Re = 32'h0; 
   io_in_16_Im = 32'h0; 
   io_in_17_Re = 32'h0; 
   io_in_17_Im = 32'h0; 
                   `ifdef FFT_ST_WT27
   io_in_18_Re = 32'h0;  
   io_in_18_Im = 32'h0;  
   io_in_19_Re = 32'h0;  
   io_in_19_Im = 32'h0;  
   io_in_20_Re = 32'h0; 
   io_in_20_Im = 32'h0; 
   io_in_21_Re = 32'h0; 
   io_in_21_Im = 32'h0; 
   io_in_22_Re = 32'h0; 
   io_in_22_Im = 32'h0; 
   io_in_23_Re = 32'h0; 
   io_in_23_Im = 32'h0; 
   io_in_24_Re = 32'h0; 
   io_in_24_Im = 32'h0; 
   io_in_25_Re = 32'h0; 
   io_in_25_Im = 32'h0; 
   io_in_26_Re = 32'h0; 
   io_in_26_Im = 32'h0; 
                     `ifdef FFT_ST_WT36
   io_in_27_Re = 32'h0; 
   io_in_27_Im = 32'h0; 
   io_in_28_Re = 32'h0; 
   io_in_28_Im = 32'h0; 
   io_in_29_Re = 32'h0; 
   io_in_29_Im = 32'h0; 
   io_in_30_Re = 32'h0;
   io_in_30_Im = 32'h0;
   io_in_31_Re = 32'h0;
   io_in_31_Im = 32'h0;
   io_in_32_Re = 32'h0;
   io_in_32_Im = 32'h0;
   io_in_33_Re = 32'h0;
   io_in_33_Im = 32'h0;
   io_in_34_Re = 32'h0;
   io_in_34_Im = 32'h0;
   io_in_35_Re = 32'h0;
   io_in_35_Im = 32'h0;
                      `ifdef FFT_ST_WT96 
   io_in_36_Re = 32'h0;
   io_in_36_Im = 32'h0;
   io_in_37_Re = 32'h0;
   io_in_37_Im = 32'h0;
   io_in_38_Re = 32'h0;
   io_in_38_Im = 32'h0;
   io_in_39_Re = 32'h0;
   io_in_39_Im = 32'h0;
   io_in_40_Re = 32'h0;
   io_in_40_Im = 32'h0;
   io_in_41_Re = 32'h0;
   io_in_41_Im = 32'h0;
   io_in_42_Re = 32'h0;
   io_in_42_Im = 32'h0;
   io_in_43_Re = 32'h0;
   io_in_43_Im = 32'h0;
   io_in_44_Re = 32'h0;
   io_in_44_Im = 32'h0;
   io_in_45_Re = 32'h0;
   io_in_45_Im = 32'h0;
   io_in_46_Re = 32'h0;
   io_in_46_Im = 32'h0;
   io_in_47_Re = 32'h0;
   io_in_47_Im = 32'h0;
   io_in_48_Re = 32'h0;
   io_in_48_Im = 32'h0;
   io_in_49_Re = 32'h0;
   io_in_49_Im = 32'h0;
   io_in_50_Re = 32'h0;
   io_in_50_Im = 32'h0;
   io_in_51_Re = 32'h0;
   io_in_51_Im = 32'h0;
   io_in_52_Re = 32'h0;
   io_in_52_Im = 32'h0;
   io_in_53_Re = 32'h0;
   io_in_53_Im = 32'h0;
   io_in_54_Re = 32'h0;
   io_in_54_Im = 32'h0;
   io_in_55_Re = 32'h0;
   io_in_55_Im = 32'h0;
   io_in_56_Re = 32'h0;
   io_in_56_Im = 32'h0;
   io_in_57_Re = 32'h0;
   io_in_57_Im = 32'h0;
   io_in_58_Re = 32'h0;
   io_in_58_Im = 32'h0;
   io_in_59_Re = 32'h0;
   io_in_59_Im = 32'h0;
   io_in_60_Re = 32'h0;
   io_in_60_Im = 32'h0;
   io_in_61_Re = 32'h0;
   io_in_61_Im = 32'h0;
   io_in_62_Re = 32'h0;
   io_in_62_Im = 32'h0;
   io_in_63_Re = 32'h0;
   io_in_63_Im = 32'h0;
   io_in_64_Re = 32'h0;
   io_in_64_Im = 32'h0;
   io_in_65_Re = 32'h0;
   io_in_65_Im = 32'h0;
   io_in_66_Re = 32'h0;
   io_in_66_Im = 32'h0;
   io_in_67_Re = 32'h0;
   io_in_67_Im = 32'h0;
   io_in_68_Re = 32'h0;
   io_in_68_Im = 32'h0;
   io_in_69_Re = 32'h0;
   io_in_69_Im = 32'h0;
   io_in_70_Re = 32'h0;
   io_in_70_Im = 32'h0;
   io_in_71_Re = 32'h0;
   io_in_71_Im = 32'h0;
   io_in_72_Re = 32'h0;
   io_in_72_Im = 32'h0;
   io_in_73_Re = 32'h0;
   io_in_73_Im = 32'h0;
   io_in_74_Re = 32'h0;
   io_in_74_Im = 32'h0;
   io_in_75_Re = 32'h0;
   io_in_75_Im = 32'h0;
   io_in_76_Re = 32'h0;
   io_in_76_Im = 32'h0;
   io_in_77_Re = 32'h0;
   io_in_77_Im = 32'h0;
   io_in_78_Re = 32'h0;
   io_in_78_Im = 32'h0;
   io_in_79_Re = 32'h0;
   io_in_79_Im = 32'h0;
   io_in_80_Re = 32'h0;
   io_in_80_Im = 32'h0;
   io_in_81_Re = 32'h0;
   io_in_81_Im = 32'h0;
   io_in_82_Re = 32'h0;
   io_in_82_Im = 32'h0;
   io_in_83_Re = 32'h0;
   io_in_83_Im = 32'h0;
   io_in_84_Re = 32'h0;
   io_in_84_Im = 32'h0;
   io_in_85_Re = 32'h0;
   io_in_85_Im = 32'h0;
   io_in_86_Re = 32'h0;
   io_in_86_Im = 32'h0;
   io_in_87_Re = 32'h0;
   io_in_87_Im = 32'h0;
   io_in_88_Re = 32'h0;
   io_in_88_Im = 32'h0;
   io_in_89_Re = 32'h0;
   io_in_89_Im = 32'h0;
   io_in_90_Re = 32'h0;
   io_in_90_Im = 32'h0;
   io_in_91_Re = 32'h0;
   io_in_91_Im = 32'h0;
   io_in_92_Re = 32'h0;
   io_in_92_Im = 32'h0;
   io_in_93_Re = 32'h0;
   io_in_93_Im = 32'h0;
   io_in_94_Re = 32'h0;
   io_in_94_Im = 32'h0;
   io_in_95_Re = 32'h0;
   io_in_95_Im = 32'h0;
                      `endif
                    `endif
                  `endif
	        `endif
              `endif
	    `endif
	  `endif
        `endif
      `endif
    `endif
  `endif
`endif
end
endtask

integer i,j;
always #10 clock = ~clock;
initial begin
   i=0;
   reset = 1'b1;
   clock = 1'b0;
   io_in_ready = 1'b0;
   initial_input(); // call the initial_input task
   #100;
   reset = 1'b0;
   #11; 
   for (i=0; i<2*`FFT_LEN*`TEST_SIZE; i=i+2*`FFT_WT) begin
     io_in_ready = 1'b1;
`ifdef FFT_ST_WT2
     io_in_0_Re = input_io_in[i]  ;
     io_in_0_Im = input_io_in[i+1];
     io_in_1_Re = input_io_in[i+2];
     io_in_1_Im = input_io_in[i+3];
  `ifdef FFT_ST_WT3
     io_in_2_Re = input_io_in[i+4];
     io_in_2_Im = input_io_in[i+5];
    `ifdef FFT_ST_WT4
     io_in_3_Re = input_io_in[i+6];
     io_in_3_Im = input_io_in[i+7];
      `ifdef FFT_ST_WT6
     io_in_4_Re = input_io_in[i+8];
     io_in_4_Im = input_io_in[i+9];
     io_in_5_Re = input_io_in[i+10];
     io_in_5_Im = input_io_in[i+11];
        `ifdef FFT_ST_WT8
     io_in_6_Re = input_io_in[i+12];
     io_in_6_Im = input_io_in[i+13];
     io_in_7_Re = input_io_in[i+14];
     io_in_7_Im = input_io_in[i+15];
          `ifdef FFT_ST_WT9
     io_in_8_Re  = input_io_in[i+16];
     io_in_8_Im  = input_io_in[i+17];
            `ifdef FFT_ST_WT12
     io_in_9_Re  = input_io_in[i+18];
     io_in_9_Im  = input_io_in[i+19];
     io_in_10_Re = input_io_in[i+20];
     io_in_10_Im = input_io_in[i+21];
     io_in_11_Re = input_io_in[i+22];
     io_in_11_Im = input_io_in[i+23];
              `ifdef FFT_ST_WT16
     io_in_12_Re = input_io_in[i+24];
     io_in_12_Im = input_io_in[i+25];
     io_in_13_Re = input_io_in[i+26];
     io_in_13_Im = input_io_in[i+27];
     io_in_14_Re = input_io_in[i+28];
     io_in_14_Im = input_io_in[i+29];
     io_in_15_Re = input_io_in[i+30];
     io_in_15_Im = input_io_in[i+31];
                `ifdef FFT_ST_WT18
     io_in_16_Re = input_io_in[i+32];
     io_in_16_Im = input_io_in[i+33];
     io_in_17_Re = input_io_in[i+34];
     io_in_17_Im = input_io_in[i+35];
                  `ifdef FFT_ST_WT27
     io_in_18_Re = input_io_in[i+36];                        
     io_in_18_Im = input_io_in[i+37];                        
     io_in_19_Re = input_io_in[i+38];                        
     io_in_19_Im = input_io_in[i+39];                        
     io_in_20_Re = input_io_in[i+40];
     io_in_20_Im = input_io_in[i+41];
     io_in_21_Re = input_io_in[i+42];
     io_in_21_Im = input_io_in[i+43];
     io_in_22_Re = input_io_in[i+44];
     io_in_22_Im = input_io_in[i+45];
     io_in_23_Re = input_io_in[i+46];
     io_in_23_Im = input_io_in[i+47];
     io_in_24_Re = input_io_in[i+48];
     io_in_24_Im = input_io_in[i+49];
     io_in_25_Re = input_io_in[i+50];
     io_in_25_Im = input_io_in[i+51];
     io_in_26_Re = input_io_in[i+52];                       
     io_in_26_Im = input_io_in[i+53];                       
                    `ifdef FFT_ST_WT36
     io_in_27_Re = input_io_in[i+54];                            
     io_in_27_Im = input_io_in[i+55];                            
     io_in_28_Re = input_io_in[i+56];                            
     io_in_28_Im = input_io_in[i+57];                            
     io_in_29_Re = input_io_in[i+58];                            
     io_in_29_Im = input_io_in[i+59];                            
     io_in_30_Re = input_io_in[i+60];
     io_in_30_Im = input_io_in[i+61];
     io_in_31_Re = input_io_in[i+62];
     io_in_31_Im = input_io_in[i+63];
     io_in_32_Re = input_io_in[i+64];
     io_in_32_Im = input_io_in[i+65];
     io_in_33_Re = input_io_in[i+66];
     io_in_33_Im = input_io_in[i+67];
     io_in_34_Re = input_io_in[i+68];
     io_in_34_Im = input_io_in[i+69];
     io_in_35_Re = input_io_in[i+70];
     io_in_35_Im = input_io_in[i+71];
                      `ifdef FFT_ST_WT96 
     io_in_36_Re = input_io_in[i+72];
     io_in_36_Im = input_io_in[i+73];
     io_in_37_Re = input_io_in[i+74];
     io_in_37_Im = input_io_in[i+75];
     io_in_38_Re = input_io_in[i+76];
     io_in_38_Im = input_io_in[i+77];
     io_in_39_Re = input_io_in[i+78];
     io_in_39_Im = input_io_in[i+79];
     io_in_40_Re = input_io_in[i+80];
     io_in_40_Im = input_io_in[i+81];
     io_in_41_Re = input_io_in[i+82];
     io_in_41_Im = input_io_in[i+83];
     io_in_42_Re = input_io_in[i+84];
     io_in_42_Im = input_io_in[i+85];
     io_in_43_Re = input_io_in[i+86];
     io_in_43_Im = input_io_in[i+87];
     io_in_44_Re = input_io_in[i+88];
     io_in_44_Im = input_io_in[i+89];
     io_in_45_Re = input_io_in[i+90];
     io_in_45_Im = input_io_in[i+91];
     io_in_46_Re = input_io_in[i+92];
     io_in_46_Im = input_io_in[i+93];
     io_in_47_Re = input_io_in[i+94];
     io_in_47_Im = input_io_in[i+95];
     io_in_48_Re = input_io_in[i+96];
     io_in_48_Im = input_io_in[i+97];
     io_in_49_Re = input_io_in[i+98];
     io_in_49_Im = input_io_in[i+99];
     io_in_50_Re = input_io_in[i+100];
     io_in_50_Im = input_io_in[i+101];
     io_in_51_Re = input_io_in[i+102];
     io_in_51_Im = input_io_in[i+103];
     io_in_52_Re = input_io_in[i+104];
     io_in_52_Im = input_io_in[i+105];
     io_in_53_Re = input_io_in[i+106];
     io_in_53_Im = input_io_in[i+107];
     io_in_54_Re = input_io_in[i+108];
     io_in_54_Im = input_io_in[i+109];
     io_in_55_Re = input_io_in[i+110];
     io_in_55_Im = input_io_in[i+111];
     io_in_56_Re = input_io_in[i+112];
     io_in_56_Im = input_io_in[i+113];
     io_in_57_Re = input_io_in[i+114];
     io_in_57_Im = input_io_in[i+115];
     io_in_58_Re = input_io_in[i+116];
     io_in_58_Im = input_io_in[i+117];
     io_in_59_Re = input_io_in[i+118];
     io_in_59_Im = input_io_in[i+119];
     io_in_60_Re = input_io_in[i+120];
     io_in_60_Im = input_io_in[i+121];
     io_in_61_Re = input_io_in[i+122];
     io_in_61_Im = input_io_in[i+123];
     io_in_62_Re = input_io_in[i+124];
     io_in_62_Im = input_io_in[i+125];
     io_in_63_Re = input_io_in[i+126];
     io_in_63_Im = input_io_in[i+127];
     io_in_64_Re = input_io_in[i+128];
     io_in_64_Im = input_io_in[i+129];
     io_in_65_Re = input_io_in[i+130];
     io_in_65_Im = input_io_in[i+131];
     io_in_66_Re = input_io_in[i+132];
     io_in_66_Im = input_io_in[i+133];
     io_in_67_Re = input_io_in[i+134];
     io_in_67_Im = input_io_in[i+135];
     io_in_68_Re = input_io_in[i+136];
     io_in_68_Im = input_io_in[i+137];
     io_in_69_Re = input_io_in[i+138];
     io_in_69_Im = input_io_in[i+139];
     io_in_70_Re = input_io_in[i+140];
     io_in_70_Im = input_io_in[i+141];
     io_in_71_Re = input_io_in[i+142];
     io_in_71_Im = input_io_in[i+143];
     io_in_72_Re = input_io_in[i+144];
     io_in_72_Im = input_io_in[i+145];
     io_in_73_Re = input_io_in[i+146];
     io_in_73_Im = input_io_in[i+147];
     io_in_74_Re = input_io_in[i+148];
     io_in_74_Im = input_io_in[i+149];
     io_in_75_Re = input_io_in[i+150];
     io_in_75_Im = input_io_in[i+151];
     io_in_76_Re = input_io_in[i+152];
     io_in_76_Im = input_io_in[i+153];
     io_in_77_Re = input_io_in[i+154];
     io_in_77_Im = input_io_in[i+155];
     io_in_78_Re = input_io_in[i+156];
     io_in_78_Im = input_io_in[i+157];
     io_in_79_Re = input_io_in[i+158];
     io_in_79_Im = input_io_in[i+159];
     io_in_80_Re = input_io_in[i+160];
     io_in_80_Im = input_io_in[i+161];
     io_in_81_Re = input_io_in[i+162];
     io_in_81_Im = input_io_in[i+163];
     io_in_82_Re = input_io_in[i+164];
     io_in_82_Im = input_io_in[i+165];
     io_in_83_Re = input_io_in[i+166];
     io_in_83_Im = input_io_in[i+167];
     io_in_84_Re = input_io_in[i+168];
     io_in_84_Im = input_io_in[i+169];
     io_in_85_Re = input_io_in[i+170];
     io_in_85_Im = input_io_in[i+171];
     io_in_86_Re = input_io_in[i+172];
     io_in_86_Im = input_io_in[i+173];
     io_in_87_Re = input_io_in[i+174];
     io_in_87_Im = input_io_in[i+175];
     io_in_88_Re = input_io_in[i+176];
     io_in_88_Im = input_io_in[i+177];
     io_in_89_Re = input_io_in[i+178];
     io_in_89_Im = input_io_in[i+179];
     io_in_90_Re = input_io_in[i+180];
     io_in_90_Im = input_io_in[i+181];
     io_in_91_Re = input_io_in[i+182];
     io_in_91_Im = input_io_in[i+183];
     io_in_92_Re = input_io_in[i+184];
     io_in_92_Im = input_io_in[i+185];
     io_in_93_Re = input_io_in[i+186];
     io_in_93_Im = input_io_in[i+187];
     io_in_94_Re = input_io_in[i+188];
     io_in_94_Im = input_io_in[i+189];
     io_in_95_Re = input_io_in[i+190];
     io_in_95_Im = input_io_in[i+191];
                      `endif
                    `endif
                  `endif
	        `endif
              `endif
	    `endif
	  `endif
        `endif
      `endif
    `endif
  `endif
`endif
     #20;
   end
   io_in_ready = 1'b0;
   initial_input();
end


//---------------------------------------------------------------------
//------- Monitor -----------------------------------------------------
//---------------------------------------------------------------------
reg check_pass;
reg check_fft_len2, check_fft_len4, check_fft_len8, check_fft_len16;
reg check_fft_len3, check_fft_len9, check_fft_len27;
reg check_fft_len6, check_fft_len12, check_fft_len18, check_fft_len36;
reg check_fft_len96;

reg debug[2*`FFT_WT-1:0];

initial begin
   j=0;
   wait (io_out_validate);
   repeat (1) @(negedge clock);
   for (j=0; j<2*`FFT_LEN*`TEST_SIZE; j=j+2*`FFT_WT) begin

`ifdef FFT_ST_WT2
check_fft_len2 =  ((io_out_0_Re[31:16]==output_io_out[j][31:16]  ) | (io_out_0_Re[31:16]==output_io_out[j][31:16]  +16'h1) | (io_out_0_Re[31:16]==output_io_out[j][31:16]  -16'h1)) &
                  ((io_out_0_Im[31:16]==output_io_out[j+1][31:16]) | (io_out_0_Im[31:16]==output_io_out[j+1][31:16]+16'h1) | (io_out_0_Im[31:16]==output_io_out[j+1][31:16]-16'h1)) &
                  ((io_out_1_Re[31:16]==output_io_out[j+2][31:16]) | (io_out_1_Re[31:16]==output_io_out[j+2][31:16]+16'h1) | (io_out_1_Re[31:16]==output_io_out[j+2][31:16]-16'h1)) &
                  ((io_out_1_Im[31:16]==output_io_out[j+3][31:16]) | (io_out_1_Im[31:16]==output_io_out[j+3][31:16]+16'h1) | (io_out_1_Im[31:16]==output_io_out[j+3][31:16]-16'h1)) ;
  `ifdef FFT_ST_WT3
check_fft_len3 =  ((io_out_2_Re[31:16]==output_io_out[j+4][31:16]) | (io_out_2_Re[31:16]==output_io_out[j+4][31:16]+16'h1) | (io_out_2_Re[31:16]==output_io_out[j+4][31:16]-16'h1)) &
                  ((io_out_2_Im[31:16]==output_io_out[j+5][31:16]) | (io_out_2_Im[31:16]==output_io_out[j+5][31:16]+16'h1) | (io_out_2_Im[31:16]==output_io_out[j+5][31:16]-16'h1)) ;
    `ifdef FFT_ST_WT4
check_fft_len4 =  ((io_out_3_Re[31:16]==output_io_out[j+6][31:16]) | (io_out_3_Re[31:16]==output_io_out[j+6][31:16]+16'h1) | (io_out_3_Re[31:16]==output_io_out[j+6][31:16]-16'h1)) &
                  ((io_out_3_Im[31:16]==output_io_out[j+7][31:16]) | (io_out_3_Im[31:16]==output_io_out[j+7][31:16]+16'h1) | (io_out_3_Im[31:16]==output_io_out[j+7][31:16]-16'h1)) ;
      `ifdef FFT_ST_WT6
check_fft_len6 =  ((io_out_4_Re[31:16]<output_io_out[j+8][31:16] +16'h3) & (io_out_4_Re[31:16]>output_io_out[j+8][31:16] -16'h3)) & 
                  ((io_out_4_Im[31:16]<output_io_out[j+9][31:16] +16'h3) & (io_out_4_Im[31:16]>output_io_out[j+9][31:16] -16'h3)) & 
                  ((io_out_5_Re[31:16]<output_io_out[j+10][31:16]+16'h3) & (io_out_5_Re[31:16]>output_io_out[j+10][31:16]-16'h3)) &
                  ((io_out_5_Im[31:16]<output_io_out[j+11][31:16]+16'h3) & (io_out_5_Im[31:16]>output_io_out[j+11][31:16]-16'h3)) ;
        `ifdef FFT_ST_WT8
check_fft_len8 =  ((io_out_6_Re[31:16]<output_io_out[j+12][31:16]+16'h3) & (io_out_6_Re[31:16]>output_io_out[j+12][31:16]-16'h3)) &
                  ((io_out_6_Im[31:16]<output_io_out[j+13][31:16]+16'h3) & (io_out_6_Im[31:16]>output_io_out[j+13][31:16]-16'h3)) &
                  ((io_out_7_Re[31:16]<output_io_out[j+14][31:16]+16'h3) & (io_out_7_Re[31:16]>output_io_out[j+14][31:16]-16'h3)) &
                  ((io_out_7_Im[31:16]<output_io_out[j+15][31:16]+16'h3) & (io_out_7_Im[31:16]>output_io_out[j+15][31:16]-16'h3)) ;
          `ifdef FFT_ST_WT9
check_fft_len9 =  ((io_out_8_Re[31:16] <output_io_out[j+16][31:16]+16'h3) & (io_out_8_Re[31:16] >output_io_out[j+16][31:16]-16'h3)) &
                  ((io_out_8_Im[31:16] <output_io_out[j+17][31:16]+16'h3) & (io_out_8_Im[31:16] >output_io_out[j+17][31:16]-16'h3)) ;
            `ifdef FFT_ST_WT12
check_fft_len12 = ((io_out_9_Re[31:16] <output_io_out[j+18][31:16]+16'h3) & (io_out_9_Re[31:16] >output_io_out[j+18][31:16]-16'h3)) &
                  ((io_out_9_Im[31:16] <output_io_out[j+19][31:16]+16'h3) & (io_out_9_Im[31:16] >output_io_out[j+19][31:16]-16'h3)) &
                  ((io_out_10_Re[31:16]<output_io_out[j+20][31:16]+16'h3) & (io_out_10_Re[31:16]>output_io_out[j+20][31:16]-16'h3)) &
                  ((io_out_10_Im[31:16]<output_io_out[j+21][31:16]+16'h3) & (io_out_10_Im[31:16]>output_io_out[j+21][31:16]-16'h3)) &
                  ((io_out_11_Re[31:16]<output_io_out[j+22][31:16]+16'h3) & (io_out_11_Re[31:16]>output_io_out[j+22][31:16]-16'h3)) &
                  ((io_out_11_Im[31:16]<output_io_out[j+23][31:16]+16'h3) & (io_out_11_Im[31:16]>output_io_out[j+23][31:16]-16'h3)) ;
              `ifdef FFT_ST_WT16
check_fft_len16 = ((io_out_12_Re[31:16]<output_io_out[j+24][31:16]+16'h3) & (io_out_12_Re[31:16]>output_io_out[j+24][31:16]-16'h3)) & 
                  ((io_out_12_Im[31:16]<output_io_out[j+25][31:16]+16'h3) & (io_out_12_Im[31:16]>output_io_out[j+25][31:16]-16'h3)) & 
                  ((io_out_13_Re[31:16]<output_io_out[j+26][31:16]+16'h3) & (io_out_13_Re[31:16]>output_io_out[j+26][31:16]-16'h3)) &
                  ((io_out_13_Im[31:16]<output_io_out[j+27][31:16]+16'h3) & (io_out_13_Im[31:16]>output_io_out[j+27][31:16]-16'h3)) &
                  ((io_out_14_Re[31:16]<output_io_out[j+28][31:16]+16'h3) & (io_out_14_Re[31:16]>output_io_out[j+28][31:16]-16'h3)) &
                  ((io_out_14_Im[31:16]<output_io_out[j+29][31:16]+16'h3) & (io_out_14_Im[31:16]>output_io_out[j+29][31:16]-16'h3)) &
                  ((io_out_15_Re[31:16]<output_io_out[j+30][31:16]+16'h3) & (io_out_15_Re[31:16]>output_io_out[j+30][31:16]-16'h3)) &
                  ((io_out_15_Im[31:16]<output_io_out[j+31][31:16]+16'h3) & (io_out_15_Im[31:16]>output_io_out[j+31][31:16]-16'h3)) ;
                `ifdef FFT_ST_WT18
check_fft_len18 = ((io_out_16_Re[31:16]<output_io_out[j+32][31:16]+16'h3) & (io_out_16_Re[31:16]>output_io_out[j+32][31:16]-16'h3)) &
                  ((io_out_16_Im[31:16]<output_io_out[j+33][31:16]+16'h3) & (io_out_16_Im[31:16]>output_io_out[j+33][31:16]-16'h3)) &
                  ((io_out_17_Re[31:16]<output_io_out[j+34][31:16]+16'h3) & (io_out_17_Re[31:16]>output_io_out[j+34][31:16]-16'h3)) &
                  ((io_out_17_Im[31:16]<output_io_out[j+35][31:16]+16'h3) & (io_out_17_Im[31:16]>output_io_out[j+35][31:16]-16'h3)) ;
                  `ifdef FFT_ST_WT27
check_fft_len27 = ((io_out_18_Re[31:16]<output_io_out[j+36][31:16]+16'h3) & (io_out_18_Re[31:16]>output_io_out[j+36][31:16]-16'h3)) &
                  ((io_out_18_Im[31:16]<output_io_out[j+37][31:16]+16'h3) & (io_out_18_Im[31:16]>output_io_out[j+37][31:16]-16'h3)) &
                  ((io_out_19_Re[31:16]<output_io_out[j+38][31:16]+16'h3) & (io_out_19_Re[31:16]>output_io_out[j+38][31:16]-16'h3)) &
                  ((io_out_19_Im[31:16]<output_io_out[j+39][31:16]+16'h3) & (io_out_19_Im[31:16]>output_io_out[j+39][31:16]-16'h3)) &
                  ((io_out_20_Re[31:16]<output_io_out[j+40][31:16]+16'h3) & (io_out_20_Re[31:16]>output_io_out[j+40][31:16]-16'h3)) &
                  ((io_out_20_Im[31:16]<output_io_out[j+41][31:16]+16'h3) & (io_out_20_Im[31:16]>output_io_out[j+41][31:16]-16'h3)) & 
                  ((io_out_21_Re[31:16]<output_io_out[j+42][31:16]+16'h3) & (io_out_21_Re[31:16]>output_io_out[j+42][31:16]-16'h3)) &
                  ((io_out_21_Im[31:16]<output_io_out[j+43][31:16]+16'h3) & (io_out_21_Im[31:16]>output_io_out[j+43][31:16]-16'h3)) &
                  ((io_out_22_Re[31:16]<output_io_out[j+44][31:16]+16'h3) & (io_out_22_Re[31:16]>output_io_out[j+44][31:16]-16'h3)) &
                  ((io_out_22_Im[31:16]<output_io_out[j+45][31:16]+16'h3) & (io_out_22_Im[31:16]>output_io_out[j+45][31:16]-16'h3)) &
                  ((io_out_23_Re[31:16]<output_io_out[j+46][31:16]+16'h3) & (io_out_23_Re[31:16]>output_io_out[j+46][31:16]-16'h3)) &
                  ((io_out_23_Im[31:16]<output_io_out[j+47][31:16]+16'h3) & (io_out_23_Im[31:16]>output_io_out[j+47][31:16]-16'h3)) &
                  ((io_out_24_Re[31:16]<output_io_out[j+48][31:16]+16'h3) & (io_out_24_Re[31:16]>output_io_out[j+48][31:16]-16'h3)) &
                  ((io_out_24_Im[31:16]<output_io_out[j+49][31:16]+16'h3) & (io_out_24_Im[31:16]>output_io_out[j+49][31:16]-16'h3)) &
                  ((io_out_25_Re[31:16]<output_io_out[j+50][31:16]+16'h3) & (io_out_25_Re[31:16]>output_io_out[j+50][31:16]-16'h3)) &
                  ((io_out_25_Im[31:16]<output_io_out[j+51][31:16]+16'h3) & (io_out_25_Im[31:16]>output_io_out[j+51][31:16]-16'h3)) & 
                  ((io_out_26_Re[31:16]<output_io_out[j+52][31:16]+16'h3) & (io_out_26_Re[31:16]>output_io_out[j+52][31:16]-16'h3)) &
                  ((io_out_26_Im[31:16]<output_io_out[j+53][31:16]+16'h3) & (io_out_26_Im[31:16]>output_io_out[j+53][31:16]-16'h3)) ;
                    `ifdef FFT_ST_WT36
 check_fft_len36 = ((io_out_27_Re[31:16]<output_io_out[j+54][31:16]+16'h3) & (io_out_27_Re[31:16]>output_io_out[j+54][31:16]-16'h3)) &
                   ((io_out_27_Im[31:16]<output_io_out[j+55][31:16]+16'h3) & (io_out_27_Im[31:16]>output_io_out[j+55][31:16]-16'h3)) &
                   ((io_out_28_Re[31:16]<output_io_out[j+56][31:16]+16'h3) & (io_out_28_Re[31:16]>output_io_out[j+56][31:16]-16'h3)) &
                   ((io_out_28_Im[31:16]<output_io_out[j+57][31:16]+16'h3) & (io_out_28_Im[31:16]>output_io_out[j+57][31:16]-16'h3)) &
                   ((io_out_29_Re[31:16]<output_io_out[j+58][31:16]+16'h3) & (io_out_29_Re[31:16]>output_io_out[j+58][31:16]-16'h3)) &
                   ((io_out_29_Im[31:16]<output_io_out[j+59][31:16]+16'h3) & (io_out_29_Im[31:16]>output_io_out[j+59][31:16]-16'h3)) &
                   ((io_out_30_Re[31:16]<output_io_out[j+60][31:16]+16'h3) & (io_out_30_Re[31:16]>output_io_out[j+60][31:16]-16'h3)) &
                   ((io_out_30_Im[31:16]<output_io_out[j+61][31:16]+16'h3) & (io_out_30_Im[31:16]>output_io_out[j+61][31:16]-16'h3)) & 
                   ((io_out_31_Re[31:16]<output_io_out[j+62][31:16]+16'h3) & (io_out_31_Re[31:16]>output_io_out[j+62][31:16]-16'h3)) &
                   ((io_out_31_Im[31:16]<output_io_out[j+63][31:16]+16'h3) & (io_out_31_Im[31:16]>output_io_out[j+63][31:16]-16'h3)) &
                   ((io_out_32_Re[31:16]<output_io_out[j+64][31:16]+16'h3) & (io_out_32_Re[31:16]>output_io_out[j+64][31:16]-16'h3)) &
                   ((io_out_32_Im[31:16]<output_io_out[j+65][31:16]+16'h3) & (io_out_32_Im[31:16]>output_io_out[j+65][31:16]-16'h3)) &
                   ((io_out_33_Re[31:16]<output_io_out[j+66][31:16]+16'h3) & (io_out_33_Re[31:16]>output_io_out[j+66][31:16]-16'h3)) &
                   ((io_out_33_Im[31:16]<output_io_out[j+67][31:16]+16'h3) & (io_out_33_Im[31:16]>output_io_out[j+67][31:16]-16'h3)) &
                   ((io_out_34_Re[31:16]<output_io_out[j+68][31:16]+16'h3) & (io_out_34_Re[31:16]>output_io_out[j+68][31:16]-16'h3)) &
                   ((io_out_34_Im[31:16]<output_io_out[j+69][31:16]+16'h3) & (io_out_34_Im[31:16]>output_io_out[j+69][31:16]-16'h3)) &
                   ((io_out_35_Re[31:16]<output_io_out[j+70][31:16]+16'h3) & (io_out_35_Re[31:16]>output_io_out[j+70][31:16]-16'h3)) &
                   ((io_out_35_Im[31:16]<output_io_out[j+71][31:16]+16'h3) & (io_out_35_Im[31:16]>output_io_out[j+71][31:16]-16'h3)) ;
                    `endif
                    `ifdef FFT_ST_WT96
 check_fft_len96 = ((io_out_36_Re[31:16]<output_io_out[j+72][31:16]+16'h3) & (io_out_36_Re[31:16]>output_io_out[j+72][31:16]-16'h3)) &
                   ((io_out_36_Im[31:16]<output_io_out[j+73][31:16]+16'h3) & (io_out_36_Im[31:16]>output_io_out[j+73][31:16]-16'h3)) &
                   ((io_out_37_Im[31:16]<output_io_out[j+74][31:16]+16'h3) & (io_out_37_Im[31:16]>output_io_out[j+74][31:16]-16'h3)) &
                   ((io_out_37_Re[31:16]<output_io_out[j+75][31:16]+16'h3) & (io_out_37_Re[31:16]>output_io_out[j+75][31:16]-16'h3)) &
                   ((io_out_38_Im[31:16]<output_io_out[j+76][31:16]+16'h3) & (io_out_38_Im[31:16]>output_io_out[j+76][31:16]-16'h3)) &
                   ((io_out_38_Im[31:16]<output_io_out[j+77][31:16]+16'h3) & (io_out_38_Im[31:16]>output_io_out[j+77][31:16]-16'h3)) &
                   ((io_out_39_Im[31:16]<output_io_out[j+78][31:16]+16'h3) & (io_out_39_Im[31:16]>output_io_out[j+78][31:16]-16'h3)) &
                   ((io_out_39_Im[31:16]<output_io_out[j+79][31:16]+16'h3) & (io_out_39_Im[31:16]>output_io_out[j+79][31:16]-16'h3)) &
                   ((io_out_40_Re[31:16]<output_io_out[j+80][31:16]+16'h3) & (io_out_40_Re[31:16]>output_io_out[j+80][31:16]-16'h3)) &
                   ((io_out_40_Im[31:16]<output_io_out[j+81][31:16]+16'h3) & (io_out_40_Im[31:16]>output_io_out[j+81][31:16]-16'h3)) &
                   ((io_out_41_Re[31:16]<output_io_out[j+82][31:16]+16'h3) & (io_out_41_Re[31:16]>output_io_out[j+82][31:16]-16'h3)) &
                   ((io_out_41_Im[31:16]<output_io_out[j+83][31:16]+16'h3) & (io_out_41_Im[31:16]>output_io_out[j+83][31:16]-16'h3)) &
                   ((io_out_42_Re[31:16]<output_io_out[j+84][31:16]+16'h3) & (io_out_42_Re[31:16]>output_io_out[j+84][31:16]-16'h3)) &
                   ((io_out_42_Im[31:16]<output_io_out[j+85][31:16]+16'h3) & (io_out_42_Im[31:16]>output_io_out[j+85][31:16]-16'h3)) & 
                   ((io_out_43_Re[31:16]<output_io_out[j+86][31:16]+16'h3) & (io_out_43_Re[31:16]>output_io_out[j+86][31:16]-16'h3)) &
                   ((io_out_43_Im[31:16]<output_io_out[j+87][31:16]+16'h3) & (io_out_43_Im[31:16]>output_io_out[j+87][31:16]-16'h3)) &
                   ((io_out_44_Re[31:16]<output_io_out[j+88][31:16]+16'h3) & (io_out_44_Re[31:16]>output_io_out[j+88][31:16]-16'h3)) &
                   ((io_out_44_Im[31:16]<output_io_out[j+89][31:16]+16'h3) & (io_out_44_Im[31:16]>output_io_out[j+89][31:16]-16'h3)) &
                   ((io_out_45_Re[31:16]<output_io_out[j+90][31:16]+16'h3) & (io_out_45_Re[31:16]>output_io_out[j+90][31:16]-16'h3)) &
                   ((io_out_45_Im[31:16]<output_io_out[j+91][31:16]+16'h3) & (io_out_45_Im[31:16]>output_io_out[j+91][31:16]-16'h3)) &
                   ((io_out_46_Re[31:16]<output_io_out[j+92][31:16]+16'h3) & (io_out_46_Re[31:16]>output_io_out[j+92][31:16]-16'h3)) &
                   ((io_out_46_Im[31:16]<output_io_out[j+93][31:16]+16'h3) & (io_out_46_Im[31:16]>output_io_out[j+93][31:16]-16'h3)) &
                   ((io_out_47_Re[31:16]<output_io_out[j+94][31:16]+16'h3) & (io_out_47_Re[31:16]>output_io_out[j+94][31:16]-16'h3)) &
                   ((io_out_47_Re[31:16]<output_io_out[j+95][31:16]+16'h3) & (io_out_47_Re[31:16]>output_io_out[j+95][31:16]-16'h3)) &
                   ((io_out_48_Im[31:16]<output_io_out[j+96][31:16]+16'h3) & (io_out_48_Im[31:16]>output_io_out[j+96][31:16]-16'h3)) &
                   ((io_out_48_Re[31:16]<output_io_out[j+97][31:16]+16'h3) & (io_out_48_Re[31:16]>output_io_out[j+97][31:16]-16'h3)) &
                   ((io_out_49_Im[31:16]<output_io_out[j+98][31:16]+16'h3) & (io_out_49_Im[31:16]>output_io_out[j+98][31:16]-16'h3)) &
                   ((io_out_49_Re[31:16]<output_io_out[j+99][31:16]+16'h3) & (io_out_49_Re[31:16]>output_io_out[j+99][31:16]-16'h3)) &
                   ((io_out_50_Im[31:16]<output_io_out[j+100][31:16]+16'h3) & (io_out_50_Im[31:16]>output_io_out[j+100][31:16]-16'h3)) & 
                   ((io_out_50_Re[31:16]<output_io_out[j+101][31:16]+16'h3) & (io_out_50_Re[31:16]>output_io_out[j+101][31:16]-16'h3)) &
                   ((io_out_51_Im[31:16]<output_io_out[j+102][31:16]+16'h3) & (io_out_51_Im[31:16]>output_io_out[j+102][31:16]-16'h3)) &
                   ((io_out_51_Re[31:16]<output_io_out[j+103][31:16]+16'h3) & (io_out_51_Re[31:16]>output_io_out[j+103][31:16]-16'h3)) &
                   ((io_out_52_Im[31:16]<output_io_out[j+104][31:16]+16'h3) & (io_out_52_Im[31:16]>output_io_out[j+104][31:16]-16'h3)) &
                   ((io_out_52_Re[31:16]<output_io_out[j+105][31:16]+16'h3) & (io_out_52_Re[31:16]>output_io_out[j+105][31:16]-16'h3)) &
                   ((io_out_53_Im[31:16]<output_io_out[j+106][31:16]+16'h3) & (io_out_53_Im[31:16]>output_io_out[j+106][31:16]-16'h3)) &
                   ((io_out_53_Re[31:16]<output_io_out[j+107][31:16]+16'h3) & (io_out_53_Re[31:16]>output_io_out[j+107][31:16]-16'h3)) &
                   ((io_out_54_Im[31:16]<output_io_out[j+108][31:16]+16'h3) & (io_out_54_Im[31:16]>output_io_out[j+108][31:16]-16'h3)) &
                   ((io_out_54_Re[31:16]<output_io_out[j+109][31:16]+16'h3) & (io_out_54_Re[31:16]>output_io_out[j+109][31:16]-16'h3)) &
                   ((io_out_55_Re[31:16]<output_io_out[j+110][31:16]+16'h3) & (io_out_55_Re[31:16]>output_io_out[j+110][31:16]-16'h3)) &
                   ((io_out_55_Im[31:16]<output_io_out[j+111][31:16]+16'h3) & (io_out_55_Im[31:16]>output_io_out[j+111][31:16]-16'h3)) &
                   ((io_out_56_Re[31:16]<output_io_out[j+112][31:16]+16'h3) & (io_out_56_Re[31:16]>output_io_out[j+112][31:16]-16'h3)) &
                   ((io_out_56_Im[31:16]<output_io_out[j+113][31:16]+16'h3) & (io_out_56_Im[31:16]>output_io_out[j+113][31:16]-16'h3)) &
                   ((io_out_57_Re[31:16]<output_io_out[j+114][31:16]+16'h3) & (io_out_57_Re[31:16]>output_io_out[j+114][31:16]-16'h3)) &
                   ((io_out_57_Im[31:16]<output_io_out[j+115][31:16]+16'h3) & (io_out_57_Im[31:16]>output_io_out[j+115][31:16]-16'h3)) & 
                   ((io_out_58_Re[31:16]<output_io_out[j+116][31:16]+16'h3) & (io_out_58_Re[31:16]>output_io_out[j+116][31:16]-16'h3)) &
                   ((io_out_58_Im[31:16]<output_io_out[j+117][31:16]+16'h3) & (io_out_58_Im[31:16]>output_io_out[j+117][31:16]-16'h3)) &
                   ((io_out_59_Re[31:16]<output_io_out[j+118][31:16]+16'h3) & (io_out_59_Re[31:16]>output_io_out[j+118][31:16]-16'h3)) &
                   ((io_out_59_Im[31:16]<output_io_out[j+119][31:16]+16'h3) & (io_out_59_Im[31:16]>output_io_out[j+119][31:16]-16'h3)) &
                   ((io_out_60_Re[31:16]<output_io_out[j+120][31:16]+16'h3) & (io_out_60_Re[31:16]>output_io_out[j+120][31:16]-16'h3)) &
                   ((io_out_60_Im[31:16]<output_io_out[j+121][31:16]+16'h3) & (io_out_60_Im[31:16]>output_io_out[j+121][31:16]-16'h3)) &
                   ((io_out_61_Re[31:16]<output_io_out[j+122][31:16]+16'h3) & (io_out_61_Re[31:16]>output_io_out[j+122][31:16]-16'h3)) &
                   ((io_out_61_Im[31:16]<output_io_out[j+123][31:16]+16'h3) & (io_out_61_Im[31:16]>output_io_out[j+123][31:16]-16'h3)) &
                   ((io_out_62_Re[31:16]<output_io_out[j+124][31:16]+16'h3) & (io_out_62_Re[31:16]>output_io_out[j+124][31:16]-16'h3)) &
                   ((io_out_62_Re[31:16]<output_io_out[j+125][31:16]+16'h3) & (io_out_62_Re[31:16]>output_io_out[j+125][31:16]-16'h3)) &
                   ((io_out_63_Im[31:16]<output_io_out[j+126][31:16]+16'h3) & (io_out_63_Im[31:16]>output_io_out[j+126][31:16]-16'h3)) &
                   ((io_out_63_Re[31:16]<output_io_out[j+127][31:16]+16'h3) & (io_out_63_Re[31:16]>output_io_out[j+127][31:16]-16'h3)) &
                   ((io_out_64_Im[31:16]<output_io_out[j+128][31:16]+16'h3) & (io_out_64_Im[31:16]>output_io_out[j+128][31:16]-16'h3)) &
                   ((io_out_64_Re[31:16]<output_io_out[j+129][31:16]+16'h3) & (io_out_64_Re[31:16]>output_io_out[j+129][31:16]-16'h3)) &
                   ((io_out_65_Im[31:16]<output_io_out[j+130][31:16]+16'h3) & (io_out_65_Im[31:16]>output_io_out[j+130][31:16]-16'h3)) & 
                   ((io_out_65_Re[31:16]<output_io_out[j+131][31:16]+16'h3) & (io_out_65_Re[31:16]>output_io_out[j+131][31:16]-16'h3)) &
                   ((io_out_66_Im[31:16]<output_io_out[j+132][31:16]+16'h3) & (io_out_66_Im[31:16]>output_io_out[j+132][31:16]-16'h3)) &
                   ((io_out_66_Re[31:16]<output_io_out[j+133][31:16]+16'h3) & (io_out_66_Re[31:16]>output_io_out[j+133][31:16]-16'h3)) &
                   ((io_out_67_Im[31:16]<output_io_out[j+134][31:16]+16'h3) & (io_out_67_Im[31:16]>output_io_out[j+134][31:16]-16'h3)) &
                   ((io_out_67_Re[31:16]<output_io_out[j+135][31:16]+16'h3) & (io_out_67_Re[31:16]>output_io_out[j+135][31:16]-16'h3)) &
                   ((io_out_68_Im[31:16]<output_io_out[j+136][31:16]+16'h3) & (io_out_68_Im[31:16]>output_io_out[j+136][31:16]-16'h3)) &
                   ((io_out_68_Re[31:16]<output_io_out[j+137][31:16]+16'h3) & (io_out_68_Re[31:16]>output_io_out[j+137][31:16]-16'h3)) &
                   ((io_out_69_Im[31:16]<output_io_out[j+138][31:16]+16'h3) & (io_out_69_Im[31:16]>output_io_out[j+138][31:16]-16'h3)) &
                   ((io_out_69_Re[31:16]<output_io_out[j+139][31:16]+16'h3) & (io_out_69_Re[31:16]>output_io_out[j+139][31:16]-16'h3)) &
                   ((io_out_70_Im[31:16]<output_io_out[j+140][31:16]+16'h3) & (io_out_70_Im[31:16]>output_io_out[j+140][31:16]-16'h3)) &
                   ((io_out_70_Re[31:16]<output_io_out[j+141][31:16]+16'h3) & (io_out_70_Re[31:16]>output_io_out[j+141][31:16]-16'h3)) &
                   ((io_out_71_Im[31:16]<output_io_out[j+142][31:16]+16'h3) & (io_out_71_Im[31:16]>output_io_out[j+142][31:16]-16'h3)) &
                   ((io_out_71_Re[31:16]<output_io_out[j+143][31:16]+16'h3) & (io_out_71_Re[31:16]>output_io_out[j+143][31:16]-16'h3)) &
                   ((io_out_72_Im[31:16]<output_io_out[j+144][31:16]+16'h3) & (io_out_72_Im[31:16]>output_io_out[j+144][31:16]-16'h3)) & 
                   ((io_out_72_Re[31:16]<output_io_out[j+145][31:16]+16'h3) & (io_out_72_Re[31:16]>output_io_out[j+145][31:16]-16'h3)) &
                   ((io_out_73_Im[31:16]<output_io_out[j+146][31:16]+16'h3) & (io_out_73_Im[31:16]>output_io_out[j+146][31:16]-16'h3)) &
                   ((io_out_73_Re[31:16]<output_io_out[j+147][31:16]+16'h3) & (io_out_73_Re[31:16]>output_io_out[j+147][31:16]-16'h3)) &
                   ((io_out_74_Im[31:16]<output_io_out[j+148][31:16]+16'h3) & (io_out_74_Im[31:16]>output_io_out[j+148][31:16]-16'h3)) &
                   ((io_out_74_Re[31:16]<output_io_out[j+149][31:16]+16'h3) & (io_out_74_Re[31:16]>output_io_out[j+149][31:16]-16'h3)) &
                   ((io_out_75_Im[31:16]<output_io_out[j+150][31:16]+16'h3) & (io_out_75_Im[31:16]>output_io_out[j+150][31:16]-16'h3)) &
                   ((io_out_75_Re[31:16]<output_io_out[j+151][31:16]+16'h3) & (io_out_75_Re[31:16]>output_io_out[j+151][31:16]-16'h3)) &
                   ((io_out_76_Im[31:16]<output_io_out[j+152][31:16]+16'h3) & (io_out_76_Im[31:16]>output_io_out[j+152][31:16]-16'h3)) &
                   ((io_out_76_Re[31:16]<output_io_out[j+153][31:16]+16'h3) & (io_out_76_Re[31:16]>output_io_out[j+153][31:16]-16'h3)) &
                   ((io_out_77_Im[31:16]<output_io_out[j+154][31:16]+16'h3) & (io_out_77_Im[31:16]>output_io_out[j+154][31:16]-16'h3)) &
                   ((io_out_77_Re[31:16]<output_io_out[j+155][31:16]+16'h3) & (io_out_77_Re[31:16]>output_io_out[j+155][31:16]-16'h3)) &
                   ((io_out_78_Im[31:16]<output_io_out[j+156][31:16]+16'h3) & (io_out_78_Im[31:16]>output_io_out[j+156][31:16]-16'h3)) &
                   ((io_out_78_Re[31:16]<output_io_out[j+157][31:16]+16'h3) & (io_out_78_Re[31:16]>output_io_out[j+157][31:16]-16'h3)) &
                   ((io_out_79_Im[31:16]<output_io_out[j+158][31:16]+16'h3) & (io_out_79_Im[31:16]>output_io_out[j+158][31:16]-16'h3)) &
                   ((io_out_79_Re[31:16]<output_io_out[j+159][31:16]+16'h3) & (io_out_79_Re[31:16]>output_io_out[j+159][31:16]-16'h3)) &
                   ((io_out_80_Im[31:16]<output_io_out[j+160][31:16]+16'h3) & (io_out_80_Im[31:16]>output_io_out[j+160][31:16]-16'h3)) & 
                   ((io_out_80_Re[31:16]<output_io_out[j+161][31:16]+16'h3) & (io_out_80_Re[31:16]>output_io_out[j+161][31:16]-16'h3)) &
                   ((io_out_81_Im[31:16]<output_io_out[j+162][31:16]+16'h3) & (io_out_81_Im[31:16]>output_io_out[j+162][31:16]-16'h3)) &
                   ((io_out_81_Re[31:16]<output_io_out[j+163][31:16]+16'h3) & (io_out_81_Re[31:16]>output_io_out[j+163][31:16]-16'h3)) &
                   ((io_out_82_Im[31:16]<output_io_out[j+164][31:16]+16'h3) & (io_out_82_Im[31:16]>output_io_out[j+164][31:16]-16'h3)) &
                   ((io_out_82_Re[31:16]<output_io_out[j+165][31:16]+16'h3) & (io_out_82_Re[31:16]>output_io_out[j+165][31:16]-16'h3)) &
                   ((io_out_83_Im[31:16]<output_io_out[j+166][31:16]+16'h3) & (io_out_83_Im[31:16]>output_io_out[j+166][31:16]-16'h3)) &
                   ((io_out_83_Re[31:16]<output_io_out[j+167][31:16]+16'h3) & (io_out_83_Re[31:16]>output_io_out[j+167][31:16]-16'h3)) &
                   ((io_out_84_Im[31:16]<output_io_out[j+168][31:16]+16'h3) & (io_out_84_Im[31:16]>output_io_out[j+168][31:16]-16'h3)) &
                   ((io_out_84_Re[31:16]<output_io_out[j+169][31:16]+16'h3) & (io_out_84_Re[31:16]>output_io_out[j+169][31:16]-16'h3)) &
                   ((io_out_85_Re[31:16]<output_io_out[j+170][31:16]+16'h3) & (io_out_85_Re[31:16]>output_io_out[j+170][31:16]-16'h3)) &
                   ((io_out_85_Im[31:16]<output_io_out[j+171][31:16]+16'h3) & (io_out_85_Im[31:16]>output_io_out[j+171][31:16]-16'h3)) &
                   ((io_out_86_Re[31:16]<output_io_out[j+172][31:16]+16'h3) & (io_out_86_Re[31:16]>output_io_out[j+172][31:16]-16'h3)) &
                   ((io_out_86_Im[31:16]<output_io_out[j+173][31:16]+16'h3) & (io_out_86_Im[31:16]>output_io_out[j+173][31:16]-16'h3)) &
                   ((io_out_87_Re[31:16]<output_io_out[j+174][31:16]+16'h3) & (io_out_87_Re[31:16]>output_io_out[j+174][31:16]-16'h3)) &
                   ((io_out_87_Im[31:16]<output_io_out[j+175][31:16]+16'h3) & (io_out_87_Im[31:16]>output_io_out[j+175][31:16]-16'h3)) & 
                   ((io_out_88_Re[31:16]<output_io_out[j+176][31:16]+16'h3) & (io_out_88_Re[31:16]>output_io_out[j+176][31:16]-16'h3)) &
                   ((io_out_88_Im[31:16]<output_io_out[j+177][31:16]+16'h3) & (io_out_88_Im[31:16]>output_io_out[j+177][31:16]-16'h3)) &
                   ((io_out_89_Re[31:16]<output_io_out[j+178][31:16]+16'h3) & (io_out_89_Re[31:16]>output_io_out[j+178][31:16]-16'h3)) &
                   ((io_out_89_Im[31:16]<output_io_out[j+179][31:16]+16'h3) & (io_out_89_Im[31:16]>output_io_out[j+179][31:16]-16'h3)) &
                   ((io_out_90_Re[31:16]<output_io_out[j+180][31:16]+16'h3) & (io_out_90_Re[31:16]>output_io_out[j+180][31:16]-16'h3)) &
                   ((io_out_90_Im[31:16]<output_io_out[j+181][31:16]+16'h3) & (io_out_90_Im[31:16]>output_io_out[j+181][31:16]-16'h3)) &
                   ((io_out_91_Re[31:16]<output_io_out[j+182][31:16]+16'h3) & (io_out_91_Re[31:16]>output_io_out[j+182][31:16]-16'h3)) &
                   ((io_out_91_Im[31:16]<output_io_out[j+183][31:16]+16'h3) & (io_out_91_Im[31:16]>output_io_out[j+183][31:16]-16'h3)) &
                   ((io_out_92_Re[31:16]<output_io_out[j+184][31:16]+16'h3) & (io_out_92_Re[31:16]>output_io_out[j+184][31:16]-16'h3)) &
                   ((io_out_92_Im[31:16]<output_io_out[j+185][31:16]+16'h3) & (io_out_92_Im[31:16]>output_io_out[j+185][31:16]-16'h3)) & 
                   ((io_out_93_Re[31:16]<output_io_out[j+186][31:16]+16'h3) & (io_out_93_Re[31:16]>output_io_out[j+186][31:16]-16'h3)) &
                   ((io_out_93_Im[31:16]<output_io_out[j+187][31:16]+16'h3) & (io_out_93_Im[31:16]>output_io_out[j+187][31:16]-16'h3)) & 
                   ((io_out_94_Re[31:16]<output_io_out[j+188][31:16]+16'h3) & (io_out_94_Re[31:16]>output_io_out[j+188][31:16]-16'h3)) &
                   ((io_out_94_Im[31:16]<output_io_out[j+189][31:16]+16'h3) & (io_out_94_Im[31:16]>output_io_out[j+189][31:16]-16'h3)) & 
                   ((io_out_95_Re[31:16]<output_io_out[j+190][31:16]+16'h3) & (io_out_95_Re[31:16]>output_io_out[j+190][31:16]-16'h3)) &
                   ((io_out_95_Im[31:16]<output_io_out[j+191][31:16]+16'h3) & (io_out_95_Im[31:16]>output_io_out[j+191][31:16]-16'h3)) ;
	            `endif
                  `endif                                 
	        `endif                                   
              `endif                                     
	    `endif                                       
	  `endif                                         
        `endif                                           
      `endif                                             
    `endif                                               
  `endif
`endif
	    

`ifdef FFT_ST_WT2
check_pass = check_fft_len2 ;
`elsif FFT_ST_WT3
check_pass = check_fft_len2 & check_fft_len3 ;
`elsif FFT_ST_WT4
check_pass = check_fft_len2 & check_fft_len3 & check_fft_len4 ;
`elsif FFT_ST_WT6
check_pass = check_fft_len2 & check_fft_len3 & check_fft_len4 & check_fft_len6;
`elsif FFT_ST_WT8
check_pass = check_fft_len2 & check_fft_len3 & check_fft_len4 & check_fft_len6 & check_fft_len8 ;
`elsif FFT_ST_WT9
check_pass = check_fft_len2 & check_fft_len3 & check_fft_len4 & check_fft_len6 & check_fft_len8 & check_fft_len9 ;
`elsif FFT_ST_WT16
check_pass = check_fft_len2 & check_fft_len3 & check_fft_len4 & check_fft_len6 & check_fft_len8 & check_fft_len9 & check_fft_len12 & check_fft_len16 ;
`elsif FFT_ST_WT27
check_pass = check_fft_len2 & check_fft_len3 & check_fft_len4 & check_fft_len6 & check_fft_len8 & check_fft_len9 & check_fft_len12 & check_fft_len16 & check_fft_len18 & check_fft_len27;
`elsif FFT_ST_WT36
check_pass = check_fft_len2 & check_fft_len3 & check_fft_len4 & check_fft_len6 & check_fft_len8 & check_fft_len9 & check_fft_len12 & check_fft_len16 & check_fft_len18 & check_fft_len27 & check_fft_len36;
`elsif FFT_ST_WT96
check_pass = check_fft_len2 & check_fft_len3 & check_fft_len4 & check_fft_len6 & check_fft_len8 & check_fft_len9 & check_fft_len12 & check_fft_len16 & check_fft_len18 & check_fft_len27 & check_fft_len36 & check_fft_len96;
`endif

`ifdef FFT_ST_WT2
     debug[0] = ((io_out_0_Re[31:16]==output_io_out[j][31:16]  ) | (io_out_0_Re[31:16]==output_io_out[j][31:16]  +16'h1) | (io_out_0_Re[31:16]==output_io_out[j][31:16]  -16'h1));
     debug[1] = ((io_out_0_Im[31:16]==output_io_out[j+1][31:16]) | (io_out_0_Im[31:16]==output_io_out[j+1][31:16]+16'h1) | (io_out_0_Im[31:16]==output_io_out[j+1][31:16]-16'h1));
     debug[2] = ((io_out_1_Re[31:16]==output_io_out[j+2][31:16]) | (io_out_1_Re[31:16]==output_io_out[j+2][31:16]+16'h1) | (io_out_1_Re[31:16]==output_io_out[j+2][31:16]-16'h1));
     debug[3] = ((io_out_1_Im[31:16]==output_io_out[j+3][31:16]) | (io_out_1_Im[31:16]==output_io_out[j+3][31:16]+16'h1) | (io_out_1_Im[31:16]==output_io_out[j+3][31:16]-16'h1));
  `ifdef FFT_ST_WT3
     debug[4] = ((io_out_2_Re[31:16]==output_io_out[j+4][31:16]) | (io_out_2_Re[31:16]==output_io_out[j+4][31:16]+16'h1) | (io_out_2_Re[31:16]==output_io_out[j+4][31:16]-16'h1));
     debug[5] = ((io_out_2_Im[31:16]==output_io_out[j+5][31:16]) | (io_out_2_Im[31:16]==output_io_out[j+5][31:16]+16'h1) | (io_out_2_Im[31:16]==output_io_out[j+5][31:16]-16'h1));
    `ifdef FFT_ST_WT4
     debug[6] = ((io_out_3_Re[31:16]==output_io_out[j+6][31:16]) | (io_out_3_Re[31:16]==output_io_out[j+6][31:16]+16'h1) | (io_out_3_Re[31:16]==output_io_out[j+6][31:16]-16'h1));
     debug[7] = ((io_out_3_Im[31:16]==output_io_out[j+7][31:16]) | (io_out_3_Im[31:16]==output_io_out[j+7][31:16]+16'h1) | (io_out_3_Im[31:16]==output_io_out[j+7][31:16]-16'h1));
      `ifdef FFT_ST_WT6
     debug[8]  = ((io_out_4_Re[31:16]<output_io_out[j+8][31:16] +16'h3) & (io_out_4_Re[31:16]>output_io_out[j+8][31:16] -16'h3)); 
     debug[9]  = ((io_out_4_Im[31:16]<output_io_out[j+9][31:16] +16'h3) & (io_out_4_Im[31:16]>output_io_out[j+9][31:16] -16'h3)); 
     debug[10] = ((io_out_5_Re[31:16]<output_io_out[j+10][31:16]+16'h3) & (io_out_5_Re[31:16]>output_io_out[j+10][31:16]-16'h3));
     debug[11] = ((io_out_5_Im[31:16]<output_io_out[j+11][31:16]+16'h3) & (io_out_5_Im[31:16]>output_io_out[j+11][31:16]-16'h3));
        `ifdef FFT_ST_WT8
     debug[12] = ((io_out_6_Re[31:16]<output_io_out[j+12][31:16]+16'h3) & (io_out_6_Re[31:16]>output_io_out[j+12][31:16]-16'h3));
     debug[13] = ((io_out_6_Im[31:16]<output_io_out[j+13][31:16]+16'h3) & (io_out_6_Im[31:16]>output_io_out[j+13][31:16]-16'h3));
     debug[14] = ((io_out_7_Re[31:16]<output_io_out[j+14][31:16]+16'h3) & (io_out_7_Re[31:16]>output_io_out[j+14][31:16]-16'h3));
     debug[15] = ((io_out_7_Im[31:16]<output_io_out[j+15][31:16]+16'h3) & (io_out_7_Im[31:16]>output_io_out[j+15][31:16]-16'h3));
          `ifdef FFT_ST_WT9
     debug[16] = ((io_out_8_Re[31:16] <output_io_out[j+16][31:16]+16'h3) & (io_out_8_Re[31:16] >output_io_out[j+16][31:16]-16'h3));
     debug[17] = ((io_out_8_Im[31:16] <output_io_out[j+17][31:16]+16'h3) & (io_out_8_Im[31:16] >output_io_out[j+17][31:16]-16'h3));
            `ifdef FFT_ST_WT12
     debug[18] = ((io_out_9_Re[31:16] <output_io_out[j+18][31:16]+16'h3) & (io_out_9_Re[31:16] >output_io_out[j+18][31:16]-16'h3));
     debug[19] = ((io_out_9_Im[31:16] <output_io_out[j+19][31:16]+16'h3) & (io_out_9_Im[31:16] >output_io_out[j+19][31:16]-16'h3));
     debug[20] = ((io_out_10_Re[31:16]<output_io_out[j+20][31:16]+16'h3) & (io_out_10_Re[31:16]>output_io_out[j+20][31:16]-16'h3));
     debug[21] = ((io_out_10_Im[31:16]<output_io_out[j+21][31:16]+16'h3) & (io_out_10_Im[31:16]>output_io_out[j+21][31:16]-16'h3));
     debug[22] = ((io_out_11_Re[31:16]<output_io_out[j+22][31:16]+16'h3) & (io_out_11_Re[31:16]>output_io_out[j+22][31:16]-16'h3));
     debug[23] = ((io_out_11_Im[31:16]<output_io_out[j+23][31:16]+16'h3) & (io_out_11_Im[31:16]>output_io_out[j+23][31:16]-16'h3));
              `ifdef FFT_ST_WT16
     debug[24] = ((io_out_12_Re[31:16]<output_io_out[j+24][31:16]+16'h3) & (io_out_12_Re[31:16]>output_io_out[j+24][31:16]-16'h3)); 
     debug[25] = ((io_out_12_Im[31:16]<output_io_out[j+25][31:16]+16'h3) & (io_out_12_Im[31:16]>output_io_out[j+25][31:16]-16'h3)); 
     debug[26] = ((io_out_13_Re[31:16]<output_io_out[j+26][31:16]+16'h3) & (io_out_13_Re[31:16]>output_io_out[j+26][31:16]-16'h3));
     debug[27] = ((io_out_13_Im[31:16]<output_io_out[j+27][31:16]+16'h3) & (io_out_13_Im[31:16]>output_io_out[j+27][31:16]-16'h3));
     debug[28] = ((io_out_14_Re[31:16]<output_io_out[j+28][31:16]+16'h3) & (io_out_14_Re[31:16]>output_io_out[j+28][31:16]-16'h3));
     debug[29] = ((io_out_14_Im[31:16]<output_io_out[j+29][31:16]+16'h3) & (io_out_14_Im[31:16]>output_io_out[j+29][31:16]-16'h3));
     debug[30] = ((io_out_15_Re[31:16]<output_io_out[j+30][31:16]+16'h3) & (io_out_15_Re[31:16]>output_io_out[j+30][31:16]-16'h3));
     debug[31] = ((io_out_15_Im[31:16]<output_io_out[j+31][31:16]+16'h3) & (io_out_15_Im[31:16]>output_io_out[j+31][31:16]-16'h3));
                `ifdef FFT_ST_WT18
     debug[32] = ((io_out_16_Re[31:16]<output_io_out[j+32][31:16]+16'h3) & (io_out_16_Re[31:16]>output_io_out[j+32][31:16]-16'h3));
     debug[33] = ((io_out_16_Im[31:16]<output_io_out[j+33][31:16]+16'h3) & (io_out_16_Im[31:16]>output_io_out[j+33][31:16]-16'h3));
     debug[34] = ((io_out_17_Re[31:16]<output_io_out[j+34][31:16]+16'h3) & (io_out_17_Re[31:16]>output_io_out[j+34][31:16]-16'h3));
     debug[35] = ((io_out_17_Im[31:16]<output_io_out[j+35][31:16]+16'h3) & (io_out_17_Im[31:16]>output_io_out[j+35][31:16]-16'h3));
                  `ifdef FFT_ST_WT27
     debug[36] = ((io_out_18_Re[31:16]<output_io_out[j+36][31:16]+16'h3) & (io_out_18_Re[31:16]>output_io_out[j+36][31:16]-16'h3));
     debug[37] = ((io_out_18_Im[31:16]<output_io_out[j+37][31:16]+16'h3) & (io_out_18_Im[31:16]>output_io_out[j+37][31:16]-16'h3));
     debug[38] = ((io_out_19_Re[31:16]<output_io_out[j+38][31:16]+16'h3) & (io_out_19_Re[31:16]>output_io_out[j+38][31:16]-16'h3));
     debug[39] = ((io_out_19_Im[31:16]<output_io_out[j+39][31:16]+16'h3) & (io_out_19_Im[31:16]>output_io_out[j+39][31:16]-16'h3)); 
     debug[40] = ((io_out_20_Re[31:16]<output_io_out[j+40][31:16]+16'h3) & (io_out_20_Re[31:16]>output_io_out[j+40][31:16]-16'h3));
     debug[41] = ((io_out_20_Im[31:16]<output_io_out[j+41][31:16]+16'h3) & (io_out_20_Im[31:16]>output_io_out[j+41][31:16]-16'h3));
     debug[42] = ((io_out_21_Re[31:16]<output_io_out[j+42][31:16]+16'h3) & (io_out_21_Re[31:16]>output_io_out[j+42][31:16]-16'h3));
     debug[43] = ((io_out_21_Im[31:16]<output_io_out[j+43][31:16]+16'h3) & (io_out_21_Im[31:16]>output_io_out[j+43][31:16]-16'h3));
     debug[44] = ((io_out_22_Re[31:16]<output_io_out[j+44][31:16]+16'h3) & (io_out_22_Re[31:16]>output_io_out[j+44][31:16]-16'h3));
     debug[45] = ((io_out_22_Im[31:16]<output_io_out[j+45][31:16]+16'h3) & (io_out_22_Im[31:16]>output_io_out[j+45][31:16]-16'h3));
     debug[46] = ((io_out_23_Re[31:16]<output_io_out[j+46][31:16]+16'h3) & (io_out_23_Re[31:16]>output_io_out[j+46][31:16]-16'h3));
     debug[47] = ((io_out_23_Im[31:16]<output_io_out[j+47][31:16]+16'h3) & (io_out_23_Im[31:16]>output_io_out[j+47][31:16]-16'h3));
     debug[48] = ((io_out_24_Re[31:16]<output_io_out[j+48][31:16]+16'h3) & (io_out_24_Re[31:16]>output_io_out[j+48][31:16]-16'h3));
     debug[49] = ((io_out_24_Im[31:16]<output_io_out[j+49][31:16]+16'h3) & (io_out_24_Im[31:16]>output_io_out[j+49][31:16]-16'h3)); 
     debug[50] = ((io_out_25_Re[31:16]<output_io_out[j+50][31:16]+16'h3) & (io_out_25_Re[31:16]>output_io_out[j+50][31:16]-16'h3));
     debug[51] = ((io_out_25_Im[31:16]<output_io_out[j+51][31:16]+16'h3) & (io_out_25_Im[31:16]>output_io_out[j+51][31:16]-16'h3));
     debug[52] = ((io_out_26_Re[31:16]<output_io_out[j+52][31:16]+16'h3) & (io_out_26_Re[31:16]>output_io_out[j+52][31:16]-16'h3));
     debug[53] = ((io_out_26_Im[31:16]<output_io_out[j+53][31:16]+16'h3) & (io_out_26_Im[31:16]>output_io_out[j+53][31:16]-16'h3));
                    `ifdef FFT_ST_WT36
     debug[54] = ((io_out_27_Re[31:16]<output_io_out[j+54][31:16]+16'h3) & (io_out_27_Re[31:16]>output_io_out[j+54][31:16]-16'h3));
     debug[55] = ((io_out_27_Im[31:16]<output_io_out[j+55][31:16]+16'h3) & (io_out_27_Im[31:16]>output_io_out[j+55][31:16]-16'h3));
     debug[56] = ((io_out_28_Re[31:16]<output_io_out[j+56][31:16]+16'h3) & (io_out_28_Re[31:16]>output_io_out[j+56][31:16]-16'h3));
     debug[57] = ((io_out_28_Im[31:16]<output_io_out[j+57][31:16]+16'h3) & (io_out_28_Im[31:16]>output_io_out[j+57][31:16]-16'h3));
     debug[58] = ((io_out_29_Re[31:16]<output_io_out[j+58][31:16]+16'h3) & (io_out_29_Re[31:16]>output_io_out[j+58][31:16]-16'h3));
     debug[59] = ((io_out_29_Im[31:16]<output_io_out[j+59][31:16]+16'h3) & (io_out_29_Im[31:16]>output_io_out[j+59][31:16]-16'h3)); 
     debug[60] = ((io_out_30_Re[31:16]<output_io_out[j+60][31:16]+16'h3) & (io_out_30_Re[31:16]>output_io_out[j+60][31:16]-16'h3));
     debug[61] = ((io_out_30_Im[31:16]<output_io_out[j+61][31:16]+16'h3) & (io_out_30_Im[31:16]>output_io_out[j+61][31:16]-16'h3));
     debug[62] = ((io_out_31_Re[31:16]<output_io_out[j+62][31:16]+16'h3) & (io_out_31_Re[31:16]>output_io_out[j+62][31:16]-16'h3));
     debug[63] = ((io_out_31_Im[31:16]<output_io_out[j+63][31:16]+16'h3) & (io_out_31_Im[31:16]>output_io_out[j+63][31:16]-16'h3));
     debug[64] = ((io_out_32_Re[31:16]<output_io_out[j+64][31:16]+16'h3) & (io_out_32_Re[31:16]>output_io_out[j+64][31:16]-16'h3));
     debug[65] = ((io_out_32_Im[31:16]<output_io_out[j+65][31:16]+16'h3) & (io_out_32_Im[31:16]>output_io_out[j+65][31:16]-16'h3));
     debug[66] = ((io_out_33_Re[31:16]<output_io_out[j+66][31:16]+16'h3) & (io_out_33_Re[31:16]>output_io_out[j+66][31:16]-16'h3));
     debug[67] = ((io_out_33_Im[31:16]<output_io_out[j+67][31:16]+16'h3) & (io_out_33_Im[31:16]>output_io_out[j+67][31:16]-16'h3));
     debug[68] = ((io_out_34_Re[31:16]<output_io_out[j+68][31:16]+16'h3) & (io_out_34_Re[31:16]>output_io_out[j+68][31:16]-16'h3));
     debug[69] = ((io_out_34_Im[31:16]<output_io_out[j+69][31:16]+16'h3) & (io_out_34_Im[31:16]>output_io_out[j+69][31:16]-16'h3)); 
     debug[70] = ((io_out_35_Re[31:16]<output_io_out[j+70][31:16]+16'h3) & (io_out_35_Re[31:16]>output_io_out[j+70][31:16]-16'h3));
     debug[71] = ((io_out_35_Im[31:16]<output_io_out[j+71][31:16]+16'h3) & (io_out_35_Im[31:16]>output_io_out[j+71][31:16]-16'h3));
                    `ifdef FFT_ST_WT96
     debug[72]  = ((io_out_36_Re[31:16]<output_io_out[j+72][31:16]+16'h3) & (io_out_36_Re[31:16]>output_io_out[j+72][31:16]-16'h3)) ;
     debug[73]  = ((io_out_36_Im[31:16]<output_io_out[j+73][31:16]+16'h3) & (io_out_36_Im[31:16]>output_io_out[j+73][31:16]-16'h3)) ;
     debug[74]  = ((io_out_37_Im[31:16]<output_io_out[j+74][31:16]+16'h3) & (io_out_37_Im[31:16]>output_io_out[j+74][31:16]-16'h3)) ;
     debug[75]  = ((io_out_37_Re[31:16]<output_io_out[j+75][31:16]+16'h3) & (io_out_37_Re[31:16]>output_io_out[j+75][31:16]-16'h3)) ;
     debug[76]  = ((io_out_38_Im[31:16]<output_io_out[j+76][31:16]+16'h3) & (io_out_38_Im[31:16]>output_io_out[j+76][31:16]-16'h3)) ;
     debug[77]  = ((io_out_38_Im[31:16]<output_io_out[j+77][31:16]+16'h3) & (io_out_38_Im[31:16]>output_io_out[j+77][31:16]-16'h3)) ;
     debug[78]  = ((io_out_39_Im[31:16]<output_io_out[j+78][31:16]+16'h3) & (io_out_39_Im[31:16]>output_io_out[j+78][31:16]-16'h3)) ;
     debug[79]  = ((io_out_39_Im[31:16]<output_io_out[j+79][31:16]+16'h3) & (io_out_39_Im[31:16]>output_io_out[j+79][31:16]-16'h3)) ;
     debug[80]  = ((io_out_40_Re[31:16]<output_io_out[j+80][31:16]+16'h3) & (io_out_40_Re[31:16]>output_io_out[j+80][31:16]-16'h3)) ;
     debug[81]  = ((io_out_40_Im[31:16]<output_io_out[j+81][31:16]+16'h3) & (io_out_40_Im[31:16]>output_io_out[j+81][31:16]-16'h3)) ;
     debug[82]  = ((io_out_41_Re[31:16]<output_io_out[j+82][31:16]+16'h3) & (io_out_41_Re[31:16]>output_io_out[j+82][31:16]-16'h3)) ;
     debug[83]  = ((io_out_41_Im[31:16]<output_io_out[j+83][31:16]+16'h3) & (io_out_41_Im[31:16]>output_io_out[j+83][31:16]-16'h3)) ;
     debug[84]  = ((io_out_42_Re[31:16]<output_io_out[j+84][31:16]+16'h3) & (io_out_42_Re[31:16]>output_io_out[j+84][31:16]-16'h3)) ;
     debug[85]  = ((io_out_42_Im[31:16]<output_io_out[j+85][31:16]+16'h3) & (io_out_42_Im[31:16]>output_io_out[j+85][31:16]-16'h3)) ; 
     debug[86]  = ((io_out_43_Re[31:16]<output_io_out[j+86][31:16]+16'h3) & (io_out_43_Re[31:16]>output_io_out[j+86][31:16]-16'h3)) ;
     debug[87]  = ((io_out_43_Im[31:16]<output_io_out[j+87][31:16]+16'h3) & (io_out_43_Im[31:16]>output_io_out[j+87][31:16]-16'h3)) ;
     debug[88]  = ((io_out_44_Re[31:16]<output_io_out[j+88][31:16]+16'h3) & (io_out_44_Re[31:16]>output_io_out[j+88][31:16]-16'h3)) ;
     debug[89]  = ((io_out_44_Im[31:16]<output_io_out[j+89][31:16]+16'h3) & (io_out_44_Im[31:16]>output_io_out[j+89][31:16]-16'h3)) ;
     debug[90]  = ((io_out_45_Re[31:16]<output_io_out[j+90][31:16]+16'h3) & (io_out_45_Re[31:16]>output_io_out[j+90][31:16]-16'h3)) ;
     debug[91]  = ((io_out_45_Im[31:16]<output_io_out[j+91][31:16]+16'h3) & (io_out_45_Im[31:16]>output_io_out[j+91][31:16]-16'h3)) ;
     debug[92]  = ((io_out_46_Re[31:16]<output_io_out[j+92][31:16]+16'h3) & (io_out_46_Re[31:16]>output_io_out[j+92][31:16]-16'h3)) ;
     debug[93]  = ((io_out_46_Im[31:16]<output_io_out[j+93][31:16]+16'h3) & (io_out_46_Im[31:16]>output_io_out[j+93][31:16]-16'h3)) ;
     debug[94]  = ((io_out_47_Re[31:16]<output_io_out[j+94][31:16]+16'h3) & (io_out_47_Re[31:16]>output_io_out[j+94][31:16]-16'h3)) ;
     debug[95]  = ((io_out_47_Re[31:16]<output_io_out[j+95][31:16]+16'h3) & (io_out_47_Re[31:16]>output_io_out[j+95][31:16]-16'h3)) ;
     debug[96]  = ((io_out_48_Im[31:16]<output_io_out[j+96][31:16]+16'h3) & (io_out_48_Im[31:16]>output_io_out[j+96][31:16]-16'h3)) ;
     debug[97]  = ((io_out_48_Re[31:16]<output_io_out[j+97][31:16]+16'h3) & (io_out_48_Re[31:16]>output_io_out[j+97][31:16]-16'h3)) ;
     debug[98]  = ((io_out_49_Im[31:16]<output_io_out[j+98][31:16]+16'h3) & (io_out_49_Im[31:16]>output_io_out[j+98][31:16]-16'h3)) ;
     debug[99]  = ((io_out_49_Re[31:16]<output_io_out[j+99][31:16]+16'h3) & (io_out_49_Re[31:16]>output_io_out[j+99][31:16]-16'h3)) ;
     debug[100] = ((io_out_50_Im[31:16]<output_io_out[j+100][31:16]+16'h3) & (io_out_50_Im[31:16]>output_io_out[j+100][31:16]-16'h3)) ; 
     debug[101] = ((io_out_50_Re[31:16]<output_io_out[j+101][31:16]+16'h3) & (io_out_50_Re[31:16]>output_io_out[j+101][31:16]-16'h3)) ;
     debug[102] = ((io_out_51_Im[31:16]<output_io_out[j+102][31:16]+16'h3) & (io_out_51_Im[31:16]>output_io_out[j+102][31:16]-16'h3)) ;
     debug[103] = ((io_out_51_Re[31:16]<output_io_out[j+103][31:16]+16'h3) & (io_out_51_Re[31:16]>output_io_out[j+103][31:16]-16'h3)) ;
     debug[104] = ((io_out_52_Im[31:16]<output_io_out[j+104][31:16]+16'h3) & (io_out_52_Im[31:16]>output_io_out[j+104][31:16]-16'h3)) ;
     debug[105] = ((io_out_52_Re[31:16]<output_io_out[j+105][31:16]+16'h3) & (io_out_52_Re[31:16]>output_io_out[j+105][31:16]-16'h3)) ;
     debug[106] = ((io_out_53_Im[31:16]<output_io_out[j+106][31:16]+16'h3) & (io_out_53_Im[31:16]>output_io_out[j+106][31:16]-16'h3)) ;
     debug[107] = ((io_out_53_Re[31:16]<output_io_out[j+107][31:16]+16'h3) & (io_out_53_Re[31:16]>output_io_out[j+107][31:16]-16'h3)) ;
     debug[108] = ((io_out_54_Im[31:16]<output_io_out[j+108][31:16]+16'h3) & (io_out_54_Im[31:16]>output_io_out[j+108][31:16]-16'h3)) ;
     debug[109] = ((io_out_54_Re[31:16]<output_io_out[j+109][31:16]+16'h3) & (io_out_54_Re[31:16]>output_io_out[j+109][31:16]-16'h3)) ;
     debug[110] = ((io_out_55_Re[31:16]<output_io_out[j+110][31:16]+16'h3) & (io_out_55_Re[31:16]>output_io_out[j+110][31:16]-16'h3)) ;
     debug[111] = ((io_out_55_Im[31:16]<output_io_out[j+111][31:16]+16'h3) & (io_out_55_Im[31:16]>output_io_out[j+111][31:16]-16'h3)) ;
     debug[112] = ((io_out_56_Re[31:16]<output_io_out[j+112][31:16]+16'h3) & (io_out_56_Re[31:16]>output_io_out[j+112][31:16]-16'h3)) ;
     debug[113] = ((io_out_56_Im[31:16]<output_io_out[j+113][31:16]+16'h3) & (io_out_56_Im[31:16]>output_io_out[j+113][31:16]-16'h3)) ;
     debug[114] = ((io_out_57_Re[31:16]<output_io_out[j+114][31:16]+16'h3) & (io_out_57_Re[31:16]>output_io_out[j+114][31:16]-16'h3)) ;
     debug[115] = ((io_out_57_Im[31:16]<output_io_out[j+115][31:16]+16'h3) & (io_out_57_Im[31:16]>output_io_out[j+115][31:16]-16'h3)) ; 
     debug[116] = ((io_out_58_Re[31:16]<output_io_out[j+116][31:16]+16'h3) & (io_out_58_Re[31:16]>output_io_out[j+116][31:16]-16'h3)) ;
     debug[117] = ((io_out_58_Im[31:16]<output_io_out[j+117][31:16]+16'h3) & (io_out_58_Im[31:16]>output_io_out[j+117][31:16]-16'h3)) ;
     debug[118] = ((io_out_59_Re[31:16]<output_io_out[j+118][31:16]+16'h3) & (io_out_59_Re[31:16]>output_io_out[j+118][31:16]-16'h3)) ;
     debug[119] = ((io_out_59_Im[31:16]<output_io_out[j+119][31:16]+16'h3) & (io_out_59_Im[31:16]>output_io_out[j+119][31:16]-16'h3)) ;
     debug[120] = ((io_out_60_Re[31:16]<output_io_out[j+120][31:16]+16'h3) & (io_out_60_Re[31:16]>output_io_out[j+120][31:16]-16'h3)) ;
     debug[121] = ((io_out_60_Im[31:16]<output_io_out[j+121][31:16]+16'h3) & (io_out_60_Im[31:16]>output_io_out[j+121][31:16]-16'h3)) ;
     debug[122] = ((io_out_61_Re[31:16]<output_io_out[j+122][31:16]+16'h3) & (io_out_61_Re[31:16]>output_io_out[j+122][31:16]-16'h3)) ;
     debug[123] = ((io_out_61_Im[31:16]<output_io_out[j+123][31:16]+16'h3) & (io_out_61_Im[31:16]>output_io_out[j+123][31:16]-16'h3)) ;
     debug[124] = ((io_out_62_Re[31:16]<output_io_out[j+124][31:16]+16'h3) & (io_out_62_Re[31:16]>output_io_out[j+124][31:16]-16'h3)) ;
     debug[125] = ((io_out_62_Re[31:16]<output_io_out[j+125][31:16]+16'h3) & (io_out_62_Re[31:16]>output_io_out[j+125][31:16]-16'h3)) ;
     debug[126] = ((io_out_63_Im[31:16]<output_io_out[j+126][31:16]+16'h3) & (io_out_63_Im[31:16]>output_io_out[j+126][31:16]-16'h3)) ;
     debug[127] = ((io_out_63_Re[31:16]<output_io_out[j+127][31:16]+16'h3) & (io_out_63_Re[31:16]>output_io_out[j+127][31:16]-16'h3)) ;
     debug[128] = ((io_out_64_Im[31:16]<output_io_out[j+128][31:16]+16'h3) & (io_out_64_Im[31:16]>output_io_out[j+128][31:16]-16'h3)) ;
     debug[129] = ((io_out_64_Re[31:16]<output_io_out[j+129][31:16]+16'h3) & (io_out_64_Re[31:16]>output_io_out[j+129][31:16]-16'h3)) ;
     debug[130] = ((io_out_65_Im[31:16]<output_io_out[j+130][31:16]+16'h3) & (io_out_65_Im[31:16]>output_io_out[j+130][31:16]-16'h3)) ; 
     debug[131] = ((io_out_65_Re[31:16]<output_io_out[j+131][31:16]+16'h3) & (io_out_65_Re[31:16]>output_io_out[j+131][31:16]-16'h3)) ;
     debug[132] = ((io_out_66_Im[31:16]<output_io_out[j+132][31:16]+16'h3) & (io_out_66_Im[31:16]>output_io_out[j+132][31:16]-16'h3)) ;
     debug[133] = ((io_out_66_Re[31:16]<output_io_out[j+133][31:16]+16'h3) & (io_out_66_Re[31:16]>output_io_out[j+133][31:16]-16'h3)) ;
     debug[134] = ((io_out_67_Im[31:16]<output_io_out[j+134][31:16]+16'h3) & (io_out_67_Im[31:16]>output_io_out[j+134][31:16]-16'h3)) ;
     debug[135] = ((io_out_67_Re[31:16]<output_io_out[j+135][31:16]+16'h3) & (io_out_67_Re[31:16]>output_io_out[j+135][31:16]-16'h3)) ;
     debug[136] = ((io_out_68_Im[31:16]<output_io_out[j+136][31:16]+16'h3) & (io_out_68_Im[31:16]>output_io_out[j+136][31:16]-16'h3)) ;
     debug[137] = ((io_out_68_Re[31:16]<output_io_out[j+137][31:16]+16'h3) & (io_out_68_Re[31:16]>output_io_out[j+137][31:16]-16'h3)) ;
     debug[138] = ((io_out_69_Im[31:16]<output_io_out[j+138][31:16]+16'h3) & (io_out_69_Im[31:16]>output_io_out[j+138][31:16]-16'h3)) ;
     debug[139] = ((io_out_69_Re[31:16]<output_io_out[j+139][31:16]+16'h3) & (io_out_69_Re[31:16]>output_io_out[j+139][31:16]-16'h3)) ;
     debug[140] = ((io_out_70_Im[31:16]<output_io_out[j+140][31:16]+16'h3) & (io_out_70_Im[31:16]>output_io_out[j+140][31:16]-16'h3)) ;
     debug[141] = ((io_out_70_Re[31:16]<output_io_out[j+141][31:16]+16'h3) & (io_out_70_Re[31:16]>output_io_out[j+141][31:16]-16'h3)) ;
     debug[142] = ((io_out_71_Im[31:16]<output_io_out[j+142][31:16]+16'h3) & (io_out_71_Im[31:16]>output_io_out[j+142][31:16]-16'h3)) ;
     debug[143] = ((io_out_71_Re[31:16]<output_io_out[j+143][31:16]+16'h3) & (io_out_71_Re[31:16]>output_io_out[j+143][31:16]-16'h3)) ;
     debug[144] = ((io_out_72_Im[31:16]<output_io_out[j+144][31:16]+16'h3) & (io_out_72_Im[31:16]>output_io_out[j+144][31:16]-16'h3)) ; 
     debug[145] = ((io_out_72_Re[31:16]<output_io_out[j+145][31:16]+16'h3) & (io_out_72_Re[31:16]>output_io_out[j+145][31:16]-16'h3)) ;
     debug[146] = ((io_out_73_Im[31:16]<output_io_out[j+146][31:16]+16'h3) & (io_out_73_Im[31:16]>output_io_out[j+146][31:16]-16'h3)) ;
     debug[147] = ((io_out_73_Re[31:16]<output_io_out[j+147][31:16]+16'h3) & (io_out_73_Re[31:16]>output_io_out[j+147][31:16]-16'h3)) ;
     debug[148] = ((io_out_74_Im[31:16]<output_io_out[j+148][31:16]+16'h3) & (io_out_74_Im[31:16]>output_io_out[j+148][31:16]-16'h3)) ;
     debug[149] = ((io_out_74_Re[31:16]<output_io_out[j+149][31:16]+16'h3) & (io_out_74_Re[31:16]>output_io_out[j+149][31:16]-16'h3)) ;
     debug[150] = ((io_out_75_Im[31:16]<output_io_out[j+150][31:16]+16'h3) & (io_out_75_Im[31:16]>output_io_out[j+150][31:16]-16'h3)) ;
     debug[151] = ((io_out_75_Re[31:16]<output_io_out[j+151][31:16]+16'h3) & (io_out_75_Re[31:16]>output_io_out[j+151][31:16]-16'h3)) ;
     debug[152] = ((io_out_76_Im[31:16]<output_io_out[j+152][31:16]+16'h3) & (io_out_76_Im[31:16]>output_io_out[j+152][31:16]-16'h3)) ;
     debug[153] = ((io_out_76_Re[31:16]<output_io_out[j+153][31:16]+16'h3) & (io_out_76_Re[31:16]>output_io_out[j+153][31:16]-16'h3)) ;
     debug[154] = ((io_out_77_Im[31:16]<output_io_out[j+154][31:16]+16'h3) & (io_out_77_Im[31:16]>output_io_out[j+154][31:16]-16'h3)) ;
     debug[155] = ((io_out_77_Re[31:16]<output_io_out[j+155][31:16]+16'h3) & (io_out_77_Re[31:16]>output_io_out[j+155][31:16]-16'h3)) ;
     debug[156] = ((io_out_78_Im[31:16]<output_io_out[j+156][31:16]+16'h3) & (io_out_78_Im[31:16]>output_io_out[j+156][31:16]-16'h3)) ;
     debug[157] = ((io_out_78_Re[31:16]<output_io_out[j+157][31:16]+16'h3) & (io_out_78_Re[31:16]>output_io_out[j+157][31:16]-16'h3)) ;
     debug[158] = ((io_out_79_Im[31:16]<output_io_out[j+158][31:16]+16'h3) & (io_out_79_Im[31:16]>output_io_out[j+158][31:16]-16'h3)) ;
     debug[159] = ((io_out_79_Re[31:16]<output_io_out[j+159][31:16]+16'h3) & (io_out_79_Re[31:16]>output_io_out[j+159][31:16]-16'h3)) ;
     debug[160] = ((io_out_80_Im[31:16]<output_io_out[j+160][31:16]+16'h3) & (io_out_80_Im[31:16]>output_io_out[j+160][31:16]-16'h3)) ; 
     debug[161] = ((io_out_80_Re[31:16]<output_io_out[j+161][31:16]+16'h3) & (io_out_80_Re[31:16]>output_io_out[j+161][31:16]-16'h3)) ;
     debug[162] = ((io_out_81_Im[31:16]<output_io_out[j+162][31:16]+16'h3) & (io_out_81_Im[31:16]>output_io_out[j+162][31:16]-16'h3)) ;
     debug[163] = ((io_out_81_Re[31:16]<output_io_out[j+163][31:16]+16'h3) & (io_out_81_Re[31:16]>output_io_out[j+163][31:16]-16'h3)) ;
     debug[164] = ((io_out_82_Im[31:16]<output_io_out[j+164][31:16]+16'h3) & (io_out_82_Im[31:16]>output_io_out[j+164][31:16]-16'h3)) ;
     debug[165] = ((io_out_82_Re[31:16]<output_io_out[j+165][31:16]+16'h3) & (io_out_82_Re[31:16]>output_io_out[j+165][31:16]-16'h3)) ;
     debug[166] = ((io_out_83_Im[31:16]<output_io_out[j+166][31:16]+16'h3) & (io_out_83_Im[31:16]>output_io_out[j+166][31:16]-16'h3)) ;
     debug[167] = ((io_out_83_Re[31:16]<output_io_out[j+167][31:16]+16'h3) & (io_out_83_Re[31:16]>output_io_out[j+167][31:16]-16'h3)) ;
     debug[168] = ((io_out_84_Im[31:16]<output_io_out[j+168][31:16]+16'h3) & (io_out_84_Im[31:16]>output_io_out[j+168][31:16]-16'h3)) ;
     debug[169] = ((io_out_84_Re[31:16]<output_io_out[j+169][31:16]+16'h3) & (io_out_84_Re[31:16]>output_io_out[j+169][31:16]-16'h3)) ;
     debug[170] = ((io_out_85_Re[31:16]<output_io_out[j+170][31:16]+16'h3) & (io_out_85_Re[31:16]>output_io_out[j+170][31:16]-16'h3)) ;
     debug[171] = ((io_out_85_Im[31:16]<output_io_out[j+171][31:16]+16'h3) & (io_out_85_Im[31:16]>output_io_out[j+171][31:16]-16'h3)) ;
     debug[172] = ((io_out_86_Re[31:16]<output_io_out[j+172][31:16]+16'h3) & (io_out_86_Re[31:16]>output_io_out[j+172][31:16]-16'h3)) ;
     debug[173] = ((io_out_86_Im[31:16]<output_io_out[j+173][31:16]+16'h3) & (io_out_86_Im[31:16]>output_io_out[j+173][31:16]-16'h3)) ;
     debug[174] = ((io_out_87_Re[31:16]<output_io_out[j+174][31:16]+16'h3) & (io_out_87_Re[31:16]>output_io_out[j+174][31:16]-16'h3)) ;
     debug[175] = ((io_out_87_Im[31:16]<output_io_out[j+175][31:16]+16'h3) & (io_out_87_Im[31:16]>output_io_out[j+175][31:16]-16'h3)) ; 
     debug[176] = ((io_out_88_Re[31:16]<output_io_out[j+176][31:16]+16'h3) & (io_out_88_Re[31:16]>output_io_out[j+176][31:16]-16'h3)) ;
     debug[177] = ((io_out_88_Im[31:16]<output_io_out[j+177][31:16]+16'h3) & (io_out_88_Im[31:16]>output_io_out[j+177][31:16]-16'h3)) ;
     debug[178] = ((io_out_89_Re[31:16]<output_io_out[j+178][31:16]+16'h3) & (io_out_89_Re[31:16]>output_io_out[j+178][31:16]-16'h3)) ;
     debug[179] = ((io_out_89_Im[31:16]<output_io_out[j+179][31:16]+16'h3) & (io_out_89_Im[31:16]>output_io_out[j+179][31:16]-16'h3)) ;
     debug[180] = ((io_out_90_Re[31:16]<output_io_out[j+180][31:16]+16'h3) & (io_out_90_Re[31:16]>output_io_out[j+180][31:16]-16'h3)) ;
     debug[181] = ((io_out_90_Im[31:16]<output_io_out[j+181][31:16]+16'h3) & (io_out_90_Im[31:16]>output_io_out[j+181][31:16]-16'h3)) ;
     debug[182] = ((io_out_91_Re[31:16]<output_io_out[j+182][31:16]+16'h3) & (io_out_91_Re[31:16]>output_io_out[j+182][31:16]-16'h3)) ;
     debug[183] = ((io_out_91_Im[31:16]<output_io_out[j+183][31:16]+16'h3) & (io_out_91_Im[31:16]>output_io_out[j+183][31:16]-16'h3)) ;
     debug[184] = ((io_out_92_Re[31:16]<output_io_out[j+184][31:16]+16'h3) & (io_out_92_Re[31:16]>output_io_out[j+184][31:16]-16'h3)) ;
     debug[185] = ((io_out_92_Im[31:16]<output_io_out[j+185][31:16]+16'h3) & (io_out_92_Im[31:16]>output_io_out[j+185][31:16]-16'h3)) ; 
     debug[186] = ((io_out_93_Re[31:16]<output_io_out[j+186][31:16]+16'h3) & (io_out_93_Re[31:16]>output_io_out[j+186][31:16]-16'h3)) ;
     debug[187] = ((io_out_93_Im[31:16]<output_io_out[j+187][31:16]+16'h3) & (io_out_93_Im[31:16]>output_io_out[j+187][31:16]-16'h3)) ; 
     debug[188] = ((io_out_94_Re[31:16]<output_io_out[j+188][31:16]+16'h3) & (io_out_94_Re[31:16]>output_io_out[j+188][31:16]-16'h3)) ;
     debug[189] = ((io_out_94_Im[31:16]<output_io_out[j+189][31:16]+16'h3) & (io_out_94_Im[31:16]>output_io_out[j+189][31:16]-16'h3)) ; 
     debug[190] = ((io_out_95_Re[31:16]<output_io_out[j+190][31:16]+16'h3) & (io_out_95_Re[31:16]>output_io_out[j+190][31:16]-16'h3)) ;
     debug[191] = ((io_out_95_Im[31:16]<output_io_out[j+191][31:16]+16'h3) & (io_out_95_Im[31:16]>output_io_out[j+191][31:16]-16'h3)) ;
                      `endif
                    `endif
                  `endif
	        `endif
              `endif
	    `endif
	  `endif
        `endif
      `endif
    `endif
  `endif
`endif
     if (check_pass) begin
       $display("-------------------------------------------------------");
       $display("At %d ns, the %d FFT check Pass, the no. is %d", $time, j/2/`FFT_WT, j);

`ifdef FFT_ST_WT2
       $display("Expected io_out_0_Re is %h, dut output is %h", output_io_out[j],io_out_0_Re);
       $display("Expected io_out_0_Im is %h, dut output is %h", output_io_out[j+1],io_out_0_Im);
       $display("Expected io_out_1_Re is %h, dut output is %h", output_io_out[j+2],io_out_1_Re);
       $display("Expected io_out_1_Im is %h, dut output is %h", output_io_out[j+3],io_out_1_Im);
  `ifdef FFT_ST_WT3
       $display("Expected io_out_2_Re is %h, dut output is %h", output_io_out[j+4],io_out_2_Re);
       $display("Expected io_out_2_Im is %h, dut output is %h", output_io_out[j+5],io_out_2_Im);
    `ifdef FFT_ST_WT4
       $display("Expected io_out_3_Re is %h, dut output is %h", output_io_out[j+6],io_out_3_Re);
       $display("Expected io_out_3_Im is %h, dut output is %h", output_io_out[j+7],io_out_3_Im);
      `ifdef FFT_ST_WT6
       $display("Expected io_out_4_Re is %h, dut output is %h", output_io_out[j+8], io_out_4_Re);
       $display("Expected io_out_4_Im is %h, dut output is %h", output_io_out[j+9], io_out_4_Im);
       $display("Expected io_out_5_Re is %h, dut output is %h", output_io_out[j+10],io_out_5_Re);
       $display("Expected io_out_5_Im is %h, dut output is %h", output_io_out[j+11],io_out_5_Im);
         `ifdef FFT_ST_WT8
       $display("Expected io_out_6_Re is %h, dut output is %h", output_io_out[j+12],io_out_6_Re);
       $display("Expected io_out_6_Im is %h, dut output is %h", output_io_out[j+13],io_out_6_Im);
       $display("Expected io_out_7_Re is %h, dut output is %h", output_io_out[j+14],io_out_7_Re);
       $display("Expected io_out_7_Im is %h, dut output is %h", output_io_out[j+15],io_out_7_Im);
           `ifdef FFT_ST_WT9
       $display("Expected io_out_8_Re is %h, dut output is %h", output_io_out[j+16],io_out_8_Re);
       $display("Expected io_out_8_Im is %h, dut output is %h", output_io_out[j+17],io_out_8_Im);
             `ifdef FFT_ST_WT12
       $display("Expected io_out_9_Re is %h, dut output is %h", output_io_out[j+18],io_out_9_Re);
       $display("Expected io_out_9_Im is %h, dut output is %h", output_io_out[j+19],io_out_9_Im);
       $display("Expected io_out_10_Re is %h, dut output is %h", output_io_out[j+20],io_out_10_Re);
       $display("Expected io_out_10_Im is %h, dut output is %h", output_io_out[j+21],io_out_10_Im);
       $display("Expected io_out_11_Re is %h, dut output is %h", output_io_out[j+22],io_out_11_Re);
       $display("Expected io_out_11_Im is %h, dut output is %h", output_io_out[j+23],io_out_11_Im);
               `ifdef FFT_ST_WT16
       $display("Expected io_out_12_Re is %h, dut output is %h", output_io_out[j+24],io_out_12_Re);
       $display("Expected io_out_12_Im is %h, dut output is %h", output_io_out[j+25],io_out_12_Im);
       $display("Expected io_out_13_Re is %h, dut output is %h", output_io_out[j+26],io_out_13_Re);
       $display("Expected io_out_13_Im is %h, dut output is %h", output_io_out[j+27],io_out_13_Im);
       $display("Expected io_out_14_Re is %h, dut output is %h", output_io_out[j+28],io_out_14_Re);
       $display("Expected io_out_14_Im is %h, dut output is %h", output_io_out[j+29],io_out_14_Im);
       $display("Expected io_out_15_Re is %h, dut output is %h", output_io_out[j+30],io_out_15_Re);
       $display("Expected io_out_15_Im is %h, dut output is %h", output_io_out[j+31],io_out_15_Im);
                 `ifdef FFT_ST_WT18
       $display("Expected io_out_16_Re is %h, dut output is %h", output_io_out[j+32], io_out_16_Re);
       $display("Expected io_out_16_Im is %h, dut output is %h", output_io_out[j+33], io_out_16_Im);
       $display("Expected io_out_17_Re is %h, dut output is %h", output_io_out[j+34], io_out_17_Re);
       $display("Expected io_out_17_Im is %h, dut output is %h", output_io_out[j+35], io_out_17_Im);
                   `ifdef FFT_ST_WT27
       $display("Expected io_out_18_Re is %h, dut output is %h", output_io_out[j+36], io_out_18_Re);
       $display("Expected io_out_18_Im is %h, dut output is %h", output_io_out[j+37], io_out_18_Im);
       $display("Expected io_out_19_Re is %h, dut output is %h", output_io_out[j+38], io_out_19_Re);
       $display("Expected io_out_19_Im is %h, dut output is %h", output_io_out[j+39], io_out_19_Im);
       $display("Expected io_out_20_Re is %h, dut output is %h", output_io_out[j+40], io_out_20_Re);
       $display("Expected io_out_20_Im is %h, dut output is %h", output_io_out[j+41], io_out_20_Im);
       $display("Expected io_out_21_Re is %h, dut output is %h", output_io_out[j+42], io_out_21_Re);
       $display("Expected io_out_21_Im is %h, dut output is %h", output_io_out[j+43], io_out_21_Im);
       $display("Expected io_out_22_Re is %h, dut output is %h", output_io_out[j+44], io_out_22_Re);
       $display("Expected io_out_22_Im is %h, dut output is %h", output_io_out[j+45], io_out_22_Im);
       $display("Expected io_out_23_Re is %h, dut output is %h", output_io_out[j+46], io_out_23_Re);
       $display("Expected io_out_23_Im is %h, dut output is %h", output_io_out[j+47], io_out_23_Im);
       $display("Expected io_out_24_Re is %h, dut output is %h", output_io_out[j+48], io_out_24_Re);
       $display("Expected io_out_24_Im is %h, dut output is %h", output_io_out[j+49], io_out_24_Im);
       $display("Expected io_out_25_Re is %h, dut output is %h", output_io_out[j+50], io_out_25_Re);
       $display("Expected io_out_25_Im is %h, dut output is %h", output_io_out[j+51], io_out_25_Im);
       $display("Expected io_out_26_Re is %h, dut output is %h", output_io_out[j+52], io_out_26_Re);
       $display("Expected io_out_26_Im is %h, dut output is %h", output_io_out[j+53], io_out_26_Im);
                     `ifdef FFT_ST_WT36
       $display("Expected io_out_27_Re is %h, dut output is %h", output_io_out[j+54], io_out_27_Re);
       $display("Expected io_out_27_Im is %h, dut output is %h", output_io_out[j+55], io_out_27_Im);
       $display("Expected io_out_28_Re is %h, dut output is %h", output_io_out[j+56], io_out_28_Re);
       $display("Expected io_out_28_Im is %h, dut output is %h", output_io_out[j+57], io_out_28_Im);
       $display("Expected io_out_29_Re is %h, dut output is %h", output_io_out[j+58], io_out_29_Re);
       $display("Expected io_out_29_Im is %h, dut output is %h", output_io_out[j+59], io_out_29_Im);
       $display("Expected io_out_30_Re is %h, dut output is %h", output_io_out[j+60], io_out_30_Re);
       $display("Expected io_out_30_Im is %h, dut output is %h", output_io_out[j+61], io_out_30_Im);
       $display("Expected io_out_31_Re is %h, dut output is %h", output_io_out[j+62], io_out_31_Re);
       $display("Expected io_out_31_Im is %h, dut output is %h", output_io_out[j+63], io_out_31_Im);
       $display("Expected io_out_32_Re is %h, dut output is %h", output_io_out[j+64], io_out_32_Re);
       $display("Expected io_out_32_Im is %h, dut output is %h", output_io_out[j+65], io_out_32_Im);
       $display("Expected io_out_33_Re is %h, dut output is %h", output_io_out[j+66], io_out_33_Re);
       $display("Expected io_out_33_Im is %h, dut output is %h", output_io_out[j+67], io_out_33_Im);
       $display("Expected io_out_34_Re is %h, dut output is %h", output_io_out[j+68], io_out_34_Re);
       $display("Expected io_out_34_Im is %h, dut output is %h", output_io_out[j+69], io_out_34_Im);
       $display("Expected io_out_35_Re is %h, dut output is %h", output_io_out[j+70], io_out_35_Re);
       $display("Expected io_out_35_Im is %h, dut output is %h", output_io_out[j+71], io_out_35_Im);
                     `ifdef FFT_ST_WT96
       $display("Expected io_out_36_Re is %h, dut output is %h", output_io_out[j+72], io_out_36_Re);
       $display("Expected io_out_36_Re is %h, dut output is %h", output_io_out[j+73], io_out_36_Re);
       $display("Expected io_out_37_Re is %h, dut output is %h", output_io_out[j+74], io_out_37_Re);
       $display("Expected io_out_37_Re is %h, dut output is %h", output_io_out[j+75], io_out_37_Re);
       $display("Expected io_out_38_Re is %h, dut output is %h", output_io_out[j+76], io_out_38_Re);
       $display("Expected io_out_38_Re is %h, dut output is %h", output_io_out[j+77], io_out_38_Re);
       $display("Expected io_out_39_Re is %h, dut output is %h", output_io_out[j+78], io_out_39_Re);
       $display("Expected io_out_39_Re is %h, dut output is %h", output_io_out[j+79], io_out_39_Re);
       $display("Expected io_out_40_Re is %h, dut output is %h", output_io_out[j+80], io_out_40_Re);
       $display("Expected io_out_40_Re is %h, dut output is %h", output_io_out[j+81], io_out_40_Re);
       $display("Expected io_out_41_Re is %h, dut output is %h", output_io_out[j+82], io_out_41_Re);
       $display("Expected io_out_41_Re is %h, dut output is %h", output_io_out[j+83], io_out_41_Re);
       $display("Expected io_out_42_Re is %h, dut output is %h", output_io_out[j+84], io_out_42_Re);
       $display("Expected io_out_42_Re is %h, dut output is %h", output_io_out[j+85], io_out_42_Re);
       $display("Expected io_out_43_Im is %h, dut output is %h", output_io_out[j+86], io_out_43_Im);
       $display("Expected io_out_43_Re is %h, dut output is %h", output_io_out[j+87], io_out_43_Re);
       $display("Expected io_out_44_Im is %h, dut output is %h", output_io_out[j+88], io_out_44_Im);
       $display("Expected io_out_44_Re is %h, dut output is %h", output_io_out[j+89], io_out_44_Re);
       $display("Expected io_out_45_Im is %h, dut output is %h", output_io_out[j+90], io_out_45_Im);
       $display("Expected io_out_45_Re is %h, dut output is %h", output_io_out[j+91], io_out_45_Re);
       $display("Expected io_out_46_Im is %h, dut output is %h", output_io_out[j+92], io_out_46_Im);
       $display("Expected io_out_46_Re is %h, dut output is %h", output_io_out[j+93], io_out_46_Re);
       $display("Expected io_out_47_Im is %h, dut output is %h", output_io_out[j+94], io_out_47_Im);
       $display("Expected io_out_47_Re is %h, dut output is %h", output_io_out[j+95], io_out_47_Re);
       $display("Expected io_out_48_Im is %h, dut output is %h", output_io_out[j+96], io_out_48_Im);
       $display("Expected io_out_48_Re is %h, dut output is %h", output_io_out[j+97], io_out_48_Re);
       $display("Expected io_out_49_Im is %h, dut output is %h", output_io_out[j+98], io_out_49_Im);
       $display("Expected io_out_49_Re is %h, dut output is %h", output_io_out[j+99], io_out_49_Re);
       $display("Expected io_out_50_Im is %h, dut output is %h", output_io_out[j+100], io_out_50_Im);
       $display("Expected io_out_50_Re is %h, dut output is %h", output_io_out[j+101], io_out_50_Re);
       $display("Expected io_out_51_Im is %h, dut output is %h", output_io_out[j+102], io_out_51_Im);
       $display("Expected io_out_51_Im is %h, dut output is %h", output_io_out[j+103], io_out_51_Im);
       $display("Expected io_out_52_Re is %h, dut output is %h", output_io_out[j+104], io_out_52_Re);
       $display("Expected io_out_52_Im is %h, dut output is %h", output_io_out[j+105], io_out_52_Im);
       $display("Expected io_out_53_Re is %h, dut output is %h", output_io_out[j+106], io_out_53_Re);
       $display("Expected io_out_53_Im is %h, dut output is %h", output_io_out[j+107], io_out_53_Im);
       $display("Expected io_out_54_Re is %h, dut output is %h", output_io_out[j+108], io_out_54_Re);
       $display("Expected io_out_54_Im is %h, dut output is %h", output_io_out[j+109], io_out_54_Im);
       $display("Expected io_out_55_Re is %h, dut output is %h", output_io_out[j+110], io_out_55_Re);
       $display("Expected io_out_55_Im is %h, dut output is %h", output_io_out[j+111], io_out_55_Im);
       $display("Expected io_out_56_Re is %h, dut output is %h", output_io_out[j+112], io_out_56_Re);
       $display("Expected io_out_56_Im is %h, dut output is %h", output_io_out[j+113], io_out_56_Im);
       $display("Expected io_out_57_Re is %h, dut output is %h", output_io_out[j+114], io_out_57_Re);
       $display("Expected io_out_57_Im is %h, dut output is %h", output_io_out[j+115], io_out_57_Im);
       $display("Expected io_out_58_Re is %h, dut output is %h", output_io_out[j+116], io_out_58_Re);
       $display("Expected io_out_58_Im is %h, dut output is %h", output_io_out[j+117], io_out_58_Im);
       $display("Expected io_out_59_Re is %h, dut output is %h", output_io_out[j+118], io_out_59_Re);
       $display("Expected io_out_59_Im is %h, dut output is %h", output_io_out[j+119], io_out_59_Im);
       $display("Expected io_out_60_Im is %h, dut output is %h", output_io_out[j+120], io_out_60_Im);
       $display("Expected io_out_60_Re is %h, dut output is %h", output_io_out[j+121], io_out_60_Re);
       $display("Expected io_out_61_Im is %h, dut output is %h", output_io_out[j+122], io_out_61_Im);
       $display("Expected io_out_61_Re is %h, dut output is %h", output_io_out[j+123], io_out_61_Re);
       $display("Expected io_out_62_Im is %h, dut output is %h", output_io_out[j+124], io_out_62_Im);
       $display("Expected io_out_62_Re is %h, dut output is %h", output_io_out[j+125], io_out_62_Re);
       $display("Expected io_out_63_Im is %h, dut output is %h", output_io_out[j+126], io_out_63_Im);
       $display("Expected io_out_63_Re is %h, dut output is %h", output_io_out[j+127], io_out_63_Re);
       $display("Expected io_out_64_Im is %h, dut output is %h", output_io_out[j+128], io_out_64_Im);
       $display("Expected io_out_64_Re is %h, dut output is %h", output_io_out[j+129], io_out_64_Re);
       $display("Expected io_out_65_Im is %h, dut output is %h", output_io_out[j+130], io_out_65_Im);
       $display("Expected io_out_65_Re is %h, dut output is %h", output_io_out[j+131], io_out_65_Re);
       $display("Expected io_out_66_Im is %h, dut output is %h", output_io_out[j+132], io_out_66_Im);
       $display("Expected io_out_66_Re is %h, dut output is %h", output_io_out[j+133], io_out_66_Re);
       $display("Expected io_out_67_Im is %h, dut output is %h", output_io_out[j+134], io_out_67_Im);
       $display("Expected io_out_67_Re is %h, dut output is %h", output_io_out[j+135], io_out_67_Re);
       $display("Expected io_out_68_Im is %h, dut output is %h", output_io_out[j+136], io_out_68_Im);
       $display("Expected io_out_68_Im is %h, dut output is %h", output_io_out[j+137], io_out_68_Im);
       $display("Expected io_out_69_Re is %h, dut output is %h", output_io_out[j+138], io_out_69_Re);
       $display("Expected io_out_69_Im is %h, dut output is %h", output_io_out[j+139], io_out_69_Im);
       $display("Expected io_out_70_Re is %h, dut output is %h", output_io_out[j+140], io_out_70_Re);
       $display("Expected io_out_70_Im is %h, dut output is %h", output_io_out[j+141], io_out_70_Im);
       $display("Expected io_out_71_Re is %h, dut output is %h", output_io_out[j+142], io_out_71_Re);
       $display("Expected io_out_71_Im is %h, dut output is %h", output_io_out[j+143], io_out_71_Im);
       $display("Expected io_out_72_Re is %h, dut output is %h", output_io_out[j+144], io_out_72_Re);
       $display("Expected io_out_72_Im is %h, dut output is %h", output_io_out[j+145], io_out_72_Im);
       $display("Expected io_out_73_Re is %h, dut output is %h", output_io_out[j+146], io_out_73_Re);
       $display("Expected io_out_73_Im is %h, dut output is %h", output_io_out[j+147], io_out_73_Im);
       $display("Expected io_out_74_Re is %h, dut output is %h", output_io_out[j+148], io_out_74_Re);
       $display("Expected io_out_74_Im is %h, dut output is %h", output_io_out[j+149], io_out_74_Im);
       $display("Expected io_out_75_Re is %h, dut output is %h", output_io_out[j+150], io_out_75_Re);
       $display("Expected io_out_75_Im is %h, dut output is %h", output_io_out[j+151], io_out_75_Im);
       $display("Expected io_out_76_Re is %h, dut output is %h", output_io_out[j+152], io_out_76_Re);
       $display("Expected io_out_76_Im is %h, dut output is %h", output_io_out[j+153], io_out_76_Im);
       $display("Expected io_out_77_Im is %h, dut output is %h", output_io_out[j+154], io_out_77_Im);
       $display("Expected io_out_77_Re is %h, dut output is %h", output_io_out[j+155], io_out_77_Re);
       $display("Expected io_out_78_Im is %h, dut output is %h", output_io_out[j+156], io_out_78_Im);
       $display("Expected io_out_78_Re is %h, dut output is %h", output_io_out[j+157], io_out_78_Re);
       $display("Expected io_out_79_Im is %h, dut output is %h", output_io_out[j+158], io_out_79_Im);
       $display("Expected io_out_79_Re is %h, dut output is %h", output_io_out[j+159], io_out_79_Re);
       $display("Expected io_out_80_Im is %h, dut output is %h", output_io_out[j+160], io_out_80_Im);
       $display("Expected io_out_80_Re is %h, dut output is %h", output_io_out[j+161], io_out_80_Re);
       $display("Expected io_out_81_Im is %h, dut output is %h", output_io_out[j+162], io_out_81_Im);
       $display("Expected io_out_81_Re is %h, dut output is %h", output_io_out[j+163], io_out_81_Re);
       $display("Expected io_out_82_Im is %h, dut output is %h", output_io_out[j+164], io_out_82_Im);
       $display("Expected io_out_82_Re is %h, dut output is %h", output_io_out[j+165], io_out_82_Re);
       $display("Expected io_out_83_Im is %h, dut output is %h", output_io_out[j+166], io_out_83_Im);
       $display("Expected io_out_83_Re is %h, dut output is %h", output_io_out[j+167], io_out_83_Re);
       $display("Expected io_out_84_Im is %h, dut output is %h", output_io_out[j+168], io_out_84_Im);
       $display("Expected io_out_84_Re is %h, dut output is %h", output_io_out[j+169], io_out_84_Re);
       $display("Expected io_out_85_Im is %h, dut output is %h", output_io_out[j+170], io_out_85_Im);
       $display("Expected io_out_85_Im is %h, dut output is %h", output_io_out[j+171], io_out_85_Im);
       $display("Expected io_out_86_Re is %h, dut output is %h", output_io_out[j+172], io_out_86_Re);
       $display("Expected io_out_86_Im is %h, dut output is %h", output_io_out[j+173], io_out_86_Im);
       $display("Expected io_out_87_Re is %h, dut output is %h", output_io_out[j+174], io_out_87_Re);
       $display("Expected io_out_87_Im is %h, dut output is %h", output_io_out[j+175], io_out_87_Im);
       $display("Expected io_out_88_Re is %h, dut output is %h", output_io_out[j+176], io_out_88_Re);
       $display("Expected io_out_88_Im is %h, dut output is %h", output_io_out[j+177], io_out_88_Im);
       $display("Expected io_out_89_Re is %h, dut output is %h", output_io_out[j+178], io_out_89_Re);
       $display("Expected io_out_89_Im is %h, dut output is %h", output_io_out[j+179], io_out_89_Im);
       $display("Expected io_out_90_Re is %h, dut output is %h", output_io_out[j+180], io_out_90_Re);
       $display("Expected io_out_90_Im is %h, dut output is %h", output_io_out[j+181], io_out_90_Im);
       $display("Expected io_out_91_Re is %h, dut output is %h", output_io_out[j+182], io_out_91_Re);
       $display("Expected io_out_91_Im is %h, dut output is %h", output_io_out[j+183], io_out_91_Im);
       $display("Expected io_out_92_Re is %h, dut output is %h", output_io_out[j+184], io_out_92_Re);
       $display("Expected io_out_92_Im is %h, dut output is %h", output_io_out[j+185], io_out_92_Im);
       $display("Expected io_out_93_Re is %h, dut output is %h", output_io_out[j+186], io_out_93_Re);
       $display("Expected io_out_93_Im is %h, dut output is %h", output_io_out[j+187], io_out_93_Im);
       $display("Expected io_out_94_Im is %h, dut output is %h", output_io_out[j+188], io_out_94_Im);
       $display("Expected io_out_94_Re is %h, dut output is %h", output_io_out[j+189], io_out_94_Re);
       $display("Expected io_out_95_Im is %h, dut output is %h", output_io_out[j+190], io_out_95_Im);
       $display("Expected io_out_95_Re is %h, dut output is %h", output_io_out[j+191], io_out_95_Re);
                      `endif
                    `endif
                  `endif
	        `endif
              `endif
	    `endif
	  `endif
        `endif
      `endif
    `endif
  `endif
`endif
       $display("-------------------------------------------------------");
     end else begin
       $display("-------------------------------------------------------");
       $display("At %d ns, the %d check FAIL!!! debug=%p, no. is %d", $time, j/2/`FFT_WT, debug, j);

`ifdef FFT_ST_WT2
       $display("Expected io_out_0_Re is %h, dut output is %h", output_io_out[j],io_out_0_Re);
       $display("Expected io_out_0_Im is %h, dut output is %h", output_io_out[j+1],io_out_0_Im);
       $display("Expected io_out_1_Re is %h, dut output is %h", output_io_out[j+2],io_out_1_Re);
       $display("Expected io_out_1_Im is %h, dut output is %h", output_io_out[j+3],io_out_1_Im);
  `ifdef FFT_ST_WT3
       $display("Expected io_out_2_Re is %h, dut output is %h", output_io_out[j+4],io_out_2_Re);
       $display("Expected io_out_2_Im is %h, dut output is %h", output_io_out[j+5],io_out_2_Im);
    `ifdef FFT_ST_WT4
       $display("Expected io_out_3_Re is %h, dut output is %h", output_io_out[j+6],io_out_3_Re);
       $display("Expected io_out_3_Im is %h, dut output is %h", output_io_out[j+7],io_out_3_Im);
      `ifdef FFT_ST_WT6
       $display("Expected io_out_4_Re is %h, dut output is %h", output_io_out[j+8], io_out_4_Re);
       $display("Expected io_out_4_Im is %h, dut output is %h", output_io_out[j+9], io_out_4_Im);
       $display("Expected io_out_5_Re is %h, dut output is %h", output_io_out[j+10],io_out_5_Re);
       $display("Expected io_out_5_Im is %h, dut output is %h", output_io_out[j+11],io_out_5_Im);
         `ifdef FFT_ST_WT8
       $display("Expected io_out_6_Re is %h, dut output is %h", output_io_out[j+12],io_out_6_Re);
       $display("Expected io_out_6_Im is %h, dut output is %h", output_io_out[j+13],io_out_6_Im);
       $display("Expected io_out_7_Re is %h, dut output is %h", output_io_out[j+14],io_out_7_Re);
       $display("Expected io_out_7_Im is %h, dut output is %h", output_io_out[j+15],io_out_7_Im);
           `ifdef FFT_ST_WT9
       $display("Expected io_out_8_Re is %h, dut output is %h", output_io_out[j+16],io_out_8_Re);
       $display("Expected io_out_8_Im is %h, dut output is %h", output_io_out[j+17],io_out_8_Im);
             `ifdef FFT_ST_WT12
       $display("Expected io_out_9_Re is %h, dut output is %h", output_io_out[j+18],io_out_9_Re);
       $display("Expected io_out_9_Im is %h, dut output is %h", output_io_out[j+19],io_out_9_Im);
       $display("Expected io_out_10_Re is %h, dut output is %h", output_io_out[j+20],io_out_10_Re);
       $display("Expected io_out_10_Im is %h, dut output is %h", output_io_out[j+21],io_out_10_Im);
       $display("Expected io_out_11_Re is %h, dut output is %h", output_io_out[j+22],io_out_11_Re);
       $display("Expected io_out_11_Im is %h, dut output is %h", output_io_out[j+23],io_out_11_Im);
               `ifdef FFT_ST_WT16
       $display("Expected io_out_12_Re is %h, dut output is %h", output_io_out[j+24],io_out_12_Re);
       $display("Expected io_out_12_Im is %h, dut output is %h", output_io_out[j+25],io_out_12_Im);
       $display("Expected io_out_13_Re is %h, dut output is %h", output_io_out[j+26],io_out_13_Re);
       $display("Expected io_out_13_Im is %h, dut output is %h", output_io_out[j+27],io_out_13_Im);
       $display("Expected io_out_14_Re is %h, dut output is %h", output_io_out[j+28],io_out_14_Re);
       $display("Expected io_out_14_Im is %h, dut output is %h", output_io_out[j+29],io_out_14_Im);
       $display("Expected io_out_15_Re is %h, dut output is %h", output_io_out[j+30],io_out_15_Re);
       $display("Expected io_out_15_Im is %h, dut output is %h", output_io_out[j+31],io_out_15_Im);
                 `ifdef FFT_ST_WT18
       $display("Expected io_out_16_Re is %h, dut output is %h", output_io_out[j+32], io_out_16_Re);
       $display("Expected io_out_16_Im is %h, dut output is %h", output_io_out[j+33], io_out_16_Im);
       $display("Expected io_out_17_Re is %h, dut output is %h", output_io_out[j+34], io_out_17_Re);
       $display("Expected io_out_17_Im is %h, dut output is %h", output_io_out[j+35], io_out_17_Im);
                   `ifdef FFT_ST_WT27
       $display("Expected io_out_18_Re is %h, dut output is %h", output_io_out[j+36], io_out_18_Re);
       $display("Expected io_out_18_Im is %h, dut output is %h", output_io_out[j+37], io_out_18_Im);
       $display("Expected io_out_19_Re is %h, dut output is %h", output_io_out[j+38], io_out_19_Re);
       $display("Expected io_out_19_Im is %h, dut output is %h", output_io_out[j+39], io_out_19_Im);
       $display("Expected io_out_20_Re is %h, dut output is %h", output_io_out[j+40], io_out_20_Re);
       $display("Expected io_out_20_Im is %h, dut output is %h", output_io_out[j+41], io_out_20_Im);
       $display("Expected io_out_21_Re is %h, dut output is %h", output_io_out[j+42], io_out_21_Re);
       $display("Expected io_out_21_Im is %h, dut output is %h", output_io_out[j+43], io_out_21_Im);
       $display("Expected io_out_22_Re is %h, dut output is %h", output_io_out[j+44], io_out_22_Re);
       $display("Expected io_out_22_Im is %h, dut output is %h", output_io_out[j+45], io_out_22_Im);
       $display("Expected io_out_23_Re is %h, dut output is %h", output_io_out[j+46], io_out_23_Re);
       $display("Expected io_out_23_Im is %h, dut output is %h", output_io_out[j+47], io_out_23_Im);
       $display("Expected io_out_24_Re is %h, dut output is %h", output_io_out[j+48], io_out_24_Re);
       $display("Expected io_out_24_Im is %h, dut output is %h", output_io_out[j+49], io_out_24_Im);
       $display("Expected io_out_25_Re is %h, dut output is %h", output_io_out[j+50], io_out_25_Re);
       $display("Expected io_out_25_Im is %h, dut output is %h", output_io_out[j+51], io_out_25_Im);
       $display("Expected io_out_26_Re is %h, dut output is %h", output_io_out[j+52], io_out_26_Re);
       $display("Expected io_out_26_Im is %h, dut output is %h", output_io_out[j+53], io_out_26_Im);
                     `ifdef FFT_ST_WT36
       $display("Expected io_out_27_Re is %h, dut output is %h", output_io_out[j+54], io_out_27_Re);
       $display("Expected io_out_27_Im is %h, dut output is %h", output_io_out[j+55], io_out_27_Im);
       $display("Expected io_out_28_Re is %h, dut output is %h", output_io_out[j+56], io_out_28_Re);
       $display("Expected io_out_28_Im is %h, dut output is %h", output_io_out[j+57], io_out_28_Im);
       $display("Expected io_out_29_Re is %h, dut output is %h", output_io_out[j+58], io_out_29_Re);
       $display("Expected io_out_29_Im is %h, dut output is %h", output_io_out[j+59], io_out_29_Im);
       $display("Expected io_out_30_Re is %h, dut output is %h", output_io_out[j+60], io_out_30_Re);
       $display("Expected io_out_30_Im is %h, dut output is %h", output_io_out[j+61], io_out_30_Im);
       $display("Expected io_out_31_Re is %h, dut output is %h", output_io_out[j+62], io_out_31_Re);
       $display("Expected io_out_31_Im is %h, dut output is %h", output_io_out[j+63], io_out_31_Im);
       $display("Expected io_out_32_Re is %h, dut output is %h", output_io_out[j+64], io_out_32_Re);
       $display("Expected io_out_32_Im is %h, dut output is %h", output_io_out[j+65], io_out_32_Im);
       $display("Expected io_out_33_Re is %h, dut output is %h", output_io_out[j+66], io_out_33_Re);
       $display("Expected io_out_33_Im is %h, dut output is %h", output_io_out[j+67], io_out_33_Im);
       $display("Expected io_out_34_Re is %h, dut output is %h", output_io_out[j+68], io_out_34_Re);
       $display("Expected io_out_34_Im is %h, dut output is %h", output_io_out[j+69], io_out_34_Im);
       $display("Expected io_out_35_Re is %h, dut output is %h", output_io_out[j+70], io_out_35_Re);
       $display("Expected io_out_35_Im is %h, dut output is %h", output_io_out[j+71], io_out_35_Im);
                       `ifdef FFT_ST_WT96
       $display("Expected io_out_36_Re is %h, dut output is %h", output_io_out[j+72], io_out_36_Re);
       $display("Expected io_out_36_Re is %h, dut output is %h", output_io_out[j+73], io_out_36_Re);
       $display("Expected io_out_37_Re is %h, dut output is %h", output_io_out[j+74], io_out_37_Re);
       $display("Expected io_out_37_Re is %h, dut output is %h", output_io_out[j+75], io_out_37_Re);
       $display("Expected io_out_38_Re is %h, dut output is %h", output_io_out[j+76], io_out_38_Re);
       $display("Expected io_out_38_Re is %h, dut output is %h", output_io_out[j+77], io_out_38_Re);
       $display("Expected io_out_39_Re is %h, dut output is %h", output_io_out[j+78], io_out_39_Re);
       $display("Expected io_out_39_Re is %h, dut output is %h", output_io_out[j+79], io_out_39_Re);
       $display("Expected io_out_40_Re is %h, dut output is %h", output_io_out[j+80], io_out_40_Re);
       $display("Expected io_out_40_Re is %h, dut output is %h", output_io_out[j+81], io_out_40_Re);
       $display("Expected io_out_41_Re is %h, dut output is %h", output_io_out[j+82], io_out_41_Re);
       $display("Expected io_out_41_Re is %h, dut output is %h", output_io_out[j+83], io_out_41_Re);
       $display("Expected io_out_42_Re is %h, dut output is %h", output_io_out[j+84], io_out_42_Re);
       $display("Expected io_out_42_Re is %h, dut output is %h", output_io_out[j+85], io_out_42_Re);
       $display("Expected io_out_43_Im is %h, dut output is %h", output_io_out[j+86], io_out_43_Im);
       $display("Expected io_out_43_Re is %h, dut output is %h", output_io_out[j+87], io_out_43_Re);
       $display("Expected io_out_44_Im is %h, dut output is %h", output_io_out[j+88], io_out_44_Im);
       $display("Expected io_out_44_Re is %h, dut output is %h", output_io_out[j+89], io_out_44_Re);
       $display("Expected io_out_45_Im is %h, dut output is %h", output_io_out[j+90], io_out_45_Im);
       $display("Expected io_out_45_Re is %h, dut output is %h", output_io_out[j+91], io_out_45_Re);
       $display("Expected io_out_46_Im is %h, dut output is %h", output_io_out[j+92], io_out_46_Im);
       $display("Expected io_out_46_Re is %h, dut output is %h", output_io_out[j+93], io_out_46_Re);
       $display("Expected io_out_47_Im is %h, dut output is %h", output_io_out[j+94], io_out_47_Im);
       $display("Expected io_out_47_Re is %h, dut output is %h", output_io_out[j+95], io_out_47_Re);
       $display("Expected io_out_48_Im is %h, dut output is %h", output_io_out[j+96], io_out_48_Im);
       $display("Expected io_out_48_Re is %h, dut output is %h", output_io_out[j+97], io_out_48_Re);
       $display("Expected io_out_49_Im is %h, dut output is %h", output_io_out[j+98], io_out_49_Im);
       $display("Expected io_out_49_Re is %h, dut output is %h", output_io_out[j+99], io_out_49_Re);
       $display("Expected io_out_50_Im is %h, dut output is %h", output_io_out[j+100], io_out_50_Im);
       $display("Expected io_out_50_Re is %h, dut output is %h", output_io_out[j+101], io_out_50_Re);
       $display("Expected io_out_51_Im is %h, dut output is %h", output_io_out[j+102], io_out_51_Im);
       $display("Expected io_out_51_Im is %h, dut output is %h", output_io_out[j+103], io_out_51_Im);
       $display("Expected io_out_52_Re is %h, dut output is %h", output_io_out[j+104], io_out_52_Re);
       $display("Expected io_out_52_Im is %h, dut output is %h", output_io_out[j+105], io_out_52_Im);
       $display("Expected io_out_53_Re is %h, dut output is %h", output_io_out[j+106], io_out_53_Re);
       $display("Expected io_out_53_Im is %h, dut output is %h", output_io_out[j+107], io_out_53_Im);
       $display("Expected io_out_54_Re is %h, dut output is %h", output_io_out[j+108], io_out_54_Re);
       $display("Expected io_out_54_Im is %h, dut output is %h", output_io_out[j+109], io_out_54_Im);
       $display("Expected io_out_55_Re is %h, dut output is %h", output_io_out[j+110], io_out_55_Re);
       $display("Expected io_out_55_Im is %h, dut output is %h", output_io_out[j+111], io_out_55_Im);
       $display("Expected io_out_56_Re is %h, dut output is %h", output_io_out[j+112], io_out_56_Re);
       $display("Expected io_out_56_Im is %h, dut output is %h", output_io_out[j+113], io_out_56_Im);
       $display("Expected io_out_57_Re is %h, dut output is %h", output_io_out[j+114], io_out_57_Re);
       $display("Expected io_out_57_Im is %h, dut output is %h", output_io_out[j+115], io_out_57_Im);
       $display("Expected io_out_58_Re is %h, dut output is %h", output_io_out[j+116], io_out_58_Re);
       $display("Expected io_out_58_Im is %h, dut output is %h", output_io_out[j+117], io_out_58_Im);
       $display("Expected io_out_59_Re is %h, dut output is %h", output_io_out[j+118], io_out_59_Re);
       $display("Expected io_out_59_Im is %h, dut output is %h", output_io_out[j+119], io_out_59_Im);
       $display("Expected io_out_60_Im is %h, dut output is %h", output_io_out[j+120], io_out_60_Im);
       $display("Expected io_out_60_Re is %h, dut output is %h", output_io_out[j+121], io_out_60_Re);
       $display("Expected io_out_61_Im is %h, dut output is %h", output_io_out[j+122], io_out_61_Im);
       $display("Expected io_out_61_Re is %h, dut output is %h", output_io_out[j+123], io_out_61_Re);
       $display("Expected io_out_62_Im is %h, dut output is %h", output_io_out[j+124], io_out_62_Im);
       $display("Expected io_out_62_Re is %h, dut output is %h", output_io_out[j+125], io_out_62_Re);
       $display("Expected io_out_63_Im is %h, dut output is %h", output_io_out[j+126], io_out_63_Im);
       $display("Expected io_out_63_Re is %h, dut output is %h", output_io_out[j+127], io_out_63_Re);
       $display("Expected io_out_64_Im is %h, dut output is %h", output_io_out[j+128], io_out_64_Im);
       $display("Expected io_out_64_Re is %h, dut output is %h", output_io_out[j+129], io_out_64_Re);
       $display("Expected io_out_65_Im is %h, dut output is %h", output_io_out[j+130], io_out_65_Im);
       $display("Expected io_out_65_Re is %h, dut output is %h", output_io_out[j+131], io_out_65_Re);
       $display("Expected io_out_66_Im is %h, dut output is %h", output_io_out[j+132], io_out_66_Im);
       $display("Expected io_out_66_Re is %h, dut output is %h", output_io_out[j+133], io_out_66_Re);
       $display("Expected io_out_67_Im is %h, dut output is %h", output_io_out[j+134], io_out_67_Im);
       $display("Expected io_out_67_Re is %h, dut output is %h", output_io_out[j+135], io_out_67_Re);
       $display("Expected io_out_68_Im is %h, dut output is %h", output_io_out[j+136], io_out_68_Im);
       $display("Expected io_out_68_Im is %h, dut output is %h", output_io_out[j+137], io_out_68_Im);
       $display("Expected io_out_69_Re is %h, dut output is %h", output_io_out[j+138], io_out_69_Re);
       $display("Expected io_out_69_Im is %h, dut output is %h", output_io_out[j+139], io_out_69_Im);
       $display("Expected io_out_70_Re is %h, dut output is %h", output_io_out[j+140], io_out_70_Re);
       $display("Expected io_out_70_Im is %h, dut output is %h", output_io_out[j+141], io_out_70_Im);
       $display("Expected io_out_71_Re is %h, dut output is %h", output_io_out[j+142], io_out_71_Re);
       $display("Expected io_out_71_Im is %h, dut output is %h", output_io_out[j+143], io_out_71_Im);
       $display("Expected io_out_72_Re is %h, dut output is %h", output_io_out[j+144], io_out_72_Re);
       $display("Expected io_out_72_Im is %h, dut output is %h", output_io_out[j+145], io_out_72_Im);
       $display("Expected io_out_73_Re is %h, dut output is %h", output_io_out[j+146], io_out_73_Re);
       $display("Expected io_out_73_Im is %h, dut output is %h", output_io_out[j+147], io_out_73_Im);
       $display("Expected io_out_74_Re is %h, dut output is %h", output_io_out[j+148], io_out_74_Re);
       $display("Expected io_out_74_Im is %h, dut output is %h", output_io_out[j+149], io_out_74_Im);
       $display("Expected io_out_75_Re is %h, dut output is %h", output_io_out[j+150], io_out_75_Re);
       $display("Expected io_out_75_Im is %h, dut output is %h", output_io_out[j+151], io_out_75_Im);
       $display("Expected io_out_76_Re is %h, dut output is %h", output_io_out[j+152], io_out_76_Re);
       $display("Expected io_out_76_Im is %h, dut output is %h", output_io_out[j+153], io_out_76_Im);
       $display("Expected io_out_77_Im is %h, dut output is %h", output_io_out[j+154], io_out_77_Im);
       $display("Expected io_out_77_Re is %h, dut output is %h", output_io_out[j+155], io_out_77_Re);
       $display("Expected io_out_78_Im is %h, dut output is %h", output_io_out[j+156], io_out_78_Im);
       $display("Expected io_out_78_Re is %h, dut output is %h", output_io_out[j+157], io_out_78_Re);
       $display("Expected io_out_79_Im is %h, dut output is %h", output_io_out[j+158], io_out_79_Im);
       $display("Expected io_out_79_Re is %h, dut output is %h", output_io_out[j+159], io_out_79_Re);
       $display("Expected io_out_80_Im is %h, dut output is %h", output_io_out[j+160], io_out_80_Im);
       $display("Expected io_out_80_Re is %h, dut output is %h", output_io_out[j+161], io_out_80_Re);
       $display("Expected io_out_81_Im is %h, dut output is %h", output_io_out[j+162], io_out_81_Im);
       $display("Expected io_out_81_Re is %h, dut output is %h", output_io_out[j+163], io_out_81_Re);
       $display("Expected io_out_82_Im is %h, dut output is %h", output_io_out[j+164], io_out_82_Im);
       $display("Expected io_out_82_Re is %h, dut output is %h", output_io_out[j+165], io_out_82_Re);
       $display("Expected io_out_83_Im is %h, dut output is %h", output_io_out[j+166], io_out_83_Im);
       $display("Expected io_out_83_Re is %h, dut output is %h", output_io_out[j+167], io_out_83_Re);
       $display("Expected io_out_84_Im is %h, dut output is %h", output_io_out[j+168], io_out_84_Im);
       $display("Expected io_out_84_Re is %h, dut output is %h", output_io_out[j+169], io_out_84_Re);
       $display("Expected io_out_85_Im is %h, dut output is %h", output_io_out[j+170], io_out_85_Im);
       $display("Expected io_out_85_Im is %h, dut output is %h", output_io_out[j+171], io_out_85_Im);
       $display("Expected io_out_86_Re is %h, dut output is %h", output_io_out[j+172], io_out_86_Re);
       $display("Expected io_out_86_Im is %h, dut output is %h", output_io_out[j+173], io_out_86_Im);
       $display("Expected io_out_87_Re is %h, dut output is %h", output_io_out[j+174], io_out_87_Re);
       $display("Expected io_out_87_Im is %h, dut output is %h", output_io_out[j+175], io_out_87_Im);
       $display("Expected io_out_88_Re is %h, dut output is %h", output_io_out[j+176], io_out_88_Re);
       $display("Expected io_out_88_Im is %h, dut output is %h", output_io_out[j+177], io_out_88_Im);
       $display("Expected io_out_89_Re is %h, dut output is %h", output_io_out[j+178], io_out_89_Re);
       $display("Expected io_out_89_Im is %h, dut output is %h", output_io_out[j+179], io_out_89_Im);
       $display("Expected io_out_90_Re is %h, dut output is %h", output_io_out[j+180], io_out_90_Re);
       $display("Expected io_out_90_Im is %h, dut output is %h", output_io_out[j+181], io_out_90_Im);
       $display("Expected io_out_91_Re is %h, dut output is %h", output_io_out[j+182], io_out_91_Re);
       $display("Expected io_out_91_Im is %h, dut output is %h", output_io_out[j+183], io_out_91_Im);
       $display("Expected io_out_92_Re is %h, dut output is %h", output_io_out[j+184], io_out_92_Re);
       $display("Expected io_out_92_Im is %h, dut output is %h", output_io_out[j+185], io_out_92_Im);
       $display("Expected io_out_93_Re is %h, dut output is %h", output_io_out[j+186], io_out_93_Re);
       $display("Expected io_out_93_Im is %h, dut output is %h", output_io_out[j+187], io_out_93_Im);
       $display("Expected io_out_94_Im is %h, dut output is %h", output_io_out[j+188], io_out_94_Im);
       $display("Expected io_out_94_Re is %h, dut output is %h", output_io_out[j+189], io_out_94_Re);
       $display("Expected io_out_95_Im is %h, dut output is %h", output_io_out[j+190], io_out_95_Im);
       $display("Expected io_out_95_Re is %h, dut output is %h", output_io_out[j+191], io_out_95_Re);
                      `endif
                    `endif
                  `endif
	        `endif
              `endif
	    `endif
	  `endif
        `endif
      `endif
    `endif
  `endif
`endif

       $display("-------------------------------------------------------");
       repeat (5) @(posedge clock);
       $stop;
     end
     @(negedge clock);
   end
end

endmodule
