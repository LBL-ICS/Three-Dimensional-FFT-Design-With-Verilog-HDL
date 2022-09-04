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
                input  [15:0] mem_addr         ,
                input  [63:0] mem_wrdata0      ,
                input  [63:0] mem_wrdata1      ,
                output [63:0] mem_rddata0      ,
                output [63:0] mem_rddata1      );

parameter MATRIX_SIZE=96;

reg [63:0] mem[MATRIX_SIZE*MATRIX_SIZE-1:0];

wire wr_row0  = mem_wr ? (mem_addr<1*MATRIX_SIZE/2   )                               : 1'b0;
wire wr_row1  = mem_wr ? (mem_addr>1*MATRIX_SIZE/2-1 ) & (mem_addr<2*MATRIX_SIZE/2 ) : 1'b0;
wire wr_row2  = mem_wr ? (mem_addr>2*MATRIX_SIZE/2-1 ) & (mem_addr<3*MATRIX_SIZE/2 ) : 1'b0;
wire wr_row3  = mem_wr ? (mem_addr>3*MATRIX_SIZE/2-1 ) & (mem_addr<4*MATRIX_SIZE/2 ) : 1'b0;
wire wr_row4  = mem_wr ? (mem_addr>4*MATRIX_SIZE/2-1 ) & (mem_addr<5*MATRIX_SIZE/2 ) : 1'b0;
wire wr_row5  = mem_wr ? (mem_addr>5*MATRIX_SIZE/2-1 ) & (mem_addr<6*MATRIX_SIZE/2 ) : 1'b0;
wire wr_row6  = mem_wr ? (mem_addr>6*MATRIX_SIZE/2-1 ) & (mem_addr<7*MATRIX_SIZE/2 ) : 1'b0;
wire wr_row7  = mem_wr ? (mem_addr>7*MATRIX_SIZE/2-1 ) & (mem_addr<8*MATRIX_SIZE/2 ) : 1'b0;
wire wr_row8  = mem_wr ? (mem_addr>8*MATRIX_SIZE/2-1 ) & (mem_addr<9*MATRIX_SIZE/2 ) : 1'b0;
wire wr_row9  = mem_wr ? (mem_addr>9*MATRIX_SIZE/2-1 ) & (mem_addr<10*MATRIX_SIZE/2) : 1'b0;
wire wr_row10 = mem_wr ? (mem_addr>10*MATRIX_SIZE/2-1) & (mem_addr<11*MATRIX_SIZE/2) : 1'b0;
wire wr_row11 = mem_wr ? (mem_addr>11*MATRIX_SIZE/2-1) & (mem_addr<12*MATRIX_SIZE/2) : 1'b0;
wire wr_row12 = mem_wr ? (mem_addr>12*MATRIX_SIZE/2-1) & (mem_addr<13*MATRIX_SIZE/2) : 1'b0;
wire wr_row13 = mem_wr ? (mem_addr>13*MATRIX_SIZE/2-1) & (mem_addr<14*MATRIX_SIZE/2) : 1'b0;
wire wr_row14 = mem_wr ? (mem_addr>14*MATRIX_SIZE/2-1) & (mem_addr<15*MATRIX_SIZE/2) : 1'b0;
wire wr_row15 = mem_wr ? (mem_addr>15*MATRIX_SIZE/2-1) & (mem_addr<16*MATRIX_SIZE/2) : 1'b0;
wire wr_row16 = mem_wr ? (mem_addr>16*MATRIX_SIZE/2-1) & (mem_addr<17*MATRIX_SIZE/2) : 1'b0;
wire wr_row17 = mem_wr ? (mem_addr>17*MATRIX_SIZE/2-1) & (mem_addr<18*MATRIX_SIZE/2) : 1'b0;
wire wr_row18 = mem_wr ? (mem_addr>18*MATRIX_SIZE/2-1) & (mem_addr<19*MATRIX_SIZE/2) : 1'b0;
wire wr_row19 = mem_wr ? (mem_addr>19*MATRIX_SIZE/2-1) & (mem_addr<20*MATRIX_SIZE/2) : 1'b0;
wire wr_row20 = mem_wr ? (mem_addr>20*MATRIX_SIZE/2-1) & (mem_addr<21*MATRIX_SIZE/2) : 1'b0;
wire wr_row21 = mem_wr ? (mem_addr>21*MATRIX_SIZE/2-1) & (mem_addr<22*MATRIX_SIZE/2) : 1'b0;
wire wr_row22 = mem_wr ? (mem_addr>22*MATRIX_SIZE/2-1) & (mem_addr<23*MATRIX_SIZE/2) : 1'b0;
wire wr_row23 = mem_wr ? (mem_addr>23*MATRIX_SIZE/2-1) & (mem_addr<24*MATRIX_SIZE/2) : 1'b0;
wire wr_row24 = mem_wr ? (mem_addr>24*MATRIX_SIZE/2-1) & (mem_addr<25*MATRIX_SIZE/2) : 1'b0;
wire wr_row25 = mem_wr ? (mem_addr>25*MATRIX_SIZE/2-1) & (mem_addr<26*MATRIX_SIZE/2) : 1'b0;
wire wr_row26 = mem_wr ? (mem_addr>26*MATRIX_SIZE/2-1) & (mem_addr<27*MATRIX_SIZE/2) : 1'b0;
wire wr_row27 = mem_wr ? (mem_addr>27*MATRIX_SIZE/2-1) & (mem_addr<28*MATRIX_SIZE/2) : 1'b0;
wire wr_row28 = mem_wr ? (mem_addr>28*MATRIX_SIZE/2-1) & (mem_addr<29*MATRIX_SIZE/2) : 1'b0;
wire wr_row29 = mem_wr ? (mem_addr>29*MATRIX_SIZE/2-1) & (mem_addr<30*MATRIX_SIZE/2) : 1'b0;
wire wr_row30 = mem_wr ? (mem_addr>30*MATRIX_SIZE/2-1) & (mem_addr<31*MATRIX_SIZE/2) : 1'b0;
wire wr_row31 = mem_wr ? (mem_addr>31*MATRIX_SIZE/2-1) & (mem_addr<32*MATRIX_SIZE/2) : 1'b0;
wire wr_row32 = mem_wr ? (mem_addr>32*MATRIX_SIZE/2-1) & (mem_addr<33*MATRIX_SIZE/2) : 1'b0;
wire wr_row33 = mem_wr ? (mem_addr>33*MATRIX_SIZE/2-1) & (mem_addr<34*MATRIX_SIZE/2) : 1'b0;
wire wr_row34 = mem_wr ? (mem_addr>34*MATRIX_SIZE/2-1) & (mem_addr<35*MATRIX_SIZE/2) : 1'b0;
wire wr_row35 = mem_wr ? (mem_addr>35*MATRIX_SIZE/2-1) & (mem_addr<36*MATRIX_SIZE/2) : 1'b0;
wire wr_row36 = mem_wr ? (mem_addr>36*MATRIX_SIZE/2-1) & (mem_addr<37*MATRIX_SIZE/2) : 1'b0;
wire wr_row37 = mem_wr ? (mem_addr>37*MATRIX_SIZE/2-1) & (mem_addr<38*MATRIX_SIZE/2) : 1'b0;
wire wr_row38 = mem_wr ? (mem_addr>38*MATRIX_SIZE/2-1) & (mem_addr<39*MATRIX_SIZE/2) : 1'b0;
wire wr_row39 = mem_wr ? (mem_addr>39*MATRIX_SIZE/2-1) & (mem_addr<40*MATRIX_SIZE/2) : 1'b0;
wire wr_row40 = mem_wr ? (mem_addr>40*MATRIX_SIZE/2-1) & (mem_addr<41*MATRIX_SIZE/2) : 1'b0;
wire wr_row41 = mem_wr ? (mem_addr>41*MATRIX_SIZE/2-1) & (mem_addr<42*MATRIX_SIZE/2) : 1'b0;
wire wr_row42 = mem_wr ? (mem_addr>42*MATRIX_SIZE/2-1) & (mem_addr<43*MATRIX_SIZE/2) : 1'b0;
wire wr_row43 = mem_wr ? (mem_addr>43*MATRIX_SIZE/2-1) & (mem_addr<44*MATRIX_SIZE/2) : 1'b0;
wire wr_row44 = mem_wr ? (mem_addr>44*MATRIX_SIZE/2-1) & (mem_addr<45*MATRIX_SIZE/2) : 1'b0;
wire wr_row45 = mem_wr ? (mem_addr>45*MATRIX_SIZE/2-1) & (mem_addr<46*MATRIX_SIZE/2) : 1'b0;
wire wr_row46 = mem_wr ? (mem_addr>46*MATRIX_SIZE/2-1) & (mem_addr<47*MATRIX_SIZE/2) : 1'b0;
wire wr_row47 = mem_wr ? (mem_addr>47*MATRIX_SIZE/2-1) & (mem_addr<48*MATRIX_SIZE/2) : 1'b0;
wire wr_row48 = mem_wr ? (mem_addr>48*MATRIX_SIZE/2-1) & (mem_addr<49*MATRIX_SIZE/2) : 1'b0;
wire wr_row49 = mem_wr ? (mem_addr>49*MATRIX_SIZE/2-1) & (mem_addr<50*MATRIX_SIZE/2) : 1'b0;
wire wr_row50 = mem_wr ? (mem_addr>50*MATRIX_SIZE/2-1) & (mem_addr<51*MATRIX_SIZE/2) : 1'b0;
wire wr_row51 = mem_wr ? (mem_addr>51*MATRIX_SIZE/2-1) & (mem_addr<52*MATRIX_SIZE/2) : 1'b0;
wire wr_row52 = mem_wr ? (mem_addr>52*MATRIX_SIZE/2-1) & (mem_addr<53*MATRIX_SIZE/2) : 1'b0;
wire wr_row53 = mem_wr ? (mem_addr>53*MATRIX_SIZE/2-1) & (mem_addr<54*MATRIX_SIZE/2) : 1'b0;
wire wr_row54 = mem_wr ? (mem_addr>54*MATRIX_SIZE/2-1) & (mem_addr<55*MATRIX_SIZE/2) : 1'b0;
wire wr_row55 = mem_wr ? (mem_addr>55*MATRIX_SIZE/2-1) & (mem_addr<56*MATRIX_SIZE/2) : 1'b0;
wire wr_row56 = mem_wr ? (mem_addr>56*MATRIX_SIZE/2-1) & (mem_addr<57*MATRIX_SIZE/2) : 1'b0;
wire wr_row57 = mem_wr ? (mem_addr>57*MATRIX_SIZE/2-1) & (mem_addr<58*MATRIX_SIZE/2) : 1'b0;
wire wr_row58 = mem_wr ? (mem_addr>58*MATRIX_SIZE/2-1) & (mem_addr<59*MATRIX_SIZE/2) : 1'b0;
wire wr_row59 = mem_wr ? (mem_addr>59*MATRIX_SIZE/2-1) & (mem_addr<60*MATRIX_SIZE/2) : 1'b0;
wire wr_row60 = mem_wr ? (mem_addr>60*MATRIX_SIZE/2-1) & (mem_addr<61*MATRIX_SIZE/2) : 1'b0;
wire wr_row61 = mem_wr ? (mem_addr>61*MATRIX_SIZE/2-1) & (mem_addr<62*MATRIX_SIZE/2) : 1'b0;
wire wr_row62 = mem_wr ? (mem_addr>62*MATRIX_SIZE/2-1) & (mem_addr<63*MATRIX_SIZE/2) : 1'b0;
wire wr_row63 = mem_wr ? (mem_addr>63*MATRIX_SIZE/2-1) & (mem_addr<64*MATRIX_SIZE/2) : 1'b0;
wire wr_row64 = mem_wr ? (mem_addr>64*MATRIX_SIZE/2-1) & (mem_addr<65*MATRIX_SIZE/2) : 1'b0;
wire wr_row65 = mem_wr ? (mem_addr>65*MATRIX_SIZE/2-1) & (mem_addr<66*MATRIX_SIZE/2) : 1'b0;
wire wr_row66 = mem_wr ? (mem_addr>66*MATRIX_SIZE/2-1) & (mem_addr<67*MATRIX_SIZE/2) : 1'b0;
wire wr_row67 = mem_wr ? (mem_addr>67*MATRIX_SIZE/2-1) & (mem_addr<68*MATRIX_SIZE/2) : 1'b0;
wire wr_row68 = mem_wr ? (mem_addr>68*MATRIX_SIZE/2-1) & (mem_addr<69*MATRIX_SIZE/2) : 1'b0;
wire wr_row69 = mem_wr ? (mem_addr>69*MATRIX_SIZE/2-1) & (mem_addr<70*MATRIX_SIZE/2) : 1'b0;
wire wr_row70 = mem_wr ? (mem_addr>70*MATRIX_SIZE/2-1) & (mem_addr<71*MATRIX_SIZE/2) : 1'b0;
wire wr_row71 = mem_wr ? (mem_addr>71*MATRIX_SIZE/2-1) & (mem_addr<72*MATRIX_SIZE/2) : 1'b0;
wire wr_row72 = mem_wr ? (mem_addr>72*MATRIX_SIZE/2-1) & (mem_addr<73*MATRIX_SIZE/2) : 1'b0;
wire wr_row73 = mem_wr ? (mem_addr>73*MATRIX_SIZE/2-1) & (mem_addr<74*MATRIX_SIZE/2) : 1'b0;
wire wr_row74 = mem_wr ? (mem_addr>74*MATRIX_SIZE/2-1) & (mem_addr<75*MATRIX_SIZE/2) : 1'b0;
wire wr_row75 = mem_wr ? (mem_addr>75*MATRIX_SIZE/2-1) & (mem_addr<76*MATRIX_SIZE/2) : 1'b0;
wire wr_row76 = mem_wr ? (mem_addr>76*MATRIX_SIZE/2-1) & (mem_addr<77*MATRIX_SIZE/2) : 1'b0;
wire wr_row77 = mem_wr ? (mem_addr>77*MATRIX_SIZE/2-1) & (mem_addr<78*MATRIX_SIZE/2) : 1'b0;
wire wr_row78 = mem_wr ? (mem_addr>78*MATRIX_SIZE/2-1) & (mem_addr<79*MATRIX_SIZE/2) : 1'b0;
wire wr_row79 = mem_wr ? (mem_addr>79*MATRIX_SIZE/2-1) & (mem_addr<80*MATRIX_SIZE/2) : 1'b0;
wire wr_row80 = mem_wr ? (mem_addr>80*MATRIX_SIZE/2-1) & (mem_addr<81*MATRIX_SIZE/2) : 1'b0;
wire wr_row81 = mem_wr ? (mem_addr>81*MATRIX_SIZE/2-1) & (mem_addr<82*MATRIX_SIZE/2) : 1'b0;
wire wr_row82 = mem_wr ? (mem_addr>82*MATRIX_SIZE/2-1) & (mem_addr<83*MATRIX_SIZE/2) : 1'b0;
wire wr_row83 = mem_wr ? (mem_addr>83*MATRIX_SIZE/2-1) & (mem_addr<84*MATRIX_SIZE/2) : 1'b0;
wire wr_row84 = mem_wr ? (mem_addr>84*MATRIX_SIZE/2-1) & (mem_addr<85*MATRIX_SIZE/2) : 1'b0;
wire wr_row85 = mem_wr ? (mem_addr>85*MATRIX_SIZE/2-1) & (mem_addr<86*MATRIX_SIZE/2) : 1'b0;
wire wr_row86 = mem_wr ? (mem_addr>86*MATRIX_SIZE/2-1) & (mem_addr<87*MATRIX_SIZE/2) : 1'b0;
wire wr_row87 = mem_wr ? (mem_addr>87*MATRIX_SIZE/2-1) & (mem_addr<88*MATRIX_SIZE/2) : 1'b0;
wire wr_row88 = mem_wr ? (mem_addr>88*MATRIX_SIZE/2-1) & (mem_addr<89*MATRIX_SIZE/2) : 1'b0;
wire wr_row89 = mem_wr ? (mem_addr>89*MATRIX_SIZE/2-1) & (mem_addr<90*MATRIX_SIZE/2) : 1'b0;
wire wr_row90 = mem_wr ? (mem_addr>90*MATRIX_SIZE/2-1) & (mem_addr<91*MATRIX_SIZE/2) : 1'b0;
wire wr_row91 = mem_wr ? (mem_addr>91*MATRIX_SIZE/2-1) & (mem_addr<92*MATRIX_SIZE/2) : 1'b0;
wire wr_row92 = mem_wr ? (mem_addr>92*MATRIX_SIZE/2-1) & (mem_addr<93*MATRIX_SIZE/2) : 1'b0;
wire wr_row93 = mem_wr ? (mem_addr>93*MATRIX_SIZE/2-1) & (mem_addr<94*MATRIX_SIZE/2) : 1'b0;
wire wr_row94 = mem_wr ? (mem_addr>94*MATRIX_SIZE/2-1) & (mem_addr<95*MATRIX_SIZE/2) : 1'b0;
wire wr_row95 = mem_wr ? (mem_addr>95*MATRIX_SIZE/2-1) & (mem_addr<96*MATRIX_SIZE/2) : 1'b0;

