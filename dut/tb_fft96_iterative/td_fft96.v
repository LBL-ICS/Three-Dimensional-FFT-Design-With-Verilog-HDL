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
module td_fft96 (input         clock            ,
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
                 input  [31:0] io_in_32_Re      ,
                 input  [31:0] io_in_32_Im      ,
                 input  [31:0] io_in_33_Re      ,
                 input  [31:0] io_in_33_Im      ,
                 input  [31:0] io_in_34_Re      ,
                 input  [31:0] io_in_34_Im      ,
                 input  [31:0] io_in_35_Re      ,
                 input  [31:0] io_in_35_Im      ,
                 input  [31:0] io_in_36_Re      ,
                 input  [31:0] io_in_36_Im      ,
                 input  [31:0] io_in_37_Re      ,
                 input  [31:0] io_in_37_Im      ,
                 input  [31:0] io_in_38_Re      ,
                 input  [31:0] io_in_38_Im      ,
                 input  [31:0] io_in_39_Re      ,
                 input  [31:0] io_in_39_Im      ,
                 input  [31:0] io_in_40_Re      ,
                 input  [31:0] io_in_40_Im      ,
                 input  [31:0] io_in_41_Re      ,
                 input  [31:0] io_in_41_Im      ,
                 input  [31:0] io_in_42_Re      ,
                 input  [31:0] io_in_42_Im      ,
                 input  [31:0] io_in_43_Re      ,
                 input  [31:0] io_in_43_Im      ,
                 input  [31:0] io_in_44_Re      ,
                 input  [31:0] io_in_44_Im      ,
                 input  [31:0] io_in_45_Re      ,
                 input  [31:0] io_in_45_Im      ,
                 input  [31:0] io_in_46_Re      ,
                 input  [31:0] io_in_46_Im      ,
                 input  [31:0] io_in_47_Re      ,
                 input  [31:0] io_in_47_Im      ,
                 input  [31:0] io_in_48_Re      ,
                 input  [31:0] io_in_48_Im      ,
                 input  [31:0] io_in_49_Re      ,
                 input  [31:0] io_in_49_Im      ,
                 input  [31:0] io_in_50_Re      ,
                 input  [31:0] io_in_50_Im      ,
                 input  [31:0] io_in_51_Re      ,
                 input  [31:0] io_in_51_Im      ,
                 input  [31:0] io_in_52_Re      ,
                 input  [31:0] io_in_52_Im      ,
                 input  [31:0] io_in_53_Re      ,
                 input  [31:0] io_in_53_Im      ,
                 input  [31:0] io_in_54_Re      ,
                 input  [31:0] io_in_54_Im      ,
                 input  [31:0] io_in_55_Re      ,
                 input  [31:0] io_in_55_Im      ,
                 input  [31:0] io_in_56_Re      ,
                 input  [31:0] io_in_56_Im      ,
                 input  [31:0] io_in_57_Re      ,
                 input  [31:0] io_in_57_Im      ,
                 input  [31:0] io_in_58_Re      ,
                 input  [31:0] io_in_58_Im      ,
                 input  [31:0] io_in_59_Re      ,
                 input  [31:0] io_in_59_Im      ,
                 input  [31:0] io_in_60_Re      ,
                 input  [31:0] io_in_60_Im      ,
                 input  [31:0] io_in_61_Re      ,
                 input  [31:0] io_in_61_Im      ,
                 input  [31:0] io_in_62_Re      ,
                 input  [31:0] io_in_62_Im      ,
                 input  [31:0] io_in_63_Re      ,
                 input  [31:0] io_in_63_Im      ,
                 input  [31:0] io_in_64_Re      ,
                 input  [31:0] io_in_64_Im      ,
                 input  [31:0] io_in_65_Re      ,
                 input  [31:0] io_in_65_Im      ,
                 input  [31:0] io_in_66_Re      ,
                 input  [31:0] io_in_66_Im      ,
                 input  [31:0] io_in_67_Re      ,
                 input  [31:0] io_in_67_Im      ,
                 input  [31:0] io_in_68_Re      ,
                 input  [31:0] io_in_68_Im      ,
                 input  [31:0] io_in_69_Re      ,
                 input  [31:0] io_in_69_Im      ,
                 input  [31:0] io_in_70_Re      ,
                 input  [31:0] io_in_70_Im      ,
                 input  [31:0] io_in_71_Re      ,
                 input  [31:0] io_in_71_Im      ,
                 input  [31:0] io_in_72_Re      ,
                 input  [31:0] io_in_72_Im      ,
                 input  [31:0] io_in_73_Re      ,
                 input  [31:0] io_in_73_Im      ,
                 input  [31:0] io_in_74_Re      ,
                 input  [31:0] io_in_74_Im      ,
                 input  [31:0] io_in_75_Re      ,
                 input  [31:0] io_in_75_Im      ,
                 input  [31:0] io_in_76_Re      ,
                 input  [31:0] io_in_76_Im      ,
                 input  [31:0] io_in_77_Re      ,
                 input  [31:0] io_in_77_Im      ,
                 input  [31:0] io_in_78_Re      ,
                 input  [31:0] io_in_78_Im      ,
                 input  [31:0] io_in_79_Re      ,
                 input  [31:0] io_in_79_Im      ,
                 input  [31:0] io_in_80_Re      ,
                 input  [31:0] io_in_80_Im      ,
                 input  [31:0] io_in_81_Re      ,
                 input  [31:0] io_in_81_Im      ,
                 input  [31:0] io_in_82_Re      ,
                 input  [31:0] io_in_82_Im      ,
                 input  [31:0] io_in_83_Re      ,
                 input  [31:0] io_in_83_Im      ,
                 input  [31:0] io_in_84_Re      ,
                 input  [31:0] io_in_84_Im      ,
                 input  [31:0] io_in_85_Re      ,
                 input  [31:0] io_in_85_Im      ,
                 input  [31:0] io_in_86_Re      ,
                 input  [31:0] io_in_86_Im      ,
                 input  [31:0] io_in_87_Re      ,
                 input  [31:0] io_in_87_Im      ,
                 input  [31:0] io_in_88_Re      ,
                 input  [31:0] io_in_88_Im      ,
                 input  [31:0] io_in_89_Re      ,
                 input  [31:0] io_in_89_Im      ,
                 input  [31:0] io_in_90_Re      ,
                 input  [31:0] io_in_90_Im      ,
                 input  [31:0] io_in_91_Re      ,
                 input  [31:0] io_in_91_Im      ,
                 input  [31:0] io_in_92_Re      ,
                 input  [31:0] io_in_92_Im      ,
                 input  [31:0] io_in_93_Re      ,
                 input  [31:0] io_in_93_Im      ,
                 input  [31:0] io_in_94_Re      ,
                 input  [31:0] io_in_94_Im      ,
                 input  [31:0] io_in_95_Re      ,
                 input  [31:0] io_in_95_Im      ,
                 input         io_in_ready      ,
                 output        io_out_validate  ,
                 output        io_out_finish    ,
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
                 output [31:0] io_out_31_Im     ,
                 output [31:0] io_out_32_Re     ,
                 output [31:0] io_out_32_Im     ,
                 output [31:0] io_out_33_Re     ,
                 output [31:0] io_out_33_Im     ,
                 output [31:0] io_out_34_Re     ,
                 output [31:0] io_out_34_Im     ,
                 output [31:0] io_out_35_Re     ,
                 output [31:0] io_out_35_Im     ,
                 output [31:0] io_out_36_Re     ,
                 output [31:0] io_out_36_Im     ,
                 output [31:0] io_out_37_Re     ,
                 output [31:0] io_out_37_Im     ,
                 output [31:0] io_out_38_Re     ,
                 output [31:0] io_out_38_Im     ,
                 output [31:0] io_out_39_Re     ,
                 output [31:0] io_out_39_Im     ,
                 output [31:0] io_out_40_Re     ,
                 output [31:0] io_out_40_Im     ,
                 output [31:0] io_out_41_Re     ,
                 output [31:0] io_out_41_Im     ,
                 output [31:0] io_out_42_Re     ,
                 output [31:0] io_out_42_Im     ,
                 output [31:0] io_out_43_Re     ,
                 output [31:0] io_out_43_Im     ,
                 output [31:0] io_out_44_Re     ,
                 output [31:0] io_out_44_Im     ,
                 output [31:0] io_out_45_Re     ,
                 output [31:0] io_out_45_Im     ,
                 output [31:0] io_out_46_Re     ,
                 output [31:0] io_out_46_Im     ,
                 output [31:0] io_out_47_Re     ,
                 output [31:0] io_out_47_Im     ,
                 output [31:0] io_out_48_Re     ,
                 output [31:0] io_out_48_Im     ,
                 output [31:0] io_out_49_Re     ,
                 output [31:0] io_out_49_Im     ,
                 output [31:0] io_out_50_Re     ,
                 output [31:0] io_out_50_Im     ,
                 output [31:0] io_out_51_Re     ,
                 output [31:0] io_out_51_Im     ,
                 output [31:0] io_out_52_Re     ,
                 output [31:0] io_out_52_Im     ,
                 output [31:0] io_out_53_Re     ,
                 output [31:0] io_out_53_Im     ,
                 output [31:0] io_out_54_Re     ,
                 output [31:0] io_out_54_Im     ,
                 output [31:0] io_out_55_Re     ,
                 output [31:0] io_out_55_Im     ,
                 output [31:0] io_out_56_Re     ,
                 output [31:0] io_out_56_Im     ,
                 output [31:0] io_out_57_Re     ,
                 output [31:0] io_out_57_Im     ,
                 output [31:0] io_out_58_Re     ,
                 output [31:0] io_out_58_Im     ,
                 output [31:0] io_out_59_Re     ,
                 output [31:0] io_out_59_Im     ,
                 output [31:0] io_out_60_Re     ,
                 output [31:0] io_out_60_Im     ,
                 output [31:0] io_out_61_Re     ,
                 output [31:0] io_out_61_Im     ,
                 output [31:0] io_out_62_Re     ,
                 output [31:0] io_out_62_Im     ,
                 output [31:0] io_out_63_Re     ,
                 output [31:0] io_out_63_Im     ,
                 output [31:0] io_out_64_Re     ,
                 output [31:0] io_out_64_Im     ,
                 output [31:0] io_out_65_Re     ,
                 output [31:0] io_out_65_Im     ,
                 output [31:0] io_out_66_Re     ,
                 output [31:0] io_out_66_Im     ,
                 output [31:0] io_out_67_Re     ,
                 output [31:0] io_out_67_Im     ,
                 output [31:0] io_out_68_Re     ,
                 output [31:0] io_out_68_Im     ,
                 output [31:0] io_out_69_Re     ,
                 output [31:0] io_out_69_Im     ,
                 output [31:0] io_out_70_Re     ,
                 output [31:0] io_out_70_Im     ,
                 output [31:0] io_out_71_Re     ,
                 output [31:0] io_out_71_Im     ,
                 output [31:0] io_out_72_Re     ,
                 output [31:0] io_out_72_Im     ,
                 output [31:0] io_out_73_Re     ,
                 output [31:0] io_out_73_Im     ,
                 output [31:0] io_out_74_Re     ,
                 output [31:0] io_out_74_Im     ,
                 output [31:0] io_out_75_Re     ,
                 output [31:0] io_out_75_Im     ,
                 output [31:0] io_out_76_Re     ,
                 output [31:0] io_out_76_Im     ,
                 output [31:0] io_out_77_Re     ,
                 output [31:0] io_out_77_Im     ,
                 output [31:0] io_out_78_Re     ,
                 output [31:0] io_out_78_Im     ,
                 output [31:0] io_out_79_Re     ,
                 output [31:0] io_out_79_Im     ,
                 output [31:0] io_out_80_Re     ,
                 output [31:0] io_out_80_Im     ,
                 output [31:0] io_out_81_Re     ,
                 output [31:0] io_out_81_Im     ,
                 output [31:0] io_out_82_Re     ,
                 output [31:0] io_out_82_Im     ,
                 output [31:0] io_out_83_Re     ,
                 output [31:0] io_out_83_Im     ,
                 output [31:0] io_out_84_Re     ,
                 output [31:0] io_out_84_Im     ,
                 output [31:0] io_out_85_Re     ,
                 output [31:0] io_out_85_Im     ,
                 output [31:0] io_out_86_Re     ,
                 output [31:0] io_out_86_Im     ,
                 output [31:0] io_out_87_Re     ,
                 output [31:0] io_out_87_Im     ,
                 output [31:0] io_out_88_Re     ,
                 output [31:0] io_out_88_Im     ,
                 output [31:0] io_out_89_Re     ,
                 output [31:0] io_out_89_Im     ,
                 output [31:0] io_out_90_Re     ,
                 output [31:0] io_out_90_Im     ,
                 output [31:0] io_out_91_Re     ,
                 output [31:0] io_out_91_Im     ,
                 output [31:0] io_out_92_Re     ,
                 output [31:0] io_out_92_Im     ,
                 output [31:0] io_out_93_Re     ,
                 output [31:0] io_out_93_Im     ,
                 output [31:0] io_out_94_Re     ,
                 output [31:0] io_out_94_Im     ,
                 output [31:0] io_out_95_Re     ,
                 output [31:0] io_out_95_Im     );    


