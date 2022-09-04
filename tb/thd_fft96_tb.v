//*********************************************************************************************//
//----------------    2D-FFT Testbench   ----------------------------------------------------////
//---------------- Author: Xiaokun Yang  ----------------------------------------------------////
//---------------- Lawrence Berkeley Lab ----------------------------------------------------////
//---------------- Date: 7/25/2022 ----------------------------------------------------------//// 
//----- Version 1: 2D FFT96 For Non-Streming Input ------------------------------------------////
//----- Date: 7/27/2022 ---------------------------------------------------------------------////
//----- Version 2:                                                   ------------------------////
//----- Date:           ---------------------------------------------------------------------////
//*********************************************************************************************//
//----- This testbench support verification to the following designs based on                  //
//the defines in the tcl script:                                                               //
//---------------------------------------------------------------------------------------------//
//----- THD_FFT96                                                                               //
//----- The dut is non-streaming FFT96 based on the 1D FFT96 instances                         //
//----- Latency: 324 clock cycles                                                              //
//----- Hardware cost: 1,526 FP Adders, 356 FP Multipliers, 36,864-Word Memory                 //
//---------------------------------------------------------------------------------------------//
//----- THD_FFT96_2_3:  streaming widths w1=2, w2=3                                             //
//----- THD_FFT96_4_6:  streaming widths w1=2, w2=3                                             //
//----- THD_FFT96_8_12: streaming widths w1=2, w2=3                                             //
//----- THD_FFT96_16_24:streaming widths w1=2, w2=3                                             //
//----- THD_FFT96_32_48:streaming widths w1=2, w2=3                                             //
//----- The dut is non-streaming FFT96                                                         //
//---------------------------------------------------------------------------------------------//
//*********************************************************************************************//
`define TEST_SIZE 100
`define FFT_LEN   96
`define GOLDEN_THD_FFT96   //for golden input and output

`ifdef THD_FFT96_2_3
    `define FFT_ST_WT2        //this is thw streaming width "w", used for interfacing
    `define FFT_WT 2          //this number is the DFT streaming weight "w", used for data fed in 
`endif

`ifdef THD_FFT96_4_6
    `define FFT_ST_WT2
    `define FFT_ST_WT4
    `define FFT_WT 4 
`endif

`ifdef THD_FFT96_8_12
    `define FFT_ST_WT2
    `define FFT_ST_WT4 
    `define FFT_ST_WT8 
    `define FFT_WT 8
`endif 

`ifdef THD_FFT9696_16_24
    `define FFT_ST_WT2
    `define FFT_ST_WT4 
    `define FFT_ST_WT8 
    `define FFT_ST_WT16 
    `define FFT_WT 16
`endif 

`ifdef THD_FFT96_32_48
    `define FFT_ST_WT2
    `define FFT_ST_WT4 
    `define FFT_ST_WT8 
    `define FFT_ST_WT16 
    `define FFT_ST_WT32 
    `define FFT_WT 32
`endif

`ifdef THD_FFT96
    `define FFT_ST_WT2
    `define FFT_ST_WT4 
    `define FFT_ST_WT8 
    `define FFT_ST_WT16 
    `define FFT_ST_WT32 
    `define FFT_ST_WT96 
    `define FFT_WT 96
`endif

module thd_fft96_tb();
  reg         clock           ;
  reg         reset           ;
  reg         io_in_ready     ;
  wire        io_out_validate ;
  wire        io_out_finish   ;

