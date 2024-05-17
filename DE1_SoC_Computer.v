

module DE1_SoC_Computer (
	////////////////////////////////////
	// FPGA Pins
	////////////////////////////////////

	// Clock pins
	CLOCK_50,
	CLOCK2_50,
	CLOCK3_50,
	CLOCK4_50,

	// ADC
	ADC_CS_N,
	ADC_DIN,
	ADC_DOUT,
	ADC_SCLK,

	// Audio
	AUD_ADCDAT,
	AUD_ADCLRCK,
	AUD_BCLK,
	AUD_DACDAT,
	AUD_DACLRCK,
	AUD_XCK,

	// SDRAM
	DRAM_ADDR,
	DRAM_BA,
	DRAM_CAS_N,
	DRAM_CKE,
	DRAM_CLK,
	DRAM_CS_N,
	DRAM_DQ,
	DRAM_LDQM,
	DRAM_RAS_N,
	DRAM_UDQM,
	DRAM_WE_N,

	// I2C Bus for Configuration of the Audio and Video-In Chips
	FPGA_I2C_SCLK,
	FPGA_I2C_SDAT,

	// 40-Pin Headers
	GPIO_0,
	GPIO_1,
	
	// Seven Segment Displays
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,

	// IR
	IRDA_RXD,
	IRDA_TXD,

	// Pushbuttons
	KEY,

	// LEDs
	LEDR,

	// PS2 Ports
	PS2_CLK,
	PS2_DAT,
	
	PS2_CLK2,
	PS2_DAT2,

	// Slider Switches
	SW,

	// Video-In
	TD_CLK27,
	TD_DATA,
	TD_HS,
	TD_RESET_N,
	TD_VS,

	// VGA
	VGA_B,
	VGA_BLANK_N,
	VGA_CLK,
	VGA_G,
	VGA_HS,
	VGA_R,
	VGA_SYNC_N,
	VGA_VS,

	////////////////////////////////////
	// HPS Pins
	////////////////////////////////////
	
	// DDR3 SDRAM
	HPS_DDR3_ADDR,
	HPS_DDR3_BA,
	HPS_DDR3_CAS_N,
	HPS_DDR3_CKE,
	HPS_DDR3_CK_N,
	HPS_DDR3_CK_P,
	HPS_DDR3_CS_N,
	HPS_DDR3_DM,
	HPS_DDR3_DQ,
	HPS_DDR3_DQS_N,
	HPS_DDR3_DQS_P,
	HPS_DDR3_ODT,
	HPS_DDR3_RAS_N,
	HPS_DDR3_RESET_N,
	HPS_DDR3_RZQ,
	HPS_DDR3_WE_N,

	// Ethernet
	HPS_ENET_GTX_CLK,
	HPS_ENET_INT_N,
	HPS_ENET_MDC,
	HPS_ENET_MDIO,
	HPS_ENET_RX_CLK,
	HPS_ENET_RX_DATA,
	HPS_ENET_RX_DV,
	HPS_ENET_TX_DATA,
	HPS_ENET_TX_EN,

	// Flash
	HPS_FLASH_DATA,
	HPS_FLASH_DCLK,
	HPS_FLASH_NCSO,

	// Accelerometer
	HPS_GSENSOR_INT,
		
	// General Purpose I/O
	HPS_GPIO,
		
	// I2C
	HPS_I2C_CONTROL,
	HPS_I2C1_SCLK,
	HPS_I2C1_SDAT,
	HPS_I2C2_SCLK,
	HPS_I2C2_SDAT,

	// Pushbutton
	HPS_KEY,

	// LED
	HPS_LED,
		
	// SD Card
	HPS_SD_CLK,
	HPS_SD_CMD,
	HPS_SD_DATA,

	// SPI
	HPS_SPIM_CLK,
	HPS_SPIM_MISO,
	HPS_SPIM_MOSI,
	HPS_SPIM_SS,

	// UART
	HPS_UART_RX,
	HPS_UART_TX,

	// USB
	HPS_CONV_USB_N,
	HPS_USB_CLKOUT,
	HPS_USB_DATA,
	HPS_USB_DIR,
	HPS_USB_NXT,
	HPS_USB_STP
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

////////////////////////////////////
// FPGA Pins
////////////////////////////////////

// Clock pins
input						CLOCK_50;
input						CLOCK2_50;
input						CLOCK3_50;
input						CLOCK4_50;

// ADC
inout						ADC_CS_N;
output					ADC_DIN;
input						ADC_DOUT;
output					ADC_SCLK;

// Audio
input						AUD_ADCDAT;
inout						AUD_ADCLRCK;
inout						AUD_BCLK;
output					AUD_DACDAT;
inout						AUD_DACLRCK;
output					AUD_XCK;

// SDRAM
output 		[12: 0]	DRAM_ADDR;
output		[ 1: 0]	DRAM_BA;
output					DRAM_CAS_N;
output					DRAM_CKE;
output					DRAM_CLK;
output					DRAM_CS_N;
inout			[15: 0]	DRAM_DQ;
output					DRAM_LDQM;
output					DRAM_RAS_N;
output					DRAM_UDQM;
output					DRAM_WE_N;

// I2C Bus for Configuration of the Audio and Video-In Chips
output					FPGA_I2C_SCLK;
inout						FPGA_I2C_SDAT;

// 40-pin headers
inout			[35: 0]	GPIO_0;
inout			[35: 0]	GPIO_1;

// Seven Segment Displays
output		[ 6: 0]	HEX0;
output		[ 6: 0]	HEX1;
output		[ 6: 0]	HEX2;
output		[ 6: 0]	HEX3;
output		[ 6: 0]	HEX4;
output		[ 6: 0]	HEX5;

// IR
input						IRDA_RXD;
output					IRDA_TXD;

// Pushbuttons
input			[ 3: 0]	KEY;

// LEDs
output		[ 9: 0]	LEDR;

// PS2 Ports
inout						PS2_CLK;
inout						PS2_DAT;

inout						PS2_CLK2;
inout						PS2_DAT2;

// Slider Switches
input			[ 9: 0]	SW;

// Video-In
input						TD_CLK27;
input			[ 7: 0]	TD_DATA;
input						TD_HS;
output					TD_RESET_N;
input						TD_VS;

// VGA
output		[ 7: 0]	VGA_B;
output					VGA_BLANK_N;
output					VGA_CLK;
output		[ 7: 0]	VGA_G;
output					VGA_HS;
output		[ 7: 0]	VGA_R;
output					VGA_SYNC_N;
output					VGA_VS;



////////////////////////////////////
// HPS Pins
////////////////////////////////////
	
// DDR3 SDRAM
output		[14: 0]	HPS_DDR3_ADDR;
output		[ 2: 0]  HPS_DDR3_BA;
output					HPS_DDR3_CAS_N;
output					HPS_DDR3_CKE;
output					HPS_DDR3_CK_N;
output					HPS_DDR3_CK_P;
output					HPS_DDR3_CS_N;
output		[ 3: 0]	HPS_DDR3_DM;
inout			[31: 0]	HPS_DDR3_DQ;
inout			[ 3: 0]	HPS_DDR3_DQS_N;
inout			[ 3: 0]	HPS_DDR3_DQS_P;
output					HPS_DDR3_ODT;
output					HPS_DDR3_RAS_N;
output					HPS_DDR3_RESET_N;
input						HPS_DDR3_RZQ;
output					HPS_DDR3_WE_N;

// Ethernet
output					HPS_ENET_GTX_CLK;
inout						HPS_ENET_INT_N;
output					HPS_ENET_MDC;
inout						HPS_ENET_MDIO;
input						HPS_ENET_RX_CLK;
input			[ 3: 0]	HPS_ENET_RX_DATA;
input						HPS_ENET_RX_DV;
output		[ 3: 0]	HPS_ENET_TX_DATA;
output					HPS_ENET_TX_EN;

// Flash
inout			[ 3: 0]	HPS_FLASH_DATA;
output					HPS_FLASH_DCLK;
output					HPS_FLASH_NCSO;

// Accelerometer
inout						HPS_GSENSOR_INT;

// General Purpose I/O
inout			[ 1: 0]	HPS_GPIO;

// I2C
inout						HPS_I2C_CONTROL;
inout						HPS_I2C1_SCLK;
inout						HPS_I2C1_SDAT;
inout						HPS_I2C2_SCLK;
inout						HPS_I2C2_SDAT;

// Pushbutton
inout						HPS_KEY;

// LED
inout						HPS_LED;

// SD Card
output					HPS_SD_CLK;
inout						HPS_SD_CMD;
inout			[ 3: 0]	HPS_SD_DATA;

// SPI
output					HPS_SPIM_CLK;
input						HPS_SPIM_MISO;
output					HPS_SPIM_MOSI;
inout						HPS_SPIM_SS;

// UART
input						HPS_UART_RX;
output					HPS_UART_TX;

// USB
inout						HPS_CONV_USB_N;
input						HPS_USB_CLKOUT;
inout			[ 7: 0]	HPS_USB_DATA;
input						HPS_USB_DIR;
input						HPS_USB_NXT;
output					HPS_USB_STP;

//=======================================================
//  REG/WIRE declarations
//=======================================================

wire			[15: 0]	hex3_hex0;
//wire			[15: 0]	hex5_hex4;

//assign HEX0 = ~hex3_hex0[ 6: 0]; // hex3_hex0[ 6: 0]; 
//assign HEX1 = ~hex3_hex0[14: 8];
//assign HEX2 = ~hex3_hex0[22:16];
//assign HEX3 = ~hex3_hex0[30:24];
assign HEX4 = 7'b1111111;
assign HEX5 = 7'b1111111;

HexDigit Digit0(HEX0, hex3_hex0[3:0]);
HexDigit Digit1(HEX1, hex3_hex0[7:4]);
HexDigit Digit2(HEX2, hex3_hex0[11:8]);
HexDigit Digit3(HEX3, hex3_hex0[15:12]);

// 40960 input parameters

//	reg reset;
//	
//	//assign reset = ~KEY[0];
//	always @(*) begin
//		if (~KEY[0] == 1)
//			reset <= 1;
//		else 
//			reset <= 0;
//	end

	wire [7:0] reset;
	reg [3:0] piece_type;	// 0-4 0:pawn, 1:knight, 2:bishop, 3:rook, 4:queen
	reg piece_color_white, piece_color_black;	// 0-1 0:own 1:enemy
	reg [5:0] piece_square_white, piece_square_black;	// 0-63
	reg [8:0] king_square_white, king_square_black;		// 0-63 plus a few bits for shift

	wire [4:0] preindex_white, preindex_black;	// 0-9
	wire [15:0] index_white, index_black, addr_black, addr_white;	//0-40959
	reg [15:0] index_reset;



	reg active;
	reg write_en;
	reg buffer1, buffer2;
	reg sel;
	reg go;
	
	wire go_flag;

	reg [2:0] init_state;
	reg [31:0] init_counter, i;

	// parameters to set:
	// piece_type, piece_color_white, piece_square_white, king_square (both)


	assign preindex_white = (piece_type << 1) + piece_color_white;
	assign preindex_black = (piece_type << 1) + piece_color_black;


	assign index_white = ( piece_square_white + ((preindex_white + (king_square_white << 3) + (king_square_white << 1)) << 6) );
	assign index_black = ( piece_square_black + ((preindex_black + (king_square_black << 3) + (king_square_black << 1)) << 6) );
 

	// write_data
	//  15  14:12 11:6 5:0
	// color type p_sq k_sq
	
	always @ (posedge CLOCK_50) begin
		if (reset == 1) begin
			piece_type <= 0;
			piece_color_white <= 0;
			piece_square_white <= 0;
			write_en <= 0;
			index_reset <= 0;
			active <= 1'd_0;
			init_counter <= 0;
			init_state <= 1;
			i <= 0;
			sel <= 0;
			go <= 0;
		end
		else if ( buffer1) begin
			
			buffer1 <= 0;
		end
		else if (init_state == 3'd_1) begin
			index_reset <= i[15:0];
			i <= i + 1;
			buffer1 <= 1;
			if (i == 40960)
				init_state <= 3'd_2;
		end
		else if (buffer2) begin
			buffer2 <= 0;
		
		end
		else if (init_state == 3'd_2) begin
			write_en <= 1;
			sel <= 1;
			king_square_white <= 6'd_4;
			king_square_black <= 6'd_3;
			init_state <= 3'd_3;
		end
		else if (init_state == 3'd_3) begin
			active <= 1;
			case(init_counter)
				//white rook a1
				32'd_0: begin
					piece_type <= 4'd_3;
					piece_color_white <= 0;
					piece_square_white <= 6'd_0;
					end
				//white knight b1
				32'd_1: begin
					piece_type <= 4'd_1;
					piece_color_white <= 0;
					piece_square_white <= 6'd_1;
					end
				//white bishop c1
				32'd_2: begin
					piece_type <= 4'd_2;
					piece_color_white <= 0;
					piece_square_white <= 6'd_2;
					end
				//white queen d1
				32'd_3: begin
					piece_type <= 4'd_4;
					piece_color_white <= 0;
					piece_square_white <= 6'd_3;
					end
				//white bishop f1
				32'd_4: begin
					piece_type <= 4'd_2;
					piece_color_white <= 0;
					piece_square_white <= 6'd_5;
					end
				//white knight g1
				32'd_5: begin
					piece_type <= 4'd_1;
					piece_color_white <= 0;
					piece_square_white <= 6'd_6;
					end
				//white rook h1
				32'd_6: begin
					piece_type <= 4'd_3;
					piece_color_white <= 0;
					piece_square_white <= 6'd_7;
					end
				//white pawn a2
				32'd_7: begin
					piece_type <= 4'd_0;
					piece_color_white <= 0;
					piece_square_white <= 6'd_8;
					end
				//white pawn b2
				32'd_8: begin
					piece_type <= 4'd_0;
					piece_color_white <= 0;
					piece_square_white <= 6'd_9;
					end
				//white pawn c2
				32'd_9: begin
					piece_type <= 4'd_0;
					piece_color_white <= 0;
					piece_square_white <= 6'd_10;
					end
				//white pawn d2
				32'd_10: begin
					piece_type <= 4'd_0;
					piece_color_white <= 0;
					piece_square_white <= 6'd_11;
					end
				//white pawn e2
				32'd_11: begin
					piece_type <= 4'd_0;
					piece_color_white <= 0;
					piece_square_white <= 6'd_12;
					end
				//white pawn f2
				32'd_12: begin
					piece_type <= 4'd_0;
					piece_color_white <= 0;
					piece_square_white <= 6'd_13;
					end
				//white pawn g2
				32'd_13: begin
					piece_type <= 4'd_0;
					piece_color_white <= 0;
					piece_square_white <= 6'd_14;
					end
				//white pawn h2
				32'd_14: begin
					piece_type <= 4'd_0;
					piece_color_white <= 0;
					piece_square_white <= 6'd_15;
					end
				//black rook a8
				32'd_15: begin
					piece_type <= 4'd_3;
					piece_color_white <= 1;
					piece_square_white <= 6'd_56;
					end
				//black knight b8
				32'd_16: begin
					piece_type <= 4'd_1;
					piece_color_white <= 1;
					piece_square_white <= 6'd_57;
					end
				//black bishop c8
				32'd_17: begin
					piece_type <= 4'd_2;
					piece_color_white <= 1;
					piece_square_white <= 6'd_58;
					end
				//black queen d8
				32'd_18: begin
					piece_type <= 4'd_4;
					piece_color_white <= 1;
					piece_square_white <= 6'd_59;
					end
				//black bishop f8
				32'd_19: begin
					piece_type <= 4'd_2;
					piece_color_white <= 1;
					piece_square_white <= 6'd_61;
					end
				//black knight g8
				32'd_20: begin
					piece_type <= 4'd_1;
					piece_color_white <= 1;
					piece_square_white <= 6'd_62;
					end
				//black rook h8
				32'd_21: begin
					piece_type <= 4'd_3;
					piece_color_white <= 1;
					piece_square_white <= 6'd_63;
					end
				//black pawn a7
				32'd_22: begin
					piece_type <= 4'd_0;
					piece_color_white <= 1;
					piece_square_white <= 6'd_48;
					end
				//black pawn b7
				32'd_23: begin
					piece_type <= 4'd_0;
					piece_color_white <= 1;
					piece_square_white <= 6'd_49;
					end
				//black pawn c7
				32'd_24: begin
					piece_type <= 4'd_0;
					piece_color_white <= 1;
					piece_square_white <= 6'd_50;
					end
				//black pawn d7
				32'd_25: begin
					piece_type <= 4'd_0;
					piece_color_white <= 1;
					piece_square_white <= 6'd_51;
					end
				//black pawn e7
				32'd_26: begin
					piece_type <= 4'd_0;
					piece_color_white <= 1;
					piece_square_white <= 6'd_52;
					end
				//black pawn f7
				32'd_27: begin
					piece_type <= 4'd_0;
					piece_color_white <= 1;
					piece_square_white <= 6'd_53;
					end
				//black pawn g7
				32'd_28: begin
					piece_type <= 4'd_0;
					piece_color_white <= 1;
					piece_square_white <= 6'd_54;
					end
				//black pawn h7
				32'd_29: begin
					piece_type <= 4'd_0;
					piece_color_white <= 1;
					piece_square_white <= 6'd_55;
					end
				default: write_en <= 0;
			endcase
			piece_color_black <= ~piece_color_white;
			piece_square_black <= 6'd_63 - piece_square_white;
			init_counter <= init_counter + 1;
			if(init_counter > 32'd_29)
				init_state <= 3'd_4;
			buffer2 <= 1;

		end
		else if (init_state == 3'd_4) begin
			go <= 1;
			init_state <= 3'd_5;
		end
		else if (init_state == 3'd_5) begin
			go <= 0;
			init_state <= init_state;
		end
	end //ends always block

	assign addr_black = (sel == 0)? index_reset : index_black;
	assign addr_white = (sel == 0)? index_reset : index_white;
	wire [7:0] bias;
	
	assign go_flag = go;

	wire [15:0] read_data_weights1_white, read_data_weights1_black;
	reg weight_we;
	wire w_en_out1_white, w_en_out1_black;
	wire read_data1_white, read_data1_black;
	reg [15:0] write_addr_weights1_white, write_addr_weights1_black;
	reg [15:0] write_data_weights1_white, write_data_weights1_black;
	wire [15:0] read_addr1_white, read_addr1_black;
	wire [7:0] write_addr1_white, write_addr1_black;
	wire [7:0] write_data1_white, write_data1_black;
	wire [7:0] trigger1_white, trigger1_black, trigger1;
	wire [7:0] ready1;
	
	// assign trigger1 = trigger1_white;


	M10K_input input_white(
		.q(read_data1_white),
		.d(active),
		.write_address(addr_white),
		.read_address(read_addr1_white),
		.we(write_en),
		.clk(CLOCK_50)
		);

	M10K_input input_black(
		.q(read_data1_black),
		.d(active),
		.write_address(addr_black),
		.read_address(read_addr1_black),
		.we(write_en),
		.clk(CLOCK_50)
		);



	wire done1_w, done1_b;

	linear_40960_256 linear1_white(
		.read_data_weights(read_data_weights1_white),
		.read_data(read_data1_white),//from inputs
		.reset(go),
		.ready(ready1),
		.write_addr_out(write_addr1_white),
		.write_data_out(write_data1_white),
		.read_addr(read_addr1_white), //to dual port and inputs
		.trigger_out(trigger1_white),
		.clk(CLOCK_50),
		.write_out(w_en_out1_white),
		.done_out(done1_w),
		.bias(bias)
		);
	linear_40960_256 linear1_black(
		.read_data_weights(read_data_weights1_black),
		.read_data(read_data1_black),//from inputs
		.reset(go),
		.ready(ready1),
		.write_addr_out(write_addr1_black),
		.write_data_out(write_data1_black),
		.read_addr(read_addr1_black), //to dual port and inputs
		.trigger_out(trigger1_black),
		.clk(CLOCK_50),
		.write_out(w_en_out1_black),
		.done_out(done1_b),
		.bias(bias)
		);


	///// Comb ///// 
	reg [7:0] read_addr_comb_white,  read_addr_comb_black;
	wire [7:0] read_data_comb_white,  read_data_comb_black;

	M10K_linear_out1 linear1_white_out(  //256
		.q(read_data_comb_white),
		.d(write_data1_white),
		.write_address(write_addr1_white),
		.read_address(read_addr_comb_white),
		.we(w_en_out1_white),
		.clk(CLOCK_50)
		);
	M10K_linear_out1 linear1_black_out(  //256
		.q(read_data_comb_black),
		.d(write_data1_black),
		.write_address(write_addr1_black),
		.read_address(read_addr_comb_black),
		.we(w_en_out1_black),
		.clk(CLOCK_50)
		);
	// COMB = FSM
	reg [2:0] comb_state;
	reg [31:0] counter_comb;
	reg proceed_512, buffer_comb;
	reg [7:0] write_data_comb; 
	reg [9:0] write_addr_comb;
	reg w_en_comb;


	always @ (posedge CLOCK_50) begin
		if (done1_w) begin
			comb_state <= 0;
			proceed_512 <= 0;
			buffer_comb <= 0;
			counter_comb <= 0;
			w_en_comb <= 1;
		end
		else if (comb_state == 0) begin
			read_addr_comb_black <= counter_comb[7:0];
			read_addr_comb_white <= counter_comb[7:0];
			comb_state <= 1;
			buffer_comb <= 1;
		end
		else if (buffer_comb == 1)
			buffer_comb <= 0;
		else if (comb_state == 1) begin
			write_data_comb <= read_data_comb_white;
			write_addr_comb <= counter_comb[9:0];
			comb_state <= 3'd_2;
		end
		else if (comb_state == 3'd_2) begin
			write_data_comb <= read_data_comb_black;
			write_addr_comb <= counter_comb[9:0] + 10'd_256;
			comb_state <= 3'd_3;
		end
		else if (comb_state == 3'd_3) begin
			counter_comb <= counter_comb + 1;
			comb_state <= 0;
			if (counter_comb == 256) begin
				comb_state <= 3'd_4;
				proceed_512 <= 1;
			end
		end
		else if (comb_state == 3'd_4) begin
			comb_state <= comb_state;
			proceed_512 <= 0;
		end
	end

	wire [7:0] write_data_comb_wire;
	wire [9:0] write_addr_comb_wire;
	wire w_en_comb_wire;

	assign write_data_comb_wire = write_data_comb;
	assign write_addr_comb_wire = write_addr_comb;
	assign w_en_comb_wire = w_en_comb;

	wire [7:0] read_data2;
	wire [9:0] read_addr2;

	wire [7:0] read_data_weights2; 
	reg [7:0] write_data_weights_512;
	reg [9:0] write_addr_weights_512;
	reg weight_we_512;


	M10K_comb_512 comb(   //512 
		.q(read_data2),
		.d(write_data_comb_wire),
		.write_address(write_addr_comb_wire),
		.read_address(read_addr2),
		.we(w_en_comb_wire),
		.clk(CLOCK_50)
		);


	wire [7:0] write_data2;
	wire [5:0] write_addr2;
	wire w_en_out_2;
	wire [7:0] ready2;
	wire [7:0] trigger2; 
	wire proceed_32a;

	linear_512_32 linear2 (
		.read_data_weights(read_data_weights2),
		.read_data(read_data2), //from inputs
		.reset(proceed_512),
		.ready(ready2),
		.write_addr_out(write_addr2),
		.write_data_out(write_data2),
		.read_addr(read_addr2), //to dual port and inputs
		.trigger_out(trigger2),
		.clk(CLOCK_50),
		.write_out(w_en_out_2),
		.done_out(proceed_32a),
		.bias(bias)
	);

	wire [7:0] read_data3;
	wire [5:0] read_addr3;

	M10K_linear_out_2_3 linear2_out (	   //32
		.q(read_data3),
		.d(write_data2),
		.write_address(write_addr2),
		.read_address(read_addr3),
		.we(w_en_out_2),
		.clk(CLOCK_50)
		);
	
	wire [7:0] write_data3;
	wire [5:0] write_addr3;
	wire w_en_out_3;
	wire [7:0] trigger3;
	wire [7:0] ready3;
	wire proceed_32b;

	wire [7:0] read_data_weights3;
	reg [7:0] write_data_weights_32a;
	reg [5:0] write_addr_weights_32a;
	reg weight_we_32a;


	linear_32_32 linear3 (
		.read_data_weights(read_data_weights3),
		.read_data(read_data3), //from inputs
		.reset(proceed_32a),
		.ready(ready3),
		.write_addr_out(write_addr3),
		.write_data_out(write_data3),
		.read_addr(read_addr3), //to dual port and inputs
		.trigger_out(trigger3),
		.clk(CLOCK_50),
		.write_out(w_en_out_3),
		.done_out(proceed_32b),
		.bias(bias)
	);

	wire [7:0] read_data4;
	wire [5:0] read_addr4;

	M10K_linear_out_2_3 linear3_out (	   //32
		.q(read_data4),
		.d(write_data3),
		.write_address(write_addr3),
		.read_address(read_addr4),
		.we(w_en_out_3),
		.clk(CLOCK_50)
	);


	wire [7:0] ready4;
	wire [15:0] eval; 

	wire [7:0] read_data_weights4;
	reg [7:0]  write_data_weights_32b;
	reg [5:0] write_addr_weights_32b;
	reg weight_we_32b;



	linear_32_1 linear4 (
		.read_data_weights(read_data_weights4),
		.read_data(read_data4), //from inputs
		.reset(proceed_32b),
		.ready(ready4),
		.clk(CLOCK_50),
		.read_addr(read_addr4),
		.eval(eval),
		.bias(bias)
	);

//=======================================================
//  Structural coding
//=======================================================

Computer_System The_System (
	////////////////////////////////////
	// FPGA Side
	////////////////////////////////////

	// Global signals
	.system_pll_ref_clk_clk					(CLOCK_50),
	.system_pll_ref_reset_reset			(1'b0),

	
	// SDRAM
	.sdram_clk_clk								(DRAM_CLK),
   .sdram_addr									(DRAM_ADDR),
	.sdram_ba									(DRAM_BA),
	.sdram_cas_n								(DRAM_CAS_N),
	.sdram_cke									(DRAM_CKE),
	.sdram_cs_n									(DRAM_CS_N),
	.sdram_dq									(DRAM_DQ),
	.sdram_dqm									({DRAM_UDQM,DRAM_LDQM}),
	.sdram_ras_n								(DRAM_RAS_N),
	.sdram_we_n									(DRAM_WE_N),
	
	////////////////////////////////////
	// HPS Side
	////////////////////////////////////
	// DDR3 SDRAM
	.memory_mem_a			(HPS_DDR3_ADDR),
	.memory_mem_ba			(HPS_DDR3_BA),
	.memory_mem_ck			(HPS_DDR3_CK_P),
	.memory_mem_ck_n		(HPS_DDR3_CK_N),
	.memory_mem_cke		(HPS_DDR3_CKE),
	.memory_mem_cs_n		(HPS_DDR3_CS_N),
	.memory_mem_ras_n		(HPS_DDR3_RAS_N),
	.memory_mem_cas_n		(HPS_DDR3_CAS_N),
	.memory_mem_we_n		(HPS_DDR3_WE_N),
	.memory_mem_reset_n	(HPS_DDR3_RESET_N),
	.memory_mem_dq			(HPS_DDR3_DQ),
	.memory_mem_dqs		(HPS_DDR3_DQS_P),
	.memory_mem_dqs_n		(HPS_DDR3_DQS_N),
	.memory_mem_odt		(HPS_DDR3_ODT),
	.memory_mem_dm			(HPS_DDR3_DM),
	.memory_oct_rzqin		(HPS_DDR3_RZQ),
		  
	// Ethernet
	.hps_io_hps_io_gpio_inst_GPIO35	(HPS_ENET_INT_N),
	.hps_io_hps_io_emac1_inst_TX_CLK	(HPS_ENET_GTX_CLK),
	.hps_io_hps_io_emac1_inst_TXD0	(HPS_ENET_TX_DATA[0]),
	.hps_io_hps_io_emac1_inst_TXD1	(HPS_ENET_TX_DATA[1]),
	.hps_io_hps_io_emac1_inst_TXD2	(HPS_ENET_TX_DATA[2]),
	.hps_io_hps_io_emac1_inst_TXD3	(HPS_ENET_TX_DATA[3]),
	.hps_io_hps_io_emac1_inst_RXD0	(HPS_ENET_RX_DATA[0]),
	.hps_io_hps_io_emac1_inst_MDIO	(HPS_ENET_MDIO),
	.hps_io_hps_io_emac1_inst_MDC		(HPS_ENET_MDC),
	.hps_io_hps_io_emac1_inst_RX_CTL	(HPS_ENET_RX_DV),
	.hps_io_hps_io_emac1_inst_TX_CTL	(HPS_ENET_TX_EN),
	.hps_io_hps_io_emac1_inst_RX_CLK	(HPS_ENET_RX_CLK),
	.hps_io_hps_io_emac1_inst_RXD1	(HPS_ENET_RX_DATA[1]),
	.hps_io_hps_io_emac1_inst_RXD2	(HPS_ENET_RX_DATA[2]),
	.hps_io_hps_io_emac1_inst_RXD3	(HPS_ENET_RX_DATA[3]),

	// Flash
	.hps_io_hps_io_qspi_inst_IO0	(HPS_FLASH_DATA[0]),
	.hps_io_hps_io_qspi_inst_IO1	(HPS_FLASH_DATA[1]),
	.hps_io_hps_io_qspi_inst_IO2	(HPS_FLASH_DATA[2]),
	.hps_io_hps_io_qspi_inst_IO3	(HPS_FLASH_DATA[3]),
	.hps_io_hps_io_qspi_inst_SS0	(HPS_FLASH_NCSO),
	.hps_io_hps_io_qspi_inst_CLK	(HPS_FLASH_DCLK),

	// Accelerometer
	.hps_io_hps_io_gpio_inst_GPIO61	(HPS_GSENSOR_INT),

	//.adc_sclk                        (ADC_SCLK),
	//.adc_cs_n                        (ADC_CS_N),
	//.adc_dout                        (ADC_DOUT),
	//.adc_din                         (ADC_DIN),

	// General Purpose I/O
	.hps_io_hps_io_gpio_inst_GPIO40	(HPS_GPIO[0]),
	.hps_io_hps_io_gpio_inst_GPIO41	(HPS_GPIO[1]),

	// I2C
	.hps_io_hps_io_gpio_inst_GPIO48	(HPS_I2C_CONTROL),
	.hps_io_hps_io_i2c0_inst_SDA		(HPS_I2C1_SDAT),
	.hps_io_hps_io_i2c0_inst_SCL		(HPS_I2C1_SCLK),
	.hps_io_hps_io_i2c1_inst_SDA		(HPS_I2C2_SDAT),
	.hps_io_hps_io_i2c1_inst_SCL		(HPS_I2C2_SCLK),

	// Pushbutton
	.hps_io_hps_io_gpio_inst_GPIO54	(HPS_KEY),

	// LED
	.hps_io_hps_io_gpio_inst_GPIO53	(HPS_LED),

	// SD Card
	.hps_io_hps_io_sdio_inst_CMD	(HPS_SD_CMD),
	.hps_io_hps_io_sdio_inst_D0	(HPS_SD_DATA[0]),
	.hps_io_hps_io_sdio_inst_D1	(HPS_SD_DATA[1]),
	.hps_io_hps_io_sdio_inst_CLK	(HPS_SD_CLK),
	.hps_io_hps_io_sdio_inst_D2	(HPS_SD_DATA[2]),
	.hps_io_hps_io_sdio_inst_D3	(HPS_SD_DATA[3]),

	// SPI
	.hps_io_hps_io_spim1_inst_CLK		(HPS_SPIM_CLK),
	.hps_io_hps_io_spim1_inst_MOSI	(HPS_SPIM_MOSI),
	.hps_io_hps_io_spim1_inst_MISO	(HPS_SPIM_MISO),
	.hps_io_hps_io_spim1_inst_SS0		(HPS_SPIM_SS),

	// UART
	.hps_io_hps_io_uart0_inst_RX	(HPS_UART_RX),
	.hps_io_hps_io_uart0_inst_TX	(HPS_UART_TX),

	// USB
	.hps_io_hps_io_gpio_inst_GPIO09	(HPS_CONV_USB_N),
	.hps_io_hps_io_usb1_inst_D0		(HPS_USB_DATA[0]),
	.hps_io_hps_io_usb1_inst_D1		(HPS_USB_DATA[1]),
	.hps_io_hps_io_usb1_inst_D2		(HPS_USB_DATA[2]),
	.hps_io_hps_io_usb1_inst_D3		(HPS_USB_DATA[3]),
	.hps_io_hps_io_usb1_inst_D4		(HPS_USB_DATA[4]),
	.hps_io_hps_io_usb1_inst_D5		(HPS_USB_DATA[5]),
	.hps_io_hps_io_usb1_inst_D6		(HPS_USB_DATA[6]),
	.hps_io_hps_io_usb1_inst_D7		(HPS_USB_DATA[7]),
	.hps_io_hps_io_usb1_inst_CLK		(HPS_USB_CLKOUT),
	.hps_io_hps_io_usb1_inst_STP		(HPS_USB_STP),
	.hps_io_hps_io_usb1_inst_DIR		(HPS_USB_DIR),
	.hps_io_hps_io_usb1_inst_NXT		(HPS_USB_NXT),
	
	.m10k_weights_40960_white_s2_readdata (read_data_weights1_white),
	.m10k_weights_40960_white_s2_writedata (write_data_weights1_white),
	.m10k_weights_40960_white_s2_address (read_addr1_white),
	.m10k_weights_40960_white_s2_write (1'b0),
	.m10k_weights_40960_white_s2_chipselect (1'b1),
	.m10k_weights_40960_white_s2_clken (1'b1),
	.m10k_weights_40960_white_s2_byteenable (2'b11),
	
	.m10k_weights_40960_black_s2_readdata (read_data_weights1_black),
	.m10k_weights_40960_black_s2_writedata (write_data_weights1_black),
	.m10k_weights_40960_black_s2_address (read_addr1_black),
	.m10k_weights_40960_black_s2_write (1'b0),
	.m10k_weights_40960_black_s2_chipselect (1'b1),
	.m10k_weights_40960_black_s2_clken (1'b1),
	.m10k_weights_40960_black_s2_byteenable (2'b11),
	
	.m10k_weights_512_s2_readdata (read_data_weights2),
	.m10k_weights_512_s2_writedata (write_data_weights_512),
	.m10k_weights_512_s2_address (read_addr2),
	.m10k_weights_512_s2_write (1'b0),
	.m10k_weights_512_s2_chipselect (1'b1),
	.m10k_weights_512_s2_clken (1'b1),
	
	.m10k_weights_32a_s2_readdata (read_data_weights3),
	.m10k_weights_32a_s2_writedata (write_data_weights_32a),
	.m10k_weights_32a_s2_address (read_addr3),
	.m10k_weights_32a_s2_write (1'b0),
	.m10k_weights_32a_s2_chipselect (1'b1),
	.m10k_weights_32a_s2_clken (1'b1),
	
	.m10k_weights_32b_s2_readdata (read_data_weights4),
	.m10k_weights_32b_s2_writedata (write_data_weights_32b),
	.m10k_weights_32b_s2_address (read_addr4),
	.m10k_weights_32b_s2_write (1'b0),
	.m10k_weights_32b_s2_chipselect (1'b1),
	.m10k_weights_32b_s2_clken (1'b1),
	
	.ready1_external_connection_export	(ready1),
	.ready2_external_connection_export	(ready2),
	.ready3_external_connection_export	(ready3),
	.ready4_external_connection_export	(ready4),
	
	.trigger1_external_connection_export	(trigger1_white),
	.trigger2_external_connection_export	(trigger2),
	.trigger3_external_connection_export	(trigger3),
	
	.pio_reset_external_connection_export	(reset),
	.pio_eval_external_connection_export	(eval) ,
	.pio_bias_external_connection_export	(bias)
	
);


endmodule




//============================================================
// M10K module for testing
//============================================================

//============================================================
// M10K module for testing
//============================================================

module signed_mult (out, a, b);
	output 	signed  [7:0]	out; 
	input 	signed	[7:0] 	a;
	input 	signed	[7:0] 	b;
	// intermediate full bit length
	wire 	signed	[15:0]	mult_out;
	assign mult_out = a * b;
	// select bits for 3.5 fixed point
    assign out = {mult_out[15], mult_out[11:5]};
endmodule

module M10K_input( 
    output reg q,
    input d,
    input [15:0] write_address, read_address,
    input we, clk
);
	 // force M10K ram style
    reg mem [40959:0]  /* synthesis ramstyle = "no_rw_check, M10K" */;
	 
    always @ (posedge clk) begin
        if (we) begin
            mem[write_address] <= d;
        end
        q <= mem[read_address]; // q doesn't get d in this clock cycle
    end
endmodule




module M10K_linear_out1(
    output reg [7:0] q,
    input [7:0] d,
    input [7:0] write_address, read_address,
    input we, clk
);

    reg [7:0] mem [255:0]  /* synthesis ramstyle = "no_rw_check, M10K" */;
	 
    always @ (posedge clk) begin
        if (we) begin
            mem[write_address] <= d;
        end
        q <= mem[read_address]; // q doesn't get d in this clock cycle
    end
endmodule

module M10K_comb_512 (
    output reg [7:0] q,
    input [7:0] d,
    input [9:0] write_address, read_address,
    input we, clk
);

    reg [7:0] mem [511:0]  /* synthesis ramstyle = "no_rw_check, M10K" */;
	 
    always @ (posedge clk) begin
        if (we) begin
            mem[write_address] <= d;
        end
        q <= mem[read_address]; // q doesn't get d in this clock cycle
    end
endmodule

module M10K_linear_out_2_3(
    output reg [7:0] q,
    input [7:0] d,
    input [5:0] write_address, read_address,
    input we, clk
);

    reg [7:0] mem [31:0]  /* synthesis ramstyle = "no_rw_check, M10K" */;
	 
    always @ (posedge clk) begin
        if (we) begin
            mem[write_address] <= d;
        end
        q <= mem[read_address]; // q doesn't get d in this clock cycle
    end
endmodule

module linear_40960_256(
	input [15:0] read_data_weights, //read addr for m10k that stores only one row of weights
	input read_data,
	input reset,
	input [7:0] ready, //hps tell fpga finished filling dual port
	input clk, 
	output reg [15:0] read_addr,
	output reg [7:0] write_addr_out,
	output reg [7:0] write_data_out,
	output [7:0] trigger_out, //fpga tell hps fill new row to dual port
	output reg write_out,
	output done_out,
	input [7:0] bias
	
);
	reg [7:0] trigger;
	reg done;
	reg [31:0] counter, out_counter;
	reg [15:0] temp_sum, sum_out; //temp_sum accumalate, sum_out= adding bias
	reg [3:0] state;
	reg buffer, buffer1, twofiftyfive, buffer2, buffer3;
		
	always @ (posedge clk) begin
		if (reset) begin
			state <= 4'd_0;
			counter <= 0;
			out_counter <= 0;
			temp_sum <= 0;
			buffer <= 0;
			buffer1 <= 0;
			trigger <= 8'd_1;
			sum_out <= 0;
			write_out <= 0;
			done <= 0;
			twofiftyfive <= 0;
		end
		else if (state == 0) begin 
			//trigger <= 1;
			state <= 4'd_1;
		end
//		else if (buffer == 1) begin
//			buffer <= 0;
//		end
//		else if (state == 4'd_1) begin //set read address for both weights and inputs
//			bias <= read_data_weights; 
//			state <= 2;
//		end
		else if (state == 4'd_1 && ready[0] == 1) begin
			trigger <= 8'd_0;
			state <= 4'd_2;
		end
		else if (state == 4'd_2) begin //set read address for both weights and inputs
			//trigger <= 0;
			read_addr <= counter[15:0]; 
			state <= 4'd_3;
			buffer1 <= 1;
		end
		else if (buffer1 == 1) begin
			buffer1 <= 0;
		end
		else if (state == 4'd_3) begin //multiplying input data by weights
			if (read_data == 1) 
				temp_sum <= temp_sum + read_data_weights; //accumulating weights for active
			else
				temp_sum <= temp_sum; //else 0
			
			if (counter < 32'd_40960) begin //increment through all 40960 inputs
				if (counter == 32'd_40959) begin
					state <= 4'd_4;
					write_out <= 1;
				end
				else begin
					state <= 4'd_2;
					counter <= counter + 1;
				end
			end
		end
		else if (state == 4'd_4) begin //reload next row of weights to intermediate weights m10k
			temp_sum <= temp_sum + {8'b_00000000, bias}; //send full row sum to output
			if(temp_sum[15] == 1)
				sum_out <= 0;
			else if (temp_sum > 16'b_001_1111111111111)
				sum_out <= 	16'b_001_1111111111111; 
			else
				sum_out <= temp_sum; 
			temp_sum <= 0;
			write_data_out <= sum_out[15:8];
			write_addr_out <= out_counter[7:0]; //count up next desired output row
			//out_counter <= out_counter + 1;
			counter <= 0;

			if (out_counter < 32'd_256) begin //increment through all 256 desired outputs
				if (out_counter == 255) begin
					trigger <= 8'd_0;
					state <= 4'd_5;
					done <= 1;
				end
				else begin
					trigger <= 8'd_1;
					state <= 4'd_1;
					out_counter <= out_counter + 32'd_1;
				end
			end
		end //011110_00000 == 30; 011_1100;  
		else if (state == 4'd_5) begin //end state
			state <= state;
			write_out <= 0;
			done <= 0;
		end
		else begin
			//trigger <= 0;
			state <= state;
		end
	end
	assign trigger_out = trigger;
	assign done_out = done;
endmodule

module linear_512_32(
	input [7:0] read_data_weights, //read addr for m10k that stores only one row of weights
	input [7:0] read_data,
	input reset,
	input [7:0] ready, //hps tell fpga finished filling dual port
	input clk, 
	output reg [9:0] read_addr,
	output reg [5:0] write_addr_out,
	output reg [7:0] write_data_out,
	output [7:0] trigger_out, //fpga tell hps fill new row to dual port
	output reg write_out,
	output done_out,
	input [7:0] bias
	
);
	
	reg [7:0] trigger;
	reg done;
	reg [31:0] counter, out_counter;
	reg [15:0] temp_sum; 
	wire [7:0] temp_mult;
	reg [7:0] sum_out; //temp_sum accumalate, sum_out= adding bias
	reg [3:0] state;
	reg buffer, buffer1;
	
	signed_mult mult_512 (.out(temp_mult), .a(read_data_weights), .b(read_data));
	always @ (posedge clk) begin
		if (reset) begin
			state <= 4'd_1;
			counter <= 0;
			out_counter <= 0;
			temp_sum <= 0;
			buffer <= 0;
			buffer1 <= 0;
			trigger <= 8'd_1;
			sum_out <= 0;
			write_out <= 0;
			done <= 0;
		end
		//else if (trigger == 1) 
			//trigger <= 0;
//		else if (state == 0 && ready) begin //set read address for both weights and inputs
//			read_addr <= 32'd_512; 
//			state <= 4'd_1;
//			buffer <= 1;
//		end
//		else if (buffer == 1) begin
//			buffer <= 0;
//		end
//		else if (state == 4'd_1) begin //set read address for both weights and inputs
//			bias <= read_data_weights; 
//			state <= 2;
//		end
		else if (state == 4'd_1 && ready[0] == 1) begin
			trigger <= 8'd_0;
			state <= 4'd_2;
		end
		else if (state == 4'd_2 ) begin //set read address for both weights and inputs
			// trigger <= 0;
			read_addr <= counter[9:0]; 
			state <= 4'd_3;
			buffer1 <= 1;
		end
		else if (buffer1 == 1) begin
			buffer1 <= 0;
		end
		else if (state == 4'd_3) begin //multiplying input data by weights
			
			temp_sum <= temp_sum + {8'b_00000000, temp_mult}; //accumulating weights for active

			if (counter < 32'd_512) begin //increment through all 40960 inputs
				if (counter == 32'd_511) begin
					state <= 4'd_4;
					write_out <= 1;
				end
				else begin
					state <= 4'd_2;
					counter <= counter + 1;
				end
			end
		end
		else if (state == 4'd_4) begin //reload next row of weights to intermediate weights m10k
			temp_sum <= (temp_sum + {8'b_00000000, bias}); //send full row sum to output
			
			if(temp_sum[15] == 1)
				sum_out <= 0;
			else if (temp_sum > 16'b_00000000_00111111)
				sum_out <= 8'b_001_11111;
			else
				sum_out <= temp_sum[7:0]; 
			temp_sum <= 0;
			write_data_out <= sum_out;
			write_addr_out <= out_counter[5:0]; 
			counter <= 0;
			if (out_counter < 32'd_32) begin //increment through all 256 desired outputs
				if (out_counter == 31) begin
					trigger <= 8'd_0;
					state <= 4'd_5;
					done <= 1;
				end
				else begin
					trigger <= 8'd_1;
					state <= 4'd_1;
					out_counter <= out_counter + 32'd_1;
				end
			end
		end
		else if (state == 4'd_5) begin //end state
			state <= state;
			write_out <= 0;
			done <= 0;
			out_counter <= out_counter;
			counter <= counter;
		end
		else begin
			//trigger <= 0;
			state <= state;
		end
	end

	assign trigger_out = trigger;
	assign done_out = done;
endmodule

module linear_32_32(
	input [7:0] read_data_weights, //read addr for m10k that stores only one row of weights
	input [7:0] read_data,
	input reset,
	input [7:0] ready, //hps tell fpga finished filling dual port
	input clk, 
	output reg [5:0] read_addr,
	output reg [5:0] write_addr_out,
	output reg [7:0] write_data_out,
	output [7:0] trigger_out, //fpga tell hps fill new row to dual port
	output reg write_out,
	output done_out,
	input [7:0] bias
	
);
	reg [7:0] trigger; 
	reg done;
	reg [31:0] counter, out_counter;
	reg [15:0] temp_sum; 
	wire [7:0] temp_mult;
	reg [7:0] sum_out; //temp_sum accumalate, sum_out= adding bias
	reg [3:0] state;
	reg buffer, buffer1;
	
	signed_mult mult_32a (.out(temp_mult), .a(read_data_weights), .b(read_data));

	always @ (posedge clk) begin
		if (reset) begin
			state <= 4'd_1;
			counter <= 0;
			out_counter <= 0;
			temp_sum <= 0;
			buffer <= 0;
			buffer1 <= 0;
			trigger <= 8'd_1;
			sum_out <= 0;
			write_out <= 0;
			done <= 0;
		end
		//else if (trigger == 1) 
			//trigger <= 0;
//		else if (state == 0 && ready) begin //set read address for both weights and inputs
//			read_addr <= 32'd_32; 
//			state <= 4'd_1;
//			buffer <= 1;
//		end
//		else if (buffer == 1) begin
//			buffer <= 0;
//		end
//		else if (state == 4'd_1) begin //set read address for both weights and inputs
//			bias <= read_data_weights; 
//			state <= 2;
//		end
		else if (state == 4'd_1 && ready[0] == 1) begin
			trigger <= 8'd_0;
			state <= 4'd_2;
		end
		else if (state == 4'd_2) begin //set read address for both weights and inputs
			//trigger <= 0;
			read_addr <= counter[5:0]; 
			state <= 4'd_3;
			buffer1 <= 1;
		end
		else if (buffer1 == 1) begin
			buffer1 <= 0;
		end
		else if (state == 4'd_3) begin //multiplying input data by weights
			
			temp_sum <= temp_sum + {8'b_0000_0000, temp_mult}; //accumulating weights for active
			
			
			if (counter < 32'd_32) begin //increment through all 40960 inputs
				if (counter == 32'd_31) begin
					state <= 4'd_4;
					write_out <= 1;
				end
				else begin
					state <= 4'd_2;
					counter <= counter + 1;
				end
			end
		end
		else if (state == 4'd_4) begin //reload next row of weights to intermediate weights m10k
			temp_sum <= (temp_sum + {8'b_00000000, bias}); //send full row sum to output
			
			if(temp_sum < 0)
				sum_out <= 0;
			else if (temp_sum > 16'b_00111111)
				sum_out <= 8'b_00111111;
			else
				sum_out <= temp_sum[7:0]; 
			temp_sum <= 0;
			write_data_out <= sum_out;
			write_addr_out <= out_counter[5:0]; //count up next desired output row
			counter <= 0;
			if (out_counter < 32'd_32) begin //increment through all 256 desired outputs
				if (out_counter == 31) begin
					trigger <= 8'd_0;
					state <= 4'd_5;
					done <= 1;
				end
				else begin
					trigger <= 8'd_1;
					state <= 4'd_1;
					out_counter <= out_counter + 32'd_1;
				end
			end
		end
		else if (state == 4'd_5) begin //end state
			state <= state;
			write_out <= 0;
			done <= 0;
		end
		else begin
			//trigger <= 0;
			state <= state;
		end
	end
	assign trigger_out = trigger;
	assign done_out = done;
endmodule

module linear_32_1(
	input [7:0] read_data_weights, //read addr for m10k that stores only one row of weights
	input [7:0] read_data,
	input reset,
	input [7:0] ready, //hps tell fpga finished filling dual port
	input clk, 
	output reg [5:0] read_addr,
	output [15:0] eval,
	input [7:0] bias
	
);
	
	reg [31:0] counter, out_counter;
	reg [15:0] temp_sum; 
	wire [7:0] temp_mult;
	reg [15:0] sum_out; //temp_sum accumalate, sum_out= adding bias
	reg [3:0] state;
	reg buffer, buffer1;
	
	signed_mult mult_32b (.out(temp_mult), .a(read_data_weights), .b(read_data));

	always @ (posedge clk) begin
		if (reset) begin
			state <= 4'd_1;
			counter <= 0;
			temp_sum <= 0;
			buffer <= 0;
			buffer1 <= 0;
			sum_out <= 0;
		end
//		else if (state == 0 && ready) begin //set read address for both weights and inputs
//			read_addr <= 32'd_32; 
//			state <= 4'd_1;
//			buffer <= 1;
//		end
//		else if (buffer == 1) begin
//			buffer <= 0;
//		end
//		else if (state == 4'd_1) begin //set read address for both weights and inputs
//			bias <= read_data_weights; 
//			state <= 2;
//		end
		else if (state == 4'd_1 && ready[0] == 1) begin
			state <= 4'd_2;
		end
		else if (state == 4'd_2 ) begin //set read address for both weights and inputs
			read_addr <= counter[5:0]; 
			state <= 4'd_3;
			buffer1 <= 1;
		end
		else if (buffer1 == 1) begin
			buffer1 <= 0;
		end
		else if (state == 4'd_3) begin //multiplying input data by weights
			
			temp_sum <= temp_sum + {8'b_00000000, temp_mult}; //accumulating weights for active
			
			if (counter < 32'd_32) begin //increment through all 40960 inputs
				if (counter == 32'd_31) begin
					state <= 4'd_4;
				end
				else begin
					state <= 4'd_2;
					counter <= counter + 1;
				end
			end
		end
		else if (state == 4'd_4) begin //reload next row of weights to intermediate weights m10k
			temp_sum <= (temp_sum + {8'b_00000000, bias}); //send full row sum to output
			
			sum_out <= temp_sum;

			//temp_sum <= 0;
			counter <= 0;
			state <= state;
		end
		else if (state == 4'd_5) begin
			state <= state;
		end
		else begin
			state <= state;
		end
	end
	assign eval = sum_out;
endmodule