wire [31:0]  fft96_out_0_Re  ;
wire [31:0]  fft96_out_0_Im  ;
wire [31:0]  fft96_out_1_Re  ;
wire [31:0]  fft96_out_1_Im  ;
wire [31:0]  fft96_out_2_Re  ;
wire [31:0]  fft96_out_2_Im  ;
wire [31:0]  fft96_out_3_Re  ;
wire [31:0]  fft96_out_3_Im  ;
wire [31:0]  fft96_out_4_Re  ;
wire [31:0]  fft96_out_4_Im  ;
wire [31:0]  fft96_out_5_Re  ;
wire [31:0]  fft96_out_5_Im  ;
wire [31:0]  fft96_out_6_Re  ;
wire [31:0]  fft96_out_6_Im  ;
wire [31:0]  fft96_out_7_Re  ;
wire [31:0]  fft96_out_7_Im  ;
wire [31:0]  fft96_out_8_Re  ;
wire [31:0]  fft96_out_8_Im  ;
wire [31:0]  fft96_out_9_Re  ;
wire [31:0]  fft96_out_9_Im  ;
wire [31:0]  fft96_out_10_Re ;
wire [31:0]  fft96_out_10_Im ;
wire [31:0]  fft96_out_11_Re ;
wire [31:0]  fft96_out_11_Im ;
wire [31:0]  fft96_out_12_Re ;
wire [31:0]  fft96_out_12_Im ;
wire [31:0]  fft96_out_13_Re ;
wire [31:0]  fft96_out_13_Im ;
wire [31:0]  fft96_out_14_Re ;
wire [31:0]  fft96_out_14_Im ;
wire [31:0]  fft96_out_15_Re ;
wire [31:0]  fft96_out_15_Im ;
wire [31:0]  fft96_out_16_Re ;
wire [31:0]  fft96_out_16_Im ;
wire [31:0]  fft96_out_17_Re ;
wire [31:0]  fft96_out_17_Im ;
wire [31:0]  fft96_out_18_Re ;
wire [31:0]  fft96_out_18_Im ;
wire [31:0]  fft96_out_19_Re ;
wire [31:0]  fft96_out_19_Im ;
wire [31:0]  fft96_out_20_Re ;
wire [31:0]  fft96_out_20_Im ;
wire [31:0]  fft96_out_21_Re ;
wire [31:0]  fft96_out_21_Im ;
wire [31:0]  fft96_out_22_Re ;
wire [31:0]  fft96_out_22_Im ;
wire [31:0]  fft96_out_23_Re ;
wire [31:0]  fft96_out_23_Im ;
wire [31:0]  fft96_out_24_Re ;
wire [31:0]  fft96_out_24_Im ;
wire [31:0]  fft96_out_25_Re ;
wire [31:0]  fft96_out_25_Im ;
wire [31:0]  fft96_out_26_Re ;
wire [31:0]  fft96_out_26_Im ;
wire [31:0]  fft96_out_27_Re ;
wire [31:0]  fft96_out_27_Im ;
wire [31:0]  fft96_out_28_Re ;
wire [31:0]  fft96_out_28_Im ;
wire [31:0]  fft96_out_29_Re ;
wire [31:0]  fft96_out_29_Im ;
wire [31:0]  fft96_out_30_Re ;
wire [31:0]  fft96_out_30_Im ;
wire [31:0]  fft96_out_31_Re ;
wire [31:0]  fft96_out_31_Im ;
wire [31:0]  fft96_out_32_Re ;
wire [31:0]  fft96_out_32_Im ;
wire [31:0]  fft96_out_33_Re ;
wire [31:0]  fft96_out_33_Im ;
wire [31:0]  fft96_out_34_Re ;
wire [31:0]  fft96_out_34_Im ;
wire [31:0]  fft96_out_35_Re ;
wire [31:0]  fft96_out_35_Im ;
wire [31:0]  fft96_out_36_Re ;
wire [31:0]  fft96_out_36_Im ;
wire [31:0]  fft96_out_37_Re ;
wire [31:0]  fft96_out_37_Im ;
wire [31:0]  fft96_out_38_Re ;
wire [31:0]  fft96_out_38_Im ;
wire [31:0]  fft96_out_39_Re ;
wire [31:0]  fft96_out_39_Im ;
wire [31:0]  fft96_out_40_Re ;
wire [31:0]  fft96_out_40_Im ;
wire [31:0]  fft96_out_41_Re ;
wire [31:0]  fft96_out_41_Im ;
wire [31:0]  fft96_out_42_Re ;
wire [31:0]  fft96_out_42_Im ;
wire [31:0]  fft96_out_43_Re ;
wire [31:0]  fft96_out_43_Im ;
wire [31:0]  fft96_out_44_Re ;
wire [31:0]  fft96_out_44_Im ;
wire [31:0]  fft96_out_45_Re ;
wire [31:0]  fft96_out_45_Im ;
wire [31:0]  fft96_out_46_Re ;
wire [31:0]  fft96_out_46_Im ;
wire [31:0]  fft96_out_47_Re ;
wire [31:0]  fft96_out_47_Im ;
wire [31:0]  fft96_out_48_Re ;
wire [31:0]  fft96_out_48_Im ;
wire [31:0]  fft96_out_49_Re ;
wire [31:0]  fft96_out_49_Im ;
wire [31:0]  fft96_out_50_Re ;
wire [31:0]  fft96_out_50_Im ;
wire [31:0]  fft96_out_51_Re ;
wire [31:0]  fft96_out_51_Im ;
wire [31:0]  fft96_out_52_Re ;
wire [31:0]  fft96_out_52_Im ;
wire [31:0]  fft96_out_53_Re ;
wire [31:0]  fft96_out_53_Im ;
wire [31:0]  fft96_out_54_Re ;
wire [31:0]  fft96_out_54_Im ;
wire [31:0]  fft96_out_55_Re ;
wire [31:0]  fft96_out_55_Im ;
wire [31:0]  fft96_out_56_Re ;
wire [31:0]  fft96_out_56_Im ;
wire [31:0]  fft96_out_57_Re ;
wire [31:0]  fft96_out_57_Im ;
wire [31:0]  fft96_out_58_Re ;
wire [31:0]  fft96_out_58_Im ;
wire [31:0]  fft96_out_59_Re ;
wire [31:0]  fft96_out_59_Im ;
wire [31:0]  fft96_out_60_Re ;
wire [31:0]  fft96_out_60_Im ;
wire [31:0]  fft96_out_61_Re ;
wire [31:0]  fft96_out_61_Im ;
wire [31:0]  fft96_out_62_Re ;
wire [31:0]  fft96_out_62_Im ;
wire [31:0]  fft96_out_63_Re ;
wire [31:0]  fft96_out_63_Im ;
wire [31:0]  fft96_out_64_Re ;
wire [31:0]  fft96_out_64_Im ;
wire [31:0]  fft96_out_65_Re ;
wire [31:0]  fft96_out_65_Im ;
wire [31:0]  fft96_out_66_Re ;
wire [31:0]  fft96_out_66_Im ;
wire [31:0]  fft96_out_67_Re ;
wire [31:0]  fft96_out_67_Im ;
wire [31:0]  fft96_out_68_Re ;
wire [31:0]  fft96_out_68_Im ;
wire [31:0]  fft96_out_69_Re ;
wire [31:0]  fft96_out_69_Im ;
wire [31:0]  fft96_out_70_Re ;
wire [31:0]  fft96_out_70_Im ;
wire [31:0]  fft96_out_71_Re ;
wire [31:0]  fft96_out_71_Im ;
wire [31:0]  fft96_out_72_Re ;
wire [31:0]  fft96_out_72_Im ;
wire [31:0]  fft96_out_73_Re ;
wire [31:0]  fft96_out_73_Im ;
wire [31:0]  fft96_out_74_Re ;
wire [31:0]  fft96_out_74_Im ;
wire [31:0]  fft96_out_75_Re ;
wire [31:0]  fft96_out_75_Im ;
wire [31:0]  fft96_out_76_Re ;
wire [31:0]  fft96_out_76_Im ;
wire [31:0]  fft96_out_77_Re ;
wire [31:0]  fft96_out_77_Im ;
wire [31:0]  fft96_out_78_Re ;
wire [31:0]  fft96_out_78_Im ;
wire [31:0]  fft96_out_79_Re ;
wire [31:0]  fft96_out_79_Im ;
wire [31:0]  fft96_out_80_Re ;
wire [31:0]  fft96_out_80_Im ;
wire [31:0]  fft96_out_81_Re ;
wire [31:0]  fft96_out_81_Im ;
wire [31:0]  fft96_out_82_Re ;
wire [31:0]  fft96_out_82_Im ;
wire [31:0]  fft96_out_83_Re ;
wire [31:0]  fft96_out_83_Im ;
wire [31:0]  fft96_out_84_Re ;
wire [31:0]  fft96_out_84_Im ;
wire [31:0]  fft96_out_85_Re ;
wire [31:0]  fft96_out_85_Im ;
wire [31:0]  fft96_out_86_Re ;
wire [31:0]  fft96_out_86_Im ;
wire [31:0]  fft96_out_87_Re ;
wire [31:0]  fft96_out_87_Im ;
wire [31:0]  fft96_out_88_Re ;
wire [31:0]  fft96_out_88_Im ;
wire [31:0]  fft96_out_89_Re ;
wire [31:0]  fft96_out_89_Im ;
wire [31:0]  fft96_out_90_Re ;
wire [31:0]  fft96_out_90_Im ;
wire [31:0]  fft96_out_91_Re ;
wire [31:0]  fft96_out_91_Im ;
wire [31:0]  fft96_out_92_Re ;
wire [31:0]  fft96_out_92_Im ;
wire [31:0]  fft96_out_93_Re ;
wire [31:0]  fft96_out_93_Im ;
wire [31:0]  fft96_out_94_Re ;
wire [31:0]  fft96_out_94_Im ;
wire [31:0]  fft96_out_95_Re ;
wire [31:0]  fft96_out_95_Im ;
//**************************************************
//------------- FSM Controller ---------------------
//**************************************************
parameter INIT=2'h0;
parameter STA1=2'h1;
parameter STA2=2'h2;
parameter STA3=2'h3;
//-------counter design ---------
reg  [1:0] nxt_state;
reg  [1:0] cur_state;
reg  [6:0] cnt    ;
wire fft96_in_ready = io_in_ready | ((cur_state==STA2) & (cnt<7'd96));
wire cnt_en = io_in_ready | (cur_state==STA1) | (cur_state==STA2) | (cur_state==STA3); 
wire [6:0] nxt_cnt = ((cur_state==STA1) | (cur_state==STA2)) & (cnt==7'd113) ? 7'd0 : 
	                                           (cur_state==STA3) & (cnt==7'd95) ? 7'd0 : 
						                                    cnt_en ? (cnt+7'd1) : cnt; 
always @(posedge clock, posedge reset) begin
  if(reset) begin
    cnt=7'h0    ;
  end else if(cnt_en) begin
    cnt<=nxt_cnt;
  end
end

wire fft96_out_validate;
always @(cur_state, reset, io_in_ready, fft96_out_validate, cnt, io_out_finish) begin
  if(reset) begin
    nxt_state = INIT; 
  end else begin
    case (cur_state)
      INIT: if (io_in_ready) begin
	      nxt_state = STA1;
            end else begin
	      nxt_state = INIT;
            end
      STA1: if (fft96_out_validate & (cnt==7'd113)) begin
	      nxt_state = STA2;
            end else begin
	      nxt_state = STA1;
            end
      STA2: if (fft96_out_validate & (cnt==7'd113)) begin
	        nxt_state = STA3;
            end else begin
	        nxt_state = STA2;
            end
      STA3: if (io_out_finish) begin
	        nxt_state = INIT;
            end else begin
	        nxt_state = STA3;
            end
      default: nxt_state=INIT;
    endcase
  end
end

always @(posedge clock, posedge reset) begin
  if(reset) begin
    cur_state = INIT         ;
  end else begin
    cur_state = nxt_state    ;
  end
end

assign io_out_finish = (cur_state==STA3) & (cnt==7'd95);
//always @(posedge clock, posedge reset) begin
//  if(reset) begin
//    io_out_finish = 1'b0                 ;
//  end else begin
//    io_out_finish = nxt_io_out_finish    ;
//  end
//end
//assign io_out_validate = (cur_state==STA3) & (cnt<7'd96) ? 1'b1 : 1'b0;
assign io_out_validate = (cur_state==STA3) ;

//**************************************************
//------------- Buffer 0----------------------------
//**************************************************
reg [63:0] mem0[96*96-1:0];
reg [15:0] mem0_addr; //96*96-1

wire mem0_wr = (cur_state==STA1) & (fft96_out_validate);
wire mem0_rd = (cur_state==STA2) & (fft96_in_ready)    ;

wire [15:0] nxt_mem0_addr = (mem0_addr==16'd95) ? 16'd0 : 
	                         (mem0_wr | mem0_rd) ? mem0_addr+16'd1 : mem0_addr;
always @(posedge clock, posedge reset) begin
  if(reset) begin
    mem0_addr <= 16'd0        ;
  end else begin
    mem0_addr <= nxt_mem0_addr;
  end 
end 

wire [15:0] test_mem0_addr0   = mem0_addr+16'd96*16'd0      ;
wire [15:0] test_mem0_addr1   = mem0_addr+16'd96*16'd1      ;
wire [15:0] test_mem0_addr2   = mem0_addr+16'd96*16'd2      ;
wire [15:0] test_mem0_addr3   = mem0_addr+16'd96*16'd3      ;
wire [15:0] test_mem0_addr15  = mem0_addr+16'd96*16'd15     ;
wire [15:0] test_mem0_addr16  = mem0_addr+16'd96*16'd16     ;
wire [15:0] test_mem0_addr92  = mem0_addr+16'd96*16'd92     ;
wire [15:0] test_mem0_addr93  = mem0_addr+16'd96*16'd93     ;
wire [15:0] test_mem0_addr94  = mem0_addr+16'd96*16'd94     ;
wire [15:0] test_mem0_addr95  = mem0_addr+16'd96*16'd95     ;

wire [63:0] test_mem0_wrdata0  = mem0[mem0_addr+16'd96*16'd0]  ;
wire [63:0] test_mem0_wrdata1  = mem0[mem0_addr+16'd96*16'd1]  ;
wire [63:0] test_mem0_wrdata2  = mem0[mem0_addr+16'd96*16'd2]  ;
wire [63:0] test_mem0_wrdata3  = mem0[mem0_addr+16'd96*16'd3]  ;
wire [63:0] test_mem0_wrdata4  = mem0[mem0_addr+16'd96*16'd4]  ;
wire [63:0] test_mem0_wrdata5  = mem0[mem0_addr+16'd96*16'd5]  ;
wire [63:0] test_mem0_wrdata6  = mem0[mem0_addr+16'd96*16'd6]  ;
wire [63:0] test_mem0_wrdata7  = mem0[mem0_addr+16'd96*16'd7]  ;
wire [63:0] test_mem0_wrdata8  = mem0[mem0_addr+16'd96*16'd8]  ;
wire [63:0] test_mem0_wrdata9  = mem0[mem0_addr+16'd96*16'd9]  ;
wire [63:0] test_mem0_wrdata10 = mem0[mem0_addr+16'd96*16'd10] ;
wire [63:0] test_mem0_wrdata11 = mem0[mem0_addr+16'd96*16'd11] ;
wire [63:0] test_mem0_wrdata12 = mem0[mem0_addr+16'd96*16'd12] ;
wire [63:0] test_mem0_wrdata13 = mem0[mem0_addr+16'd96*16'd13] ;
wire [63:0] test_mem0_wrdata14 = mem0[mem0_addr+16'd96*16'd14] ;
wire [63:0] test_mem0_wrdata15 = mem0[mem0_addr+16'd96*16'd15] ;
wire [63:0] test_mem0_wrdata16 = mem0[mem0_addr+16'd96*16'd16] ;
wire [63:0] test_mem0_wrdata95 = mem0[mem0_addr+16'd96*16'd95] ;

always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd0]  = {fft96_out_0_Re,fft96_out_0_Im}   ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd1]  = {fft96_out_1_Re,fft96_out_1_Im}   ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd2]  = {fft96_out_2_Re,fft96_out_2_Im}   ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd3]  = {fft96_out_3_Re,fft96_out_3_Im}   ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd4]  = {fft96_out_4_Re,fft96_out_4_Im}   ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd5]  = {fft96_out_5_Re,fft96_out_5_Im}   ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd6]  = {fft96_out_6_Re,fft96_out_6_Im}   ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd7]  = {fft96_out_7_Re,fft96_out_7_Im}   ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd8]  = {fft96_out_8_Re,fft96_out_8_Im}   ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd9]  = {fft96_out_9_Re,fft96_out_9_Im}   ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd10] = {fft96_out_10_Re,fft96_out_10_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd11] = {fft96_out_11_Re,fft96_out_11_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd12] = {fft96_out_12_Re,fft96_out_12_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd13] = {fft96_out_13_Re,fft96_out_13_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd14] = {fft96_out_14_Re,fft96_out_14_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd15] = {fft96_out_15_Re,fft96_out_15_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd16] = {fft96_out_16_Re,fft96_out_16_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd17] = {fft96_out_17_Re,fft96_out_17_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd18] = {fft96_out_18_Re,fft96_out_18_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd19] = {fft96_out_19_Re,fft96_out_19_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd20] = {fft96_out_20_Re,fft96_out_20_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd21] = {fft96_out_21_Re,fft96_out_21_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd22] = {fft96_out_22_Re,fft96_out_22_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd23] = {fft96_out_23_Re,fft96_out_23_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd24] = {fft96_out_24_Re,fft96_out_24_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd25] = {fft96_out_25_Re,fft96_out_25_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd26] = {fft96_out_26_Re,fft96_out_26_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd27] = {fft96_out_27_Re,fft96_out_27_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd28] = {fft96_out_28_Re,fft96_out_28_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd29] = {fft96_out_29_Re,fft96_out_29_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd30] = {fft96_out_30_Re,fft96_out_30_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd31] = {fft96_out_31_Re,fft96_out_31_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd32] = {fft96_out_32_Re,fft96_out_32_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd33] = {fft96_out_33_Re,fft96_out_33_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd34] = {fft96_out_34_Re,fft96_out_34_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd35] = {fft96_out_35_Re,fft96_out_35_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd36] = {fft96_out_36_Re,fft96_out_36_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd37] = {fft96_out_37_Re,fft96_out_37_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd38] = {fft96_out_38_Re,fft96_out_38_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd39] = {fft96_out_39_Re,fft96_out_39_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd40] = {fft96_out_40_Re,fft96_out_40_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd41] = {fft96_out_41_Re,fft96_out_41_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd42] = {fft96_out_42_Re,fft96_out_42_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd43] = {fft96_out_43_Re,fft96_out_43_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd44] = {fft96_out_44_Re,fft96_out_44_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd45] = {fft96_out_45_Re,fft96_out_45_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd46] = {fft96_out_46_Re,fft96_out_46_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd47] = {fft96_out_47_Re,fft96_out_47_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd48] = {fft96_out_48_Re,fft96_out_48_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd49] = {fft96_out_49_Re,fft96_out_49_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd50] = {fft96_out_50_Re,fft96_out_50_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd51] = {fft96_out_51_Re,fft96_out_51_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd52] = {fft96_out_52_Re,fft96_out_52_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd53] = {fft96_out_53_Re,fft96_out_53_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd54] = {fft96_out_54_Re,fft96_out_54_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd55] = {fft96_out_55_Re,fft96_out_55_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd56] = {fft96_out_56_Re,fft96_out_56_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd57] = {fft96_out_57_Re,fft96_out_57_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd58] = {fft96_out_58_Re,fft96_out_58_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd59] = {fft96_out_59_Re,fft96_out_59_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd60] = {fft96_out_60_Re,fft96_out_60_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd61] = {fft96_out_61_Re,fft96_out_61_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd62] = {fft96_out_62_Re,fft96_out_62_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd63] = {fft96_out_63_Re,fft96_out_63_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd64] = {fft96_out_64_Re,fft96_out_64_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd65] = {fft96_out_65_Re,fft96_out_65_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd66] = {fft96_out_66_Re,fft96_out_66_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd67] = {fft96_out_67_Re,fft96_out_67_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd68] = {fft96_out_68_Re,fft96_out_68_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd69] = {fft96_out_79_Re,fft96_out_69_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd70] = {fft96_out_70_Re,fft96_out_70_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd71] = {fft96_out_71_Re,fft96_out_71_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd72] = {fft96_out_72_Re,fft96_out_72_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd73] = {fft96_out_73_Re,fft96_out_73_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd74] = {fft96_out_74_Re,fft96_out_74_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd75] = {fft96_out_75_Re,fft96_out_75_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd76] = {fft96_out_76_Re,fft96_out_76_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd77] = {fft96_out_77_Re,fft96_out_77_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd78] = {fft96_out_78_Re,fft96_out_78_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd79] = {fft96_out_89_Re,fft96_out_79_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd80] = {fft96_out_80_Re,fft96_out_80_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd81] = {fft96_out_81_Re,fft96_out_81_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd82] = {fft96_out_82_Re,fft96_out_82_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd83] = {fft96_out_83_Re,fft96_out_83_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd84] = {fft96_out_84_Re,fft96_out_84_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd85] = {fft96_out_85_Re,fft96_out_85_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd86] = {fft96_out_86_Re,fft96_out_86_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd87] = {fft96_out_87_Re,fft96_out_87_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd88] = {fft96_out_88_Re,fft96_out_88_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd89] = {fft96_out_89_Re,fft96_out_89_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd90] = {fft96_out_90_Re,fft96_out_90_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd91] = {fft96_out_91_Re,fft96_out_91_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd92] = {fft96_out_92_Re,fft96_out_92_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd93] = {fft96_out_93_Re,fft96_out_93_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd94] = {fft96_out_94_Re,fft96_out_94_Im} ; end
always @(posedge clock) if(mem0_wr) begin mem0[mem0_addr+16'd96*16'd95] = {fft96_out_95_Re,fft96_out_95_Im} ; end