//---------------------------------------------------------
//--- wire and reg declaration 
//---------------------------------------------------------
`ifdef FFT_ST_WT2
  reg  [31:0] io_in_0_Re ;
  reg  [31:0] io_in_0_Im ;
  reg  [31:0] io_in_1_Re ;
  reg  [31:0] io_in_1_Im ;
  reg  [31:0] io_in_2_Re ;
  reg  [31:0] io_in_2_Im ;
  wire [31:0] io_out_0_Re;
  wire [31:0] io_out_0_Im;
  wire [31:0] io_out_1_Re;
  wire [31:0] io_out_1_Im;
  wire [31:0] io_out_2_Re;
  wire [31:0] io_out_2_Im;
    `ifdef FFT_ST_WT4
  reg  [31:0] io_in_3_Re ;
  reg  [31:0] io_in_3_Im ;
  reg  [31:0] io_in_4_Re ;
  reg  [31:0] io_in_4_Im ;
  reg  [31:0] io_in_5_Re ;
  reg  [31:0] io_in_5_Im ;
  wire [31:0] io_out_3_Re;
  wire [31:0] io_out_3_Im;
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
        `ifdef FFT_ST_WT16
  reg  [31:0] io_in_8_Re ;
  reg  [31:0] io_in_8_Im ;
  reg  [31:0] io_in_9_Re ;
  reg  [31:0] io_in_9_Im ;
  reg  [31:0] io_in_10_Re ;
  reg  [31:0] io_in_10_Im ;
  reg  [31:0] io_in_11_Re ;
  reg  [31:0] io_in_11_Im ;
  reg  [31:0] io_in_12_Re ;
  reg  [31:0] io_in_12_Im ;
  reg  [31:0] io_in_13_Re ;
  reg  [31:0] io_in_13_Im ;
  reg  [31:0] io_in_14_Re ;
  reg  [31:0] io_in_14_Im ;
  reg  [31:0] io_in_15_Re ;
  reg  [31:0] io_in_15_Im ;
  wire [31:0] io_out_8_Re ;
  wire [31:0] io_out_8_Im ;
  wire [31:0] io_out_9_Re ;
  wire [31:0] io_out_9_Im ;
  wire [31:0] io_out_10_Re ;
  wire [31:0] io_out_10_Im ;
  wire [31:0] io_out_11_Re ;
  wire [31:0] io_out_11_Im ;
  wire [31:0] io_out_12_Re ;
  wire [31:0] io_out_12_Im ;
  wire [31:0] io_out_13_Re ;
  wire [31:0] io_out_13_Im ;
  wire [31:0] io_out_14_Re ;
  wire [31:0] io_out_14_Im ;
  wire [31:0] io_out_15_Re ;
  wire [31:0] io_out_15_Im ;
           `ifdef FFT_ST_WT32 
  reg  [31:0] io_in_16_Re ;
  reg  [31:0] io_in_16_Im ;
  reg  [31:0] io_in_17_Re ;
  reg  [31:0] io_in_17_Im ;
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
  wire [31:0] io_out_16_Re ;
  wire [31:0] io_out_16_Im ;
  wire [31:0] io_out_17_Re ;
  wire [31:0] io_out_17_Im ;
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
            `ifdef FFT_ST_WT96 
  reg  [31:0] io_in_32_Re ;
  reg  [31:0] io_in_32_Im ;
  reg  [31:0] io_in_33_Re ;
  reg  [31:0] io_in_33_Im ;
  reg  [31:0] io_in_34_Re ;
  reg  [31:0] io_in_34_Im ;
  reg  [31:0] io_in_35_Re ;
  reg  [31:0] io_in_35_Im ;
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
  wire [31:0] io_out_32_Re ;
  wire [31:0] io_out_32_Im ;
  wire [31:0] io_out_33_Re ;
  wire [31:0] io_out_33_Im ;
  wire [31:0] io_out_34_Re ;
  wire [31:0] io_out_34_Im ;
  wire [31:0] io_out_35_Re ;
  wire [31:0] io_out_35_Im ; 
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



//---------------------------------------------------------
//--- golden model and input file 
//---------------------------------------------------------
reg [31:0]  output_io_out[2*`FFT_LEN*`FFT_LEN*`TEST_SIZE-1:0];
reg [31:0]  input_io_in[2*`FFT_LEN*`FFT_LEN*`TEST_SIZE-1:0];

//---------------------------------------------------------
//--- Load memory array 
//---------------------------------------------------------
initial begin
`ifdef GOLDEN_THD_FFT96
   //$readmemh("../golden/golden_2d_fft96/inputfile.txt" ,input_io_in);
   //$readmemh("../golden/golden_2d_fft96/outputfile.txt",output_io_out);
   $readmemh("../golden/3D-96x96x96-Golden-Model/inputfile.txt" ,input_io_in);
   $readmemh("../golden/3D-96x96x96-Golden-Model/outputfile.txt",output_io_out);
`endif
end


//---------------------------------------------------------
//--- Instantiation 
//---------------------------------------------------------
`ifdef THD_FFT96_2_3
thd_fft96_2_3 u_thd_fft96_2_3 (
`elsif THD_FFT96_4_6
thd_fft96_4_6 u_thd_fft96_4_6   (
`elsif THD_FFT96_8_12
thd_fft96_8_12 u_thd_fft96_8_12   (
`elsif THD_FFT96_16_24
thd_fft96_16_24 u_thd_fft96_16_24   (
`elsif THD_FFT96_32_48
thd_fft96_32_48 u_thd_fft96_32_48   (
`elsif THD_FFT96
thd_fft96 u_thd_fft96   (
		 .io_out_finish   (io_out_finish   ),
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
  `ifdef FFT_ST_WT4
	         ,
                 .io_in_2_Re      (io_in_2_Re      ),
                 .io_in_2_Im      (io_in_2_Im      ),
		 .io_in_3_Re      (io_in_3_Re      ),
                 .io_in_3_Im      (io_in_3_Im      ),
                 .io_out_2_Re     (io_out_2_Re     ),
                 .io_out_2_Im     (io_out_2_Im     ),
                 .io_out_3_Re      (io_out_3_Re    ),
                 .io_out_3_Im      (io_out_3_Im    )
      `ifdef FFT_ST_WT8
	         ,
                 .io_in_4_Re      (io_in_4_Re      ),
                 .io_in_4_Im      (io_in_4_Im      ),
                 .io_in_5_Re      (io_in_5_Re      ),
                 .io_in_5_Im      (io_in_5_Im      ),
		 .io_in_6_Re      (io_in_6_Re      ),
                 .io_in_6_Im      (io_in_6_Im      ),
                 .io_in_7_Re      (io_in_7_Re      ),
                 .io_in_7_Im      (io_in_7_Im      ),
                 .io_out_4_Re     (io_out_4_Re     ),
                 .io_out_4_Im     (io_out_4_Im     ),
                 .io_out_5_Re     (io_out_5_Re     ),
                 .io_out_5_Im     (io_out_5_Im     ),
                 .io_out_6_Re     (io_out_6_Re     ),
                 .io_out_6_Im     (io_out_6_Im     ),
                 .io_out_7_Re     (io_out_7_Re     ),
                 .io_out_7_Im     (io_out_7_Im     )
        `ifdef FFT_ST_WT16
		 ,
                 .io_in_8_Re      (io_in_8_Re      ),
                 .io_in_8_Im      (io_in_8_Im      ),
                 .io_in_9_Re      (io_in_9_Re      ),
                 .io_in_9_Im      (io_in_9_Im      ),
                 .io_in_10_Re     (io_in_10_Re     ),
                 .io_in_10_Im     (io_in_10_Im     ),
                 .io_in_11_Re     (io_in_11_Re     ),
                 .io_in_11_Im     (io_in_11_Im     ),
                 .io_in_12_Re     (io_in_12_Re     ),
                 .io_in_12_Im     (io_in_12_Im     ),
                 .io_in_13_Re     (io_in_13_Re     ),
                 .io_in_13_Im     (io_in_13_Im     ),
                 .io_in_14_Re     (io_in_14_Re     ),
                 .io_in_14_Im     (io_in_14_Im     ),
                 .io_in_15_Re     (io_in_15_Re     ),
                 .io_in_15_Im     (io_in_15_Im     ),
		 .io_out_8_Re     (io_out_8_Re     ),
                 .io_out_8_Im     (io_out_8_Im     ),
                 .io_out_9_Re     (io_out_9_Re     ),
                 .io_out_9_Im     (io_out_9_Im     ),
                 .io_out_10_Re    (io_out_10_Re    ),
                 .io_out_10_Im    (io_out_10_Im    ),
                 .io_out_11_Re    (io_out_11_Re    ),
                 .io_out_11_Im    (io_out_11_Im    ),
                 .io_out_12_Re    (io_out_12_Re    ),
                 .io_out_12_Im    (io_out_12_Im    ),
                 .io_out_13_Re    (io_out_13_Re    ),
                 .io_out_13_Im    (io_out_13_Im    ),
                 .io_out_14_Re    (io_out_14_Re    ),
                 .io_out_14_Im    (io_out_14_Im    ),
                 .io_out_15_Re    (io_out_15_Re    ),
                 .io_out_15_Im    (io_out_15_Im    )
           `ifdef FFT_ST_WT32
	         ,
                 .io_in_16_Re     (io_in_16_Re     ),
                 .io_in_16_Im     (io_in_16_Im     ),
                 .io_in_17_Re     (io_in_17_Re     ),
                 .io_in_17_Im     (io_in_17_Im     ),
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
		 .io_out_16_Re    (io_out_16_Re    ),
                 .io_out_16_Im    (io_out_16_Im    ),
                 .io_out_17_Re    (io_out_17_Re    ),
                 .io_out_17_Im    (io_out_17_Im    ),
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
                 .io_out_26_Im    (io_out_26_Im    ),
		 .io_out_27_Re    (io_out_27_Re    ),
                 .io_out_27_Im    (io_out_27_Im    ),
                 .io_out_28_Re    (io_out_28_Re    ),
                 .io_out_28_Im    (io_out_28_Im    ),
                 .io_out_29_Re    (io_out_29_Re    ),
                 .io_out_29_Im    (io_out_29_Im    ),
                 .io_out_30_Re    (io_out_30_Re    ),
                 .io_out_30_Im    (io_out_30_Im    ),
                 .io_out_31_Re    (io_out_31_Re    ),
                 .io_out_31_Im    (io_out_31_Im    )
           `ifdef FFT_ST_WT96 
	         ,
                 .io_in_32_Re     (io_in_32_Re    ),
                 .io_in_32_Im     (io_in_32_Im    ),
                 .io_in_33_Re     (io_in_33_Re    ),
                 .io_in_33_Im     (io_in_33_Im    ),
                 .io_in_34_Re     (io_in_34_Re    ),
                 .io_in_34_Im     (io_in_34_Im    ),
                 .io_in_35_Re     (io_in_35_Re    ),
                 .io_in_35_Im     (io_in_35_Im    ),
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
		 .io_out_32_Re    (io_out_32_Re   ),
                 .io_out_32_Im    (io_out_32_Im   ),
                 .io_out_33_Re    (io_out_33_Re   ),
                 .io_out_33_Im    (io_out_33_Im   ),
                 .io_out_34_Re    (io_out_34_Re   ),
                 .io_out_34_Im    (io_out_34_Im   ),
                 .io_out_35_Re    (io_out_35_Re   ),
                 .io_out_35_Im    (io_out_35_Im   ),
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
);


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
   io_in_2_Re = 32'h0;
   io_in_2_Im = 32'h0;
    `ifdef FFT_ST_WT4
   io_in_3_Re = 32'h0;
   io_in_3_Im = 32'h0;
      `ifdef FFT_ST_WT8
   io_in_4_Re = 32'h0;
   io_in_4_Im = 32'h0;
   io_in_5_Re = 32'h0;
   io_in_5_Im = 32'h0;
   io_in_6_Re = 32'h0;
   io_in_6_Im = 32'h0;
   io_in_7_Re = 32'h0;
   io_in_7_Im = 32'h0;
        `ifdef FFT_ST_WT16
   io_in_8_Re = 32'h0;
   io_in_8_Im = 32'h0;
   io_in_9_Re = 32'h0;
   io_in_9_Im = 32'h0;
   io_in_10_Re = 32'h0;
   io_in_10_Im = 32'h0;
   io_in_11_Re = 32'h0;
   io_in_11_Im = 32'h0;
   io_in_12_Re = 32'h0;
   io_in_12_Im = 32'h0;
   io_in_13_Re = 32'h0;
   io_in_13_Im = 32'h0;
   io_in_14_Re = 32'h0;
   io_in_14_Im = 32'h0;
   io_in_15_Re = 32'h0;
   io_in_15_Im = 32'h0;
           `ifdef FFT_ST_WT32
   io_in_16_Re = 32'h0; 
   io_in_16_Im = 32'h0; 
   io_in_17_Re = 32'h0; 
   io_in_17_Im = 32'h0; 
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
             `ifdef FFT_ST_WT96
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
end
endtask

integer i,j,m,n;
always #10 clock = ~clock;
initial begin
   i=0;j=0;
   reset = 1'b1;
   clock = 1'b0;
   io_in_ready = 1'b0;
   initial_input(); // call the initial_input task
   #100;
   reset = 1'b0;
   #11; 
  for (i=0; i<2*`FFT_LEN*`FFT_LEN*`TEST_SIZE; i=i+2*`FFT_LEN*`FFT_LEN) begin
    for (j=0; j<2*`FFT_LEN*`FFT_LEN; j=j+2*`FFT_WT) begin
     io_in_ready = 1'b1;
`ifdef FFT_ST_WT2
     io_in_0_Re = input_io_in[i+j+0] ;
     io_in_0_Im = input_io_in[i+j+1] ;
     io_in_1_Re = input_io_in[i+j+2] ;
     io_in_1_Im = input_io_in[i+j+3] ;
     io_in_2_Re = input_io_in[i+j+4] ;
     io_in_2_Im = input_io_in[i+j+5] ;
  `ifdef FFT_ST_WT4
     io_in_3_Re = input_io_in[i+j+6] ;
     io_in_3_Im = input_io_in[i+j+7] ;
     io_in_4_Re = input_io_in[i+j+8] ;
     io_in_4_Im = input_io_in[i+j+9] ;
     io_in_5_Re = input_io_in[i+j+10];
     io_in_5_Im = input_io_in[i+j+11];
    `ifdef FFT_ST_WT8
     io_in_6_Re = input_io_in[i+j+12];
     io_in_6_Im = input_io_in[i+j+13];
     io_in_7_Re = input_io_in[i+j+14];
     io_in_7_Im = input_io_in[i+j+15];
        `ifdef FFT_ST_WT16
     io_in_8_Re  = input_io_in[i+j+16];
     io_in_8_Im  = input_io_in[i+j+17];
     io_in_9_Re  = input_io_in[i+j+18];
     io_in_9_Im  = input_io_in[i+j+19];
     io_in_10_Re = input_io_in[i+j+20];
     io_in_10_Im = input_io_in[i+j+21];
     io_in_11_Re = input_io_in[i+j+22];
     io_in_11_Im = input_io_in[i+j+23];
     io_in_12_Re = input_io_in[i+j+24];
     io_in_12_Im = input_io_in[i+j+25];
     io_in_13_Re = input_io_in[i+j+26];
     io_in_13_Im = input_io_in[i+j+27];
     io_in_14_Re = input_io_in[i+j+28];
     io_in_14_Im = input_io_in[i+j+29];
     io_in_15_Re = input_io_in[i+j+30];
     io_in_15_Im = input_io_in[i+j+31];
        `ifdef FFT_ST_WT32
     io_in_16_Re = input_io_in[i+j+32];
     io_in_16_Im = input_io_in[i+j+33];
     io_in_17_Re = input_io_in[i+j+34];
     io_in_17_Im = input_io_in[i+j+35];
     io_in_18_Re = input_io_in[i+j+36];                        
     io_in_18_Im = input_io_in[i+j+37];                        
     io_in_19_Re = input_io_in[i+j+38];                        
     io_in_19_Im = input_io_in[i+j+39];                        
     io_in_20_Re = input_io_in[i+j+40];
     io_in_20_Im = input_io_in[i+j+41];
     io_in_21_Re = input_io_in[i+j+42];
     io_in_21_Im = input_io_in[i+j+43];
     io_in_22_Re = input_io_in[i+j+44];
     io_in_22_Im = input_io_in[i+j+45];
     io_in_23_Re = input_io_in[i+j+46];
     io_in_23_Im = input_io_in[i+j+47];
     io_in_24_Re = input_io_in[i+j+48];
     io_in_24_Im = input_io_in[i+j+49];
     io_in_25_Re = input_io_in[i+j+50];
     io_in_25_Im = input_io_in[i+j+51];
     io_in_26_Re = input_io_in[i+j+52];                       
     io_in_26_Im = input_io_in[i+j+53];                       
          `ifdef FFT_ST_WT96
     io_in_27_Re = input_io_in[i+j+54];                            
     io_in_27_Im = input_io_in[i+j+55];                            
     io_in_28_Re = input_io_in[i+j+56];                            
     io_in_28_Im = input_io_in[i+j+57];                            
     io_in_29_Re = input_io_in[i+j+58];                            
     io_in_29_Im = input_io_in[i+j+59];                            
     io_in_30_Re = input_io_in[i+j+60];
     io_in_30_Im = input_io_in[i+j+61];
     io_in_31_Re = input_io_in[i+j+62];
     io_in_31_Im = input_io_in[i+j+63];
     io_in_32_Re = input_io_in[i+j+64];
     io_in_32_Im = input_io_in[i+j+65];
     io_in_33_Re = input_io_in[i+j+66];
     io_in_33_Im = input_io_in[i+j+67];
     io_in_34_Re = input_io_in[i+j+68];
     io_in_34_Im = input_io_in[i+j+69];
     io_in_35_Re = input_io_in[i+j+70];
     io_in_35_Im = input_io_in[i+j+71];
     io_in_36_Re = input_io_in[i+j+72];
     io_in_36_Im = input_io_in[i+j+73];
     io_in_37_Re = input_io_in[i+j+74];
     io_in_37_Im = input_io_in[i+j+75];
     io_in_38_Re = input_io_in[i+j+76];
     io_in_38_Im = input_io_in[i+j+77];
     io_in_39_Re = input_io_in[i+j+78];
     io_in_39_Im = input_io_in[i+j+79];
     io_in_40_Re = input_io_in[i+j+80];
     io_in_40_Im = input_io_in[i+j+81];
     io_in_41_Re = input_io_in[i+j+82];
     io_in_41_Im = input_io_in[i+j+83];
     io_in_42_Re = input_io_in[i+j+84];
     io_in_42_Im = input_io_in[i+j+85];
     io_in_43_Re = input_io_in[i+j+86];
     io_in_43_Im = input_io_in[i+j+87];
     io_in_44_Re = input_io_in[i+j+88];
     io_in_44_Im = input_io_in[i+j+89];
     io_in_45_Re = input_io_in[i+j+90];
     io_in_45_Im = input_io_in[i+j+91];
     io_in_46_Re = input_io_in[i+j+92];
     io_in_46_Im = input_io_in[i+j+93];
     io_in_47_Re = input_io_in[i+j+94];
     io_in_47_Im = input_io_in[i+j+95];
     io_in_48_Re = input_io_in[i+j+96];
     io_in_48_Im = input_io_in[i+j+97];
     io_in_49_Re = input_io_in[i+j+98];
     io_in_49_Im = input_io_in[i+j+99];
     io_in_50_Re = input_io_in[i+j+100];
     io_in_50_Im = input_io_in[i+j+101];
     io_in_51_Re = input_io_in[i+j+102];
     io_in_51_Im = input_io_in[i+j+103];
     io_in_52_Re = input_io_in[i+j+104];
     io_in_52_Im = input_io_in[i+j+105];
     io_in_53_Re = input_io_in[i+j+106];
     io_in_53_Im = input_io_in[i+j+107];
     io_in_54_Re = input_io_in[i+j+108];
     io_in_54_Im = input_io_in[i+j+109];
     io_in_55_Re = input_io_in[i+j+110];
     io_in_55_Im = input_io_in[i+j+111];
     io_in_56_Re = input_io_in[i+j+112];
     io_in_56_Im = input_io_in[i+j+113];
     io_in_57_Re = input_io_in[i+j+114];
     io_in_57_Im = input_io_in[i+j+115];
     io_in_58_Re = input_io_in[i+j+116];
     io_in_58_Im = input_io_in[i+j+117];
     io_in_59_Re = input_io_in[i+j+118];
     io_in_59_Im = input_io_in[i+j+119];
     io_in_60_Re = input_io_in[i+j+120];
     io_in_60_Im = input_io_in[i+j+121];
     io_in_61_Re = input_io_in[i+j+122];
     io_in_61_Im = input_io_in[i+j+123];
     io_in_62_Re = input_io_in[i+j+124];
     io_in_62_Im = input_io_in[i+j+125];
     io_in_63_Re = input_io_in[i+j+126];
     io_in_63_Im = input_io_in[i+j+127];
     io_in_64_Re = input_io_in[i+j+128];
     io_in_64_Im = input_io_in[i+j+129];
     io_in_65_Re = input_io_in[i+j+130];
     io_in_65_Im = input_io_in[i+j+131];
     io_in_66_Re = input_io_in[i+j+132];
     io_in_66_Im = input_io_in[i+j+133];
     io_in_67_Re = input_io_in[i+j+134];
     io_in_67_Im = input_io_in[i+j+135];
     io_in_68_Re = input_io_in[i+j+136];
     io_in_68_Im = input_io_in[i+j+137];
     io_in_69_Re = input_io_in[i+j+138];
     io_in_69_Im = input_io_in[i+j+139];
     io_in_70_Re = input_io_in[i+j+140];
     io_in_70_Im = input_io_in[i+j+141];
     io_in_71_Re = input_io_in[i+j+142];
     io_in_71_Im = input_io_in[i+j+143];
     io_in_72_Re = input_io_in[i+j+144];
     io_in_72_Im = input_io_in[i+j+145];
     io_in_73_Re = input_io_in[i+j+146];
     io_in_73_Im = input_io_in[i+j+147];
     io_in_74_Re = input_io_in[i+j+148];
     io_in_74_Im = input_io_in[i+j+149];
     io_in_75_Re = input_io_in[i+j+150];
     io_in_75_Im = input_io_in[i+j+151];
     io_in_76_Re = input_io_in[i+j+152];
     io_in_76_Im = input_io_in[i+j+153];
     io_in_77_Re = input_io_in[i+j+154];
     io_in_77_Im = input_io_in[i+j+155];
     io_in_78_Re = input_io_in[i+j+156];
     io_in_78_Im = input_io_in[i+j+157];
     io_in_79_Re = input_io_in[i+j+158];
     io_in_79_Im = input_io_in[i+j+159];
     io_in_80_Re = input_io_in[i+j+160];
     io_in_80_Im = input_io_in[i+j+161];
     io_in_81_Re = input_io_in[i+j+162];
     io_in_81_Im = input_io_in[i+j+163];
     io_in_82_Re = input_io_in[i+j+164];
     io_in_82_Im = input_io_in[i+j+165];
     io_in_83_Re = input_io_in[i+j+166];
     io_in_83_Im = input_io_in[i+j+167];
     io_in_84_Re = input_io_in[i+j+168];
     io_in_84_Im = input_io_in[i+j+169];
     io_in_85_Re = input_io_in[i+j+170];
     io_in_85_Im = input_io_in[i+j+171];
     io_in_86_Re = input_io_in[i+j+172];
     io_in_86_Im = input_io_in[i+j+173];
     io_in_87_Re = input_io_in[i+j+174];
     io_in_87_Im = input_io_in[i+j+175];
     io_in_88_Re = input_io_in[i+j+176];
     io_in_88_Im = input_io_in[i+j+177];
     io_in_89_Re = input_io_in[i+j+178];
     io_in_89_Im = input_io_in[i+j+179];
     io_in_90_Re = input_io_in[i+j+180];
     io_in_90_Im = input_io_in[i+j+181];
     io_in_91_Re = input_io_in[i+j+182];
     io_in_91_Im = input_io_in[i+j+183];
     io_in_92_Re = input_io_in[i+j+184];
     io_in_92_Im = input_io_in[i+j+185];
     io_in_93_Re = input_io_in[i+j+186];
     io_in_93_Im = input_io_in[i+j+187];
     io_in_94_Re = input_io_in[i+j+188];
     io_in_94_Im = input_io_in[i+j+189];
     io_in_95_Re = input_io_in[i+j+190];
     io_in_95_Im = input_io_in[i+j+191];
	  `endif
        `endif
      `endif
    `endif
  `endif
`endif
     @(posedge clock);
    end
`ifdef THD_FFT96
   io_in_ready = 1'b0;
   initial_input();
   do begin
     @(posedge clock);
   end while (~io_out_finish);
`else
`endif
  end
  io_in_ready = 1'b0;
  initial_input();
end


//---------------------------------------------------------------------
//------- Monitor -----------------------------------------------------
//---------------------------------------------------------------------
reg check_pass;
reg check_fft_len2, check_fft_len4, check_fft_len8, check_fft_len16, check_fft_len32, check_fft_len96;

reg debug[2*`FFT_WT-1:0];

initial begin
  m=0;n=0;
  do begin
    @(negedge clock);
  end while (~io_out_validate);
  for (m=0; m<2*`FFT_LEN*`FFT_LEN*`TEST_SIZE; m=m+2*`FFT_LEN*`FFT_LEN) begin
    for (n=0; n<2*`FFT_LEN*`FFT_LEN; n=n+2*`FFT_WT) begin
`ifdef FFT_ST_WT2
check_fft_len2 =  ((io_out_0_Re[31:16]==output_io_out[m+n][31:16]  ) | (io_out_0_Re[31:16]==output_io_out[m+n][31:16]  +16'h1) | (io_out_0_Re[31:16]==output_io_out[m+n][31:16]  -16'h1)) &
                  ((io_out_0_Im[31:16]==output_io_out[m+n+1][31:16]) | (io_out_0_Im[31:16]==output_io_out[m+n+1][31:16]+16'h1) | (io_out_0_Im[31:16]==output_io_out[m+n+1][31:16]-16'h1)) &
                  ((io_out_1_Re[31:16]==output_io_out[m+n+2][31:16]) | (io_out_1_Re[31:16]==output_io_out[m+n+2][31:16]+16'h1) | (io_out_1_Re[31:16]==output_io_out[m+n+2][31:16]-16'h1)) &
                  ((io_out_1_Im[31:16]==output_io_out[m+n+3][31:16]) | (io_out_1_Im[31:16]==output_io_out[m+n+3][31:16]+16'h1) | (io_out_1_Im[31:16]==output_io_out[m+n+3][31:16]-16'h1)) ;
  `ifdef FFT_ST_WT4
check_fft_len4 =  ((io_out_2_Re[31:16]==output_io_out[m+n+4][31:16]) | (io_out_2_Re[31:16]==output_io_out[m+n+4][31:16]+16'h1) | (io_out_2_Re[31:16]==output_io_out[m+n+4][31:16]-16'h1)) &
                  ((io_out_2_Im[31:16]==output_io_out[m+n+5][31:16]) | (io_out_2_Im[31:16]==output_io_out[m+n+5][31:16]+16'h1) | (io_out_2_Im[31:16]==output_io_out[m+n+5][31:16]-16'h1)) &
                  ((io_out_3_Re[31:16]==output_io_out[m+n+6][31:16]) | (io_out_3_Re[31:16]==output_io_out[m+n+6][31:16]+16'h1) | (io_out_3_Re[31:16]==output_io_out[m+n+6][31:16]-16'h1)) &
                  ((io_out_3_Im[31:16]==output_io_out[m+n+7][31:16]) | (io_out_3_Im[31:16]==output_io_out[m+n+7][31:16]+16'h1) | (io_out_3_Im[31:16]==output_io_out[m+n+7][31:16]-16'h1)) ;
    `ifdef FFT_ST_WT8
check_fft_len8 =  ((io_out_4_Re[31:16]<output_io_out[m+n+8][31:16] +16'h3) & (io_out_4_Re[31:16]>output_io_out[m+n+8][31:16] -16'h3)) & 
                  ((io_out_4_Im[31:16]<output_io_out[m+n+9][31:16] +16'h3) & (io_out_4_Im[31:16]>output_io_out[m+n+9][31:16] -16'h3)) & 
                  ((io_out_5_Re[31:16]<output_io_out[m+n+10][31:16]+16'h3) & (io_out_5_Re[31:16]>output_io_out[m+n+10][31:16]-16'h3)) &
                  ((io_out_5_Im[31:16]<output_io_out[m+n+11][31:16]+16'h3) & (io_out_5_Im[31:16]>output_io_out[m+n+11][31:16]-16'h3)) &
                  ((io_out_6_Re[31:16]<output_io_out[m+n+12][31:16]+16'h3) & (io_out_6_Re[31:16]>output_io_out[m+n+12][31:16]-16'h3)) &
                  ((io_out_6_Im[31:16]<output_io_out[m+n+13][31:16]+16'h3) & (io_out_6_Im[31:16]>output_io_out[m+n+13][31:16]-16'h3)) &
                  ((io_out_7_Re[31:16]<output_io_out[m+n+14][31:16]+16'h3) & (io_out_7_Re[31:16]>output_io_out[m+n+14][31:16]-16'h3)) &
                  ((io_out_7_Im[31:16]<output_io_out[m+n+15][31:16]+16'h3) & (io_out_7_Im[31:16]>output_io_out[m+n+15][31:16]-16'h3)) ;
      `ifdef FFT_ST_WT16
check_fft_len16 = ((io_out_8_Re[31:16] <output_io_out[m+n+16][31:16]+16'h3) & (io_out_8_Re[31:16] >output_io_out[m+n+16][31:16]-16'h3)) &
                  ((io_out_8_Im[31:16] <output_io_out[m+n+17][31:16]+16'h3) & (io_out_8_Im[31:16] >output_io_out[m+n+17][31:16]-16'h3)) &
                  ((io_out_9_Re[31:16] <output_io_out[m+n+18][31:16]+16'h3) & (io_out_9_Re[31:16] >output_io_out[m+n+18][31:16]-16'h3)) &
                  ((io_out_9_Im[31:16] <output_io_out[m+n+19][31:16]+16'h3) & (io_out_9_Im[31:16] >output_io_out[m+n+19][31:16]-16'h3)) &
                  ((io_out_10_Re[31:16]<output_io_out[m+n+20][31:16]+16'h3) & (io_out_10_Re[31:16]>output_io_out[m+n+20][31:16]-16'h3)) &
                  ((io_out_10_Im[31:16]<output_io_out[m+n+21][31:16]+16'h3) & (io_out_10_Im[31:16]>output_io_out[m+n+21][31:16]-16'h3)) &
                  ((io_out_11_Re[31:16]<output_io_out[m+n+22][31:16]+16'h3) & (io_out_11_Re[31:16]>output_io_out[m+n+22][31:16]-16'h3)) &
                  ((io_out_11_Im[31:16]<output_io_out[m+n+23][31:16]+16'h3) & (io_out_11_Im[31:16]>output_io_out[m+n+23][31:16]-16'h3)) &
                  ((io_out_12_Re[31:16]<output_io_out[m+n+24][31:16]+16'h3) & (io_out_12_Re[31:16]>output_io_out[m+n+24][31:16]-16'h3)) & 
                  ((io_out_12_Im[31:16]<output_io_out[m+n+25][31:16]+16'h3) & (io_out_12_Im[31:16]>output_io_out[m+n+25][31:16]-16'h3)) & 
                  ((io_out_13_Re[31:16]<output_io_out[m+n+26][31:16]+16'h3) & (io_out_13_Re[31:16]>output_io_out[m+n+26][31:16]-16'h3)) &
                  ((io_out_13_Im[31:16]<output_io_out[m+n+27][31:16]+16'h3) & (io_out_13_Im[31:16]>output_io_out[m+n+27][31:16]-16'h3)) &
                  ((io_out_14_Re[31:16]<output_io_out[m+n+28][31:16]+16'h3) & (io_out_14_Re[31:16]>output_io_out[m+n+28][31:16]-16'h3)) &
                  ((io_out_14_Im[31:16]<output_io_out[m+n+29][31:16]+16'h3) & (io_out_14_Im[31:16]>output_io_out[m+n+29][31:16]-16'h3)) &
                  ((io_out_15_Re[31:16]<output_io_out[m+n+30][31:16]+16'h3) & (io_out_15_Re[31:16]>output_io_out[m+n+30][31:16]-16'h3)) &
                  ((io_out_15_Im[31:16]<output_io_out[m+n+31][31:16]+16'h3) & (io_out_15_Im[31:16]>output_io_out[m+n+31][31:16]-16'h3)) ;
        `ifdef FFT_ST_WT32
check_fft_len32 = ((io_out_16_Re[31:16]<output_io_out[m+n+32][31:16]+16'h3) & (io_out_16_Re[31:16]>output_io_out[m+n+32][31:16]-16'h3)) &
                  ((io_out_16_Im[31:16]<output_io_out[m+n+33][31:16]+16'h3) & (io_out_16_Im[31:16]>output_io_out[m+n+33][31:16]-16'h3)) &
                  ((io_out_17_Re[31:16]<output_io_out[m+n+34][31:16]+16'h3) & (io_out_17_Re[31:16]>output_io_out[m+n+34][31:16]-16'h3)) &
                  ((io_out_17_Im[31:16]<output_io_out[m+n+35][31:16]+16'h3) & (io_out_17_Im[31:16]>output_io_out[m+n+35][31:16]-16'h3)) &
                  ((io_out_18_Re[31:16]<output_io_out[m+n+36][31:16]+16'h3) & (io_out_18_Re[31:16]>output_io_out[m+n+36][31:16]-16'h3)) &
                  ((io_out_18_Im[31:16]<output_io_out[m+n+37][31:16]+16'h3) & (io_out_18_Im[31:16]>output_io_out[m+n+37][31:16]-16'h3)) &
                  ((io_out_19_Re[31:16]<output_io_out[m+n+38][31:16]+16'h3) & (io_out_19_Re[31:16]>output_io_out[m+n+38][31:16]-16'h3)) &
                  ((io_out_19_Im[31:16]<output_io_out[m+n+39][31:16]+16'h3) & (io_out_19_Im[31:16]>output_io_out[m+n+39][31:16]-16'h3)) &
                  ((io_out_20_Re[31:16]<output_io_out[m+n+40][31:16]+16'h3) & (io_out_20_Re[31:16]>output_io_out[m+n+40][31:16]-16'h3)) &
                  ((io_out_20_Im[31:16]<output_io_out[m+n+41][31:16]+16'h3) & (io_out_20_Im[31:16]>output_io_out[m+n+41][31:16]-16'h3)) & 
                  ((io_out_21_Re[31:16]<output_io_out[m+n+42][31:16]+16'h3) & (io_out_21_Re[31:16]>output_io_out[m+n+42][31:16]-16'h3)) &
                  ((io_out_21_Im[31:16]<output_io_out[m+n+43][31:16]+16'h3) & (io_out_21_Im[31:16]>output_io_out[m+n+43][31:16]-16'h3)) &
                  ((io_out_22_Re[31:16]<output_io_out[m+n+44][31:16]+16'h3) & (io_out_22_Re[31:16]>output_io_out[m+n+44][31:16]-16'h3)) &
                  ((io_out_22_Im[31:16]<output_io_out[m+n+45][31:16]+16'h3) & (io_out_22_Im[31:16]>output_io_out[m+n+45][31:16]-16'h3)) &
                  ((io_out_23_Re[31:16]<output_io_out[m+n+46][31:16]+16'h3) & (io_out_23_Re[31:16]>output_io_out[m+n+46][31:16]-16'h3)) &
                  ((io_out_23_Im[31:16]<output_io_out[m+n+47][31:16]+16'h3) & (io_out_23_Im[31:16]>output_io_out[m+n+47][31:16]-16'h3)) &
                  ((io_out_24_Re[31:16]<output_io_out[m+n+48][31:16]+16'h3) & (io_out_24_Re[31:16]>output_io_out[m+n+48][31:16]-16'h3)) &
                  ((io_out_24_Im[31:16]<output_io_out[m+n+49][31:16]+16'h3) & (io_out_24_Im[31:16]>output_io_out[m+n+49][31:16]-16'h3)) &
                  ((io_out_25_Re[31:16]<output_io_out[m+n+50][31:16]+16'h3) & (io_out_25_Re[31:16]>output_io_out[m+n+50][31:16]-16'h3)) &
                  ((io_out_25_Im[31:16]<output_io_out[m+n+51][31:16]+16'h3) & (io_out_25_Im[31:16]>output_io_out[m+n+51][31:16]-16'h3)) & 
                  ((io_out_26_Re[31:16]<output_io_out[m+n+52][31:16]+16'h3) & (io_out_26_Re[31:16]>output_io_out[m+n+52][31:16]-16'h3)) &
                  ((io_out_26_Im[31:16]<output_io_out[m+n+53][31:16]+16'h3) & (io_out_26_Im[31:16]>output_io_out[m+n+53][31:16]-16'h3)) & 
                  ((io_out_27_Re[31:16]<output_io_out[m+n+54][31:16]+16'h3) & (io_out_27_Re[31:16]>output_io_out[m+n+54][31:16]-16'h3)) &
                  ((io_out_27_Im[31:16]<output_io_out[m+n+55][31:16]+16'h3) & (io_out_27_Im[31:16]>output_io_out[m+n+55][31:16]-16'h3)) &
                  ((io_out_28_Re[31:16]<output_io_out[m+n+56][31:16]+16'h3) & (io_out_28_Re[31:16]>output_io_out[m+n+56][31:16]-16'h3)) &
                  ((io_out_28_Im[31:16]<output_io_out[m+n+57][31:16]+16'h3) & (io_out_28_Im[31:16]>output_io_out[m+n+57][31:16]-16'h3)) &
                  ((io_out_29_Re[31:16]<output_io_out[m+n+58][31:16]+16'h3) & (io_out_29_Re[31:16]>output_io_out[m+n+58][31:16]-16'h3)) &
                  ((io_out_29_Im[31:16]<output_io_out[m+n+59][31:16]+16'h3) & (io_out_29_Im[31:16]>output_io_out[m+n+59][31:16]-16'h3)) &
                  ((io_out_30_Re[31:16]<output_io_out[m+n+60][31:16]+16'h3) & (io_out_30_Re[31:16]>output_io_out[m+n+60][31:16]-16'h3)) &
                  ((io_out_30_Im[31:16]<output_io_out[m+n+61][31:16]+16'h3) & (io_out_30_Im[31:16]>output_io_out[m+n+61][31:16]-16'h3)) & 
                  ((io_out_31_Re[31:16]<output_io_out[m+n+62][31:16]+16'h3) & (io_out_31_Re[31:16]>output_io_out[m+n+62][31:16]-16'h3)) &
                  ((io_out_31_Im[31:16]<output_io_out[m+n+63][31:16]+16'h3) & (io_out_31_Im[31:16]>output_io_out[m+n+63][31:16]-16'h3)) ;
          `ifdef FFT_ST_WT96
check_fft_len96 =  ((io_out_32_Re[31:16]<output_io_out[m+n+64][31:16]+16'h3) & (io_out_32_Re[31:16]>output_io_out[m+n+64][31:16]-16'h3)) &
                   ((io_out_32_Im[31:16]<output_io_out[m+n+65][31:16]+16'h3) & (io_out_32_Im[31:16]>output_io_out[m+n+65][31:16]-16'h3)) &
                   ((io_out_33_Re[31:16]<output_io_out[m+n+66][31:16]+16'h3) & (io_out_33_Re[31:16]>output_io_out[m+n+66][31:16]-16'h3)) &
                   ((io_out_33_Im[31:16]<output_io_out[m+n+67][31:16]+16'h3) & (io_out_33_Im[31:16]>output_io_out[m+n+67][31:16]-16'h3)) &
                   ((io_out_34_Re[31:16]<output_io_out[m+n+68][31:16]+16'h3) & (io_out_34_Re[31:16]>output_io_out[m+n+68][31:16]-16'h3)) &
                   ((io_out_34_Im[31:16]<output_io_out[m+n+69][31:16]+16'h3) & (io_out_34_Im[31:16]>output_io_out[m+n+69][31:16]-16'h3)) &
                   ((io_out_35_Re[31:16]<output_io_out[m+n+70][31:16]+16'h3) & (io_out_35_Re[31:16]>output_io_out[m+n+70][31:16]-16'h3)) &
                   ((io_out_35_Im[31:16]<output_io_out[m+n+71][31:16]+16'h3) & (io_out_35_Im[31:16]>output_io_out[m+n+71][31:16]-16'h3)) &
                   ((io_out_36_Re[31:16]<output_io_out[m+n+72][31:16]+16'h3) & (io_out_36_Re[31:16]>output_io_out[m+n+72][31:16]-16'h3)) &
                   ((io_out_36_Im[31:16]<output_io_out[m+n+73][31:16]+16'h3) & (io_out_36_Im[31:16]>output_io_out[m+n+73][31:16]-16'h3)) &
                   ((io_out_37_Im[31:16]<output_io_out[m+n+74][31:16]+16'h3) & (io_out_37_Im[31:16]>output_io_out[m+n+74][31:16]-16'h3)) &
                   ((io_out_37_Re[31:16]<output_io_out[m+n+75][31:16]+16'h3) & (io_out_37_Re[31:16]>output_io_out[m+n+75][31:16]-16'h3)) &
                   ((io_out_38_Im[31:16]<output_io_out[m+n+76][31:16]+16'h3) & (io_out_38_Im[31:16]>output_io_out[m+n+76][31:16]-16'h3)) &
                   ((io_out_38_Im[31:16]<output_io_out[m+n+77][31:16]+16'h3) & (io_out_38_Im[31:16]>output_io_out[m+n+77][31:16]-16'h3)) &
                   ((io_out_39_Im[31:16]<output_io_out[m+n+78][31:16]+16'h3) & (io_out_39_Im[31:16]>output_io_out[m+n+78][31:16]-16'h3)) &
                   ((io_out_39_Im[31:16]<output_io_out[m+n+79][31:16]+16'h3) & (io_out_39_Im[31:16]>output_io_out[m+n+79][31:16]-16'h3)) &
                   ((io_out_40_Re[31:16]<output_io_out[m+n+80][31:16]+16'h3) & (io_out_40_Re[31:16]>output_io_out[m+n+80][31:16]-16'h3)) &
                   ((io_out_40_Im[31:16]<output_io_out[m+n+81][31:16]+16'h3) & (io_out_40_Im[31:16]>output_io_out[m+n+81][31:16]-16'h3)) &
                   ((io_out_41_Re[31:16]<output_io_out[m+n+82][31:16]+16'h3) & (io_out_41_Re[31:16]>output_io_out[m+n+82][31:16]-16'h3)) &
                   ((io_out_41_Im[31:16]<output_io_out[m+n+83][31:16]+16'h3) & (io_out_41_Im[31:16]>output_io_out[m+n+83][31:16]-16'h3)) &
                   ((io_out_42_Re[31:16]<output_io_out[m+n+84][31:16]+16'h3) & (io_out_42_Re[31:16]>output_io_out[m+n+84][31:16]-16'h3)) &
                   ((io_out_42_Im[31:16]<output_io_out[m+n+85][31:16]+16'h3) & (io_out_42_Im[31:16]>output_io_out[m+n+85][31:16]-16'h3)) & 
                   ((io_out_43_Re[31:16]<output_io_out[m+n+86][31:16]+16'h3) & (io_out_43_Re[31:16]>output_io_out[m+n+86][31:16]-16'h3)) &
                   ((io_out_43_Im[31:16]<output_io_out[m+n+87][31:16]+16'h3) & (io_out_43_Im[31:16]>output_io_out[m+n+87][31:16]-16'h3)) &
                   ((io_out_44_Re[31:16]<output_io_out[m+n+88][31:16]+16'h3) & (io_out_44_Re[31:16]>output_io_out[m+n+88][31:16]-16'h3)) &
                   ((io_out_44_Im[31:16]<output_io_out[m+n+89][31:16]+16'h3) & (io_out_44_Im[31:16]>output_io_out[m+n+89][31:16]-16'h3)) &
                   ((io_out_45_Re[31:16]<output_io_out[m+n+90][31:16]+16'h3) & (io_out_45_Re[31:16]>output_io_out[m+n+90][31:16]-16'h3)) &
                   ((io_out_45_Im[31:16]<output_io_out[m+n+91][31:16]+16'h3) & (io_out_45_Im[31:16]>output_io_out[m+n+91][31:16]-16'h3)) &
                   ((io_out_46_Re[31:16]<output_io_out[m+n+92][31:16]+16'h3) & (io_out_46_Re[31:16]>output_io_out[m+n+92][31:16]-16'h3)) &
                   ((io_out_46_Im[31:16]<output_io_out[m+n+93][31:16]+16'h3) & (io_out_46_Im[31:16]>output_io_out[m+n+93][31:16]-16'h3)) &
                   ((io_out_47_Re[31:16]<output_io_out[m+n+94][31:16]+16'h3) & (io_out_47_Re[31:16]>output_io_out[m+n+94][31:16]-16'h3)) &
                   ((io_out_47_Re[31:16]<output_io_out[m+n+95][31:16]+16'h3) & (io_out_47_Re[31:16]>output_io_out[m+n+95][31:16]-16'h3)) &
                   ((io_out_48_Im[31:16]<output_io_out[m+n+96][31:16]+16'h3) & (io_out_48_Im[31:16]>output_io_out[m+n+96][31:16]-16'h3)) &
                   ((io_out_48_Re[31:16]<output_io_out[m+n+97][31:16]+16'h3) & (io_out_48_Re[31:16]>output_io_out[m+n+97][31:16]-16'h3)) &
                   ((io_out_49_Im[31:16]<output_io_out[m+n+98][31:16]+16'h3) & (io_out_49_Im[31:16]>output_io_out[m+n+98][31:16]-16'h3)) &
                   ((io_out_49_Re[31:16]<output_io_out[m+n+99][31:16]+16'h3) & (io_out_49_Re[31:16]>output_io_out[m+n+99][31:16]-16'h3)) &
                   ((io_out_50_Im[31:16]<output_io_out[m+n+100][31:16]+16'h3) & (io_out_50_Im[31:16]>output_io_out[m+n+100][31:16]-16'h3)) & 
                   ((io_out_50_Re[31:16]<output_io_out[m+n+101][31:16]+16'h3) & (io_out_50_Re[31:16]>output_io_out[m+n+101][31:16]-16'h3)) &
                   ((io_out_51_Im[31:16]<output_io_out[m+n+102][31:16]+16'h3) & (io_out_51_Im[31:16]>output_io_out[m+n+102][31:16]-16'h3)) &
                   ((io_out_51_Re[31:16]<output_io_out[m+n+103][31:16]+16'h3) & (io_out_51_Re[31:16]>output_io_out[m+n+103][31:16]-16'h3)) &
                   ((io_out_52_Im[31:16]<output_io_out[m+n+104][31:16]+16'h3) & (io_out_52_Im[31:16]>output_io_out[m+n+104][31:16]-16'h3)) &
                   ((io_out_52_Re[31:16]<output_io_out[m+n+105][31:16]+16'h3) & (io_out_52_Re[31:16]>output_io_out[m+n+105][31:16]-16'h3)) &
                   ((io_out_53_Im[31:16]<output_io_out[m+n+106][31:16]+16'h3) & (io_out_53_Im[31:16]>output_io_out[m+n+106][31:16]-16'h3)) &
                   ((io_out_53_Re[31:16]<output_io_out[m+n+107][31:16]+16'h3) & (io_out_53_Re[31:16]>output_io_out[m+n+107][31:16]-16'h3)) &
                   ((io_out_54_Im[31:16]<output_io_out[m+n+108][31:16]+16'h3) & (io_out_54_Im[31:16]>output_io_out[m+n+108][31:16]-16'h3)) &
                   ((io_out_54_Re[31:16]<output_io_out[m+n+109][31:16]+16'h3) & (io_out_54_Re[31:16]>output_io_out[m+n+109][31:16]-16'h3)) &
                   ((io_out_55_Re[31:16]<output_io_out[m+n+110][31:16]+16'h3) & (io_out_55_Re[31:16]>output_io_out[m+n+110][31:16]-16'h3)) &
                   ((io_out_55_Im[31:16]<output_io_out[m+n+111][31:16]+16'h3) & (io_out_55_Im[31:16]>output_io_out[m+n+111][31:16]-16'h3)) &
                   ((io_out_56_Re[31:16]<output_io_out[m+n+112][31:16]+16'h3) & (io_out_56_Re[31:16]>output_io_out[m+n+112][31:16]-16'h3)) &
                   ((io_out_56_Im[31:16]<output_io_out[m+n+113][31:16]+16'h3) & (io_out_56_Im[31:16]>output_io_out[m+n+113][31:16]-16'h3)) &
                   ((io_out_57_Re[31:16]<output_io_out[m+n+114][31:16]+16'h3) & (io_out_57_Re[31:16]>output_io_out[m+n+114][31:16]-16'h3)) &
                   ((io_out_57_Im[31:16]<output_io_out[m+n+115][31:16]+16'h3) & (io_out_57_Im[31:16]>output_io_out[m+n+115][31:16]-16'h3)) & 
                   ((io_out_58_Re[31:16]<output_io_out[m+n+116][31:16]+16'h3) & (io_out_58_Re[31:16]>output_io_out[m+n+116][31:16]-16'h3)) &
                   ((io_out_58_Im[31:16]<output_io_out[m+n+117][31:16]+16'h3) & (io_out_58_Im[31:16]>output_io_out[m+n+117][31:16]-16'h3)) &
                   ((io_out_59_Re[31:16]<output_io_out[m+n+118][31:16]+16'h3) & (io_out_59_Re[31:16]>output_io_out[m+n+118][31:16]-16'h3)) &
                   ((io_out_59_Im[31:16]<output_io_out[m+n+119][31:16]+16'h3) & (io_out_59_Im[31:16]>output_io_out[m+n+119][31:16]-16'h3)) &
                   ((io_out_60_Re[31:16]<output_io_out[m+n+120][31:16]+16'h3) & (io_out_60_Re[31:16]>output_io_out[m+n+120][31:16]-16'h3)) &
                   ((io_out_60_Im[31:16]<output_io_out[m+n+121][31:16]+16'h3) & (io_out_60_Im[31:16]>output_io_out[m+n+121][31:16]-16'h3)) &
                   ((io_out_61_Re[31:16]<output_io_out[m+n+122][31:16]+16'h3) & (io_out_61_Re[31:16]>output_io_out[m+n+122][31:16]-16'h3)) &
                   ((io_out_61_Im[31:16]<output_io_out[m+n+123][31:16]+16'h3) & (io_out_61_Im[31:16]>output_io_out[m+n+123][31:16]-16'h3)) &
                   ((io_out_62_Re[31:16]<output_io_out[m+n+124][31:16]+16'h3) & (io_out_62_Re[31:16]>output_io_out[m+n+124][31:16]-16'h3)) &
                   ((io_out_62_Re[31:16]<output_io_out[m+n+125][31:16]+16'h3) & (io_out_62_Re[31:16]>output_io_out[m+n+125][31:16]-16'h3)) &
                   ((io_out_63_Im[31:16]<output_io_out[m+n+126][31:16]+16'h3) & (io_out_63_Im[31:16]>output_io_out[m+n+126][31:16]-16'h3)) &
                   ((io_out_63_Re[31:16]<output_io_out[m+n+127][31:16]+16'h3) & (io_out_63_Re[31:16]>output_io_out[m+n+127][31:16]-16'h3)) &
                   ((io_out_64_Im[31:16]<output_io_out[m+n+128][31:16]+16'h3) & (io_out_64_Im[31:16]>output_io_out[m+n+128][31:16]-16'h3)) &
                   ((io_out_64_Re[31:16]<output_io_out[m+n+129][31:16]+16'h3) & (io_out_64_Re[31:16]>output_io_out[m+n+129][31:16]-16'h3)) &
                   ((io_out_65_Im[31:16]<output_io_out[m+n+130][31:16]+16'h3) & (io_out_65_Im[31:16]>output_io_out[m+n+130][31:16]-16'h3)) & 
                   ((io_out_65_Re[31:16]<output_io_out[m+n+131][31:16]+16'h3) & (io_out_65_Re[31:16]>output_io_out[m+n+131][31:16]-16'h3)) &
                   ((io_out_66_Im[31:16]<output_io_out[m+n+132][31:16]+16'h3) & (io_out_66_Im[31:16]>output_io_out[m+n+132][31:16]-16'h3)) &
                   ((io_out_66_Re[31:16]<output_io_out[m+n+133][31:16]+16'h3) & (io_out_66_Re[31:16]>output_io_out[m+n+133][31:16]-16'h3)) &
                   ((io_out_67_Im[31:16]<output_io_out[m+n+134][31:16]+16'h3) & (io_out_67_Im[31:16]>output_io_out[m+n+134][31:16]-16'h3)) &
                   ((io_out_67_Re[31:16]<output_io_out[m+n+135][31:16]+16'h3) & (io_out_67_Re[31:16]>output_io_out[m+n+135][31:16]-16'h3)) &
                   ((io_out_68_Im[31:16]<output_io_out[m+n+136][31:16]+16'h3) & (io_out_68_Im[31:16]>output_io_out[m+n+136][31:16]-16'h3)) &
                   ((io_out_68_Re[31:16]<output_io_out[m+n+137][31:16]+16'h3) & (io_out_68_Re[31:16]>output_io_out[m+n+137][31:16]-16'h3)) &
                   ((io_out_69_Im[31:16]<output_io_out[m+n+138][31:16]+16'h3) & (io_out_69_Im[31:16]>output_io_out[m+n+138][31:16]-16'h3)) &
                   ((io_out_69_Re[31:16]<output_io_out[m+n+139][31:16]+16'h3) & (io_out_69_Re[31:16]>output_io_out[m+n+139][31:16]-16'h3)) &
                   ((io_out_70_Im[31:16]<output_io_out[m+n+140][31:16]+16'h3) & (io_out_70_Im[31:16]>output_io_out[m+n+140][31:16]-16'h3)) &
                   ((io_out_70_Re[31:16]<output_io_out[m+n+141][31:16]+16'h3) & (io_out_70_Re[31:16]>output_io_out[m+n+141][31:16]-16'h3)) &
                   ((io_out_71_Im[31:16]<output_io_out[m+n+142][31:16]+16'h3) & (io_out_71_Im[31:16]>output_io_out[m+n+142][31:16]-16'h3)) &
                   ((io_out_71_Re[31:16]<output_io_out[m+n+143][31:16]+16'h3) & (io_out_71_Re[31:16]>output_io_out[m+n+143][31:16]-16'h3)) &
                   ((io_out_72_Im[31:16]<output_io_out[m+n+144][31:16]+16'h3) & (io_out_72_Im[31:16]>output_io_out[m+n+144][31:16]-16'h3)) & 
                   ((io_out_72_Re[31:16]<output_io_out[m+n+145][31:16]+16'h3) & (io_out_72_Re[31:16]>output_io_out[m+n+145][31:16]-16'h3)) &
                   ((io_out_73_Im[31:16]<output_io_out[m+n+146][31:16]+16'h3) & (io_out_73_Im[31:16]>output_io_out[m+n+146][31:16]-16'h3)) &
                   ((io_out_73_Re[31:16]<output_io_out[m+n+147][31:16]+16'h3) & (io_out_73_Re[31:16]>output_io_out[m+n+147][31:16]-16'h3)) &
                   ((io_out_74_Im[31:16]<output_io_out[m+n+148][31:16]+16'h3) & (io_out_74_Im[31:16]>output_io_out[m+n+148][31:16]-16'h3)) &
                   ((io_out_74_Re[31:16]<output_io_out[m+n+149][31:16]+16'h3) & (io_out_74_Re[31:16]>output_io_out[m+n+149][31:16]-16'h3)) &
                   ((io_out_75_Im[31:16]<output_io_out[m+n+150][31:16]+16'h3) & (io_out_75_Im[31:16]>output_io_out[m+n+150][31:16]-16'h3)) &
                   ((io_out_75_Re[31:16]<output_io_out[m+n+151][31:16]+16'h3) & (io_out_75_Re[31:16]>output_io_out[m+n+151][31:16]-16'h3)) &
                   ((io_out_76_Im[31:16]<output_io_out[m+n+152][31:16]+16'h3) & (io_out_76_Im[31:16]>output_io_out[m+n+152][31:16]-16'h3)) &
                   ((io_out_76_Re[31:16]<output_io_out[m+n+153][31:16]+16'h3) & (io_out_76_Re[31:16]>output_io_out[m+n+153][31:16]-16'h3)) &
                   ((io_out_77_Im[31:16]<output_io_out[m+n+154][31:16]+16'h3) & (io_out_77_Im[31:16]>output_io_out[m+n+154][31:16]-16'h3)) &
                   ((io_out_77_Re[31:16]<output_io_out[m+n+155][31:16]+16'h3) & (io_out_77_Re[31:16]>output_io_out[m+n+155][31:16]-16'h3)) &
                   ((io_out_78_Im[31:16]<output_io_out[m+n+156][31:16]+16'h3) & (io_out_78_Im[31:16]>output_io_out[m+n+156][31:16]-16'h3)) &
                   ((io_out_78_Re[31:16]<output_io_out[m+n+157][31:16]+16'h3) & (io_out_78_Re[31:16]>output_io_out[m+n+157][31:16]-16'h3)) &
                   ((io_out_79_Im[31:16]<output_io_out[m+n+158][31:16]+16'h3) & (io_out_79_Im[31:16]>output_io_out[m+n+158][31:16]-16'h3)) &
                   ((io_out_79_Re[31:16]<output_io_out[m+n+159][31:16]+16'h3) & (io_out_79_Re[31:16]>output_io_out[m+n+159][31:16]-16'h3)) &
                   ((io_out_80_Im[31:16]<output_io_out[m+n+160][31:16]+16'h3) & (io_out_80_Im[31:16]>output_io_out[m+n+160][31:16]-16'h3)) & 
                   ((io_out_80_Re[31:16]<output_io_out[m+n+161][31:16]+16'h3) & (io_out_80_Re[31:16]>output_io_out[m+n+161][31:16]-16'h3)) &
                   ((io_out_81_Im[31:16]<output_io_out[m+n+162][31:16]+16'h3) & (io_out_81_Im[31:16]>output_io_out[m+n+162][31:16]-16'h3)) &
                   ((io_out_81_Re[31:16]<output_io_out[m+n+163][31:16]+16'h3) & (io_out_81_Re[31:16]>output_io_out[m+n+163][31:16]-16'h3)) &
                   ((io_out_82_Im[31:16]<output_io_out[m+n+164][31:16]+16'h3) & (io_out_82_Im[31:16]>output_io_out[m+n+164][31:16]-16'h3)) &
                   ((io_out_82_Re[31:16]<output_io_out[m+n+165][31:16]+16'h3) & (io_out_82_Re[31:16]>output_io_out[m+n+165][31:16]-16'h3)) &
                   ((io_out_83_Im[31:16]<output_io_out[m+n+166][31:16]+16'h3) & (io_out_83_Im[31:16]>output_io_out[m+n+166][31:16]-16'h3)) &
                   ((io_out_83_Re[31:16]<output_io_out[m+n+167][31:16]+16'h3) & (io_out_83_Re[31:16]>output_io_out[m+n+167][31:16]-16'h3)) &
                   ((io_out_84_Im[31:16]<output_io_out[m+n+168][31:16]+16'h3) & (io_out_84_Im[31:16]>output_io_out[m+n+168][31:16]-16'h3)) &
                   ((io_out_84_Re[31:16]<output_io_out[m+n+169][31:16]+16'h3) & (io_out_84_Re[31:16]>output_io_out[m+n+169][31:16]-16'h3)) &
                   ((io_out_85_Re[31:16]<output_io_out[m+n+170][31:16]+16'h3) & (io_out_85_Re[31:16]>output_io_out[m+n+170][31:16]-16'h3)) &
                   ((io_out_85_Im[31:16]<output_io_out[m+n+171][31:16]+16'h3) & (io_out_85_Im[31:16]>output_io_out[m+n+171][31:16]-16'h3)) &
                   ((io_out_86_Re[31:16]<output_io_out[m+n+172][31:16]+16'h3) & (io_out_86_Re[31:16]>output_io_out[m+n+172][31:16]-16'h3)) &
                   ((io_out_86_Im[31:16]<output_io_out[m+n+173][31:16]+16'h3) & (io_out_86_Im[31:16]>output_io_out[m+n+173][31:16]-16'h3)) &
                   ((io_out_87_Re[31:16]<output_io_out[m+n+174][31:16]+16'h3) & (io_out_87_Re[31:16]>output_io_out[m+n+174][31:16]-16'h3)) &
                   ((io_out_87_Im[31:16]<output_io_out[m+n+175][31:16]+16'h3) & (io_out_87_Im[31:16]>output_io_out[m+n+175][31:16]-16'h3)) & 
                   ((io_out_88_Re[31:16]<output_io_out[m+n+176][31:16]+16'h3) & (io_out_88_Re[31:16]>output_io_out[m+n+176][31:16]-16'h3)) &
                   ((io_out_88_Im[31:16]<output_io_out[m+n+177][31:16]+16'h3) & (io_out_88_Im[31:16]>output_io_out[m+n+177][31:16]-16'h3)) &
                   ((io_out_89_Re[31:16]<output_io_out[m+n+178][31:16]+16'h3) & (io_out_89_Re[31:16]>output_io_out[m+n+178][31:16]-16'h3)) &
                   ((io_out_89_Im[31:16]<output_io_out[m+n+179][31:16]+16'h3) & (io_out_89_Im[31:16]>output_io_out[m+n+179][31:16]-16'h3)) &
                   ((io_out_90_Re[31:16]<output_io_out[m+n+180][31:16]+16'h3) & (io_out_90_Re[31:16]>output_io_out[m+n+180][31:16]-16'h3)) &
                   ((io_out_90_Im[31:16]<output_io_out[m+n+181][31:16]+16'h3) & (io_out_90_Im[31:16]>output_io_out[m+n+181][31:16]-16'h3)) &
                   ((io_out_91_Re[31:16]<output_io_out[m+n+182][31:16]+16'h3) & (io_out_91_Re[31:16]>output_io_out[m+n+182][31:16]-16'h3)) &
                   ((io_out_91_Im[31:16]<output_io_out[m+n+183][31:16]+16'h3) & (io_out_91_Im[31:16]>output_io_out[m+n+183][31:16]-16'h3)) &
                   ((io_out_92_Re[31:16]<output_io_out[m+n+184][31:16]+16'h3) & (io_out_92_Re[31:16]>output_io_out[m+n+184][31:16]-16'h3)) &
                   ((io_out_92_Im[31:16]<output_io_out[m+n+185][31:16]+16'h3) & (io_out_92_Im[31:16]>output_io_out[m+n+185][31:16]-16'h3)) & 
                   ((io_out_93_Re[31:16]<output_io_out[m+n+186][31:16]+16'h3) & (io_out_93_Re[31:16]>output_io_out[m+n+186][31:16]-16'h3)) &
                   ((io_out_93_Im[31:16]<output_io_out[m+n+187][31:16]+16'h3) & (io_out_93_Im[31:16]>output_io_out[m+n+187][31:16]-16'h3)) & 
                   ((io_out_94_Re[31:16]<output_io_out[m+n+188][31:16]+16'h3) & (io_out_94_Re[31:16]>output_io_out[m+n+188][31:16]-16'h3)) &
                   ((io_out_94_Im[31:16]<output_io_out[m+n+189][31:16]+16'h3) & (io_out_94_Im[31:16]>output_io_out[m+n+189][31:16]-16'h3)) & 
                   ((io_out_95_Re[31:16]<output_io_out[m+n+190][31:16]+16'h3) & (io_out_95_Re[31:16]>output_io_out[m+n+190][31:16]-16'h3)) &
                   ((io_out_95_Im[31:16]<output_io_out[m+n+191][31:16]+16'h3) & (io_out_95_Im[31:16]>output_io_out[m+n+191][31:16]-16'h3)) ;
	  `endif                                         
        `endif                                           
      `endif                                             
    `endif                                               
  `endif
`endif
	    

`ifdef FFT_ST_WT2
check_pass = check_fft_len2 ;
`elsif FFT_ST_WT4
check_pass = check_fft_len2 & check_fft_len4 ;
`elsif FFT_ST_WT8
check_pass = check_fft_len2 & check_fft_len4  & check_fft_len8 ;
`elsif FFT_ST_WT16
check_pass = check_fft_len2 & check_fft_len4 & check_fft_len8 & check_fft_len16 ;
`elsif FFT_ST_WT32
check_pass = check_fft_len2 & check_fft_len4 & check_fft_len8 & check_fft_len16 check_fft_len32;
`elsif FFT_ST_WT96
check_pass = check_fft_len2 & check_fft_len4 & check_fft_len8 & check_fft_len16 & check_fft_len32 & check_fft_len96;
`endif

`ifdef FFT_ST_WT2
     debug[0] = ((io_out_0_Re[31:16]==output_io_out[m+n][31:16]  ) | (io_out_0_Re[31:16]==output_io_out[m+n][31:16]  +16'h1) | (io_out_0_Re[31:16]==output_io_out[m+n][31:16]  -16'h1));
     debug[1] = ((io_out_0_Im[31:16]==output_io_out[m+n+1][31:16]) | (io_out_0_Im[31:16]==output_io_out[m+n+1][31:16]+16'h1) | (io_out_0_Im[31:16]==output_io_out[m+n+1][31:16]-16'h1));
     debug[2] = ((io_out_1_Re[31:16]==output_io_out[m+n+2][31:16]) | (io_out_1_Re[31:16]==output_io_out[m+n+2][31:16]+16'h1) | (io_out_1_Re[31:16]==output_io_out[m+n+2][31:16]-16'h1));
     debug[3] = ((io_out_1_Im[31:16]==output_io_out[m+n+3][31:16]) | (io_out_1_Im[31:16]==output_io_out[m+n+3][31:16]+16'h1) | (io_out_1_Im[31:16]==output_io_out[m+n+3][31:16]-16'h1));
  `ifdef FFT_ST_WT4
     debug[4] = ((io_out_2_Re[31:16]==output_io_out[m+n+4][31:16]) | (io_out_2_Re[31:16]==output_io_out[m+n+4][31:16]+16'h1) | (io_out_2_Re[31:16]==output_io_out[m+n+4][31:16]-16'h1));
     debug[5] = ((io_out_2_Im[31:16]==output_io_out[m+n+5][31:16]) | (io_out_2_Im[31:16]==output_io_out[m+n+5][31:16]+16'h1) | (io_out_2_Im[31:16]==output_io_out[m+n+5][31:16]-16'h1));
     debug[6] = ((io_out_3_Re[31:16]==output_io_out[m+n+6][31:16]) | (io_out_3_Re[31:16]==output_io_out[m+n+6][31:16]+16'h1) | (io_out_3_Re[31:16]==output_io_out[m+n+6][31:16]-16'h1));
     debug[7] = ((io_out_3_Im[31:16]==output_io_out[m+n+7][31:16]) | (io_out_3_Im[31:16]==output_io_out[m+n+7][31:16]+16'h1) | (io_out_3_Im[31:16]==output_io_out[m+n+7][31:16]-16'h1));
    `ifdef FFT_ST_WT8
     debug[8]  = ((io_out_4_Re[31:16]<output_io_out[m+n+8][31:16] +16'h3) & (io_out_4_Re[31:16]>output_io_out[m+n+8][31:16] -16'h3)); 
     debug[9]  = ((io_out_4_Im[31:16]<output_io_out[m+n+9][31:16] +16'h3) & (io_out_4_Im[31:16]>output_io_out[m+n+9][31:16] -16'h3)); 
     debug[10] = ((io_out_5_Re[31:16]<output_io_out[m+n+10][31:16]+16'h3) & (io_out_5_Re[31:16]>output_io_out[m+n+10][31:16]-16'h3));
     debug[11] = ((io_out_5_Im[31:16]<output_io_out[m+n+11][31:16]+16'h3) & (io_out_5_Im[31:16]>output_io_out[m+n+11][31:16]-16'h3));
     debug[12] = ((io_out_6_Re[31:16]<output_io_out[m+n+12][31:16]+16'h3) & (io_out_6_Re[31:16]>output_io_out[m+n+12][31:16]-16'h3));
     debug[13] = ((io_out_6_Im[31:16]<output_io_out[m+n+13][31:16]+16'h3) & (io_out_6_Im[31:16]>output_io_out[m+n+13][31:16]-16'h3));
     debug[14] = ((io_out_7_Re[31:16]<output_io_out[m+n+14][31:16]+16'h3) & (io_out_7_Re[31:16]>output_io_out[m+n+14][31:16]-16'h3));
     debug[15] = ((io_out_7_Im[31:16]<output_io_out[m+n+15][31:16]+16'h3) & (io_out_7_Im[31:16]>output_io_out[m+n+15][31:16]-16'h3));
      `ifdef FFT_ST_WT16
     debug[16] = ((io_out_8_Re[31:16] <output_io_out[m+n+16][31:16]+16'h3) & (io_out_8_Re[31:16] >output_io_out[m+n+16][31:16]-16'h3));
     debug[17] = ((io_out_8_Im[31:16] <output_io_out[m+n+17][31:16]+16'h3) & (io_out_8_Im[31:16] >output_io_out[m+n+17][31:16]-16'h3));
     debug[18] = ((io_out_9_Re[31:16] <output_io_out[m+n+18][31:16]+16'h3) & (io_out_9_Re[31:16] >output_io_out[m+n+18][31:16]-16'h3));
     debug[19] = ((io_out_9_Im[31:16] <output_io_out[m+n+19][31:16]+16'h3) & (io_out_9_Im[31:16] >output_io_out[m+n+19][31:16]-16'h3));
     debug[20] = ((io_out_10_Re[31:16]<output_io_out[m+n+20][31:16]+16'h3) & (io_out_10_Re[31:16]>output_io_out[m+n+20][31:16]-16'h3));
     debug[21] = ((io_out_10_Im[31:16]<output_io_out[m+n+21][31:16]+16'h3) & (io_out_10_Im[31:16]>output_io_out[m+n+21][31:16]-16'h3));
     debug[22] = ((io_out_11_Re[31:16]<output_io_out[m+n+22][31:16]+16'h3) & (io_out_11_Re[31:16]>output_io_out[m+n+22][31:16]-16'h3));
     debug[23] = ((io_out_11_Im[31:16]<output_io_out[m+n+23][31:16]+16'h3) & (io_out_11_Im[31:16]>output_io_out[m+n+23][31:16]-16'h3));
     debug[24] = ((io_out_12_Re[31:16]<output_io_out[m+n+24][31:16]+16'h3) & (io_out_12_Re[31:16]>output_io_out[m+n+24][31:16]-16'h3)); 
     debug[25] = ((io_out_12_Im[31:16]<output_io_out[m+n+25][31:16]+16'h3) & (io_out_12_Im[31:16]>output_io_out[m+n+25][31:16]-16'h3)); 
     debug[26] = ((io_out_13_Re[31:16]<output_io_out[m+n+26][31:16]+16'h3) & (io_out_13_Re[31:16]>output_io_out[m+n+26][31:16]-16'h3));
     debug[27] = ((io_out_13_Im[31:16]<output_io_out[m+n+27][31:16]+16'h3) & (io_out_13_Im[31:16]>output_io_out[m+n+27][31:16]-16'h3));
     debug[28] = ((io_out_14_Re[31:16]<output_io_out[m+n+28][31:16]+16'h3) & (io_out_14_Re[31:16]>output_io_out[m+n+28][31:16]-16'h3));
     debug[29] = ((io_out_14_Im[31:16]<output_io_out[m+n+29][31:16]+16'h3) & (io_out_14_Im[31:16]>output_io_out[m+n+29][31:16]-16'h3));
     debug[30] = ((io_out_15_Re[31:16]<output_io_out[m+n+30][31:16]+16'h3) & (io_out_15_Re[31:16]>output_io_out[m+n+30][31:16]-16'h3));
     debug[31] = ((io_out_15_Im[31:16]<output_io_out[m+n+31][31:16]+16'h3) & (io_out_15_Im[31:16]>output_io_out[m+n+31][31:16]-16'h3));
        `ifdef FFT_ST_WT32
     debug[32] = ((io_out_16_Re[31:16]<output_io_out[m+n+32][31:16]+16'h3) & (io_out_16_Re[31:16]>output_io_out[m+n+32][31:16]-16'h3));
     debug[33] = ((io_out_16_Im[31:16]<output_io_out[m+n+33][31:16]+16'h3) & (io_out_16_Im[31:16]>output_io_out[m+n+33][31:16]-16'h3));
     debug[34] = ((io_out_17_Re[31:16]<output_io_out[m+n+34][31:16]+16'h3) & (io_out_17_Re[31:16]>output_io_out[m+n+34][31:16]-16'h3));
     debug[35] = ((io_out_17_Im[31:16]<output_io_out[m+n+35][31:16]+16'h3) & (io_out_17_Im[31:16]>output_io_out[m+n+35][31:16]-16'h3));
     debug[36] = ((io_out_18_Re[31:16]<output_io_out[m+n+36][31:16]+16'h3) & (io_out_18_Re[31:16]>output_io_out[m+n+36][31:16]-16'h3));
     debug[37] = ((io_out_18_Im[31:16]<output_io_out[m+n+37][31:16]+16'h3) & (io_out_18_Im[31:16]>output_io_out[m+n+37][31:16]-16'h3));
     debug[38] = ((io_out_19_Re[31:16]<output_io_out[m+n+38][31:16]+16'h3) & (io_out_19_Re[31:16]>output_io_out[m+n+38][31:16]-16'h3));
     debug[39] = ((io_out_19_Im[31:16]<output_io_out[m+n+39][31:16]+16'h3) & (io_out_19_Im[31:16]>output_io_out[m+n+39][31:16]-16'h3)); 
     debug[40] = ((io_out_20_Re[31:16]<output_io_out[m+n+40][31:16]+16'h3) & (io_out_20_Re[31:16]>output_io_out[m+n+40][31:16]-16'h3));
     debug[41] = ((io_out_20_Im[31:16]<output_io_out[m+n+41][31:16]+16'h3) & (io_out_20_Im[31:16]>output_io_out[m+n+41][31:16]-16'h3));
     debug[42] = ((io_out_21_Re[31:16]<output_io_out[m+n+42][31:16]+16'h3) & (io_out_21_Re[31:16]>output_io_out[m+n+42][31:16]-16'h3));
     debug[43] = ((io_out_21_Im[31:16]<output_io_out[m+n+43][31:16]+16'h3) & (io_out_21_Im[31:16]>output_io_out[m+n+43][31:16]-16'h3));
     debug[44] = ((io_out_22_Re[31:16]<output_io_out[m+n+44][31:16]+16'h3) & (io_out_22_Re[31:16]>output_io_out[m+n+44][31:16]-16'h3));
     debug[45] = ((io_out_22_Im[31:16]<output_io_out[m+n+45][31:16]+16'h3) & (io_out_22_Im[31:16]>output_io_out[m+n+45][31:16]-16'h3));
     debug[46] = ((io_out_23_Re[31:16]<output_io_out[m+n+46][31:16]+16'h3) & (io_out_23_Re[31:16]>output_io_out[m+n+46][31:16]-16'h3));
     debug[47] = ((io_out_23_Im[31:16]<output_io_out[m+n+47][31:16]+16'h3) & (io_out_23_Im[31:16]>output_io_out[m+n+47][31:16]-16'h3));
     debug[48] = ((io_out_24_Re[31:16]<output_io_out[m+n+48][31:16]+16'h3) & (io_out_24_Re[31:16]>output_io_out[m+n+48][31:16]-16'h3));
     debug[49] = ((io_out_24_Im[31:16]<output_io_out[m+n+49][31:16]+16'h3) & (io_out_24_Im[31:16]>output_io_out[m+n+49][31:16]-16'h3)); 
     debug[50] = ((io_out_25_Re[31:16]<output_io_out[m+n+50][31:16]+16'h3) & (io_out_25_Re[31:16]>output_io_out[m+n+50][31:16]-16'h3));
     debug[51] = ((io_out_25_Im[31:16]<output_io_out[m+n+51][31:16]+16'h3) & (io_out_25_Im[31:16]>output_io_out[m+n+51][31:16]-16'h3));
     debug[52] = ((io_out_26_Re[31:16]<output_io_out[m+n+52][31:16]+16'h3) & (io_out_26_Re[31:16]>output_io_out[m+n+52][31:16]-16'h3));
     debug[53] = ((io_out_26_Im[31:16]<output_io_out[m+n+53][31:16]+16'h3) & (io_out_26_Im[31:16]>output_io_out[m+n+53][31:16]-16'h3));
     debug[54] = ((io_out_27_Re[31:16]<output_io_out[m+n+54][31:16]+16'h3) & (io_out_27_Re[31:16]>output_io_out[m+n+54][31:16]-16'h3));
     debug[55] = ((io_out_27_Im[31:16]<output_io_out[m+n+55][31:16]+16'h3) & (io_out_27_Im[31:16]>output_io_out[m+n+55][31:16]-16'h3));
     debug[56] = ((io_out_28_Re[31:16]<output_io_out[m+n+56][31:16]+16'h3) & (io_out_28_Re[31:16]>output_io_out[m+n+56][31:16]-16'h3));
     debug[57] = ((io_out_28_Im[31:16]<output_io_out[m+n+57][31:16]+16'h3) & (io_out_28_Im[31:16]>output_io_out[m+n+57][31:16]-16'h3));
     debug[58] = ((io_out_29_Re[31:16]<output_io_out[m+n+58][31:16]+16'h3) & (io_out_29_Re[31:16]>output_io_out[m+n+58][31:16]-16'h3));
     debug[59] = ((io_out_29_Im[31:16]<output_io_out[m+n+59][31:16]+16'h3) & (io_out_29_Im[31:16]>output_io_out[m+n+59][31:16]-16'h3)); 
     debug[60] = ((io_out_30_Re[31:16]<output_io_out[m+n+60][31:16]+16'h3) & (io_out_30_Re[31:16]>output_io_out[m+n+60][31:16]-16'h3));
     debug[61] = ((io_out_30_Im[31:16]<output_io_out[m+n+61][31:16]+16'h3) & (io_out_30_Im[31:16]>output_io_out[m+n+61][31:16]-16'h3));
     debug[62] = ((io_out_31_Re[31:16]<output_io_out[m+n+62][31:16]+16'h3) & (io_out_31_Re[31:16]>output_io_out[m+n+62][31:16]-16'h3));
     debug[63] = ((io_out_31_Im[31:16]<output_io_out[m+n+63][31:16]+16'h3) & (io_out_31_Im[31:16]>output_io_out[m+n+63][31:16]-16'h3));
            `ifdef FFT_ST_WT96

     debug[64] = ((io_out_32_Re[31:16]<output_io_out[m+n+64][31:16]+16'h3) & (io_out_32_Re[31:16]>output_io_out[m+n+64][31:16]-16'h3));
     debug[65] = ((io_out_32_Im[31:16]<output_io_out[m+n+65][31:16]+16'h3) & (io_out_32_Im[31:16]>output_io_out[m+n+65][31:16]-16'h3));
     debug[66] = ((io_out_33_Re[31:16]<output_io_out[m+n+66][31:16]+16'h3) & (io_out_33_Re[31:16]>output_io_out[m+n+66][31:16]-16'h3));
     debug[67] = ((io_out_33_Im[31:16]<output_io_out[m+n+67][31:16]+16'h3) & (io_out_33_Im[31:16]>output_io_out[m+n+67][31:16]-16'h3));
     debug[68] = ((io_out_34_Re[31:16]<output_io_out[m+n+68][31:16]+16'h3) & (io_out_34_Re[31:16]>output_io_out[m+n+68][31:16]-16'h3));
     debug[69] = ((io_out_34_Im[31:16]<output_io_out[m+n+69][31:16]+16'h3) & (io_out_34_Im[31:16]>output_io_out[m+n+69][31:16]-16'h3)); 
     debug[70] = ((io_out_35_Re[31:16]<output_io_out[m+n+70][31:16]+16'h3) & (io_out_35_Re[31:16]>output_io_out[m+n+70][31:16]-16'h3));
     debug[71] = ((io_out_35_Im[31:16]<output_io_out[m+n+71][31:16]+16'h3) & (io_out_35_Im[31:16]>output_io_out[m+n+71][31:16]-16'h3));
     debug[72]  = ((io_out_36_Re[31:16]<output_io_out[m+n+72][31:16]+16'h3) & (io_out_36_Re[31:16]>output_io_out[m+n+72][31:16]-16'h3)) ;
     debug[73]  = ((io_out_36_Im[31:16]<output_io_out[m+n+73][31:16]+16'h3) & (io_out_36_Im[31:16]>output_io_out[m+n+73][31:16]-16'h3)) ;
     debug[74]  = ((io_out_37_Im[31:16]<output_io_out[m+n+74][31:16]+16'h3) & (io_out_37_Im[31:16]>output_io_out[m+n+74][31:16]-16'h3)) ;
     debug[75]  = ((io_out_37_Re[31:16]<output_io_out[m+n+75][31:16]+16'h3) & (io_out_37_Re[31:16]>output_io_out[m+n+75][31:16]-16'h3)) ;
     debug[76]  = ((io_out_38_Im[31:16]<output_io_out[m+n+76][31:16]+16'h3) & (io_out_38_Im[31:16]>output_io_out[m+n+76][31:16]-16'h3)) ;
     debug[77]  = ((io_out_38_Im[31:16]<output_io_out[m+n+77][31:16]+16'h3) & (io_out_38_Im[31:16]>output_io_out[m+n+77][31:16]-16'h3)) ;
     debug[78]  = ((io_out_39_Im[31:16]<output_io_out[m+n+78][31:16]+16'h3) & (io_out_39_Im[31:16]>output_io_out[m+n+78][31:16]-16'h3)) ;
     debug[79]  = ((io_out_39_Im[31:16]<output_io_out[m+n+79][31:16]+16'h3) & (io_out_39_Im[31:16]>output_io_out[m+n+79][31:16]-16'h3)) ;
     debug[80]  = ((io_out_40_Re[31:16]<output_io_out[m+n+80][31:16]+16'h3) & (io_out_40_Re[31:16]>output_io_out[m+n+80][31:16]-16'h3)) ;
     debug[81]  = ((io_out_40_Im[31:16]<output_io_out[m+n+81][31:16]+16'h3) & (io_out_40_Im[31:16]>output_io_out[m+n+81][31:16]-16'h3)) ;
     debug[82]  = ((io_out_41_Re[31:16]<output_io_out[m+n+82][31:16]+16'h3) & (io_out_41_Re[31:16]>output_io_out[m+n+82][31:16]-16'h3)) ;
     debug[83]  = ((io_out_41_Im[31:16]<output_io_out[m+n+83][31:16]+16'h3) & (io_out_41_Im[31:16]>output_io_out[m+n+83][31:16]-16'h3)) ;
     debug[84]  = ((io_out_42_Re[31:16]<output_io_out[m+n+84][31:16]+16'h3) & (io_out_42_Re[31:16]>output_io_out[m+n+84][31:16]-16'h3)) ;
     debug[85]  = ((io_out_42_Im[31:16]<output_io_out[m+n+85][31:16]+16'h3) & (io_out_42_Im[31:16]>output_io_out[m+n+85][31:16]-16'h3)) ; 
     debug[86]  = ((io_out_43_Re[31:16]<output_io_out[m+n+86][31:16]+16'h3) & (io_out_43_Re[31:16]>output_io_out[m+n+86][31:16]-16'h3)) ;
     debug[87]  = ((io_out_43_Im[31:16]<output_io_out[m+n+87][31:16]+16'h3) & (io_out_43_Im[31:16]>output_io_out[m+n+87][31:16]-16'h3)) ;
     debug[88]  = ((io_out_44_Re[31:16]<output_io_out[m+n+88][31:16]+16'h3) & (io_out_44_Re[31:16]>output_io_out[m+n+88][31:16]-16'h3)) ;
     debug[89]  = ((io_out_44_Im[31:16]<output_io_out[m+n+89][31:16]+16'h3) & (io_out_44_Im[31:16]>output_io_out[m+n+89][31:16]-16'h3)) ;
     debug[90]  = ((io_out_45_Re[31:16]<output_io_out[m+n+90][31:16]+16'h3) & (io_out_45_Re[31:16]>output_io_out[m+n+90][31:16]-16'h3)) ;
     debug[91]  = ((io_out_45_Im[31:16]<output_io_out[m+n+91][31:16]+16'h3) & (io_out_45_Im[31:16]>output_io_out[m+n+91][31:16]-16'h3)) ;
     debug[92]  = ((io_out_46_Re[31:16]<output_io_out[m+n+92][31:16]+16'h3) & (io_out_46_Re[31:16]>output_io_out[m+n+92][31:16]-16'h3)) ;
     debug[93]  = ((io_out_46_Im[31:16]<output_io_out[m+n+93][31:16]+16'h3) & (io_out_46_Im[31:16]>output_io_out[m+n+93][31:16]-16'h3)) ;
     debug[94]  = ((io_out_47_Re[31:16]<output_io_out[m+n+94][31:16]+16'h3) & (io_out_47_Re[31:16]>output_io_out[m+n+94][31:16]-16'h3)) ;
     debug[95]  = ((io_out_47_Re[31:16]<output_io_out[m+n+95][31:16]+16'h3) & (io_out_47_Re[31:16]>output_io_out[m+n+95][31:16]-16'h3)) ;
     debug[96]  = ((io_out_48_Im[31:16]<output_io_out[m+n+96][31:16]+16'h3) & (io_out_48_Im[31:16]>output_io_out[m+n+96][31:16]-16'h3)) ;
     debug[97]  = ((io_out_48_Re[31:16]<output_io_out[m+n+97][31:16]+16'h3) & (io_out_48_Re[31:16]>output_io_out[m+n+97][31:16]-16'h3)) ;
     debug[98]  = ((io_out_49_Im[31:16]<output_io_out[m+n+98][31:16]+16'h3) & (io_out_49_Im[31:16]>output_io_out[m+n+98][31:16]-16'h3)) ;
     debug[99]  = ((io_out_49_Re[31:16]<output_io_out[m+n+99][31:16]+16'h3) & (io_out_49_Re[31:16]>output_io_out[m+n+99][31:16]-16'h3)) ;
     debug[100] = ((io_out_50_Im[31:16]<output_io_out[m+n+100][31:16]+16'h3) & (io_out_50_Im[31:16]>output_io_out[m+n+100][31:16]-16'h3)) ; 
     debug[101] = ((io_out_50_Re[31:16]<output_io_out[m+n+101][31:16]+16'h3) & (io_out_50_Re[31:16]>output_io_out[m+n+101][31:16]-16'h3)) ;
     debug[102] = ((io_out_51_Im[31:16]<output_io_out[m+n+102][31:16]+16'h3) & (io_out_51_Im[31:16]>output_io_out[m+n+102][31:16]-16'h3)) ;
     debug[103] = ((io_out_51_Re[31:16]<output_io_out[m+n+103][31:16]+16'h3) & (io_out_51_Re[31:16]>output_io_out[m+n+103][31:16]-16'h3)) ;
     debug[104] = ((io_out_52_Im[31:16]<output_io_out[m+n+104][31:16]+16'h3) & (io_out_52_Im[31:16]>output_io_out[m+n+104][31:16]-16'h3)) ;
     debug[105] = ((io_out_52_Re[31:16]<output_io_out[m+n+105][31:16]+16'h3) & (io_out_52_Re[31:16]>output_io_out[m+n+105][31:16]-16'h3)) ;
     debug[106] = ((io_out_53_Im[31:16]<output_io_out[m+n+106][31:16]+16'h3) & (io_out_53_Im[31:16]>output_io_out[m+n+106][31:16]-16'h3)) ;
     debug[107] = ((io_out_53_Re[31:16]<output_io_out[m+n+107][31:16]+16'h3) & (io_out_53_Re[31:16]>output_io_out[m+n+107][31:16]-16'h3)) ;
     debug[108] = ((io_out_54_Im[31:16]<output_io_out[m+n+108][31:16]+16'h3) & (io_out_54_Im[31:16]>output_io_out[m+n+108][31:16]-16'h3)) ;
     debug[109] = ((io_out_54_Re[31:16]<output_io_out[m+n+109][31:16]+16'h3) & (io_out_54_Re[31:16]>output_io_out[m+n+109][31:16]-16'h3)) ;
     debug[110] = ((io_out_55_Re[31:16]<output_io_out[m+n+110][31:16]+16'h3) & (io_out_55_Re[31:16]>output_io_out[m+n+110][31:16]-16'h3)) ;
     debug[111] = ((io_out_55_Im[31:16]<output_io_out[m+n+111][31:16]+16'h3) & (io_out_55_Im[31:16]>output_io_out[m+n+111][31:16]-16'h3)) ;
     debug[112] = ((io_out_56_Re[31:16]<output_io_out[m+n+112][31:16]+16'h3) & (io_out_56_Re[31:16]>output_io_out[m+n+112][31:16]-16'h3)) ;
     debug[113] = ((io_out_56_Im[31:16]<output_io_out[m+n+113][31:16]+16'h3) & (io_out_56_Im[31:16]>output_io_out[m+n+113][31:16]-16'h3)) ;
     debug[114] = ((io_out_57_Re[31:16]<output_io_out[m+n+114][31:16]+16'h3) & (io_out_57_Re[31:16]>output_io_out[m+n+114][31:16]-16'h3)) ;
     debug[115] = ((io_out_57_Im[31:16]<output_io_out[m+n+115][31:16]+16'h3) & (io_out_57_Im[31:16]>output_io_out[m+n+115][31:16]-16'h3)) ; 
     debug[116] = ((io_out_58_Re[31:16]<output_io_out[m+n+116][31:16]+16'h3) & (io_out_58_Re[31:16]>output_io_out[m+n+116][31:16]-16'h3)) ;
     debug[117] = ((io_out_58_Im[31:16]<output_io_out[m+n+117][31:16]+16'h3) & (io_out_58_Im[31:16]>output_io_out[m+n+117][31:16]-16'h3)) ;
     debug[118] = ((io_out_59_Re[31:16]<output_io_out[m+n+118][31:16]+16'h3) & (io_out_59_Re[31:16]>output_io_out[m+n+118][31:16]-16'h3)) ;
     debug[119] = ((io_out_59_Im[31:16]<output_io_out[m+n+119][31:16]+16'h3) & (io_out_59_Im[31:16]>output_io_out[m+n+119][31:16]-16'h3)) ;
     debug[120] = ((io_out_60_Re[31:16]<output_io_out[m+n+120][31:16]+16'h3) & (io_out_60_Re[31:16]>output_io_out[m+n+120][31:16]-16'h3)) ;
     debug[121] = ((io_out_60_Im[31:16]<output_io_out[m+n+121][31:16]+16'h3) & (io_out_60_Im[31:16]>output_io_out[m+n+121][31:16]-16'h3)) ;
     debug[122] = ((io_out_61_Re[31:16]<output_io_out[m+n+122][31:16]+16'h3) & (io_out_61_Re[31:16]>output_io_out[m+n+122][31:16]-16'h3)) ;
     debug[123] = ((io_out_61_Im[31:16]<output_io_out[m+n+123][31:16]+16'h3) & (io_out_61_Im[31:16]>output_io_out[m+n+123][31:16]-16'h3)) ;
     debug[124] = ((io_out_62_Re[31:16]<output_io_out[m+n+124][31:16]+16'h3) & (io_out_62_Re[31:16]>output_io_out[m+n+124][31:16]-16'h3)) ;
     debug[125] = ((io_out_62_Re[31:16]<output_io_out[m+n+125][31:16]+16'h3) & (io_out_62_Re[31:16]>output_io_out[m+n+125][31:16]-16'h3)) ;
     debug[126] = ((io_out_63_Im[31:16]<output_io_out[m+n+126][31:16]+16'h3) & (io_out_63_Im[31:16]>output_io_out[m+n+126][31:16]-16'h3)) ;
     debug[127] = ((io_out_63_Re[31:16]<output_io_out[m+n+127][31:16]+16'h3) & (io_out_63_Re[31:16]>output_io_out[m+n+127][31:16]-16'h3)) ;
     debug[128] = ((io_out_64_Im[31:16]<output_io_out[m+n+128][31:16]+16'h3) & (io_out_64_Im[31:16]>output_io_out[m+n+128][31:16]-16'h3)) ;
     debug[129] = ((io_out_64_Re[31:16]<output_io_out[m+n+129][31:16]+16'h3) & (io_out_64_Re[31:16]>output_io_out[m+n+129][31:16]-16'h3)) ;
     debug[130] = ((io_out_65_Im[31:16]<output_io_out[m+n+130][31:16]+16'h3) & (io_out_65_Im[31:16]>output_io_out[m+n+130][31:16]-16'h3)) ; 
     debug[131] = ((io_out_65_Re[31:16]<output_io_out[m+n+131][31:16]+16'h3) & (io_out_65_Re[31:16]>output_io_out[m+n+131][31:16]-16'h3)) ;
     debug[132] = ((io_out_66_Im[31:16]<output_io_out[m+n+132][31:16]+16'h3) & (io_out_66_Im[31:16]>output_io_out[m+n+132][31:16]-16'h3)) ;
     debug[133] = ((io_out_66_Re[31:16]<output_io_out[m+n+133][31:16]+16'h3) & (io_out_66_Re[31:16]>output_io_out[m+n+133][31:16]-16'h3)) ;
     debug[134] = ((io_out_67_Im[31:16]<output_io_out[m+n+134][31:16]+16'h3) & (io_out_67_Im[31:16]>output_io_out[m+n+134][31:16]-16'h3)) ;
     debug[135] = ((io_out_67_Re[31:16]<output_io_out[m+n+135][31:16]+16'h3) & (io_out_67_Re[31:16]>output_io_out[m+n+135][31:16]-16'h3)) ;
     debug[136] = ((io_out_68_Im[31:16]<output_io_out[m+n+136][31:16]+16'h3) & (io_out_68_Im[31:16]>output_io_out[m+n+136][31:16]-16'h3)) ;
     debug[137] = ((io_out_68_Re[31:16]<output_io_out[m+n+137][31:16]+16'h3) & (io_out_68_Re[31:16]>output_io_out[m+n+137][31:16]-16'h3)) ;
     debug[138] = ((io_out_69_Im[31:16]<output_io_out[m+n+138][31:16]+16'h3) & (io_out_69_Im[31:16]>output_io_out[m+n+138][31:16]-16'h3)) ;
     debug[139] = ((io_out_69_Re[31:16]<output_io_out[m+n+139][31:16]+16'h3) & (io_out_69_Re[31:16]>output_io_out[m+n+139][31:16]-16'h3)) ;
     debug[140] = ((io_out_70_Im[31:16]<output_io_out[m+n+140][31:16]+16'h3) & (io_out_70_Im[31:16]>output_io_out[m+n+140][31:16]-16'h3)) ;
     debug[141] = ((io_out_70_Re[31:16]<output_io_out[m+n+141][31:16]+16'h3) & (io_out_70_Re[31:16]>output_io_out[m+n+141][31:16]-16'h3)) ;
     debug[142] = ((io_out_71_Im[31:16]<output_io_out[m+n+142][31:16]+16'h3) & (io_out_71_Im[31:16]>output_io_out[m+n+142][31:16]-16'h3)) ;
     debug[143] = ((io_out_71_Re[31:16]<output_io_out[m+n+143][31:16]+16'h3) & (io_out_71_Re[31:16]>output_io_out[m+n+143][31:16]-16'h3)) ;
     debug[144] = ((io_out_72_Im[31:16]<output_io_out[m+n+144][31:16]+16'h3) & (io_out_72_Im[31:16]>output_io_out[m+n+144][31:16]-16'h3)) ; 
     debug[145] = ((io_out_72_Re[31:16]<output_io_out[m+n+145][31:16]+16'h3) & (io_out_72_Re[31:16]>output_io_out[m+n+145][31:16]-16'h3)) ;
     debug[146] = ((io_out_73_Im[31:16]<output_io_out[m+n+146][31:16]+16'h3) & (io_out_73_Im[31:16]>output_io_out[m+n+146][31:16]-16'h3)) ;
     debug[147] = ((io_out_73_Re[31:16]<output_io_out[m+n+147][31:16]+16'h3) & (io_out_73_Re[31:16]>output_io_out[m+n+147][31:16]-16'h3)) ;
     debug[148] = ((io_out_74_Im[31:16]<output_io_out[m+n+148][31:16]+16'h3) & (io_out_74_Im[31:16]>output_io_out[m+n+148][31:16]-16'h3)) ;
     debug[149] = ((io_out_74_Re[31:16]<output_io_out[m+n+149][31:16]+16'h3) & (io_out_74_Re[31:16]>output_io_out[m+n+149][31:16]-16'h3)) ;
     debug[150] = ((io_out_75_Im[31:16]<output_io_out[m+n+150][31:16]+16'h3) & (io_out_75_Im[31:16]>output_io_out[m+n+150][31:16]-16'h3)) ;
     debug[151] = ((io_out_75_Re[31:16]<output_io_out[m+n+151][31:16]+16'h3) & (io_out_75_Re[31:16]>output_io_out[m+n+151][31:16]-16'h3)) ;
     debug[152] = ((io_out_76_Im[31:16]<output_io_out[m+n+152][31:16]+16'h3) & (io_out_76_Im[31:16]>output_io_out[m+n+152][31:16]-16'h3)) ;
     debug[153] = ((io_out_76_Re[31:16]<output_io_out[m+n+153][31:16]+16'h3) & (io_out_76_Re[31:16]>output_io_out[m+n+153][31:16]-16'h3)) ;
     debug[154] = ((io_out_77_Im[31:16]<output_io_out[m+n+154][31:16]+16'h3) & (io_out_77_Im[31:16]>output_io_out[m+n+154][31:16]-16'h3)) ;
     debug[155] = ((io_out_77_Re[31:16]<output_io_out[m+n+155][31:16]+16'h3) & (io_out_77_Re[31:16]>output_io_out[m+n+155][31:16]-16'h3)) ;
     debug[156] = ((io_out_78_Im[31:16]<output_io_out[m+n+156][31:16]+16'h3) & (io_out_78_Im[31:16]>output_io_out[m+n+156][31:16]-16'h3)) ;
     debug[157] = ((io_out_78_Re[31:16]<output_io_out[m+n+157][31:16]+16'h3) & (io_out_78_Re[31:16]>output_io_out[m+n+157][31:16]-16'h3)) ;
     debug[158] = ((io_out_79_Im[31:16]<output_io_out[m+n+158][31:16]+16'h3) & (io_out_79_Im[31:16]>output_io_out[m+n+158][31:16]-16'h3)) ;
     debug[159] = ((io_out_79_Re[31:16]<output_io_out[m+n+159][31:16]+16'h3) & (io_out_79_Re[31:16]>output_io_out[m+n+159][31:16]-16'h3)) ;
     debug[160] = ((io_out_80_Im[31:16]<output_io_out[m+n+160][31:16]+16'h3) & (io_out_80_Im[31:16]>output_io_out[m+n+160][31:16]-16'h3)) ; 
     debug[161] = ((io_out_80_Re[31:16]<output_io_out[m+n+161][31:16]+16'h3) & (io_out_80_Re[31:16]>output_io_out[m+n+161][31:16]-16'h3)) ;
     debug[162] = ((io_out_81_Im[31:16]<output_io_out[m+n+162][31:16]+16'h3) & (io_out_81_Im[31:16]>output_io_out[m+n+162][31:16]-16'h3)) ;
     debug[163] = ((io_out_81_Re[31:16]<output_io_out[m+n+163][31:16]+16'h3) & (io_out_81_Re[31:16]>output_io_out[m+n+163][31:16]-16'h3)) ;
     debug[164] = ((io_out_82_Im[31:16]<output_io_out[m+n+164][31:16]+16'h3) & (io_out_82_Im[31:16]>output_io_out[m+n+164][31:16]-16'h3)) ;
     debug[165] = ((io_out_82_Re[31:16]<output_io_out[m+n+165][31:16]+16'h3) & (io_out_82_Re[31:16]>output_io_out[m+n+165][31:16]-16'h3)) ;
     debug[166] = ((io_out_83_Im[31:16]<output_io_out[m+n+166][31:16]+16'h3) & (io_out_83_Im[31:16]>output_io_out[m+n+166][31:16]-16'h3)) ;
     debug[167] = ((io_out_83_Re[31:16]<output_io_out[m+n+167][31:16]+16'h3) & (io_out_83_Re[31:16]>output_io_out[m+n+167][31:16]-16'h3)) ;
     debug[168] = ((io_out_84_Im[31:16]<output_io_out[m+n+168][31:16]+16'h3) & (io_out_84_Im[31:16]>output_io_out[m+n+168][31:16]-16'h3)) ;
     debug[169] = ((io_out_84_Re[31:16]<output_io_out[m+n+169][31:16]+16'h3) & (io_out_84_Re[31:16]>output_io_out[m+n+169][31:16]-16'h3)) ;
     debug[170] = ((io_out_85_Re[31:16]<output_io_out[m+n+170][31:16]+16'h3) & (io_out_85_Re[31:16]>output_io_out[m+n+170][31:16]-16'h3)) ;
     debug[171] = ((io_out_85_Im[31:16]<output_io_out[m+n+171][31:16]+16'h3) & (io_out_85_Im[31:16]>output_io_out[m+n+171][31:16]-16'h3)) ;
     debug[172] = ((io_out_86_Re[31:16]<output_io_out[m+n+172][31:16]+16'h3) & (io_out_86_Re[31:16]>output_io_out[m+n+172][31:16]-16'h3)) ;
     debug[173] = ((io_out_86_Im[31:16]<output_io_out[m+n+173][31:16]+16'h3) & (io_out_86_Im[31:16]>output_io_out[m+n+173][31:16]-16'h3)) ;
     debug[174] = ((io_out_87_Re[31:16]<output_io_out[m+n+174][31:16]+16'h3) & (io_out_87_Re[31:16]>output_io_out[m+n+174][31:16]-16'h3)) ;
     debug[175] = ((io_out_87_Im[31:16]<output_io_out[m+n+175][31:16]+16'h3) & (io_out_87_Im[31:16]>output_io_out[m+n+175][31:16]-16'h3)) ; 
     debug[176] = ((io_out_88_Re[31:16]<output_io_out[m+n+176][31:16]+16'h3) & (io_out_88_Re[31:16]>output_io_out[m+n+176][31:16]-16'h3)) ;
     debug[177] = ((io_out_88_Im[31:16]<output_io_out[m+n+177][31:16]+16'h3) & (io_out_88_Im[31:16]>output_io_out[m+n+177][31:16]-16'h3)) ;
     debug[178] = ((io_out_89_Re[31:16]<output_io_out[m+n+178][31:16]+16'h3) & (io_out_89_Re[31:16]>output_io_out[m+n+178][31:16]-16'h3)) ;
     debug[179] = ((io_out_89_Im[31:16]<output_io_out[m+n+179][31:16]+16'h3) & (io_out_89_Im[31:16]>output_io_out[m+n+179][31:16]-16'h3)) ;
     debug[180] = ((io_out_90_Re[31:16]<output_io_out[m+n+180][31:16]+16'h3) & (io_out_90_Re[31:16]>output_io_out[m+n+180][31:16]-16'h3)) ;
     debug[181] = ((io_out_90_Im[31:16]<output_io_out[m+n+181][31:16]+16'h3) & (io_out_90_Im[31:16]>output_io_out[m+n+181][31:16]-16'h3)) ;
     debug[182] = ((io_out_91_Re[31:16]<output_io_out[m+n+182][31:16]+16'h3) & (io_out_91_Re[31:16]>output_io_out[m+n+182][31:16]-16'h3)) ;
     debug[183] = ((io_out_91_Im[31:16]<output_io_out[m+n+183][31:16]+16'h3) & (io_out_91_Im[31:16]>output_io_out[m+n+183][31:16]-16'h3)) ;
     debug[184] = ((io_out_92_Re[31:16]<output_io_out[m+n+184][31:16]+16'h3) & (io_out_92_Re[31:16]>output_io_out[m+n+184][31:16]-16'h3)) ;
     debug[185] = ((io_out_92_Im[31:16]<output_io_out[m+n+185][31:16]+16'h3) & (io_out_92_Im[31:16]>output_io_out[m+n+185][31:16]-16'h3)) ; 
     debug[186] = ((io_out_93_Re[31:16]<output_io_out[m+n+186][31:16]+16'h3) & (io_out_93_Re[31:16]>output_io_out[m+n+186][31:16]-16'h3)) ;
     debug[187] = ((io_out_93_Im[31:16]<output_io_out[m+n+187][31:16]+16'h3) & (io_out_93_Im[31:16]>output_io_out[m+n+187][31:16]-16'h3)) ; 
     debug[188] = ((io_out_94_Re[31:16]<output_io_out[m+n+188][31:16]+16'h3) & (io_out_94_Re[31:16]>output_io_out[m+n+188][31:16]-16'h3)) ;
     debug[189] = ((io_out_94_Im[31:16]<output_io_out[m+n+189][31:16]+16'h3) & (io_out_94_Im[31:16]>output_io_out[m+n+189][31:16]-16'h3)) ; 
     debug[190] = ((io_out_95_Re[31:16]<output_io_out[m+n+190][31:16]+16'h3) & (io_out_95_Re[31:16]>output_io_out[m+n+190][31:16]-16'h3)) ;
     debug[191] = ((io_out_95_Im[31:16]<output_io_out[m+n+191][31:16]+16'h3) & (io_out_95_Im[31:16]>output_io_out[m+n+191][31:16]-16'h3)) ;
	  `endif
        `endif
      `endif
    `endif
  `endif
`endif
     if (check_pass) begin
       $display("-------------------------------------------------------");
       $display("At %d ns, the %d FFT check Pass, the no. is %d", $time, m+n/2/`FFT_WT, m+n);

`ifdef FFT_ST_WT2
       $display("Expected io_out_0_Re is %h, dut output is %h", output_io_out[m+n],io_out_0_Re);
       $display("Expected io_out_0_Im is %h, dut output is %h", output_io_out[m+n+1],io_out_0_Im);
       $display("Expected io_out_1_Re is %h, dut output is %h", output_io_out[m+n+2],io_out_1_Re);
       $display("Expected io_out_1_Im is %h, dut output is %h", output_io_out[m+n+3],io_out_1_Im);
    `ifdef FFT_ST_WT4
       $display("Expected io_out_2_Re is %h, dut output is %h", output_io_out[m+n+4],io_out_2_Re);
       $display("Expected io_out_2_Im is %h, dut output is %h", output_io_out[m+n+5],io_out_2_Im);
       $display("Expected io_out_3_Re is %h, dut output is %h", output_io_out[m+n+6],io_out_3_Re);
       $display("Expected io_out_3_Im is %h, dut output is %h", output_io_out[m+n+7],io_out_3_Im);
      `ifdef FFT_ST_WT8
       $display("Expected io_out_4_Re is %h, dut output is %h", output_io_out[m+n+8], io_out_4_Re);
       $display("Expected io_out_4_Im is %h, dut output is %h", output_io_out[m+n+9], io_out_4_Im);
       $display("Expected io_out_5_Re is %h, dut output is %h", output_io_out[m+n+10],io_out_5_Re);
       $display("Expected io_out_5_Im is %h, dut output is %h", output_io_out[m+n+11],io_out_5_Im);
       $display("Expected io_out_6_Re is %h, dut output is %h", output_io_out[m+n+12],io_out_6_Re);
       $display("Expected io_out_6_Im is %h, dut output is %h", output_io_out[m+n+13],io_out_6_Im);
       $display("Expected io_out_7_Re is %h, dut output is %h", output_io_out[m+n+14],io_out_7_Re);
       $display("Expected io_out_7_Im is %h, dut output is %h", output_io_out[m+n+15],io_out_7_Im);
       `ifdef FFT_ST_WT16
       $display("Expected io_out_8_Re is %h, dut output is %h", output_io_out[m+n+16],io_out_8_Re);
       $display("Expected io_out_8_Im is %h, dut output is %h", output_io_out[m+n+17],io_out_8_Im);
       $display("Expected io_out_9_Re is %h, dut output is %h", output_io_out[m+n+18],io_out_9_Re);
       $display("Expected io_out_9_Im is %h, dut output is %h", output_io_out[m+n+19],io_out_9_Im);
       $display("Expected io_out_10_Re is %h, dut output is %h", output_io_out[m+n+20],io_out_10_Re);
       $display("Expected io_out_10_Im is %h, dut output is %h", output_io_out[m+n+21],io_out_10_Im);
       $display("Expected io_out_11_Re is %h, dut output is %h", output_io_out[m+n+22],io_out_11_Re);
       $display("Expected io_out_11_Im is %h, dut output is %h", output_io_out[m+n+23],io_out_11_Im);
       $display("Expected io_out_12_Re is %h, dut output is %h", output_io_out[m+n+24],io_out_12_Re);
       $display("Expected io_out_12_Im is %h, dut output is %h", output_io_out[m+n+25],io_out_12_Im);
       $display("Expected io_out_13_Re is %h, dut output is %h", output_io_out[m+n+26],io_out_13_Re);
       $display("Expected io_out_13_Im is %h, dut output is %h", output_io_out[m+n+27],io_out_13_Im);
       $display("Expected io_out_14_Re is %h, dut output is %h", output_io_out[m+n+28],io_out_14_Re);
       $display("Expected io_out_14_Im is %h, dut output is %h", output_io_out[m+n+29],io_out_14_Im);
       $display("Expected io_out_15_Re is %h, dut output is %h", output_io_out[m+n+30],io_out_15_Re);
       $display("Expected io_out_15_Im is %h, dut output is %h", output_io_out[m+n+31],io_out_15_Im);
         `ifdef FFT_ST_WT32
       $display("Expected io_out_16_Re is %h, dut output is %h", output_io_out[m+n+32], io_out_16_Re);
       $display("Expected io_out_16_Im is %h, dut output is %h", output_io_out[m+n+33], io_out_16_Im);
       $display("Expected io_out_17_Re is %h, dut output is %h", output_io_out[m+n+34], io_out_17_Re);
       $display("Expected io_out_17_Im is %h, dut output is %h", output_io_out[m+n+35], io_out_17_Im);
       $display("Expected io_out_18_Re is %h, dut output is %h", output_io_out[m+n+36], io_out_18_Re);
       $display("Expected io_out_18_Im is %h, dut output is %h", output_io_out[m+n+37], io_out_18_Im);
       $display("Expected io_out_19_Re is %h, dut output is %h", output_io_out[m+n+38], io_out_19_Re);
       $display("Expected io_out_19_Im is %h, dut output is %h", output_io_out[m+n+39], io_out_19_Im);
       $display("Expected io_out_20_Re is %h, dut output is %h", output_io_out[m+n+40], io_out_20_Re);
       $display("Expected io_out_20_Im is %h, dut output is %h", output_io_out[m+n+41], io_out_20_Im);
       $display("Expected io_out_21_Re is %h, dut output is %h", output_io_out[m+n+42], io_out_21_Re);
       $display("Expected io_out_21_Im is %h, dut output is %h", output_io_out[m+n+43], io_out_21_Im);
       $display("Expected io_out_22_Re is %h, dut output is %h", output_io_out[m+n+44], io_out_22_Re);
       $display("Expected io_out_22_Im is %h, dut output is %h", output_io_out[m+n+45], io_out_22_Im);
       $display("Expected io_out_23_Re is %h, dut output is %h", output_io_out[m+n+46], io_out_23_Re);
       $display("Expected io_out_23_Im is %h, dut output is %h", output_io_out[m+n+47], io_out_23_Im);
       $display("Expected io_out_24_Re is %h, dut output is %h", output_io_out[m+n+48], io_out_24_Re);
       $display("Expected io_out_24_Im is %h, dut output is %h", output_io_out[m+n+49], io_out_24_Im);
       $display("Expected io_out_25_Re is %h, dut output is %h", output_io_out[m+n+50], io_out_25_Re);
       $display("Expected io_out_25_Im is %h, dut output is %h", output_io_out[m+n+51], io_out_25_Im);
       $display("Expected io_out_26_Re is %h, dut output is %h", output_io_out[m+n+52], io_out_26_Re);
       $display("Expected io_out_26_Im is %h, dut output is %h", output_io_out[m+n+53], io_out_26_Im);
       $display("Expected io_out_27_Re is %h, dut output is %h", output_io_out[m+n+54], io_out_27_Re);
       $display("Expected io_out_27_Im is %h, dut output is %h", output_io_out[m+n+55], io_out_27_Im);
       $display("Expected io_out_28_Re is %h, dut output is %h", output_io_out[m+n+56], io_out_28_Re);
       $display("Expected io_out_28_Im is %h, dut output is %h", output_io_out[m+n+57], io_out_28_Im);
       $display("Expected io_out_29_Re is %h, dut output is %h", output_io_out[m+n+58], io_out_29_Re);
       $display("Expected io_out_29_Im is %h, dut output is %h", output_io_out[m+n+59], io_out_29_Im);
       $display("Expected io_out_30_Re is %h, dut output is %h", output_io_out[m+n+60], io_out_30_Re);
       $display("Expected io_out_30_Im is %h, dut output is %h", output_io_out[m+n+61], io_out_30_Im);
       $display("Expected io_out_31_Re is %h, dut output is %h", output_io_out[m+n+62], io_out_31_Re);
       $display("Expected io_out_31_Im is %h, dut output is %h", output_io_out[m+n+63], io_out_31_Im);
             `ifdef FFT_ST_WT96
       $display("Expected io_out_32_Re is %h, dut output is %h", output_io_out[m+n+64], io_out_32_Re);
       $display("Expected io_out_32_Im is %h, dut output is %h", output_io_out[m+n+65], io_out_32_Im);
       $display("Expected io_out_33_Re is %h, dut output is %h", output_io_out[m+n+66], io_out_33_Re);
       $display("Expected io_out_33_Im is %h, dut output is %h", output_io_out[m+n+67], io_out_33_Im);
       $display("Expected io_out_34_Re is %h, dut output is %h", output_io_out[m+n+68], io_out_34_Re);
       $display("Expected io_out_34_Im is %h, dut output is %h", output_io_out[m+n+69], io_out_34_Im);
       $display("Expected io_out_35_Re is %h, dut output is %h", output_io_out[m+n+70], io_out_35_Re);
       $display("Expected io_out_35_Im is %h, dut output is %h", output_io_out[m+n+71], io_out_35_Im);
       $display("Expected io_out_36_Re is %h, dut output is %h", output_io_out[m+n+72], io_out_36_Re);
       $display("Expected io_out_36_Re is %h, dut output is %h", output_io_out[m+n+73], io_out_36_Re);
       $display("Expected io_out_37_Re is %h, dut output is %h", output_io_out[m+n+74], io_out_37_Re);
       $display("Expected io_out_37_Re is %h, dut output is %h", output_io_out[m+n+75], io_out_37_Re);
       $display("Expected io_out_38_Re is %h, dut output is %h", output_io_out[m+n+76], io_out_38_Re);
       $display("Expected io_out_38_Re is %h, dut output is %h", output_io_out[m+n+77], io_out_38_Re);
       $display("Expected io_out_39_Re is %h, dut output is %h", output_io_out[m+n+78], io_out_39_Re);
       $display("Expected io_out_39_Re is %h, dut output is %h", output_io_out[m+n+79], io_out_39_Re);
       $display("Expected io_out_40_Re is %h, dut output is %h", output_io_out[m+n+80], io_out_40_Re);
       $display("Expected io_out_40_Re is %h, dut output is %h", output_io_out[m+n+81], io_out_40_Re);
       $display("Expected io_out_41_Re is %h, dut output is %h", output_io_out[m+n+82], io_out_41_Re);
       $display("Expected io_out_41_Re is %h, dut output is %h", output_io_out[m+n+83], io_out_41_Re);
       $display("Expected io_out_42_Re is %h, dut output is %h", output_io_out[m+n+84], io_out_42_Re);
       $display("Expected io_out_42_Re is %h, dut output is %h", output_io_out[m+n+85], io_out_42_Re);
       $display("Expected io_out_43_Im is %h, dut output is %h", output_io_out[m+n+86], io_out_43_Im);
       $display("Expected io_out_43_Re is %h, dut output is %h", output_io_out[m+n+87], io_out_43_Re);
       $display("Expected io_out_44_Im is %h, dut output is %h", output_io_out[m+n+88], io_out_44_Im);
       $display("Expected io_out_44_Re is %h, dut output is %h", output_io_out[m+n+89], io_out_44_Re);
       $display("Expected io_out_45_Im is %h, dut output is %h", output_io_out[m+n+90], io_out_45_Im);
       $display("Expected io_out_45_Re is %h, dut output is %h", output_io_out[m+n+91], io_out_45_Re);
       $display("Expected io_out_46_Im is %h, dut output is %h", output_io_out[m+n+92], io_out_46_Im);
       $display("Expected io_out_46_Re is %h, dut output is %h", output_io_out[m+n+93], io_out_46_Re);
       $display("Expected io_out_47_Im is %h, dut output is %h", output_io_out[m+n+94], io_out_47_Im);
       $display("Expected io_out_47_Re is %h, dut output is %h", output_io_out[m+n+95], io_out_47_Re);
       $display("Expected io_out_48_Im is %h, dut output is %h", output_io_out[m+n+96], io_out_48_Im);
       $display("Expected io_out_48_Re is %h, dut output is %h", output_io_out[m+n+97], io_out_48_Re);
       $display("Expected io_out_49_Im is %h, dut output is %h", output_io_out[m+n+98], io_out_49_Im);
       $display("Expected io_out_49_Re is %h, dut output is %h", output_io_out[m+n+99], io_out_49_Re);
       $display("Expected io_out_50_Im is %h, dut output is %h", output_io_out[m+n+100], io_out_50_Im);
       $display("Expected io_out_50_Re is %h, dut output is %h", output_io_out[m+n+101], io_out_50_Re);
       $display("Expected io_out_51_Im is %h, dut output is %h", output_io_out[m+n+102], io_out_51_Im);
       $display("Expected io_out_51_Im is %h, dut output is %h", output_io_out[m+n+103], io_out_51_Im);
       $display("Expected io_out_52_Re is %h, dut output is %h", output_io_out[m+n+104], io_out_52_Re);
       $display("Expected io_out_52_Im is %h, dut output is %h", output_io_out[m+n+105], io_out_52_Im);
       $display("Expected io_out_53_Re is %h, dut output is %h", output_io_out[m+n+106], io_out_53_Re);
       $display("Expected io_out_53_Im is %h, dut output is %h", output_io_out[m+n+107], io_out_53_Im);
       $display("Expected io_out_54_Re is %h, dut output is %h", output_io_out[m+n+108], io_out_54_Re);
       $display("Expected io_out_54_Im is %h, dut output is %h", output_io_out[m+n+109], io_out_54_Im);
       $display("Expected io_out_55_Re is %h, dut output is %h", output_io_out[m+n+110], io_out_55_Re);
       $display("Expected io_out_55_Im is %h, dut output is %h", output_io_out[m+n+111], io_out_55_Im);
       $display("Expected io_out_56_Re is %h, dut output is %h", output_io_out[m+n+112], io_out_56_Re);
       $display("Expected io_out_56_Im is %h, dut output is %h", output_io_out[m+n+113], io_out_56_Im);
       $display("Expected io_out_57_Re is %h, dut output is %h", output_io_out[m+n+114], io_out_57_Re);
       $display("Expected io_out_57_Im is %h, dut output is %h", output_io_out[m+n+115], io_out_57_Im);
       $display("Expected io_out_58_Re is %h, dut output is %h", output_io_out[m+n+116], io_out_58_Re);
       $display("Expected io_out_58_Im is %h, dut output is %h", output_io_out[m+n+117], io_out_58_Im);
       $display("Expected io_out_59_Re is %h, dut output is %h", output_io_out[m+n+118], io_out_59_Re);
       $display("Expected io_out_59_Im is %h, dut output is %h", output_io_out[m+n+119], io_out_59_Im);
       $display("Expected io_out_60_Im is %h, dut output is %h", output_io_out[m+n+120], io_out_60_Im);
       $display("Expected io_out_60_Re is %h, dut output is %h", output_io_out[m+n+121], io_out_60_Re);
       $display("Expected io_out_61_Im is %h, dut output is %h", output_io_out[m+n+122], io_out_61_Im);
       $display("Expected io_out_61_Re is %h, dut output is %h", output_io_out[m+n+123], io_out_61_Re);
       $display("Expected io_out_62_Im is %h, dut output is %h", output_io_out[m+n+124], io_out_62_Im);
       $display("Expected io_out_62_Re is %h, dut output is %h", output_io_out[m+n+125], io_out_62_Re);
       $display("Expected io_out_63_Im is %h, dut output is %h", output_io_out[m+n+126], io_out_63_Im);
       $display("Expected io_out_63_Re is %h, dut output is %h", output_io_out[m+n+127], io_out_63_Re);
       $display("Expected io_out_64_Im is %h, dut output is %h", output_io_out[m+n+128], io_out_64_Im);
       $display("Expected io_out_64_Re is %h, dut output is %h", output_io_out[m+n+129], io_out_64_Re);
       $display("Expected io_out_65_Im is %h, dut output is %h", output_io_out[m+n+130], io_out_65_Im);
       $display("Expected io_out_65_Re is %h, dut output is %h", output_io_out[m+n+131], io_out_65_Re);
       $display("Expected io_out_66_Im is %h, dut output is %h", output_io_out[m+n+132], io_out_66_Im);
       $display("Expected io_out_66_Re is %h, dut output is %h", output_io_out[m+n+133], io_out_66_Re);
       $display("Expected io_out_67_Im is %h, dut output is %h", output_io_out[m+n+134], io_out_67_Im);
       $display("Expected io_out_67_Re is %h, dut output is %h", output_io_out[m+n+135], io_out_67_Re);
       $display("Expected io_out_68_Im is %h, dut output is %h", output_io_out[m+n+136], io_out_68_Im);
       $display("Expected io_out_68_Im is %h, dut output is %h", output_io_out[m+n+137], io_out_68_Im);
       $display("Expected io_out_69_Re is %h, dut output is %h", output_io_out[m+n+138], io_out_69_Re);
       $display("Expected io_out_69_Im is %h, dut output is %h", output_io_out[m+n+139], io_out_69_Im);
       $display("Expected io_out_70_Re is %h, dut output is %h", output_io_out[m+n+140], io_out_70_Re);
       $display("Expected io_out_70_Im is %h, dut output is %h", output_io_out[m+n+141], io_out_70_Im);
       $display("Expected io_out_71_Re is %h, dut output is %h", output_io_out[m+n+142], io_out_71_Re);
       $display("Expected io_out_71_Im is %h, dut output is %h", output_io_out[m+n+143], io_out_71_Im);
       $display("Expected io_out_72_Re is %h, dut output is %h", output_io_out[m+n+144], io_out_72_Re);
       $display("Expected io_out_72_Im is %h, dut output is %h", output_io_out[m+n+145], io_out_72_Im);
       $display("Expected io_out_73_Re is %h, dut output is %h", output_io_out[m+n+146], io_out_73_Re);
       $display("Expected io_out_73_Im is %h, dut output is %h", output_io_out[m+n+147], io_out_73_Im);
       $display("Expected io_out_74_Re is %h, dut output is %h", output_io_out[m+n+148], io_out_74_Re);
       $display("Expected io_out_74_Im is %h, dut output is %h", output_io_out[m+n+149], io_out_74_Im);
       $display("Expected io_out_75_Re is %h, dut output is %h", output_io_out[m+n+150], io_out_75_Re);
       $display("Expected io_out_75_Im is %h, dut output is %h", output_io_out[m+n+151], io_out_75_Im);
       $display("Expected io_out_76_Re is %h, dut output is %h", output_io_out[m+n+152], io_out_76_Re);
       $display("Expected io_out_76_Im is %h, dut output is %h", output_io_out[m+n+153], io_out_76_Im);
       $display("Expected io_out_77_Im is %h, dut output is %h", output_io_out[m+n+154], io_out_77_Im);
       $display("Expected io_out_77_Re is %h, dut output is %h", output_io_out[m+n+155], io_out_77_Re);
       $display("Expected io_out_78_Im is %h, dut output is %h", output_io_out[m+n+156], io_out_78_Im);
       $display("Expected io_out_78_Re is %h, dut output is %h", output_io_out[m+n+157], io_out_78_Re);
       $display("Expected io_out_79_Im is %h, dut output is %h", output_io_out[m+n+158], io_out_79_Im);
       $display("Expected io_out_79_Re is %h, dut output is %h", output_io_out[m+n+159], io_out_79_Re);
       $display("Expected io_out_80_Im is %h, dut output is %h", output_io_out[m+n+160], io_out_80_Im);
       $display("Expected io_out_80_Re is %h, dut output is %h", output_io_out[m+n+161], io_out_80_Re);
       $display("Expected io_out_81_Im is %h, dut output is %h", output_io_out[m+n+162], io_out_81_Im);
       $display("Expected io_out_81_Re is %h, dut output is %h", output_io_out[m+n+163], io_out_81_Re);
       $display("Expected io_out_82_Im is %h, dut output is %h", output_io_out[m+n+164], io_out_82_Im);
       $display("Expected io_out_82_Re is %h, dut output is %h", output_io_out[m+n+165], io_out_82_Re);
       $display("Expected io_out_83_Im is %h, dut output is %h", output_io_out[m+n+166], io_out_83_Im);
       $display("Expected io_out_83_Re is %h, dut output is %h", output_io_out[m+n+167], io_out_83_Re);
       $display("Expected io_out_84_Im is %h, dut output is %h", output_io_out[m+n+168], io_out_84_Im);
       $display("Expected io_out_84_Re is %h, dut output is %h", output_io_out[m+n+169], io_out_84_Re);
       $display("Expected io_out_85_Im is %h, dut output is %h", output_io_out[m+n+170], io_out_85_Im);
       $display("Expected io_out_85_Im is %h, dut output is %h", output_io_out[m+n+171], io_out_85_Im);
       $display("Expected io_out_86_Re is %h, dut output is %h", output_io_out[m+n+172], io_out_86_Re);
       $display("Expected io_out_86_Im is %h, dut output is %h", output_io_out[m+n+173], io_out_86_Im);
       $display("Expected io_out_87_Re is %h, dut output is %h", output_io_out[m+n+174], io_out_87_Re);
       $display("Expected io_out_87_Im is %h, dut output is %h", output_io_out[m+n+175], io_out_87_Im);
       $display("Expected io_out_88_Re is %h, dut output is %h", output_io_out[m+n+176], io_out_88_Re);
       $display("Expected io_out_88_Im is %h, dut output is %h", output_io_out[m+n+177], io_out_88_Im);
       $display("Expected io_out_89_Re is %h, dut output is %h", output_io_out[m+n+178], io_out_89_Re);
       $display("Expected io_out_89_Im is %h, dut output is %h", output_io_out[m+n+179], io_out_89_Im);
       $display("Expected io_out_90_Re is %h, dut output is %h", output_io_out[m+n+180], io_out_90_Re);
       $display("Expected io_out_90_Im is %h, dut output is %h", output_io_out[m+n+181], io_out_90_Im);
       $display("Expected io_out_91_Re is %h, dut output is %h", output_io_out[m+n+182], io_out_91_Re);
       $display("Expected io_out_91_Im is %h, dut output is %h", output_io_out[m+n+183], io_out_91_Im);
       $display("Expected io_out_92_Re is %h, dut output is %h", output_io_out[m+n+184], io_out_92_Re);
       $display("Expected io_out_92_Im is %h, dut output is %h", output_io_out[m+n+185], io_out_92_Im);
       $display("Expected io_out_93_Re is %h, dut output is %h", output_io_out[m+n+186], io_out_93_Re);
       $display("Expected io_out_93_Im is %h, dut output is %h", output_io_out[m+n+187], io_out_93_Im);
       $display("Expected io_out_94_Im is %h, dut output is %h", output_io_out[m+n+188], io_out_94_Im);
       $display("Expected io_out_94_Re is %h, dut output is %h", output_io_out[m+n+189], io_out_94_Re);
       $display("Expected io_out_95_Im is %h, dut output is %h", output_io_out[m+n+190], io_out_95_Im);
       $display("Expected io_out_95_Re is %h, dut output is %h", output_io_out[m+n+191], io_out_95_Re);
	  `endif
        `endif
      `endif
    `endif
  `endif
`endif
       $display("-------------------------------------------------------");
     end else begin
       $display("-------------------------------------------------------");
       $display("At %d ns, the %d check FAIL!!! debug=%p, no. is %d", $time, m+n/2/`FFT_WT, debug, m+n);

`ifdef FFT_ST_WT2
       $display("Expected io_out_0_Re is %h, dut output is %h", output_io_out[m+n],io_out_0_Re);
       $display("Expected io_out_0_Im is %h, dut output is %h", output_io_out[m+n+1],io_out_0_Im);
       $display("Expected io_out_1_Re is %h, dut output is %h", output_io_out[m+n+2],io_out_1_Re);
       $display("Expected io_out_1_Im is %h, dut output is %h", output_io_out[m+n+3],io_out_1_Im);
    `ifdef FFT_ST_WT4
       $display("Expected io_out_2_Re is %h, dut output is %h", output_io_out[m+n+4],io_out_2_Re);
       $display("Expected io_out_2_Im is %h, dut output is %h", output_io_out[m+n+5],io_out_2_Im);
       $display("Expected io_out_3_Re is %h, dut output is %h", output_io_out[m+n+6],io_out_3_Re);
       $display("Expected io_out_3_Im is %h, dut output is %h", output_io_out[m+n+7],io_out_3_Im);
      `ifdef FFT_ST_WT8
       $display("Expected io_out_4_Re is %h, dut output is %h", output_io_out[m+n+8], io_out_4_Re);
       $display("Expected io_out_4_Im is %h, dut output is %h", output_io_out[m+n+9], io_out_4_Im);
       $display("Expected io_out_5_Re is %h, dut output is %h", output_io_out[m+n+10],io_out_5_Re);
       $display("Expected io_out_5_Im is %h, dut output is %h", output_io_out[m+n+11],io_out_5_Im);
       $display("Expected io_out_6_Re is %h, dut output is %h", output_io_out[m+n+12],io_out_6_Re);
       $display("Expected io_out_6_Im is %h, dut output is %h", output_io_out[m+n+13],io_out_6_Im);
       $display("Expected io_out_7_Re is %h, dut output is %h", output_io_out[m+n+14],io_out_7_Re);
       $display("Expected io_out_7_Im is %h, dut output is %h", output_io_out[m+n+15],io_out_7_Im);
       `ifdef FFT_ST_WT16
       $display("Expected io_out_8_Re is %h, dut output is %h", output_io_out[m+n+16],io_out_8_Re);
       $display("Expected io_out_8_Im is %h, dut output is %h", output_io_out[m+n+17],io_out_8_Im);
       $display("Expected io_out_9_Re is %h, dut output is %h", output_io_out[m+n+18],io_out_9_Re);
       $display("Expected io_out_9_Im is %h, dut output is %h", output_io_out[m+n+19],io_out_9_Im);
       $display("Expected io_out_10_Re is %h, dut output is %h", output_io_out[m+n+20],io_out_10_Re);
       $display("Expected io_out_10_Im is %h, dut output is %h", output_io_out[m+n+21],io_out_10_Im);
       $display("Expected io_out_11_Re is %h, dut output is %h", output_io_out[m+n+22],io_out_11_Re);
       $display("Expected io_out_11_Im is %h, dut output is %h", output_io_out[m+n+23],io_out_11_Im);
       $display("Expected io_out_12_Re is %h, dut output is %h", output_io_out[m+n+24],io_out_12_Re);
       $display("Expected io_out_12_Im is %h, dut output is %h", output_io_out[m+n+25],io_out_12_Im);
       $display("Expected io_out_13_Re is %h, dut output is %h", output_io_out[m+n+26],io_out_13_Re);
       $display("Expected io_out_13_Im is %h, dut output is %h", output_io_out[m+n+27],io_out_13_Im);
       $display("Expected io_out_14_Re is %h, dut output is %h", output_io_out[m+n+28],io_out_14_Re);
       $display("Expected io_out_14_Im is %h, dut output is %h", output_io_out[m+n+29],io_out_14_Im);
       $display("Expected io_out_15_Re is %h, dut output is %h", output_io_out[m+n+30],io_out_15_Re);
       $display("Expected io_out_15_Im is %h, dut output is %h", output_io_out[m+n+31],io_out_15_Im);
         `ifdef FFT_ST_WT32
       $display("Expected io_out_16_Re is %h, dut output is %h", output_io_out[m+n+32], io_out_16_Re);
       $display("Expected io_out_16_Im is %h, dut output is %h", output_io_out[m+n+33], io_out_16_Im);
       $display("Expected io_out_17_Re is %h, dut output is %h", output_io_out[m+n+34], io_out_17_Re);
       $display("Expected io_out_17_Im is %h, dut output is %h", output_io_out[m+n+35], io_out_17_Im);
       $display("Expected io_out_18_Re is %h, dut output is %h", output_io_out[m+n+36], io_out_18_Re);
       $display("Expected io_out_18_Im is %h, dut output is %h", output_io_out[m+n+37], io_out_18_Im);
       $display("Expected io_out_19_Re is %h, dut output is %h", output_io_out[m+n+38], io_out_19_Re);
       $display("Expected io_out_19_Im is %h, dut output is %h", output_io_out[m+n+39], io_out_19_Im);
       $display("Expected io_out_20_Re is %h, dut output is %h", output_io_out[m+n+40], io_out_20_Re);
       $display("Expected io_out_20_Im is %h, dut output is %h", output_io_out[m+n+41], io_out_20_Im);
       $display("Expected io_out_21_Re is %h, dut output is %h", output_io_out[m+n+42], io_out_21_Re);
       $display("Expected io_out_21_Im is %h, dut output is %h", output_io_out[m+n+43], io_out_21_Im);
       $display("Expected io_out_22_Re is %h, dut output is %h", output_io_out[m+n+44], io_out_22_Re);
       $display("Expected io_out_22_Im is %h, dut output is %h", output_io_out[m+n+45], io_out_22_Im);
       $display("Expected io_out_23_Re is %h, dut output is %h", output_io_out[m+n+46], io_out_23_Re);
       $display("Expected io_out_23_Im is %h, dut output is %h", output_io_out[m+n+47], io_out_23_Im);
       $display("Expected io_out_24_Re is %h, dut output is %h", output_io_out[m+n+48], io_out_24_Re);
       $display("Expected io_out_24_Im is %h, dut output is %h", output_io_out[m+n+49], io_out_24_Im);
       $display("Expected io_out_25_Re is %h, dut output is %h", output_io_out[m+n+50], io_out_25_Re);
       $display("Expected io_out_25_Im is %h, dut output is %h", output_io_out[m+n+51], io_out_25_Im);
       $display("Expected io_out_26_Re is %h, dut output is %h", output_io_out[m+n+52], io_out_26_Re);
       $display("Expected io_out_26_Im is %h, dut output is %h", output_io_out[m+n+53], io_out_26_Im);
       $display("Expected io_out_27_Re is %h, dut output is %h", output_io_out[m+n+54], io_out_27_Re);
       $display("Expected io_out_27_Im is %h, dut output is %h", output_io_out[m+n+55], io_out_27_Im);
       $display("Expected io_out_28_Re is %h, dut output is %h", output_io_out[m+n+56], io_out_28_Re);
       $display("Expected io_out_28_Im is %h, dut output is %h", output_io_out[m+n+57], io_out_28_Im);
       $display("Expected io_out_29_Re is %h, dut output is %h", output_io_out[m+n+58], io_out_29_Re);
       $display("Expected io_out_29_Im is %h, dut output is %h", output_io_out[m+n+59], io_out_29_Im);
       $display("Expected io_out_30_Re is %h, dut output is %h", output_io_out[m+n+60], io_out_30_Re);
       $display("Expected io_out_30_Im is %h, dut output is %h", output_io_out[m+n+61], io_out_30_Im);
       $display("Expected io_out_31_Re is %h, dut output is %h", output_io_out[m+n+62], io_out_31_Re);
       $display("Expected io_out_31_Im is %h, dut output is %h", output_io_out[m+n+63], io_out_31_Im);
             `ifdef FFT_ST_WT96
       $display("Expected io_out_32_Re is %h, dut output is %h", output_io_out[m+n+64], io_out_32_Re);
       $display("Expected io_out_32_Im is %h, dut output is %h", output_io_out[m+n+65], io_out_32_Im);
       $display("Expected io_out_33_Re is %h, dut output is %h", output_io_out[m+n+66], io_out_33_Re);
       $display("Expected io_out_33_Im is %h, dut output is %h", output_io_out[m+n+67], io_out_33_Im);
       $display("Expected io_out_34_Re is %h, dut output is %h", output_io_out[m+n+68], io_out_34_Re);
       $display("Expected io_out_34_Im is %h, dut output is %h", output_io_out[m+n+69], io_out_34_Im);
       $display("Expected io_out_35_Re is %h, dut output is %h", output_io_out[m+n+70], io_out_35_Re);
       $display("Expected io_out_35_Im is %h, dut output is %h", output_io_out[m+n+71], io_out_35_Im);
       $display("Expected io_out_36_Re is %h, dut output is %h", output_io_out[m+n+72], io_out_36_Re);
       $display("Expected io_out_36_Re is %h, dut output is %h", output_io_out[m+n+73], io_out_36_Re);
       $display("Expected io_out_37_Re is %h, dut output is %h", output_io_out[m+n+74], io_out_37_Re);
       $display("Expected io_out_37_Re is %h, dut output is %h", output_io_out[m+n+75], io_out_37_Re);
       $display("Expected io_out_38_Re is %h, dut output is %h", output_io_out[m+n+76], io_out_38_Re);
       $display("Expected io_out_38_Re is %h, dut output is %h", output_io_out[m+n+77], io_out_38_Re);
       $display("Expected io_out_39_Re is %h, dut output is %h", output_io_out[m+n+78], io_out_39_Re);
       $display("Expected io_out_39_Re is %h, dut output is %h", output_io_out[m+n+79], io_out_39_Re);
       $display("Expected io_out_40_Re is %h, dut output is %h", output_io_out[m+n+80], io_out_40_Re);
       $display("Expected io_out_40_Re is %h, dut output is %h", output_io_out[m+n+81], io_out_40_Re);
       $display("Expected io_out_41_Re is %h, dut output is %h", output_io_out[m+n+82], io_out_41_Re);
       $display("Expected io_out_41_Re is %h, dut output is %h", output_io_out[m+n+83], io_out_41_Re);
       $display("Expected io_out_42_Re is %h, dut output is %h", output_io_out[m+n+84], io_out_42_Re);
       $display("Expected io_out_42_Re is %h, dut output is %h", output_io_out[m+n+85], io_out_42_Re);
       $display("Expected io_out_43_Im is %h, dut output is %h", output_io_out[m+n+86], io_out_43_Im);
       $display("Expected io_out_43_Re is %h, dut output is %h", output_io_out[m+n+87], io_out_43_Re);
       $display("Expected io_out_44_Im is %h, dut output is %h", output_io_out[m+n+88], io_out_44_Im);
       $display("Expected io_out_44_Re is %h, dut output is %h", output_io_out[m+n+89], io_out_44_Re);
       $display("Expected io_out_45_Im is %h, dut output is %h", output_io_out[m+n+90], io_out_45_Im);
       $display("Expected io_out_45_Re is %h, dut output is %h", output_io_out[m+n+91], io_out_45_Re);
       $display("Expected io_out_46_Im is %h, dut output is %h", output_io_out[m+n+92], io_out_46_Im);
       $display("Expected io_out_46_Re is %h, dut output is %h", output_io_out[m+n+93], io_out_46_Re);
       $display("Expected io_out_47_Im is %h, dut output is %h", output_io_out[m+n+94], io_out_47_Im);
       $display("Expected io_out_47_Re is %h, dut output is %h", output_io_out[m+n+95], io_out_47_Re);
       $display("Expected io_out_48_Im is %h, dut output is %h", output_io_out[m+n+96], io_out_48_Im);
       $display("Expected io_out_48_Re is %h, dut output is %h", output_io_out[m+n+97], io_out_48_Re);
       $display("Expected io_out_49_Im is %h, dut output is %h", output_io_out[m+n+98], io_out_49_Im);
       $display("Expected io_out_49_Re is %h, dut output is %h", output_io_out[m+n+99], io_out_49_Re);
       $display("Expected io_out_50_Im is %h, dut output is %h", output_io_out[m+n+100], io_out_50_Im);
       $display("Expected io_out_50_Re is %h, dut output is %h", output_io_out[m+n+101], io_out_50_Re);
       $display("Expected io_out_51_Im is %h, dut output is %h", output_io_out[m+n+102], io_out_51_Im);
       $display("Expected io_out_51_Im is %h, dut output is %h", output_io_out[m+n+103], io_out_51_Im);
       $display("Expected io_out_52_Re is %h, dut output is %h", output_io_out[m+n+104], io_out_52_Re);
       $display("Expected io_out_52_Im is %h, dut output is %h", output_io_out[m+n+105], io_out_52_Im);
       $display("Expected io_out_53_Re is %h, dut output is %h", output_io_out[m+n+106], io_out_53_Re);
       $display("Expected io_out_53_Im is %h, dut output is %h", output_io_out[m+n+107], io_out_53_Im);
       $display("Expected io_out_54_Re is %h, dut output is %h", output_io_out[m+n+108], io_out_54_Re);
       $display("Expected io_out_54_Im is %h, dut output is %h", output_io_out[m+n+109], io_out_54_Im);
       $display("Expected io_out_55_Re is %h, dut output is %h", output_io_out[m+n+110], io_out_55_Re);
       $display("Expected io_out_55_Im is %h, dut output is %h", output_io_out[m+n+111], io_out_55_Im);
       $display("Expected io_out_56_Re is %h, dut output is %h", output_io_out[m+n+112], io_out_56_Re);
       $display("Expected io_out_56_Im is %h, dut output is %h", output_io_out[m+n+113], io_out_56_Im);
       $display("Expected io_out_57_Re is %h, dut output is %h", output_io_out[m+n+114], io_out_57_Re);
       $display("Expected io_out_57_Im is %h, dut output is %h", output_io_out[m+n+115], io_out_57_Im);
       $display("Expected io_out_58_Re is %h, dut output is %h", output_io_out[m+n+116], io_out_58_Re);
       $display("Expected io_out_58_Im is %h, dut output is %h", output_io_out[m+n+117], io_out_58_Im);
       $display("Expected io_out_59_Re is %h, dut output is %h", output_io_out[m+n+118], io_out_59_Re);
       $display("Expected io_out_59_Im is %h, dut output is %h", output_io_out[m+n+119], io_out_59_Im);
       $display("Expected io_out_60_Im is %h, dut output is %h", output_io_out[m+n+120], io_out_60_Im);
       $display("Expected io_out_60_Re is %h, dut output is %h", output_io_out[m+n+121], io_out_60_Re);
       $display("Expected io_out_61_Im is %h, dut output is %h", output_io_out[m+n+122], io_out_61_Im);
       $display("Expected io_out_61_Re is %h, dut output is %h", output_io_out[m+n+123], io_out_61_Re);
       $display("Expected io_out_62_Im is %h, dut output is %h", output_io_out[m+n+124], io_out_62_Im);
       $display("Expected io_out_62_Re is %h, dut output is %h", output_io_out[m+n+125], io_out_62_Re);
       $display("Expected io_out_63_Im is %h, dut output is %h", output_io_out[m+n+126], io_out_63_Im);
       $display("Expected io_out_63_Re is %h, dut output is %h", output_io_out[m+n+127], io_out_63_Re);
       $display("Expected io_out_64_Im is %h, dut output is %h", output_io_out[m+n+128], io_out_64_Im);
       $display("Expected io_out_64_Re is %h, dut output is %h", output_io_out[m+n+129], io_out_64_Re);
       $display("Expected io_out_65_Im is %h, dut output is %h", output_io_out[m+n+130], io_out_65_Im);
       $display("Expected io_out_65_Re is %h, dut output is %h", output_io_out[m+n+131], io_out_65_Re);
       $display("Expected io_out_66_Im is %h, dut output is %h", output_io_out[m+n+132], io_out_66_Im);
       $display("Expected io_out_66_Re is %h, dut output is %h", output_io_out[m+n+133], io_out_66_Re);
       $display("Expected io_out_67_Im is %h, dut output is %h", output_io_out[m+n+134], io_out_67_Im);
       $display("Expected io_out_67_Re is %h, dut output is %h", output_io_out[m+n+135], io_out_67_Re);
       $display("Expected io_out_68_Im is %h, dut output is %h", output_io_out[m+n+136], io_out_68_Im);
       $display("Expected io_out_68_Im is %h, dut output is %h", output_io_out[m+n+137], io_out_68_Im);
       $display("Expected io_out_69_Re is %h, dut output is %h", output_io_out[m+n+138], io_out_69_Re);
       $display("Expected io_out_69_Im is %h, dut output is %h", output_io_out[m+n+139], io_out_69_Im);
       $display("Expected io_out_70_Re is %h, dut output is %h", output_io_out[m+n+140], io_out_70_Re);
       $display("Expected io_out_70_Im is %h, dut output is %h", output_io_out[m+n+141], io_out_70_Im);
       $display("Expected io_out_71_Re is %h, dut output is %h", output_io_out[m+n+142], io_out_71_Re);
       $display("Expected io_out_71_Im is %h, dut output is %h", output_io_out[m+n+143], io_out_71_Im);
       $display("Expected io_out_72_Re is %h, dut output is %h", output_io_out[m+n+144], io_out_72_Re);
       $display("Expected io_out_72_Im is %h, dut output is %h", output_io_out[m+n+145], io_out_72_Im);
       $display("Expected io_out_73_Re is %h, dut output is %h", output_io_out[m+n+146], io_out_73_Re);
       $display("Expected io_out_73_Im is %h, dut output is %h", output_io_out[m+n+147], io_out_73_Im);
       $display("Expected io_out_74_Re is %h, dut output is %h", output_io_out[m+n+148], io_out_74_Re);
       $display("Expected io_out_74_Im is %h, dut output is %h", output_io_out[m+n+149], io_out_74_Im);
       $display("Expected io_out_75_Re is %h, dut output is %h", output_io_out[m+n+150], io_out_75_Re);
       $display("Expected io_out_75_Im is %h, dut output is %h", output_io_out[m+n+151], io_out_75_Im);
       $display("Expected io_out_76_Re is %h, dut output is %h", output_io_out[m+n+152], io_out_76_Re);
       $display("Expected io_out_76_Im is %h, dut output is %h", output_io_out[m+n+153], io_out_76_Im);
       $display("Expected io_out_77_Im is %h, dut output is %h", output_io_out[m+n+154], io_out_77_Im);
       $display("Expected io_out_77_Re is %h, dut output is %h", output_io_out[m+n+155], io_out_77_Re);
       $display("Expected io_out_78_Im is %h, dut output is %h", output_io_out[m+n+156], io_out_78_Im);
       $display("Expected io_out_78_Re is %h, dut output is %h", output_io_out[m+n+157], io_out_78_Re);
       $display("Expected io_out_79_Im is %h, dut output is %h", output_io_out[m+n+158], io_out_79_Im);
       $display("Expected io_out_79_Re is %h, dut output is %h", output_io_out[m+n+159], io_out_79_Re);
       $display("Expected io_out_80_Im is %h, dut output is %h", output_io_out[m+n+160], io_out_80_Im);
       $display("Expected io_out_80_Re is %h, dut output is %h", output_io_out[m+n+161], io_out_80_Re);
       $display("Expected io_out_81_Im is %h, dut output is %h", output_io_out[m+n+162], io_out_81_Im);
       $display("Expected io_out_81_Re is %h, dut output is %h", output_io_out[m+n+163], io_out_81_Re);
       $display("Expected io_out_82_Im is %h, dut output is %h", output_io_out[m+n+164], io_out_82_Im);
       $display("Expected io_out_82_Re is %h, dut output is %h", output_io_out[m+n+165], io_out_82_Re);
       $display("Expected io_out_83_Im is %h, dut output is %h", output_io_out[m+n+166], io_out_83_Im);
       $display("Expected io_out_83_Re is %h, dut output is %h", output_io_out[m+n+167], io_out_83_Re);
       $display("Expected io_out_84_Im is %h, dut output is %h", output_io_out[m+n+168], io_out_84_Im);
       $display("Expected io_out_84_Re is %h, dut output is %h", output_io_out[m+n+169], io_out_84_Re);
       $display("Expected io_out_85_Im is %h, dut output is %h", output_io_out[m+n+170], io_out_85_Im);
       $display("Expected io_out_85_Im is %h, dut output is %h", output_io_out[m+n+171], io_out_85_Im);
       $display("Expected io_out_86_Re is %h, dut output is %h", output_io_out[m+n+172], io_out_86_Re);
       $display("Expected io_out_86_Im is %h, dut output is %h", output_io_out[m+n+173], io_out_86_Im);
       $display("Expected io_out_87_Re is %h, dut output is %h", output_io_out[m+n+174], io_out_87_Re);
       $display("Expected io_out_87_Im is %h, dut output is %h", output_io_out[m+n+175], io_out_87_Im);
       $display("Expected io_out_88_Re is %h, dut output is %h", output_io_out[m+n+176], io_out_88_Re);
       $display("Expected io_out_88_Im is %h, dut output is %h", output_io_out[m+n+177], io_out_88_Im);
       $display("Expected io_out_89_Re is %h, dut output is %h", output_io_out[m+n+178], io_out_89_Re);
       $display("Expected io_out_89_Im is %h, dut output is %h", output_io_out[m+n+179], io_out_89_Im);
       $display("Expected io_out_90_Re is %h, dut output is %h", output_io_out[m+n+180], io_out_90_Re);
       $display("Expected io_out_90_Im is %h, dut output is %h", output_io_out[m+n+181], io_out_90_Im);
       $display("Expected io_out_91_Re is %h, dut output is %h", output_io_out[m+n+182], io_out_91_Re);
       $display("Expected io_out_91_Im is %h, dut output is %h", output_io_out[m+n+183], io_out_91_Im);
       $display("Expected io_out_92_Re is %h, dut output is %h", output_io_out[m+n+184], io_out_92_Re);
       $display("Expected io_out_92_Im is %h, dut output is %h", output_io_out[m+n+185], io_out_92_Im);
       $display("Expected io_out_93_Re is %h, dut output is %h", output_io_out[m+n+186], io_out_93_Re);
       $display("Expected io_out_93_Im is %h, dut output is %h", output_io_out[m+n+187], io_out_93_Im);
       $display("Expected io_out_94_Im is %h, dut output is %h", output_io_out[m+n+188], io_out_94_Im);
       $display("Expected io_out_94_Re is %h, dut output is %h", output_io_out[m+n+189], io_out_94_Re);
       $display("Expected io_out_95_Im is %h, dut output is %h", output_io_out[m+n+190], io_out_95_Im);
       $display("Expected io_out_95_Re is %h, dut output is %h", output_io_out[m+n+191], io_out_95_Re);
	  `endif
        `endif
      `endif
    `endif
  `endif
`endif

        $display("-------------------------------------------------------");
        repeat (500) @(posedge clock);
        $stop;
      @(negedge clock);
      end //else for error
      @(negedge clock);
    end //first for loop
 `ifdef THD_FFT96
    do begin
      @(negedge clock);
    end while (~io_out_finish);
    do begin
      @(negedge clock);
    end while (~io_out_validate);
`else
`endif
  end //second for loop
end

endmodule