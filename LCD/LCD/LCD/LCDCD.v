module LCDCD(
		//управляющие сигналы
		output reg TRSY,
		output reg SH_REGENY,
		output reg INC_CTAdrY,
		output reg L5_REGDataY,
		output reg L4_REGDataY,
		output reg L3_REGDataY,
		output reg L2_REGDataY,
		output reg L1_REGDataY,
		output reg L0_REGDataY,
			//осведомительные сигналы
			input REGENb0,
			input CTAdrb3_b0Eq15,
			input REGENb2,
			input CTAdrEqMAX,
				input C);
	parameter	a0  = 0 , a1  = 1 , a2  = 2 , a3  = 3 ,
				a4  = 4 , a5  = 5 , a6  = 6 , a7  = 7 ,
				a8  = 8 , a9  = 9 , a10 = 10, a11 = 11,
				a12 = 12, a13 = 13, a14 = 14, a15 = 15;
	reg [3:0]a;
	reg [3:0]CombLogic;

	always @(posedge C) a <= CombLogic;

	always @(*)
	begin
		case(a)
			a0:
			begin
				if(!CTAdrEqMAX)
				begin	//0
					CombLogic = a0;
					TRSY = 0;
					SH_REGENY = 0;
					INC_CTAdrY = 1;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
				end
					else if(CTAdrEqMAX)
					begin	//1
						CombLogic = a1;
						TRSY = 0;
						SH_REGENY = 1;
						INC_CTAdrY = 1;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 1;
					end
						else
						begin
							CombLogic = a0;
							TRSY = 0;
							SH_REGENY = 0;
							INC_CTAdrY = 0;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
						end
			end
			a1:
			begin
				if(!REGENb2)
				begin	//2
					CombLogic = a1;
					TRSY = 0;
					SH_REGENY = 1;
					INC_CTAdrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
				end
					else if(REGENb2)
					begin	//3
						CombLogic = a2;
						TRSY = 0;
						SH_REGENY = 1;
						INC_CTAdrY = 0;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 0;
					end
						else
						begin
							CombLogic = a0;
							TRSY = 0;
							SH_REGENY = 0;
							INC_CTAdrY = 0;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
						end
			end
			a2:
			begin
				if(!CTAdrEqMAX)
				begin	//4
					CombLogic = a2;
					TRSY = 0;
					SH_REGENY = 0;
					INC_CTAdrY = 1;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
				end
					else if(CTAdrEqMAX)
					begin	//5
						CombLogic = a3;
						TRSY = 0;
						SH_REGENY = 1;
						INC_CTAdrY = 1;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 1;
					end
						else
						begin
							CombLogic = a0;
							TRSY = 0;
							SH_REGENY = 0;
							INC_CTAdrY = 0;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
						end
			end
			a3:
			begin
				if(!REGENb2)
				begin	//6
					CombLogic = a3;
					TRSY = 0;
					SH_REGENY = 1;
					INC_CTAdrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
				end
					else if(REGENb2)
					begin	//7
						CombLogic = a4;
						TRSY = 0;
						SH_REGENY = 1;
						INC_CTAdrY = 0;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 0;
					end
						else
						begin
							CombLogic = a0;
							TRSY = 0;
							SH_REGENY = 0;
							INC_CTAdrY = 0;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
						end
			end
			a4:
			begin
				if(!CTAdrEqMAX)
				begin	//8
					CombLogic = a4;
					TRSY = 0;
					SH_REGENY = 0;
					INC_CTAdrY = 1;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
				end
					else if(CTAdrEqMAX)
					begin	//9
						CombLogic = a5;
						TRSY = 0;
						SH_REGENY = 1;
						INC_CTAdrY = 1;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 1;
					end
						else
						begin
							CombLogic = a0;
							TRSY = 0;
							SH_REGENY = 0;
							INC_CTAdrY = 0;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
						end
			end
			a5:
			begin
				if(!REGENb2)
				begin	//10
					CombLogic = a5;
					TRSY = 0;
					SH_REGENY = 1;
					INC_CTAdrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
				end
					else if(REGENb2)
					begin	//11
						CombLogic = a6;
						TRSY = 0;
						SH_REGENY = 1;
						INC_CTAdrY = 0;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 1;
					end
						else
						begin
							CombLogic = a0;
							TRSY = 0;
							SH_REGENY = 0;
							INC_CTAdrY = 0;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
						end
			end
			a6:
			begin
				if(!REGENb2)
				begin	//12
					CombLogic = a6;
					TRSY = 0;
					SH_REGENY = 1;
					INC_CTAdrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
				end
					else if(REGENb2)
					begin	//13
						CombLogic = a7;
						TRSY = 0;
						SH_REGENY = 1;
						INC_CTAdrY = 0;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 1;
						L0_REGDataY = 0;
					end
						else
						begin
							CombLogic = a0;
							TRSY = 0;
							SH_REGENY = 0;
							INC_CTAdrY = 0;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
						end
			end
			a7:
			begin
				if(!REGENb2)
				begin	//14
					CombLogic = a7;
					TRSY = 0;
					SH_REGENY = 1;
					INC_CTAdrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
				end
					else if(REGENb2)
					begin	//15
						CombLogic = a8;
						TRSY = 0;
						SH_REGENY = 1;
						INC_CTAdrY = 0;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 1;
						L1_REGDataY = 0;
						L0_REGDataY = 0;
					end
						else
						begin
							CombLogic = a0;
							TRSY = 0;
							SH_REGENY = 0;
							INC_CTAdrY = 0;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
						end
			end
			a8:
			begin
				if(!REGENb2)
				begin	//16
					CombLogic = a8;
					TRSY = 0;
					SH_REGENY = 1;
					INC_CTAdrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
				end
					else if(REGENb2)
					begin	//17
						CombLogic = a9;
						TRSY = 0;
						SH_REGENY = 1;
						INC_CTAdrY = 0;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 1;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 0;
					end
						else
						begin
							CombLogic = a0;
							TRSY = 0;
							SH_REGENY = 0;
							INC_CTAdrY = 0;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
						end
			end
			a9:
			begin
				if(!REGENb2)
				begin	//18
					CombLogic = a9;
					TRSY = 0;
					SH_REGENY = 1;
					INC_CTAdrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
				end
					else if(REGENb2)
					begin	//19
						CombLogic = a10;
						TRSY = 0;
						SH_REGENY = 1;
						INC_CTAdrY = 0;
						L5_REGDataY = 0;
						L4_REGDataY = 1;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 0;
					end
						else
						begin
							CombLogic = a0;
							TRSY = 0;
							SH_REGENY = 0;
							INC_CTAdrY = 0;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
						end
			end
			a10:
			begin
				if(!REGENb2)
				begin	//20
					CombLogic = a10;
					TRSY = 0;
					SH_REGENY = 1;
					INC_CTAdrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
				end
					else if(REGENb2)
					begin	//21
						CombLogic = a11;
						TRSY = 0;
						SH_REGENY = 1;
						INC_CTAdrY = 0;
						L5_REGDataY = 1;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 0;
					end
						else
						begin
							CombLogic = a0;
							TRSY = 0;
							SH_REGENY = 0;
							INC_CTAdrY = 0;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
						end
			end
			a11:
			begin
				if(!REGENb2)
				begin	//22
					CombLogic = a11;
					TRSY = 0;
					SH_REGENY = 1;
					INC_CTAdrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
				end
					else if(REGENb2)
					begin	//23
						CombLogic = a12;
						TRSY = 1;
						SH_REGENY = 1;
						INC_CTAdrY = 0;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 0;
					end
						else
						begin
							CombLogic = a0;
							TRSY = 0;
							SH_REGENY = 0;
							INC_CTAdrY = 0;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
						end
			end
			a12:
			begin
				if(!REGENb0)
				begin	//24
					CombLogic = a12;
					TRSY = 1;
					SH_REGENY = 1;
					INC_CTAdrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
				end
					else if(REGENb0 && !CTAdrb3_b0Eq15)
					begin	//25
						CombLogic = a12;
						TRSY = 1;
						SH_REGENY = 1;
						INC_CTAdrY = 1;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 0;
					end
						else if(REGENb0 && CTAdrb3_b0Eq15)
						begin	//26
							CombLogic = a13;
							TRSY = 1;
							SH_REGENY = 1;
							INC_CTAdrY = 1;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
						end
							else
							begin
								CombLogic = a0;
								TRSY = 0;
								SH_REGENY = 0;
								INC_CTAdrY = 0;
								L5_REGDataY = 0;
								L4_REGDataY = 0;
								L3_REGDataY = 0;
								L2_REGDataY = 0;
								L1_REGDataY = 0;
								L0_REGDataY = 0;
							end
			end
			a13:
			begin	//27
				CombLogic = a11;
				TRSY = 0;
				SH_REGENY = 1;
				INC_CTAdrY = 0;
				L5_REGDataY = 1;
				L4_REGDataY = 0;
				L3_REGDataY = 0;
				L2_REGDataY = 0;
				L1_REGDataY = 0;
				L0_REGDataY = 0;
			end
			default:
			begin
				CombLogic = a0;
				TRSY = 0;
				SH_REGENY = 0;
				INC_CTAdrY = 0;
				L5_REGDataY = 0;
				L4_REGDataY = 0;
				L3_REGDataY = 0;
				L2_REGDataY = 0;
				L1_REGDataY = 0;
				L0_REGDataY = 0;
			end
		endcase
	end
endmodule