wire [63:0] mem0_rddata0  = mem0_rd ? mem0[mem0_addr*16'd96+16'd0]  : 64'h0;
wire [63:0] mem0_rddata1  = mem0_rd ? mem0[mem0_addr*16'd96+16'd1]  : 64'h0;
wire [63:0] mem0_rddata2  = mem0_rd ? mem0[mem0_addr*16'd96+16'd2]  : 64'h0;
wire [63:0] mem0_rddata3  = mem0_rd ? mem0[mem0_addr*16'd96+16'd3]  : 64'h0;
wire [63:0] mem0_rddata4  = mem0_rd ? mem0[mem0_addr*16'd96+16'd4]  : 64'h0;
wire [63:0] mem0_rddata5  = mem0_rd ? mem0[mem0_addr*16'd96+16'd5]  : 64'h0;
wire [63:0] mem0_rddata6  = mem0_rd ? mem0[mem0_addr*16'd96+16'd6]  : 64'h0;
wire [63:0] mem0_rddata7  = mem0_rd ? mem0[mem0_addr*16'd96+16'd7]  : 64'h0;
wire [63:0] mem0_rddata8  = mem0_rd ? mem0[mem0_addr*16'd96+16'd8]  : 64'h0;
wire [63:0] mem0_rddata9  = mem0_rd ? mem0[mem0_addr*16'd96+16'd9]  : 64'h0;
wire [63:0] mem0_rddata10 = mem0_rd ? mem0[mem0_addr*16'd96+16'd10] : 64'h0;
wire [63:0] mem0_rddata11 = mem0_rd ? mem0[mem0_addr*16'd96+16'd11] : 64'h0;
wire [63:0] mem0_rddata12 = mem0_rd ? mem0[mem0_addr*16'd96+16'd12] : 64'h0;
wire [63:0] mem0_rddata13 = mem0_rd ? mem0[mem0_addr*16'd96+16'd13] : 64'h0;
wire [63:0] mem0_rddata14 = mem0_rd ? mem0[mem0_addr*16'd96+16'd14] : 64'h0;
wire [63:0] mem0_rddata15 = mem0_rd ? mem0[mem0_addr*16'd96+16'd15] : 64'h0;
wire [63:0] mem0_rddata16 = mem0_rd ? mem0[mem0_addr*16'd96+16'd16] : 64'h0;
wire [63:0] mem0_rddata17 = mem0_rd ? mem0[mem0_addr*16'd96+16'd17] : 64'h0;
wire [63:0] mem0_rddata18 = mem0_rd ? mem0[mem0_addr*16'd96+16'd18] : 64'h0;
wire [63:0] mem0_rddata19 = mem0_rd ? mem0[mem0_addr*16'd96+16'd19] : 64'h0;
wire [63:0] mem0_rddata20 = mem0_rd ? mem0[mem0_addr*16'd96+16'd20] : 64'h0;
wire [63:0] mem0_rddata21 = mem0_rd ? mem0[mem0_addr*16'd96+16'd21] : 64'h0;
wire [63:0] mem0_rddata22 = mem0_rd ? mem0[mem0_addr*16'd96+16'd22] : 64'h0;
wire [63:0] mem0_rddata23 = mem0_rd ? mem0[mem0_addr*16'd96+16'd23] : 64'h0;
wire [63:0] mem0_rddata24 = mem0_rd ? mem0[mem0_addr*16'd96+16'd24] : 64'h0;
wire [63:0] mem0_rddata25 = mem0_rd ? mem0[mem0_addr*16'd96+16'd25] : 64'h0;
wire [63:0] mem0_rddata26 = mem0_rd ? mem0[mem0_addr*16'd96+16'd26] : 64'h0;
wire [63:0] mem0_rddata27 = mem0_rd ? mem0[mem0_addr*16'd96+16'd27] : 64'h0;
wire [63:0] mem0_rddata28 = mem0_rd ? mem0[mem0_addr*16'd96+16'd28] : 64'h0;
wire [63:0] mem0_rddata29 = mem0_rd ? mem0[mem0_addr*16'd96+16'd29] : 64'h0;
wire [63:0] mem0_rddata30 = mem0_rd ? mem0[mem0_addr*16'd96+16'd30] : 64'h0;
wire [63:0] mem0_rddata31 = mem0_rd ? mem0[mem0_addr*16'd96+16'd31] : 64'h0;
wire [63:0] mem0_rddata32 = mem0_rd ? mem0[mem0_addr*16'd96+16'd32] : 64'h0;
wire [63:0] mem0_rddata33 = mem0_rd ? mem0[mem0_addr*16'd96+16'd33] : 64'h0;
wire [63:0] mem0_rddata34 = mem0_rd ? mem0[mem0_addr*16'd96+16'd34] : 64'h0;
wire [63:0] mem0_rddata35 = mem0_rd ? mem0[mem0_addr*16'd96+16'd35] : 64'h0;
wire [63:0] mem0_rddata36 = mem0_rd ? mem0[mem0_addr*16'd96+16'd36] : 64'h0;
wire [63:0] mem0_rddata37 = mem0_rd ? mem0[mem0_addr*16'd96+16'd37] : 64'h0;
wire [63:0] mem0_rddata38 = mem0_rd ? mem0[mem0_addr*16'd96+16'd38] : 64'h0;
wire [63:0] mem0_rddata39 = mem0_rd ? mem0[mem0_addr*16'd96+16'd39] : 64'h0;
wire [63:0] mem0_rddata40 = mem0_rd ? mem0[mem0_addr*16'd96+16'd40] : 64'h0;
wire [63:0] mem0_rddata41 = mem0_rd ? mem0[mem0_addr*16'd96+16'd41] : 64'h0;
wire [63:0] mem0_rddata42 = mem0_rd ? mem0[mem0_addr*16'd96+16'd42] : 64'h0;
wire [63:0] mem0_rddata43 = mem0_rd ? mem0[mem0_addr*16'd96+16'd43] : 64'h0;
wire [63:0] mem0_rddata44 = mem0_rd ? mem0[mem0_addr*16'd96+16'd44] : 64'h0;
wire [63:0] mem0_rddata45 = mem0_rd ? mem0[mem0_addr*16'd96+16'd45] : 64'h0;
wire [63:0] mem0_rddata46 = mem0_rd ? mem0[mem0_addr*16'd96+16'd46] : 64'h0;
wire [63:0] mem0_rddata47 = mem0_rd ? mem0[mem0_addr*16'd96+16'd47] : 64'h0;
wire [63:0] mem0_rddata48 = mem0_rd ? mem0[mem0_addr*16'd96+16'd48] : 64'h0;
wire [63:0] mem0_rddata49 = mem0_rd ? mem0[mem0_addr*16'd96+16'd49] : 64'h0;
wire [63:0] mem0_rddata50 = mem0_rd ? mem0[mem0_addr*16'd96+16'd50] : 64'h0;
wire [63:0] mem0_rddata51 = mem0_rd ? mem0[mem0_addr*16'd96+16'd51] : 64'h0;
wire [63:0] mem0_rddata52 = mem0_rd ? mem0[mem0_addr*16'd96+16'd52] : 64'h0;
wire [63:0] mem0_rddata53 = mem0_rd ? mem0[mem0_addr*16'd96+16'd53] : 64'h0;
wire [63:0] mem0_rddata54 = mem0_rd ? mem0[mem0_addr*16'd96+16'd54] : 64'h0;
wire [63:0] mem0_rddata55 = mem0_rd ? mem0[mem0_addr*16'd96+16'd55] : 64'h0;
wire [63:0] mem0_rddata56 = mem0_rd ? mem0[mem0_addr*16'd96+16'd56] : 64'h0;
wire [63:0] mem0_rddata57 = mem0_rd ? mem0[mem0_addr*16'd96+16'd57] : 64'h0;
wire [63:0] mem0_rddata58 = mem0_rd ? mem0[mem0_addr*16'd96+16'd58] : 64'h0;
wire [63:0] mem0_rddata59 = mem0_rd ? mem0[mem0_addr*16'd96+16'd59] : 64'h0;
wire [63:0] mem0_rddata60 = mem0_rd ? mem0[mem0_addr*16'd96+16'd60] : 64'h0;
wire [63:0] mem0_rddata61 = mem0_rd ? mem0[mem0_addr*16'd96+16'd61] : 64'h0;
wire [63:0] mem0_rddata62 = mem0_rd ? mem0[mem0_addr*16'd96+16'd62] : 64'h0;
wire [63:0] mem0_rddata63 = mem0_rd ? mem0[mem0_addr*16'd96+16'd63] : 64'h0;
wire [63:0] mem0_rddata64 = mem0_rd ? mem0[mem0_addr*16'd96+16'd64] : 64'h0;
wire [63:0] mem0_rddata65 = mem0_rd ? mem0[mem0_addr*16'd96+16'd65] : 64'h0;
wire [63:0] mem0_rddata66 = mem0_rd ? mem0[mem0_addr*16'd96+16'd66] : 64'h0;
wire [63:0] mem0_rddata67 = mem0_rd ? mem0[mem0_addr*16'd96+16'd67] : 64'h0;
wire [63:0] mem0_rddata68 = mem0_rd ? mem0[mem0_addr*16'd96+16'd68] : 64'h0;
wire [63:0] mem0_rddata69 = mem0_rd ? mem0[mem0_addr*16'd96+16'd69] : 64'h0;
wire [63:0] mem0_rddata70 = mem0_rd ? mem0[mem0_addr*16'd96+16'd70] : 64'h0;
wire [63:0] mem0_rddata71 = mem0_rd ? mem0[mem0_addr*16'd96+16'd71] : 64'h0;
wire [63:0] mem0_rddata72 = mem0_rd ? mem0[mem0_addr*16'd96+16'd72] : 64'h0;
wire [63:0] mem0_rddata73 = mem0_rd ? mem0[mem0_addr*16'd96+16'd73] : 64'h0;
wire [63:0] mem0_rddata74 = mem0_rd ? mem0[mem0_addr*16'd96+16'd74] : 64'h0;
wire [63:0] mem0_rddata75 = mem0_rd ? mem0[mem0_addr*16'd96+16'd75] : 64'h0;
wire [63:0] mem0_rddata76 = mem0_rd ? mem0[mem0_addr*16'd96+16'd76] : 64'h0;
wire [63:0] mem0_rddata77 = mem0_rd ? mem0[mem0_addr*16'd96+16'd77] : 64'h0;
wire [63:0] mem0_rddata78 = mem0_rd ? mem0[mem0_addr*16'd96+16'd78] : 64'h0;
wire [63:0] mem0_rddata79 = mem0_rd ? mem0[mem0_addr*16'd96+16'd79] : 64'h0;
wire [63:0] mem0_rddata80 = mem0_rd ? mem0[mem0_addr*16'd96+16'd80] : 64'h0;
wire [63:0] mem0_rddata81 = mem0_rd ? mem0[mem0_addr*16'd96+16'd81] : 64'h0;
wire [63:0] mem0_rddata82 = mem0_rd ? mem0[mem0_addr*16'd96+16'd82] : 64'h0;
wire [63:0] mem0_rddata83 = mem0_rd ? mem0[mem0_addr*16'd96+16'd83] : 64'h0;
wire [63:0] mem0_rddata84 = mem0_rd ? mem0[mem0_addr*16'd96+16'd84] : 64'h0;
wire [63:0] mem0_rddata85 = mem0_rd ? mem0[mem0_addr*16'd96+16'd85] : 64'h0;
wire [63:0] mem0_rddata86 = mem0_rd ? mem0[mem0_addr*16'd96+16'd86] : 64'h0;
wire [63:0] mem0_rddata87 = mem0_rd ? mem0[mem0_addr*16'd96+16'd87] : 64'h0;
wire [63:0] mem0_rddata88 = mem0_rd ? mem0[mem0_addr*16'd96+16'd88] : 64'h0;
wire [63:0] mem0_rddata89 = mem0_rd ? mem0[mem0_addr*16'd96+16'd89] : 64'h0;
wire [63:0] mem0_rddata90 = mem0_rd ? mem0[mem0_addr*16'd96+16'd90] : 64'h0;
wire [63:0] mem0_rddata91 = mem0_rd ? mem0[mem0_addr*16'd96+16'd91] : 64'h0;
wire [63:0] mem0_rddata92 = mem0_rd ? mem0[mem0_addr*16'd96+16'd92] : 64'h0;
wire [63:0] mem0_rddata93 = mem0_rd ? mem0[mem0_addr*16'd96+16'd93] : 64'h0;
wire [63:0] mem0_rddata94 = mem0_rd ? mem0[mem0_addr*16'd96+16'd94] : 64'h0;
wire [63:0] mem0_rddata95 = mem0_rd ? mem0[mem0_addr*16'd96+16'd95] : 64'h0;

//**************************************************
//------------- Buffer 1----------------------------
//**************************************************
reg [63:0] mem1[96*96-1:0];
reg [15:0] mem1_addr; //96*96-1

wire mem1_wr = (cur_state==STA2) & (fft96_out_validate);
wire mem1_rd = io_out_validate                         ;