wire [95:0] wr_rows = {wr_row0, wr_row1, wr_row2, wr_row3, wr_row4, wr_row5, wr_row6, wr_row7, wr_row8, wr_row9,  
                       wr_row10, wr_row11, wr_row12, wr_row13, wr_row14, wr_row15, wr_row16, wr_row17, wr_row18, wr_row19,  
                       wr_row20, wr_row21, wr_row22, wr_row23, wr_row24, wr_row25, wr_row26, wr_row27, wr_row28, wr_row29,  
                       wr_row30, wr_row31, wr_row32, wr_row33, wr_row34, wr_row35, wr_row36, wr_row37, wr_row38, wr_row39,  
                       wr_row40, wr_row41, wr_row42, wr_row43, wr_row44, wr_row45, wr_row46, wr_row47, wr_row48, wr_row49,  
                       wr_row50, wr_row51, wr_row52, wr_row53, wr_row54, wr_row55, wr_row56, wr_row57, wr_row58, wr_row59,  
                       wr_row60, wr_row61, wr_row62, wr_row63, wr_row64, wr_row65, wr_row66, wr_row67, wr_row68, wr_row69,  
                       wr_row70, wr_row71, wr_row72, wr_row73, wr_row74, wr_row75, wr_row76, wr_row77, wr_row78, wr_row79,  
                       wr_row80, wr_row81, wr_row82, wr_row83, wr_row84, wr_row85, wr_row86, wr_row87, wr_row88, wr_row89,  
                       wr_row90, wr_row91, wr_row92, wr_row93, wr_row94, wr_row95}; 


