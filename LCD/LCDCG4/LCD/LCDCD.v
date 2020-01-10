module LCDCD(
		//управляющие сигналы
		output reg SH_REGENY,
		output reg L7_REGDataY,
		output reg TRSY,
		output reg CGInitY,
		output reg LoadSymbY,
		output reg INC_CTAdrY,
		output reg T_TTetrY,
		output reg L5_REGDataY,
		output reg L4_REGDataY,
		output reg L3_REGDataY,
		output reg L2_REGDataY,
		output reg L1_REGDataY,
		output reg L0_REGDataY,
		output reg L6_REGDataY,
			//осведомительные сигналы
			input TTetr,
			input REGENb2,
			input CTAdrEq31,
			input REGENb0,
			input CTAdrb3_b0Eq15,
			input CTAdrEq0,
				input C);
	parameter	a0  = 0 , a1  = 1 , a2  = 2 , a3  = 3 ,
				a4  = 4 , a5  = 5 , a6  = 6 , a7  = 7 ,
				a8  = 8 , a9  = 9 , a10 = 10, a11 = 11,
				a12 = 12, a13 = 13, a14 = 14, a15 = 15,
				a16 = 16;
	reg [4:0]a;
	reg [4:0]CombLogic;

	always @(posedge C) a <= CombLogic;

	always @(*)
	begin
		case(a)
			a0:
			begin
				if(!CTAdrEq31)
				begin	//0
					CombLogic = a0;
					SH_REGENY = 0;
					L7_REGDataY = 0;
					TRSY = 0;
					CGInitY = 0;
					LoadSymbY = 0;
					INC_CTAdrY = 1;
					T_TTetrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
					L6_REGDataY = 0;
				end
					else if(CTAdrEq31)
					begin	//1
						CombLogic = a1;
						SH_REGENY = 1;
						L7_REGDataY = 0;
						TRSY = 0;
						CGInitY = 0;
						LoadSymbY = 0;
						INC_CTAdrY = 1;
						T_TTetrY = 0;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 1;
						L6_REGDataY = 0;
					end
						else
						begin
							CombLogic = a0;
							SH_REGENY = 0;
							L7_REGDataY = 0;
							TRSY = 0;
							CGInitY = 0;
							LoadSymbY = 0;
							INC_CTAdrY = 0;
							T_TTetrY = 0;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
							L6_REGDataY = 0;
						end
			end
			a1:
			begin
				if(!REGENb2)
				begin	//2
					CombLogic = a1;
					SH_REGENY = 1;
					L7_REGDataY = 0;
					TRSY = 0;
					CGInitY = 0;
					LoadSymbY = 0;
					INC_CTAdrY = 0;
					T_TTetrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
					L6_REGDataY = 0;
				end
					else if(REGENb2)
					begin	//3
						CombLogic = a2;
						SH_REGENY = 1;
						L7_REGDataY = 0;
						TRSY = 0;
						CGInitY = 0;
						LoadSymbY = 0;
						INC_CTAdrY = 1;
						T_TTetrY = 0;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 0;
						L6_REGDataY = 0;
					end
						else
						begin
							CombLogic = a0;
							SH_REGENY = 0;
							L7_REGDataY = 0;
							TRSY = 0;
							CGInitY = 0;
							LoadSymbY = 0;
							INC_CTAdrY = 0;
							T_TTetrY = 0;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
							L6_REGDataY = 0;
						end
			end
			a2:
			begin
				if(!CTAdrEq31)
				begin	//4
					CombLogic = a2;
					SH_REGENY = 0;
					L7_REGDataY = 0;
					TRSY = 0;
					CGInitY = 0;
					LoadSymbY = 0;
					INC_CTAdrY = 1;
					T_TTetrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
					L6_REGDataY = 0;
				end
					else if(CTAdrEq31)
					begin	//5
						CombLogic = a3;
						SH_REGENY = 1;
						L7_REGDataY = 0;
						TRSY = 0;
						CGInitY = 0;
						LoadSymbY = 0;
						INC_CTAdrY = 1;
						T_TTetrY = 0;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 1;
						L6_REGDataY = 0;
					end
						else
						begin
							CombLogic = a0;
							SH_REGENY = 0;
							L7_REGDataY = 0;
							TRSY = 0;
							CGInitY = 0;
							LoadSymbY = 0;
							INC_CTAdrY = 0;
							T_TTetrY = 0;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
							L6_REGDataY = 0;
						end
			end
			a3:
			begin
				if(!REGENb2)
				begin	//6
					CombLogic = a3;
					SH_REGENY = 1;
					L7_REGDataY = 0;
					TRSY = 0;
					CGInitY = 0;
					LoadSymbY = 0;
					INC_CTAdrY = 0;
					T_TTetrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
					L6_REGDataY = 0;
				end
					else if(REGENb2)
					begin	//7
						CombLogic = a4;
						SH_REGENY = 1;
						L7_REGDataY = 0;
						TRSY = 0;
						CGInitY = 0;
						LoadSymbY = 0;
						INC_CTAdrY = 0;
						T_TTetrY = 0;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 0;
						L6_REGDataY = 0;
					end
						else
						begin
							CombLogic = a0;
							SH_REGENY = 0;
							L7_REGDataY = 0;
							TRSY = 0;
							CGInitY = 0;
							LoadSymbY = 0;
							INC_CTAdrY = 0;
							T_TTetrY = 0;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
							L6_REGDataY = 0;
						end
			end
			a4:
			begin
				if(!CTAdrEq31)
				begin	//8
					CombLogic = a4;
					SH_REGENY = 0;
					L7_REGDataY = 0;
					TRSY = 0;
					CGInitY = 0;
					LoadSymbY = 0;
					INC_CTAdrY = 1;
					T_TTetrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
					L6_REGDataY = 0;
				end
					else if(CTAdrEq31)
					begin	//9
						CombLogic = a5;
						SH_REGENY = 1;
						L7_REGDataY = 0;
						TRSY = 0;
						CGInitY = 0;
						LoadSymbY = 0;
						INC_CTAdrY = 1;
						T_TTetrY = 0;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 1;
						L6_REGDataY = 0;
					end
						else
						begin
							CombLogic = a0;
							SH_REGENY = 0;
							L7_REGDataY = 0;
							TRSY = 0;
							CGInitY = 0;
							LoadSymbY = 0;
							INC_CTAdrY = 0;
							T_TTetrY = 0;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
							L6_REGDataY = 0;
						end
			end
			a5:
			begin
				if(!REGENb2)
				begin	//10
					CombLogic = a5;
					SH_REGENY = 1;
					L7_REGDataY = 0;
					TRSY = 0;
					CGInitY = 0;
					LoadSymbY = 0;
					INC_CTAdrY = 0;
					T_TTetrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
					L6_REGDataY = 0;
				end
					else if(REGENb2)
					begin	//11
						CombLogic = a6;
						SH_REGENY = 1;
						L7_REGDataY = 1;
						TRSY = 0;
						CGInitY = 0;
						LoadSymbY = 0;
						INC_CTAdrY = 0;
						T_TTetrY = 0;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 0;
						L6_REGDataY = 0;
					end
						else
						begin
							CombLogic = a0;
							SH_REGENY = 0;
							L7_REGDataY = 0;
							TRSY = 0;
							CGInitY = 0;
							LoadSymbY = 0;
							INC_CTAdrY = 0;
							T_TTetrY = 0;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
							L6_REGDataY = 0;
						end
			end
			a6:
			begin
				if(!REGENb2)
				begin	//12
					CombLogic = a6;
					SH_REGENY = 1;
					L7_REGDataY = 0;
					TRSY = 0;
					CGInitY = 0;
					LoadSymbY = 0;
					INC_CTAdrY = 0;
					T_TTetrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
					L6_REGDataY = 0;
				end
					else if(REGENb2)
					begin	//13
						CombLogic = a7;
						SH_REGENY = 1;
						L7_REGDataY = 1;
						TRSY = 0;
						CGInitY = 0;
						LoadSymbY = 0;
						INC_CTAdrY = 0;
						T_TTetrY = 0;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 0;
						L6_REGDataY = 0;
					end
						else
						begin
							CombLogic = a0;
							SH_REGENY = 0;
							L7_REGDataY = 0;
							TRSY = 0;
							CGInitY = 0;
							LoadSymbY = 0;
							INC_CTAdrY = 0;
							T_TTetrY = 0;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
							L6_REGDataY = 0;
						end
			end
			a7:
			begin
				if(!REGENb2)
				begin	//14
					CombLogic = a7;
					SH_REGENY = 1;
					L7_REGDataY = 0;
					TRSY = 0;
					CGInitY = 0;
					LoadSymbY = 0;
					INC_CTAdrY = 0;
					T_TTetrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
					L6_REGDataY = 0;
				end
					else if(!TTetr && REGENb2)
					begin	//15
						CombLogic = a7;
						SH_REGENY = 1;
						L7_REGDataY = 0;
						TRSY = 0;
						CGInitY = 0;
						LoadSymbY = 0;
						INC_CTAdrY = 0;
						T_TTetrY = 1;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 0;
						L6_REGDataY = 0;
					end
						else if(TTetr && REGENb2)
						begin	//16
							CombLogic = a8;
							SH_REGENY = 1;
							L7_REGDataY = 0;
							TRSY = 0;
							CGInitY = 0;
							LoadSymbY = 0;
							INC_CTAdrY = 0;
							T_TTetrY = 1;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 1;
							L0_REGDataY = 0;
							L6_REGDataY = 0;
						end
							else
							begin
								CombLogic = a0;
								SH_REGENY = 0;
								L7_REGDataY = 0;
								TRSY = 0;
								CGInitY = 0;
								LoadSymbY = 0;
								INC_CTAdrY = 0;
								T_TTetrY = 0;
								L5_REGDataY = 0;
								L4_REGDataY = 0;
								L3_REGDataY = 0;
								L2_REGDataY = 0;
								L1_REGDataY = 0;
								L0_REGDataY = 0;
								L6_REGDataY = 0;
							end
			end
			a8:
			begin
				if(!REGENb2)
				begin	//17
					CombLogic = a8;
					SH_REGENY = 1;
					L7_REGDataY = 0;
					TRSY = 0;
					CGInitY = 0;
					LoadSymbY = 0;
					INC_CTAdrY = 0;
					T_TTetrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
					L6_REGDataY = 0;
				end
					else if(!TTetr && REGENb2)
					begin	//18
						CombLogic = a8;
						SH_REGENY = 1;
						L7_REGDataY = 0;
						TRSY = 0;
						CGInitY = 0;
						LoadSymbY = 0;
						INC_CTAdrY = 0;
						T_TTetrY = 1;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 0;
						L6_REGDataY = 0;
					end
						else if(TTetr && REGENb2)
						begin	//19
							CombLogic = a9;
							SH_REGENY = 1;
							L7_REGDataY = 0;
							TRSY = 0;
							CGInitY = 0;
							LoadSymbY = 0;
							INC_CTAdrY = 0;
							T_TTetrY = 1;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 1;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
							L6_REGDataY = 0;
						end
							else
							begin
								CombLogic = a0;
								SH_REGENY = 0;
								L7_REGDataY = 0;
								TRSY = 0;
								CGInitY = 0;
								LoadSymbY = 0;
								INC_CTAdrY = 0;
								T_TTetrY = 0;
								L5_REGDataY = 0;
								L4_REGDataY = 0;
								L3_REGDataY = 0;
								L2_REGDataY = 0;
								L1_REGDataY = 0;
								L0_REGDataY = 0;
								L6_REGDataY = 0;
							end
			end
			a9:
			begin
				if(!REGENb2)
				begin	//20
					CombLogic = a9;
					SH_REGENY = 1;
					L7_REGDataY = 0;
					TRSY = 0;
					CGInitY = 0;
					LoadSymbY = 0;
					INC_CTAdrY = 0;
					T_TTetrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
					L6_REGDataY = 0;
				end
					else if(!TTetr && REGENb2)
					begin	//21
						CombLogic = a9;
						SH_REGENY = 1;
						L7_REGDataY = 0;
						TRSY = 0;
						CGInitY = 0;
						LoadSymbY = 0;
						INC_CTAdrY = 0;
						T_TTetrY = 1;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 0;
						L6_REGDataY = 0;
					end
						else if(TTetr && REGENb2)
						begin	//22
							CombLogic = a10;
							SH_REGENY = 1;
							L7_REGDataY = 0;
							TRSY = 0;
							CGInitY = 0;
							LoadSymbY = 0;
							INC_CTAdrY = 0;
							T_TTetrY = 1;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 1;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
							L6_REGDataY = 0;
						end
							else
							begin
								CombLogic = a0;
								SH_REGENY = 0;
								L7_REGDataY = 0;
								TRSY = 0;
								CGInitY = 0;
								LoadSymbY = 0;
								INC_CTAdrY = 0;
								T_TTetrY = 0;
								L5_REGDataY = 0;
								L4_REGDataY = 0;
								L3_REGDataY = 0;
								L2_REGDataY = 0;
								L1_REGDataY = 0;
								L0_REGDataY = 0;
								L6_REGDataY = 0;
							end
			end
			a10:
			begin
				if(!REGENb2)
				begin	//23
					CombLogic = a10;
					SH_REGENY = 1;
					L7_REGDataY = 0;
					TRSY = 0;
					CGInitY = 0;
					LoadSymbY = 0;
					INC_CTAdrY = 0;
					T_TTetrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
					L6_REGDataY = 0;
				end
					else if(!TTetr && REGENb2)
					begin	//24
						CombLogic = a10;
						SH_REGENY = 1;
						L7_REGDataY = 0;
						TRSY = 0;
						CGInitY = 0;
						LoadSymbY = 0;
						INC_CTAdrY = 0;
						T_TTetrY = 1;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 0;
						L6_REGDataY = 0;
					end
						else if(TTetr && REGENb2)
						begin	//25
							CombLogic = a11;
							SH_REGENY = 1;
							L7_REGDataY = 0;
							TRSY = 0;
							CGInitY = 0;
							LoadSymbY = 0;
							INC_CTAdrY = 0;
							T_TTetrY = 1;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
							L6_REGDataY = 1;
						end
							else
							begin
								CombLogic = a0;
								SH_REGENY = 0;
								L7_REGDataY = 0;
								TRSY = 0;
								CGInitY = 0;
								LoadSymbY = 0;
								INC_CTAdrY = 0;
								T_TTetrY = 0;
								L5_REGDataY = 0;
								L4_REGDataY = 0;
								L3_REGDataY = 0;
								L2_REGDataY = 0;
								L1_REGDataY = 0;
								L0_REGDataY = 0;
								L6_REGDataY = 0;
							end
			end
			a11:
			begin
				if(!REGENb2)
				begin	//26
					CombLogic = a11;
					SH_REGENY = 1;
					L7_REGDataY = 0;
					TRSY = 0;
					CGInitY = 0;
					LoadSymbY = 0;
					INC_CTAdrY = 0;
					T_TTetrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
					L6_REGDataY = 0;
				end
					else if(!TTetr && REGENb2)
					begin	//27
						CombLogic = a11;
						SH_REGENY = 1;
						L7_REGDataY = 0;
						TRSY = 0;
						CGInitY = 0;
						LoadSymbY = 0;
						INC_CTAdrY = 0;
						T_TTetrY = 1;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 0;
						L6_REGDataY = 0;
					end
						else if(TTetr && REGENb2)
						begin	//28
							CombLogic = a12;
							SH_REGENY = 1;
							L7_REGDataY = 0;
							TRSY = 1;
							CGInitY = 1;
							LoadSymbY = 0;
							INC_CTAdrY = 0;
							T_TTetrY = 1;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
							L6_REGDataY = 0;
						end
							else
							begin
								CombLogic = a0;
								SH_REGENY = 0;
								L7_REGDataY = 0;
								TRSY = 0;
								CGInitY = 0;
								LoadSymbY = 0;
								INC_CTAdrY = 0;
								T_TTetrY = 0;
								L5_REGDataY = 0;
								L4_REGDataY = 0;
								L3_REGDataY = 0;
								L2_REGDataY = 0;
								L1_REGDataY = 0;
								L0_REGDataY = 0;
								L6_REGDataY = 0;
							end
			end
			a12:
			begin
				if(!TTetr && REGENb2 && !REGENb0)
				begin	//29
					CombLogic = a12;
					SH_REGENY = 1;
					L7_REGDataY = 0;
					TRSY = 1;
					CGInitY = 1;
					LoadSymbY = 1;
					INC_CTAdrY = 0;
					T_TTetrY = 1;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
					L6_REGDataY = 0;
				end
					else if(!TTetr && REGENb0)
					begin	//30
						CombLogic = a12;
						SH_REGENY = 1;
						L7_REGDataY = 0;
						TRSY = 1;
						CGInitY = 1;
						LoadSymbY = 1;
						INC_CTAdrY = 0;
						T_TTetrY = 0;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 0;
						L6_REGDataY = 0;
					end
						else if(TTetr && REGENb0)
						begin	//31
							CombLogic = a12;
							SH_REGENY = 1;
							L7_REGDataY = 0;
							TRSY = 1;
							CGInitY = 1;
							LoadSymbY = 1;
							INC_CTAdrY = 1;
							T_TTetrY = 0;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
							L6_REGDataY = 0;
						end
							else if(!REGENb2 && !REGENb0)
							begin	//32
								CombLogic = a12;
								SH_REGENY = 1;
								L7_REGDataY = 0;
								TRSY = 1;
								CGInitY = 1;
								LoadSymbY = 1;
								INC_CTAdrY = 0;
								T_TTetrY = 0;
								L5_REGDataY = 0;
								L4_REGDataY = 0;
								L3_REGDataY = 0;
								L2_REGDataY = 0;
								L1_REGDataY = 0;
								L0_REGDataY = 0;
								L6_REGDataY = 0;
							end
								else if(TTetr && REGENb2 && !REGENb0 && !CTAdrEq0)
								begin	//33
									CombLogic = a12;
									SH_REGENY = 1;
									L7_REGDataY = 0;
									TRSY = 1;
									CGInitY = 1;
									LoadSymbY = 1;
									INC_CTAdrY = 0;
									T_TTetrY = 1;
									L5_REGDataY = 0;
									L4_REGDataY = 0;
									L3_REGDataY = 0;
									L2_REGDataY = 0;
									L1_REGDataY = 0;
									L0_REGDataY = 0;
									L6_REGDataY = 0;
								end
									else if(TTetr && REGENb2 && !REGENb0 && CTAdrEq0)
									begin	//34
										CombLogic = a13;
										SH_REGENY = 1;
										L7_REGDataY = 0;
										TRSY = 0;
										CGInitY = 0;
										LoadSymbY = 1;
										INC_CTAdrY = 0;
										T_TTetrY = 1;
										L5_REGDataY = 0;
										L4_REGDataY = 1;
										L3_REGDataY = 0;
										L2_REGDataY = 0;
										L1_REGDataY = 0;
										L0_REGDataY = 0;
										L6_REGDataY = 0;
									end
										else
										begin
											CombLogic = a0;
											SH_REGENY = 0;
											L7_REGDataY = 0;
											TRSY = 0;
											CGInitY = 0;
											LoadSymbY = 0;
											INC_CTAdrY = 0;
											T_TTetrY = 0;
											L5_REGDataY = 0;
											L4_REGDataY = 0;
											L3_REGDataY = 0;
											L2_REGDataY = 0;
											L1_REGDataY = 0;
											L0_REGDataY = 0;
											L6_REGDataY = 0;
										end
			end
			a13:
			begin
				if(!REGENb2)
				begin	//35
					CombLogic = a13;
					SH_REGENY = 1;
					L7_REGDataY = 0;
					TRSY = 0;
					CGInitY = 0;
					LoadSymbY = 0;
					INC_CTAdrY = 0;
					T_TTetrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
					L6_REGDataY = 0;
				end
					else if(!TTetr && REGENb2)
					begin	//36
						CombLogic = a13;
						SH_REGENY = 1;
						L7_REGDataY = 0;
						TRSY = 0;
						CGInitY = 0;
						LoadSymbY = 0;
						INC_CTAdrY = 0;
						T_TTetrY = 1;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 0;
						L6_REGDataY = 0;
					end
						else if(TTetr && REGENb2)
						begin	//37
							CombLogic = a14;
							SH_REGENY = 1;
							L7_REGDataY = 0;
							TRSY = 0;
							CGInitY = 0;
							LoadSymbY = 0;
							INC_CTAdrY = 0;
							T_TTetrY = 1;
							L5_REGDataY = 1;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
							L6_REGDataY = 0;
						end
							else
							begin
								CombLogic = a0;
								SH_REGENY = 0;
								L7_REGDataY = 0;
								TRSY = 0;
								CGInitY = 0;
								LoadSymbY = 0;
								INC_CTAdrY = 0;
								T_TTetrY = 0;
								L5_REGDataY = 0;
								L4_REGDataY = 0;
								L3_REGDataY = 0;
								L2_REGDataY = 0;
								L1_REGDataY = 0;
								L0_REGDataY = 0;
								L6_REGDataY = 0;
							end
			end
			a14:
			begin
				if(!REGENb2)
				begin	//38
					CombLogic = a14;
					SH_REGENY = 1;
					L7_REGDataY = 0;
					TRSY = 0;
					CGInitY = 0;
					LoadSymbY = 0;
					INC_CTAdrY = 0;
					T_TTetrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
					L6_REGDataY = 0;
				end
					else if(!TTetr && REGENb2)
					begin	//39
						CombLogic = a14;
						SH_REGENY = 1;
						L7_REGDataY = 0;
						TRSY = 0;
						CGInitY = 0;
						LoadSymbY = 0;
						INC_CTAdrY = 0;
						T_TTetrY = 1;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 0;
						L6_REGDataY = 0;
					end
						else if(TTetr && REGENb2)
						begin	//40
							CombLogic = a15;
							SH_REGENY = 1;
							L7_REGDataY = 0;
							TRSY = 1;
							CGInitY = 0;
							LoadSymbY = 0;
							INC_CTAdrY = 0;
							T_TTetrY = 1;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
							L6_REGDataY = 0;
						end
							else
							begin
								CombLogic = a0;
								SH_REGENY = 0;
								L7_REGDataY = 0;
								TRSY = 0;
								CGInitY = 0;
								LoadSymbY = 0;
								INC_CTAdrY = 0;
								T_TTetrY = 0;
								L5_REGDataY = 0;
								L4_REGDataY = 0;
								L3_REGDataY = 0;
								L2_REGDataY = 0;
								L1_REGDataY = 0;
								L0_REGDataY = 0;
								L6_REGDataY = 0;
							end
			end
			a15:
			begin
				if(!TTetr && !REGENb2 && REGENb0)
				begin	//41
					CombLogic = a15;
					SH_REGENY = 1;
					L7_REGDataY = 0;
					TRSY = 1;
					CGInitY = 0;
					LoadSymbY = 0;
					INC_CTAdrY = 0;
					T_TTetrY = 0;
					L5_REGDataY = 0;
					L4_REGDataY = 0;
					L3_REGDataY = 0;
					L2_REGDataY = 0;
					L1_REGDataY = 0;
					L0_REGDataY = 0;
					L6_REGDataY = 0;
				end
					else if(REGENb2 && !REGENb0)
					begin	//42
						CombLogic = a15;
						SH_REGENY = 1;
						L7_REGDataY = 0;
						TRSY = 1;
						CGInitY = 0;
						LoadSymbY = 0;
						INC_CTAdrY = 0;
						T_TTetrY = 1;
						L5_REGDataY = 0;
						L4_REGDataY = 0;
						L3_REGDataY = 0;
						L2_REGDataY = 0;
						L1_REGDataY = 0;
						L0_REGDataY = 0;
						L6_REGDataY = 0;
					end
						else if(!TTetr && REGENb2 && REGENb0)
						begin	//43
							CombLogic = a15;
							SH_REGENY = 1;
							L7_REGDataY = 0;
							TRSY = 1;
							CGInitY = 0;
							LoadSymbY = 0;
							INC_CTAdrY = 0;
							T_TTetrY = 1;
							L5_REGDataY = 0;
							L4_REGDataY = 0;
							L3_REGDataY = 0;
							L2_REGDataY = 0;
							L1_REGDataY = 0;
							L0_REGDataY = 0;
							L6_REGDataY = 0;
						end
							else if(TTetr && REGENb2 && REGENb0 && !CTAdrb3_b0Eq15)
							begin	//44
								CombLogic = a15;
								SH_REGENY = 1;
								L7_REGDataY = 0;
								TRSY = 1;
								CGInitY = 0;
								LoadSymbY = 0;
								INC_CTAdrY = 1;
								T_TTetrY = 1;
								L5_REGDataY = 0;
								L4_REGDataY = 0;
								L3_REGDataY = 0;
								L2_REGDataY = 0;
								L1_REGDataY = 0;
								L0_REGDataY = 0;
								L6_REGDataY = 0;
							end
								else if(!REGENb2 && !REGENb0)
								begin	//45
									CombLogic = a15;
									SH_REGENY = 1;
									L7_REGDataY = 0;
									TRSY = 1;
									CGInitY = 0;
									LoadSymbY = 0;
									INC_CTAdrY = 0;
									T_TTetrY = 0;
									L5_REGDataY = 0;
									L4_REGDataY = 0;
									L3_REGDataY = 0;
									L2_REGDataY = 0;
									L1_REGDataY = 0;
									L0_REGDataY = 0;
									L6_REGDataY = 0;
								end
									else if(TTetr && !REGENb2 && REGENb0 && !CTAdrb3_b0Eq15)
									begin	//46
										CombLogic = a15;
										SH_REGENY = 1;
										L7_REGDataY = 0;
										TRSY = 1;
										CGInitY = 0;
										LoadSymbY = 0;
										INC_CTAdrY = 1;
										T_TTetrY = 0;
										L5_REGDataY = 0;
										L4_REGDataY = 0;
										L3_REGDataY = 0;
										L2_REGDataY = 0;
										L1_REGDataY = 0;
										L0_REGDataY = 0;
										L6_REGDataY = 0;
									end
										else if(TTetr && !REGENb2 && REGENb0 && CTAdrb3_b0Eq15)
										begin	//47
											CombLogic = a16;
											SH_REGENY = 1;
											L7_REGDataY = 0;
											TRSY = 1;
											CGInitY = 0;
											LoadSymbY = 0;
											INC_CTAdrY = 1;
											T_TTetrY = 0;
											L5_REGDataY = 0;
											L4_REGDataY = 0;
											L3_REGDataY = 0;
											L2_REGDataY = 0;
											L1_REGDataY = 0;
											L0_REGDataY = 0;
											L6_REGDataY = 0;
										end
											else if(TTetr && REGENb2 && REGENb0 && CTAdrb3_b0Eq15)
											begin	//48
												CombLogic = a16;
												SH_REGENY = 1;
												L7_REGDataY = 0;
												TRSY = 1;
												CGInitY = 0;
												LoadSymbY = 0;
												INC_CTAdrY = 1;
												T_TTetrY = 1;
												L5_REGDataY = 0;
												L4_REGDataY = 0;
												L3_REGDataY = 0;
												L2_REGDataY = 0;
												L1_REGDataY = 0;
												L0_REGDataY = 0;
												L6_REGDataY = 0;
											end
												else
												begin
													CombLogic = a0;
													SH_REGENY = 0;
													L7_REGDataY = 0;
													TRSY = 0;
													CGInitY = 0;
													LoadSymbY = 0;
													INC_CTAdrY = 0;
													T_TTetrY = 0;
													L5_REGDataY = 0;
													L4_REGDataY = 0;
													L3_REGDataY = 0;
													L2_REGDataY = 0;
													L1_REGDataY = 0;
													L0_REGDataY = 0;
													L6_REGDataY = 0;
												end
			end
			a16:
			begin	//49
				CombLogic = a14;
				SH_REGENY = 1;
				L7_REGDataY = 0;
				TRSY = 0;
				CGInitY = 0;
				LoadSymbY = 0;
				INC_CTAdrY = 0;
				T_TTetrY = 1;
				L5_REGDataY = 1;
				L4_REGDataY = 0;
				L3_REGDataY = 0;
				L2_REGDataY = 0;
				L1_REGDataY = 0;
				L0_REGDataY = 0;
				L6_REGDataY = 0;
			end
			default:
			begin
				CombLogic = a0;
				SH_REGENY = 0;
				L7_REGDataY = 0;
				TRSY = 0;
				CGInitY = 0;
				LoadSymbY = 0;
				INC_CTAdrY = 0;
				T_TTetrY = 0;
				L5_REGDataY = 0;
				L4_REGDataY = 0;
				L3_REGDataY = 0;
				L2_REGDataY = 0;
				L1_REGDataY = 0;
				L0_REGDataY = 0;
				L6_REGDataY = 0;
			end
		endcase
	end
endmodule