wire [15:0] nxt_mem1_addr = (mem1_addr==16'd95) ? 16'd0 : 
	                         (mem1_wr | mem1_rd) ? mem1_addr+16'd1 : mem1_addr;
always @(posedge clock, posedge reset) begin
  if(reset) begin
    mem1_addr <= 16'd0        ;
  end else begin
    mem1_addr <= nxt_mem1_addr;
  end 
end 

wire [15:0] test_mem1_addr0   = mem1_addr+16'd96*16'd0      ;
wire [15:0] test_mem1_addr1   = mem1_addr+16'd96*16'd1      ;
wire [15:0] test_mem1_addr2   = mem1_addr+16'd96*16'd2      ;
wire [15:0] test_mem1_addr3   = mem1_addr+16'd96*16'd3      ;
wire [15:0] test_mem1_addr15  = mem1_addr+16'd96*16'd15     ;
wire [15:0] test_mem1_addr16  = mem1_addr+16'd96*16'd16     ;
wire [15:0] test_mem1_addr92  = mem1_addr+16'd96*16'd92     ;
wire [15:0] test_mem1_addr93  = mem1_addr+16'd96*16'd93     ;
wire [15:0] test_mem1_addr94  = mem1_addr+16'd96*16'd94     ;
wire [15:0] test_mem1_addr95  = mem1_addr+16'd96*16'd95     ;

wire [63:0] test_mem1_wrdata0  = mem1[mem1_addr+16'd96*16'd0]  ;
wire [63:0] test_mem1_wrdata1  = mem1[mem1_addr+16'd96*16'd1]  ;
wire [63:0] test_mem1_wrdata2  = mem1[mem1_addr+16'd96*16'd2]  ;
wire [63:0] test_mem1_wrdata3  = mem1[mem1_addr+16'd96*16'd3]  ;
wire [63:0] test_mem1_wrdata4  = mem1[mem1_addr+16'd96*16'd4]  ;
wire [63:0] test_mem1_wrdata5  = mem1[mem1_addr+16'd96*16'd5]  ;
wire [63:0] test_mem1_wrdata6  = mem1[mem1_addr+16'd96*16'd6]  ;
wire [63:0] test_mem1_wrdata7  = mem1[mem1_addr+16'd96*16'd7]  ;
wire [63:0] test_mem1_wrdata8  = mem1[mem1_addr+16'd96*16'd8]  ;
wire [63:0] test_mem1_wrdata9  = mem1[mem1_addr+16'd96*16'd9]  ;
wire [63:0] test_mem1_wrdata10 = mem1[mem1_addr+16'd96*16'd10] ;
wire [63:0] test_mem1_wrdata11 = mem1[mem1_addr+16'd96*16'd11] ;
wire [63:0] test_mem1_wrdata12 = mem1[mem1_addr+16'd96*16'd12] ;
wire [63:0] test_mem1_wrdata13 = mem1[mem1_addr+16'd96*16'd13] ;
wire [63:0] test_mem1_wrdata14 = mem1[mem1_addr+16'd96*16'd14] ;
wire [63:0] test_mem1_wrdata15 = mem1[mem1_addr+16'd96*16'd15] ;
wire [63:0] test_mem1_wrdata16 = mem1[mem1_addr+16'd96*16'd16] ;
wire [63:0] test_mem1_wrdata95 = mem1[mem1_addr+16'd96*16'd95] ;

always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd0]  = {fft96_out_0_Re,fft96_out_0_Im}   ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd1]  = {fft96_out_1_Re,fft96_out_1_Im}   ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd2]  = {fft96_out_2_Re,fft96_out_2_Im}   ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd3]  = {fft96_out_3_Re,fft96_out_3_Im}   ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd4]  = {fft96_out_4_Re,fft96_out_4_Im}   ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd5]  = {fft96_out_5_Re,fft96_out_5_Im}   ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd6]  = {fft96_out_6_Re,fft96_out_6_Im}   ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd7]  = {fft96_out_7_Re,fft96_out_7_Im}   ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd8]  = {fft96_out_8_Re,fft96_out_8_Im}   ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd9]  = {fft96_out_9_Re,fft96_out_9_Im}   ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd10] = {fft96_out_10_Re,fft96_out_10_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd11] = {fft96_out_11_Re,fft96_out_11_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd12] = {fft96_out_12_Re,fft96_out_12_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd13] = {fft96_out_13_Re,fft96_out_13_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd14] = {fft96_out_14_Re,fft96_out_14_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd15] = {fft96_out_15_Re,fft96_out_15_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd16] = {fft96_out_16_Re,fft96_out_16_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd17] = {fft96_out_17_Re,fft96_out_17_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd18] = {fft96_out_18_Re,fft96_out_18_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd19] = {fft96_out_19_Re,fft96_out_19_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd20] = {fft96_out_20_Re,fft96_out_20_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd21] = {fft96_out_21_Re,fft96_out_21_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd22] = {fft96_out_22_Re,fft96_out_22_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd23] = {fft96_out_23_Re,fft96_out_23_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd24] = {fft96_out_24_Re,fft96_out_24_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd25] = {fft96_out_25_Re,fft96_out_25_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd26] = {fft96_out_26_Re,fft96_out_26_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd27] = {fft96_out_27_Re,fft96_out_27_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd28] = {fft96_out_28_Re,fft96_out_28_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd29] = {fft96_out_29_Re,fft96_out_29_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd30] = {fft96_out_30_Re,fft96_out_30_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd31] = {fft96_out_31_Re,fft96_out_31_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd32] = {fft96_out_32_Re,fft96_out_32_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd33] = {fft96_out_33_Re,fft96_out_33_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd34] = {fft96_out_34_Re,fft96_out_34_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd35] = {fft96_out_35_Re,fft96_out_35_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd36] = {fft96_out_36_Re,fft96_out_36_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd37] = {fft96_out_37_Re,fft96_out_37_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd38] = {fft96_out_38_Re,fft96_out_38_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd39] = {fft96_out_39_Re,fft96_out_39_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd40] = {fft96_out_40_Re,fft96_out_40_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd41] = {fft96_out_41_Re,fft96_out_41_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd42] = {fft96_out_42_Re,fft96_out_42_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd43] = {fft96_out_43_Re,fft96_out_43_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd44] = {fft96_out_44_Re,fft96_out_44_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd45] = {fft96_out_45_Re,fft96_out_45_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd46] = {fft96_out_46_Re,fft96_out_46_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd47] = {fft96_out_47_Re,fft96_out_47_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd48] = {fft96_out_48_Re,fft96_out_48_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd49] = {fft96_out_49_Re,fft96_out_49_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd50] = {fft96_out_50_Re,fft96_out_50_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd51] = {fft96_out_51_Re,fft96_out_51_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd52] = {fft96_out_52_Re,fft96_out_52_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd53] = {fft96_out_53_Re,fft96_out_53_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd54] = {fft96_out_54_Re,fft96_out_54_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd55] = {fft96_out_55_Re,fft96_out_55_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd56] = {fft96_out_56_Re,fft96_out_56_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd57] = {fft96_out_57_Re,fft96_out_57_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd58] = {fft96_out_58_Re,fft96_out_58_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd59] = {fft96_out_59_Re,fft96_out_59_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd60] = {fft96_out_60_Re,fft96_out_60_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd61] = {fft96_out_61_Re,fft96_out_61_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd62] = {fft96_out_62_Re,fft96_out_62_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd63] = {fft96_out_63_Re,fft96_out_63_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd64] = {fft96_out_64_Re,fft96_out_64_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd65] = {fft96_out_65_Re,fft96_out_65_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd66] = {fft96_out_66_Re,fft96_out_66_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd67] = {fft96_out_67_Re,fft96_out_67_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd68] = {fft96_out_68_Re,fft96_out_68_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd69] = {fft96_out_79_Re,fft96_out_69_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd70] = {fft96_out_70_Re,fft96_out_70_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd71] = {fft96_out_71_Re,fft96_out_71_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd72] = {fft96_out_72_Re,fft96_out_72_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd73] = {fft96_out_73_Re,fft96_out_73_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd74] = {fft96_out_74_Re,fft96_out_74_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd75] = {fft96_out_75_Re,fft96_out_75_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd76] = {fft96_out_76_Re,fft96_out_76_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd77] = {fft96_out_77_Re,fft96_out_77_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd78] = {fft96_out_78_Re,fft96_out_78_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd79] = {fft96_out_89_Re,fft96_out_79_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd80] = {fft96_out_80_Re,fft96_out_80_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd81] = {fft96_out_81_Re,fft96_out_81_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd82] = {fft96_out_82_Re,fft96_out_82_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd83] = {fft96_out_83_Re,fft96_out_83_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd84] = {fft96_out_84_Re,fft96_out_84_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd85] = {fft96_out_85_Re,fft96_out_85_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd86] = {fft96_out_86_Re,fft96_out_86_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd87] = {fft96_out_87_Re,fft96_out_87_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd88] = {fft96_out_88_Re,fft96_out_88_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd89] = {fft96_out_89_Re,fft96_out_89_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd90] = {fft96_out_90_Re,fft96_out_90_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd91] = {fft96_out_91_Re,fft96_out_91_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd92] = {fft96_out_92_Re,fft96_out_92_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd93] = {fft96_out_93_Re,fft96_out_93_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd94] = {fft96_out_94_Re,fft96_out_94_Im} ; end
always @(posedge clock) if(mem1_wr) begin mem1[mem1_addr+16'd96*16'd95] = {fft96_out_95_Re,fft96_out_95_Im} ; end

