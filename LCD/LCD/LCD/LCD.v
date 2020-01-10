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
Автор: Jack0v
Этот проект является завершённым модулем для LCD1602 HD44780 (только латинский алфавит).
Исходное видео 1/2:
			   2/2:
	!!!ВНИМАНИЕ!!!
	Этот проект тестировался под EP4CE6E22C8 в QurtusII 9.1SP2.
	Перед компиляцией укажи выводы своей ПЛИС. Пример:
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
	///Делитель частоты-------------------------------------------------
	//Макс. время исполнения инструкции - 1,53мс;
	//Тактов между записью инструкций - 3;
	//Необходимая длительность такта = 1,53мс / 3т = 0,51мс;
	//Тактовая частота генератора - 25МГц (0,00004мс);
	//Коэффициент счётчика-делителя = 0,51мс / 0,00004мс = 12750;
	//Необходимая разрядность счётчика = lb12750 = 13,6382р = 14р;
	//Длительность счёта счётчика-делителя = 2^14 = 16384т;
	//Полученная длительность такта = 0,00004мс * 16384т = 0,65536мс;
	reg TCQ;
	reg [13:0]CTCQ;
	always @(posedge C)
	begin
		CTCQ <= CTCQ + 1'd1;
		if(&CTCQ[12:0]) TCQ <= !TCQ;
	end
	
	//для симуляции
	/*wire TCQ;
	assign TCQ = C;
	*/
	//\Делитель частоты-------------------------------------------------

	//управляющие сигналы
	wire L0_REGDataY;
	wire L1_REGDataY;
	wire L2_REGDataY;
	wire L3_REGDataY;
	wire L4_REGDataY;
	wire L5_REGDataY;
	wire INC_CTAdrY;
	wire SH_REGENY;
	wire TRSY;
	//выходы устройств
	reg [4:0]CTAdrQ;
	//reg TRSQ;
	reg [2:0]REGENQ;
	//wire ENQ;
	reg [7:0]REGDataQ;
	wire [7:0]RAMQ;
	//wire [7:0]DataY;

	LCDCD LCDCD(//управляющие сигналы
				.L0_REGDataY(L0_REGDataY),
				.L1_REGDataY(L1_REGDataY),
				.L2_REGDataY(L2_REGDataY),
				.L3_REGDataY(L3_REGDataY),
				.L4_REGDataY(L4_REGDataY),
				.L5_REGDataY(L5_REGDataY),
				.INC_CTAdrY(INC_CTAdrY),
				.SH_REGENY(SH_REGENY),
				.TRSY(TRSY),
					//осведомительные сигналы
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
		//СЧ адреса
		//Макс. время выдержки между записью инструкций при инициализации - 15мс;
		//Коэффициент счётчика = 15мс / 0,65536мс = 22,89;
		//Необходимая разрядность счётчика lb22,89 = 4,517р = 5р;
		//Длительность счёта счётчика = 2^5 = 32т, или 32т * 0,65536мс = 20,97152мс;
		if(INC_CTAdrY) CTAdrQ <= CTAdrQ + 1'd1;
		//Триггер сигнала RS
		TRSQ <= TRSY;
		//Регистр сигнала EN
		if(SH_REGENY) REGENQ <= {REGENQ[0], REGENQ[2:1]};
		//РЕГ							 //7 6 5 4  3 2 1  0
										 //		 DL N F
		if	   (L0_REGDataY)REGDataQ <= 8'b0_0_1_1__1_0_x__x; //Настройка параметров: DL-8р.шина, N-2строки, F-5x8точек
										 //			  D C  B	
		else if(L1_REGDataY)REGDataQ <= 8'b0_0_0_0__1_0_0__0; //Управление дисплеем: D-откл.дисп., C-откл.курсор, B-немиг.
		else if(L2_REGDataY)REGDataQ <= 8'b0_0_0_0__0_0_0__1; //Очистка дисплея
										 //			   I/D SH	
		else if(L3_REGDataY)REGDataQ <= 8'b0_0_0_0__0_1_1__0; //Установка режима ввода: I/D-инкр.адреса, SH-недвиг.дисп.
										 //			  D C  B
		else if(L4_REGDataY)REGDataQ <= 8'b0_0_0_0__1_1_0__0; //Управление дисплеем: D-вкл.дисп., C-откл.курсор, B-немиг.
		else if(L5_REGDataY)REGDataQ <= {1'b1, CTAdrQ[4], 2'b00, CTAdrQ[3:0]}; //Установка адреса DDRAM
		
	end

	//ОЗУ					//5р.				//8р.
	LCDRAM RAM(.q(RAMQ), .address(CTAdrQ), .data(8'd0), .wren(1'd0), .clock(TCQ));
endmodule