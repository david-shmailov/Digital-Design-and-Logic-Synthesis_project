/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP4
// Date      : Mon Dec 27 21:36:47 2021
/////////////////////////////////////////////////////////////


module APB_BUS_AMBA_WORD32_AMBA_ADDR_WIDTH20_DATA_WIDTH32 ( rst, clk, PSEL, 
        PADDR, PENABLE, PWDATA, PWRITE, start, CTRL, DATA_IN, CODEWORD_WIDTH, 
        NOISE, PRDATA );
  input [19:0] PADDR;
  input [31:0] PWDATA;
  output [31:0] CTRL;
  output [31:0] DATA_IN;
  output [31:0] CODEWORD_WIDTH;
  output [31:0] NOISE;
  output [31:0] PRDATA;
  input rst, clk, PSEL, PENABLE, PWRITE;
  output start;
  wire   n318, current_state, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317;

  DFFRHQX4 \DATA_IN_reg[25]  ( .D(n239), .CK(n19), .RN(n35), .Q(DATA_IN[25])
         );
  DFFRHQX4 \DATA_IN_reg[24]  ( .D(n238), .CK(n19), .RN(n35), .Q(DATA_IN[24])
         );
  DFFRHQX4 \DATA_IN_reg[23]  ( .D(n237), .CK(n19), .RN(n35), .Q(DATA_IN[23])
         );
  DFFRHQX4 \DATA_IN_reg[22]  ( .D(n236), .CK(n19), .RN(n35), .Q(DATA_IN[22])
         );
  DFFRHQX4 \DATA_IN_reg[21]  ( .D(n235), .CK(n19), .RN(n35), .Q(DATA_IN[21])
         );
  DFFRHQX4 \DATA_IN_reg[20]  ( .D(n234), .CK(n19), .RN(n35), .Q(DATA_IN[20])
         );
  DFFRHQX4 \DATA_IN_reg[19]  ( .D(n233), .CK(n19), .RN(n35), .Q(DATA_IN[19])
         );
  DFFRHQX4 \DATA_IN_reg[18]  ( .D(n232), .CK(n19), .RN(n35), .Q(DATA_IN[18])
         );
  DFFRHQX4 \DATA_IN_reg[17]  ( .D(n231), .CK(n19), .RN(n35), .Q(DATA_IN[17])
         );
  DFFRHQX4 \DATA_IN_reg[16]  ( .D(n230), .CK(n20), .RN(n36), .Q(DATA_IN[16])
         );
  DFFRHQX4 \DATA_IN_reg[15]  ( .D(n229), .CK(n20), .RN(n36), .Q(DATA_IN[15])
         );
  DFFRHQX4 \DATA_IN_reg[14]  ( .D(n228), .CK(n20), .RN(n36), .Q(DATA_IN[14])
         );
  DFFRHQX4 \DATA_IN_reg[13]  ( .D(n227), .CK(n20), .RN(n36), .Q(DATA_IN[13])
         );
  DFFRHQX4 \DATA_IN_reg[12]  ( .D(n226), .CK(n20), .RN(n36), .Q(DATA_IN[12])
         );
  DFFRHQX4 \DATA_IN_reg[11]  ( .D(n225), .CK(n20), .RN(n36), .Q(DATA_IN[11])
         );
  DFFRHQX4 \DATA_IN_reg[10]  ( .D(n224), .CK(n20), .RN(n36), .Q(DATA_IN[10])
         );
  DFFRHQX4 \DATA_IN_reg[9]  ( .D(n223), .CK(n20), .RN(n36), .Q(DATA_IN[9]) );
  DFFRHQX4 \DATA_IN_reg[8]  ( .D(n222), .CK(n20), .RN(n36), .Q(DATA_IN[8]) );
  DFFRHQX4 \DATA_IN_reg[7]  ( .D(n221), .CK(n20), .RN(n36), .Q(DATA_IN[7]) );
  DFFRHQX4 \DATA_IN_reg[5]  ( .D(n219), .CK(n20), .RN(n36), .Q(DATA_IN[5]) );
  DFFRHQX4 \DATA_IN_reg[4]  ( .D(n218), .CK(n21), .RN(n37), .Q(DATA_IN[4]) );
  DFFRHQX4 \DATA_IN_reg[3]  ( .D(n217), .CK(n21), .RN(n37), .Q(DATA_IN[3]) );
  DFFRHQX4 \DATA_IN_reg[2]  ( .D(n216), .CK(n21), .RN(n37), .Q(DATA_IN[2]) );
  DFFRHQX4 \DATA_IN_reg[1]  ( .D(n215), .CK(n21), .RN(n37), .Q(DATA_IN[1]) );
  DFFRHQX4 \DATA_IN_reg[0]  ( .D(n214), .CK(n21), .RN(n37), .Q(DATA_IN[0]) );
  DFFRHQX4 \CODEWORD_WIDTH_reg[1]  ( .D(n183), .CK(n23), .RN(n39), .Q(
        CODEWORD_WIDTH[1]) );
  DFFRHQX1 start_reg ( .D(n12), .CK(n16), .RN(n32), .Q(start) );
  DFFRHQX1 current_state_reg ( .D(PSEL), .CK(n26), .RN(n42), .Q(current_state)
         );
  DFFRHQX1 \DATA_IN_reg[31]  ( .D(n245), .CK(n18), .RN(n34), .Q(DATA_IN[31])
         );
  DFFRHQX1 \DATA_IN_reg[30]  ( .D(n244), .CK(n18), .RN(n34), .Q(DATA_IN[30])
         );
  DFFRHQX1 \DATA_IN_reg[29]  ( .D(n243), .CK(n18), .RN(n34), .Q(DATA_IN[29])
         );
  DFFRHQX1 \DATA_IN_reg[28]  ( .D(n242), .CK(n19), .RN(n35), .Q(DATA_IN[28])
         );
  DFFRHQX1 \DATA_IN_reg[27]  ( .D(n241), .CK(n19), .RN(n35), .Q(DATA_IN[27])
         );
  DFFRHQX1 \DATA_IN_reg[26]  ( .D(n240), .CK(n19), .RN(n35), .Q(DATA_IN[26])
         );
  DFFRHQX1 \CTRL_reg[26]  ( .D(n272), .CK(n18), .RN(n34), .Q(CTRL[26]) );
  DFFRHQX1 \CTRL_reg[27]  ( .D(n273), .CK(n18), .RN(n34), .Q(CTRL[27]) );
  DFFRHQX1 \CTRL_reg[31]  ( .D(n277), .CK(n18), .RN(n34), .Q(CTRL[31]) );
  DFFRHQX1 \CTRL_reg[28]  ( .D(n274), .CK(n18), .RN(n34), .Q(CTRL[28]) );
  DFFRHQX1 \CTRL_reg[21]  ( .D(n267), .CK(n17), .RN(n33), .Q(CTRL[21]) );
  DFFRHQX1 \CTRL_reg[17]  ( .D(n263), .CK(n17), .RN(n33), .Q(CTRL[17]) );
  DFFRHQX1 \CTRL_reg[13]  ( .D(n259), .CK(n17), .RN(n33), .Q(CTRL[13]) );
  DFFRHQX1 \CTRL_reg[6]  ( .D(n252), .CK(n16), .RN(n32), .Q(CTRL[6]) );
  DFFRHQX1 \CTRL_reg[25]  ( .D(n271), .CK(n18), .RN(n34), .Q(CTRL[25]) );
  DFFRHQX1 \CTRL_reg[11]  ( .D(n257), .CK(n17), .RN(n33), .Q(CTRL[11]) );
  DFFRHQX1 \CTRL_reg[10]  ( .D(n256), .CK(n16), .RN(n32), .Q(CTRL[10]) );
  DFFRHQX1 \CTRL_reg[12]  ( .D(n258), .CK(n17), .RN(n33), .Q(CTRL[12]) );
  DFFRHQX1 \CTRL_reg[29]  ( .D(n275), .CK(n18), .RN(n34), .Q(CTRL[29]) );
  DFFRHQX1 \CTRL_reg[22]  ( .D(n268), .CK(n17), .RN(n33), .Q(CTRL[22]) );
  DFFRHQX1 \CTRL_reg[18]  ( .D(n264), .CK(n17), .RN(n33), .Q(CTRL[18]) );
  DFFRHQX1 \CTRL_reg[14]  ( .D(n260), .CK(n17), .RN(n33), .Q(CTRL[14]) );
  DFFRHQX1 \CTRL_reg[7]  ( .D(n253), .CK(n16), .RN(n32), .Q(CTRL[7]) );
  DFFRHQX1 \CTRL_reg[3]  ( .D(n249), .CK(n16), .RN(n32), .Q(CTRL[3]) );
  DFFRHQX1 \CTRL_reg[23]  ( .D(n269), .CK(n18), .RN(n34), .Q(CTRL[23]) );
  DFFRHQX1 \CTRL_reg[19]  ( .D(n265), .CK(n17), .RN(n33), .Q(CTRL[19]) );
  DFFRHQX1 \CTRL_reg[15]  ( .D(n261), .CK(n17), .RN(n33), .Q(CTRL[15]) );
  DFFRHQX1 \CTRL_reg[8]  ( .D(n254), .CK(n16), .RN(n32), .Q(CTRL[8]) );
  DFFRHQX1 \CTRL_reg[4]  ( .D(n250), .CK(n16), .RN(n32), .Q(CTRL[4]) );
  DFFRHQX1 \CTRL_reg[2]  ( .D(n248), .CK(n16), .RN(n32), .Q(CTRL[2]) );
  DFFRHQX1 \CTRL_reg[30]  ( .D(n276), .CK(n18), .RN(n34), .Q(CTRL[30]) );
  DFFRHQX1 \CTRL_reg[24]  ( .D(n270), .CK(n18), .RN(n34), .Q(CTRL[24]) );
  DFFRHQX1 \CTRL_reg[20]  ( .D(n266), .CK(n17), .RN(n33), .Q(CTRL[20]) );
  DFFRHQX1 \CTRL_reg[16]  ( .D(n262), .CK(n17), .RN(n33), .Q(CTRL[16]) );
  DFFRHQX1 \CTRL_reg[9]  ( .D(n255), .CK(n16), .RN(n32), .Q(CTRL[9]) );
  DFFRHQX1 \CTRL_reg[5]  ( .D(n251), .CK(n16), .RN(n32), .Q(CTRL[5]) );
  DFFRHQX1 \NOISE_reg[31]  ( .D(n181), .CK(n24), .RN(n40), .Q(NOISE[31]) );
  DFFRHQX1 \NOISE_reg[30]  ( .D(n180), .CK(n24), .RN(n40), .Q(NOISE[30]) );
  DFFRHQX1 \NOISE_reg[29]  ( .D(n179), .CK(n24), .RN(n40), .Q(NOISE[29]) );
  DFFRHQX1 \NOISE_reg[28]  ( .D(n178), .CK(n24), .RN(n40), .Q(NOISE[28]) );
  DFFRHQX1 \NOISE_reg[27]  ( .D(n177), .CK(n24), .RN(n40), .Q(NOISE[27]) );
  DFFRHQX1 \NOISE_reg[26]  ( .D(n176), .CK(n24), .RN(n40), .Q(NOISE[26]) );
  DFFRHQX1 \NOISE_reg[25]  ( .D(n175), .CK(n24), .RN(n40), .Q(NOISE[25]) );
  DFFRHQX1 \NOISE_reg[24]  ( .D(n174), .CK(n24), .RN(n40), .Q(NOISE[24]) );
  DFFRHQX1 \NOISE_reg[23]  ( .D(n173), .CK(n24), .RN(n40), .Q(NOISE[23]) );
  DFFRHQX1 \NOISE_reg[22]  ( .D(n172), .CK(n24), .RN(n40), .Q(NOISE[22]) );
  DFFRHQX1 \NOISE_reg[21]  ( .D(n171), .CK(n24), .RN(n40), .Q(NOISE[21]) );
  DFFRHQX1 \NOISE_reg[20]  ( .D(n170), .CK(n25), .RN(n41), .Q(NOISE[20]) );
  DFFRHQX1 \NOISE_reg[19]  ( .D(n169), .CK(n25), .RN(n41), .Q(NOISE[19]) );
  DFFRHQX1 \NOISE_reg[18]  ( .D(n168), .CK(n25), .RN(n41), .Q(NOISE[18]) );
  DFFRHQX1 \NOISE_reg[17]  ( .D(n167), .CK(n25), .RN(n41), .Q(NOISE[17]) );
  DFFRHQX1 \NOISE_reg[16]  ( .D(n166), .CK(n25), .RN(n41), .Q(NOISE[16]) );
  DFFRHQX1 \NOISE_reg[15]  ( .D(n165), .CK(n25), .RN(n41), .Q(NOISE[15]) );
  DFFRHQX1 \NOISE_reg[14]  ( .D(n164), .CK(n25), .RN(n41), .Q(NOISE[14]) );
  DFFRHQX1 \NOISE_reg[13]  ( .D(n163), .CK(n25), .RN(n41), .Q(NOISE[13]) );
  DFFRHQX1 \NOISE_reg[12]  ( .D(n162), .CK(n25), .RN(n41), .Q(NOISE[12]) );
  DFFRHQX1 \NOISE_reg[11]  ( .D(n161), .CK(n25), .RN(n41), .Q(NOISE[11]) );
  DFFRHQX1 \NOISE_reg[10]  ( .D(n160), .CK(n25), .RN(n41), .Q(NOISE[10]) );
  DFFRHQX1 \NOISE_reg[9]  ( .D(n159), .CK(n25), .RN(n41), .Q(NOISE[9]) );
  DFFRHQX1 \NOISE_reg[8]  ( .D(n158), .CK(n26), .RN(n42), .Q(NOISE[8]) );
  DFFRHQX1 \NOISE_reg[7]  ( .D(n157), .CK(n26), .RN(n42), .Q(NOISE[7]) );
  DFFRHQX1 \NOISE_reg[6]  ( .D(n156), .CK(n26), .RN(n42), .Q(NOISE[6]) );
  DFFRHQX1 \NOISE_reg[5]  ( .D(n155), .CK(n26), .RN(n42), .Q(NOISE[5]) );
  DFFRHQX1 \NOISE_reg[4]  ( .D(n154), .CK(n26), .RN(n42), .Q(NOISE[4]) );
  DFFRHQX1 \NOISE_reg[3]  ( .D(n153), .CK(n26), .RN(n42), .Q(NOISE[3]) );
  DFFRHQX1 \NOISE_reg[2]  ( .D(n152), .CK(n26), .RN(n42), .Q(NOISE[2]) );
  DFFRHQX1 \NOISE_reg[1]  ( .D(n151), .CK(n26), .RN(n42), .Q(NOISE[1]) );
  DFFRHQX1 \NOISE_reg[0]  ( .D(n150), .CK(n26), .RN(n42), .Q(NOISE[0]) );
  DFFRHQX1 \CTRL_reg[0]  ( .D(n246), .CK(n16), .RN(n32), .Q(CTRL[0]) );
  DFFRHQX1 \CTRL_reg[1]  ( .D(n247), .CK(n16), .RN(n32), .Q(CTRL[1]) );
  DFFRHQX2 \DATA_IN_reg[6]  ( .D(n220), .CK(n20), .RN(n36), .Q(DATA_IN[6]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[26]  ( .D(n208), .CK(n21), .RN(n37), .Q(
        CODEWORD_WIDTH[26]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[27]  ( .D(n209), .CK(n21), .RN(n37), .Q(
        CODEWORD_WIDTH[27]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[31]  ( .D(n213), .CK(n21), .RN(n37), .Q(
        CODEWORD_WIDTH[31]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[28]  ( .D(n210), .CK(n21), .RN(n37), .Q(
        CODEWORD_WIDTH[28]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[21]  ( .D(n203), .CK(n22), .RN(n38), .Q(
        CODEWORD_WIDTH[21]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[17]  ( .D(n199), .CK(n22), .RN(n38), .Q(
        CODEWORD_WIDTH[17]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[13]  ( .D(n195), .CK(n22), .RN(n38), .Q(
        CODEWORD_WIDTH[13]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[6]  ( .D(n188), .CK(n23), .RN(n39), .Q(
        CODEWORD_WIDTH[6]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[25]  ( .D(n207), .CK(n21), .RN(n37), .Q(
        CODEWORD_WIDTH[25]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[11]  ( .D(n193), .CK(n23), .RN(n39), .Q(
        CODEWORD_WIDTH[11]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[10]  ( .D(n192), .CK(n23), .RN(n39), .Q(
        CODEWORD_WIDTH[10]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[12]  ( .D(n194), .CK(n23), .RN(n39), .Q(
        CODEWORD_WIDTH[12]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[29]  ( .D(n211), .CK(n21), .RN(n37), .Q(
        CODEWORD_WIDTH[29]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[22]  ( .D(n204), .CK(n22), .RN(n38), .Q(
        CODEWORD_WIDTH[22]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[18]  ( .D(n200), .CK(n22), .RN(n38), .Q(
        CODEWORD_WIDTH[18]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[14]  ( .D(n196), .CK(n22), .RN(n38), .Q(
        CODEWORD_WIDTH[14]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[7]  ( .D(n189), .CK(n23), .RN(n39), .Q(
        CODEWORD_WIDTH[7]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[3]  ( .D(n185), .CK(n23), .RN(n39), .Q(
        CODEWORD_WIDTH[3]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[23]  ( .D(n205), .CK(n22), .RN(n38), .Q(
        CODEWORD_WIDTH[23]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[19]  ( .D(n201), .CK(n22), .RN(n38), .Q(
        CODEWORD_WIDTH[19]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[15]  ( .D(n197), .CK(n22), .RN(n38), .Q(
        CODEWORD_WIDTH[15]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[8]  ( .D(n190), .CK(n23), .RN(n39), .Q(
        CODEWORD_WIDTH[8]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[4]  ( .D(n186), .CK(n23), .RN(n39), .Q(
        CODEWORD_WIDTH[4]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[2]  ( .D(n184), .CK(n23), .RN(n39), .Q(
        CODEWORD_WIDTH[2]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[30]  ( .D(n212), .CK(n21), .RN(n37), .Q(
        CODEWORD_WIDTH[30]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[24]  ( .D(n206), .CK(n22), .RN(n38), .Q(
        CODEWORD_WIDTH[24]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[20]  ( .D(n202), .CK(n22), .RN(n38), .Q(
        CODEWORD_WIDTH[20]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[16]  ( .D(n198), .CK(n22), .RN(n38), .Q(
        CODEWORD_WIDTH[16]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[9]  ( .D(n191), .CK(n23), .RN(n39), .Q(
        CODEWORD_WIDTH[9]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[5]  ( .D(n187), .CK(n23), .RN(n39), .Q(
        CODEWORD_WIDTH[5]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[0]  ( .D(n182), .CK(n24), .RN(n40), .Q(n318) );
  NAND3X1 U3 ( .A(n112), .B(n113), .C(n114), .Y(n1) );
  NAND3X1 U4 ( .A(n114), .B(n113), .C(PADDR[2]), .Y(n2) );
  NAND3X1 U5 ( .A(n114), .B(n112), .C(PADDR[3]), .Y(n3) );
  NAND3X1 U6 ( .A(PADDR[2]), .B(n114), .C(PADDR[3]), .Y(n4) );
  AND3X2 U7 ( .A(PADDR[2]), .B(n113), .C(n310), .Y(n5) );
  AND3X2 U8 ( .A(n112), .B(n113), .C(n310), .Y(n6) );
  INVX8 U9 ( .A(n6), .Y(n7) );
  INVX8 U10 ( .A(n5), .Y(n8) );
  INVX8 U11 ( .A(n3), .Y(n9) );
  INVX8 U12 ( .A(n4), .Y(n10) );
  INVX8 U13 ( .A(n2), .Y(n11) );
  INVX8 U14 ( .A(n1), .Y(n12) );
  BUFX4 U15 ( .A(n318), .Y(CODEWORD_WIDTH[0]) );
  AOI22XL U16 ( .A0(n149), .A1(NOISE[0]), .B0(n278), .B1(CODEWORD_WIDTH[0]), 
        .Y(n309) );
  BUFX3 U17 ( .A(n278), .Y(n14) );
  AND3X4 U18 ( .A(PADDR[3]), .B(n112), .C(n310), .Y(n278) );
  BUFX3 U19 ( .A(n149), .Y(n15) );
  AND3X4 U20 ( .A(PADDR[3]), .B(PADDR[2]), .C(n310), .Y(n149) );
  CLKINVX3 U21 ( .A(n45), .Y(n41) );
  CLKINVX3 U22 ( .A(n43), .Y(n40) );
  CLKINVX3 U23 ( .A(n43), .Y(n39) );
  CLKINVX3 U24 ( .A(n47), .Y(n38) );
  CLKINVX3 U25 ( .A(n43), .Y(n37) );
  CLKINVX3 U26 ( .A(n45), .Y(n36) );
  CLKINVX3 U27 ( .A(n47), .Y(n35) );
  CLKINVX3 U28 ( .A(n44), .Y(n33) );
  CLKINVX3 U29 ( .A(n44), .Y(n34) );
  CLKINVX3 U30 ( .A(n29), .Y(n25) );
  CLKINVX3 U31 ( .A(n27), .Y(n24) );
  CLKINVX3 U32 ( .A(n27), .Y(n23) );
  CLKINVX3 U33 ( .A(n31), .Y(n22) );
  CLKINVX3 U34 ( .A(n27), .Y(n21) );
  CLKINVX3 U35 ( .A(n29), .Y(n20) );
  CLKINVX3 U36 ( .A(n31), .Y(n19) );
  CLKINVX3 U37 ( .A(n28), .Y(n17) );
  CLKINVX3 U38 ( .A(n28), .Y(n18) );
  CLKINVX3 U39 ( .A(n44), .Y(n42) );
  CLKINVX3 U40 ( .A(n28), .Y(n26) );
  CLKINVX3 U41 ( .A(n45), .Y(n32) );
  INVX1 U42 ( .A(n46), .Y(n45) );
  CLKINVX3 U43 ( .A(n29), .Y(n16) );
  INVX1 U44 ( .A(n30), .Y(n29) );
  INVX1 U45 ( .A(n46), .Y(n43) );
  INVX1 U46 ( .A(n30), .Y(n27) );
  INVX1 U47 ( .A(n46), .Y(n44) );
  INVX1 U48 ( .A(n30), .Y(n28) );
  INVX1 U49 ( .A(n47), .Y(n46) );
  INVX1 U50 ( .A(n31), .Y(n30) );
  INVX1 U51 ( .A(rst), .Y(n47) );
  INVX1 U52 ( .A(clk), .Y(n31) );
  MXI2X1 U53 ( .A(n48), .B(n49), .S0(n12), .Y(n277) );
  MXI2X1 U54 ( .A(n50), .B(n51), .S0(n12), .Y(n276) );
  MXI2X1 U55 ( .A(n52), .B(n53), .S0(n12), .Y(n275) );
  MXI2X1 U56 ( .A(n54), .B(n55), .S0(n12), .Y(n274) );
  MXI2X1 U57 ( .A(n56), .B(n57), .S0(n12), .Y(n273) );
  MXI2X1 U58 ( .A(n58), .B(n59), .S0(n12), .Y(n272) );
  MXI2X1 U59 ( .A(n60), .B(n61), .S0(n12), .Y(n271) );
  MXI2X1 U60 ( .A(n62), .B(n63), .S0(n12), .Y(n270) );
  MXI2X1 U61 ( .A(n64), .B(n65), .S0(n12), .Y(n269) );
  MXI2X1 U62 ( .A(n66), .B(n67), .S0(n12), .Y(n268) );
  MXI2X1 U63 ( .A(n68), .B(n69), .S0(n12), .Y(n267) );
  MXI2X1 U64 ( .A(n70), .B(n71), .S0(n12), .Y(n266) );
  MXI2X1 U65 ( .A(n72), .B(n73), .S0(n12), .Y(n265) );
  MXI2X1 U66 ( .A(n74), .B(n75), .S0(n12), .Y(n264) );
  MXI2X1 U67 ( .A(n76), .B(n77), .S0(n12), .Y(n263) );
  MXI2X1 U68 ( .A(n78), .B(n79), .S0(n12), .Y(n262) );
  MXI2X1 U69 ( .A(n80), .B(n81), .S0(n12), .Y(n261) );
  MXI2X1 U70 ( .A(n82), .B(n83), .S0(n12), .Y(n260) );
  MXI2X1 U71 ( .A(n84), .B(n85), .S0(n12), .Y(n259) );
  MXI2X1 U72 ( .A(n86), .B(n87), .S0(n12), .Y(n258) );
  MXI2X1 U73 ( .A(n88), .B(n89), .S0(n12), .Y(n257) );
  MXI2X1 U74 ( .A(n90), .B(n91), .S0(n12), .Y(n256) );
  MXI2X1 U75 ( .A(n92), .B(n93), .S0(n12), .Y(n255) );
  MXI2X1 U76 ( .A(n94), .B(n95), .S0(n12), .Y(n254) );
  MXI2X1 U77 ( .A(n96), .B(n97), .S0(n12), .Y(n253) );
  MXI2X1 U78 ( .A(n98), .B(n99), .S0(n12), .Y(n252) );
  MXI2X1 U79 ( .A(n100), .B(n101), .S0(n12), .Y(n251) );
  MXI2X1 U80 ( .A(n102), .B(n103), .S0(n12), .Y(n250) );
  MXI2X1 U81 ( .A(n104), .B(n105), .S0(n12), .Y(n249) );
  MXI2X1 U82 ( .A(n106), .B(n107), .S0(n12), .Y(n248) );
  MXI2X1 U83 ( .A(n108), .B(n109), .S0(n12), .Y(n247) );
  MXI2X1 U84 ( .A(n110), .B(n111), .S0(n12), .Y(n246) );
  MXI2X1 U85 ( .A(n115), .B(n49), .S0(n11), .Y(n245) );
  INVX1 U86 ( .A(PWDATA[31]), .Y(n49) );
  MXI2X1 U87 ( .A(n116), .B(n51), .S0(n11), .Y(n244) );
  INVX1 U88 ( .A(PWDATA[30]), .Y(n51) );
  MXI2X1 U89 ( .A(n117), .B(n53), .S0(n11), .Y(n243) );
  INVX1 U90 ( .A(PWDATA[29]), .Y(n53) );
  MXI2X1 U91 ( .A(n118), .B(n55), .S0(n11), .Y(n242) );
  INVX1 U92 ( .A(PWDATA[28]), .Y(n55) );
  MXI2X1 U93 ( .A(n119), .B(n57), .S0(n11), .Y(n241) );
  INVX1 U94 ( .A(PWDATA[27]), .Y(n57) );
  MXI2X1 U95 ( .A(n120), .B(n59), .S0(n11), .Y(n240) );
  INVX1 U96 ( .A(PWDATA[26]), .Y(n59) );
  MXI2X1 U97 ( .A(n121), .B(n61), .S0(n11), .Y(n239) );
  INVX1 U98 ( .A(PWDATA[25]), .Y(n61) );
  MXI2X1 U99 ( .A(n122), .B(n63), .S0(n11), .Y(n238) );
  INVX1 U100 ( .A(PWDATA[24]), .Y(n63) );
  MXI2X1 U101 ( .A(n123), .B(n65), .S0(n11), .Y(n237) );
  INVX1 U102 ( .A(PWDATA[23]), .Y(n65) );
  MXI2X1 U103 ( .A(n124), .B(n67), .S0(n11), .Y(n236) );
  INVX1 U104 ( .A(PWDATA[22]), .Y(n67) );
  MXI2X1 U105 ( .A(n125), .B(n69), .S0(n11), .Y(n235) );
  INVX1 U106 ( .A(PWDATA[21]), .Y(n69) );
  MXI2X1 U107 ( .A(n126), .B(n71), .S0(n11), .Y(n234) );
  INVX1 U108 ( .A(PWDATA[20]), .Y(n71) );
  MXI2X1 U109 ( .A(n127), .B(n73), .S0(n11), .Y(n233) );
  INVX1 U110 ( .A(PWDATA[19]), .Y(n73) );
  MXI2X1 U111 ( .A(n128), .B(n75), .S0(n11), .Y(n232) );
  INVX1 U112 ( .A(PWDATA[18]), .Y(n75) );
  MXI2X1 U113 ( .A(n129), .B(n77), .S0(n11), .Y(n231) );
  INVX1 U114 ( .A(PWDATA[17]), .Y(n77) );
  MXI2X1 U115 ( .A(n130), .B(n79), .S0(n11), .Y(n230) );
  INVX1 U116 ( .A(PWDATA[16]), .Y(n79) );
  MXI2X1 U117 ( .A(n131), .B(n81), .S0(n11), .Y(n229) );
  INVX1 U118 ( .A(PWDATA[15]), .Y(n81) );
  MXI2X1 U119 ( .A(n132), .B(n83), .S0(n11), .Y(n228) );
  INVX1 U120 ( .A(PWDATA[14]), .Y(n83) );
  MXI2X1 U121 ( .A(n133), .B(n85), .S0(n11), .Y(n227) );
  INVX1 U122 ( .A(PWDATA[13]), .Y(n85) );
  MXI2X1 U123 ( .A(n134), .B(n87), .S0(n11), .Y(n226) );
  INVX1 U124 ( .A(PWDATA[12]), .Y(n87) );
  MXI2X1 U125 ( .A(n135), .B(n89), .S0(n11), .Y(n225) );
  INVX1 U126 ( .A(PWDATA[11]), .Y(n89) );
  MXI2X1 U127 ( .A(n136), .B(n91), .S0(n11), .Y(n224) );
  INVX1 U128 ( .A(PWDATA[10]), .Y(n91) );
  MXI2X1 U129 ( .A(n137), .B(n93), .S0(n11), .Y(n223) );
  INVX1 U130 ( .A(PWDATA[9]), .Y(n93) );
  MXI2X1 U131 ( .A(n138), .B(n95), .S0(n11), .Y(n222) );
  INVX1 U132 ( .A(PWDATA[8]), .Y(n95) );
  MXI2X1 U133 ( .A(n139), .B(n97), .S0(n11), .Y(n221) );
  INVX1 U134 ( .A(PWDATA[7]), .Y(n97) );
  MXI2X1 U135 ( .A(n140), .B(n99), .S0(n11), .Y(n220) );
  INVX1 U136 ( .A(PWDATA[6]), .Y(n99) );
  MXI2X1 U137 ( .A(n141), .B(n101), .S0(n11), .Y(n219) );
  INVX1 U138 ( .A(PWDATA[5]), .Y(n101) );
  MXI2X1 U139 ( .A(n142), .B(n103), .S0(n11), .Y(n218) );
  INVX1 U140 ( .A(PWDATA[4]), .Y(n103) );
  MXI2X1 U141 ( .A(n143), .B(n105), .S0(n11), .Y(n217) );
  INVX1 U142 ( .A(PWDATA[3]), .Y(n105) );
  MXI2X1 U143 ( .A(n144), .B(n107), .S0(n11), .Y(n216) );
  INVX1 U144 ( .A(PWDATA[2]), .Y(n107) );
  MXI2X1 U145 ( .A(n145), .B(n109), .S0(n11), .Y(n215) );
  INVX1 U146 ( .A(PWDATA[1]), .Y(n109) );
  MXI2X1 U147 ( .A(n146), .B(n111), .S0(n11), .Y(n214) );
  INVX1 U148 ( .A(PWDATA[0]), .Y(n111) );
  MX2X1 U149 ( .A(CODEWORD_WIDTH[31]), .B(PWDATA[31]), .S0(n9), .Y(n213) );
  MX2X1 U150 ( .A(CODEWORD_WIDTH[30]), .B(PWDATA[30]), .S0(n9), .Y(n212) );
  MX2X1 U151 ( .A(CODEWORD_WIDTH[29]), .B(PWDATA[29]), .S0(n9), .Y(n211) );
  MX2X1 U152 ( .A(CODEWORD_WIDTH[28]), .B(PWDATA[28]), .S0(n9), .Y(n210) );
  MX2X1 U153 ( .A(CODEWORD_WIDTH[27]), .B(PWDATA[27]), .S0(n9), .Y(n209) );
  MX2X1 U154 ( .A(CODEWORD_WIDTH[26]), .B(PWDATA[26]), .S0(n9), .Y(n208) );
  MX2X1 U155 ( .A(CODEWORD_WIDTH[25]), .B(PWDATA[25]), .S0(n9), .Y(n207) );
  MX2X1 U156 ( .A(CODEWORD_WIDTH[24]), .B(PWDATA[24]), .S0(n9), .Y(n206) );
  MX2X1 U157 ( .A(CODEWORD_WIDTH[23]), .B(PWDATA[23]), .S0(n9), .Y(n205) );
  MX2X1 U158 ( .A(CODEWORD_WIDTH[22]), .B(PWDATA[22]), .S0(n9), .Y(n204) );
  MX2X1 U159 ( .A(CODEWORD_WIDTH[21]), .B(PWDATA[21]), .S0(n9), .Y(n203) );
  MX2X1 U160 ( .A(CODEWORD_WIDTH[20]), .B(PWDATA[20]), .S0(n9), .Y(n202) );
  MX2X1 U161 ( .A(CODEWORD_WIDTH[19]), .B(PWDATA[19]), .S0(n9), .Y(n201) );
  MX2X1 U162 ( .A(CODEWORD_WIDTH[18]), .B(PWDATA[18]), .S0(n9), .Y(n200) );
  MX2X1 U163 ( .A(CODEWORD_WIDTH[17]), .B(PWDATA[17]), .S0(n9), .Y(n199) );
  MX2X1 U164 ( .A(CODEWORD_WIDTH[16]), .B(PWDATA[16]), .S0(n9), .Y(n198) );
  MX2X1 U165 ( .A(CODEWORD_WIDTH[15]), .B(PWDATA[15]), .S0(n9), .Y(n197) );
  MX2X1 U166 ( .A(CODEWORD_WIDTH[14]), .B(PWDATA[14]), .S0(n9), .Y(n196) );
  MX2X1 U167 ( .A(CODEWORD_WIDTH[13]), .B(PWDATA[13]), .S0(n9), .Y(n195) );
  MX2X1 U168 ( .A(CODEWORD_WIDTH[12]), .B(PWDATA[12]), .S0(n9), .Y(n194) );
  MX2X1 U169 ( .A(CODEWORD_WIDTH[11]), .B(PWDATA[11]), .S0(n9), .Y(n193) );
  MX2X1 U170 ( .A(CODEWORD_WIDTH[10]), .B(PWDATA[10]), .S0(n9), .Y(n192) );
  MX2X1 U171 ( .A(CODEWORD_WIDTH[9]), .B(PWDATA[9]), .S0(n9), .Y(n191) );
  MX2X1 U172 ( .A(CODEWORD_WIDTH[8]), .B(PWDATA[8]), .S0(n9), .Y(n190) );
  MX2X1 U173 ( .A(CODEWORD_WIDTH[7]), .B(PWDATA[7]), .S0(n9), .Y(n189) );
  MX2X1 U174 ( .A(CODEWORD_WIDTH[6]), .B(PWDATA[6]), .S0(n9), .Y(n188) );
  MX2X1 U175 ( .A(CODEWORD_WIDTH[5]), .B(PWDATA[5]), .S0(n9), .Y(n187) );
  MX2X1 U176 ( .A(CODEWORD_WIDTH[4]), .B(PWDATA[4]), .S0(n9), .Y(n186) );
  MX2X1 U177 ( .A(CODEWORD_WIDTH[3]), .B(PWDATA[3]), .S0(n9), .Y(n185) );
  MX2X1 U178 ( .A(CODEWORD_WIDTH[2]), .B(PWDATA[2]), .S0(n9), .Y(n184) );
  MX2X1 U179 ( .A(CODEWORD_WIDTH[1]), .B(PWDATA[1]), .S0(n9), .Y(n183) );
  MX2X1 U180 ( .A(CODEWORD_WIDTH[0]), .B(PWDATA[0]), .S0(n9), .Y(n182) );
  MX2X1 U181 ( .A(NOISE[31]), .B(PWDATA[31]), .S0(n10), .Y(n181) );
  MX2X1 U182 ( .A(NOISE[30]), .B(PWDATA[30]), .S0(n10), .Y(n180) );
  MX2X1 U183 ( .A(NOISE[29]), .B(PWDATA[29]), .S0(n10), .Y(n179) );
  MX2X1 U184 ( .A(NOISE[28]), .B(PWDATA[28]), .S0(n10), .Y(n178) );
  MX2X1 U185 ( .A(NOISE[27]), .B(PWDATA[27]), .S0(n10), .Y(n177) );
  MX2X1 U186 ( .A(NOISE[26]), .B(PWDATA[26]), .S0(n10), .Y(n176) );
  MX2X1 U187 ( .A(NOISE[25]), .B(PWDATA[25]), .S0(n10), .Y(n175) );
  MX2X1 U188 ( .A(NOISE[24]), .B(PWDATA[24]), .S0(n10), .Y(n174) );
  MX2X1 U189 ( .A(NOISE[23]), .B(PWDATA[23]), .S0(n10), .Y(n173) );
  MX2X1 U190 ( .A(NOISE[22]), .B(PWDATA[22]), .S0(n10), .Y(n172) );
  MX2X1 U191 ( .A(NOISE[21]), .B(PWDATA[21]), .S0(n10), .Y(n171) );
  MX2X1 U192 ( .A(NOISE[20]), .B(PWDATA[20]), .S0(n10), .Y(n170) );
  MX2X1 U193 ( .A(NOISE[19]), .B(PWDATA[19]), .S0(n10), .Y(n169) );
  MX2X1 U194 ( .A(NOISE[18]), .B(PWDATA[18]), .S0(n10), .Y(n168) );
  MX2X1 U195 ( .A(NOISE[17]), .B(PWDATA[17]), .S0(n10), .Y(n167) );
  MX2X1 U196 ( .A(NOISE[16]), .B(PWDATA[16]), .S0(n10), .Y(n166) );
  MX2X1 U197 ( .A(NOISE[15]), .B(PWDATA[15]), .S0(n10), .Y(n165) );
  MX2X1 U198 ( .A(NOISE[14]), .B(PWDATA[14]), .S0(n10), .Y(n164) );
  MX2X1 U199 ( .A(NOISE[13]), .B(PWDATA[13]), .S0(n10), .Y(n163) );
  MX2X1 U200 ( .A(NOISE[12]), .B(PWDATA[12]), .S0(n10), .Y(n162) );
  MX2X1 U201 ( .A(NOISE[11]), .B(PWDATA[11]), .S0(n10), .Y(n161) );
  MX2X1 U202 ( .A(NOISE[10]), .B(PWDATA[10]), .S0(n10), .Y(n160) );
  MX2X1 U203 ( .A(NOISE[9]), .B(PWDATA[9]), .S0(n10), .Y(n159) );
  MX2X1 U204 ( .A(NOISE[8]), .B(PWDATA[8]), .S0(n10), .Y(n158) );
  MX2X1 U205 ( .A(NOISE[7]), .B(PWDATA[7]), .S0(n10), .Y(n157) );
  MX2X1 U206 ( .A(NOISE[6]), .B(PWDATA[6]), .S0(n10), .Y(n156) );
  MX2X1 U207 ( .A(NOISE[5]), .B(PWDATA[5]), .S0(n10), .Y(n155) );
  MX2X1 U208 ( .A(NOISE[4]), .B(PWDATA[4]), .S0(n10), .Y(n154) );
  MX2X1 U209 ( .A(NOISE[3]), .B(PWDATA[3]), .S0(n10), .Y(n153) );
  MX2X1 U210 ( .A(NOISE[2]), .B(PWDATA[2]), .S0(n10), .Y(n152) );
  MX2X1 U211 ( .A(NOISE[1]), .B(PWDATA[1]), .S0(n10), .Y(n151) );
  MX2X1 U212 ( .A(NOISE[0]), .B(PWDATA[0]), .S0(n10), .Y(n150) );
  NOR2BX1 U213 ( .AN(PWRITE), .B(n147), .Y(n114) );
  OAI221XL U214 ( .A0(n137), .A1(n8), .B0(n92), .B1(n7), .C0(n148), .Y(
        PRDATA[9]) );
  AOI22X1 U215 ( .A0(n15), .A1(NOISE[9]), .B0(n14), .B1(CODEWORD_WIDTH[9]), 
        .Y(n148) );
  INVX1 U216 ( .A(CTRL[9]), .Y(n92) );
  INVX1 U217 ( .A(DATA_IN[9]), .Y(n137) );
  OAI221XL U218 ( .A0(n138), .A1(n8), .B0(n94), .B1(n7), .C0(n279), .Y(
        PRDATA[8]) );
  AOI22X1 U219 ( .A0(n15), .A1(NOISE[8]), .B0(n14), .B1(CODEWORD_WIDTH[8]), 
        .Y(n279) );
  INVX1 U220 ( .A(CTRL[8]), .Y(n94) );
  INVX1 U221 ( .A(DATA_IN[8]), .Y(n138) );
  OAI221XL U222 ( .A0(n139), .A1(n8), .B0(n96), .B1(n7), .C0(n280), .Y(
        PRDATA[7]) );
  AOI22X1 U223 ( .A0(n15), .A1(NOISE[7]), .B0(n14), .B1(CODEWORD_WIDTH[7]), 
        .Y(n280) );
  INVX1 U224 ( .A(CTRL[7]), .Y(n96) );
  INVX1 U225 ( .A(DATA_IN[7]), .Y(n139) );
  OAI221XL U226 ( .A0(n140), .A1(n8), .B0(n98), .B1(n7), .C0(n281), .Y(
        PRDATA[6]) );
  AOI22X1 U227 ( .A0(n15), .A1(NOISE[6]), .B0(n14), .B1(CODEWORD_WIDTH[6]), 
        .Y(n281) );
  INVX1 U228 ( .A(CTRL[6]), .Y(n98) );
  INVX1 U229 ( .A(DATA_IN[6]), .Y(n140) );
  OAI221XL U230 ( .A0(n141), .A1(n8), .B0(n100), .B1(n7), .C0(n282), .Y(
        PRDATA[5]) );
  AOI22X1 U231 ( .A0(n15), .A1(NOISE[5]), .B0(n14), .B1(CODEWORD_WIDTH[5]), 
        .Y(n282) );
  INVX1 U232 ( .A(CTRL[5]), .Y(n100) );
  INVX1 U233 ( .A(DATA_IN[5]), .Y(n141) );
  OAI221XL U234 ( .A0(n142), .A1(n8), .B0(n102), .B1(n7), .C0(n283), .Y(
        PRDATA[4]) );
  AOI22X1 U235 ( .A0(n15), .A1(NOISE[4]), .B0(n14), .B1(CODEWORD_WIDTH[4]), 
        .Y(n283) );
  INVX1 U236 ( .A(CTRL[4]), .Y(n102) );
  INVX1 U237 ( .A(DATA_IN[4]), .Y(n142) );
  OAI221XL U238 ( .A0(n143), .A1(n8), .B0(n104), .B1(n7), .C0(n284), .Y(
        PRDATA[3]) );
  AOI22X1 U239 ( .A0(n15), .A1(NOISE[3]), .B0(n14), .B1(CODEWORD_WIDTH[3]), 
        .Y(n284) );
  INVX1 U240 ( .A(CTRL[3]), .Y(n104) );
  INVX1 U241 ( .A(DATA_IN[3]), .Y(n143) );
  OAI221XL U242 ( .A0(n115), .A1(n8), .B0(n48), .B1(n7), .C0(n285), .Y(
        PRDATA[31]) );
  AOI22X1 U243 ( .A0(n15), .A1(NOISE[31]), .B0(n14), .B1(CODEWORD_WIDTH[31]), 
        .Y(n285) );
  INVX1 U244 ( .A(CTRL[31]), .Y(n48) );
  INVX1 U245 ( .A(DATA_IN[31]), .Y(n115) );
  OAI221XL U246 ( .A0(n116), .A1(n8), .B0(n50), .B1(n7), .C0(n286), .Y(
        PRDATA[30]) );
  AOI22X1 U247 ( .A0(n15), .A1(NOISE[30]), .B0(n14), .B1(CODEWORD_WIDTH[30]), 
        .Y(n286) );
  INVX1 U248 ( .A(CTRL[30]), .Y(n50) );
  INVX1 U249 ( .A(DATA_IN[30]), .Y(n116) );
  OAI221XL U250 ( .A0(n144), .A1(n8), .B0(n106), .B1(n7), .C0(n287), .Y(
        PRDATA[2]) );
  AOI22X1 U251 ( .A0(n15), .A1(NOISE[2]), .B0(n14), .B1(CODEWORD_WIDTH[2]), 
        .Y(n287) );
  INVX1 U252 ( .A(CTRL[2]), .Y(n106) );
  INVX1 U253 ( .A(DATA_IN[2]), .Y(n144) );
  OAI221XL U254 ( .A0(n117), .A1(n8), .B0(n52), .B1(n7), .C0(n288), .Y(
        PRDATA[29]) );
  AOI22X1 U255 ( .A0(n15), .A1(NOISE[29]), .B0(n14), .B1(CODEWORD_WIDTH[29]), 
        .Y(n288) );
  INVX1 U256 ( .A(CTRL[29]), .Y(n52) );
  INVX1 U257 ( .A(DATA_IN[29]), .Y(n117) );
  OAI221XL U258 ( .A0(n118), .A1(n8), .B0(n54), .B1(n7), .C0(n289), .Y(
        PRDATA[28]) );
  AOI22X1 U259 ( .A0(n15), .A1(NOISE[28]), .B0(n14), .B1(CODEWORD_WIDTH[28]), 
        .Y(n289) );
  INVX1 U260 ( .A(CTRL[28]), .Y(n54) );
  INVX1 U261 ( .A(DATA_IN[28]), .Y(n118) );
  OAI221XL U262 ( .A0(n119), .A1(n8), .B0(n56), .B1(n7), .C0(n290), .Y(
        PRDATA[27]) );
  AOI22X1 U263 ( .A0(n15), .A1(NOISE[27]), .B0(n14), .B1(CODEWORD_WIDTH[27]), 
        .Y(n290) );
  INVX1 U264 ( .A(CTRL[27]), .Y(n56) );
  INVX1 U265 ( .A(DATA_IN[27]), .Y(n119) );
  OAI221XL U266 ( .A0(n120), .A1(n8), .B0(n58), .B1(n7), .C0(n291), .Y(
        PRDATA[26]) );
  AOI22X1 U267 ( .A0(n149), .A1(NOISE[26]), .B0(n278), .B1(CODEWORD_WIDTH[26]), 
        .Y(n291) );
  INVX1 U268 ( .A(CTRL[26]), .Y(n58) );
  INVX1 U269 ( .A(DATA_IN[26]), .Y(n120) );
  OAI221XL U270 ( .A0(n121), .A1(n8), .B0(n60), .B1(n7), .C0(n292), .Y(
        PRDATA[25]) );
  AOI22X1 U271 ( .A0(n149), .A1(NOISE[25]), .B0(n278), .B1(CODEWORD_WIDTH[25]), 
        .Y(n292) );
  INVX1 U272 ( .A(CTRL[25]), .Y(n60) );
  INVX1 U273 ( .A(DATA_IN[25]), .Y(n121) );
  OAI221XL U274 ( .A0(n122), .A1(n8), .B0(n62), .B1(n7), .C0(n293), .Y(
        PRDATA[24]) );
  AOI22X1 U275 ( .A0(n149), .A1(NOISE[24]), .B0(n278), .B1(CODEWORD_WIDTH[24]), 
        .Y(n293) );
  INVX1 U276 ( .A(CTRL[24]), .Y(n62) );
  INVX1 U277 ( .A(DATA_IN[24]), .Y(n122) );
  OAI221XL U278 ( .A0(n123), .A1(n8), .B0(n64), .B1(n7), .C0(n294), .Y(
        PRDATA[23]) );
  AOI22X1 U279 ( .A0(n149), .A1(NOISE[23]), .B0(n278), .B1(CODEWORD_WIDTH[23]), 
        .Y(n294) );
  INVX1 U280 ( .A(CTRL[23]), .Y(n64) );
  INVX1 U281 ( .A(DATA_IN[23]), .Y(n123) );
  OAI221XL U282 ( .A0(n124), .A1(n8), .B0(n66), .B1(n7), .C0(n295), .Y(
        PRDATA[22]) );
  AOI22X1 U283 ( .A0(n149), .A1(NOISE[22]), .B0(n278), .B1(CODEWORD_WIDTH[22]), 
        .Y(n295) );
  INVX1 U284 ( .A(CTRL[22]), .Y(n66) );
  INVX1 U285 ( .A(DATA_IN[22]), .Y(n124) );
  OAI221XL U286 ( .A0(n125), .A1(n8), .B0(n68), .B1(n7), .C0(n296), .Y(
        PRDATA[21]) );
  AOI22X1 U287 ( .A0(n149), .A1(NOISE[21]), .B0(n278), .B1(CODEWORD_WIDTH[21]), 
        .Y(n296) );
  INVX1 U288 ( .A(CTRL[21]), .Y(n68) );
  INVX1 U289 ( .A(DATA_IN[21]), .Y(n125) );
  OAI221XL U290 ( .A0(n126), .A1(n8), .B0(n70), .B1(n7), .C0(n297), .Y(
        PRDATA[20]) );
  AOI22X1 U291 ( .A0(n149), .A1(NOISE[20]), .B0(n278), .B1(CODEWORD_WIDTH[20]), 
        .Y(n297) );
  INVX1 U292 ( .A(CTRL[20]), .Y(n70) );
  INVX1 U293 ( .A(DATA_IN[20]), .Y(n126) );
  OAI221XL U294 ( .A0(n145), .A1(n8), .B0(n108), .B1(n7), .C0(n298), .Y(
        PRDATA[1]) );
  AOI22X1 U295 ( .A0(n149), .A1(NOISE[1]), .B0(n278), .B1(CODEWORD_WIDTH[1]), 
        .Y(n298) );
  INVX1 U296 ( .A(CTRL[1]), .Y(n108) );
  INVX1 U297 ( .A(DATA_IN[1]), .Y(n145) );
  OAI221XL U298 ( .A0(n127), .A1(n8), .B0(n72), .B1(n7), .C0(n299), .Y(
        PRDATA[19]) );
  AOI22X1 U299 ( .A0(n149), .A1(NOISE[19]), .B0(n278), .B1(CODEWORD_WIDTH[19]), 
        .Y(n299) );
  INVX1 U300 ( .A(CTRL[19]), .Y(n72) );
  INVX1 U301 ( .A(DATA_IN[19]), .Y(n127) );
  OAI221XL U302 ( .A0(n128), .A1(n8), .B0(n74), .B1(n7), .C0(n300), .Y(
        PRDATA[18]) );
  AOI22X1 U303 ( .A0(n149), .A1(NOISE[18]), .B0(n278), .B1(CODEWORD_WIDTH[18]), 
        .Y(n300) );
  INVX1 U304 ( .A(CTRL[18]), .Y(n74) );
  INVX1 U305 ( .A(DATA_IN[18]), .Y(n128) );
  OAI221XL U306 ( .A0(n129), .A1(n8), .B0(n76), .B1(n7), .C0(n301), .Y(
        PRDATA[17]) );
  AOI22X1 U307 ( .A0(n149), .A1(NOISE[17]), .B0(n278), .B1(CODEWORD_WIDTH[17]), 
        .Y(n301) );
  INVX1 U308 ( .A(CTRL[17]), .Y(n76) );
  INVX1 U309 ( .A(DATA_IN[17]), .Y(n129) );
  OAI221XL U310 ( .A0(n130), .A1(n8), .B0(n78), .B1(n7), .C0(n302), .Y(
        PRDATA[16]) );
  AOI22X1 U311 ( .A0(n149), .A1(NOISE[16]), .B0(n278), .B1(CODEWORD_WIDTH[16]), 
        .Y(n302) );
  INVX1 U312 ( .A(CTRL[16]), .Y(n78) );
  INVX1 U313 ( .A(DATA_IN[16]), .Y(n130) );
  OAI221XL U314 ( .A0(n131), .A1(n8), .B0(n80), .B1(n7), .C0(n303), .Y(
        PRDATA[15]) );
  AOI22X1 U315 ( .A0(n149), .A1(NOISE[15]), .B0(n278), .B1(CODEWORD_WIDTH[15]), 
        .Y(n303) );
  INVX1 U316 ( .A(CTRL[15]), .Y(n80) );
  INVX1 U317 ( .A(DATA_IN[15]), .Y(n131) );
  OAI221XL U318 ( .A0(n132), .A1(n8), .B0(n82), .B1(n7), .C0(n304), .Y(
        PRDATA[14]) );
  AOI22X1 U319 ( .A0(n149), .A1(NOISE[14]), .B0(n278), .B1(CODEWORD_WIDTH[14]), 
        .Y(n304) );
  INVX1 U320 ( .A(CTRL[14]), .Y(n82) );
  INVX1 U321 ( .A(DATA_IN[14]), .Y(n132) );
  OAI221XL U322 ( .A0(n133), .A1(n8), .B0(n84), .B1(n7), .C0(n305), .Y(
        PRDATA[13]) );
  AOI22X1 U323 ( .A0(n149), .A1(NOISE[13]), .B0(n278), .B1(CODEWORD_WIDTH[13]), 
        .Y(n305) );
  INVX1 U324 ( .A(CTRL[13]), .Y(n84) );
  INVX1 U325 ( .A(DATA_IN[13]), .Y(n133) );
  OAI221XL U326 ( .A0(n134), .A1(n8), .B0(n86), .B1(n7), .C0(n306), .Y(
        PRDATA[12]) );
  AOI22X1 U327 ( .A0(n149), .A1(NOISE[12]), .B0(n278), .B1(CODEWORD_WIDTH[12]), 
        .Y(n306) );
  INVX1 U328 ( .A(CTRL[12]), .Y(n86) );
  INVX1 U329 ( .A(DATA_IN[12]), .Y(n134) );
  OAI221XL U330 ( .A0(n135), .A1(n8), .B0(n88), .B1(n7), .C0(n307), .Y(
        PRDATA[11]) );
  AOI22X1 U331 ( .A0(n149), .A1(NOISE[11]), .B0(n278), .B1(CODEWORD_WIDTH[11]), 
        .Y(n307) );
  INVX1 U332 ( .A(CTRL[11]), .Y(n88) );
  INVX1 U333 ( .A(DATA_IN[11]), .Y(n135) );
  OAI221XL U334 ( .A0(n136), .A1(n8), .B0(n90), .B1(n7), .C0(n308), .Y(
        PRDATA[10]) );
  AOI22X1 U335 ( .A0(n149), .A1(NOISE[10]), .B0(n278), .B1(CODEWORD_WIDTH[10]), 
        .Y(n308) );
  INVX1 U336 ( .A(CTRL[10]), .Y(n90) );
  INVX1 U337 ( .A(DATA_IN[10]), .Y(n136) );
  OAI221XL U338 ( .A0(n146), .A1(n8), .B0(n110), .B1(n7), .C0(n309), .Y(
        PRDATA[0]) );
  INVX1 U339 ( .A(PADDR[2]), .Y(n112) );
  INVX1 U340 ( .A(CTRL[0]), .Y(n110) );
  AND4X1 U341 ( .A(n311), .B(n312), .C(n313), .D(n314), .Y(n310) );
  NOR4BX1 U342 ( .AN(n315), .B(n316), .C(PADDR[7]), .D(PADDR[6]), .Y(n314) );
  OR4X1 U343 ( .A(PADDR[19]), .B(PADDR[18]), .C(PADDR[5]), .D(PADDR[4]), .Y(
        n316) );
  NOR3X1 U344 ( .A(PADDR[8]), .B(PWRITE), .C(PADDR[9]), .Y(n315) );
  NOR4X1 U345 ( .A(PADDR[12]), .B(PADDR[11]), .C(PADDR[10]), .D(n147), .Y(n313) );
  NAND3X1 U346 ( .A(current_state), .B(PENABLE), .C(n317), .Y(n147) );
  NOR2X1 U347 ( .A(PADDR[1]), .B(PADDR[0]), .Y(n317) );
  NOR3X1 U348 ( .A(PADDR[15]), .B(PADDR[17]), .C(PADDR[16]), .Y(n312) );
  NOR2X1 U349 ( .A(PADDR[14]), .B(PADDR[13]), .Y(n311) );
  INVX1 U350 ( .A(PADDR[3]), .Y(n113) );
  INVX1 U351 ( .A(DATA_IN[0]), .Y(n146) );
endmodule


module MAT_MULT_A_ROWS6_A_COLS26_B_COLS1 ( A_data_in, B_data_in, C_data_out );
  input [155:0] A_data_in;
  input [25:0] B_data_in;
  output [5:0] C_data_out;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323;

  NAND2X2 U1 ( .A(B_data_in[6]), .B(B_data_in[5]), .Y(n23) );
  NAND2XL U2 ( .A(A_data_in[55]), .B(n9), .Y(n171) );
  NAND2XL U3 ( .A(A_data_in[29]), .B(n9), .Y(n224) );
  NAND2XL U4 ( .A(A_data_in[3]), .B(n9), .Y(n277) );
  AND2X2 U5 ( .A(B_data_in[3]), .B(B_data_in[2]), .Y(n9) );
  NAND2BX2 U6 ( .AN(B_data_in[5]), .B(n21), .Y(n19) );
  CLKINVX3 U7 ( .A(B_data_in[6]), .Y(n21) );
  NOR2X2 U8 ( .A(B_data_in[2]), .B(B_data_in[3]), .Y(n6) );
  XOR2X1 U9 ( .A(n1), .B(n2), .Y(C_data_out[5]) );
  XOR2X1 U10 ( .A(n3), .B(n4), .Y(n2) );
  NOR3X1 U11 ( .A(n5), .B(n6), .C(n7), .Y(n4) );
  AOI21X1 U12 ( .A0(A_data_in[132]), .A1(B_data_in[2]), .B0(A_data_in[133]), 
        .Y(n7) );
  MXI2X1 U13 ( .A(B_data_in[3]), .B(n8), .S0(A_data_in[132]), .Y(n5) );
  NAND2X1 U14 ( .A(A_data_in[133]), .B(n9), .Y(n8) );
  NAND2X1 U15 ( .A(B_data_in[1]), .B(A_data_in[131]), .Y(n3) );
  XOR2X1 U16 ( .A(n10), .B(n11), .Y(n1) );
  XOR2X1 U17 ( .A(n12), .B(n13), .Y(n11) );
  XOR2X1 U18 ( .A(n14), .B(n15), .Y(n13) );
  NAND2X1 U19 ( .A(B_data_in[9]), .B(A_data_in[139]), .Y(n15) );
  NAND2X1 U20 ( .A(B_data_in[10]), .B(A_data_in[140]), .Y(n14) );
  XOR2X1 U21 ( .A(n16), .B(n17), .Y(n12) );
  NAND2X1 U22 ( .A(B_data_in[4]), .B(A_data_in[134]), .Y(n17) );
  NAND3X1 U23 ( .A(n18), .B(n19), .C(n20), .Y(n16) );
  MXI2X1 U24 ( .A(n21), .B(n22), .S0(A_data_in[135]), .Y(n20) );
  NOR2X1 U25 ( .A(n23), .B(n24), .Y(n22) );
  OAI2BB1X1 U26 ( .A0N(B_data_in[5]), .A1N(A_data_in[135]), .B0(n24), .Y(n18)
         );
  INVX1 U27 ( .A(A_data_in[136]), .Y(n24) );
  XOR2X1 U28 ( .A(n25), .B(n26), .Y(n10) );
  XOR2X1 U29 ( .A(n27), .B(n28), .Y(n26) );
  XOR2X1 U30 ( .A(n29), .B(n30), .Y(n28) );
  XOR2X1 U31 ( .A(n31), .B(n32), .Y(n30) );
  XOR2X1 U32 ( .A(n33), .B(n34), .Y(n32) );
  NAND2X1 U33 ( .A(B_data_in[16]), .B(A_data_in[146]), .Y(n34) );
  NAND2X1 U34 ( .A(B_data_in[13]), .B(A_data_in[143]), .Y(n33) );
  XOR2X1 U35 ( .A(n35), .B(n36), .Y(n31) );
  NAND2X1 U36 ( .A(B_data_in[12]), .B(A_data_in[142]), .Y(n36) );
  NAND2X1 U37 ( .A(B_data_in[11]), .B(A_data_in[141]), .Y(n35) );
  XOR2X1 U38 ( .A(n37), .B(n38), .Y(n29) );
  XOR2X1 U39 ( .A(n39), .B(n40), .Y(n38) );
  NAND2X1 U40 ( .A(B_data_in[14]), .B(A_data_in[144]), .Y(n40) );
  NAND2X1 U41 ( .A(B_data_in[17]), .B(A_data_in[147]), .Y(n39) );
  XOR2X1 U42 ( .A(n41), .B(n42), .Y(n37) );
  XOR2X1 U43 ( .A(n43), .B(n44), .Y(n42) );
  XOR2X1 U44 ( .A(n45), .B(n46), .Y(n44) );
  XOR2X1 U45 ( .A(n47), .B(n48), .Y(n46) );
  NAND2X1 U46 ( .A(B_data_in[19]), .B(A_data_in[149]), .Y(n48) );
  NAND2X1 U47 ( .A(B_data_in[18]), .B(A_data_in[148]), .Y(n47) );
  XOR2X1 U48 ( .A(n49), .B(n50), .Y(n45) );
  NAND2X1 U49 ( .A(B_data_in[21]), .B(A_data_in[151]), .Y(n50) );
  NAND2X1 U50 ( .A(B_data_in[20]), .B(A_data_in[150]), .Y(n49) );
  XOR2X1 U51 ( .A(n51), .B(n52), .Y(n43) );
  XOR2X1 U52 ( .A(n53), .B(n54), .Y(n52) );
  NAND2X1 U53 ( .A(B_data_in[23]), .B(A_data_in[153]), .Y(n54) );
  NAND2X1 U54 ( .A(B_data_in[22]), .B(A_data_in[152]), .Y(n53) );
  XOR2X1 U55 ( .A(n55), .B(n56), .Y(n51) );
  NAND2X1 U56 ( .A(B_data_in[25]), .B(A_data_in[155]), .Y(n56) );
  NAND2X1 U57 ( .A(B_data_in[24]), .B(A_data_in[154]), .Y(n55) );
  NAND2X1 U58 ( .A(B_data_in[15]), .B(A_data_in[145]), .Y(n41) );
  NAND2X1 U59 ( .A(B_data_in[0]), .B(A_data_in[130]), .Y(n27) );
  XNOR2X1 U60 ( .A(n57), .B(n58), .Y(n25) );
  NAND2X1 U61 ( .A(B_data_in[7]), .B(A_data_in[137]), .Y(n58) );
  NAND2X1 U62 ( .A(B_data_in[8]), .B(A_data_in[138]), .Y(n57) );
  XOR2X1 U63 ( .A(n59), .B(n60), .Y(C_data_out[4]) );
  XOR2X1 U64 ( .A(n61), .B(n62), .Y(n60) );
  NOR3X1 U65 ( .A(n63), .B(n6), .C(n64), .Y(n62) );
  AOI21X1 U66 ( .A0(A_data_in[106]), .A1(B_data_in[2]), .B0(A_data_in[107]), 
        .Y(n64) );
  MXI2X1 U67 ( .A(B_data_in[3]), .B(n65), .S0(A_data_in[106]), .Y(n63) );
  NAND2X1 U68 ( .A(A_data_in[107]), .B(n9), .Y(n65) );
  NAND2X1 U69 ( .A(A_data_in[105]), .B(B_data_in[1]), .Y(n61) );
  XOR2X1 U70 ( .A(n66), .B(n67), .Y(n59) );
  XOR2X1 U71 ( .A(n68), .B(n69), .Y(n67) );
  XOR2X1 U72 ( .A(n70), .B(n71), .Y(n69) );
  NAND2X1 U73 ( .A(A_data_in[113]), .B(B_data_in[9]), .Y(n71) );
  NAND2X1 U74 ( .A(A_data_in[114]), .B(B_data_in[10]), .Y(n70) );
  XOR2X1 U75 ( .A(n72), .B(n73), .Y(n68) );
  NAND2X1 U76 ( .A(A_data_in[108]), .B(B_data_in[4]), .Y(n73) );
  NAND3X1 U77 ( .A(n74), .B(n19), .C(n75), .Y(n72) );
  MXI2X1 U78 ( .A(n21), .B(n76), .S0(A_data_in[109]), .Y(n75) );
  NOR2X1 U79 ( .A(n23), .B(n77), .Y(n76) );
  OAI2BB1X1 U80 ( .A0N(B_data_in[5]), .A1N(A_data_in[109]), .B0(n77), .Y(n74)
         );
  INVX1 U81 ( .A(A_data_in[110]), .Y(n77) );
  XOR2X1 U82 ( .A(n78), .B(n79), .Y(n66) );
  XOR2X1 U83 ( .A(n80), .B(n81), .Y(n79) );
  XOR2X1 U84 ( .A(n82), .B(n83), .Y(n81) );
  XOR2X1 U85 ( .A(n84), .B(n85), .Y(n83) );
  XOR2X1 U86 ( .A(n86), .B(n87), .Y(n85) );
  NAND2X1 U87 ( .A(A_data_in[120]), .B(B_data_in[16]), .Y(n87) );
  NAND2X1 U88 ( .A(A_data_in[117]), .B(B_data_in[13]), .Y(n86) );
  XOR2X1 U89 ( .A(n88), .B(n89), .Y(n84) );
  NAND2X1 U90 ( .A(A_data_in[116]), .B(B_data_in[12]), .Y(n89) );
  NAND2X1 U91 ( .A(A_data_in[115]), .B(B_data_in[11]), .Y(n88) );
  XOR2X1 U92 ( .A(n90), .B(n91), .Y(n82) );
  XOR2X1 U93 ( .A(n92), .B(n93), .Y(n91) );
  NAND2X1 U94 ( .A(A_data_in[118]), .B(B_data_in[14]), .Y(n93) );
  NAND2X1 U95 ( .A(A_data_in[121]), .B(B_data_in[17]), .Y(n92) );
  XOR2X1 U96 ( .A(n94), .B(n95), .Y(n90) );
  XOR2X1 U97 ( .A(n96), .B(n97), .Y(n95) );
  XOR2X1 U98 ( .A(n98), .B(n99), .Y(n97) );
  XOR2X1 U99 ( .A(n100), .B(n101), .Y(n99) );
  NAND2X1 U100 ( .A(A_data_in[123]), .B(B_data_in[19]), .Y(n101) );
  NAND2X1 U101 ( .A(A_data_in[122]), .B(B_data_in[18]), .Y(n100) );
  XOR2X1 U102 ( .A(n102), .B(n103), .Y(n98) );
  NAND2X1 U103 ( .A(A_data_in[125]), .B(B_data_in[21]), .Y(n103) );
  NAND2X1 U104 ( .A(A_data_in[124]), .B(B_data_in[20]), .Y(n102) );
  XOR2X1 U105 ( .A(n104), .B(n105), .Y(n96) );
  XOR2X1 U106 ( .A(n106), .B(n107), .Y(n105) );
  NAND2X1 U107 ( .A(A_data_in[127]), .B(B_data_in[23]), .Y(n107) );
  NAND2X1 U108 ( .A(A_data_in[126]), .B(B_data_in[22]), .Y(n106) );
  XOR2X1 U109 ( .A(n108), .B(n109), .Y(n104) );
  NAND2X1 U110 ( .A(A_data_in[129]), .B(B_data_in[25]), .Y(n109) );
  NAND2X1 U111 ( .A(A_data_in[128]), .B(B_data_in[24]), .Y(n108) );
  NAND2X1 U112 ( .A(A_data_in[119]), .B(B_data_in[15]), .Y(n94) );
  NAND2X1 U113 ( .A(A_data_in[104]), .B(B_data_in[0]), .Y(n80) );
  XNOR2X1 U114 ( .A(n110), .B(n111), .Y(n78) );
  NAND2X1 U115 ( .A(A_data_in[111]), .B(B_data_in[7]), .Y(n111) );
  NAND2X1 U116 ( .A(A_data_in[112]), .B(B_data_in[8]), .Y(n110) );
  XOR2X1 U117 ( .A(n112), .B(n113), .Y(C_data_out[3]) );
  XOR2X1 U118 ( .A(n114), .B(n115), .Y(n113) );
  NOR3X1 U119 ( .A(n116), .B(n6), .C(n117), .Y(n115) );
  AOI21X1 U120 ( .A0(A_data_in[80]), .A1(B_data_in[2]), .B0(A_data_in[81]), 
        .Y(n117) );
  MXI2X1 U121 ( .A(B_data_in[3]), .B(n118), .S0(A_data_in[80]), .Y(n116) );
  NAND2X1 U122 ( .A(A_data_in[81]), .B(n9), .Y(n118) );
  NAND2X1 U123 ( .A(A_data_in[79]), .B(B_data_in[1]), .Y(n114) );
  XOR2X1 U124 ( .A(n119), .B(n120), .Y(n112) );
  XOR2X1 U125 ( .A(n121), .B(n122), .Y(n120) );
  XOR2X1 U126 ( .A(n123), .B(n124), .Y(n122) );
  NAND2X1 U127 ( .A(A_data_in[87]), .B(B_data_in[9]), .Y(n124) );
  NAND2X1 U128 ( .A(A_data_in[88]), .B(B_data_in[10]), .Y(n123) );
  XOR2X1 U129 ( .A(n125), .B(n126), .Y(n121) );
  NAND2X1 U130 ( .A(A_data_in[82]), .B(B_data_in[4]), .Y(n126) );
  NAND3X1 U131 ( .A(n127), .B(n19), .C(n128), .Y(n125) );
  MXI2X1 U132 ( .A(n21), .B(n129), .S0(A_data_in[83]), .Y(n128) );
  NOR2X1 U133 ( .A(n23), .B(n130), .Y(n129) );
  OAI2BB1X1 U134 ( .A0N(B_data_in[5]), .A1N(A_data_in[83]), .B0(n130), .Y(n127) );
  INVX1 U135 ( .A(A_data_in[84]), .Y(n130) );
  XOR2X1 U136 ( .A(n131), .B(n132), .Y(n119) );
  XOR2X1 U137 ( .A(n133), .B(n134), .Y(n132) );
  XOR2X1 U138 ( .A(n135), .B(n136), .Y(n134) );
  XOR2X1 U139 ( .A(n137), .B(n138), .Y(n136) );
  XOR2X1 U140 ( .A(n139), .B(n140), .Y(n138) );
  NAND2X1 U141 ( .A(A_data_in[94]), .B(B_data_in[16]), .Y(n140) );
  NAND2X1 U142 ( .A(A_data_in[91]), .B(B_data_in[13]), .Y(n139) );
  XOR2X1 U143 ( .A(n141), .B(n142), .Y(n137) );
  NAND2X1 U144 ( .A(A_data_in[90]), .B(B_data_in[12]), .Y(n142) );
  NAND2X1 U145 ( .A(A_data_in[89]), .B(B_data_in[11]), .Y(n141) );
  XOR2X1 U146 ( .A(n143), .B(n144), .Y(n135) );
  XOR2X1 U147 ( .A(n145), .B(n146), .Y(n144) );
  NAND2X1 U148 ( .A(A_data_in[92]), .B(B_data_in[14]), .Y(n146) );
  NAND2X1 U149 ( .A(A_data_in[95]), .B(B_data_in[17]), .Y(n145) );
  XOR2X1 U150 ( .A(n147), .B(n148), .Y(n143) );
  XOR2X1 U151 ( .A(n149), .B(n150), .Y(n148) );
  XOR2X1 U152 ( .A(n151), .B(n152), .Y(n150) );
  XOR2X1 U153 ( .A(n153), .B(n154), .Y(n152) );
  NAND2X1 U154 ( .A(A_data_in[97]), .B(B_data_in[19]), .Y(n154) );
  NAND2X1 U155 ( .A(A_data_in[96]), .B(B_data_in[18]), .Y(n153) );
  XOR2X1 U156 ( .A(n155), .B(n156), .Y(n151) );
  NAND2X1 U157 ( .A(A_data_in[99]), .B(B_data_in[21]), .Y(n156) );
  NAND2X1 U158 ( .A(A_data_in[98]), .B(B_data_in[20]), .Y(n155) );
  XOR2X1 U159 ( .A(n157), .B(n158), .Y(n149) );
  XOR2X1 U160 ( .A(n159), .B(n160), .Y(n158) );
  NAND2X1 U161 ( .A(A_data_in[101]), .B(B_data_in[23]), .Y(n160) );
  NAND2X1 U162 ( .A(A_data_in[100]), .B(B_data_in[22]), .Y(n159) );
  XOR2X1 U163 ( .A(n161), .B(n162), .Y(n157) );
  NAND2X1 U164 ( .A(A_data_in[103]), .B(B_data_in[25]), .Y(n162) );
  NAND2X1 U165 ( .A(A_data_in[102]), .B(B_data_in[24]), .Y(n161) );
  NAND2X1 U166 ( .A(A_data_in[93]), .B(B_data_in[15]), .Y(n147) );
  NAND2X1 U167 ( .A(A_data_in[78]), .B(B_data_in[0]), .Y(n133) );
  XNOR2X1 U168 ( .A(n163), .B(n164), .Y(n131) );
  NAND2X1 U169 ( .A(A_data_in[85]), .B(B_data_in[7]), .Y(n164) );
  NAND2X1 U170 ( .A(A_data_in[86]), .B(B_data_in[8]), .Y(n163) );
  XOR2X1 U171 ( .A(n165), .B(n166), .Y(C_data_out[2]) );
  XOR2X1 U172 ( .A(n167), .B(n168), .Y(n166) );
  NOR3X1 U173 ( .A(n169), .B(n6), .C(n170), .Y(n168) );
  AOI21X1 U174 ( .A0(A_data_in[54]), .A1(B_data_in[2]), .B0(A_data_in[55]), 
        .Y(n170) );
  MXI2X1 U175 ( .A(B_data_in[3]), .B(n171), .S0(A_data_in[54]), .Y(n169) );
  NAND2X1 U176 ( .A(A_data_in[53]), .B(B_data_in[1]), .Y(n167) );
  XOR2X1 U177 ( .A(n172), .B(n173), .Y(n165) );
  XOR2X1 U178 ( .A(n174), .B(n175), .Y(n173) );
  XOR2X1 U179 ( .A(n176), .B(n177), .Y(n175) );
  NAND2X1 U180 ( .A(A_data_in[61]), .B(B_data_in[9]), .Y(n177) );
  NAND2X1 U181 ( .A(A_data_in[62]), .B(B_data_in[10]), .Y(n176) );
  XOR2X1 U182 ( .A(n178), .B(n179), .Y(n174) );
  NAND2X1 U183 ( .A(A_data_in[56]), .B(B_data_in[4]), .Y(n179) );
  NAND3X1 U184 ( .A(n180), .B(n19), .C(n181), .Y(n178) );
  MXI2X1 U185 ( .A(n21), .B(n182), .S0(A_data_in[57]), .Y(n181) );
  NOR2X1 U186 ( .A(n23), .B(n183), .Y(n182) );
  OAI2BB1X1 U187 ( .A0N(B_data_in[5]), .A1N(A_data_in[57]), .B0(n183), .Y(n180) );
  INVX1 U188 ( .A(A_data_in[58]), .Y(n183) );
  XOR2X1 U189 ( .A(n184), .B(n185), .Y(n172) );
  XOR2X1 U190 ( .A(n186), .B(n187), .Y(n185) );
  XOR2X1 U191 ( .A(n188), .B(n189), .Y(n187) );
  XOR2X1 U192 ( .A(n190), .B(n191), .Y(n189) );
  XOR2X1 U193 ( .A(n192), .B(n193), .Y(n191) );
  NAND2X1 U194 ( .A(A_data_in[68]), .B(B_data_in[16]), .Y(n193) );
  NAND2X1 U195 ( .A(A_data_in[65]), .B(B_data_in[13]), .Y(n192) );
  XOR2X1 U196 ( .A(n194), .B(n195), .Y(n190) );
  NAND2X1 U197 ( .A(A_data_in[64]), .B(B_data_in[12]), .Y(n195) );
  NAND2X1 U198 ( .A(A_data_in[63]), .B(B_data_in[11]), .Y(n194) );
  XOR2X1 U199 ( .A(n196), .B(n197), .Y(n188) );
  XOR2X1 U200 ( .A(n198), .B(n199), .Y(n197) );
  NAND2X1 U201 ( .A(A_data_in[66]), .B(B_data_in[14]), .Y(n199) );
  NAND2X1 U202 ( .A(A_data_in[69]), .B(B_data_in[17]), .Y(n198) );
  XOR2X1 U203 ( .A(n200), .B(n201), .Y(n196) );
  XOR2X1 U204 ( .A(n202), .B(n203), .Y(n201) );
  XOR2X1 U205 ( .A(n204), .B(n205), .Y(n203) );
  XOR2X1 U206 ( .A(n206), .B(n207), .Y(n205) );
  NAND2X1 U207 ( .A(A_data_in[71]), .B(B_data_in[19]), .Y(n207) );
  NAND2X1 U208 ( .A(A_data_in[70]), .B(B_data_in[18]), .Y(n206) );
  XOR2X1 U209 ( .A(n208), .B(n209), .Y(n204) );
  NAND2X1 U210 ( .A(A_data_in[73]), .B(B_data_in[21]), .Y(n209) );
  NAND2X1 U211 ( .A(A_data_in[72]), .B(B_data_in[20]), .Y(n208) );
  XOR2X1 U212 ( .A(n210), .B(n211), .Y(n202) );
  XOR2X1 U213 ( .A(n212), .B(n213), .Y(n211) );
  NAND2X1 U214 ( .A(A_data_in[75]), .B(B_data_in[23]), .Y(n213) );
  NAND2X1 U215 ( .A(A_data_in[74]), .B(B_data_in[22]), .Y(n212) );
  XOR2X1 U216 ( .A(n214), .B(n215), .Y(n210) );
  NAND2X1 U217 ( .A(A_data_in[77]), .B(B_data_in[25]), .Y(n215) );
  NAND2X1 U218 ( .A(A_data_in[76]), .B(B_data_in[24]), .Y(n214) );
  NAND2X1 U219 ( .A(A_data_in[67]), .B(B_data_in[15]), .Y(n200) );
  NAND2X1 U220 ( .A(A_data_in[52]), .B(B_data_in[0]), .Y(n186) );
  XNOR2X1 U221 ( .A(n216), .B(n217), .Y(n184) );
  NAND2X1 U222 ( .A(A_data_in[59]), .B(B_data_in[7]), .Y(n217) );
  NAND2X1 U223 ( .A(A_data_in[60]), .B(B_data_in[8]), .Y(n216) );
  XOR2X1 U224 ( .A(n218), .B(n219), .Y(C_data_out[1]) );
  XOR2X1 U225 ( .A(n220), .B(n221), .Y(n219) );
  NOR3X1 U226 ( .A(n222), .B(n6), .C(n223), .Y(n221) );
  AOI21X1 U227 ( .A0(A_data_in[28]), .A1(B_data_in[2]), .B0(A_data_in[29]), 
        .Y(n223) );
  MXI2X1 U228 ( .A(B_data_in[3]), .B(n224), .S0(A_data_in[28]), .Y(n222) );
  NAND2X1 U229 ( .A(A_data_in[27]), .B(B_data_in[1]), .Y(n220) );
  XOR2X1 U230 ( .A(n225), .B(n226), .Y(n218) );
  XOR2X1 U231 ( .A(n227), .B(n228), .Y(n226) );
  XOR2X1 U232 ( .A(n229), .B(n230), .Y(n228) );
  NAND2X1 U233 ( .A(A_data_in[35]), .B(B_data_in[9]), .Y(n230) );
  NAND2X1 U234 ( .A(A_data_in[36]), .B(B_data_in[10]), .Y(n229) );
  XOR2X1 U235 ( .A(n231), .B(n232), .Y(n227) );
  NAND2X1 U236 ( .A(A_data_in[30]), .B(B_data_in[4]), .Y(n232) );
  NAND3X1 U237 ( .A(n233), .B(n19), .C(n234), .Y(n231) );
  MXI2X1 U238 ( .A(n21), .B(n235), .S0(A_data_in[31]), .Y(n234) );
  NOR2X1 U239 ( .A(n23), .B(n236), .Y(n235) );
  OAI2BB1X1 U240 ( .A0N(B_data_in[5]), .A1N(A_data_in[31]), .B0(n236), .Y(n233) );
  INVX1 U241 ( .A(A_data_in[32]), .Y(n236) );
  XOR2X1 U242 ( .A(n237), .B(n238), .Y(n225) );
  XOR2X1 U243 ( .A(n239), .B(n240), .Y(n238) );
  XOR2X1 U244 ( .A(n241), .B(n242), .Y(n240) );
  XOR2X1 U245 ( .A(n243), .B(n244), .Y(n242) );
  XOR2X1 U246 ( .A(n245), .B(n246), .Y(n244) );
  NAND2X1 U247 ( .A(A_data_in[42]), .B(B_data_in[16]), .Y(n246) );
  NAND2X1 U248 ( .A(A_data_in[39]), .B(B_data_in[13]), .Y(n245) );
  XOR2X1 U249 ( .A(n247), .B(n248), .Y(n243) );
  NAND2X1 U250 ( .A(A_data_in[38]), .B(B_data_in[12]), .Y(n248) );
  NAND2X1 U251 ( .A(A_data_in[37]), .B(B_data_in[11]), .Y(n247) );
  XOR2X1 U252 ( .A(n249), .B(n250), .Y(n241) );
  XOR2X1 U253 ( .A(n251), .B(n252), .Y(n250) );
  NAND2X1 U254 ( .A(A_data_in[40]), .B(B_data_in[14]), .Y(n252) );
  NAND2X1 U255 ( .A(A_data_in[43]), .B(B_data_in[17]), .Y(n251) );
  XOR2X1 U256 ( .A(n253), .B(n254), .Y(n249) );
  XOR2X1 U257 ( .A(n255), .B(n256), .Y(n254) );
  XOR2X1 U258 ( .A(n257), .B(n258), .Y(n256) );
  XOR2X1 U259 ( .A(n259), .B(n260), .Y(n258) );
  NAND2X1 U260 ( .A(A_data_in[45]), .B(B_data_in[19]), .Y(n260) );
  NAND2X1 U261 ( .A(A_data_in[44]), .B(B_data_in[18]), .Y(n259) );
  XOR2X1 U262 ( .A(n261), .B(n262), .Y(n257) );
  NAND2X1 U263 ( .A(A_data_in[47]), .B(B_data_in[21]), .Y(n262) );
  NAND2X1 U264 ( .A(A_data_in[46]), .B(B_data_in[20]), .Y(n261) );
  XOR2X1 U265 ( .A(n263), .B(n264), .Y(n255) );
  XOR2X1 U266 ( .A(n265), .B(n266), .Y(n264) );
  NAND2X1 U267 ( .A(A_data_in[49]), .B(B_data_in[23]), .Y(n266) );
  NAND2X1 U268 ( .A(A_data_in[48]), .B(B_data_in[22]), .Y(n265) );
  XOR2X1 U269 ( .A(n267), .B(n268), .Y(n263) );
  NAND2X1 U270 ( .A(A_data_in[51]), .B(B_data_in[25]), .Y(n268) );
  NAND2X1 U271 ( .A(A_data_in[50]), .B(B_data_in[24]), .Y(n267) );
  NAND2X1 U272 ( .A(A_data_in[41]), .B(B_data_in[15]), .Y(n253) );
  NAND2X1 U273 ( .A(A_data_in[26]), .B(B_data_in[0]), .Y(n239) );
  XNOR2X1 U274 ( .A(n269), .B(n270), .Y(n237) );
  NAND2X1 U275 ( .A(A_data_in[33]), .B(B_data_in[7]), .Y(n270) );
  NAND2X1 U276 ( .A(A_data_in[34]), .B(B_data_in[8]), .Y(n269) );
  XOR2X1 U277 ( .A(n271), .B(n272), .Y(C_data_out[0]) );
  XOR2X1 U278 ( .A(n273), .B(n274), .Y(n272) );
  NOR3X1 U279 ( .A(n275), .B(n6), .C(n276), .Y(n274) );
  AOI21X1 U280 ( .A0(A_data_in[2]), .A1(B_data_in[2]), .B0(A_data_in[3]), .Y(
        n276) );
  MXI2X1 U281 ( .A(B_data_in[3]), .B(n277), .S0(A_data_in[2]), .Y(n275) );
  NAND2X1 U282 ( .A(A_data_in[1]), .B(B_data_in[1]), .Y(n273) );
  XOR2X1 U283 ( .A(n278), .B(n279), .Y(n271) );
  XOR2X1 U284 ( .A(n280), .B(n281), .Y(n279) );
  XOR2X1 U285 ( .A(n282), .B(n283), .Y(n281) );
  NAND2X1 U286 ( .A(A_data_in[9]), .B(B_data_in[9]), .Y(n283) );
  NAND2X1 U287 ( .A(A_data_in[10]), .B(B_data_in[10]), .Y(n282) );
  XOR2X1 U288 ( .A(n284), .B(n285), .Y(n280) );
  NAND2X1 U289 ( .A(A_data_in[4]), .B(B_data_in[4]), .Y(n285) );
  NAND3X1 U290 ( .A(n286), .B(n19), .C(n287), .Y(n284) );
  MXI2X1 U291 ( .A(n21), .B(n288), .S0(A_data_in[5]), .Y(n287) );
  NOR2X1 U292 ( .A(n23), .B(n289), .Y(n288) );
  OAI2BB1X1 U293 ( .A0N(B_data_in[5]), .A1N(A_data_in[5]), .B0(n289), .Y(n286)
         );
  INVX1 U294 ( .A(A_data_in[6]), .Y(n289) );
  XOR2X1 U295 ( .A(n290), .B(n291), .Y(n278) );
  XOR2X1 U296 ( .A(n292), .B(n293), .Y(n291) );
  XOR2X1 U297 ( .A(n294), .B(n295), .Y(n293) );
  XOR2X1 U298 ( .A(n296), .B(n297), .Y(n295) );
  XOR2X1 U299 ( .A(n298), .B(n299), .Y(n297) );
  NAND2X1 U300 ( .A(A_data_in[16]), .B(B_data_in[16]), .Y(n299) );
  NAND2X1 U301 ( .A(A_data_in[13]), .B(B_data_in[13]), .Y(n298) );
  XOR2X1 U302 ( .A(n300), .B(n301), .Y(n296) );
  NAND2X1 U303 ( .A(A_data_in[12]), .B(B_data_in[12]), .Y(n301) );
  NAND2X1 U304 ( .A(A_data_in[11]), .B(B_data_in[11]), .Y(n300) );
  XOR2X1 U305 ( .A(n302), .B(n303), .Y(n294) );
  XOR2X1 U306 ( .A(n304), .B(n305), .Y(n303) );
  NAND2X1 U307 ( .A(A_data_in[14]), .B(B_data_in[14]), .Y(n305) );
  NAND2X1 U308 ( .A(A_data_in[17]), .B(B_data_in[17]), .Y(n304) );
  XOR2X1 U309 ( .A(n306), .B(n307), .Y(n302) );
  XOR2X1 U310 ( .A(n308), .B(n309), .Y(n307) );
  XOR2X1 U311 ( .A(n310), .B(n311), .Y(n309) );
  XOR2X1 U312 ( .A(n312), .B(n313), .Y(n311) );
  NAND2X1 U313 ( .A(A_data_in[19]), .B(B_data_in[19]), .Y(n313) );
  NAND2X1 U314 ( .A(A_data_in[18]), .B(B_data_in[18]), .Y(n312) );
  XOR2X1 U315 ( .A(n314), .B(n315), .Y(n310) );
  NAND2X1 U316 ( .A(A_data_in[21]), .B(B_data_in[21]), .Y(n315) );
  NAND2X1 U317 ( .A(A_data_in[20]), .B(B_data_in[20]), .Y(n314) );
  XOR2X1 U318 ( .A(n316), .B(n317), .Y(n308) );
  XOR2X1 U319 ( .A(n318), .B(n319), .Y(n317) );
  NAND2X1 U320 ( .A(A_data_in[23]), .B(B_data_in[23]), .Y(n319) );
  NAND2X1 U321 ( .A(A_data_in[22]), .B(B_data_in[22]), .Y(n318) );
  XOR2X1 U322 ( .A(n320), .B(n321), .Y(n316) );
  NAND2X1 U323 ( .A(A_data_in[25]), .B(B_data_in[25]), .Y(n321) );
  NAND2X1 U324 ( .A(A_data_in[24]), .B(B_data_in[24]), .Y(n320) );
  NAND2X1 U325 ( .A(A_data_in[15]), .B(B_data_in[15]), .Y(n306) );
  NAND2X1 U326 ( .A(A_data_in[0]), .B(B_data_in[0]), .Y(n292) );
  XNOR2X1 U327 ( .A(n322), .B(n323), .Y(n290) );
  NAND2X1 U328 ( .A(A_data_in[7]), .B(B_data_in[7]), .Y(n323) );
  NAND2X1 U329 ( .A(A_data_in[8]), .B(B_data_in[8]), .Y(n322) );
endmodule


module ENC_STAGE_1_AMBA_WORD32_MAX_CODEWORD_WIDTH32_MAX_INFO_WIDTH26 ( clk, 
        rst, data_in, work_mod, data_out );
  input [25:0] data_in;
  input [31:0] work_mod;
  output [31:0] data_out;
  input clk, rst;
  wire   mat_for_mult_88, n13, n14, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;
  wire   [5:0] parity_bits;
  wire   [31:0] final_temp;

  MAT_MULT_A_ROWS6_A_COLS26_B_COLS1 matrix_multiplier ( .A_data_in({1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        n14, n14, n14, n14, n14, n14, n14, n14, n14, n14, n14, n14, n14, n14, 
        n14, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        n14, n14, n14, n14, n14, n14, n14, n14, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, mat_for_mult_88, mat_for_mult_88, mat_for_mult_88, 
        mat_for_mult_88, mat_for_mult_88, mat_for_mult_88, mat_for_mult_88, 
        1'b0, 1'b0, 1'b0, 1'b0, n14, n14, n14, n14, 1'b0, 1'b0, 1'b0, 1'b0, 
        n14, n14, n14, n14, 1'b0, 1'b0, 1'b0, mat_for_mult_88, mat_for_mult_88, 
        mat_for_mult_88, mat_for_mult_88, 1'b0, 1'b0, 1'b0, n13, n13, n13, 
        1'b0, n14, n14, 1'b0, 1'b0, n14, n14, 1'b0, 1'b0, n14, n14, 1'b0, 1'b0, 
        n14, n14, 1'b0, mat_for_mult_88, mat_for_mult_88, 1'b0, 1'b0, 
        mat_for_mult_88, mat_for_mult_88, 1'b0, n13, n13, 1'b0, n13, n14, 1'b0, 
        n14, 1'b0, n14, 1'b0, n14, 1'b0, n14, 1'b0, n14, 1'b0, n14, 1'b0, n14, 
        mat_for_mult_88, 1'b0, mat_for_mult_88, 1'b0, mat_for_mult_88, 1'b0, 
        mat_for_mult_88, n13, 1'b0, n13, n13}), .B_data_in(data_in), 
        .C_data_out(parity_bits) );
  DFFRHQX1 \data_out_reg[4]  ( .D(final_temp[4]), .CK(n2), .RN(n6), .Q(
        data_out[4]) );
  DFFRHQX1 \data_out_reg[15]  ( .D(final_temp[15]), .CK(n3), .RN(n7), .Q(
        data_out[15]) );
  DFFRHQX1 \data_out_reg[14]  ( .D(final_temp[14]), .CK(n3), .RN(n7), .Q(
        data_out[14]) );
  DFFRHQX1 \data_out_reg[13]  ( .D(final_temp[13]), .CK(n4), .RN(n8), .Q(
        data_out[13]) );
  DFFRHQX1 \data_out_reg[12]  ( .D(final_temp[12]), .CK(n4), .RN(n8), .Q(
        data_out[12]) );
  DFFRHQX1 \data_out_reg[11]  ( .D(final_temp[11]), .CK(n4), .RN(n8), .Q(
        data_out[11]) );
  DFFRHQX1 \data_out_reg[10]  ( .D(final_temp[10]), .CK(n4), .RN(n8), .Q(
        data_out[10]) );
  DFFRHQX1 \data_out_reg[9]  ( .D(final_temp[9]), .CK(n4), .RN(n8), .Q(
        data_out[9]) );
  DFFRHQX1 \data_out_reg[8]  ( .D(final_temp[8]), .CK(n4), .RN(n8), .Q(
        data_out[8]) );
  DFFRHQX1 \data_out_reg[5]  ( .D(final_temp[5]), .CK(n2), .RN(n6), .Q(
        data_out[5]) );
  DFFRHQX1 \data_out_reg[31]  ( .D(final_temp[31]), .CK(n2), .RN(n6), .Q(
        data_out[31]) );
  DFFRHQX1 \data_out_reg[30]  ( .D(final_temp[30]), .CK(n2), .RN(n6), .Q(
        data_out[30]) );
  DFFRHQX1 \data_out_reg[29]  ( .D(final_temp[29]), .CK(n2), .RN(n6), .Q(
        data_out[29]) );
  DFFRHQX1 \data_out_reg[28]  ( .D(final_temp[28]), .CK(n2), .RN(n6), .Q(
        data_out[28]) );
  DFFRHQX1 \data_out_reg[27]  ( .D(final_temp[27]), .CK(n2), .RN(n6), .Q(
        data_out[27]) );
  DFFRHQX1 \data_out_reg[26]  ( .D(final_temp[26]), .CK(n2), .RN(n6), .Q(
        data_out[26]) );
  DFFRHQX1 \data_out_reg[25]  ( .D(final_temp[25]), .CK(n3), .RN(n7), .Q(
        data_out[25]) );
  DFFRHQX1 \data_out_reg[24]  ( .D(final_temp[24]), .CK(n3), .RN(n7), .Q(
        data_out[24]) );
  DFFRHQX1 \data_out_reg[23]  ( .D(final_temp[23]), .CK(n3), .RN(n7), .Q(
        data_out[23]) );
  DFFRHQX1 \data_out_reg[22]  ( .D(final_temp[22]), .CK(n3), .RN(n7), .Q(
        data_out[22]) );
  DFFRHQX1 \data_out_reg[21]  ( .D(final_temp[21]), .CK(n3), .RN(n7), .Q(
        data_out[21]) );
  DFFRHQX1 \data_out_reg[20]  ( .D(final_temp[20]), .CK(n3), .RN(n7), .Q(
        data_out[20]) );
  DFFRHQX1 \data_out_reg[19]  ( .D(final_temp[19]), .CK(n3), .RN(n7), .Q(
        data_out[19]) );
  DFFRHQX1 \data_out_reg[18]  ( .D(final_temp[18]), .CK(n3), .RN(n7), .Q(
        data_out[18]) );
  DFFRHQX1 \data_out_reg[17]  ( .D(final_temp[17]), .CK(n3), .RN(n7), .Q(
        data_out[17]) );
  DFFRHQX1 \data_out_reg[16]  ( .D(final_temp[16]), .CK(n3), .RN(n7), .Q(
        data_out[16]) );
  DFFRHQX1 \data_out_reg[7]  ( .D(final_temp[7]), .CK(n4), .RN(n8), .Q(
        data_out[7]) );
  DFFRHQX1 \data_out_reg[6]  ( .D(final_temp[6]), .CK(n4), .RN(n8), .Q(
        data_out[6]) );
  DFFRHQX1 \data_out_reg[2]  ( .D(final_temp[2]), .CK(n2), .RN(n6), .Q(
        data_out[2]) );
  DFFRHQX1 \data_out_reg[1]  ( .D(final_temp[1]), .CK(n2), .RN(n6), .Q(
        data_out[1]) );
  DFFRHQX1 \data_out_reg[0]  ( .D(final_temp[0]), .CK(n2), .RN(n6), .Q(
        data_out[0]) );
  DFFRHQX1 \data_out_reg[3]  ( .D(final_temp[3]), .CK(n2), .RN(n6), .Q(
        data_out[3]) );
  OAI222XL U3 ( .A0(n12), .A1(n18), .B0(n16), .B1(n17), .C0(n1), .C1(n19), .Y(
        final_temp[6]) );
  OAI222XL U4 ( .A0(n12), .A1(n16), .B0(n11), .B1(n17), .C0(n1), .C1(n18), .Y(
        final_temp[7]) );
  OAI222XL U5 ( .A0(n12), .A1(n19), .B0(n17), .B1(n18), .C0(n1), .C1(n20), .Y(
        final_temp[5]) );
  NOR2XL U6 ( .A(work_mod[1]), .B(work_mod[0]), .Y(n23) );
  NAND3BX2 U7 ( .AN(work_mod[1]), .B(n21), .C(work_mod[0]), .Y(n12) );
  XOR2XL U8 ( .A(work_mod[0]), .B(work_mod[1]), .Y(n22) );
  INVX4 U9 ( .A(n30), .Y(n13) );
  AND2X4 U10 ( .A(n21), .B(n22), .Y(mat_for_mult_88) );
  CLKBUFX8 U11 ( .A(n10), .Y(n1) );
  INVX12 U12 ( .A(n1), .Y(n14) );
  NOR2BXL U13 ( .AN(data_in[25]), .B(n1), .Y(final_temp[31]) );
  NOR2BXL U14 ( .AN(data_in[24]), .B(n1), .Y(final_temp[30]) );
  NOR2BXL U15 ( .AN(data_in[23]), .B(n1), .Y(final_temp[29]) );
  NOR2BXL U16 ( .AN(data_in[22]), .B(n1), .Y(final_temp[28]) );
  NOR2BXL U17 ( .AN(data_in[21]), .B(n1), .Y(final_temp[27]) );
  NOR2BXL U18 ( .AN(data_in[20]), .B(n1), .Y(final_temp[26]) );
  NOR2BXL U19 ( .AN(data_in[19]), .B(n1), .Y(final_temp[25]) );
  NOR2BXL U20 ( .AN(data_in[18]), .B(n1), .Y(final_temp[24]) );
  NOR2BXL U21 ( .AN(data_in[17]), .B(n1), .Y(final_temp[23]) );
  NOR2BXL U22 ( .AN(data_in[16]), .B(n1), .Y(final_temp[22]) );
  NOR2BXL U23 ( .AN(data_in[15]), .B(n1), .Y(final_temp[21]) );
  NOR2BXL U24 ( .AN(data_in[14]), .B(n1), .Y(final_temp[20]) );
  NOR2BXL U25 ( .AN(data_in[13]), .B(n1), .Y(final_temp[19]) );
  NOR2BXL U26 ( .AN(data_in[12]), .B(n1), .Y(final_temp[18]) );
  NOR2BXL U27 ( .AN(data_in[11]), .B(n1), .Y(final_temp[17]) );
  NOR2XL U28 ( .A(n1), .B(n24), .Y(final_temp[16]) );
  OAI22XL U29 ( .A0(n1), .A1(n11), .B0(n12), .B1(n15), .Y(final_temp[9]) );
  OAI22XL U30 ( .A0(n1), .A1(n16), .B0(n12), .B1(n11), .Y(final_temp[8]) );
  OAI22XL U31 ( .A0(n1), .A1(n25), .B0(n12), .B1(n24), .Y(final_temp[15]) );
  OAI22XL U32 ( .A0(n1), .A1(n26), .B0(n12), .B1(n25), .Y(final_temp[14]) );
  OAI22XL U33 ( .A0(n1), .A1(n27), .B0(n12), .B1(n26), .Y(final_temp[13]) );
  OAI22XL U34 ( .A0(n1), .A1(n28), .B0(n12), .B1(n27), .Y(final_temp[12]) );
  OAI22XL U35 ( .A0(n1), .A1(n29), .B0(n12), .B1(n28), .Y(final_temp[11]) );
  OAI22XL U36 ( .A0(n15), .A1(n1), .B0(n12), .B1(n29), .Y(final_temp[10]) );
  NAND3BXL U37 ( .AN(work_mod[0]), .B(n21), .C(work_mod[1]), .Y(n10) );
  CLKINVX3 U38 ( .A(n9), .Y(n7) );
  CLKINVX3 U39 ( .A(n5), .Y(n3) );
  CLKINVX3 U40 ( .A(n9), .Y(n8) );
  CLKINVX3 U41 ( .A(n5), .Y(n4) );
  CLKINVX3 U42 ( .A(n9), .Y(n6) );
  INVX1 U43 ( .A(rst), .Y(n9) );
  CLKINVX3 U44 ( .A(n5), .Y(n2) );
  INVX1 U45 ( .A(clk), .Y(n5) );
  INVX1 U46 ( .A(data_in[3]), .Y(n11) );
  INVX1 U47 ( .A(data_in[2]), .Y(n16) );
  INVX1 U48 ( .A(parity_bits[5]), .Y(n20) );
  INVX1 U49 ( .A(data_in[1]), .Y(n18) );
  OAI2BB2X1 U50 ( .B0(n17), .B1(n19), .A0N(parity_bits[4]), .A1N(
        mat_for_mult_88), .Y(final_temp[4]) );
  INVX1 U51 ( .A(data_in[0]), .Y(n19) );
  NAND2X1 U52 ( .A(n23), .B(n21), .Y(n17) );
  AND2X1 U53 ( .A(parity_bits[3]), .B(n13), .Y(final_temp[3]) );
  AND2X1 U54 ( .A(parity_bits[2]), .B(n13), .Y(final_temp[2]) );
  AND2X1 U55 ( .A(parity_bits[1]), .B(n13), .Y(final_temp[1]) );
  INVX1 U56 ( .A(data_in[10]), .Y(n24) );
  INVX1 U57 ( .A(data_in[9]), .Y(n25) );
  INVX1 U58 ( .A(data_in[8]), .Y(n26) );
  INVX1 U59 ( .A(data_in[7]), .Y(n27) );
  INVX1 U60 ( .A(data_in[6]), .Y(n28) );
  INVX1 U61 ( .A(data_in[5]), .Y(n29) );
  INVX1 U62 ( .A(data_in[4]), .Y(n15) );
  AND2X1 U63 ( .A(parity_bits[0]), .B(n13), .Y(final_temp[0]) );
  OAI21XL U64 ( .A0(n23), .A1(n22), .B0(n21), .Y(n30) );
  AND4X1 U65 ( .A(n31), .B(n32), .C(n33), .D(n34), .Y(n21) );
  AND4X1 U66 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n34) );
  NOR4X1 U67 ( .A(work_mod[9]), .B(work_mod[8]), .C(work_mod[7]), .D(
        work_mod[6]), .Y(n38) );
  NOR4X1 U68 ( .A(work_mod[5]), .B(work_mod[4]), .C(work_mod[3]), .D(
        work_mod[31]), .Y(n37) );
  NOR4X1 U69 ( .A(work_mod[30]), .B(work_mod[2]), .C(work_mod[29]), .D(
        work_mod[28]), .Y(n36) );
  NOR3X1 U70 ( .A(work_mod[25]), .B(work_mod[27]), .C(work_mod[26]), .Y(n35)
         );
  NOR4BX1 U71 ( .AN(n39), .B(work_mod[12]), .C(work_mod[10]), .D(work_mod[11]), 
        .Y(n33) );
  NOR4X1 U72 ( .A(work_mod[16]), .B(work_mod[15]), .C(work_mod[14]), .D(
        work_mod[13]), .Y(n39) );
  NOR4X1 U73 ( .A(work_mod[24]), .B(work_mod[23]), .C(work_mod[22]), .D(
        work_mod[21]), .Y(n32) );
  NOR4X1 U74 ( .A(work_mod[20]), .B(work_mod[19]), .C(work_mod[18]), .D(
        work_mod[17]), .Y(n31) );
endmodule


module MAT_MULT_A_ROWS1_A_COLS32_B_COLS1 ( A_data_in, B_data_in, C_data_out );
  input [31:0] A_data_in;
  input [31:0] B_data_in;
  output [0:0] C_data_out;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62;

  XOR2X1 U1 ( .A(n1), .B(n2), .Y(C_data_out[0]) );
  XOR2X1 U2 ( .A(n3), .B(n4), .Y(n2) );
  XOR2X1 U3 ( .A(n5), .B(n6), .Y(n4) );
  XOR2X1 U4 ( .A(n7), .B(n8), .Y(n6) );
  XOR2X1 U5 ( .A(n9), .B(n10), .Y(n8) );
  NAND2X1 U6 ( .A(B_data_in[8]), .B(A_data_in[8]), .Y(n10) );
  NAND2X1 U7 ( .A(B_data_in[5]), .B(A_data_in[5]), .Y(n9) );
  XOR2X1 U8 ( .A(n11), .B(n12), .Y(n7) );
  NAND2X1 U9 ( .A(B_data_in[4]), .B(A_data_in[4]), .Y(n12) );
  NAND2X1 U10 ( .A(B_data_in[3]), .B(A_data_in[3]), .Y(n11) );
  XOR2X1 U11 ( .A(n13), .B(n14), .Y(n5) );
  XOR2X1 U12 ( .A(n15), .B(n16), .Y(n14) );
  NAND2X1 U13 ( .A(B_data_in[6]), .B(A_data_in[6]), .Y(n16) );
  NAND2X1 U14 ( .A(B_data_in[9]), .B(A_data_in[9]), .Y(n15) );
  XOR2X1 U15 ( .A(n17), .B(n18), .Y(n13) );
  XOR2X1 U16 ( .A(n19), .B(n20), .Y(n18) );
  XOR2X1 U17 ( .A(n21), .B(n22), .Y(n20) );
  XOR2X1 U18 ( .A(n23), .B(n24), .Y(n22) );
  XOR2X1 U19 ( .A(n25), .B(n26), .Y(n24) );
  XOR2X1 U20 ( .A(n27), .B(n28), .Y(n26) );
  XOR2X1 U21 ( .A(n29), .B(n30), .Y(n28) );
  NAND2X1 U22 ( .A(B_data_in[22]), .B(A_data_in[22]), .Y(n30) );
  NAND2X1 U23 ( .A(B_data_in[19]), .B(A_data_in[19]), .Y(n29) );
  XOR2X1 U24 ( .A(n31), .B(n32), .Y(n27) );
  NAND2X1 U25 ( .A(B_data_in[18]), .B(A_data_in[18]), .Y(n32) );
  NAND2X1 U26 ( .A(B_data_in[17]), .B(A_data_in[17]), .Y(n31) );
  XOR2X1 U27 ( .A(n33), .B(n34), .Y(n25) );
  XOR2X1 U28 ( .A(n35), .B(n36), .Y(n34) );
  NAND2X1 U29 ( .A(B_data_in[20]), .B(A_data_in[20]), .Y(n36) );
  NAND2X1 U30 ( .A(B_data_in[23]), .B(A_data_in[23]), .Y(n35) );
  XOR2X1 U31 ( .A(n37), .B(n38), .Y(n33) );
  XOR2X1 U32 ( .A(n39), .B(n40), .Y(n38) );
  XOR2X1 U33 ( .A(n41), .B(n42), .Y(n40) );
  XOR2X1 U34 ( .A(n43), .B(n44), .Y(n42) );
  NAND2X1 U35 ( .A(B_data_in[25]), .B(A_data_in[25]), .Y(n44) );
  NAND2X1 U36 ( .A(B_data_in[24]), .B(A_data_in[24]), .Y(n43) );
  XOR2X1 U37 ( .A(n45), .B(n46), .Y(n41) );
  NAND2X1 U38 ( .A(B_data_in[27]), .B(A_data_in[27]), .Y(n46) );
  NAND2X1 U39 ( .A(B_data_in[26]), .B(A_data_in[26]), .Y(n45) );
  XOR2X1 U40 ( .A(n47), .B(n48), .Y(n39) );
  XOR2X1 U41 ( .A(n49), .B(n50), .Y(n48) );
  NAND2X1 U42 ( .A(B_data_in[29]), .B(A_data_in[29]), .Y(n50) );
  NAND2X1 U43 ( .A(B_data_in[28]), .B(A_data_in[28]), .Y(n49) );
  XOR2X1 U44 ( .A(n51), .B(n52), .Y(n47) );
  NAND2X1 U45 ( .A(B_data_in[31]), .B(A_data_in[31]), .Y(n52) );
  NAND2X1 U46 ( .A(B_data_in[30]), .B(A_data_in[30]), .Y(n51) );
  NAND2X1 U47 ( .A(B_data_in[21]), .B(A_data_in[21]), .Y(n37) );
  NAND2X1 U48 ( .A(B_data_in[10]), .B(A_data_in[10]), .Y(n23) );
  XOR2X1 U49 ( .A(n53), .B(n54), .Y(n21) );
  NAND2X1 U50 ( .A(B_data_in[12]), .B(A_data_in[12]), .Y(n54) );
  NAND2X1 U51 ( .A(B_data_in[11]), .B(A_data_in[11]), .Y(n53) );
  XOR2X1 U52 ( .A(n55), .B(n56), .Y(n19) );
  XOR2X1 U53 ( .A(n57), .B(n58), .Y(n56) );
  NAND2X1 U54 ( .A(B_data_in[14]), .B(A_data_in[14]), .Y(n58) );
  NAND2X1 U55 ( .A(B_data_in[13]), .B(A_data_in[13]), .Y(n57) );
  XOR2X1 U56 ( .A(n59), .B(n60), .Y(n55) );
  NAND2X1 U57 ( .A(B_data_in[16]), .B(A_data_in[16]), .Y(n60) );
  NAND2X1 U58 ( .A(B_data_in[15]), .B(A_data_in[15]), .Y(n59) );
  NAND2X1 U59 ( .A(B_data_in[7]), .B(A_data_in[7]), .Y(n17) );
  NAND2X1 U60 ( .A(B_data_in[0]), .B(A_data_in[0]), .Y(n3) );
  XOR2X1 U61 ( .A(n61), .B(n62), .Y(n1) );
  NAND2X1 U62 ( .A(B_data_in[2]), .B(A_data_in[2]), .Y(n62) );
  NAND2X1 U63 ( .A(B_data_in[1]), .B(A_data_in[1]), .Y(n61) );
endmodule


module ENC_STAGE_2_MAX_CODEWORD_WIDTH32_MAX_INFO_WIDTH26_AMBA_WORD32 ( clk, 
        rst, data_in, work_mod, data_out );
  input [31:0] data_in;
  input [31:0] work_mod;
  output [31:0] data_out;
  input clk, rst;
  wire   temp, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29;
  wire   [31:0] final_temp;

  MAT_MULT_A_ROWS1_A_COLS32_B_COLS1 m1 ( .A_data_in({1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1}), .B_data_in(data_in), .C_data_out(temp) );
  DFFRHQX1 \data_out_reg[25]  ( .D(final_temp[25]), .CK(n3), .RN(n7), .Q(
        data_out[25]) );
  DFFRHQX1 \data_out_reg[24]  ( .D(final_temp[24]), .CK(n3), .RN(n7), .Q(
        data_out[24]) );
  DFFRHQX1 \data_out_reg[23]  ( .D(final_temp[23]), .CK(n3), .RN(n7), .Q(
        data_out[23]) );
  DFFRHQX1 \data_out_reg[22]  ( .D(final_temp[22]), .CK(n3), .RN(n7), .Q(
        data_out[22]) );
  DFFRHQX1 \data_out_reg[21]  ( .D(final_temp[21]), .CK(n3), .RN(n7), .Q(
        data_out[21]) );
  DFFRHQX1 \data_out_reg[20]  ( .D(final_temp[20]), .CK(n3), .RN(n7), .Q(
        data_out[20]) );
  DFFRHQX1 \data_out_reg[19]  ( .D(final_temp[19]), .CK(n3), .RN(n7), .Q(
        data_out[19]) );
  DFFRHQX1 \data_out_reg[18]  ( .D(final_temp[18]), .CK(n3), .RN(n7), .Q(
        data_out[18]) );
  DFFRHQX1 \data_out_reg[17]  ( .D(final_temp[17]), .CK(n3), .RN(n7), .Q(
        data_out[17]) );
  DFFRHQX1 \data_out_reg[16]  ( .D(final_temp[16]), .CK(n3), .RN(n7), .Q(
        data_out[16]) );
  DFFRHQX1 \data_out_reg[15]  ( .D(final_temp[15]), .CK(n3), .RN(n7), .Q(
        data_out[15]) );
  DFFRHQX1 \data_out_reg[14]  ( .D(final_temp[14]), .CK(n3), .RN(n7), .Q(
        data_out[14]) );
  DFFRHQX1 \data_out_reg[13]  ( .D(final_temp[13]), .CK(n4), .RN(n8), .Q(
        data_out[13]) );
  DFFRHQX1 \data_out_reg[12]  ( .D(final_temp[12]), .CK(n4), .RN(n8), .Q(
        data_out[12]) );
  DFFRHQX1 \data_out_reg[11]  ( .D(final_temp[11]), .CK(n4), .RN(n8), .Q(
        data_out[11]) );
  DFFRHQX1 \data_out_reg[10]  ( .D(final_temp[10]), .CK(n4), .RN(n8), .Q(
        data_out[10]) );
  DFFRHQX1 \data_out_reg[9]  ( .D(final_temp[9]), .CK(n4), .RN(n8), .Q(
        data_out[9]) );
  DFFRHQX1 \data_out_reg[8]  ( .D(final_temp[8]), .CK(n4), .RN(n8), .Q(
        data_out[8]) );
  DFFRHQX1 \data_out_reg[7]  ( .D(final_temp[7]), .CK(n4), .RN(n8), .Q(
        data_out[7]) );
  DFFRHQX1 \data_out_reg[6]  ( .D(final_temp[6]), .CK(n4), .RN(n8), .Q(
        data_out[6]) );
  DFFRHQX1 \data_out_reg[5]  ( .D(final_temp[5]), .CK(n2), .RN(n6), .Q(
        data_out[5]) );
  DFFRHQX1 \data_out_reg[4]  ( .D(n1), .CK(n2), .RN(n6), .Q(data_out[4]) );
  DFFRHQX1 \data_out_reg[3]  ( .D(final_temp[3]), .CK(n2), .RN(n6), .Q(
        data_out[3]) );
  DFFRHQX1 \data_out_reg[2]  ( .D(final_temp[2]), .CK(n2), .RN(n6), .Q(
        data_out[2]) );
  DFFRHQX1 \data_out_reg[1]  ( .D(final_temp[1]), .CK(n2), .RN(n6), .Q(
        data_out[1]) );
  DFFRHQX1 \data_out_reg[0]  ( .D(final_temp[0]), .CK(n2), .RN(n6), .Q(
        data_out[0]) );
  DFFRHQX1 \data_out_reg[31]  ( .D(final_temp[31]), .CK(n2), .RN(n6), .Q(
        data_out[31]) );
  DFFRHQX1 \data_out_reg[30]  ( .D(final_temp[30]), .CK(n2), .RN(n6), .Q(
        data_out[30]) );
  DFFRHQX1 \data_out_reg[29]  ( .D(final_temp[29]), .CK(n2), .RN(n6), .Q(
        data_out[29]) );
  DFFRHQX1 \data_out_reg[28]  ( .D(final_temp[28]), .CK(n2), .RN(n6), .Q(
        data_out[28]) );
  DFFRHQX1 \data_out_reg[27]  ( .D(final_temp[27]), .CK(n2), .RN(n6), .Q(
        data_out[27]) );
  DFFRHQX1 \data_out_reg[26]  ( .D(final_temp[26]), .CK(n2), .RN(n6), .Q(
        data_out[26]) );
  INVX1 U3 ( .A(work_mod[0]), .Y(n19) );
  OAI31X1 U4 ( .A0(n17), .A1(work_mod[0]), .A2(n13), .B0(n18), .Y(
        final_temp[3]) );
  NAND3XL U5 ( .A(temp), .B(n12), .C(work_mod[0]), .Y(n11) );
  AOI2BB1X2 U6 ( .A0N(work_mod[0]), .A1N(n20), .B0(n12), .Y(n16) );
  OAI21X4 U7 ( .A0(n13), .A1(n19), .B0(n14), .Y(n15) );
  NAND3BX4 U8 ( .AN(n20), .B(n19), .C(work_mod[1]), .Y(n14) );
  CLKINVX3 U9 ( .A(n9), .Y(n7) );
  CLKINVX3 U10 ( .A(n5), .Y(n3) );
  CLKINVX3 U11 ( .A(n9), .Y(n8) );
  CLKINVX3 U12 ( .A(n5), .Y(n4) );
  CLKINVX3 U13 ( .A(n9), .Y(n6) );
  INVX1 U14 ( .A(rst), .Y(n9) );
  CLKINVX3 U15 ( .A(n5), .Y(n2) );
  INVX1 U16 ( .A(clk), .Y(n5) );
  OAI2BB1X1 U17 ( .A0N(data_in[4]), .A1N(n10), .B0(n11), .Y(n1) );
  OAI21XL U18 ( .A0(work_mod[0]), .A1(n13), .B0(n14), .Y(n10) );
  AND2X1 U19 ( .A(data_in[9]), .B(n15), .Y(final_temp[9]) );
  AND2X1 U20 ( .A(data_in[8]), .B(n15), .Y(final_temp[8]) );
  NOR2BX1 U21 ( .AN(data_in[7]), .B(n16), .Y(final_temp[7]) );
  NOR2BX1 U22 ( .AN(data_in[6]), .B(n16), .Y(final_temp[6]) );
  OAI2BB2X1 U23 ( .B0(n17), .B1(n14), .A0N(data_in[5]), .A1N(n12), .Y(
        final_temp[5]) );
  NAND2X1 U24 ( .A(data_in[3]), .B(n15), .Y(n18) );
  INVX1 U25 ( .A(temp), .Y(n17) );
  NOR2BX1 U26 ( .AN(data_in[31]), .B(n14), .Y(final_temp[31]) );
  NOR2BX1 U27 ( .AN(data_in[30]), .B(n14), .Y(final_temp[30]) );
  NOR2BX1 U28 ( .AN(data_in[2]), .B(n16), .Y(final_temp[2]) );
  NOR2BX1 U29 ( .AN(data_in[29]), .B(n14), .Y(final_temp[29]) );
  NOR2BX1 U30 ( .AN(data_in[28]), .B(n14), .Y(final_temp[28]) );
  NOR2BX1 U31 ( .AN(data_in[27]), .B(n14), .Y(final_temp[27]) );
  NOR2BX1 U32 ( .AN(data_in[26]), .B(n14), .Y(final_temp[26]) );
  NOR2BX1 U33 ( .AN(data_in[25]), .B(n14), .Y(final_temp[25]) );
  NOR2BX1 U34 ( .AN(data_in[24]), .B(n14), .Y(final_temp[24]) );
  NOR2BX1 U35 ( .AN(data_in[23]), .B(n14), .Y(final_temp[23]) );
  NOR2BX1 U36 ( .AN(data_in[22]), .B(n14), .Y(final_temp[22]) );
  NOR2BX1 U37 ( .AN(data_in[21]), .B(n14), .Y(final_temp[21]) );
  NOR2BX1 U38 ( .AN(data_in[20]), .B(n14), .Y(final_temp[20]) );
  NOR2BX1 U39 ( .AN(data_in[1]), .B(n16), .Y(final_temp[1]) );
  NOR2BX1 U40 ( .AN(data_in[19]), .B(n14), .Y(final_temp[19]) );
  NOR2BX1 U41 ( .AN(data_in[18]), .B(n14), .Y(final_temp[18]) );
  NOR2BX1 U42 ( .AN(data_in[17]), .B(n14), .Y(final_temp[17]) );
  NOR2BX1 U43 ( .AN(data_in[16]), .B(n14), .Y(final_temp[16]) );
  AND2X1 U44 ( .A(data_in[15]), .B(n15), .Y(final_temp[15]) );
  AND2X1 U45 ( .A(data_in[14]), .B(n15), .Y(final_temp[14]) );
  AND2X1 U46 ( .A(data_in[13]), .B(n15), .Y(final_temp[13]) );
  AND2X1 U47 ( .A(data_in[12]), .B(n15), .Y(final_temp[12]) );
  AND2X1 U48 ( .A(data_in[11]), .B(n15), .Y(final_temp[11]) );
  AND2X1 U49 ( .A(data_in[10]), .B(n15), .Y(final_temp[10]) );
  INVX1 U50 ( .A(n12), .Y(n13) );
  NOR2BX1 U51 ( .AN(data_in[0]), .B(n16), .Y(final_temp[0]) );
  NOR2X1 U52 ( .A(n20), .B(work_mod[1]), .Y(n12) );
  NAND4X1 U53 ( .A(n21), .B(n22), .C(n23), .D(n24), .Y(n20) );
  AND4X1 U54 ( .A(n25), .B(n26), .C(n27), .D(n28), .Y(n24) );
  NOR4X1 U55 ( .A(work_mod[9]), .B(work_mod[8]), .C(work_mod[7]), .D(
        work_mod[6]), .Y(n28) );
  NOR4X1 U56 ( .A(work_mod[5]), .B(work_mod[4]), .C(work_mod[3]), .D(
        work_mod[31]), .Y(n27) );
  NOR4X1 U57 ( .A(work_mod[30]), .B(work_mod[2]), .C(work_mod[29]), .D(
        work_mod[28]), .Y(n26) );
  NOR3X1 U58 ( .A(work_mod[25]), .B(work_mod[27]), .C(work_mod[26]), .Y(n25)
         );
  NOR4BX1 U59 ( .AN(n29), .B(work_mod[12]), .C(work_mod[10]), .D(work_mod[11]), 
        .Y(n23) );
  NOR4X1 U60 ( .A(work_mod[16]), .B(work_mod[15]), .C(work_mod[14]), .D(
        work_mod[13]), .Y(n29) );
  NOR4X1 U61 ( .A(work_mod[24]), .B(work_mod[23]), .C(work_mod[22]), .D(
        work_mod[21]), .Y(n22) );
  NOR4X1 U62 ( .A(work_mod[20]), .B(work_mod[19]), .C(work_mod[18]), .D(
        work_mod[17]), .Y(n21) );
endmodule


module ENC_AMBA_WORD32_MAX_CODEWORD_WIDTH32_MAX_INFO_WIDTH26 ( rst, clk, 
        data_in, work_mod, data_out );
  input [25:0] data_in;
  input [31:0] work_mod;
  output [31:0] data_out;
  input rst, clk;

  wire   [31:0] c_vector_stage1;

  ENC_STAGE_1_AMBA_WORD32_MAX_CODEWORD_WIDTH32_MAX_INFO_WIDTH26 stage1 ( .clk(
        clk), .rst(rst), .data_in(data_in), .work_mod(work_mod), .data_out(
        c_vector_stage1) );
  ENC_STAGE_2_MAX_CODEWORD_WIDTH32_MAX_INFO_WIDTH26_AMBA_WORD32 stage2 ( .clk(
        clk), .rst(rst), .data_in(c_vector_stage1), .work_mod(work_mod), 
        .data_out(data_out) );
endmodule


module MAT_MULT_A_ROWS6_A_COLS32_B_COLS1 ( A_data_in, B_data_in, C_data_out );
  input [191:0] A_data_in;
  input [31:0] B_data_in;
  output [5:0] C_data_out;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372;

  NAND2XL U1 ( .A(A_data_in[5]), .B(B_data_in[5]), .Y(n319) );
  NAND2XL U2 ( .A(A_data_in[70]), .B(B_data_in[6]), .Y(n202) );
  NAND2XL U3 ( .A(A_data_in[39]), .B(B_data_in[7]), .Y(n265) );
  NAND2XL U4 ( .A(A_data_in[4]), .B(B_data_in[4]), .Y(n322) );
  NAND2XL U5 ( .A(A_data_in[36]), .B(B_data_in[4]), .Y(n260) );
  NAND2XL U6 ( .A(A_data_in[69]), .B(B_data_in[5]), .Y(n195) );
  NAND2XL U7 ( .A(A_data_in[96]), .B(B_data_in[0]), .Y(n127) );
  NAND2XL U8 ( .A(A_data_in[97]), .B(B_data_in[1]), .Y(n185) );
  NAND2XL U9 ( .A(A_data_in[98]), .B(B_data_in[2]), .Y(n186) );
  NAND2XL U10 ( .A(A_data_in[6]), .B(B_data_in[6]), .Y(n326) );
  NAND2XL U11 ( .A(A_data_in[9]), .B(B_data_in[9]), .Y(n325) );
  NAND2XL U12 ( .A(A_data_in[40]), .B(B_data_in[8]), .Y(n258) );
  NAND2XL U13 ( .A(A_data_in[43]), .B(B_data_in[11]), .Y(n301) );
  NAND2XL U14 ( .A(A_data_in[47]), .B(B_data_in[15]), .Y(n307) );
  NAND2XL U15 ( .A(A_data_in[72]), .B(B_data_in[8]), .Y(n196) );
  NAND2XL U16 ( .A(A_data_in[8]), .B(B_data_in[8]), .Y(n320) );
  NAND2XL U17 ( .A(A_data_in[11]), .B(B_data_in[11]), .Y(n363) );
  NAND2XL U18 ( .A(A_data_in[13]), .B(B_data_in[13]), .Y(n367) );
  NAND2XL U19 ( .A(A_data_in[15]), .B(B_data_in[15]), .Y(n369) );
  NAND2XL U20 ( .A(A_data_in[37]), .B(B_data_in[5]), .Y(n257) );
  NAND2XL U21 ( .A(A_data_in[42]), .B(B_data_in[10]), .Y(n271) );
  XOR2X1 U22 ( .A(n1), .B(n2), .Y(C_data_out[5]) );
  XOR2X1 U23 ( .A(n3), .B(n4), .Y(n2) );
  XOR2X1 U24 ( .A(n5), .B(n6), .Y(n4) );
  XOR2X1 U25 ( .A(n7), .B(n8), .Y(n6) );
  XOR2X1 U26 ( .A(n9), .B(n10), .Y(n8) );
  NAND2X1 U27 ( .A(B_data_in[8]), .B(A_data_in[168]), .Y(n10) );
  NAND2X1 U28 ( .A(B_data_in[5]), .B(A_data_in[165]), .Y(n9) );
  XOR2X1 U29 ( .A(n11), .B(n12), .Y(n7) );
  NAND2X1 U30 ( .A(B_data_in[4]), .B(A_data_in[164]), .Y(n12) );
  NAND2X1 U31 ( .A(B_data_in[3]), .B(A_data_in[163]), .Y(n11) );
  XOR2X1 U32 ( .A(n13), .B(n14), .Y(n5) );
  XOR2X1 U33 ( .A(n15), .B(n16), .Y(n14) );
  NAND2X1 U34 ( .A(B_data_in[6]), .B(A_data_in[166]), .Y(n16) );
  NAND2X1 U35 ( .A(B_data_in[9]), .B(A_data_in[169]), .Y(n15) );
  XOR2X1 U36 ( .A(n17), .B(n18), .Y(n13) );
  XOR2X1 U37 ( .A(n19), .B(n20), .Y(n18) );
  XOR2X1 U38 ( .A(n21), .B(n22), .Y(n20) );
  XOR2X1 U39 ( .A(n23), .B(n24), .Y(n22) );
  XOR2X1 U40 ( .A(n25), .B(n26), .Y(n24) );
  XOR2X1 U41 ( .A(n27), .B(n28), .Y(n26) );
  XOR2X1 U42 ( .A(n29), .B(n30), .Y(n28) );
  NAND2X1 U43 ( .A(B_data_in[22]), .B(A_data_in[182]), .Y(n30) );
  NAND2X1 U44 ( .A(B_data_in[19]), .B(A_data_in[179]), .Y(n29) );
  XOR2X1 U45 ( .A(n31), .B(n32), .Y(n27) );
  NAND2X1 U46 ( .A(B_data_in[18]), .B(A_data_in[178]), .Y(n32) );
  NAND2X1 U47 ( .A(B_data_in[17]), .B(A_data_in[177]), .Y(n31) );
  XOR2X1 U48 ( .A(n33), .B(n34), .Y(n25) );
  XOR2X1 U49 ( .A(n35), .B(n36), .Y(n34) );
  NAND2X1 U50 ( .A(B_data_in[20]), .B(A_data_in[180]), .Y(n36) );
  NAND2X1 U51 ( .A(B_data_in[23]), .B(A_data_in[183]), .Y(n35) );
  XOR2X1 U52 ( .A(n37), .B(n38), .Y(n33) );
  XOR2X1 U53 ( .A(n39), .B(n40), .Y(n38) );
  XOR2X1 U54 ( .A(n41), .B(n42), .Y(n40) );
  XOR2X1 U55 ( .A(n43), .B(n44), .Y(n42) );
  NAND2X1 U56 ( .A(B_data_in[25]), .B(A_data_in[185]), .Y(n44) );
  NAND2X1 U57 ( .A(B_data_in[24]), .B(A_data_in[184]), .Y(n43) );
  XOR2X1 U58 ( .A(n45), .B(n46), .Y(n41) );
  NAND2X1 U59 ( .A(B_data_in[27]), .B(A_data_in[187]), .Y(n46) );
  NAND2X1 U60 ( .A(B_data_in[26]), .B(A_data_in[186]), .Y(n45) );
  XOR2X1 U61 ( .A(n47), .B(n48), .Y(n39) );
  XOR2X1 U62 ( .A(n49), .B(n50), .Y(n48) );
  NAND2X1 U63 ( .A(B_data_in[29]), .B(A_data_in[189]), .Y(n50) );
  NAND2X1 U64 ( .A(B_data_in[28]), .B(A_data_in[188]), .Y(n49) );
  XOR2X1 U65 ( .A(n51), .B(n52), .Y(n47) );
  NAND2X1 U66 ( .A(B_data_in[31]), .B(A_data_in[191]), .Y(n52) );
  NAND2X1 U67 ( .A(B_data_in[30]), .B(A_data_in[190]), .Y(n51) );
  NAND2X1 U68 ( .A(B_data_in[21]), .B(A_data_in[181]), .Y(n37) );
  NAND2X1 U69 ( .A(B_data_in[10]), .B(A_data_in[170]), .Y(n23) );
  XOR2X1 U70 ( .A(n53), .B(n54), .Y(n21) );
  NAND2X1 U71 ( .A(B_data_in[12]), .B(A_data_in[172]), .Y(n54) );
  NAND2X1 U72 ( .A(B_data_in[11]), .B(A_data_in[171]), .Y(n53) );
  XOR2X1 U73 ( .A(n55), .B(n56), .Y(n19) );
  XOR2X1 U74 ( .A(n57), .B(n58), .Y(n56) );
  NAND2X1 U75 ( .A(B_data_in[14]), .B(A_data_in[174]), .Y(n58) );
  NAND2X1 U76 ( .A(B_data_in[13]), .B(A_data_in[173]), .Y(n57) );
  XOR2X1 U77 ( .A(n59), .B(n60), .Y(n55) );
  NAND2X1 U78 ( .A(B_data_in[16]), .B(A_data_in[176]), .Y(n60) );
  NAND2X1 U79 ( .A(B_data_in[15]), .B(A_data_in[175]), .Y(n59) );
  NAND2X1 U80 ( .A(B_data_in[7]), .B(A_data_in[167]), .Y(n17) );
  NAND2X1 U81 ( .A(B_data_in[0]), .B(A_data_in[160]), .Y(n3) );
  XOR2X1 U82 ( .A(n61), .B(n62), .Y(n1) );
  NAND2X1 U83 ( .A(B_data_in[2]), .B(A_data_in[162]), .Y(n62) );
  NAND2X1 U84 ( .A(B_data_in[1]), .B(A_data_in[161]), .Y(n61) );
  XOR2X1 U85 ( .A(n63), .B(n64), .Y(C_data_out[4]) );
  XOR2X1 U86 ( .A(n65), .B(n66), .Y(n64) );
  XOR2X1 U87 ( .A(n67), .B(n68), .Y(n66) );
  XOR2X1 U88 ( .A(n69), .B(n70), .Y(n68) );
  XOR2X1 U89 ( .A(n71), .B(n72), .Y(n70) );
  NAND2X1 U90 ( .A(A_data_in[136]), .B(B_data_in[8]), .Y(n72) );
  NAND2X1 U91 ( .A(A_data_in[133]), .B(B_data_in[5]), .Y(n71) );
  XOR2X1 U92 ( .A(n73), .B(n74), .Y(n69) );
  NAND2X1 U93 ( .A(A_data_in[132]), .B(B_data_in[4]), .Y(n74) );
  NAND2X1 U94 ( .A(A_data_in[131]), .B(B_data_in[3]), .Y(n73) );
  XOR2X1 U95 ( .A(n75), .B(n76), .Y(n67) );
  XOR2X1 U96 ( .A(n77), .B(n78), .Y(n76) );
  NAND2X1 U97 ( .A(A_data_in[134]), .B(B_data_in[6]), .Y(n78) );
  NAND2X1 U98 ( .A(A_data_in[137]), .B(B_data_in[9]), .Y(n77) );
  XOR2X1 U99 ( .A(n79), .B(n80), .Y(n75) );
  XOR2X1 U100 ( .A(n81), .B(n82), .Y(n80) );
  XOR2X1 U101 ( .A(n83), .B(n84), .Y(n82) );
  XOR2X1 U102 ( .A(n85), .B(n86), .Y(n84) );
  XOR2X1 U103 ( .A(n87), .B(n88), .Y(n86) );
  XOR2X1 U104 ( .A(n89), .B(n90), .Y(n88) );
  XOR2X1 U105 ( .A(n91), .B(n92), .Y(n90) );
  NAND2X1 U106 ( .A(A_data_in[150]), .B(B_data_in[22]), .Y(n92) );
  NAND2X1 U107 ( .A(A_data_in[147]), .B(B_data_in[19]), .Y(n91) );
  XOR2X1 U108 ( .A(n93), .B(n94), .Y(n89) );
  NAND2X1 U109 ( .A(A_data_in[146]), .B(B_data_in[18]), .Y(n94) );
  NAND2X1 U110 ( .A(A_data_in[145]), .B(B_data_in[17]), .Y(n93) );
  XOR2X1 U111 ( .A(n95), .B(n96), .Y(n87) );
  XOR2X1 U112 ( .A(n97), .B(n98), .Y(n96) );
  NAND2X1 U113 ( .A(A_data_in[148]), .B(B_data_in[20]), .Y(n98) );
  NAND2X1 U114 ( .A(A_data_in[151]), .B(B_data_in[23]), .Y(n97) );
  XOR2X1 U115 ( .A(n99), .B(n100), .Y(n95) );
  XOR2X1 U116 ( .A(n101), .B(n102), .Y(n100) );
  XOR2X1 U117 ( .A(n103), .B(n104), .Y(n102) );
  XOR2X1 U118 ( .A(n105), .B(n106), .Y(n104) );
  NAND2X1 U119 ( .A(A_data_in[153]), .B(B_data_in[25]), .Y(n106) );
  NAND2X1 U120 ( .A(A_data_in[152]), .B(B_data_in[24]), .Y(n105) );
  XOR2X1 U121 ( .A(n107), .B(n108), .Y(n103) );
  NAND2X1 U122 ( .A(A_data_in[155]), .B(B_data_in[27]), .Y(n108) );
  NAND2X1 U123 ( .A(A_data_in[154]), .B(B_data_in[26]), .Y(n107) );
  XOR2X1 U124 ( .A(n109), .B(n110), .Y(n101) );
  XOR2X1 U125 ( .A(n111), .B(n112), .Y(n110) );
  NAND2X1 U126 ( .A(A_data_in[157]), .B(B_data_in[29]), .Y(n112) );
  NAND2X1 U127 ( .A(A_data_in[156]), .B(B_data_in[28]), .Y(n111) );
  XOR2X1 U128 ( .A(n113), .B(n114), .Y(n109) );
  NAND2X1 U129 ( .A(A_data_in[159]), .B(B_data_in[31]), .Y(n114) );
  NAND2X1 U130 ( .A(A_data_in[158]), .B(B_data_in[30]), .Y(n113) );
  NAND2X1 U131 ( .A(A_data_in[149]), .B(B_data_in[21]), .Y(n99) );
  NAND2X1 U132 ( .A(A_data_in[138]), .B(B_data_in[10]), .Y(n85) );
  XOR2X1 U133 ( .A(n115), .B(n116), .Y(n83) );
  NAND2X1 U134 ( .A(A_data_in[140]), .B(B_data_in[12]), .Y(n116) );
  NAND2X1 U135 ( .A(A_data_in[139]), .B(B_data_in[11]), .Y(n115) );
  XOR2X1 U136 ( .A(n117), .B(n118), .Y(n81) );
  XOR2X1 U137 ( .A(n119), .B(n120), .Y(n118) );
  NAND2X1 U138 ( .A(A_data_in[142]), .B(B_data_in[14]), .Y(n120) );
  NAND2X1 U139 ( .A(A_data_in[141]), .B(B_data_in[13]), .Y(n119) );
  XOR2X1 U140 ( .A(n121), .B(n122), .Y(n117) );
  NAND2X1 U141 ( .A(A_data_in[144]), .B(B_data_in[16]), .Y(n122) );
  NAND2X1 U142 ( .A(A_data_in[143]), .B(B_data_in[15]), .Y(n121) );
  NAND2X1 U143 ( .A(A_data_in[135]), .B(B_data_in[7]), .Y(n79) );
  NAND2X1 U144 ( .A(A_data_in[128]), .B(B_data_in[0]), .Y(n65) );
  XOR2X1 U145 ( .A(n123), .B(n124), .Y(n63) );
  NAND2X1 U146 ( .A(A_data_in[130]), .B(B_data_in[2]), .Y(n124) );
  NAND2X1 U147 ( .A(A_data_in[129]), .B(B_data_in[1]), .Y(n123) );
  XOR2X1 U148 ( .A(n125), .B(n126), .Y(C_data_out[3]) );
  XOR2X1 U149 ( .A(n127), .B(n128), .Y(n126) );
  XOR2X1 U150 ( .A(n129), .B(n130), .Y(n128) );
  XOR2X1 U151 ( .A(n131), .B(n132), .Y(n130) );
  XOR2X1 U152 ( .A(n133), .B(n134), .Y(n132) );
  NAND2X1 U153 ( .A(A_data_in[104]), .B(B_data_in[8]), .Y(n134) );
  NAND2X1 U154 ( .A(A_data_in[101]), .B(B_data_in[5]), .Y(n133) );
  XOR2X1 U155 ( .A(n135), .B(n136), .Y(n131) );
  NAND2X1 U156 ( .A(A_data_in[100]), .B(B_data_in[4]), .Y(n136) );
  NAND2X1 U157 ( .A(A_data_in[99]), .B(B_data_in[3]), .Y(n135) );
  XOR2X1 U158 ( .A(n137), .B(n138), .Y(n129) );
  XOR2X1 U159 ( .A(n139), .B(n140), .Y(n138) );
  NAND2X1 U160 ( .A(A_data_in[102]), .B(B_data_in[6]), .Y(n140) );
  NAND2X1 U161 ( .A(A_data_in[105]), .B(B_data_in[9]), .Y(n139) );
  XOR2X1 U162 ( .A(n141), .B(n142), .Y(n137) );
  XOR2X1 U163 ( .A(n143), .B(n144), .Y(n142) );
  XOR2X1 U164 ( .A(n145), .B(n146), .Y(n144) );
  XOR2X1 U165 ( .A(n147), .B(n148), .Y(n146) );
  XOR2X1 U166 ( .A(n149), .B(n150), .Y(n148) );
  XOR2X1 U167 ( .A(n151), .B(n152), .Y(n150) );
  XOR2X1 U168 ( .A(n153), .B(n154), .Y(n152) );
  NAND2X1 U169 ( .A(A_data_in[118]), .B(B_data_in[22]), .Y(n154) );
  NAND2X1 U170 ( .A(A_data_in[115]), .B(B_data_in[19]), .Y(n153) );
  XOR2X1 U171 ( .A(n155), .B(n156), .Y(n151) );
  NAND2X1 U172 ( .A(A_data_in[114]), .B(B_data_in[18]), .Y(n156) );
  NAND2X1 U173 ( .A(A_data_in[113]), .B(B_data_in[17]), .Y(n155) );
  XOR2X1 U174 ( .A(n157), .B(n158), .Y(n149) );
  XOR2X1 U175 ( .A(n159), .B(n160), .Y(n158) );
  NAND2X1 U176 ( .A(A_data_in[116]), .B(B_data_in[20]), .Y(n160) );
  NAND2X1 U177 ( .A(A_data_in[119]), .B(B_data_in[23]), .Y(n159) );
  XOR2X1 U178 ( .A(n161), .B(n162), .Y(n157) );
  XOR2X1 U179 ( .A(n163), .B(n164), .Y(n162) );
  XOR2X1 U180 ( .A(n165), .B(n166), .Y(n164) );
  XOR2X1 U181 ( .A(n167), .B(n168), .Y(n166) );
  NAND2X1 U182 ( .A(A_data_in[121]), .B(B_data_in[25]), .Y(n168) );
  NAND2X1 U183 ( .A(A_data_in[120]), .B(B_data_in[24]), .Y(n167) );
  XOR2X1 U184 ( .A(n169), .B(n170), .Y(n165) );
  NAND2X1 U185 ( .A(A_data_in[123]), .B(B_data_in[27]), .Y(n170) );
  NAND2X1 U186 ( .A(A_data_in[122]), .B(B_data_in[26]), .Y(n169) );
  XOR2X1 U187 ( .A(n171), .B(n172), .Y(n163) );
  XOR2X1 U188 ( .A(n173), .B(n174), .Y(n172) );
  NAND2X1 U189 ( .A(A_data_in[125]), .B(B_data_in[29]), .Y(n174) );
  NAND2X1 U190 ( .A(A_data_in[124]), .B(B_data_in[28]), .Y(n173) );
  XOR2X1 U191 ( .A(n175), .B(n176), .Y(n171) );
  NAND2X1 U192 ( .A(A_data_in[127]), .B(B_data_in[31]), .Y(n176) );
  NAND2X1 U193 ( .A(A_data_in[126]), .B(B_data_in[30]), .Y(n175) );
  NAND2X1 U194 ( .A(A_data_in[117]), .B(B_data_in[21]), .Y(n161) );
  NAND2X1 U195 ( .A(A_data_in[106]), .B(B_data_in[10]), .Y(n147) );
  XOR2X1 U196 ( .A(n177), .B(n178), .Y(n145) );
  NAND2X1 U197 ( .A(A_data_in[108]), .B(B_data_in[12]), .Y(n178) );
  NAND2X1 U198 ( .A(A_data_in[107]), .B(B_data_in[11]), .Y(n177) );
  XOR2X1 U199 ( .A(n179), .B(n180), .Y(n143) );
  XOR2X1 U200 ( .A(n181), .B(n182), .Y(n180) );
  NAND2X1 U201 ( .A(A_data_in[110]), .B(B_data_in[14]), .Y(n182) );
  NAND2X1 U202 ( .A(A_data_in[109]), .B(B_data_in[13]), .Y(n181) );
  XOR2X1 U203 ( .A(n183), .B(n184), .Y(n179) );
  NAND2X1 U204 ( .A(A_data_in[112]), .B(B_data_in[16]), .Y(n184) );
  NAND2X1 U205 ( .A(A_data_in[111]), .B(B_data_in[15]), .Y(n183) );
  NAND2X1 U206 ( .A(A_data_in[103]), .B(B_data_in[7]), .Y(n141) );
  XOR2X1 U207 ( .A(n185), .B(n186), .Y(n125) );
  XOR2X1 U208 ( .A(n187), .B(n188), .Y(C_data_out[2]) );
  XOR2X1 U209 ( .A(n189), .B(n190), .Y(n188) );
  XOR2X1 U210 ( .A(n191), .B(n192), .Y(n190) );
  XOR2X1 U211 ( .A(n193), .B(n194), .Y(n192) );
  XOR2X1 U212 ( .A(n195), .B(n196), .Y(n194) );
  XOR2X1 U213 ( .A(n197), .B(n198), .Y(n193) );
  NAND2X1 U214 ( .A(A_data_in[68]), .B(B_data_in[4]), .Y(n198) );
  NAND2X1 U215 ( .A(A_data_in[67]), .B(B_data_in[3]), .Y(n197) );
  XOR2X1 U216 ( .A(n199), .B(n200), .Y(n191) );
  XOR2X1 U217 ( .A(n201), .B(n202), .Y(n200) );
  NAND2X1 U218 ( .A(A_data_in[73]), .B(B_data_in[9]), .Y(n201) );
  XOR2X1 U219 ( .A(n203), .B(n204), .Y(n199) );
  XOR2X1 U220 ( .A(n205), .B(n206), .Y(n204) );
  XOR2X1 U221 ( .A(n207), .B(n208), .Y(n206) );
  XOR2X1 U222 ( .A(n209), .B(n210), .Y(n208) );
  XOR2X1 U223 ( .A(n211), .B(n212), .Y(n210) );
  XOR2X1 U224 ( .A(n213), .B(n214), .Y(n212) );
  XOR2X1 U225 ( .A(n215), .B(n216), .Y(n214) );
  NAND2X1 U226 ( .A(A_data_in[86]), .B(B_data_in[22]), .Y(n216) );
  NAND2X1 U227 ( .A(A_data_in[83]), .B(B_data_in[19]), .Y(n215) );
  XOR2X1 U228 ( .A(n217), .B(n218), .Y(n213) );
  NAND2X1 U229 ( .A(A_data_in[82]), .B(B_data_in[18]), .Y(n218) );
  NAND2X1 U230 ( .A(A_data_in[81]), .B(B_data_in[17]), .Y(n217) );
  XOR2X1 U231 ( .A(n219), .B(n220), .Y(n211) );
  XOR2X1 U232 ( .A(n221), .B(n222), .Y(n220) );
  NAND2X1 U233 ( .A(A_data_in[84]), .B(B_data_in[20]), .Y(n222) );
  NAND2X1 U234 ( .A(A_data_in[87]), .B(B_data_in[23]), .Y(n221) );
  XOR2X1 U235 ( .A(n223), .B(n224), .Y(n219) );
  XOR2X1 U236 ( .A(n225), .B(n226), .Y(n224) );
  XOR2X1 U237 ( .A(n227), .B(n228), .Y(n226) );
  XOR2X1 U238 ( .A(n229), .B(n230), .Y(n228) );
  NAND2X1 U239 ( .A(A_data_in[89]), .B(B_data_in[25]), .Y(n230) );
  NAND2X1 U240 ( .A(A_data_in[88]), .B(B_data_in[24]), .Y(n229) );
  XOR2X1 U241 ( .A(n231), .B(n232), .Y(n227) );
  NAND2X1 U242 ( .A(A_data_in[91]), .B(B_data_in[27]), .Y(n232) );
  NAND2X1 U243 ( .A(A_data_in[90]), .B(B_data_in[26]), .Y(n231) );
  XOR2X1 U244 ( .A(n233), .B(n234), .Y(n225) );
  XOR2X1 U245 ( .A(n235), .B(n236), .Y(n234) );
  NAND2X1 U246 ( .A(A_data_in[93]), .B(B_data_in[29]), .Y(n236) );
  NAND2X1 U247 ( .A(A_data_in[92]), .B(B_data_in[28]), .Y(n235) );
  XOR2X1 U248 ( .A(n237), .B(n238), .Y(n233) );
  NAND2X1 U249 ( .A(A_data_in[95]), .B(B_data_in[31]), .Y(n238) );
  NAND2X1 U250 ( .A(A_data_in[94]), .B(B_data_in[30]), .Y(n237) );
  NAND2X1 U251 ( .A(A_data_in[85]), .B(B_data_in[21]), .Y(n223) );
  NAND2X1 U252 ( .A(A_data_in[74]), .B(B_data_in[10]), .Y(n209) );
  XOR2X1 U253 ( .A(n239), .B(n240), .Y(n207) );
  NAND2X1 U254 ( .A(A_data_in[76]), .B(B_data_in[12]), .Y(n240) );
  NAND2X1 U255 ( .A(A_data_in[75]), .B(B_data_in[11]), .Y(n239) );
  XOR2X1 U256 ( .A(n241), .B(n242), .Y(n205) );
  XOR2X1 U257 ( .A(n243), .B(n244), .Y(n242) );
  NAND2X1 U258 ( .A(A_data_in[78]), .B(B_data_in[14]), .Y(n244) );
  NAND2X1 U259 ( .A(A_data_in[77]), .B(B_data_in[13]), .Y(n243) );
  XOR2X1 U260 ( .A(n245), .B(n246), .Y(n241) );
  NAND2X1 U261 ( .A(A_data_in[80]), .B(B_data_in[16]), .Y(n246) );
  NAND2X1 U262 ( .A(A_data_in[79]), .B(B_data_in[15]), .Y(n245) );
  NAND2X1 U263 ( .A(A_data_in[71]), .B(B_data_in[7]), .Y(n203) );
  NAND2X1 U264 ( .A(A_data_in[64]), .B(B_data_in[0]), .Y(n189) );
  XOR2X1 U265 ( .A(n247), .B(n248), .Y(n187) );
  NAND2X1 U266 ( .A(A_data_in[66]), .B(B_data_in[2]), .Y(n248) );
  NAND2X1 U267 ( .A(A_data_in[65]), .B(B_data_in[1]), .Y(n247) );
  XOR2X1 U268 ( .A(n249), .B(n250), .Y(C_data_out[1]) );
  XOR2X1 U269 ( .A(n251), .B(n252), .Y(n250) );
  XOR2X1 U270 ( .A(n253), .B(n254), .Y(n252) );
  XOR2X1 U271 ( .A(n255), .B(n256), .Y(n254) );
  XOR2X1 U272 ( .A(n257), .B(n258), .Y(n256) );
  XOR2X1 U273 ( .A(n259), .B(n260), .Y(n255) );
  NAND2X1 U274 ( .A(A_data_in[35]), .B(B_data_in[3]), .Y(n259) );
  XOR2X1 U275 ( .A(n261), .B(n262), .Y(n253) );
  XOR2X1 U276 ( .A(n263), .B(n264), .Y(n262) );
  NAND2X1 U277 ( .A(A_data_in[38]), .B(B_data_in[6]), .Y(n264) );
  NAND2X1 U278 ( .A(A_data_in[41]), .B(B_data_in[9]), .Y(n263) );
  XOR2X1 U279 ( .A(n265), .B(n266), .Y(n261) );
  XOR2X1 U280 ( .A(n267), .B(n268), .Y(n266) );
  XOR2X1 U281 ( .A(n269), .B(n270), .Y(n268) );
  XOR2X1 U282 ( .A(n271), .B(n272), .Y(n270) );
  XOR2X1 U283 ( .A(n273), .B(n274), .Y(n272) );
  XOR2X1 U284 ( .A(n275), .B(n276), .Y(n274) );
  XOR2X1 U285 ( .A(n277), .B(n278), .Y(n276) );
  NAND2X1 U286 ( .A(A_data_in[54]), .B(B_data_in[22]), .Y(n278) );
  NAND2X1 U287 ( .A(A_data_in[51]), .B(B_data_in[19]), .Y(n277) );
  XOR2X1 U288 ( .A(n279), .B(n280), .Y(n275) );
  NAND2X1 U289 ( .A(A_data_in[50]), .B(B_data_in[18]), .Y(n280) );
  NAND2X1 U290 ( .A(A_data_in[49]), .B(B_data_in[17]), .Y(n279) );
  XOR2X1 U291 ( .A(n281), .B(n282), .Y(n273) );
  XOR2X1 U292 ( .A(n283), .B(n284), .Y(n282) );
  NAND2X1 U293 ( .A(A_data_in[52]), .B(B_data_in[20]), .Y(n284) );
  NAND2X1 U294 ( .A(A_data_in[55]), .B(B_data_in[23]), .Y(n283) );
  XOR2X1 U295 ( .A(n285), .B(n286), .Y(n281) );
  XOR2X1 U296 ( .A(n287), .B(n288), .Y(n286) );
  XOR2X1 U297 ( .A(n289), .B(n290), .Y(n288) );
  XOR2X1 U298 ( .A(n291), .B(n292), .Y(n290) );
  NAND2X1 U299 ( .A(A_data_in[57]), .B(B_data_in[25]), .Y(n292) );
  NAND2X1 U300 ( .A(A_data_in[56]), .B(B_data_in[24]), .Y(n291) );
  XOR2X1 U301 ( .A(n293), .B(n294), .Y(n289) );
  NAND2X1 U302 ( .A(A_data_in[59]), .B(B_data_in[27]), .Y(n294) );
  NAND2X1 U303 ( .A(A_data_in[58]), .B(B_data_in[26]), .Y(n293) );
  XOR2X1 U304 ( .A(n295), .B(n296), .Y(n287) );
  XOR2X1 U305 ( .A(n297), .B(n298), .Y(n296) );
  NAND2X1 U306 ( .A(A_data_in[61]), .B(B_data_in[29]), .Y(n298) );
  NAND2X1 U307 ( .A(A_data_in[60]), .B(B_data_in[28]), .Y(n297) );
  XOR2X1 U308 ( .A(n299), .B(n300), .Y(n295) );
  NAND2X1 U309 ( .A(A_data_in[63]), .B(B_data_in[31]), .Y(n300) );
  NAND2X1 U310 ( .A(A_data_in[62]), .B(B_data_in[30]), .Y(n299) );
  NAND2X1 U311 ( .A(A_data_in[53]), .B(B_data_in[21]), .Y(n285) );
  XOR2X1 U312 ( .A(n301), .B(n302), .Y(n269) );
  NAND2X1 U313 ( .A(A_data_in[44]), .B(B_data_in[12]), .Y(n302) );
  XOR2X1 U314 ( .A(n303), .B(n304), .Y(n267) );
  XOR2X1 U315 ( .A(n305), .B(n306), .Y(n304) );
  NAND2X1 U316 ( .A(A_data_in[46]), .B(B_data_in[14]), .Y(n306) );
  NAND2X1 U317 ( .A(A_data_in[45]), .B(B_data_in[13]), .Y(n305) );
  XOR2X1 U318 ( .A(n307), .B(n308), .Y(n303) );
  NAND2X1 U319 ( .A(A_data_in[48]), .B(B_data_in[16]), .Y(n308) );
  NAND2X1 U320 ( .A(A_data_in[32]), .B(B_data_in[0]), .Y(n251) );
  XOR2X1 U321 ( .A(n309), .B(n310), .Y(n249) );
  NAND2X1 U322 ( .A(A_data_in[34]), .B(B_data_in[2]), .Y(n310) );
  NAND2X1 U323 ( .A(A_data_in[33]), .B(B_data_in[1]), .Y(n309) );
  XOR2X1 U324 ( .A(n311), .B(n312), .Y(C_data_out[0]) );
  XOR2X1 U325 ( .A(n313), .B(n314), .Y(n312) );
  XOR2X1 U326 ( .A(n315), .B(n316), .Y(n314) );
  XOR2X1 U327 ( .A(n317), .B(n318), .Y(n316) );
  XOR2X1 U328 ( .A(n319), .B(n320), .Y(n318) );
  XOR2X1 U329 ( .A(n321), .B(n322), .Y(n317) );
  NAND2X1 U330 ( .A(A_data_in[3]), .B(B_data_in[3]), .Y(n321) );
  XOR2X1 U331 ( .A(n323), .B(n324), .Y(n315) );
  XOR2X1 U332 ( .A(n325), .B(n326), .Y(n324) );
  XOR2X1 U333 ( .A(n327), .B(n328), .Y(n323) );
  XOR2X1 U334 ( .A(n329), .B(n330), .Y(n328) );
  XOR2X1 U335 ( .A(n331), .B(n332), .Y(n330) );
  XOR2X1 U336 ( .A(n333), .B(n334), .Y(n332) );
  XOR2X1 U337 ( .A(n335), .B(n336), .Y(n334) );
  XOR2X1 U338 ( .A(n337), .B(n338), .Y(n336) );
  XOR2X1 U339 ( .A(n339), .B(n340), .Y(n338) );
  NAND2X1 U340 ( .A(A_data_in[22]), .B(B_data_in[22]), .Y(n340) );
  NAND2X1 U341 ( .A(A_data_in[19]), .B(B_data_in[19]), .Y(n339) );
  XOR2X1 U342 ( .A(n341), .B(n342), .Y(n337) );
  NAND2X1 U343 ( .A(A_data_in[18]), .B(B_data_in[18]), .Y(n342) );
  NAND2X1 U344 ( .A(A_data_in[17]), .B(B_data_in[17]), .Y(n341) );
  XOR2X1 U345 ( .A(n343), .B(n344), .Y(n335) );
  XOR2X1 U346 ( .A(n345), .B(n346), .Y(n344) );
  NAND2X1 U347 ( .A(A_data_in[20]), .B(B_data_in[20]), .Y(n346) );
  NAND2X1 U348 ( .A(A_data_in[23]), .B(B_data_in[23]), .Y(n345) );
  XOR2X1 U349 ( .A(n347), .B(n348), .Y(n343) );
  XOR2X1 U350 ( .A(n349), .B(n350), .Y(n348) );
  XOR2X1 U351 ( .A(n351), .B(n352), .Y(n350) );
  XOR2X1 U352 ( .A(n353), .B(n354), .Y(n352) );
  NAND2X1 U353 ( .A(A_data_in[25]), .B(B_data_in[25]), .Y(n354) );
  NAND2X1 U354 ( .A(A_data_in[24]), .B(B_data_in[24]), .Y(n353) );
  XOR2X1 U355 ( .A(n355), .B(n356), .Y(n351) );
  NAND2X1 U356 ( .A(A_data_in[27]), .B(B_data_in[27]), .Y(n356) );
  NAND2X1 U357 ( .A(A_data_in[26]), .B(B_data_in[26]), .Y(n355) );
  XOR2X1 U358 ( .A(n357), .B(n358), .Y(n349) );
  XOR2X1 U359 ( .A(n359), .B(n360), .Y(n358) );
  NAND2X1 U360 ( .A(A_data_in[29]), .B(B_data_in[29]), .Y(n360) );
  NAND2X1 U361 ( .A(A_data_in[28]), .B(B_data_in[28]), .Y(n359) );
  XOR2X1 U362 ( .A(n361), .B(n362), .Y(n357) );
  NAND2X1 U363 ( .A(A_data_in[31]), .B(B_data_in[31]), .Y(n362) );
  NAND2X1 U364 ( .A(A_data_in[30]), .B(B_data_in[30]), .Y(n361) );
  NAND2X1 U365 ( .A(A_data_in[21]), .B(B_data_in[21]), .Y(n347) );
  NAND2X1 U366 ( .A(A_data_in[10]), .B(B_data_in[10]), .Y(n333) );
  XOR2X1 U367 ( .A(n363), .B(n364), .Y(n331) );
  NAND2X1 U368 ( .A(A_data_in[12]), .B(B_data_in[12]), .Y(n364) );
  XOR2X1 U369 ( .A(n365), .B(n366), .Y(n329) );
  XOR2X1 U370 ( .A(n367), .B(n368), .Y(n366) );
  NAND2X1 U371 ( .A(A_data_in[14]), .B(B_data_in[14]), .Y(n368) );
  XOR2X1 U372 ( .A(n369), .B(n370), .Y(n365) );
  NAND2X1 U373 ( .A(A_data_in[16]), .B(B_data_in[16]), .Y(n370) );
  NAND2X1 U374 ( .A(A_data_in[7]), .B(B_data_in[7]), .Y(n327) );
  NAND2X1 U375 ( .A(A_data_in[0]), .B(B_data_in[0]), .Y(n313) );
  XOR2X1 U376 ( .A(n371), .B(n372), .Y(n311) );
  NAND2X1 U377 ( .A(A_data_in[2]), .B(B_data_in[2]), .Y(n372) );
  NAND2X1 U378 ( .A(A_data_in[1]), .B(B_data_in[1]), .Y(n371) );
endmodule


module DEC_MULT_MAX_CODEWORD_WIDTH32_MAX_INFO_WIDTH26_AMBA_WORD32 ( rst, clk, 
        data_in, work_mod, data_out );
  input [31:0] data_in;
  input [31:0] work_mod;
  output [5:0] data_out;
  input rst, clk;
  wire   mat_for_mult_98, mat_for_mult_95, mat_for_mult_9, mat_for_mult_8,
         mat_for_mult_7, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19;
  wire   [5:0] mult_result;

  MAT_MULT_A_ROWS6_A_COLS32_B_COLS1 m1 ( .A_data_in({mat_for_mult_95, 
        mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, 
        mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, 
        mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, 
        mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, 
        mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, 
        mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, 
        mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, 
        mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, 
        mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, 
        mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, 
        mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, 
        mat_for_mult_95, mat_for_mult_95, 1'b0, mat_for_mult_8, mat_for_mult_8, 
        mat_for_mult_8, mat_for_mult_8, mat_for_mult_8, mat_for_mult_8, 
        mat_for_mult_8, mat_for_mult_8, mat_for_mult_8, mat_for_mult_8, 
        mat_for_mult_8, mat_for_mult_9, mat_for_mult_8, mat_for_mult_8, 
        mat_for_mult_8, mat_for_mult_8, mat_for_mult_95, mat_for_mult_95, 
        mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, 
        mat_for_mult_95, mat_for_mult_95, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, mat_for_mult_95, mat_for_mult_9, mat_for_mult_9, mat_for_mult_9, 
        mat_for_mult_9, mat_for_mult_9, mat_for_mult_9, mat_for_mult_8, 1'b0, 
        mat_for_mult_98, mat_for_mult_98, mat_for_mult_98, mat_for_mult_98, n1, 
        mat_for_mult_98, mat_for_mult_98, mat_for_mult_98, mat_for_mult_95, 
        mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, 1'b0, 1'b0, 1'b0, 
        1'b0, mat_for_mult_95, mat_for_mult_95, mat_for_mult_95, 
        mat_for_mult_95, 1'b0, 1'b0, 1'b0, mat_for_mult_95, mat_for_mult_9, 
        mat_for_mult_9, mat_for_mult_9, mat_for_mult_8, 1'b0, 1'b0, 
        mat_for_mult_95, mat_for_mult_9, n1, n2, mat_for_mult_98, 1'b0, 1'b0, 
        n1, 1'b0, 1'b0, mat_for_mult_95, mat_for_mult_95, 1'b0, 1'b0, 
        mat_for_mult_95, mat_for_mult_95, 1'b0, 1'b0, mat_for_mult_95, 
        mat_for_mult_95, 1'b0, 1'b0, mat_for_mult_95, mat_for_mult_95, 1'b0, 
        mat_for_mult_95, mat_for_mult_9, mat_for_mult_8, 1'b0, mat_for_mult_95, 
        mat_for_mult_9, mat_for_mult_8, mat_for_mult_95, mat_for_mult_9, n2, 
        mat_for_mult_7, mat_for_mult_8, mat_for_mult_98, 1'b0, 1'b0, n1, 1'b0, 
        mat_for_mult_95, 1'b0, mat_for_mult_95, 1'b0, mat_for_mult_95, 1'b0, 
        mat_for_mult_95, 1'b0, mat_for_mult_95, 1'b0, mat_for_mult_95, 1'b0, 
        mat_for_mult_95, 1'b0, mat_for_mult_95, mat_for_mult_95, 
        mat_for_mult_8, mat_for_mult_95, mat_for_mult_8, mat_for_mult_95, 
        mat_for_mult_8, mat_for_mult_95, mat_for_mult_9, mat_for_mult_8, 
        mat_for_mult_7, mat_for_mult_9, n2, mat_for_mult_98, 1'b0, 1'b0, 1'b0, 
        n1}), .B_data_in(data_in), .C_data_out(mult_result) );
  DFFRHQX1 \data_out_reg[3]  ( .D(mult_result[3]), .CK(n3), .RN(n5), .Q(
        data_out[3]) );
  DFFRHQX2 \data_out_reg[2]  ( .D(mult_result[2]), .CK(n3), .RN(n5), .Q(
        data_out[2]) );
  DFFRHQX2 \data_out_reg[1]  ( .D(mult_result[1]), .CK(n3), .RN(n5), .Q(
        data_out[1]) );
  DFFRHQX2 \data_out_reg[0]  ( .D(mult_result[0]), .CK(n3), .RN(n5), .Q(
        data_out[0]) );
  DFFRHQX2 \data_out_reg[4]  ( .D(mult_result[4]), .CK(n3), .RN(n5), .Q(
        data_out[4]) );
  DFFRHQX2 \data_out_reg[5]  ( .D(mult_result[5]), .CK(n3), .RN(n5), .Q(
        data_out[5]) );
  NOR2BX2 U3 ( .AN(n10), .B(work_mod[1]), .Y(n2) );
  INVX16 U4 ( .A(n8), .Y(mat_for_mult_95) );
  NAND2XL U5 ( .A(work_mod[0]), .B(n2), .Y(n9) );
  NOR2X4 U6 ( .A(work_mod[0]), .B(n7), .Y(mat_for_mult_98) );
  NAND2X4 U7 ( .A(n8), .B(n9), .Y(mat_for_mult_9) );
  INVX8 U8 ( .A(n9), .Y(mat_for_mult_8) );
  CLKINVX3 U9 ( .A(n6), .Y(n5) );
  INVX1 U10 ( .A(rst), .Y(n6) );
  CLKINVX3 U11 ( .A(n4), .Y(n3) );
  INVX1 U12 ( .A(clk), .Y(n4) );
  NAND2BX1 U13 ( .AN(mat_for_mult_7), .B(n7), .Y(n1) );
  INVX1 U14 ( .A(n2), .Y(n7) );
  NAND2X1 U15 ( .A(work_mod[1]), .B(mat_for_mult_7), .Y(n8) );
  NOR2BX1 U16 ( .AN(n10), .B(work_mod[0]), .Y(mat_for_mult_7) );
  AND4X1 U17 ( .A(n11), .B(n12), .C(n13), .D(n14), .Y(n10) );
  AND4X1 U18 ( .A(n15), .B(n16), .C(n17), .D(n18), .Y(n14) );
  NOR4X1 U19 ( .A(work_mod[9]), .B(work_mod[8]), .C(work_mod[7]), .D(
        work_mod[6]), .Y(n18) );
  NOR4X1 U20 ( .A(work_mod[5]), .B(work_mod[4]), .C(work_mod[3]), .D(
        work_mod[31]), .Y(n17) );
  NOR4X1 U21 ( .A(work_mod[30]), .B(work_mod[2]), .C(work_mod[29]), .D(
        work_mod[28]), .Y(n16) );
  NOR3X1 U22 ( .A(work_mod[25]), .B(work_mod[27]), .C(work_mod[26]), .Y(n15)
         );
  NOR4BX1 U23 ( .AN(n19), .B(work_mod[12]), .C(work_mod[10]), .D(work_mod[11]), 
        .Y(n13) );
  NOR4X1 U24 ( .A(work_mod[16]), .B(work_mod[15]), .C(work_mod[14]), .D(
        work_mod[13]), .Y(n19) );
  NOR4X1 U25 ( .A(work_mod[24]), .B(work_mod[23]), .C(work_mod[22]), .D(
        work_mod[21]), .Y(n12) );
  NOR4X1 U26 ( .A(work_mod[20]), .B(work_mod[19]), .C(work_mod[18]), .D(
        work_mod[17]), .Y(n11) );
endmodule


module DEC_CHK_MAX_CODEWORD_WIDTH32_MAX_INFO_WIDTH26_AMBA_WORD32 ( rst, clk, 
        data_in, s_vector, work_mod, data_out, num_of_errors );
  input [31:0] data_in;
  input [5:0] s_vector;
  input [31:0] work_mod;
  output [31:0] data_out;
  output [1:0] num_of_errors;
  input rst, clk;
  wire   N195, N196, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154;
  wire   [31:0] temp_out;

  DFFRHQX1 \data_out_reg[31]  ( .D(temp_out[31]), .CK(n1), .RN(rst), .Q(
        data_out[31]) );
  DFFRHQX1 \data_out_reg[30]  ( .D(temp_out[30]), .CK(n1), .RN(n4), .Q(
        data_out[30]) );
  DFFRHQX1 \data_out_reg[29]  ( .D(temp_out[29]), .CK(n2), .RN(rst), .Q(
        data_out[29]) );
  DFFRHQX1 \data_out_reg[28]  ( .D(temp_out[28]), .CK(n1), .RN(rst), .Q(
        data_out[28]) );
  DFFRHQX1 \data_out_reg[27]  ( .D(temp_out[27]), .CK(clk), .RN(rst), .Q(
        data_out[27]) );
  DFFRHQX1 \data_out_reg[26]  ( .D(temp_out[26]), .CK(n2), .RN(n4), .Q(
        data_out[26]) );
  DFFRHQX1 \data_out_reg[25]  ( .D(temp_out[25]), .CK(n2), .RN(n4), .Q(
        data_out[25]) );
  DFFRHQX1 \data_out_reg[24]  ( .D(temp_out[24]), .CK(n2), .RN(n4), .Q(
        data_out[24]) );
  DFFRHQX1 \data_out_reg[23]  ( .D(temp_out[23]), .CK(n1), .RN(rst), .Q(
        data_out[23]) );
  DFFRHQX1 \data_out_reg[22]  ( .D(temp_out[22]), .CK(n1), .RN(n4), .Q(
        data_out[22]) );
  DFFRHQX1 \data_out_reg[21]  ( .D(temp_out[21]), .CK(n2), .RN(rst), .Q(
        data_out[21]) );
  DFFRHQX1 \data_out_reg[20]  ( .D(temp_out[20]), .CK(n1), .RN(n4), .Q(
        data_out[20]) );
  DFFRHQX1 \data_out_reg[19]  ( .D(temp_out[19]), .CK(clk), .RN(rst), .Q(
        data_out[19]) );
  DFFRHQX1 \data_out_reg[18]  ( .D(temp_out[18]), .CK(n2), .RN(n4), .Q(
        data_out[18]) );
  DFFRHQX1 \data_out_reg[17]  ( .D(temp_out[17]), .CK(n2), .RN(n4), .Q(
        data_out[17]) );
  DFFRHQX1 \data_out_reg[16]  ( .D(temp_out[16]), .CK(clk), .RN(rst), .Q(
        data_out[16]) );
  DFFRHQX1 \data_out_reg[4]  ( .D(temp_out[4]), .CK(n2), .RN(n4), .Q(
        data_out[4]) );
  DFFRHQX1 \data_out_reg[3]  ( .D(temp_out[3]), .CK(n2), .RN(n4), .Q(
        data_out[3]) );
  DFFRHQX1 \data_out_reg[2]  ( .D(temp_out[2]), .CK(n1), .RN(rst), .Q(
        data_out[2]) );
  DFFRHQX1 \data_out_reg[1]  ( .D(temp_out[1]), .CK(n2), .RN(n4), .Q(
        data_out[1]) );
  DFFRHQX1 \data_out_reg[0]  ( .D(temp_out[0]), .CK(clk), .RN(rst), .Q(
        data_out[0]) );
  DFFRHQX1 \data_out_reg[8]  ( .D(temp_out[8]), .CK(n1), .RN(rst), .Q(
        data_out[8]) );
  DFFRHQX1 \data_out_reg[7]  ( .D(temp_out[7]), .CK(n1), .RN(rst), .Q(
        data_out[7]) );
  DFFRHQX1 \data_out_reg[6]  ( .D(temp_out[6]), .CK(n1), .RN(n4), .Q(
        data_out[6]) );
  DFFRHQX1 \data_out_reg[5]  ( .D(temp_out[5]), .CK(n2), .RN(n4), .Q(
        data_out[5]) );
  DFFRHQX1 \data_out_reg[9]  ( .D(temp_out[9]), .CK(clk), .RN(n4), .Q(
        data_out[9]) );
  DFFRHQX1 \data_out_reg[14]  ( .D(temp_out[14]), .CK(n1), .RN(rst), .Q(
        data_out[14]) );
  DFFRHQX1 \data_out_reg[13]  ( .D(temp_out[13]), .CK(n1), .RN(rst), .Q(
        data_out[13]) );
  DFFRHQX1 \data_out_reg[12]  ( .D(temp_out[12]), .CK(n1), .RN(rst), .Q(
        data_out[12]) );
  DFFRHQX1 \data_out_reg[11]  ( .D(temp_out[11]), .CK(n2), .RN(n4), .Q(
        data_out[11]) );
  DFFRHQX1 \data_out_reg[10]  ( .D(temp_out[10]), .CK(n2), .RN(n4), .Q(
        data_out[10]) );
  DFFRHQX1 \data_out_reg[15]  ( .D(temp_out[15]), .CK(n1), .RN(rst), .Q(
        data_out[15]) );
  DFFRHQX1 \num_of_errors_reg[1]  ( .D(N196), .CK(n2), .RN(n4), .Q(
        num_of_errors[1]) );
  DFFRHQX1 \num_of_errors_reg[0]  ( .D(N195), .CK(clk), .RN(rst), .Q(
        num_of_errors[0]) );
  AOI221X1 U3 ( .A0(n8), .A1(n45), .B0(n20), .B1(n75), .C0(n118), .Y(n126) );
  AOI221X1 U4 ( .A0(n8), .A1(n75), .B0(n20), .B1(n40), .C0(n118), .Y(n123) );
  NAND3X2 U5 ( .A(n121), .B(n124), .C(s_vector[2]), .Y(n75) );
  AOI221X1 U6 ( .A0(n8), .A1(n90), .B0(n20), .B1(n86), .C0(n118), .Y(n131) );
  AOI221X1 U7 ( .A0(n8), .A1(n86), .B0(n20), .B1(n45), .C0(n118), .Y(n128) );
  NAND3X2 U8 ( .A(n121), .B(n129), .C(s_vector[1]), .Y(n86) );
  AOI211X1 U9 ( .A0(n30), .A1(n31), .B0(n32), .C0(n33), .Y(n29) );
  AOI211X1 U10 ( .A0(n30), .A1(n40), .B0(n41), .C0(n33), .Y(n39) );
  AOI211X1 U11 ( .A0(n30), .A1(n45), .B0(n46), .C0(n33), .Y(n44) );
  NOR2X2 U12 ( .A(n14), .B(n137), .Y(n30) );
  CLKINVX3 U13 ( .A(n90), .Y(n12) );
  NAND3X2 U14 ( .A(s_vector[0]), .B(n129), .C(s_vector[1]), .Y(n45) );
  NAND2XL U15 ( .A(n57), .B(n12), .Y(n111) );
  NOR2X2 U16 ( .A(n51), .B(n36), .Y(n57) );
  NAND2XL U17 ( .A(n70), .B(n12), .Y(n88) );
  NOR2X2 U18 ( .A(n95), .B(n36), .Y(n70) );
  NOR2XL U19 ( .A(n33), .B(n75), .Y(n74) );
  NOR2XL U20 ( .A(n33), .B(n86), .Y(n106) );
  OAI21X2 U21 ( .A0(n23), .A1(n36), .B0(n55), .Y(n33) );
  NAND2XL U22 ( .A(n70), .B(n47), .Y(n91) );
  AOI31X1 U23 ( .A0(n47), .A1(n139), .A2(n140), .B0(N195), .Y(N196) );
  AOI222X1 U24 ( .A0(n42), .A1(n27), .B0(n47), .B1(n16), .C0(n37), .C1(n35), 
        .Y(n43) );
  CLKINVX3 U25 ( .A(n62), .Y(n47) );
  CLKINVX3 U26 ( .A(n14), .Y(n20) );
  AOI222X1 U27 ( .A0(n27), .A1(n26), .B0(n35), .B1(n16), .C0(n37), .C1(n15), 
        .Y(n28) );
  AOI222X1 U28 ( .A0(n35), .A1(n27), .B0(n42), .B1(n16), .C0(n37), .C1(n26), 
        .Y(n38) );
  NOR2X2 U29 ( .A(n138), .B(n36), .Y(n16) );
  NOR2XL U30 ( .A(n86), .B(n98), .Y(n110) );
  NOR2XL U31 ( .A(n45), .B(n98), .Y(n108) );
  NOR2XL U32 ( .A(n75), .B(n98), .Y(n104) );
  NAND2BX2 U33 ( .AN(n51), .B(n93), .Y(n98) );
  NOR2BX2 U34 ( .AN(n136), .B(n34), .Y(n37) );
  OR3X2 U35 ( .A(work_mod[0]), .B(work_mod[1]), .C(n137), .Y(n34) );
  NOR2X2 U36 ( .A(n144), .B(work_mod[0]), .Y(n8) );
  AOI21XL U37 ( .A0(work_mod[1]), .A1(work_mod[0]), .B0(n137), .Y(n132) );
  CLKINVX3 U38 ( .A(s_vector[3]), .Y(n139) );
  CLKINVX2 U39 ( .A(n40), .Y(n35) );
  NAND3X2 U40 ( .A(s_vector[0]), .B(n124), .C(s_vector[2]), .Y(n40) );
  AOI21XL U41 ( .A0(n12), .A1(n13), .B0(n14), .Y(n11) );
  OAI221X4 U42 ( .A0(n63), .A1(n24), .B0(n13), .B1(n14), .C0(n25), .Y(n118) );
  AND2X2 U43 ( .A(n13), .B(n30), .Y(n17) );
  NOR3X2 U44 ( .A(n139), .B(s_vector[5]), .C(n143), .Y(n13) );
  AOI22XL U45 ( .A0(n64), .A1(n42), .B0(n76), .B1(n17), .Y(n125) );
  AOI22XL U46 ( .A0(n64), .A1(n87), .B0(n42), .B1(n17), .Y(n127) );
  AOI22XL U47 ( .A0(n47), .A1(n56), .B0(n42), .B1(n37), .Y(n48) );
  NAND2XL U48 ( .A(n57), .B(n42), .Y(n107) );
  NAND2XL U49 ( .A(n70), .B(n42), .Y(n82) );
  CLKINVX2 U50 ( .A(n45), .Y(n42) );
  OAI22XL U51 ( .A0(n26), .A1(n34), .B0(n42), .B1(n36), .Y(n41) );
  AOI22XL U52 ( .A0(n64), .A1(n35), .B0(n26), .B1(n17), .Y(n119) );
  NAND2XL U53 ( .A(n57), .B(n26), .Y(n99) );
  NAND2XL U54 ( .A(n70), .B(n26), .Y(n71) );
  CLKINVX3 U55 ( .A(n31), .Y(n26) );
  AOI22XL U56 ( .A0(n15), .A1(n16), .B0(n12), .B1(n17), .Y(n6) );
  OAI22XL U57 ( .A0(n15), .A1(n14), .B0(n26), .B1(n24), .Y(n22) );
  OAI22XL U58 ( .A0(n15), .A1(n34), .B0(n35), .B1(n36), .Y(n32) );
  AOI22XL U59 ( .A0(n64), .A1(n26), .B0(n17), .B1(n15), .Y(n116) );
  AOI22XL U60 ( .A0(n26), .A1(n16), .B0(n27), .B1(n15), .Y(n18) );
  CLKINVX3 U61 ( .A(n9), .Y(n15) );
  OR3X1 U62 ( .A(n16), .B(n37), .C(n27), .Y(n77) );
  NOR2X2 U63 ( .A(n21), .B(n54), .Y(n27) );
  NOR2XL U64 ( .A(n69), .B(n86), .Y(n85) );
  NOR2XL U65 ( .A(n69), .B(n75), .Y(n81) );
  NOR2XL U66 ( .A(n45), .B(n69), .Y(n83) );
  NOR2XL U67 ( .A(n40), .B(n69), .Y(n79) );
  NAND2X2 U68 ( .A(n93), .B(n94), .Y(n69) );
  NOR2X2 U69 ( .A(n133), .B(n36), .Y(n64) );
  CLKINVX3 U70 ( .A(n50), .Y(n36) );
  CLKINVX3 U71 ( .A(n5), .Y(n4) );
  CLKINVX3 U72 ( .A(n3), .Y(n2) );
  INVX1 U73 ( .A(rst), .Y(n5) );
  CLKINVX3 U74 ( .A(n3), .Y(n1) );
  INVX1 U75 ( .A(clk), .Y(n3) );
  MXI2X1 U76 ( .A(n6), .B(n7), .S0(data_in[9]), .Y(temp_out[9]) );
  AOI211X1 U77 ( .A0(n8), .A1(n9), .B0(n10), .C0(n11), .Y(n7) );
  MXI2X1 U78 ( .A(n18), .B(n19), .S0(data_in[8]), .Y(temp_out[8]) );
  AOI211X1 U79 ( .A0(n20), .A1(n21), .B0(n22), .C0(n10), .Y(n19) );
  OAI21XL U80 ( .A0(n23), .A1(n24), .B0(n25), .Y(n10) );
  MXI2X1 U81 ( .A(n28), .B(n29), .S0(data_in[7]), .Y(temp_out[7]) );
  MXI2X1 U82 ( .A(n38), .B(n39), .S0(data_in[6]), .Y(temp_out[6]) );
  MXI2X1 U83 ( .A(n43), .B(n44), .S0(data_in[5]), .Y(temp_out[5]) );
  OAI22X1 U84 ( .A0(n35), .A1(n34), .B0(n47), .B1(n36), .Y(n46) );
  MXI2X1 U85 ( .A(n48), .B(n49), .S0(data_in[4]), .Y(temp_out[4]) );
  AOI211X1 U86 ( .A0(n50), .A1(n51), .B0(n52), .C0(n53), .Y(n49) );
  AOI21X1 U87 ( .A0(n54), .A1(n36), .B0(n47), .Y(n53) );
  OAI21XL U88 ( .A0(n42), .A1(n34), .B0(n55), .Y(n52) );
  OR2X1 U89 ( .A(n57), .B(n27), .Y(n56) );
  MXI2X1 U90 ( .A(n58), .B(n59), .S0(data_in[3]), .Y(temp_out[3]) );
  NOR3X1 U91 ( .A(n60), .B(n61), .C(n62), .Y(n59) );
  OAI22X1 U92 ( .A0(n13), .A1(n54), .B0(n63), .B1(n36), .Y(n60) );
  OAI21XL U93 ( .A0(n64), .A1(n65), .B0(n47), .Y(n58) );
  INVX1 U94 ( .A(n66), .Y(n65) );
  MXI2X1 U95 ( .A(n67), .B(n68), .S0(data_in[31]), .Y(temp_out[31]) );
  NOR2X1 U96 ( .A(n9), .B(n69), .Y(n68) );
  NAND2X1 U97 ( .A(n70), .B(n15), .Y(n67) );
  MXI2X1 U98 ( .A(n71), .B(n72), .S0(data_in[30]), .Y(temp_out[30]) );
  NOR2X1 U99 ( .A(n31), .B(n69), .Y(n72) );
  MXI2X1 U100 ( .A(n73), .B(n74), .S0(data_in[2]), .Y(temp_out[2]) );
  NAND2X1 U101 ( .A(n76), .B(n77), .Y(n73) );
  MXI2X1 U102 ( .A(n78), .B(n79), .S0(data_in[29]), .Y(temp_out[29]) );
  NAND2X1 U103 ( .A(n70), .B(n35), .Y(n78) );
  MXI2X1 U104 ( .A(n80), .B(n81), .S0(data_in[28]), .Y(temp_out[28]) );
  NAND2X1 U105 ( .A(n76), .B(n70), .Y(n80) );
  MXI2X1 U106 ( .A(n82), .B(n83), .S0(data_in[27]), .Y(temp_out[27]) );
  MXI2X1 U107 ( .A(n84), .B(n85), .S0(data_in[26]), .Y(temp_out[26]) );
  NAND2X1 U108 ( .A(n87), .B(n70), .Y(n84) );
  MXI2X1 U109 ( .A(n88), .B(n89), .S0(data_in[25]), .Y(temp_out[25]) );
  NOR2X1 U110 ( .A(n90), .B(n69), .Y(n89) );
  MXI2X1 U111 ( .A(n91), .B(n92), .S0(data_in[24]), .Y(temp_out[24]) );
  NOR2X1 U112 ( .A(n62), .B(n69), .Y(n92) );
  INVX1 U113 ( .A(n95), .Y(n94) );
  MXI2X1 U114 ( .A(n96), .B(n97), .S0(data_in[23]), .Y(temp_out[23]) );
  NOR2X1 U115 ( .A(n9), .B(n98), .Y(n97) );
  NAND2X1 U116 ( .A(n57), .B(n15), .Y(n96) );
  MXI2X1 U117 ( .A(n99), .B(n100), .S0(data_in[22]), .Y(temp_out[22]) );
  NOR2X1 U118 ( .A(n31), .B(n98), .Y(n100) );
  MXI2X1 U119 ( .A(n101), .B(n102), .S0(data_in[21]), .Y(temp_out[21]) );
  NOR2X1 U120 ( .A(n40), .B(n98), .Y(n102) );
  NAND2X1 U121 ( .A(n57), .B(n35), .Y(n101) );
  MXI2X1 U122 ( .A(n103), .B(n104), .S0(data_in[20]), .Y(temp_out[20]) );
  NAND2X1 U123 ( .A(n57), .B(n76), .Y(n103) );
  MXI2X1 U124 ( .A(n105), .B(n106), .S0(data_in[1]), .Y(temp_out[1]) );
  NAND2X1 U125 ( .A(n87), .B(n77), .Y(n105) );
  MXI2X1 U126 ( .A(n107), .B(n108), .S0(data_in[19]), .Y(temp_out[19]) );
  MXI2X1 U127 ( .A(n109), .B(n110), .S0(data_in[18]), .Y(temp_out[18]) );
  NAND2X1 U128 ( .A(n57), .B(n87), .Y(n109) );
  MXI2X1 U129 ( .A(n111), .B(n112), .S0(data_in[17]), .Y(temp_out[17]) );
  NOR2X1 U130 ( .A(n90), .B(n98), .Y(n112) );
  MXI2X1 U131 ( .A(n113), .B(n114), .S0(data_in[16]), .Y(temp_out[16]) );
  AND3X1 U132 ( .A(n93), .B(n15), .C(n63), .Y(n114) );
  NOR2X1 U133 ( .A(n115), .B(n20), .Y(n93) );
  NAND2X1 U134 ( .A(n64), .B(n15), .Y(n113) );
  MXI2X1 U135 ( .A(n116), .B(n117), .S0(data_in[15]), .Y(temp_out[15]) );
  NOR2X1 U136 ( .A(n22), .B(n118), .Y(n117) );
  NAND3X1 U137 ( .A(s_vector[1]), .B(s_vector[0]), .C(s_vector[2]), .Y(n9) );
  MXI2X1 U138 ( .A(n119), .B(n120), .S0(data_in[14]), .Y(temp_out[14]) );
  AOI221X1 U139 ( .A0(n8), .A1(n40), .B0(n20), .B1(n31), .C0(n118), .Y(n120)
         );
  NAND3X1 U140 ( .A(s_vector[1]), .B(n121), .C(s_vector[2]), .Y(n31) );
  MXI2X1 U141 ( .A(n122), .B(n123), .S0(data_in[13]), .Y(temp_out[13]) );
  AOI22X1 U142 ( .A0(n64), .A1(n76), .B0(n35), .B1(n17), .Y(n122) );
  MXI2X1 U143 ( .A(n125), .B(n126), .S0(data_in[12]), .Y(temp_out[12]) );
  INVX1 U144 ( .A(n75), .Y(n76) );
  MXI2X1 U145 ( .A(n127), .B(n128), .S0(data_in[11]), .Y(temp_out[11]) );
  MXI2X1 U146 ( .A(n130), .B(n131), .S0(data_in[10]), .Y(temp_out[10]) );
  INVX1 U147 ( .A(n115), .Y(n25) );
  OAI21XL U148 ( .A0(work_mod[1]), .A1(work_mod[0]), .B0(n132), .Y(n115) );
  INVX1 U149 ( .A(n133), .Y(n63) );
  AOI22X1 U150 ( .A0(n64), .A1(n12), .B0(n87), .B1(n17), .Y(n130) );
  INVX1 U151 ( .A(n86), .Y(n87) );
  MXI2X1 U152 ( .A(n134), .B(n135), .S0(data_in[0]), .Y(temp_out[0]) );
  NOR2X1 U153 ( .A(n90), .B(n33), .Y(n135) );
  AOI21X1 U154 ( .A0(n21), .A1(n30), .B0(n61), .Y(n55) );
  OAI21XL U155 ( .A0(n136), .A1(n34), .B0(n132), .Y(n61) );
  INVX1 U156 ( .A(n138), .Y(n23) );
  NAND2X1 U157 ( .A(n12), .B(n77), .Y(n134) );
  NAND3X1 U158 ( .A(n124), .B(n129), .C(s_vector[0]), .Y(n90) );
  NOR2X1 U159 ( .A(s_vector[5]), .B(s_vector[4]), .Y(n140) );
  NAND3X1 U160 ( .A(n124), .B(n129), .C(n121), .Y(n62) );
  INVX1 U161 ( .A(s_vector[0]), .Y(n121) );
  INVX1 U162 ( .A(s_vector[2]), .Y(n129) );
  INVX1 U163 ( .A(s_vector[1]), .Y(n124) );
  OAI211X1 U164 ( .A0(n141), .A1(n36), .B0(n142), .C0(n66), .Y(N195) );
  NOR2X1 U165 ( .A(n17), .B(n37), .Y(n66) );
  NOR3X1 U166 ( .A(s_vector[4]), .B(s_vector[5]), .C(n139), .Y(n136) );
  INVX1 U167 ( .A(n27), .Y(n142) );
  INVX1 U168 ( .A(n30), .Y(n54) );
  NAND2X1 U169 ( .A(work_mod[0]), .B(n144), .Y(n14) );
  NAND3X1 U170 ( .A(n139), .B(n145), .C(s_vector[4]), .Y(n21) );
  INVX1 U171 ( .A(s_vector[5]), .Y(n145) );
  NOR2X1 U172 ( .A(n137), .B(n24), .Y(n50) );
  INVX1 U173 ( .A(n8), .Y(n24) );
  INVX1 U174 ( .A(work_mod[1]), .Y(n144) );
  NAND4X1 U175 ( .A(n146), .B(n147), .C(n148), .D(n149), .Y(n137) );
  AND4X1 U176 ( .A(n150), .B(n151), .C(n152), .D(n153), .Y(n149) );
  NOR4X1 U177 ( .A(work_mod[9]), .B(work_mod[8]), .C(work_mod[7]), .D(
        work_mod[6]), .Y(n153) );
  NOR4X1 U178 ( .A(work_mod[5]), .B(work_mod[4]), .C(work_mod[3]), .D(
        work_mod[31]), .Y(n152) );
  NOR4X1 U179 ( .A(work_mod[30]), .B(work_mod[2]), .C(work_mod[29]), .D(
        work_mod[28]), .Y(n151) );
  NOR3X1 U180 ( .A(work_mod[25]), .B(work_mod[27]), .C(work_mod[26]), .Y(n150)
         );
  NOR4BX1 U181 ( .AN(n154), .B(work_mod[12]), .C(work_mod[10]), .D(
        work_mod[11]), .Y(n148) );
  NOR4X1 U182 ( .A(work_mod[16]), .B(work_mod[15]), .C(work_mod[14]), .D(
        work_mod[13]), .Y(n154) );
  NOR4X1 U183 ( .A(work_mod[24]), .B(work_mod[23]), .C(work_mod[22]), .D(
        work_mod[21]), .Y(n147) );
  NOR4X1 U184 ( .A(work_mod[20]), .B(work_mod[19]), .C(work_mod[18]), .D(
        work_mod[17]), .Y(n146) );
  AND4X1 U185 ( .A(n51), .B(n133), .C(n138), .D(n95), .Y(n141) );
  NAND3X1 U186 ( .A(s_vector[3]), .B(s_vector[5]), .C(s_vector[4]), .Y(n95) );
  NAND3X1 U187 ( .A(n139), .B(n143), .C(s_vector[5]), .Y(n138) );
  NAND3X1 U188 ( .A(s_vector[5]), .B(n143), .C(s_vector[3]), .Y(n133) );
  INVX1 U189 ( .A(s_vector[4]), .Y(n143) );
  NAND3X1 U190 ( .A(s_vector[5]), .B(n139), .C(s_vector[4]), .Y(n51) );
endmodule


module DEC_MAX_CODEWORD_WIDTH32_MAX_INFO_WIDTH26_AMBA_WORD32 ( rst, clk, 
        data_in, work_mod, data_out, num_of_errors );
  input [31:0] data_in;
  input [31:0] work_mod;
  output [31:0] data_out;
  output [1:0] num_of_errors;
  input rst, clk;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36;
  wire   [5:0] mult_result;
  wire   [31:0] data_out_with_parity;
  assign data_out[26] = 1'b0;
  assign data_out[27] = 1'b0;
  assign data_out[28] = 1'b0;
  assign data_out[29] = 1'b0;
  assign data_out[30] = 1'b0;
  assign data_out[31] = 1'b0;

  DEC_MULT_MAX_CODEWORD_WIDTH32_MAX_INFO_WIDTH26_AMBA_WORD32 mult ( .rst(rst), 
        .clk(clk), .data_in(data_in), .work_mod(work_mod), .data_out(
        mult_result) );
  DEC_CHK_MAX_CODEWORD_WIDTH32_MAX_INFO_WIDTH26_AMBA_WORD32 check ( .rst(rst), 
        .clk(clk), .data_in(data_in), .s_vector(mult_result), .work_mod(
        work_mod), .data_out(data_out_with_parity), .num_of_errors(
        num_of_errors) );
  AND2X2 U2 ( .A(n27), .B(n25), .Y(n1) );
  INVX1 U3 ( .A(work_mod[0]), .Y(n25) );
  NAND3X1 U4 ( .A(n27), .B(n26), .C(work_mod[0]), .Y(n11) );
  OAI21X1 U5 ( .A0(n25), .A1(n26), .B0(n27), .Y(n16) );
  CLKINVX3 U6 ( .A(n11), .Y(n5) );
  INVX8 U7 ( .A(n2), .Y(n4) );
  NAND2X1 U8 ( .A(work_mod[1]), .B(n1), .Y(n2) );
  AOI22XL U9 ( .A0(data_out_with_parity[14]), .A1(n4), .B0(n5), .B1(
        data_out_with_parity[13]), .Y(n6) );
  AOI22XL U10 ( .A0(n4), .A1(data_out_with_parity[10]), .B0(n5), .B1(
        data_out_with_parity[9]), .Y(n10) );
  AOI22XL U11 ( .A0(n4), .A1(data_out_with_parity[11]), .B0(n5), .B1(
        data_out_with_parity[10]), .Y(n9) );
  AOI22XL U12 ( .A0(n4), .A1(data_out_with_parity[12]), .B0(n5), .B1(
        data_out_with_parity[11]), .Y(n8) );
  AOI22XL U13 ( .A0(n4), .A1(data_out_with_parity[13]), .B0(n5), .B1(
        data_out_with_parity[12]), .Y(n7) );
  AOI22XL U14 ( .A0(n4), .A1(data_out_with_parity[15]), .B0(n5), .B1(
        data_out_with_parity[14]), .Y(n3) );
  INVX1 U15 ( .A(n3), .Y(data_out[9]) );
  INVX1 U16 ( .A(n6), .Y(data_out[8]) );
  INVX1 U17 ( .A(n7), .Y(data_out[7]) );
  INVX1 U18 ( .A(n8), .Y(data_out[6]) );
  INVX1 U19 ( .A(n9), .Y(data_out[5]) );
  INVX1 U20 ( .A(n10), .Y(data_out[4]) );
  OAI221XL U21 ( .A0(n11), .A1(n12), .B0(n13), .B1(n14), .C0(n15), .Y(
        data_out[3]) );
  AOI22X1 U22 ( .A0(data_out_with_parity[3]), .A1(n16), .B0(
        data_out_with_parity[9]), .B1(n4), .Y(n15) );
  INVX1 U23 ( .A(data_out_with_parity[8]), .Y(n12) );
  OAI221XL U24 ( .A0(n11), .A1(n14), .B0(n13), .B1(n17), .C0(n18), .Y(
        data_out[2]) );
  AOI22X1 U25 ( .A0(data_out_with_parity[2]), .A1(n16), .B0(
        data_out_with_parity[8]), .B1(n4), .Y(n18) );
  INVX1 U26 ( .A(data_out_with_parity[7]), .Y(n14) );
  AND2X1 U27 ( .A(data_out_with_parity[31]), .B(n4), .Y(data_out[25]) );
  AND2X1 U28 ( .A(data_out_with_parity[30]), .B(n4), .Y(data_out[24]) );
  AND2X1 U29 ( .A(data_out_with_parity[29]), .B(n4), .Y(data_out[23]) );
  AND2X1 U30 ( .A(data_out_with_parity[28]), .B(n4), .Y(data_out[22]) );
  AND2X1 U31 ( .A(data_out_with_parity[27]), .B(n4), .Y(data_out[21]) );
  AND2X1 U32 ( .A(data_out_with_parity[26]), .B(n4), .Y(data_out[20]) );
  OAI221XL U33 ( .A0(n11), .A1(n17), .B0(n13), .B1(n19), .C0(n20), .Y(
        data_out[1]) );
  AOI22X1 U34 ( .A0(data_out_with_parity[1]), .A1(n16), .B0(
        data_out_with_parity[7]), .B1(n4), .Y(n20) );
  INVX1 U35 ( .A(data_out_with_parity[5]), .Y(n19) );
  INVX1 U36 ( .A(data_out_with_parity[6]), .Y(n17) );
  AND2X1 U37 ( .A(data_out_with_parity[25]), .B(n4), .Y(data_out[19]) );
  AND2X1 U38 ( .A(data_out_with_parity[24]), .B(n4), .Y(data_out[18]) );
  AND2X1 U39 ( .A(data_out_with_parity[23]), .B(n4), .Y(data_out[17]) );
  AND2X1 U40 ( .A(data_out_with_parity[22]), .B(n4), .Y(data_out[16]) );
  AND2X1 U41 ( .A(data_out_with_parity[21]), .B(n4), .Y(data_out[15]) );
  AND2X1 U42 ( .A(data_out_with_parity[20]), .B(n4), .Y(data_out[14]) );
  AND2X1 U43 ( .A(data_out_with_parity[19]), .B(n4), .Y(data_out[13]) );
  AND2X1 U44 ( .A(data_out_with_parity[18]), .B(n4), .Y(data_out[12]) );
  AND2X1 U45 ( .A(data_out_with_parity[17]), .B(n4), .Y(data_out[11]) );
  INVX1 U46 ( .A(n21), .Y(data_out[10]) );
  AOI22X1 U47 ( .A0(n5), .A1(data_out_with_parity[15]), .B0(
        data_out_with_parity[16]), .B1(n4), .Y(n21) );
  NAND2X1 U48 ( .A(n22), .B(n23), .Y(data_out[0]) );
  AOI22X1 U49 ( .A0(data_out_with_parity[5]), .A1(n5), .B0(
        data_out_with_parity[4]), .B1(n24), .Y(n23) );
  INVX1 U50 ( .A(n13), .Y(n24) );
  NAND3X1 U51 ( .A(n25), .B(n26), .C(n27), .Y(n13) );
  AOI22X1 U52 ( .A0(data_out_with_parity[0]), .A1(n16), .B0(
        data_out_with_parity[6]), .B1(n4), .Y(n22) );
  AND4X1 U53 ( .A(n28), .B(n29), .C(n30), .D(n31), .Y(n27) );
  AND4X1 U54 ( .A(n32), .B(n33), .C(n34), .D(n35), .Y(n31) );
  NOR4X1 U55 ( .A(work_mod[9]), .B(work_mod[8]), .C(work_mod[7]), .D(
        work_mod[6]), .Y(n35) );
  NOR4X1 U56 ( .A(work_mod[5]), .B(work_mod[4]), .C(work_mod[3]), .D(
        work_mod[31]), .Y(n34) );
  NOR4X1 U57 ( .A(work_mod[30]), .B(work_mod[2]), .C(work_mod[29]), .D(
        work_mod[28]), .Y(n33) );
  NOR3X1 U58 ( .A(work_mod[25]), .B(work_mod[27]), .C(work_mod[26]), .Y(n32)
         );
  NOR4BX1 U59 ( .AN(n36), .B(work_mod[12]), .C(work_mod[10]), .D(work_mod[11]), 
        .Y(n30) );
  NOR4X1 U60 ( .A(work_mod[16]), .B(work_mod[15]), .C(work_mod[14]), .D(
        work_mod[13]), .Y(n36) );
  NOR4X1 U61 ( .A(work_mod[24]), .B(work_mod[23]), .C(work_mod[22]), .D(
        work_mod[21]), .Y(n29) );
  NOR4X1 U62 ( .A(work_mod[20]), .B(work_mod[19]), .C(work_mod[18]), .D(
        work_mod[17]), .Y(n28) );
  INVX1 U63 ( .A(work_mod[1]), .Y(n26) );
endmodule


module ECC_ENC_DEC ( rst, clk, data_out, operation_done, num_of_errors, PWDATA, 
        PADDR, PENABLE, PSEL, PWRITE, PRDATA );
  output [31:0] data_out;
  output [1:0] num_of_errors;
  input [31:0] PWDATA;
  input [19:0] PADDR;
  output [31:0] PRDATA;
  input rst, clk, PENABLE, PSEL, PWRITE;
  output operation_done;
  wire   start, online, counter, n35, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178;
  wire   [31:0] NOISE;
  wire   [31:0] CTRL;
  wire   [31:0] CODEWORD_WIDTH;
  wire   [31:0] DATA_IN;
  wire   [31:0] data_out_enc;
  wire   [31:0] DATA_IN_DEC;
  wire   [31:0] data_out_dec;

  APB_BUS_AMBA_WORD32_AMBA_ADDR_WIDTH20_DATA_WIDTH32 register_bank ( .rst(rst), 
        .clk(clk), .PSEL(PSEL), .PADDR(PADDR), .PENABLE(PENABLE), .PWDATA(
        PWDATA), .PWRITE(PWRITE), .start(start), .CTRL(CTRL), .DATA_IN(DATA_IN), .CODEWORD_WIDTH(CODEWORD_WIDTH), .NOISE(NOISE), .PRDATA(PRDATA) );
  ENC_AMBA_WORD32_MAX_CODEWORD_WIDTH32_MAX_INFO_WIDTH26 encoder ( .rst(rst), 
        .clk(clk), .data_in(DATA_IN[25:0]), .work_mod(CODEWORD_WIDTH), 
        .data_out(data_out_enc) );
  DEC_MAX_CODEWORD_WIDTH32_MAX_INFO_WIDTH26_AMBA_WORD32 decoder ( .rst(rst), 
        .clk(clk), .data_in(DATA_IN_DEC), .work_mod(CODEWORD_WIDTH), 
        .data_out(data_out_dec), .num_of_errors(num_of_errors) );
  DFFRHQX1 online_reg ( .D(n35), .CK(clk), .RN(rst), .Q(online) );
  DFFRHQX1 operation_done_reg ( .D(n124), .CK(clk), .RN(rst), .Q(
        operation_done) );
  DFFRHQX1 counter_reg ( .D(n123), .CK(clk), .RN(rst), .Q(counter) );
  OAI2BB2X2 U159 ( .B0(n139), .B1(n125), .A0N(DATA_IN[8]), .A1N(n127), .Y(
        DATA_IN_DEC[8]) );
  OAI2BB2X2 U160 ( .B0(n142), .B1(n125), .A0N(DATA_IN[5]), .A1N(n127), .Y(
        DATA_IN_DEC[5]) );
  OAI2BB2X2 U161 ( .B0(n143), .B1(n125), .A0N(DATA_IN[4]), .A1N(n127), .Y(
        DATA_IN_DEC[4]) );
  OAI2BB2X2 U162 ( .B0(n163), .B1(n125), .A0N(DATA_IN[15]), .A1N(n127), .Y(
        DATA_IN_DEC[15]) );
  OAI2BB2X2 U163 ( .B0(n167), .B1(n125), .A0N(DATA_IN[11]), .A1N(n127), .Y(
        DATA_IN_DEC[11]) );
  OAI2BB2X2 U164 ( .B0(n137), .B1(n125), .A0N(DATA_IN[9]), .A1N(n127), .Y(
        DATA_IN_DEC[9]) );
  OAI2BB2X2 U165 ( .B0(n141), .B1(n125), .A0N(DATA_IN[6]), .A1N(n127), .Y(
        DATA_IN_DEC[6]) );
  OAI2BB2X2 U166 ( .B0(n147), .B1(n125), .A0N(DATA_IN[2]), .A1N(n127), .Y(
        DATA_IN_DEC[2]) );
  OAI2BB2X2 U167 ( .B0(n158), .B1(n125), .A0N(DATA_IN[1]), .A1N(n127), .Y(
        DATA_IN_DEC[1]) );
  OAI2BB2X2 U168 ( .B0(n165), .B1(n125), .A0N(DATA_IN[13]), .A1N(n127), .Y(
        DATA_IN_DEC[13]) );
  OAI2BB2X2 U169 ( .B0(n168), .B1(n125), .A0N(DATA_IN[10]), .A1N(n127), .Y(
        DATA_IN_DEC[10]) );
  OAI2BB2X2 U170 ( .B0(n169), .B1(n125), .A0N(DATA_IN[0]), .A1N(n127), .Y(
        DATA_IN_DEC[0]) );
  OAI2BB2X2 U171 ( .B0(n140), .B1(n125), .A0N(DATA_IN[7]), .A1N(n127), .Y(
        DATA_IN_DEC[7]) );
  OAI2BB2X2 U172 ( .B0(n144), .B1(n125), .A0N(DATA_IN[3]), .A1N(n127), .Y(
        DATA_IN_DEC[3]) );
  OAI2BB2X2 U173 ( .B0(n145), .B1(n125), .A0N(DATA_IN[31]), .A1N(n127), .Y(
        DATA_IN_DEC[31]) );
  OAI2BB2X2 U174 ( .B0(n146), .B1(n125), .A0N(DATA_IN[30]), .A1N(n127), .Y(
        DATA_IN_DEC[30]) );
  OAI2BB2X2 U175 ( .B0(n148), .B1(n125), .A0N(DATA_IN[29]), .A1N(n127), .Y(
        DATA_IN_DEC[29]) );
  OAI2BB2X2 U176 ( .B0(n149), .B1(n125), .A0N(DATA_IN[28]), .A1N(n127), .Y(
        DATA_IN_DEC[28]) );
  OAI2BB2X2 U177 ( .B0(n150), .B1(n125), .A0N(DATA_IN[27]), .A1N(n127), .Y(
        DATA_IN_DEC[27]) );
  OAI2BB2X2 U178 ( .B0(n151), .B1(n125), .A0N(DATA_IN[26]), .A1N(n127), .Y(
        DATA_IN_DEC[26]) );
  OAI2BB2X2 U179 ( .B0(n152), .B1(n125), .A0N(DATA_IN[25]), .A1N(n127), .Y(
        DATA_IN_DEC[25]) );
  OAI2BB2X2 U180 ( .B0(n153), .B1(n125), .A0N(DATA_IN[24]), .A1N(n127), .Y(
        DATA_IN_DEC[24]) );
  OAI2BB2X2 U181 ( .B0(n154), .B1(n125), .A0N(DATA_IN[23]), .A1N(n127), .Y(
        DATA_IN_DEC[23]) );
  OAI2BB2X2 U182 ( .B0(n155), .B1(n125), .A0N(DATA_IN[22]), .A1N(n127), .Y(
        DATA_IN_DEC[22]) );
  OAI2BB2X2 U183 ( .B0(n156), .B1(n125), .A0N(DATA_IN[21]), .A1N(n127), .Y(
        DATA_IN_DEC[21]) );
  OAI2BB2X2 U184 ( .B0(n157), .B1(n125), .A0N(DATA_IN[20]), .A1N(n127), .Y(
        DATA_IN_DEC[20]) );
  OAI2BB2X2 U185 ( .B0(n159), .B1(n125), .A0N(DATA_IN[19]), .A1N(n127), .Y(
        DATA_IN_DEC[19]) );
  OAI2BB2X2 U186 ( .B0(n160), .B1(n125), .A0N(DATA_IN[18]), .A1N(n127), .Y(
        DATA_IN_DEC[18]) );
  OAI2BB2X2 U187 ( .B0(n161), .B1(n125), .A0N(DATA_IN[17]), .A1N(n127), .Y(
        DATA_IN_DEC[17]) );
  OAI2BB2X2 U188 ( .B0(n162), .B1(n125), .A0N(DATA_IN[16]), .A1N(n127), .Y(
        DATA_IN_DEC[16]) );
  OAI2BB2X2 U189 ( .B0(n164), .B1(n125), .A0N(DATA_IN[14]), .A1N(n127), .Y(
        DATA_IN_DEC[14]) );
  OAI2BB2X2 U190 ( .B0(n166), .B1(n125), .A0N(DATA_IN[12]), .A1N(n127), .Y(
        DATA_IN_DEC[12]) );
  CLKBUFX8 U191 ( .A(n133), .Y(n125) );
  BUFX3 U192 ( .A(n134), .Y(n126) );
  AND2X4 U193 ( .A(n135), .B(n136), .Y(n134) );
  CLKBUFX8 U194 ( .A(n138), .Y(n127) );
  NOR2BXL U195 ( .AN(data_out_enc[26]), .B(n126), .Y(data_out[26]) );
  NOR2BXL U196 ( .AN(data_out_enc[27]), .B(n126), .Y(data_out[27]) );
  NOR2BXL U197 ( .AN(data_out_enc[28]), .B(n126), .Y(data_out[28]) );
  NOR2BXL U198 ( .AN(data_out_enc[29]), .B(n126), .Y(data_out[29]) );
  NOR2BXL U199 ( .AN(data_out_enc[30]), .B(n126), .Y(data_out[30]) );
  NOR2BXL U200 ( .AN(data_out_enc[31]), .B(n126), .Y(data_out[31]) );
  OR2X1 U201 ( .A(start), .B(n128), .Y(n35) );
  INVX1 U202 ( .A(n129), .Y(n124) );
  MXI2X1 U203 ( .A(n130), .B(n129), .S0(counter), .Y(n123) );
  NAND2X1 U204 ( .A(n131), .B(n128), .Y(n129) );
  MXI2X1 U205 ( .A(n132), .B(n125), .S0(counter), .Y(n131) );
  NAND2X1 U206 ( .A(n128), .B(n132), .Y(n130) );
  NOR2BX1 U207 ( .AN(online), .B(operation_done), .Y(n128) );
  MX2X1 U208 ( .A(data_out_enc[9]), .B(data_out_dec[9]), .S0(n126), .Y(
        data_out[9]) );
  MX2X1 U209 ( .A(data_out_enc[8]), .B(data_out_dec[8]), .S0(n126), .Y(
        data_out[8]) );
  MX2X1 U210 ( .A(data_out_enc[7]), .B(data_out_dec[7]), .S0(n126), .Y(
        data_out[7]) );
  MX2X1 U211 ( .A(data_out_enc[6]), .B(data_out_dec[6]), .S0(n126), .Y(
        data_out[6]) );
  MX2X1 U212 ( .A(data_out_enc[5]), .B(data_out_dec[5]), .S0(n126), .Y(
        data_out[5]) );
  MX2X1 U213 ( .A(data_out_enc[4]), .B(data_out_dec[4]), .S0(n126), .Y(
        data_out[4]) );
  MX2X1 U214 ( .A(data_out_enc[3]), .B(data_out_dec[3]), .S0(n126), .Y(
        data_out[3]) );
  MX2X1 U215 ( .A(data_out_enc[2]), .B(data_out_dec[2]), .S0(n134), .Y(
        data_out[2]) );
  MX2X1 U216 ( .A(data_out_enc[25]), .B(data_out_dec[25]), .S0(n134), .Y(
        data_out[25]) );
  MX2X1 U217 ( .A(data_out_enc[24]), .B(data_out_dec[24]), .S0(n134), .Y(
        data_out[24]) );
  MX2X1 U218 ( .A(data_out_enc[23]), .B(data_out_dec[23]), .S0(n134), .Y(
        data_out[23]) );
  MX2X1 U219 ( .A(data_out_enc[22]), .B(data_out_dec[22]), .S0(n134), .Y(
        data_out[22]) );
  MX2X1 U220 ( .A(data_out_enc[21]), .B(data_out_dec[21]), .S0(n134), .Y(
        data_out[21]) );
  MX2X1 U221 ( .A(data_out_enc[20]), .B(data_out_dec[20]), .S0(n134), .Y(
        data_out[20]) );
  MX2X1 U222 ( .A(data_out_enc[1]), .B(data_out_dec[1]), .S0(n134), .Y(
        data_out[1]) );
  MX2X1 U223 ( .A(data_out_enc[19]), .B(data_out_dec[19]), .S0(n134), .Y(
        data_out[19]) );
  MX2X1 U224 ( .A(data_out_enc[18]), .B(data_out_dec[18]), .S0(n134), .Y(
        data_out[18]) );
  MX2X1 U225 ( .A(data_out_enc[17]), .B(data_out_dec[17]), .S0(n134), .Y(
        data_out[17]) );
  MX2X1 U226 ( .A(data_out_enc[16]), .B(data_out_dec[16]), .S0(n134), .Y(
        data_out[16]) );
  MX2X1 U227 ( .A(data_out_enc[15]), .B(data_out_dec[15]), .S0(n134), .Y(
        data_out[15]) );
  MX2X1 U228 ( .A(data_out_enc[14]), .B(data_out_dec[14]), .S0(n134), .Y(
        data_out[14]) );
  MX2X1 U229 ( .A(data_out_enc[13]), .B(data_out_dec[13]), .S0(n134), .Y(
        data_out[13]) );
  MX2X1 U230 ( .A(data_out_enc[12]), .B(data_out_dec[12]), .S0(n134), .Y(
        data_out[12]) );
  MX2X1 U231 ( .A(data_out_enc[11]), .B(data_out_dec[11]), .S0(n134), .Y(
        data_out[11]) );
  MX2X1 U232 ( .A(data_out_enc[10]), .B(data_out_dec[10]), .S0(n134), .Y(
        data_out[10]) );
  MX2X1 U233 ( .A(data_out_enc[0]), .B(data_out_dec[0]), .S0(n134), .Y(
        data_out[0]) );
  XOR2X1 U234 ( .A(CTRL[1]), .B(CTRL[0]), .Y(n136) );
  XNOR2X1 U235 ( .A(data_out_enc[9]), .B(NOISE[9]), .Y(n137) );
  XNOR2X1 U236 ( .A(data_out_enc[8]), .B(NOISE[8]), .Y(n139) );
  XNOR2X1 U237 ( .A(data_out_enc[7]), .B(NOISE[7]), .Y(n140) );
  XNOR2X1 U238 ( .A(data_out_enc[6]), .B(NOISE[6]), .Y(n141) );
  XNOR2X1 U239 ( .A(data_out_enc[5]), .B(NOISE[5]), .Y(n142) );
  XNOR2X1 U240 ( .A(data_out_enc[4]), .B(NOISE[4]), .Y(n143) );
  XNOR2X1 U241 ( .A(data_out_enc[3]), .B(NOISE[3]), .Y(n144) );
  XNOR2X1 U242 ( .A(data_out_enc[31]), .B(NOISE[31]), .Y(n145) );
  XNOR2X1 U243 ( .A(data_out_enc[30]), .B(NOISE[30]), .Y(n146) );
  XNOR2X1 U244 ( .A(data_out_enc[2]), .B(NOISE[2]), .Y(n147) );
  XNOR2X1 U245 ( .A(data_out_enc[29]), .B(NOISE[29]), .Y(n148) );
  XNOR2X1 U246 ( .A(data_out_enc[28]), .B(NOISE[28]), .Y(n149) );
  XNOR2X1 U247 ( .A(data_out_enc[27]), .B(NOISE[27]), .Y(n150) );
  XNOR2X1 U248 ( .A(data_out_enc[26]), .B(NOISE[26]), .Y(n151) );
  XNOR2X1 U249 ( .A(data_out_enc[25]), .B(NOISE[25]), .Y(n152) );
  XNOR2X1 U250 ( .A(data_out_enc[24]), .B(NOISE[24]), .Y(n153) );
  XNOR2X1 U251 ( .A(data_out_enc[23]), .B(NOISE[23]), .Y(n154) );
  XNOR2X1 U252 ( .A(data_out_enc[22]), .B(NOISE[22]), .Y(n155) );
  XNOR2X1 U253 ( .A(data_out_enc[21]), .B(NOISE[21]), .Y(n156) );
  XNOR2X1 U254 ( .A(data_out_enc[20]), .B(NOISE[20]), .Y(n157) );
  XNOR2X1 U255 ( .A(data_out_enc[1]), .B(NOISE[1]), .Y(n158) );
  XNOR2X1 U256 ( .A(data_out_enc[19]), .B(NOISE[19]), .Y(n159) );
  XNOR2X1 U257 ( .A(data_out_enc[18]), .B(NOISE[18]), .Y(n160) );
  XNOR2X1 U258 ( .A(data_out_enc[17]), .B(NOISE[17]), .Y(n161) );
  XNOR2X1 U259 ( .A(data_out_enc[16]), .B(NOISE[16]), .Y(n162) );
  XNOR2X1 U260 ( .A(data_out_enc[15]), .B(NOISE[15]), .Y(n163) );
  XNOR2X1 U261 ( .A(data_out_enc[14]), .B(NOISE[14]), .Y(n164) );
  XNOR2X1 U262 ( .A(data_out_enc[13]), .B(NOISE[13]), .Y(n165) );
  XNOR2X1 U263 ( .A(data_out_enc[12]), .B(NOISE[12]), .Y(n166) );
  XNOR2X1 U264 ( .A(data_out_enc[11]), .B(NOISE[11]), .Y(n167) );
  XNOR2X1 U265 ( .A(data_out_enc[10]), .B(NOISE[10]), .Y(n168) );
  NOR2BX1 U266 ( .AN(CTRL[0]), .B(n132), .Y(n138) );
  NAND2BX1 U267 ( .AN(CTRL[1]), .B(n135), .Y(n132) );
  NAND3BX1 U268 ( .AN(CTRL[0]), .B(n135), .C(CTRL[1]), .Y(n133) );
  AND4X1 U269 ( .A(n170), .B(n171), .C(n172), .D(n173), .Y(n135) );
  AND4X1 U270 ( .A(n174), .B(n175), .C(n176), .D(n177), .Y(n173) );
  NOR4X1 U271 ( .A(CTRL[9]), .B(CTRL[8]), .C(CTRL[7]), .D(CTRL[6]), .Y(n177)
         );
  NOR4X1 U272 ( .A(CTRL[5]), .B(CTRL[4]), .C(CTRL[3]), .D(CTRL[31]), .Y(n176)
         );
  NOR4X1 U273 ( .A(CTRL[30]), .B(CTRL[2]), .C(CTRL[29]), .D(CTRL[28]), .Y(n175) );
  NOR3X1 U274 ( .A(CTRL[25]), .B(CTRL[27]), .C(CTRL[26]), .Y(n174) );
  NOR4BX1 U275 ( .AN(n178), .B(CTRL[12]), .C(CTRL[10]), .D(CTRL[11]), .Y(n172)
         );
  NOR4X1 U276 ( .A(CTRL[16]), .B(CTRL[15]), .C(CTRL[14]), .D(CTRL[13]), .Y(
        n178) );
  NOR4X1 U277 ( .A(CTRL[24]), .B(CTRL[23]), .C(CTRL[22]), .D(CTRL[21]), .Y(
        n171) );
  NOR4X1 U278 ( .A(CTRL[20]), .B(CTRL[19]), .C(CTRL[18]), .D(CTRL[17]), .Y(
        n170) );
  XNOR2X1 U279 ( .A(data_out_enc[0]), .B(NOISE[0]), .Y(n169) );
endmodule