wire [63:0] mem1_rddata0  = mem1_rd ? mem1[mem1_addr*16'd96+16'd0]  : 64'h0;
wire [63:0] mem1_rddata1  = mem1_rd ? mem1[mem1_addr*16'd96+16'd1]  : 64'h0;
wire [63:0] mem1_rddata2  = mem1_rd ? mem1[mem1_addr*16'd96+16'd2]  : 64'h0;
wire [63:0] mem1_rddata3  = mem1_rd ? mem1[mem1_addr*16'd96+16'd3]  : 64'h0;
wire [63:0] mem1_rddata4  = mem1_rd ? mem1[mem1_addr*16'd96+16'd4]  : 64'h0;
wire [63:0] mem1_rddata5  = mem1_rd ? mem1[mem1_addr*16'd96+16'd5]  : 64'h0;
wire [63:0] mem1_rddata6  = mem1_rd ? mem1[mem1_addr*16'd96+16'd6]  : 64'h0;
wire [63:0] mem1_rddata7  = mem1_rd ? mem1[mem1_addr*16'd96+16'd7]  : 64'h0;
wire [63:0] mem1_rddata8  = mem1_rd ? mem1[mem1_addr*16'd96+16'd8]  : 64'h0;
wire [63:0] mem1_rddata9  = mem1_rd ? mem1[mem1_addr*16'd96+16'd9]  : 64'h0;
wire [63:0] mem1_rddata10 = mem1_rd ? mem1[mem1_addr*16'd96+16'd10] : 64'h0;
wire [63:0] mem1_rddata11 = mem1_rd ? mem1[mem1_addr*16'd96+16'd11] : 64'h0;
wire [63:0] mem1_rddata12 = mem1_rd ? mem1[mem1_addr*16'd96+16'd12] : 64'h0;
wire [63:0] mem1_rddata13 = mem1_rd ? mem1[mem1_addr*16'd96+16'd13] : 64'h0;
wire [63:0] mem1_rddata14 = mem1_rd ? mem1[mem1_addr*16'd96+16'd14] : 64'h0;
wire [63:0] mem1_rddata15 = mem1_rd ? mem1[mem1_addr*16'd96+16'd15] : 64'h0;
wire [63:0] mem1_rddata16 = mem1_rd ? mem1[mem1_addr*16'd96+16'd16] : 64'h0;
wire [63:0] mem1_rddata17 = mem1_rd ? mem1[mem1_addr*16'd96+16'd17] : 64'h0;
wire [63:0] mem1_rddata18 = mem1_rd ? mem1[mem1_addr*16'd96+16'd18] : 64'h0;
wire [63:0] mem1_rddata19 = mem1_rd ? mem1[mem1_addr*16'd96+16'd19] : 64'h0;
wire [63:0] mem1_rddata20 = mem1_rd ? mem1[mem1_addr*16'd96+16'd20] : 64'h0;
wire [63:0] mem1_rddata21 = mem1_rd ? mem1[mem1_addr*16'd96+16'd21] : 64'h0;
wire [63:0] mem1_rddata22 = mem1_rd ? mem1[mem1_addr*16'd96+16'd22] : 64'h0;
wire [63:0] mem1_rddata23 = mem1_rd ? mem1[mem1_addr*16'd96+16'd23] : 64'h0;
wire [63:0] mem1_rddata24 = mem1_rd ? mem1[mem1_addr*16'd96+16'd24] : 64'h0;
wire [63:0] mem1_rddata25 = mem1_rd ? mem1[mem1_addr*16'd96+16'd25] : 64'h0;
wire [63:0] mem1_rddata26 = mem1_rd ? mem1[mem1_addr*16'd96+16'd26] : 64'h0;
wire [63:0] mem1_rddata27 = mem1_rd ? mem1[mem1_addr*16'd96+16'd27] : 64'h0;
wire [63:0] mem1_rddata28 = mem1_rd ? mem1[mem1_addr*16'd96+16'd28] : 64'h0;
wire [63:0] mem1_rddata29 = mem1_rd ? mem1[mem1_addr*16'd96+16'd29] : 64'h0;
wire [63:0] mem1_rddata30 = mem1_rd ? mem1[mem1_addr*16'd96+16'd30] : 64'h0;
wire [63:0] mem1_rddata31 = mem1_rd ? mem1[mem1_addr*16'd96+16'd31] : 64'h0;
wire [63:0] mem1_rddata32 = mem1_rd ? mem1[mem1_addr*16'd96+16'd32] : 64'h0;
wire [63:0] mem1_rddata33 = mem1_rd ? mem1[mem1_addr*16'd96+16'd33] : 64'h0;
wire [63:0] mem1_rddata34 = mem1_rd ? mem1[mem1_addr*16'd96+16'd34] : 64'h0;
wire [63:0] mem1_rddata35 = mem1_rd ? mem1[mem1_addr*16'd96+16'd35] : 64'h0;
wire [63:0] mem1_rddata36 = mem1_rd ? mem1[mem1_addr*16'd96+16'd36] : 64'h0;
wire [63:0] mem1_rddata37 = mem1_rd ? mem1[mem1_addr*16'd96+16'd37] : 64'h0;
wire [63:0] mem1_rddata38 = mem1_rd ? mem1[mem1_addr*16'd96+16'd38] : 64'h0;
wire [63:0] mem1_rddata39 = mem1_rd ? mem1[mem1_addr*16'd96+16'd39] : 64'h0;
wire [63:0] mem1_rddata40 = mem1_rd ? mem1[mem1_addr*16'd96+16'd40] : 64'h0;
wire [63:0] mem1_rddata41 = mem1_rd ? mem1[mem1_addr*16'd96+16'd41] : 64'h0;
wire [63:0] mem1_rddata42 = mem1_rd ? mem1[mem1_addr*16'd96+16'd42] : 64'h0;
wire [63:0] mem1_rddata43 = mem1_rd ? mem1[mem1_addr*16'd96+16'd43] : 64'h0;
wire [63:0] mem1_rddata44 = mem1_rd ? mem1[mem1_addr*16'd96+16'd44] : 64'h0;
wire [63:0] mem1_rddata45 = mem1_rd ? mem1[mem1_addr*16'd96+16'd45] : 64'h0;
wire [63:0] mem1_rddata46 = mem1_rd ? mem1[mem1_addr*16'd96+16'd46] : 64'h0;
wire [63:0] mem1_rddata47 = mem1_rd ? mem1[mem1_addr*16'd96+16'd47] : 64'h0;
wire [63:0] mem1_rddata48 = mem1_rd ? mem1[mem1_addr*16'd96+16'd48] : 64'h0;
wire [63:0] mem1_rddata49 = mem1_rd ? mem1[mem1_addr*16'd96+16'd49] : 64'h0;
wire [63:0] mem1_rddata50 = mem1_rd ? mem1[mem1_addr*16'd96+16'd50] : 64'h0;
wire [63:0] mem1_rddata51 = mem1_rd ? mem1[mem1_addr*16'd96+16'd51] : 64'h0;
wire [63:0] mem1_rddata52 = mem1_rd ? mem1[mem1_addr*16'd96+16'd52] : 64'h0;
wire [63:0] mem1_rddata53 = mem1_rd ? mem1[mem1_addr*16'd96+16'd53] : 64'h0;
wire [63:0] mem1_rddata54 = mem1_rd ? mem1[mem1_addr*16'd96+16'd54] : 64'h0;
wire [63:0] mem1_rddata55 = mem1_rd ? mem1[mem1_addr*16'd96+16'd55] : 64'h0;
wire [63:0] mem1_rddata56 = mem1_rd ? mem1[mem1_addr*16'd96+16'd56] : 64'h0;
wire [63:0] mem1_rddata57 = mem1_rd ? mem1[mem1_addr*16'd96+16'd57] : 64'h0;
wire [63:0] mem1_rddata58 = mem1_rd ? mem1[mem1_addr*16'd96+16'd58] : 64'h0;
wire [63:0] mem1_rddata59 = mem1_rd ? mem1[mem1_addr*16'd96+16'd59] : 64'h0;
wire [63:0] mem1_rddata60 = mem1_rd ? mem1[mem1_addr*16'd96+16'd60] : 64'h0;
wire [63:0] mem1_rddata61 = mem1_rd ? mem1[mem1_addr*16'd96+16'd61] : 64'h0;
wire [63:0] mem1_rddata62 = mem1_rd ? mem1[mem1_addr*16'd96+16'd62] : 64'h0;
wire [63:0] mem1_rddata63 = mem1_rd ? mem1[mem1_addr*16'd96+16'd63] : 64'h0;
wire [63:0] mem1_rddata64 = mem1_rd ? mem1[mem1_addr*16'd96+16'd64] : 64'h0;
wire [63:0] mem1_rddata65 = mem1_rd ? mem1[mem1_addr*16'd96+16'd65] : 64'h0;
wire [63:0] mem1_rddata66 = mem1_rd ? mem1[mem1_addr*16'd96+16'd66] : 64'h0;
wire [63:0] mem1_rddata67 = mem1_rd ? mem1[mem1_addr*16'd96+16'd67] : 64'h0;
wire [63:0] mem1_rddata68 = mem1_rd ? mem1[mem1_addr*16'd96+16'd68] : 64'h0;
wire [63:0] mem1_rddata69 = mem1_rd ? mem1[mem1_addr*16'd96+16'd69] : 64'h0;
wire [63:0] mem1_rddata70 = mem1_rd ? mem1[mem1_addr*16'd96+16'd70] : 64'h0;
wire [63:0] mem1_rddata71 = mem1_rd ? mem1[mem1_addr*16'd96+16'd71] : 64'h0;
wire [63:0] mem1_rddata72 = mem1_rd ? mem1[mem1_addr*16'd96+16'd72] : 64'h0;
wire [63:0] mem1_rddata73 = mem1_rd ? mem1[mem1_addr*16'd96+16'd73] : 64'h0;
wire [63:0] mem1_rddata74 = mem1_rd ? mem1[mem1_addr*16'd96+16'd74] : 64'h0;
wire [63:0] mem1_rddata75 = mem1_rd ? mem1[mem1_addr*16'd96+16'd75] : 64'h0;
wire [63:0] mem1_rddata76 = mem1_rd ? mem1[mem1_addr*16'd96+16'd76] : 64'h0;
wire [63:0] mem1_rddata77 = mem1_rd ? mem1[mem1_addr*16'd96+16'd77] : 64'h0;
wire [63:0] mem1_rddata78 = mem1_rd ? mem1[mem1_addr*16'd96+16'd78] : 64'h0;
wire [63:0] mem1_rddata79 = mem1_rd ? mem1[mem1_addr*16'd96+16'd79] : 64'h0;
wire [63:0] mem1_rddata80 = mem1_rd ? mem1[mem1_addr*16'd96+16'd80] : 64'h0;
wire [63:0] mem1_rddata81 = mem1_rd ? mem1[mem1_addr*16'd96+16'd81] : 64'h0;
wire [63:0] mem1_rddata82 = mem1_rd ? mem1[mem1_addr*16'd96+16'd82] : 64'h0;
wire [63:0] mem1_rddata83 = mem1_rd ? mem1[mem1_addr*16'd96+16'd83] : 64'h0;
wire [63:0] mem1_rddata84 = mem1_rd ? mem1[mem1_addr*16'd96+16'd84] : 64'h0;
wire [63:0] mem1_rddata85 = mem1_rd ? mem1[mem1_addr*16'd96+16'd85] : 64'h0;
wire [63:0] mem1_rddata86 = mem1_rd ? mem1[mem1_addr*16'd96+16'd86] : 64'h0;
wire [63:0] mem1_rddata87 = mem1_rd ? mem1[mem1_addr*16'd96+16'd87] : 64'h0;
wire [63:0] mem1_rddata88 = mem1_rd ? mem1[mem1_addr*16'd96+16'd88] : 64'h0;
wire [63:0] mem1_rddata89 = mem1_rd ? mem1[mem1_addr*16'd96+16'd89] : 64'h0;
wire [63:0] mem1_rddata90 = mem1_rd ? mem1[mem1_addr*16'd96+16'd90] : 64'h0;
wire [63:0] mem1_rddata91 = mem1_rd ? mem1[mem1_addr*16'd96+16'd91] : 64'h0;
wire [63:0] mem1_rddata92 = mem1_rd ? mem1[mem1_addr*16'd96+16'd92] : 64'h0;
wire [63:0] mem1_rddata93 = mem1_rd ? mem1[mem1_addr*16'd96+16'd93] : 64'h0;
wire [63:0] mem1_rddata94 = mem1_rd ? mem1[mem1_addr*16'd96+16'd94] : 64'h0;
wire [63:0] mem1_rddata95 = mem1_rd ? mem1[mem1_addr*16'd96+16'd95] : 64'h0;
//**************************************************
//------------- FFT 96 Instance --------------------
//**************************************************
wire [31:0] fft96_in_0_Re  = io_in_ready ? io_in_0_Re  : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata0[63:32]  : 32'h0; 
wire [31:0] fft96_in_0_Im  = io_in_ready ? io_in_0_Im  : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata0[31:0]   : 32'h0; 
wire [31:0] fft96_in_1_Re  = io_in_ready ? io_in_1_Re  : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata1[63:32]  : 32'h0; 
wire [31:0] fft96_in_1_Im  = io_in_ready ? io_in_1_Im  : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata1[31:0]   : 32'h0; 
wire [31:0] fft96_in_2_Re  = io_in_ready ? io_in_2_Re  : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata2[63:32]  : 32'h0; 
wire [31:0] fft96_in_2_Im  = io_in_ready ? io_in_2_Im  : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata2[31:0]   : 32'h0; 
wire [31:0] fft96_in_3_Re  = io_in_ready ? io_in_3_Re  : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata3[63:32]  : 32'h0; 
wire [31:0] fft96_in_3_Im  = io_in_ready ? io_in_3_Im  : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata3[31:0]   : 32'h0; 
wire [31:0] fft96_in_4_Re  = io_in_ready ? io_in_4_Re  : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata4[63:32]  : 32'h0; 
wire [31:0] fft96_in_4_Im  = io_in_ready ? io_in_4_Im  : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata4[31:0]   : 32'h0; 
wire [31:0] fft96_in_5_Re  = io_in_ready ? io_in_5_Re  : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata5[63:32]  : 32'h0; 
wire [31:0] fft96_in_5_Im  = io_in_ready ? io_in_5_Im  : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata5[31:0]   : 32'h0; 
wire [31:0] fft96_in_6_Re  = io_in_ready ? io_in_6_Re  : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata6[63:32]  : 32'h0; 
wire [31:0] fft96_in_6_Im  = io_in_ready ? io_in_6_Im  : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata6[31:0]   : 32'h0; 
wire [31:0] fft96_in_7_Re  = io_in_ready ? io_in_7_Re  : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata7[63:32]  : 32'h0; 
wire [31:0] fft96_in_7_Im  = io_in_ready ? io_in_7_Im  : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata7[31:0]   : 32'h0; 
wire [31:0] fft96_in_8_Re  = io_in_ready ? io_in_8_Re  : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata8[63:32]  : 32'h0; 
wire [31:0] fft96_in_8_Im  = io_in_ready ? io_in_8_Im  : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata8[31:0]   : 32'h0; 
wire [31:0] fft96_in_9_Re  = io_in_ready ? io_in_9_Re  : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata9[63:32]  : 32'h0; 
wire [31:0] fft96_in_9_Im  = io_in_ready ? io_in_9_Im  : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata9[31:0]   : 32'h0; 
wire [31:0] fft96_in_10_Re = io_in_ready ? io_in_10_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata10[63:32] : 32'h0; 
wire [31:0] fft96_in_10_Im = io_in_ready ? io_in_10_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata10[31:0]  : 32'h0; 
wire [31:0] fft96_in_11_Re = io_in_ready ? io_in_11_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata11[63:32] : 32'h0; 
wire [31:0] fft96_in_11_Im = io_in_ready ? io_in_11_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata11[31:0]  : 32'h0; 
wire [31:0] fft96_in_12_Re = io_in_ready ? io_in_12_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata12[63:32] : 32'h0; 
wire [31:0] fft96_in_12_Im = io_in_ready ? io_in_12_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata12[31:0]  : 32'h0; 
wire [31:0] fft96_in_13_Re = io_in_ready ? io_in_13_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata13[63:32] : 32'h0; 
wire [31:0] fft96_in_13_Im = io_in_ready ? io_in_13_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata13[31:0]  : 32'h0; 
wire [31:0] fft96_in_14_Re = io_in_ready ? io_in_14_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata14[63:32] : 32'h0; 
wire [31:0] fft96_in_14_Im = io_in_ready ? io_in_14_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata14[31:0]  : 32'h0; 
wire [31:0] fft96_in_15_Re = io_in_ready ? io_in_15_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata15[63:32] : 32'h0; 
wire [31:0] fft96_in_15_Im = io_in_ready ? io_in_15_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata15[31:0]  : 32'h0; 
wire [31:0] fft96_in_16_Re = io_in_ready ? io_in_16_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata16[63:32] : 32'h0; 
wire [31:0] fft96_in_16_Im = io_in_ready ? io_in_16_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata16[31:0]  : 32'h0; 
wire [31:0] fft96_in_17_Re = io_in_ready ? io_in_17_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata17[63:32] : 32'h0; 
wire [31:0] fft96_in_17_Im = io_in_ready ? io_in_17_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata17[31:0]  : 32'h0; 
wire [31:0] fft96_in_18_Re = io_in_ready ? io_in_18_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata18[63:32] : 32'h0; 
wire [31:0] fft96_in_18_Im = io_in_ready ? io_in_18_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata18[31:0]  : 32'h0; 
wire [31:0] fft96_in_19_Re = io_in_ready ? io_in_19_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata19[63:32] : 32'h0; 
wire [31:0] fft96_in_19_Im = io_in_ready ? io_in_19_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata19[31:0]  : 32'h0; 
wire [31:0] fft96_in_20_Re = io_in_ready ? io_in_20_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata20[63:32] : 32'h0; 
wire [31:0] fft96_in_20_Im = io_in_ready ? io_in_20_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata20[31:0]  : 32'h0; 
wire [31:0] fft96_in_21_Re = io_in_ready ? io_in_21_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata21[63:32] : 32'h0; 
wire [31:0] fft96_in_21_Im = io_in_ready ? io_in_21_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata21[31:0]  : 32'h0; 
wire [31:0] fft96_in_22_Re = io_in_ready ? io_in_22_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata22[63:32] : 32'h0; 
wire [31:0] fft96_in_22_Im = io_in_ready ? io_in_22_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata22[31:0]  : 32'h0; 
wire [31:0] fft96_in_23_Re = io_in_ready ? io_in_23_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata23[63:32] : 32'h0; 
wire [31:0] fft96_in_23_Im = io_in_ready ? io_in_23_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata23[31:0]  : 32'h0; 
wire [31:0] fft96_in_24_Re = io_in_ready ? io_in_24_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata24[63:32] : 32'h0; 
wire [31:0] fft96_in_24_Im = io_in_ready ? io_in_24_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata24[31:0]  : 32'h0; 
wire [31:0] fft96_in_25_Re = io_in_ready ? io_in_25_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata25[63:32] : 32'h0; 
wire [31:0] fft96_in_25_Im = io_in_ready ? io_in_25_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata25[31:0]  : 32'h0; 
wire [31:0] fft96_in_26_Re = io_in_ready ? io_in_26_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata26[63:32] : 32'h0; 
wire [31:0] fft96_in_26_Im = io_in_ready ? io_in_26_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata26[31:0]  : 32'h0; 
wire [31:0] fft96_in_27_Re = io_in_ready ? io_in_27_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata27[63:32] : 32'h0; 
wire [31:0] fft96_in_27_Im = io_in_ready ? io_in_27_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata27[31:0]  : 32'h0; 
wire [31:0] fft96_in_28_Re = io_in_ready ? io_in_28_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata28[63:32] : 32'h0; 
wire [31:0] fft96_in_28_Im = io_in_ready ? io_in_28_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata28[31:0]  : 32'h0; 
wire [31:0] fft96_in_29_Re = io_in_ready ? io_in_29_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata29[63:32] : 32'h0; 
wire [31:0] fft96_in_29_Im = io_in_ready ? io_in_29_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata29[31:0]  : 32'h0; 
wire [31:0] fft96_in_30_Re = io_in_ready ? io_in_30_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata30[63:32] : 32'h0; 
wire [31:0] fft96_in_30_Im = io_in_ready ? io_in_30_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata30[31:0]  : 32'h0; 
wire [31:0] fft96_in_31_Re = io_in_ready ? io_in_31_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata31[63:32] : 32'h0; 
wire [31:0] fft96_in_31_Im = io_in_ready ? io_in_31_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata31[31:0]  : 32'h0; 
wire [31:0] fft96_in_32_Re = io_in_ready ? io_in_32_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata32[63:32] : 32'h0; 
wire [31:0] fft96_in_32_Im = io_in_ready ? io_in_32_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata32[31:0]  : 32'h0; 
wire [31:0] fft96_in_33_Re = io_in_ready ? io_in_33_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata33[63:32] : 32'h0; 
wire [31:0] fft96_in_33_Im = io_in_ready ? io_in_33_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata33[31:0]  : 32'h0; 
wire [31:0] fft96_in_34_Re = io_in_ready ? io_in_34_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata34[63:32] : 32'h0; 
wire [31:0] fft96_in_34_Im = io_in_ready ? io_in_34_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata34[31:0]  : 32'h0; 
wire [31:0] fft96_in_35_Re = io_in_ready ? io_in_35_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata35[63:32] : 32'h0; 
wire [31:0] fft96_in_35_Im = io_in_ready ? io_in_35_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata35[31:0]  : 32'h0; 
wire [31:0] fft96_in_36_Re = io_in_ready ? io_in_36_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata36[63:32] : 32'h0; 
wire [31:0] fft96_in_36_Im = io_in_ready ? io_in_36_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata36[31:0]  : 32'h0; 
wire [31:0] fft96_in_37_Re = io_in_ready ? io_in_37_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata37[63:32] : 32'h0; 
wire [31:0] fft96_in_37_Im = io_in_ready ? io_in_37_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata37[31:0]  : 32'h0; 
wire [31:0] fft96_in_38_Re = io_in_ready ? io_in_38_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata38[63:32] : 32'h0; 
wire [31:0] fft96_in_38_Im = io_in_ready ? io_in_38_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata38[31:0]  : 32'h0; 
wire [31:0] fft96_in_39_Re = io_in_ready ? io_in_39_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata39[63:32] : 32'h0; 
wire [31:0] fft96_in_39_Im = io_in_ready ? io_in_39_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata39[31:0]  : 32'h0; 
wire [31:0] fft96_in_40_Re = io_in_ready ? io_in_40_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata40[63:32] : 32'h0; 
wire [31:0] fft96_in_40_Im = io_in_ready ? io_in_40_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata40[31:0]  : 32'h0; 
wire [31:0] fft96_in_41_Re = io_in_ready ? io_in_41_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata41[63:32] : 32'h0; 
wire [31:0] fft96_in_41_Im = io_in_ready ? io_in_41_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata41[31:0]  : 32'h0; 
wire [31:0] fft96_in_42_Re = io_in_ready ? io_in_42_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata42[63:32] : 32'h0; 
wire [31:0] fft96_in_42_Im = io_in_ready ? io_in_42_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata42[31:0]  : 32'h0; 
wire [31:0] fft96_in_43_Re = io_in_ready ? io_in_43_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata43[63:32] : 32'h0; 
wire [31:0] fft96_in_43_Im = io_in_ready ? io_in_43_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata43[31:0]  : 32'h0; 
wire [31:0] fft96_in_44_Re = io_in_ready ? io_in_44_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata44[63:32] : 32'h0; 
wire [31:0] fft96_in_44_Im = io_in_ready ? io_in_44_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata44[31:0]  : 32'h0; 
wire [31:0] fft96_in_45_Re = io_in_ready ? io_in_45_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata45[63:32] : 32'h0; 
wire [31:0] fft96_in_45_Im = io_in_ready ? io_in_45_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata45[31:0]  : 32'h0; 
wire [31:0] fft96_in_46_Re = io_in_ready ? io_in_46_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata46[63:32] : 32'h0; 
wire [31:0] fft96_in_46_Im = io_in_ready ? io_in_46_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata46[31:0]  : 32'h0; 
wire [31:0] fft96_in_47_Re = io_in_ready ? io_in_47_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata47[63:32] : 32'h0; 
wire [31:0] fft96_in_47_Im = io_in_ready ? io_in_47_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata47[31:0]  : 32'h0; 
wire [31:0] fft96_in_48_Re = io_in_ready ? io_in_48_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata48[63:32] : 32'h0; 
wire [31:0] fft96_in_48_Im = io_in_ready ? io_in_48_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata48[31:0]  : 32'h0; 
wire [31:0] fft96_in_49_Re = io_in_ready ? io_in_49_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata49[63:32] : 32'h0; 
wire [31:0] fft96_in_49_Im = io_in_ready ? io_in_49_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata49[31:0]  : 32'h0; 
wire [31:0] fft96_in_50_Re = io_in_ready ? io_in_50_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata50[63:32] : 32'h0; 
wire [31:0] fft96_in_50_Im = io_in_ready ? io_in_50_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata50[31:0]  : 32'h0; 
wire [31:0] fft96_in_51_Re = io_in_ready ? io_in_51_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata51[63:32] : 32'h0; 
wire [31:0] fft96_in_51_Im = io_in_ready ? io_in_51_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata51[31:0]  : 32'h0; 
wire [31:0] fft96_in_52_Re = io_in_ready ? io_in_52_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata52[63:32] : 32'h0; 
wire [31:0] fft96_in_52_Im = io_in_ready ? io_in_52_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata52[31:0]  : 32'h0; 
wire [31:0] fft96_in_53_Re = io_in_ready ? io_in_53_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata53[63:32] : 32'h0; 
wire [31:0] fft96_in_53_Im = io_in_ready ? io_in_53_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata53[31:0]  : 32'h0; 
wire [31:0] fft96_in_54_Re = io_in_ready ? io_in_54_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata54[63:32] : 32'h0; 
wire [31:0] fft96_in_54_Im = io_in_ready ? io_in_54_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata54[31:0]  : 32'h0; 
wire [31:0] fft96_in_55_Re = io_in_ready ? io_in_55_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata55[63:32] : 32'h0; 
wire [31:0] fft96_in_55_Im = io_in_ready ? io_in_55_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata55[31:0]  : 32'h0; 
wire [31:0] fft96_in_56_Re = io_in_ready ? io_in_56_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata56[63:32] : 32'h0; 
wire [31:0] fft96_in_56_Im = io_in_ready ? io_in_56_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata56[31:0]  : 32'h0; 
wire [31:0] fft96_in_57_Re = io_in_ready ? io_in_57_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata57[63:32] : 32'h0; 
wire [31:0] fft96_in_57_Im = io_in_ready ? io_in_57_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata57[31:0]  : 32'h0; 
wire [31:0] fft96_in_58_Re = io_in_ready ? io_in_58_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata58[63:32] : 32'h0; 
wire [31:0] fft96_in_58_Im = io_in_ready ? io_in_58_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata58[31:0]  : 32'h0; 
wire [31:0] fft96_in_59_Re = io_in_ready ? io_in_59_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata59[63:32] : 32'h0; 
wire [31:0] fft96_in_59_Im = io_in_ready ? io_in_59_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata59[31:0]  : 32'h0; 
wire [31:0] fft96_in_60_Re = io_in_ready ? io_in_60_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata60[63:32] : 32'h0; 
wire [31:0] fft96_in_60_Im = io_in_ready ? io_in_60_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata60[31:0]  : 32'h0; 
wire [31:0] fft96_in_61_Re = io_in_ready ? io_in_61_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata61[63:32] : 32'h0; 
wire [31:0] fft96_in_61_Im = io_in_ready ? io_in_61_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata61[31:0]  : 32'h0; 
wire [31:0] fft96_in_62_Re = io_in_ready ? io_in_62_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata62[63:32] : 32'h0; 
wire [31:0] fft96_in_62_Im = io_in_ready ? io_in_62_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata62[31:0]  : 32'h0; 
wire [31:0] fft96_in_63_Re = io_in_ready ? io_in_63_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata63[63:32] : 32'h0; 
wire [31:0] fft96_in_63_Im = io_in_ready ? io_in_63_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata63[31:0]  : 32'h0; 
wire [31:0] fft96_in_64_Re = io_in_ready ? io_in_64_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata64[63:32] : 32'h0; 
wire [31:0] fft96_in_64_Im = io_in_ready ? io_in_64_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata64[31:0]  : 32'h0; 
wire [31:0] fft96_in_65_Re = io_in_ready ? io_in_65_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata65[63:32] : 32'h0; 
wire [31:0] fft96_in_65_Im = io_in_ready ? io_in_65_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata65[31:0]  : 32'h0; 
wire [31:0] fft96_in_66_Re = io_in_ready ? io_in_66_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata66[63:32] : 32'h0; 
wire [31:0] fft96_in_66_Im = io_in_ready ? io_in_66_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata66[31:0]  : 32'h0; 
wire [31:0] fft96_in_67_Re = io_in_ready ? io_in_67_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata67[63:32] : 32'h0; 
wire [31:0] fft96_in_67_Im = io_in_ready ? io_in_67_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata67[31:0]  : 32'h0; 
wire [31:0] fft96_in_68_Re = io_in_ready ? io_in_68_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata68[63:32] : 32'h0; 
wire [31:0] fft96_in_68_Im = io_in_ready ? io_in_68_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata68[31:0]  : 32'h0; 
wire [31:0] fft96_in_69_Re = io_in_ready ? io_in_69_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata69[63:32] : 32'h0; 
wire [31:0] fft96_in_69_Im = io_in_ready ? io_in_69_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata69[31:0]  : 32'h0; 
wire [31:0] fft96_in_70_Re = io_in_ready ? io_in_70_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata70[63:32] : 32'h0; 
wire [31:0] fft96_in_70_Im = io_in_ready ? io_in_70_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata70[31:0]  : 32'h0; 
wire [31:0] fft96_in_71_Re = io_in_ready ? io_in_71_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata71[63:32] : 32'h0; 
wire [31:0] fft96_in_71_Im = io_in_ready ? io_in_71_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata71[31:0]  : 32'h0; 
wire [31:0] fft96_in_72_Re = io_in_ready ? io_in_72_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata72[63:32] : 32'h0; 
wire [31:0] fft96_in_72_Im = io_in_ready ? io_in_72_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata72[31:0]  : 32'h0; 
wire [31:0] fft96_in_73_Re = io_in_ready ? io_in_73_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata73[63:32] : 32'h0; 
wire [31:0] fft96_in_73_Im = io_in_ready ? io_in_73_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata73[31:0]  : 32'h0; 
wire [31:0] fft96_in_74_Re = io_in_ready ? io_in_74_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata74[63:32] : 32'h0; 
wire [31:0] fft96_in_74_Im = io_in_ready ? io_in_74_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata74[31:0]  : 32'h0; 
wire [31:0] fft96_in_75_Re = io_in_ready ? io_in_75_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata75[63:32] : 32'h0; 
wire [31:0] fft96_in_75_Im = io_in_ready ? io_in_75_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata75[31:0]  : 32'h0; 
wire [31:0] fft96_in_76_Re = io_in_ready ? io_in_76_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata76[63:32] : 32'h0; 
wire [31:0] fft96_in_76_Im = io_in_ready ? io_in_76_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata76[31:0]  : 32'h0; 
wire [31:0] fft96_in_77_Re = io_in_ready ? io_in_77_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata77[63:32] : 32'h0; 
wire [31:0] fft96_in_77_Im = io_in_ready ? io_in_77_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata77[31:0]  : 32'h0; 
wire [31:0] fft96_in_78_Re = io_in_ready ? io_in_78_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata78[63:32] : 32'h0; 
wire [31:0] fft96_in_78_Im = io_in_ready ? io_in_78_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata78[31:0]  : 32'h0; 
wire [31:0] fft96_in_79_Re = io_in_ready ? io_in_79_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata79[63:32] : 32'h0; 
wire [31:0] fft96_in_79_Im = io_in_ready ? io_in_79_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata79[31:0]  : 32'h0; 
wire [31:0] fft96_in_80_Re = io_in_ready ? io_in_80_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata80[63:32] : 32'h0; 
wire [31:0] fft96_in_80_Im = io_in_ready ? io_in_80_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata80[31:0]  : 32'h0; 
wire [31:0] fft96_in_81_Re = io_in_ready ? io_in_81_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata81[63:32] : 32'h0; 
wire [31:0] fft96_in_81_Im = io_in_ready ? io_in_81_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata81[31:0]  : 32'h0; 
wire [31:0] fft96_in_82_Re = io_in_ready ? io_in_82_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata82[63:32] : 32'h0; 
wire [31:0] fft96_in_82_Im = io_in_ready ? io_in_82_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata82[31:0]  : 32'h0; 
wire [31:0] fft96_in_83_Re = io_in_ready ? io_in_83_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata83[63:32] : 32'h0; 
wire [31:0] fft96_in_83_Im = io_in_ready ? io_in_83_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata83[31:0]  : 32'h0; 
wire [31:0] fft96_in_84_Re = io_in_ready ? io_in_84_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata84[63:32] : 32'h0; 
wire [31:0] fft96_in_84_Im = io_in_ready ? io_in_84_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata84[31:0]  : 32'h0; 
wire [31:0] fft96_in_85_Re = io_in_ready ? io_in_85_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata85[63:32] : 32'h0; 
wire [31:0] fft96_in_85_Im = io_in_ready ? io_in_85_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata85[31:0]  : 32'h0; 
wire [31:0] fft96_in_86_Re = io_in_ready ? io_in_86_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata86[63:32] : 32'h0; 
wire [31:0] fft96_in_86_Im = io_in_ready ? io_in_86_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata86[31:0]  : 32'h0; 
wire [31:0] fft96_in_87_Re = io_in_ready ? io_in_87_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata87[63:32] : 32'h0; 
wire [31:0] fft96_in_87_Im = io_in_ready ? io_in_87_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata87[31:0]  : 32'h0; 
wire [31:0] fft96_in_88_Re = io_in_ready ? io_in_88_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata88[63:32] : 32'h0; 
wire [31:0] fft96_in_88_Im = io_in_ready ? io_in_88_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata88[31:0]  : 32'h0; 
wire [31:0] fft96_in_89_Re = io_in_ready ? io_in_89_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata89[63:32] : 32'h0; 
wire [31:0] fft96_in_89_Im = io_in_ready ? io_in_89_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata89[31:0]  : 32'h0; 
wire [31:0] fft96_in_90_Re = io_in_ready ? io_in_90_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata90[63:32] : 32'h0; 
wire [31:0] fft96_in_90_Im = io_in_ready ? io_in_90_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata90[31:0]  : 32'h0; 
wire [31:0] fft96_in_91_Re = io_in_ready ? io_in_91_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata91[63:32] : 32'h0; 
wire [31:0] fft96_in_91_Im = io_in_ready ? io_in_91_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata91[31:0]  : 32'h0; 
wire [31:0] fft96_in_92_Re = io_in_ready ? io_in_92_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata92[63:32] : 32'h0; 
wire [31:0] fft96_in_92_Im = io_in_ready ? io_in_92_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata92[31:0]  : 32'h0; 
wire [31:0] fft96_in_93_Re = io_in_ready ? io_in_93_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata93[63:32] : 32'h0; 
wire [31:0] fft96_in_93_Im = io_in_ready ? io_in_93_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata93[31:0]  : 32'h0; 
wire [31:0] fft96_in_94_Re = io_in_ready ? io_in_94_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata94[63:32] : 32'h0; 
wire [31:0] fft96_in_94_Im = io_in_ready ? io_in_94_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata94[31:0]  : 32'h0; 
wire [31:0] fft96_in_95_Re = io_in_ready ? io_in_95_Re : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata95[63:32] : 32'h0; 
wire [31:0] fft96_in_95_Im = io_in_ready ? io_in_95_Im : ((cur_state==STA2) & fft96_in_ready) ? mem0_rddata95[31:0]  : 32'h0; 

