/*
Autor: Jack0v
This project is a complete module for LCD1602 HD44780 (Latin alphabet and Russian symbols, 4-b bus).
Source video 1/2: https://youtu.be/AxQtbRhjpYA
			 2/2: https://youtu.be/sTgquo1QI_A
	!!!WARNING!!!
	This project was tested for EP4CE6E22C8 by QurtusII 9.1SP2.
	Before compiling, specify the pins of the your FPGA. Example:
	//(*chip_pin = "76"*) output reg TRSQ
*/
/*
Àâòîð: Jack0v
Ýòîò ïðîåêò ÿâëÿåòñÿ çàâåðø¸ííûì ìîäóëåì äëÿ LCD1602 HD44780 (ëàòèíñêèé àëôàâèò è ðóññêèå ñèìâîëû, 4-õ ðàçðÿäíàÿ øèíà).
Èñõîäíîå âèäåî 1/2: https://youtu.be/AxQtbRhjpYA
			   2/2: https://youtu.be/sTgquo1QI_A
	!!!ÂÍÈÌÀÍÈÅ!!!
	Ýòîò ïðîåêò òåñòèðîâàëñÿ ïîä EP4CE6E22C8 â QurtusII 9.1SP2.
	Ïåðåä êîìïèëÿöèåé óêàæè âûâîäû ñâîåé ÏËÈÑ. Ïðèìåð:
	//(*chip_pin = "76"*) output reg TRSQ
*/
//(C) Jack0v, 2020
module LCD(	(*chip_pin = "00"*) output reg TRSQ,
			(*chip_pin = "00"*) output ENQ,
			(*chip_pin = "00, 00, 00, 00"*) output [7:4]DataY,
			(*chip_pin = "00"*) output RWY,
				(*chip_pin = "00"*) input C
			
			,(*altera_attribute = "-name VIRTUAL_PIN ON"*) output CGInitY_,
			(*altera_attribute = "-name VIRTUAL_PIN ON"*) output LoadSymbY_
			);

			/*
			(*chip_pin = "76"*) output reg TRSQ,
			(*chip_pin = "75"*) output ENQ,
			(*chip_pin = "77, 133, 80, 83"*) output [7:4]DataY,
			(*chip_pin = "74"*) output RWY,
				(*chip_pin = "23"*) input C
			*/

	assign CGInitY_ = CGInitY;
	assign LoadSymbY_ = LoadSymbY;
	
	assign RWY = 1'd0;
	///Äåëèòåëü ÷àñòîòû-------------------------------------------------
	//Ìàêñ. âðåìÿ èñïîëíåíèÿ èíñòðóêöèè - 1,53ìñ;
	//Òàêòîâ ìåæäó çàïèñüþ èíñòðóêöèé - 3;
	//Íåîáõîäèìàÿ äëèòåëüíîñòü òàêòà = 1,53ìñ / 3ò = 0,51ìñ;
	//Òàêòîâàÿ ÷àñòîòà ãåíåðàòîðà - 25ÌÃö (0,00004ìñ);
	//Êîýôôèöèåíò ñ÷¸ò÷èêà-äåëèòåëÿ = 0,51ìñ / 0,00004ìñ = 12750;
	//Íåîáõîäèìàÿ ðàçðÿäíîñòü ñ÷¸ò÷èêà = lb12750 = 13,6382ð = 14ð;
	//Äëèòåëüíîñòü ñ÷¸òà ñ÷¸ò÷èêà-äåëèòåëÿ = 2^14 = 16384ò;
	//Ïîëó÷åííàÿ äëèòåëüíîñòü òàêòà = 0,00004ìñ * 16384ò = 0,65536ìñ;
	reg TCQ;
	reg [13:0]CTCQ;
	always @(posedge C)
	begin
		CTCQ <= CTCQ + 1'd1;
		if(&CTCQ[12:0]) TCQ <= !TCQ;
	end
	
	//äëÿ ñèìóëÿöèè
	/*wire TCQ;
	assign TCQ = C;
	*/
	//\Äåëèòåëü ÷àñòîòû-------------------------------------------------

	//óïðàâëÿþùèå ñèãíàëû
	wire L0_REGDataY;
	wire L1_REGDataY;
	wire L2_REGDataY;
	wire L3_REGDataY;
	wire L4_REGDataY;
	wire L5_REGDataY;
	wire L6_REGDataY;
	wire L7_REGDataY;
	wire CGInitY;
	wire LoadSymbY;
	wire INC_CTAdrY;
	wire SH_REGENY;
	wire T_TTetrY;
	wire TRSY;
	//âûõîäû óñòðîéñòâ
	reg [5:0]CTAdrQ;
	//reg TRSQ;
	reg [2:0]REGENQ;
	//wire ENQ;
	reg [7:0]REGDataQ;
	reg TTetrQ;
	wire [7:0]RAMQ;
	reg [7:0]ASCIIY;
	//wire [7:0]DataY;

	LCDCD LCDCD(//óïðàâëÿþùèå ñèãíàëû
				.L0_REGDataY(L0_REGDataY),
				.L1_REGDataY(L1_REGDataY),
				.L2_REGDataY(L2_REGDataY),
				.L3_REGDataY(L3_REGDataY),
				.L4_REGDataY(L4_REGDataY),
				.L5_REGDataY(L5_REGDataY),
				.L6_REGDataY(L6_REGDataY),
				.L7_REGDataY(L7_REGDataY),
				.CGInitY(CGInitY),
				.LoadSymbY(LoadSymbY),
				.INC_CTAdrY(INC_CTAdrY),
				.SH_REGENY(SH_REGENY),
				.T_TTetrY(T_TTetrY),
				.TRSY(TRSY),
					//îñâåäîìèòåëüíûå ñèãíàëû
					.REGENb0(REGENQ[0]),
					.REGENb2(REGENQ[2]),
					.CTAdrEq31(CTAdrQ == 6'd31),
					.CTAdrEq0(~|CTAdrQ),
					.CTAdrb3_b0Eq15(CTAdrQ[3:0] == 4'd15),
					.TTetr(TTetrQ),
						.C(TCQ));

	assign DataY = TTetrQ?
						TRSQ? (LoadSymbY? RAMQ[3:0] : ASCIIY[3:0]) : REGDataQ[3:0] :
						TRSQ? (LoadSymbY? RAMQ[7:4] : ASCIIY[7:4]) : REGDataQ[7:4];

	assign ENQ = REGENQ[0];

	initial REGENQ <= 3'b100;
	always @(posedge TCQ)
	begin
		//Ñ× àäðåñà
		//Ìàêñ. âðåìÿ âûäåðæêè ìåæäó çàïèñüþ èíñòðóêöèé ïðè èíèöèàëèçàöèè - 15ìñ;
		//Êîýôôèöèåíò ñ÷¸ò÷èêà = 15ìñ / 0,65536ìñ = 22,89;
		//Íåîáõîäèìàÿ ðàçðÿäíîñòü ñ÷¸ò÷èêà lb22,89 = 4,517ð = 5ð;
		//Äëèòåëüíîñòü ñ÷¸òà ñ÷¸ò÷èêà = 2^5 = 32ò, èëè 32ò * 0,65536ìñ = 20,97152ìñ;
		if(INC_CTAdrY)
		begin
			if(!LoadSymbY & CTAdrQ == 6'd31) CTAdrQ <= 0;
				else CTAdrQ <= CTAdrQ + 1'd1;
		end
		//Òðèããåð ñèãíàëà RS
		TRSQ <= TRSY;
		//Ðåãèñòð ñèãíàëà EN
		if(SH_REGENY) REGENQ <= {REGENQ[0], REGENQ[2:1]};
		//Ò òåòðàä
		if(T_TTetrY) TTetrQ <= !TTetrQ;
		//ÐÅÃ							 //7 6 5 4  3 2 1  0
										 //		 DL N F
		if	   (L0_REGDataY)REGDataQ <= 8'b0_0_1_1__1_0_x__x; //Íàñòðîéêà ïàðàìåòðîâ: DL-8ð.øèíà, N-2ñòðîêè, F-5x8òî÷åê
										 //			  D C  B	
		else if(L1_REGDataY)REGDataQ <= 8'b0_0_0_0__1_0_0__0; //Óïðàâëåíèå äèñïëååì: D-îòêë.äèñï., C-îòêë.êóðñîð, B-íåìèã.
		else if(L2_REGDataY)REGDataQ <= 8'b0_0_0_0__0_0_0__1; //Î÷èñòêà äèñïëåÿ
										 //			   I/D SH	
		else if(L3_REGDataY)REGDataQ <= 8'b0_0_0_0__0_1_1__0; //Óñòàíîâêà ðåæèìà ââîäà: I/D-èíêð.àäðåñà, SH-íåäâèã.äèñï.
										 //			  D C  B
		else if(L4_REGDataY)REGDataQ <= 8'b0_0_0_0__1_1_0__0; //Óïðàâëåíèå äèñïëååì: D-âêë.äèñï., C-îòêë.êóðñîð, B-íåìèã.
		else if(L5_REGDataY)REGDataQ <= {1'b1, CTAdrQ[4], 2'b00, CTAdrQ[3:0]}; //Óñòàíîâêà àäðåñà DDRAM
		else if(L6_REGDataY)REGDataQ <= 8'b0_1_0_0__0_0_0__0; //Óñòàíîâêà àäðåñà CGRAM
										 //		 DL N F
		else if(L7_REGDataY)REGDataQ <= 8'b0_0_1_0__1_0_x__x; //Íàñòðîéêà ïàðàìåòðîâ: DL-4ð.øèíà, N-2ñòðîêè, F-5x8òî÷åê
	end
	
	always @*
		case(RAMQ)
			8'hD8: ASCIIY = 0;		//Ø
			8'hF8: ASCIIY = 8'd1;	//ø
			8'hEB: ASCIIY = 8'd2;	//ë
			8'hEF: ASCIIY = 8'd3;	//ï
			8'hE8: ASCIIY = 8'd4;	//è
			default: ASCIIY = RAMQ;
		endcase

	//ÎÇÓ					//7ð.						//8ð.
	LCDRAM RAM(.q(RAMQ), .address({CGInitY, CTAdrQ}), .data(8'd0), .wren(1'd0),	.clock(TCQ));
endmodule