reg [15:0] wr_addr0;
reg [15:0] wr_addr1;
always @(reset,wr_rows,mem_addr) begin 
  if(reset) begin
    wr_addr0 <= 16'h0;
    wr_addr1 <= 16'h0;
  end else begin 
    case({wr_rows})
      96'h8000_0000_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-0*48)+0     ; wr_addr1 = 96*(2*(mem_addr-0*48)+1)+0     ;  end  
      96'h4000_0000_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-1*48)+1     ; wr_addr1 = 96*(2*(mem_addr-1*48)+1)+1     ;  end  
      96'h2000_0000_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-2*48)+2     ; wr_addr1 = 96*(2*(mem_addr-2*48)+1)+2     ;  end  
      96'h1000_0000_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-3*48)+3     ; wr_addr1 = 96*(2*(mem_addr-3*48)+1)+3     ;  end  
      96'h0800_0000_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-4*48)+4     ; wr_addr1 = 96*(2*(mem_addr-4*48)+1)+4     ;  end  
      96'h0400_0000_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-5*48)+5     ; wr_addr1 = 96*(2*(mem_addr-5*48)+1)+5     ;  end  
      96'h0200_0000_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-6*48)+6     ; wr_addr1 = 96*(2*(mem_addr-6*48)+1)+6     ;  end  
      96'h0100_0000_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-7*48)+7     ; wr_addr1 = 96*(2*(mem_addr-7*48)+1)+7     ;  end  
      96'h0080_0000_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-8*48)+8     ; wr_addr1 = 96*(2*(mem_addr-8*48)+1)+8     ;  end  
      96'h0040_0000_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-9*48)+9     ; wr_addr1 = 96*(2*(mem_addr-9*48)+1)+9     ;  end  
      96'h0020_0000_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-10*48)+10   ; wr_addr1 = 96*(2*(mem_addr-10*48)+1)+10   ;  end  
      96'h0010_0000_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-11*48)+11   ; wr_addr1 = 96*(2*(mem_addr-11*48)+1)+11   ;  end  
      96'h0008_0000_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-12*48)+12   ; wr_addr1 = 96*(2*(mem_addr-12*48)+1)+12   ;  end  
      96'h0004_0000_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-13*48)+13   ; wr_addr1 = 96*(2*(mem_addr-13*48)+1)+13   ;  end  
      96'h0002_0000_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-14*48)+14   ; wr_addr1 = 96*(2*(mem_addr-14*48)+1)+14   ;  end  
      96'h0001_0000_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-15*48)+15   ; wr_addr1 = 96*(2*(mem_addr-15*48)+1)+15   ;  end  
      96'h0000_8000_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-16*48)+16   ; wr_addr1 = 96*(2*(mem_addr-16*48)+1)+16   ;  end  
      96'h0000_4000_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-17*48)+17   ; wr_addr1 = 96*(2*(mem_addr-17*48)+1)+17   ;  end  
      96'h0000_2000_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-18*48)+18   ; wr_addr1 = 96*(2*(mem_addr-18*48)+1)+18   ;  end  
      96'h0000_1000_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-19*48)+19   ; wr_addr1 = 96*(2*(mem_addr-19*48)+1)+19   ;  end  
      96'h0000_0800_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-20*48)+20   ; wr_addr1 = 96*(2*(mem_addr-20*48)+1)+20   ;  end  
      96'h0000_0400_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-21*48)+21   ; wr_addr1 = 96*(2*(mem_addr-21*48)+1)+21   ;  end  
      96'h0000_0200_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-22*48)+22   ; wr_addr1 = 96*(2*(mem_addr-22*48)+1)+22   ;  end  
      96'h0000_0100_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-23*48)+23   ; wr_addr1 = 96*(2*(mem_addr-23*48)+1)+23   ;  end  
      96'h0000_0080_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-24*48)+24   ; wr_addr1 = 96*(2*(mem_addr-24*48)+1)+24   ;  end  
      96'h0000_0040_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-25*48)+25   ; wr_addr1 = 96*(2*(mem_addr-25*48)+1)+25   ;  end  
      96'h0000_0020_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-26*48)+26   ; wr_addr1 = 96*(2*(mem_addr-26*48)+1)+26   ;  end  
      96'h0000_0010_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-27*48)+27   ; wr_addr1 = 96*(2*(mem_addr-27*48)+1)+27   ;  end  
      96'h0000_0008_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-28*48)+28   ; wr_addr1 = 96*(2*(mem_addr-28*48)+1)+28   ;  end  
      96'h0000_0004_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-29*48)+29   ; wr_addr1 = 96*(2*(mem_addr-29*48)+1)+29   ;  end  
      96'h0000_0002_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-30*48)+30   ; wr_addr1 = 96*(2*(mem_addr-30*48)+1)+30   ;  end  
      96'h0000_0001_0000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-31*48)+31   ; wr_addr1 = 96*(2*(mem_addr-31*48)+1)+31   ;  end  
      96'h0000_0000_8000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-32*48)+32   ; wr_addr1 = 96*(2*(mem_addr-32*48)+1)+32   ;  end  
      96'h0000_0000_4000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-33*48)+33   ; wr_addr1 = 96*(2*(mem_addr-33*48)+1)+33   ;  end  
      96'h0000_0000_2000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-34*48)+34   ; wr_addr1 = 96*(2*(mem_addr-34*48)+1)+34   ;  end  
      96'h0000_0000_1000_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-35*48)+35   ; wr_addr1 = 96*(2*(mem_addr-35*48)+1)+35   ;  end  
      96'h0000_0000_0800_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-36*48)+36   ; wr_addr1 = 96*(2*(mem_addr-36*48)+1)+36   ;  end  
      96'h0000_0000_0400_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-37*48)+37   ; wr_addr1 = 96*(2*(mem_addr-37*48)+1)+37   ;  end  
      96'h0000_0000_0200_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-38*48)+38   ; wr_addr1 = 96*(2*(mem_addr-38*48)+1)+38   ;  end  
      96'h0000_0000_0100_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-39*48)+39   ; wr_addr1 = 96*(2*(mem_addr-39*48)+1)+39   ;  end  
      96'h0000_0000_0080_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-40*48)+40   ; wr_addr1 = 96*(2*(mem_addr-40*48)+1)+40   ;  end  
      96'h0000_0000_0040_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-41*48)+41   ; wr_addr1 = 96*(2*(mem_addr-41*48)+1)+41   ;  end  
      96'h0000_0000_0020_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-42*48)+42   ; wr_addr1 = 96*(2*(mem_addr-42*48)+1)+42   ;  end  
      96'h0000_0000_0010_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-43*48)+43   ; wr_addr1 = 96*(2*(mem_addr-43*48)+1)+43   ;  end  
      96'h0000_0000_0008_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-44*48)+44   ; wr_addr1 = 96*(2*(mem_addr-44*48)+1)+44   ;  end  
      96'h0000_0000_0004_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-45*48)+45   ; wr_addr1 = 96*(2*(mem_addr-45*48)+1)+45   ;  end  
      96'h0000_0000_0002_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-46*48)+46   ; wr_addr1 = 96*(2*(mem_addr-46*48)+1)+46   ;  end  
      96'h0000_0000_0001_0000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-47*48)+47   ; wr_addr1 = 96*(2*(mem_addr-47*48)+1)+47   ;  end  
      96'h0000_0000_0000_8000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-48*48)+48   ; wr_addr1 = 96*(2*(mem_addr-48*48)+1)+48   ;  end  
      96'h0000_0000_0000_4000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-49*48)+49   ; wr_addr1 = 96*(2*(mem_addr-49*48)+1)+49   ;  end  
      96'h0000_0000_0000_2000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-50*48)+50   ; wr_addr1 = 96*(2*(mem_addr-50*48)+1)+50   ;  end  
      96'h0000_0000_0000_1000_0000_0000: begin wr_addr0 = 96*2*(mem_addr-51*48)+51   ; wr_addr1 = 96*(2*(mem_addr-51*48)+1)+51   ;  end  
      96'h0000_0000_0000_0800_0000_0000: begin wr_addr0 = 96*2*(mem_addr-52*48)+52   ; wr_addr1 = 96*(2*(mem_addr-52*48)+1)+52   ;  end  
      96'h0000_0000_0000_0400_0000_0000: begin wr_addr0 = 96*2*(mem_addr-53*48)+53   ; wr_addr1 = 96*(2*(mem_addr-53*48)+1)+53   ;  end  
      96'h0000_0000_0000_0200_0000_0000: begin wr_addr0 = 96*2*(mem_addr-54*48)+54   ; wr_addr1 = 96*(2*(mem_addr-54*48)+1)+54   ;  end  
      96'h0000_0000_0000_0100_0000_0000: begin wr_addr0 = 96*2*(mem_addr-55*48)+55   ; wr_addr1 = 96*(2*(mem_addr-55*48)+1)+55   ;  end  
      96'h0000_0000_0000_0080_0000_0000: begin wr_addr0 = 96*2*(mem_addr-56*48)+56   ; wr_addr1 = 96*(2*(mem_addr-56*48)+1)+56   ;  end  
      96'h0000_0000_0000_0040_0000_0000: begin wr_addr0 = 96*2*(mem_addr-57*48)+57   ; wr_addr1 = 96*(2*(mem_addr-57*48)+1)+57   ;  end  
      96'h0000_0000_0000_0020_0000_0000: begin wr_addr0 = 96*2*(mem_addr-58*48)+58   ; wr_addr1 = 96*(2*(mem_addr-58*48)+1)+58   ;  end  
      96'h0000_0000_0000_0010_0000_0000: begin wr_addr0 = 96*2*(mem_addr-59*48)+59   ; wr_addr1 = 96*(2*(mem_addr-59*48)+1)+59   ;  end  
      96'h0000_0000_0000_0008_0000_0000: begin wr_addr0 = 96*2*(mem_addr-60*48)+60   ; wr_addr1 = 96*(2*(mem_addr-60*48)+1)+60   ;  end  
      96'h0000_0000_0000_0004_0000_0000: begin wr_addr0 = 96*2*(mem_addr-61*48)+61   ; wr_addr1 = 96*(2*(mem_addr-61*48)+1)+61   ;  end  
      96'h0000_0000_0000_0002_0000_0000: begin wr_addr0 = 96*2*(mem_addr-62*48)+62   ; wr_addr1 = 96*(2*(mem_addr-62*48)+1)+62   ;  end  
      96'h0000_0000_0000_0001_0000_0000: begin wr_addr0 = 96*2*(mem_addr-63*48)+63   ; wr_addr1 = 96*(2*(mem_addr-63*48)+1)+63   ;  end  
      96'h0000_0000_0000_0000_8000_0000: begin wr_addr0 = 96*2*(mem_addr-64*48)+64   ; wr_addr1 = 96*(2*(mem_addr-64*48)+1)+64   ;  end  
      96'h0000_0000_0000_0000_4000_0000: begin wr_addr0 = 96*2*(mem_addr-65*48)+65   ; wr_addr1 = 96*(2*(mem_addr-65*48)+1)+65   ;  end  
      96'h0000_0000_0000_0000_2000_0000: begin wr_addr0 = 96*2*(mem_addr-66*48)+66   ; wr_addr1 = 96*(2*(mem_addr-66*48)+1)+66   ;  end  
      96'h0000_0000_0000_0000_1000_0000: begin wr_addr0 = 96*2*(mem_addr-67*48)+67   ; wr_addr1 = 96*(2*(mem_addr-67*48)+1)+67   ;  end  
      96'h0000_0000_0000_0000_0800_0000: begin wr_addr0 = 96*2*(mem_addr-68*48)+68   ; wr_addr1 = 96*(2*(mem_addr-68*48)+1)+68   ;  end  
      96'h0000_0000_0000_0000_0400_0000: begin wr_addr0 = 96*2*(mem_addr-69*48)+69   ; wr_addr1 = 96*(2*(mem_addr-69*48)+1)+69   ;  end  
      96'h0000_0000_0000_0000_0200_0000: begin wr_addr0 = 96*2*(mem_addr-70*48)+70   ; wr_addr1 = 96*(2*(mem_addr-70*48)+1)+70   ;  end  
      96'h0000_0000_0000_0000_0100_0000: begin wr_addr0 = 96*2*(mem_addr-71*48)+71   ; wr_addr1 = 96*(2*(mem_addr-71*48)+1)+71   ;  end  
      96'h0000_0000_0000_0000_0080_0000: begin wr_addr0 = 96*2*(mem_addr-72*48)+72   ; wr_addr1 = 96*(2*(mem_addr-72*48)+1)+72   ;  end  
      96'h0000_0000_0000_0000_0040_0000: begin wr_addr0 = 96*2*(mem_addr-73*48)+73   ; wr_addr1 = 96*(2*(mem_addr-73*48)+1)+73   ;  end  
      96'h0000_0000_0000_0000_0020_0000: begin wr_addr0 = 96*2*(mem_addr-74*48)+74   ; wr_addr1 = 96*(2*(mem_addr-74*48)+1)+74   ;  end  
      96'h0000_0000_0000_0000_0010_0000: begin wr_addr0 = 96*2*(mem_addr-75*48)+75   ; wr_addr1 = 96*(2*(mem_addr-75*48)+1)+75   ;  end  
      96'h0000_0000_0000_0000_0008_0000: begin wr_addr0 = 96*2*(mem_addr-76*48)+76   ; wr_addr1 = 96*(2*(mem_addr-76*48)+1)+76   ;  end  
      96'h0000_0000_0000_0000_0004_0000: begin wr_addr0 = 96*2*(mem_addr-77*48)+77   ; wr_addr1 = 96*(2*(mem_addr-77*48)+1)+77   ;  end  
      96'h0000_0000_0000_0000_0002_0000: begin wr_addr0 = 96*2*(mem_addr-78*48)+78   ; wr_addr1 = 96*(2*(mem_addr-78*48)+1)+78   ;  end  
      96'h0000_0000_0000_0000_0001_0000: begin wr_addr0 = 96*2*(mem_addr-79*48)+79   ; wr_addr1 = 96*(2*(mem_addr-79*48)+1)+79   ;  end  
      96'h0000_0000_0000_0000_0000_8000: begin wr_addr0 = 96*2*(mem_addr-80*48)+80   ; wr_addr1 = 96*(2*(mem_addr-80*48)+1)+80   ;  end  
      96'h0000_0000_0000_0000_0000_4000: begin wr_addr0 = 96*2*(mem_addr-81*48)+81   ; wr_addr1 = 96*(2*(mem_addr-81*48)+1)+81   ;  end  
      96'h0000_0000_0000_0000_0000_2000: begin wr_addr0 = 96*2*(mem_addr-82*48)+82   ; wr_addr1 = 96*(2*(mem_addr-82*48)+1)+82   ;  end  
      96'h0000_0000_0000_0000_0000_1000: begin wr_addr0 = 96*2*(mem_addr-83*48)+83   ; wr_addr1 = 96*(2*(mem_addr-83*48)+1)+83   ;  end  
      96'h0000_0000_0000_0000_0000_0800: begin wr_addr0 = 96*2*(mem_addr-84*48)+84   ; wr_addr1 = 96*(2*(mem_addr-84*48)+1)+84   ;  end  
      96'h0000_0000_0000_0000_0000_0400: begin wr_addr0 = 96*2*(mem_addr-85*48)+85   ; wr_addr1 = 96*(2*(mem_addr-85*48)+1)+85   ;  end  
      96'h0000_0000_0000_0000_0000_0200: begin wr_addr0 = 96*2*(mem_addr-86*48)+86   ; wr_addr1 = 96*(2*(mem_addr-86*48)+1)+86   ;  end  
      96'h0000_0000_0000_0000_0000_0100: begin wr_addr0 = 96*2*(mem_addr-87*48)+87   ; wr_addr1 = 96*(2*(mem_addr-87*48)+1)+87   ;  end  
      96'h0000_0000_0000_0000_0000_0080: begin wr_addr0 = 96*2*(mem_addr-88*48)+88   ; wr_addr1 = 96*(2*(mem_addr-88*48)+1)+88   ;  end  
      96'h0000_0000_0000_0000_0000_0040: begin wr_addr0 = 96*2*(mem_addr-89*48)+89   ; wr_addr1 = 96*(2*(mem_addr-89*48)+1)+89   ;  end  
      96'h0000_0000_0000_0000_0000_0020: begin wr_addr0 = 96*2*(mem_addr-90*48)+90   ; wr_addr1 = 96*(2*(mem_addr-90*48)+1)+90   ;  end  
      96'h0000_0000_0000_0000_0000_0010: begin wr_addr0 = 96*2*(mem_addr-91*48)+91   ; wr_addr1 = 96*(2*(mem_addr-91*48)+1)+91   ;  end  
      96'h0000_0000_0000_0000_0000_0008: begin wr_addr0 = 96*2*(mem_addr-92*48)+92   ; wr_addr1 = 96*(2*(mem_addr-92*48)+1)+92   ;  end  
      96'h0000_0000_0000_0000_0000_0004: begin wr_addr0 = 96*2*(mem_addr-93*48)+93   ; wr_addr1 = 96*(2*(mem_addr-93*48)+1)+93   ;  end  
      96'h0000_0000_0000_0000_0000_0002: begin wr_addr0 = 96*2*(mem_addr-94*48)+94   ; wr_addr1 = 96*(2*(mem_addr-94*48)+1)+94   ;  end  
      96'h0000_0000_0000_0000_0000_0001: begin wr_addr0 = 96*2*(mem_addr-95*48)+95   ; wr_addr1 = 96*(2*(mem_addr-95*48)+1)+95   ;  end  
      default: begin wr_addr0=16'h0; wr_addr1=16'h0; end
    endcase                                                              
  end                                                                    
end                                                                      

integer i;
always @(posedge clock) begin 
  if(reset) begin
    for(i=0; i<MATRIX_SIZE*MATRIX_SIZE; i=i+1) begin
      mem[i]<=64'h0;
    end
  end else if(mem_wr) begin 
      mem[wr_addr0]  = mem_wrdata0   ; 
      mem[wr_addr1]  = mem_wrdata1   ;
  end
end

assign mem_rddata0  = mem_rd ? mem[mem_addr*2+0]  : 64'h0;
assign mem_rddata1  = mem_rd ? mem[mem_addr*2+1]  : 64'h0;

endmodule