assign io_out_0_Re  = io_out_validate ? mem1_rddata0[63:32]  : 32'h0;
assign io_out_0_Im  = io_out_validate ? mem1_rddata0[31:0]   : 32'h0;
assign io_out_1_Re  = io_out_validate ? mem1_rddata1[63:32]  : 32'h0;
assign io_out_1_Im  = io_out_validate ? mem1_rddata1[31:0]   : 32'h0;
assign io_out_2_Re  = io_out_validate ? mem1_rddata2[63:32]  : 32'h0;
assign io_out_2_Im  = io_out_validate ? mem1_rddata2[31:0]   : 32'h0;
assign io_out_3_Re  = io_out_validate ? mem1_rddata3[63:32]  : 32'h0;
assign io_out_3_Im  = io_out_validate ? mem1_rddata3[31:0]   : 32'h0;
assign io_out_4_Re  = io_out_validate ? mem1_rddata4[63:32]  : 32'h0;
assign io_out_4_Im  = io_out_validate ? mem1_rddata4[31:0]   : 32'h0;
assign io_out_5_Re  = io_out_validate ? mem1_rddata5[63:32]  : 32'h0;
assign io_out_5_Im  = io_out_validate ? mem1_rddata5[31:0]   : 32'h0;
assign io_out_6_Re  = io_out_validate ? mem1_rddata6[63:32]  : 32'h0;
assign io_out_6_Im  = io_out_validate ? mem1_rddata6[31:0]   : 32'h0;
assign io_out_7_Re  = io_out_validate ? mem1_rddata7[63:32]  : 32'h0;
assign io_out_7_Im  = io_out_validate ? mem1_rddata7[31:0]   : 32'h0;
assign io_out_8_Re  = io_out_validate ? mem1_rddata8[63:32]  : 32'h0;
assign io_out_8_Im  = io_out_validate ? mem1_rddata8[31:0]   : 32'h0;
assign io_out_9_Re  = io_out_validate ? mem1_rddata9[63:32]  : 32'h0;
assign io_out_9_Im  = io_out_validate ? mem1_rddata9[31:0]   : 32'h0;
assign io_out_10_Re = io_out_validate ? mem1_rddata10[63:32] : 32'h0;
assign io_out_10_Im = io_out_validate ? mem1_rddata10[31:0]  : 32'h0;
assign io_out_11_Re = io_out_validate ? mem1_rddata11[63:32] : 32'h0;
assign io_out_11_Im = io_out_validate ? mem1_rddata11[31:0]  : 32'h0;
assign io_out_12_Re = io_out_validate ? mem1_rddata12[63:32] : 32'h0;
assign io_out_12_Im = io_out_validate ? mem1_rddata12[31:0]  : 32'h0;
assign io_out_13_Re = io_out_validate ? mem1_rddata13[63:32] : 32'h0;
assign io_out_13_Im = io_out_validate ? mem1_rddata13[31:0]  : 32'h0;
assign io_out_14_Re = io_out_validate ? mem1_rddata14[63:32] : 32'h0;
assign io_out_14_Im = io_out_validate ? mem1_rddata14[31:0]  : 32'h0;
assign io_out_15_Re = io_out_validate ? mem1_rddata15[63:32] : 32'h0;
assign io_out_15_Im = io_out_validate ? mem1_rddata15[31:0]  : 32'h0;
assign io_out_16_Re = io_out_validate ? mem1_rddata16[63:32] : 32'h0;
assign io_out_16_Im = io_out_validate ? mem1_rddata16[31:0]  : 32'h0;
assign io_out_17_Re = io_out_validate ? mem1_rddata17[63:32] : 32'h0;
assign io_out_17_Im = io_out_validate ? mem1_rddata17[31:0]  : 32'h0;
assign io_out_18_Re = io_out_validate ? mem1_rddata18[63:32] : 32'h0;
assign io_out_18_Im = io_out_validate ? mem1_rddata18[31:0]  : 32'h0;
assign io_out_19_Re = io_out_validate ? mem1_rddata19[63:32] : 32'h0;
assign io_out_19_Im = io_out_validate ? mem1_rddata19[31:0]  : 32'h0;
assign io_out_20_Re = io_out_validate ? mem1_rddata20[63:32] : 32'h0;
assign io_out_20_Im = io_out_validate ? mem1_rddata20[31:0]  : 32'h0;
assign io_out_21_Re = io_out_validate ? mem1_rddata21[63:32] : 32'h0;
assign io_out_21_Im = io_out_validate ? mem1_rddata21[31:0]  : 32'h0;
assign io_out_22_Re = io_out_validate ? mem1_rddata22[63:32] : 32'h0;
assign io_out_22_Im = io_out_validate ? mem1_rddata22[31:0]  : 32'h0;
assign io_out_23_Re = io_out_validate ? mem1_rddata23[63:32] : 32'h0;
assign io_out_23_Im = io_out_validate ? mem1_rddata23[31:0]  : 32'h0;
assign io_out_24_Re = io_out_validate ? mem1_rddata24[63:32] : 32'h0;
assign io_out_24_Im = io_out_validate ? mem1_rddata24[31:0]  : 32'h0;
assign io_out_25_Re = io_out_validate ? mem1_rddata25[63:32] : 32'h0;
assign io_out_25_Im = io_out_validate ? mem1_rddata25[31:0]  : 32'h0;
assign io_out_26_Re = io_out_validate ? mem1_rddata26[63:32] : 32'h0;
assign io_out_26_Im = io_out_validate ? mem1_rddata26[31:0]  : 32'h0;
assign io_out_27_Re = io_out_validate ? mem1_rddata27[63:32] : 32'h0;
assign io_out_27_Im = io_out_validate ? mem1_rddata27[31:0]  : 32'h0;
assign io_out_28_Re = io_out_validate ? mem1_rddata28[63:32] : 32'h0;
assign io_out_28_Im = io_out_validate ? mem1_rddata28[31:0]  : 32'h0;
assign io_out_29_Re = io_out_validate ? mem1_rddata29[63:32] : 32'h0;
assign io_out_29_Im = io_out_validate ? mem1_rddata29[31:0]  : 32'h0;
assign io_out_30_Re = io_out_validate ? mem1_rddata30[63:32] : 32'h0;
assign io_out_30_Im = io_out_validate ? mem1_rddata30[31:0]  : 32'h0;
assign io_out_31_Re = io_out_validate ? mem1_rddata31[63:32] : 32'h0;
assign io_out_31_Im = io_out_validate ? mem1_rddata31[31:0]  : 32'h0;
assign io_out_32_Re = io_out_validate ? mem1_rddata32[63:32] : 32'h0;
assign io_out_32_Im = io_out_validate ? mem1_rddata32[31:0]  : 32'h0;
assign io_out_33_Re = io_out_validate ? mem1_rddata33[63:32] : 32'h0;
assign io_out_33_Im = io_out_validate ? mem1_rddata33[31:0]  : 32'h0;
assign io_out_34_Re = io_out_validate ? mem1_rddata34[63:32] : 32'h0;
assign io_out_34_Im = io_out_validate ? mem1_rddata34[31:0]  : 32'h0;
assign io_out_35_Re = io_out_validate ? mem1_rddata35[63:32] : 32'h0;
assign io_out_35_Im = io_out_validate ? mem1_rddata35[31:0]  : 32'h0;
assign io_out_36_Re = io_out_validate ? mem1_rddata36[63:32] : 32'h0;
assign io_out_36_Im = io_out_validate ? mem1_rddata36[31:0]  : 32'h0;
assign io_out_37_Re = io_out_validate ? mem1_rddata37[63:32] : 32'h0;
assign io_out_37_Im = io_out_validate ? mem1_rddata37[31:0]  : 32'h0;
assign io_out_38_Re = io_out_validate ? mem1_rddata38[63:32] : 32'h0;
assign io_out_38_Im = io_out_validate ? mem1_rddata38[31:0]  : 32'h0;
assign io_out_39_Re = io_out_validate ? mem1_rddata39[63:32] : 32'h0;
assign io_out_39_Im = io_out_validate ? mem1_rddata39[31:0]  : 32'h0;
assign io_out_40_Re = io_out_validate ? mem1_rddata40[63:32] : 32'h0;
assign io_out_40_Im = io_out_validate ? mem1_rddata40[31:0]  : 32'h0;
assign io_out_41_Re = io_out_validate ? mem1_rddata41[63:32] : 32'h0;
assign io_out_41_Im = io_out_validate ? mem1_rddata41[31:0]  : 32'h0;
assign io_out_42_Re = io_out_validate ? mem1_rddata42[63:32] : 32'h0;
assign io_out_42_Im = io_out_validate ? mem1_rddata42[31:0]  : 32'h0;
assign io_out_43_Re = io_out_validate ? mem1_rddata43[63:32] : 32'h0;
assign io_out_43_Im = io_out_validate ? mem1_rddata43[31:0]  : 32'h0;
assign io_out_44_Re = io_out_validate ? mem1_rddata44[63:32] : 32'h0;
assign io_out_44_Im = io_out_validate ? mem1_rddata44[31:0]  : 32'h0;
assign io_out_45_Re = io_out_validate ? mem1_rddata45[63:32] : 32'h0;
assign io_out_45_Im = io_out_validate ? mem1_rddata45[31:0]  : 32'h0;
assign io_out_46_Re = io_out_validate ? mem1_rddata46[63:32] : 32'h0;
assign io_out_46_Im = io_out_validate ? mem1_rddata46[31:0]  : 32'h0;
assign io_out_47_Re = io_out_validate ? mem1_rddata47[63:32] : 32'h0;
assign io_out_47_Im = io_out_validate ? mem1_rddata47[31:0]  : 32'h0;
assign io_out_48_Re = io_out_validate ? mem1_rddata48[63:32] : 32'h0;
assign io_out_48_Im = io_out_validate ? mem1_rddata48[31:0]  : 32'h0;
assign io_out_49_Re = io_out_validate ? mem1_rddata49[63:32] : 32'h0;
assign io_out_49_Im = io_out_validate ? mem1_rddata49[31:0]  : 32'h0;
assign io_out_50_Re = io_out_validate ? mem1_rddata50[63:32] : 32'h0;
assign io_out_50_Im = io_out_validate ? mem1_rddata50[31:0]  : 32'h0;
assign io_out_51_Re = io_out_validate ? mem1_rddata51[63:32] : 32'h0;
assign io_out_51_Im = io_out_validate ? mem1_rddata51[31:0]  : 32'h0;
assign io_out_52_Re = io_out_validate ? mem1_rddata52[63:32] : 32'h0;
assign io_out_52_Im = io_out_validate ? mem1_rddata52[31:0]  : 32'h0;
assign io_out_53_Re = io_out_validate ? mem1_rddata53[63:32] : 32'h0;
assign io_out_53_Im = io_out_validate ? mem1_rddata53[31:0]  : 32'h0;
assign io_out_54_Re = io_out_validate ? mem1_rddata54[63:32] : 32'h0;
assign io_out_54_Im = io_out_validate ? mem1_rddata54[31:0]  : 32'h0;
assign io_out_55_Re = io_out_validate ? mem1_rddata55[63:32] : 32'h0;
assign io_out_55_Im = io_out_validate ? mem1_rddata55[31:0]  : 32'h0;
assign io_out_56_Re = io_out_validate ? mem1_rddata56[63:32] : 32'h0;
assign io_out_56_Im = io_out_validate ? mem1_rddata56[31:0]  : 32'h0;
assign io_out_57_Re = io_out_validate ? mem1_rddata57[63:32] : 32'h0;
assign io_out_57_Im = io_out_validate ? mem1_rddata57[31:0]  : 32'h0;
assign io_out_58_Re = io_out_validate ? mem1_rddata58[63:32] : 32'h0;
assign io_out_58_Im = io_out_validate ? mem1_rddata58[31:0]  : 32'h0;
assign io_out_59_Re = io_out_validate ? mem1_rddata59[63:32] : 32'h0;
assign io_out_59_Im = io_out_validate ? mem1_rddata59[31:0]  : 32'h0;
assign io_out_60_Re = io_out_validate ? mem1_rddata60[63:32] : 32'h0;
assign io_out_60_Im = io_out_validate ? mem1_rddata60[31:0]  : 32'h0;
assign io_out_61_Re = io_out_validate ? mem1_rddata61[63:32] : 32'h0;
assign io_out_61_Im = io_out_validate ? mem1_rddata61[31:0]  : 32'h0;
assign io_out_62_Re = io_out_validate ? mem1_rddata62[63:32] : 32'h0;
assign io_out_62_Im = io_out_validate ? mem1_rddata62[31:0]  : 32'h0;
assign io_out_63_Re = io_out_validate ? mem1_rddata63[63:32] : 32'h0;
assign io_out_63_Im = io_out_validate ? mem1_rddata63[31:0]  : 32'h0;
assign io_out_64_Re = io_out_validate ? mem1_rddata64[63:32] : 32'h0;
assign io_out_64_Im = io_out_validate ? mem1_rddata64[31:0]  : 32'h0;
assign io_out_65_Re = io_out_validate ? mem1_rddata65[63:32] : 32'h0;
assign io_out_65_Im = io_out_validate ? mem1_rddata65[31:0]  : 32'h0;
assign io_out_66_Re = io_out_validate ? mem1_rddata66[63:32] : 32'h0;
assign io_out_66_Im = io_out_validate ? mem1_rddata66[31:0]  : 32'h0;
assign io_out_67_Re = io_out_validate ? mem1_rddata67[63:32] : 32'h0;
assign io_out_67_Im = io_out_validate ? mem1_rddata67[31:0]  : 32'h0;
assign io_out_68_Re = io_out_validate ? mem1_rddata68[63:32] : 32'h0;
assign io_out_68_Im = io_out_validate ? mem1_rddata68[31:0]  : 32'h0;
assign io_out_69_Re = io_out_validate ? mem1_rddata69[63:32] : 32'h0;
assign io_out_69_Im = io_out_validate ? mem1_rddata69[31:0]  : 32'h0;
assign io_out_70_Re = io_out_validate ? mem1_rddata70[63:32] : 32'h0;
assign io_out_70_Im = io_out_validate ? mem1_rddata70[31:0]  : 32'h0;
assign io_out_71_Re = io_out_validate ? mem1_rddata71[63:32] : 32'h0;
assign io_out_71_Im = io_out_validate ? mem1_rddata71[31:0]  : 32'h0;
assign io_out_72_Re = io_out_validate ? mem1_rddata72[63:32] : 32'h0;
assign io_out_72_Im = io_out_validate ? mem1_rddata72[31:0]  : 32'h0;
assign io_out_73_Re = io_out_validate ? mem1_rddata73[63:32] : 32'h0;
assign io_out_73_Im = io_out_validate ? mem1_rddata73[31:0]  : 32'h0;
assign io_out_74_Re = io_out_validate ? mem1_rddata74[63:32] : 32'h0;
assign io_out_74_Im = io_out_validate ? mem1_rddata74[31:0]  : 32'h0;
assign io_out_75_Re = io_out_validate ? mem1_rddata75[63:32] : 32'h0;
assign io_out_75_Im = io_out_validate ? mem1_rddata75[31:0]  : 32'h0;
assign io_out_76_Re = io_out_validate ? mem1_rddata76[63:32] : 32'h0;
assign io_out_76_Im = io_out_validate ? mem1_rddata76[31:0]  : 32'h0;
assign io_out_77_Re = io_out_validate ? mem1_rddata77[63:32] : 32'h0;
assign io_out_77_Im = io_out_validate ? mem1_rddata77[31:0]  : 32'h0;
assign io_out_78_Re = io_out_validate ? mem1_rddata78[63:32] : 32'h0;
assign io_out_78_Im = io_out_validate ? mem1_rddata78[31:0]  : 32'h0;
assign io_out_79_Re = io_out_validate ? mem1_rddata79[63:32] : 32'h0;
assign io_out_79_Im = io_out_validate ? mem1_rddata79[31:0]  : 32'h0;
assign io_out_80_Re = io_out_validate ? mem1_rddata80[63:32] : 32'h0;
assign io_out_80_Im = io_out_validate ? mem1_rddata80[31:0]  : 32'h0;
assign io_out_81_Re = io_out_validate ? mem1_rddata81[63:32] : 32'h0;
assign io_out_81_Im = io_out_validate ? mem1_rddata81[31:0]  : 32'h0;
assign io_out_82_Re = io_out_validate ? mem1_rddata82[63:32] : 32'h0;
assign io_out_82_Im = io_out_validate ? mem1_rddata82[31:0]  : 32'h0;
assign io_out_83_Re = io_out_validate ? mem1_rddata83[63:32] : 32'h0;
assign io_out_83_Im = io_out_validate ? mem1_rddata83[31:0]  : 32'h0;
assign io_out_84_Re = io_out_validate ? mem1_rddata84[63:32] : 32'h0;
assign io_out_84_Im = io_out_validate ? mem1_rddata84[31:0]  : 32'h0;
assign io_out_85_Re = io_out_validate ? mem1_rddata85[63:32] : 32'h0;
assign io_out_85_Im = io_out_validate ? mem1_rddata85[31:0]  : 32'h0;
assign io_out_86_Re = io_out_validate ? mem1_rddata86[63:32] : 32'h0;
assign io_out_86_Im = io_out_validate ? mem1_rddata86[31:0]  : 32'h0;
assign io_out_87_Re = io_out_validate ? mem1_rddata87[63:32] : 32'h0;
assign io_out_87_Im = io_out_validate ? mem1_rddata87[31:0]  : 32'h0;
assign io_out_88_Re = io_out_validate ? mem1_rddata88[63:32] : 32'h0;
assign io_out_88_Im = io_out_validate ? mem1_rddata88[31:0]  : 32'h0;
assign io_out_89_Re = io_out_validate ? mem1_rddata89[63:32] : 32'h0;
assign io_out_89_Im = io_out_validate ? mem1_rddata89[31:0]  : 32'h0;
assign io_out_90_Re = io_out_validate ? mem1_rddata90[63:32] : 32'h0;
assign io_out_90_Im = io_out_validate ? mem1_rddata90[31:0]  : 32'h0;
assign io_out_91_Re = io_out_validate ? mem1_rddata91[63:32] : 32'h0;
assign io_out_91_Im = io_out_validate ? mem1_rddata91[31:0]  : 32'h0;
assign io_out_92_Re = io_out_validate ? mem1_rddata92[63:32] : 32'h0;
assign io_out_92_Im = io_out_validate ? mem1_rddata92[31:0]  : 32'h0;
assign io_out_93_Re = io_out_validate ? mem1_rddata93[63:32] : 32'h0;
assign io_out_93_Im = io_out_validate ? mem1_rddata93[31:0]  : 32'h0;
assign io_out_94_Re = io_out_validate ? mem1_rddata94[63:32] : 32'h0;
assign io_out_94_Im = io_out_validate ? mem1_rddata94[31:0]  : 32'h0;
assign io_out_95_Re = io_out_validate ? mem1_rddata95[63:32] : 32'h0;
assign io_out_95_Im = io_out_validate ? mem1_rddata95[31:0]  : 32'h0;

