/*
Autor: Jack0v
This project is a complete module for LCD1602 HD44780 (Latin alphabet only).
Source video 1/2:
			 2/2:
	!!!WARNING!!!
	This project was tested for EP4CE6E22C8 by QurtusII 9.1SP2.
	Before compiling, specify the pins of the your FPGA. Example:
	//(*chip_pin = "76"*) output reg TRSQ
*/
/*
�����: Jack0v
���� ������ �������� ����������� ������� ��� LCD1602 HD44780 (������ ��������� �������).
�������� ����� 1/2:
			   2/2:
	!!!��������!!!
	���� ������ ������������ ��� EP4CE6E22C8 � QurtusII 9.1SP2.
	����� ����������� ����� ������ ����� ����. ������:
	//(*chip_pin = "76"*) output reg TRSQ
*/
//(C) Jack0v, 2020
module LCD(	(*chip_pin = "00"*) output reg TRSQ,
			(*chip_pin = "00"*) output ENQ,
			(*chip_pin = "00, 00, 00, 00, 00, 00, 00, 00"*) output [7:0]DataY,
			(*chip_pin = "00"*) output RWY,
				(*chip_pin = "00"*) input C);
			/*
			(*chip_pin = "76"*) output reg TRSQ,
			(*chip_pin = "75"*) output ENQ,
			(*chip_pin = "77, 133, 80, 83, 84, 85, 86, 87"*) output [7:0]DataY,
			(*chip_pin = "74"*) output RWY,
				(*chip_pin = "23"*) input C
			*/

	assign RWY = 1'd0;
	///�������� �������-------------------------------------------------
	//����. ����� ���������� ���������� - 1,53��;
	//������ ����� ������� ���������� - 3;
	//����������� ������������ ����� = 1,53�� / 3� = 0,51��;
	//�������� ������� ���������� - 25��� (0,00004��);
	//����������� ��������-�������� = 0,51�� / 0,00004�� = 12750;
	//����������� ����������� �������� = lb12750 = 13,6382� = 14�;
	//������������ ����� ��������-�������� = 2^14 = 16384�;
	//���������� ������������ ����� = 0,00004�� * 16384� = 0,65536��;
	reg TCQ;
	reg [13:0]CTCQ;
	always @(posedge C)
	begin
		CTCQ <= CTCQ + 1'd1;
		if(&CTCQ[12:0]) TCQ <= !TCQ;
	end
	
	//��� ���������
	/*wire TCQ;
	assign TCQ = C;
	*/
	//\�������� �������-------------------------------------------------

	//����������� �������
	wire L0_REGDataY;
	wire L1_REGDataY;
	wire L2_REGDataY;
	wire L3_REGDataY;
	wire L4_REGDataY;
	wire L5_REGDataY;
	wire INC_CTAdrY;
	wire SH_REGENY;
	wire TRSY;
	//������ ���������
	reg [4:0]CTAdrQ;
	//reg TRSQ;
	reg [2:0]REGENQ;
	//wire ENQ;
	reg [7:0]REGDataQ;
	wire [7:0]RAMQ;
	//wire [7:0]DataY;

	LCDCD LCDCD(//����������� �������
				.L0_REGDataY(L0_REGDataY),
				.L1_REGDataY(L1_REGDataY),
				.L2_REGDataY(L2_REGDataY),
				.L3_REGDataY(L3_REGDataY),
				.L4_REGDataY(L4_REGDataY),
				.L5_REGDataY(L5_REGDataY),
				.INC_CTAdrY(INC_CTAdrY),
				.SH_REGENY(SH_REGENY),
				.TRSY(TRSY),
					//��������������� �������
					.REGENb0(REGENQ[0]),
					.REGENb2(REGENQ[2]),
					.CTAdrEqMAX(&CTAdrQ),
					.CTAdrb3_b0Eq15(CTAdrQ[3:0] == 4'd15),
						.C(TCQ));

	assign DataY = TRSQ? RAMQ : REGDataQ;
	assign ENQ = REGENQ[0];

	initial REGENQ <= 3'b100;
	always @(posedge TCQ)
	begin
		//�� ������
		//����. ����� �������� ����� ������� ���������� ��� ������������� - 15��;
		//����������� �������� = 15�� / 0,65536�� = 22,89;
		//����������� ����������� �������� lb22,89 = 4,517� = 5�;
		//������������ ����� �������� = 2^5 = 32�, ��� 32� * 0,65536�� = 20,97152��;
		if(INC_CTAdrY) CTAdrQ <= CTAdrQ + 1'd1;
		//������� ������� RS
		TRSQ <= TRSY;
		//������� ������� EN
		if(SH_REGENY) REGENQ <= {REGENQ[0], REGENQ[2:1]};
		//���							 //7 6 5 4  3 2 1  0
										 //		 DL N F
		if	   (L0_REGDataY)REGDataQ <= 8'b0_0_1_1__1_0_x__x; //��������� ����������: DL-8�.����, N-2������, F-5x8�����
										 //			  D C  B	
		else if(L1_REGDataY)REGDataQ <= 8'b0_0_0_0__1_0_0__0; //���������� ��������: D-����.����., C-����.������, B-�����.
		else if(L2_REGDataY)REGDataQ <= 8'b0_0_0_0__0_0_0__1; //������� �������
										 //			   I/D SH	
		else if(L3_REGDataY)REGDataQ <= 8'b0_0_0_0__0_1_1__0; //��������� ������ �����: I/D-����.������, SH-������.����.
										 //			  D C  B
		else if(L4_REGDataY)REGDataQ <= 8'b0_0_0_0__1_1_0__0; //���������� ��������: D-���.����., C-����.������, B-�����.
		else if(L5_REGDataY)REGDataQ <= {1'b1, CTAdrQ[4], 2'b00, CTAdrQ[3:0]}; //��������� ������ DDRAM
		
	end

	//���					//5�.				//8�.
	LCDRAM RAM(.q(RAMQ), .address(CTAdrQ), .data(8'd0), .wren(1'd0), .clock(TCQ));
endmodule