FFT_mr96_basic u_fft96(
                       .clock            (clock         ),
                       .reset            (reset         ),
                       .io_in_0_Re       (fft96_in_0_Re ),
                       .io_in_0_Im       (fft96_in_0_Im ),
                       .io_in_1_Re       (fft96_in_1_Re ),
                       .io_in_1_Im       (fft96_in_1_Im ),
                       .io_in_2_Re       (fft96_in_2_Re ),
                       .io_in_2_Im       (fft96_in_2_Im ),
                       .io_in_3_Re       (fft96_in_3_Re ),
                       .io_in_3_Im       (fft96_in_3_Im ),
                       .io_in_4_Re       (fft96_in_4_Re ),
                       .io_in_4_Im       (fft96_in_4_Im ),
                       .io_in_5_Re       (fft96_in_5_Re ),
                       .io_in_5_Im       (fft96_in_5_Im ),
                       .io_in_6_Re       (fft96_in_6_Re ),
                       .io_in_6_Im       (fft96_in_6_Im ),
                       .io_in_7_Re       (fft96_in_7_Re ),
                       .io_in_7_Im       (fft96_in_7_Im ),
                       .io_in_8_Re       (fft96_in_8_Re ),
                       .io_in_8_Im       (fft96_in_8_Im ),
                       .io_in_9_Re       (fft96_in_9_Re ),
                       .io_in_9_Im       (fft96_in_9_Im ),
                       .io_in_10_Re      (fft96_in_10_Re),
                       .io_in_10_Im      (fft96_in_10_Im),
                       .io_in_11_Re      (fft96_in_11_Re),
                       .io_in_11_Im      (fft96_in_11_Im),
                       .io_in_12_Re      (fft96_in_12_Re),
                       .io_in_12_Im      (fft96_in_12_Im),
                       .io_in_13_Re      (fft96_in_13_Re),
                       .io_in_13_Im      (fft96_in_13_Im),
                       .io_in_14_Re      (fft96_in_14_Re),
                       .io_in_14_Im      (fft96_in_14_Im),
                       .io_in_15_Re      (fft96_in_15_Re),
                       .io_in_15_Im      (fft96_in_15_Im),
                       .io_in_16_Re      (fft96_in_16_Re),
                       .io_in_16_Im      (fft96_in_16_Im),
                       .io_in_17_Re      (fft96_in_17_Re),
                       .io_in_17_Im      (fft96_in_17_Im),
                       .io_in_18_Re      (fft96_in_18_Re),
                       .io_in_18_Im      (fft96_in_18_Im),
                       .io_in_19_Re      (fft96_in_19_Re),
                       .io_in_19_Im      (fft96_in_19_Im),
                       .io_in_20_Re      (fft96_in_20_Re),
                       .io_in_20_Im      (fft96_in_20_Im),
                       .io_in_21_Re      (fft96_in_21_Re),
                       .io_in_21_Im      (fft96_in_21_Im),
                       .io_in_22_Re      (fft96_in_22_Re),
                       .io_in_22_Im      (fft96_in_22_Im),
                       .io_in_23_Re      (fft96_in_23_Re),
                       .io_in_23_Im      (fft96_in_23_Im),
                       .io_in_24_Re      (fft96_in_24_Re),
                       .io_in_24_Im      (fft96_in_24_Im),
                       .io_in_25_Re      (fft96_in_25_Re),
                       .io_in_25_Im      (fft96_in_25_Im),
                       .io_in_26_Re      (fft96_in_26_Re),
                       .io_in_26_Im      (fft96_in_26_Im),
                       .io_in_27_Re      (fft96_in_27_Re),
                       .io_in_27_Im      (fft96_in_27_Im),
                       .io_in_28_Re      (fft96_in_28_Re),
                       .io_in_28_Im      (fft96_in_28_Im),
                       .io_in_29_Re      (fft96_in_29_Re),
                       .io_in_29_Im      (fft96_in_29_Im),
                       .io_in_30_Re      (fft96_in_30_Re),
                       .io_in_30_Im      (fft96_in_30_Im),
                       .io_in_31_Re      (fft96_in_31_Re),
                       .io_in_31_Im      (fft96_in_31_Im),
                       .io_in_32_Re      (fft96_in_32_Re),
                       .io_in_32_Im      (fft96_in_32_Im),
                       .io_in_33_Re      (fft96_in_33_Re),
                       .io_in_33_Im      (fft96_in_33_Im),
                       .io_in_34_Re      (fft96_in_34_Re),
                       .io_in_34_Im      (fft96_in_34_Im),
                       .io_in_35_Re      (fft96_in_35_Re),
                       .io_in_35_Im      (fft96_in_35_Im),
                       .io_in_36_Re      (fft96_in_36_Re),
                       .io_in_36_Im      (fft96_in_36_Im),
                       .io_in_37_Re      (fft96_in_37_Re),
                       .io_in_37_Im      (fft96_in_37_Im),
                       .io_in_38_Re      (fft96_in_38_Re),
                       .io_in_38_Im      (fft96_in_38_Im),
                       .io_in_39_Re      (fft96_in_39_Re),
                       .io_in_39_Im      (fft96_in_39_Im),
                       .io_in_40_Re      (fft96_in_40_Re),
                       .io_in_40_Im      (fft96_in_40_Im),
                       .io_in_41_Re      (fft96_in_41_Re),
                       .io_in_41_Im      (fft96_in_41_Im),
                       .io_in_42_Re      (fft96_in_42_Re),
                       .io_in_42_Im      (fft96_in_42_Im),
                       .io_in_43_Re      (fft96_in_43_Re),
                       .io_in_43_Im      (fft96_in_43_Im),
                       .io_in_44_Re      (fft96_in_44_Re),
                       .io_in_44_Im      (fft96_in_44_Im),
                       .io_in_45_Re      (fft96_in_45_Re),
                       .io_in_45_Im      (fft96_in_45_Im),
                       .io_in_46_Re      (fft96_in_46_Re),
                       .io_in_46_Im      (fft96_in_46_Im),
                       .io_in_47_Re      (fft96_in_47_Re),
                       .io_in_47_Im      (fft96_in_47_Im),
                       .io_in_48_Re      (fft96_in_48_Re),
                       .io_in_48_Im      (fft96_in_48_Im),
                       .io_in_49_Re      (fft96_in_49_Re),
                       .io_in_49_Im      (fft96_in_49_Im),
                       .io_in_50_Re      (fft96_in_50_Re),
                       .io_in_50_Im      (fft96_in_50_Im),
                       .io_in_51_Re      (fft96_in_51_Re),
                       .io_in_51_Im      (fft96_in_51_Im),
                       .io_in_52_Re      (fft96_in_52_Re),
                       .io_in_52_Im      (fft96_in_52_Im),
                       .io_in_53_Re      (fft96_in_53_Re),
                       .io_in_53_Im      (fft96_in_53_Im),
                       .io_in_54_Re      (fft96_in_54_Re),
                       .io_in_54_Im      (fft96_in_54_Im),
                       .io_in_55_Re      (fft96_in_55_Re),
                       .io_in_55_Im      (fft96_in_55_Im),
                       .io_in_56_Re      (fft96_in_56_Re),
                       .io_in_56_Im      (fft96_in_56_Im),
                       .io_in_57_Re      (fft96_in_57_Re),
                       .io_in_57_Im      (fft96_in_57_Im),
                       .io_in_58_Re      (fft96_in_58_Re),
                       .io_in_58_Im      (fft96_in_58_Im),
                       .io_in_59_Re      (fft96_in_59_Re),
                       .io_in_59_Im      (fft96_in_59_Im),
                       .io_in_60_Re      (fft96_in_60_Re),
                       .io_in_60_Im      (fft96_in_60_Im),
                       .io_in_61_Re      (fft96_in_61_Re),
                       .io_in_61_Im      (fft96_in_61_Im),
                       .io_in_62_Re      (fft96_in_62_Re),
                       .io_in_62_Im      (fft96_in_62_Im),
                       .io_in_63_Re      (fft96_in_63_Re),
                       .io_in_63_Im      (fft96_in_63_Im),
                       .io_in_64_Re      (fft96_in_64_Re),
                       .io_in_64_Im      (fft96_in_64_Im),
                       .io_in_65_Re      (fft96_in_65_Re),
                       .io_in_65_Im      (fft96_in_65_Im),
                       .io_in_66_Re      (fft96_in_66_Re),
                       .io_in_66_Im      (fft96_in_66_Im),
                       .io_in_67_Re      (fft96_in_67_Re),
                       .io_in_67_Im      (fft96_in_67_Im),
                       .io_in_68_Re      (fft96_in_68_Re),
                       .io_in_68_Im      (fft96_in_68_Im),
                       .io_in_69_Re      (fft96_in_69_Re),
                       .io_in_69_Im      (fft96_in_69_Im),
                       .io_in_70_Re      (fft96_in_70_Re),
                       .io_in_70_Im      (fft96_in_70_Im),
                       .io_in_71_Re      (fft96_in_71_Re),
                       .io_in_71_Im      (fft96_in_71_Im),
                       .io_in_72_Re      (fft96_in_72_Re),
                       .io_in_72_Im      (fft96_in_72_Im),
                       .io_in_73_Re      (fft96_in_73_Re),
                       .io_in_73_Im      (fft96_in_73_Im),
                       .io_in_74_Re      (fft96_in_74_Re),
                       .io_in_74_Im      (fft96_in_74_Im),
                       .io_in_75_Re      (fft96_in_75_Re),
                       .io_in_75_Im      (fft96_in_75_Im),
                       .io_in_76_Re      (fft96_in_76_Re),
                       .io_in_76_Im      (fft96_in_76_Im),
                       .io_in_77_Re      (fft96_in_77_Re),
                       .io_in_77_Im      (fft96_in_77_Im),
                       .io_in_78_Re      (fft96_in_78_Re),
                       .io_in_78_Im      (fft96_in_78_Im),
                       .io_in_79_Re      (fft96_in_79_Re),
                       .io_in_79_Im      (fft96_in_79_Im),
                       .io_in_80_Re      (fft96_in_80_Re),
                       .io_in_80_Im      (fft96_in_80_Im),
                       .io_in_81_Re      (fft96_in_81_Re),
                       .io_in_81_Im      (fft96_in_81_Im),
                       .io_in_82_Re      (fft96_in_82_Re),
                       .io_in_82_Im      (fft96_in_82_Im),
                       .io_in_83_Re      (fft96_in_83_Re),
                       .io_in_83_Im      (fft96_in_83_Im),
                       .io_in_84_Re      (fft96_in_84_Re),
                       .io_in_84_Im      (fft96_in_84_Im),
                       .io_in_85_Re      (fft96_in_85_Re),
                       .io_in_85_Im      (fft96_in_85_Im),
                       .io_in_86_Re      (fft96_in_86_Re),
                       .io_in_86_Im      (fft96_in_86_Im),
                       .io_in_87_Re      (fft96_in_87_Re),
                       .io_in_87_Im      (fft96_in_87_Im),
                       .io_in_88_Re      (fft96_in_88_Re),
                       .io_in_88_Im      (fft96_in_88_Im),
                       .io_in_89_Re      (fft96_in_89_Re),
                       .io_in_89_Im      (fft96_in_89_Im),
                       .io_in_90_Re      (fft96_in_90_Re),
                       .io_in_90_Im      (fft96_in_90_Im),
                       .io_in_91_Re      (fft96_in_91_Re),
                       .io_in_91_Im      (fft96_in_91_Im),
                       .io_in_92_Re      (fft96_in_92_Re),
                       .io_in_92_Im      (fft96_in_92_Im),
                       .io_in_93_Re      (fft96_in_93_Re),
                       .io_in_93_Im      (fft96_in_93_Im),
                       .io_in_94_Re      (fft96_in_94_Re),
                       .io_in_94_Im      (fft96_in_94_Im),
                       .io_in_95_Re      (fft96_in_95_Re),
                       .io_in_95_Im      (fft96_in_95_Im),
                       .io_in_ready      (fft96_in_ready    ),
                       .io_out_validate  (fft96_out_validate),
                       .io_out_0_Re      (fft96_out_0_Re ),
                       .io_out_0_Im      (fft96_out_0_Im ),
                       .io_out_1_Re      (fft96_out_1_Re ),
                       .io_out_1_Im      (fft96_out_1_Im ),
                       .io_out_2_Re      (fft96_out_2_Re ),
                       .io_out_2_Im      (fft96_out_2_Im ),
                       .io_out_3_Re      (fft96_out_3_Re ),
                       .io_out_3_Im      (fft96_out_3_Im ),
                       .io_out_4_Re      (fft96_out_4_Re ),
                       .io_out_4_Im      (fft96_out_4_Im ),
                       .io_out_5_Re      (fft96_out_5_Re ),
                       .io_out_5_Im      (fft96_out_5_Im ),
                       .io_out_6_Re      (fft96_out_6_Re ),
                       .io_out_6_Im      (fft96_out_6_Im ),
                       .io_out_7_Re      (fft96_out_7_Re ),
                       .io_out_7_Im      (fft96_out_7_Im ),
                       .io_out_8_Re      (fft96_out_8_Re ),
                       .io_out_8_Im      (fft96_out_8_Im ),
                       .io_out_9_Re      (fft96_out_9_Re ),
                       .io_out_9_Im      (fft96_out_9_Im ),
                       .io_out_10_Re     (fft96_out_10_Re),
                       .io_out_10_Im     (fft96_out_10_Im),
                       .io_out_11_Re     (fft96_out_11_Re),
                       .io_out_11_Im     (fft96_out_11_Im),
                       .io_out_12_Re     (fft96_out_12_Re),
                       .io_out_12_Im     (fft96_out_12_Im),
                       .io_out_13_Re     (fft96_out_13_Re),
                       .io_out_13_Im     (fft96_out_13_Im),
                       .io_out_14_Re     (fft96_out_14_Re),
                       .io_out_14_Im     (fft96_out_14_Im),
                       .io_out_15_Re     (fft96_out_15_Re),
                       .io_out_15_Im     (fft96_out_15_Im),
                       .io_out_16_Re     (fft96_out_16_Re),
                       .io_out_16_Im     (fft96_out_16_Im),
                       .io_out_17_Re     (fft96_out_17_Re),
                       .io_out_17_Im     (fft96_out_17_Im),
                       .io_out_18_Re     (fft96_out_18_Re),
                       .io_out_18_Im     (fft96_out_18_Im),
                       .io_out_19_Re     (fft96_out_19_Re),
                       .io_out_19_Im     (fft96_out_19_Im),
                       .io_out_20_Re     (fft96_out_20_Re),
                       .io_out_20_Im     (fft96_out_20_Im),
                       .io_out_21_Re     (fft96_out_21_Re),
                       .io_out_21_Im     (fft96_out_21_Im),
                       .io_out_22_Re     (fft96_out_22_Re),
                       .io_out_22_Im     (fft96_out_22_Im),
                       .io_out_23_Re     (fft96_out_23_Re),
                       .io_out_23_Im     (fft96_out_23_Im),
                       .io_out_24_Re     (fft96_out_24_Re),
                       .io_out_24_Im     (fft96_out_24_Im),
                       .io_out_25_Re     (fft96_out_25_Re),
                       .io_out_25_Im     (fft96_out_25_Im),
                       .io_out_26_Re     (fft96_out_26_Re),
                       .io_out_26_Im     (fft96_out_26_Im),
                       .io_out_27_Re     (fft96_out_27_Re),
                       .io_out_27_Im     (fft96_out_27_Im),
                       .io_out_28_Re     (fft96_out_28_Re),
                       .io_out_28_Im     (fft96_out_28_Im),
                       .io_out_29_Re     (fft96_out_29_Re),
                       .io_out_29_Im     (fft96_out_29_Im),
                       .io_out_30_Re     (fft96_out_30_Re),
                       .io_out_30_Im     (fft96_out_30_Im),
                       .io_out_31_Re     (fft96_out_31_Re),
                       .io_out_31_Im     (fft96_out_31_Im),
                       .io_out_32_Re     (fft96_out_32_Re),
                       .io_out_32_Im     (fft96_out_32_Im),
                       .io_out_33_Re     (fft96_out_33_Re),
                       .io_out_33_Im     (fft96_out_33_Im),
                       .io_out_34_Re     (fft96_out_34_Re),
                       .io_out_34_Im     (fft96_out_34_Im),
                       .io_out_35_Re     (fft96_out_35_Re),
                       .io_out_35_Im     (fft96_out_35_Im),
                       .io_out_36_Re     (fft96_out_36_Re),
                       .io_out_36_Im     (fft96_out_36_Im),
                       .io_out_37_Re     (fft96_out_37_Re),
                       .io_out_37_Im     (fft96_out_37_Im),
                       .io_out_38_Re     (fft96_out_38_Re),
                       .io_out_38_Im     (fft96_out_38_Im),
                       .io_out_39_Re     (fft96_out_39_Re),
                       .io_out_39_Im     (fft96_out_39_Im),
                       .io_out_40_Re     (fft96_out_40_Re),
                       .io_out_40_Im     (fft96_out_40_Im),
                       .io_out_41_Re     (fft96_out_41_Re),
                       .io_out_41_Im     (fft96_out_41_Im),
                       .io_out_42_Re     (fft96_out_42_Re),
                       .io_out_42_Im     (fft96_out_42_Im),
                       .io_out_43_Re     (fft96_out_43_Re),
                       .io_out_43_Im     (fft96_out_43_Im),
                       .io_out_44_Re     (fft96_out_44_Re),
                       .io_out_44_Im     (fft96_out_44_Im),
                       .io_out_45_Re     (fft96_out_45_Re),
                       .io_out_45_Im     (fft96_out_45_Im),
                       .io_out_46_Re     (fft96_out_46_Re),
                       .io_out_46_Im     (fft96_out_46_Im),
                       .io_out_47_Re     (fft96_out_47_Re),
                       .io_out_47_Im     (fft96_out_47_Im),
                       .io_out_48_Re     (fft96_out_48_Re),
                       .io_out_48_Im     (fft96_out_48_Im),
                       .io_out_49_Re     (fft96_out_49_Re),
                       .io_out_49_Im     (fft96_out_49_Im),
                       .io_out_50_Re     (fft96_out_50_Re),
                       .io_out_50_Im     (fft96_out_50_Im),
                       .io_out_51_Re     (fft96_out_51_Re),
                       .io_out_51_Im     (fft96_out_51_Im),
                       .io_out_52_Re     (fft96_out_52_Re),
                       .io_out_52_Im     (fft96_out_52_Im),
                       .io_out_53_Re     (fft96_out_53_Re),
                       .io_out_53_Im     (fft96_out_53_Im),
                       .io_out_54_Re     (fft96_out_54_Re),
                       .io_out_54_Im     (fft96_out_54_Im),
                       .io_out_55_Re     (fft96_out_55_Re),
                       .io_out_55_Im     (fft96_out_55_Im),
                       .io_out_56_Re     (fft96_out_56_Re),
                       .io_out_56_Im     (fft96_out_56_Im),
                       .io_out_57_Re     (fft96_out_57_Re),
                       .io_out_57_Im     (fft96_out_57_Im),
                       .io_out_58_Re     (fft96_out_58_Re),
                       .io_out_58_Im     (fft96_out_58_Im),
                       .io_out_59_Re     (fft96_out_59_Re),
                       .io_out_59_Im     (fft96_out_59_Im),
                       .io_out_60_Re     (fft96_out_60_Re),
                       .io_out_60_Im     (fft96_out_60_Im),
                       .io_out_61_Re     (fft96_out_61_Re),
                       .io_out_61_Im     (fft96_out_61_Im),
                       .io_out_62_Re     (fft96_out_62_Re),
                       .io_out_62_Im     (fft96_out_62_Im),
                       .io_out_63_Re     (fft96_out_63_Re),
                       .io_out_63_Im     (fft96_out_63_Im),
                       .io_out_64_Re     (fft96_out_64_Re),
                       .io_out_64_Im     (fft96_out_64_Im),
                       .io_out_65_Re     (fft96_out_65_Re),
                       .io_out_65_Im     (fft96_out_65_Im),
                       .io_out_66_Re     (fft96_out_66_Re),
                       .io_out_66_Im     (fft96_out_66_Im),
                       .io_out_67_Re     (fft96_out_67_Re),
                       .io_out_67_Im     (fft96_out_67_Im),
                       .io_out_68_Re     (fft96_out_68_Re),
                       .io_out_68_Im     (fft96_out_68_Im),
                       .io_out_69_Re     (fft96_out_69_Re),
                       .io_out_69_Im     (fft96_out_69_Im),
                       .io_out_70_Re     (fft96_out_70_Re),
                       .io_out_70_Im     (fft96_out_70_Im),
                       .io_out_71_Re     (fft96_out_71_Re),
                       .io_out_71_Im     (fft96_out_71_Im),
                       .io_out_72_Re     (fft96_out_72_Re),
                       .io_out_72_Im     (fft96_out_72_Im),
                       .io_out_73_Re     (fft96_out_73_Re),
                       .io_out_73_Im     (fft96_out_73_Im),
                       .io_out_74_Re     (fft96_out_74_Re),
                       .io_out_74_Im     (fft96_out_74_Im),
                       .io_out_75_Re     (fft96_out_75_Re),
                       .io_out_75_Im     (fft96_out_75_Im),
                       .io_out_76_Re     (fft96_out_76_Re),
                       .io_out_76_Im     (fft96_out_76_Im),
                       .io_out_77_Re     (fft96_out_77_Re),
                       .io_out_77_Im     (fft96_out_77_Im),
                       .io_out_78_Re     (fft96_out_78_Re),
                       .io_out_78_Im     (fft96_out_78_Im),
                       .io_out_79_Re     (fft96_out_79_Re),
                       .io_out_79_Im     (fft96_out_79_Im),
                       .io_out_80_Re     (fft96_out_80_Re),
                       .io_out_80_Im     (fft96_out_80_Im),
                       .io_out_81_Re     (fft96_out_81_Re),
                       .io_out_81_Im     (fft96_out_81_Im),
                       .io_out_82_Re     (fft96_out_82_Re),
                       .io_out_82_Im     (fft96_out_82_Im),
                       .io_out_83_Re     (fft96_out_83_Re),
                       .io_out_83_Im     (fft96_out_83_Im),
                       .io_out_84_Re     (fft96_out_84_Re),
                       .io_out_84_Im     (fft96_out_84_Im),
                       .io_out_85_Re     (fft96_out_85_Re),
                       .io_out_85_Im     (fft96_out_85_Im),
                       .io_out_86_Re     (fft96_out_86_Re),
                       .io_out_86_Im     (fft96_out_86_Im),
                       .io_out_87_Re     (fft96_out_87_Re),
                       .io_out_87_Im     (fft96_out_87_Im),
                       .io_out_88_Re     (fft96_out_88_Re),
                       .io_out_88_Im     (fft96_out_88_Im),
                       .io_out_89_Re     (fft96_out_89_Re),
                       .io_out_89_Im     (fft96_out_89_Im),
                       .io_out_90_Re     (fft96_out_90_Re),
                       .io_out_90_Im     (fft96_out_90_Im),
                       .io_out_91_Re     (fft96_out_91_Re),
                       .io_out_91_Im     (fft96_out_91_Im),
                       .io_out_92_Re     (fft96_out_92_Re),
                       .io_out_92_Im     (fft96_out_92_Im),
                       .io_out_93_Re     (fft96_out_93_Re),
                       .io_out_93_Im     (fft96_out_93_Im),
                       .io_out_94_Re     (fft96_out_94_Re),
                       .io_out_94_Im     (fft96_out_94_Im),
                       .io_out_95_Re     (fft96_out_95_Re),
                       .io_out_95_Im     (fft96_out_95_Im));

endmodule
