
`timescale 1ns/1ns

module testbench();
	
	reg clk_50, clk_25, reset;
	
	reg [31:0] clk_index;
	wire signed [31:0]  testbench_out;
    wire signed [31:0]  testbench_out2;
	
	//Initialize clocks and index
	initial begin
		clk_50 = 1'b0;
		clk_25 = 1'b0;
		clk_index  = 32'd0;
		//testbench_out = 15'd0 ;
	end
	
	//Toggle the clocks
	always begin
		#10
		clk_50  = !clk_50;
	end
	
	always begin
		#20
		clk_25  = !clk_25;
	end
	
	//Intialize and drive signals
	initial begin
		reset  = 1'b0;
		#10 
		reset  = 1'b1;
		#30
		reset  = 1'b0;
	end
	
	//Increment index
	always @ (posedge clk_50) begin
		clk_index  <= clk_index + 32'd1;
	end

	// 40960 input parameters

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

	reg [2:0] state;
	reg [31:0] counter, i;

	// parameters to set:
	// piece_type, piece_color_white, piece_square_white, king_square (both)


	assign preindex_white = (piece_type << 1) + piece_color_white;
	assign preindex_black = (piece_type << 1) + piece_color_black;


	assign index_white = ( piece_square_white + ((preindex_white + (king_square_white << 3) + (king_square_white << 1)) << 6) );
	assign index_black = ( piece_square_black + ((preindex_black + (king_square_black << 3) + (king_square_black << 1)) << 6) );
 

	// write_data
	//  15  14:12 11:6 5:0
	// color type p_sq k_sq
	
	always @ (posedge clk_50) begin
		if (reset == 1) begin
			piece_type <= 0;
			piece_color_white <= 0;
			piece_square_white <= 0;
			write_en <= 0;
			index_reset <= 0;
			active <= 1'd_0;
			counter <= 0;
			state <= 0;
			i <= 0;
			sel <= 0;
			go <= 0;
		end
		else if ( buffer1) begin
			
			buffer1 <= 0;
		end
		else if (state == 0) begin
			index_reset <= i;
			i <= i + 1;
			buffer1 <= 1;
			if (i == 40960)
				state <= 1;
		end
		else if (buffer2) begin
			buffer2 <= 0;
		
		end
		else if (state == 3'd_1) begin
			write_en <= 1;
			sel <= 1;
			king_square_white <= 6'd_4;
			king_square_black <= 6'd_3;
			state <= 3'd_2;
		end
		else if (state == 3'd_2) begin
			active <= 1;
			case(counter)
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
			counter <= counter + 1;
			if(counter > 32'd_29)
				state <= 3'd_3;
			buffer2 <= 1;

		end
		else if (state == 3) begin
			go <= 1;
			state <= 4;
		end
		else if (state == 4) begin
			go <= 0;
			state <= state;
		end
	end //ends always block

	assign addr_black = (sel == 0)? index_reset : index_black;
	assign addr_white = (sel == 0)? index_reset : index_white;
	

	wire [15:0] read_data_weights1_white, read_data_weights1_black;
	reg weight_we;
	wire w_en_out1_white, w_en_out1_black;
	wire read_data1_white, read_data1_black;
	reg [15:0] write_addr_weights1_white, write_addr_weights1_black;
	reg [15:0] write_data_weights1_white, write_data_weights1_black;
	wire [15:0] read_addr1_white, read_addr1_black;
	wire [7:0] write_addr1_white, write_addr1_black;
	wire [7:0] write_data1_white, write_data1_black;
	wire trigger1_white, trigger1_black;
	reg ready1;

	M10K_input input_white(
		.q(read_data1_white),
		.d(active),
		.write_address(addr_white),
		.read_address(read_addr1_white),
		.we(write_en),
		.clk(clk_50)
		);

	M10K_input input_black(
		.q(read_data1_black),
		.d(active),
		.write_address(addr_black),
		.read_address(read_addr1_black),
		.we(write_en),
		.clk(clk_50)
		);


	M10K_40960_weights weights_white1(
		.q(read_data_weights1_white),
		.d(write_data_weights1_white),
		.write_address(write_addr_weights1_white),
		.read_address(read_addr1_white),
		.we(weight_we),
		.clk(clk_50)
		);

	M10K_40960_weights weights_black1(
		.q(read_data_weights1_black),
		.d(write_data_weights1_black),
		.write_address(write_addr_weights1_black),
		.read_address(read_addr1_black),
		.we(weight_we),
		.clk(clk_50)
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
		.trigger(trigger1_white),
		.clk(clk_50),
		.write_out(w_en_out1_white),
		.done(done1_w)
		);
	linear_40960_256 linear1_black(
		.read_data_weights(read_data_weights1_black),
		.read_data(read_data1_black),//from inputs
		.reset(go),
		.ready(ready1),
		.write_addr_out(write_addr1_black),
		.write_data_out(write_data1_black),
		.read_addr(read_addr1_black), //to dual port and inputs
		.trigger(trigger1_black),
		.clk(clk_50),
		.write_out(w_en_out1_black),
		.done(done1_b)
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
		.clk(clk_50)
		);
	M10K_linear_out1 linear1_black_out(  //256
		.q(read_data_comb_black),
		.d(write_data1_black),
		.write_address(write_addr1_black),
		.read_address(read_addr_comb_black),
		.we(w_en_out1_black),
		.clk(clk_50)
		);
	// COMB = FSM
	reg [2:0] comb_state;
	reg [31:0] counter_comb;
	reg proceed_512, buffer_comb;
	reg [7:0] write_data_comb; 
	reg [9:0] write_addr_comb;
	reg w_en_comb;


	always @ (posedge clk_50) begin
		if (done1_b || done1_w) begin
			comb_state <= 0;
			proceed_512 <= 0;
			buffer_comb <= 0;
			counter_comb <= 0;
			w_en_comb <= 1;
		end
		else if (comb_state == 0) begin
			read_addr_comb_black <= counter_comb;
			read_addr_comb_white <= counter_comb;
			comb_state <= 1;
			buffer_comb <= 1;
		end
		else if (buffer_comb == 1)
			buffer_comb <= 0;
		else if (comb_state == 1) begin
			write_data_comb <= read_data_comb_white;
			write_addr_comb <= counter_comb;
			comb_state <= 3'd_2;
		end
		else if (comb_state == 3'd_2) begin
			write_data_comb <= read_data_comb_black;
			write_addr_comb <= counter_comb + 32'd_256;
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

	wire [7:0] read_data2;
	wire [9:0] read_addr2;

	wire [7:0] read_data_weights2; 
	reg [7:0] write_data_weights_512;
	reg [9:0] write_addr_weights_512;
	reg weight_we_512;

	M10K_512_weights weights_512(   //512
		.q(read_data_weights2),
		.d(write_data_weights_512),
		.write_address(write_addr_weights_512),
		.read_address(read_addr2),
		.we(weight_we_512),
		.clk(clk_50)
		);


	M10K_comb_512 comb(   //512
		.q(read_data2),
		.d(write_data_comb),
		.write_address(write_addr_comb),
		.read_address(read_addr2),
		.we(w_en_comb),
		.clk(clk_50)
		);


	wire [7:0] write_data2;
	wire [5:0] write_addr2;
	wire w_en_out_2;
	reg ready2;
	wire trigger2; 
	wire proceed_32a;

	linear_512_32 linear2 (
		.read_data_weights(read_data_weights2),
		.read_data(read_data2), //from inputs
		.reset(proceed_512),
		.ready(ready2),
		.write_addr_out(write_addr2),
		.write_data_out(write_data2),
		.read_addr(read_addr2), //to dual port and inputs
		.trigger(trigger2),
		.clk(clk_50),
		.write_out(w_en_out_2),
		.done(proceed_32a)
	);

	wire [7:0] read_data3;
	wire [5:0] read_addr3;

	M10K_linear_out_2_3 linear2_out (	   //32
		.q(read_data3),
		.d(write_data2),
		.write_address(write_addr2),
		.read_address(read_addr3),
		.we(w_en_out_2),
		.clk(clk_50)
		);
	
	wire [7:0] write_data3;
	wire [5:0] write_addr3;
	wire w_en_out_3, trigger3;
	reg ready3;
	wire proceed_32b;

	wire [7:0] read_data_weights3;
	reg [7:0] write_data_weights_32a;
	reg [5:0] write_addr_weights_32a;
	reg weight_we_32a;

	M10K_32_weights weights_32a (   
		.q(read_data_weights3),
		.d(write_data_weights_32a),
		.write_address(write_addr_weights_32a),
		.read_address(read_addr3),
		.we(weight_we_32a),
		.clk(clk_50)
		);

	linear_32_32 linear3 (
		.read_data_weights(read_data_weights3),
		.read_data(read_data3), //from inputs
		.reset(proceed_32a),
		.ready(ready3),
		.write_addr_out(write_addr3),
		.write_data_out(write_data3),
		.read_addr(read_addr3), //to dual port and inputs
		.trigger(trigger3),
		.clk(clk_50),
		.write_out(w_en_out_3),
		.done(proceed_32b)
	);

	wire [7:0] read_data4;
	wire [5:0] read_addr4;

	M10K_linear_out_2_3 linear3_out (	   //32
		.q(read_data4),
		.d(write_data3),
		.write_address(write_addr3),
		.read_address(read_addr4),
		.we(w_en_out_3),
		.clk(clk_50)
	);


	reg ready4;
	wire [31:0] eval; 

	wire [7:0] read_data_weights4;
	reg [7:0]  write_data_weights_32b;
	reg [5:0] write_addr_weights_32b;
	reg weight_we_32b;

	M10K_32_weights weights_32b (   
		.q(read_data_weights4),
		.d(write_data_weights_32b),
		.write_address(write_addr_weights_32b),
		.read_address(read_addr4),
		.we(weight_we_32b),
		.clk(clk_50)
	);

	linear_32_1 linear4 (
		.read_data_weights(read_data_weights4),
		.read_data(read_data4), //from inputs
		.reset(proceed_32b),
		.ready(ready4),
		.clk(clk_50),
		.read_addr(read_addr4),
		.eval(eval)
	);



// hps sim
reg [1:0] hps_state, hps_state_2, hps_state_3, hps_state_4;
reg [31:0] counter_weights, counter_weights_512, counter_weights_32a, counter_weights_32b;

//assign trigger1_B = trigger1_A;

always @ (posedge clk_50) begin  // Loading 40960 weights
	if (trigger1_white || trigger1_black) begin
		hps_state <= 0;
		write_data_weights1_white <= 0;
		write_data_weights1_black <= 0;
		write_addr_weights1_white <= 0;
		write_addr_weights1_white <= 0;
		counter_weights <= 0;
		weight_we <= 1;
	end
	else if (hps_state == 0) begin
		if  (counter_weights < 16'd_40960) begin
			write_data_weights1_white <= 16'd_1 << 5; //CHANGE THIS!!
			write_data_weights1_black <= 16'd_1 << 5; 
			write_addr_weights1_white <= counter_weights;  
			write_addr_weights1_black <= counter_weights;
		end
		else begin
			write_data_weights1_white <= 16'd_3 << 8; //writing bias to index 40960
			write_data_weights1_black <= 16'd_3 << 8;
			write_addr_weights1_white <= counter_weights;  
			write_addr_weights1_black <= counter_weights;
			hps_state <= 1;
		end
		counter_weights <= counter_weights + 1;
	end
	else if (hps_state == 1) begin
		weight_we <= 0;
		ready1 <= 1;
		hps_state <= 2;
	end
	else if (hps_state == 2) begin
		ready1 <= 0;
		weight_we <= 0;
		hps_state <= hps_state;
	end
end
	

always @ (posedge clk_50) begin // Loading 512 weights
	if (trigger2) begin
		hps_state_2 <= 0;
		write_data_weights_512 <= 0;
		counter_weights_512 <= 0;
		weight_we_512 <= 1;
	end
	else if (hps_state_2 == 0) begin
		if  (counter_weights_512 < 10'd_512) begin
			write_data_weights_512 <= 8'd_1 << 6; //CHANGE THIS!!
			write_addr_weights_512 <= counter_weights_512;
		end
		else begin
			write_data_weights_512 <= 8'd_3 << 3; //writing bias to index 40960
			write_addr_weights_512 <= counter_weights_512;
			hps_state_2 <= 1;
		end
		counter_weights_512 <= counter_weights_512 + 1;
	end
	else if (hps_state_2 == 1) begin
		weight_we_512 <= 0;
		ready2 <= 1;
		hps_state_2 <= 2;
	end
	else if (hps_state_2 == 2) begin
		ready2 <= 0;
		weight_we_512 <= 0;
		hps_state_2 <= hps_state_2;
	end
end	
		
always @ (posedge clk_50) begin // Loading 32a weights
	if (trigger3) begin
		hps_state_3 <= 0;
		write_data_weights_32a <= 0;
		counter_weights_32a <= 0;
		weight_we_32a <= 1;
	end
	else if (hps_state_3 == 0) begin
		if  (counter_weights_32a < 6'd_32) begin
			write_data_weights_32a <= 8'd_1 << 6; //CHANGE THIS!!
			write_addr_weights_32a <= counter_weights_32a;
		end
		else begin
			write_data_weights_32a <= 8'd_3 << 3; //writing bias to index 40960
			write_addr_weights_32a <= counter_weights_32a;
			hps_state_3 <= 1;
		end
		counter_weights_32a <= counter_weights_32a + 1;
	end
	else if (hps_state_3 == 1) begin
		weight_we_32a <= 0;
		ready3 <= 1;
		hps_state_3 <= 2;
	end
	else if (hps_state_3 == 2) begin
		ready3 <= 0;
		weight_we_32a <= 0;
		hps_state_3 <= hps_state_3;
	end
end	

always @ (posedge clk_50) begin // Loading 32b weights
	if (proceed_32b) begin
		hps_state_4 <= 0;
		write_data_weights_32b <= 0;
		counter_weights_32b <= 0;
		weight_we_32b <= 1;
	end
	else if (hps_state_4 == 0) begin
		if  (counter_weights_32b < 6'd_32) begin
			write_data_weights_32b <= 8'd_1 << 6; //CHANGE THIS!!
			write_addr_weights_32b <= counter_weights_32b;
		end
		else begin
			write_data_weights_32b <= 8'd_3 << 3; //writing bias to index 40960
			write_addr_weights_32b <= counter_weights_32b;
			hps_state_4 <= 1;
		end
		counter_weights_32b <= counter_weights_32b + 1;
	end
	else if (hps_state_4== 1) begin
		weight_we_32b <= 0;
		ready4 <= 1;
		hps_state_4 <= 2;
	end
	else if (hps_state_4 == 2) begin
		ready4 <= 0;
		weight_we_32b <= 0;
		hps_state_4 <= hps_state_4;
	end
end	

//add function that applies weights to layer and resizes
//inputs: input size, output size, read_data from input, read_data from weights, read datat from bias vector
//outputs: output write data
//add function for clipped relu from 16 bit to 8 bit
//inputs: input size, output size = input size, clipped max, read data input
//outputs: write data output

//layer 1_W and 1_B: input size 40960, output size 256, weight matrix 256 x 40960, bias vector 256
//clipped relu
//*combine both vectors
//layer 2: input size 512, output size 32, weight matrix 512 x 32, bias vector of 32 
//clipped relu
//layer 3: input size 32, output size 32, weight matrix 32 x 32, bias vector of 32
//clipped relu
//layer 4: input size 32, output size 1, weight matrix 32 x 1, bias scalar of 1

endmodule



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
    reg mem [40960:0]  /* synthesis ramstyle = "no_rw_check, M10K" */;
	 
    always @ (posedge clk) begin
        if (we) begin
            mem[write_address] <= d;
        end
        q <= mem[read_address]; // q doesn't get d in this clock cycle
    end
endmodule

module M10K_40960_weights(
    output reg [15:0] q,
    input [15:0] d,
    input [15:0] write_address, read_address,
    input we, clk
);

    reg [15:0] mem [40960:0]  /* synthesis ramstyle = "no_rw_check, M10K" */;
	 
    always @ (posedge clk) begin
        if (we) begin
            mem[write_address] <= d;
        end
        q <= mem[read_address]; // q doesn't get d in this clock cycle
    end
endmodule

module M10K_512_weights(
    output reg [7:0] q,
    input [7:0] d,
    input [9:0] write_address, read_address,
    input we, clk
);

    reg [7:0] mem [512:0]  /* synthesis ramstyle = "no_rw_check, M10K" */;
	 
    always @ (posedge clk) begin
        if (we) begin
            mem[write_address] <= d;
        end
        q <= mem[read_address]; // q doesn't get d in this clock cycle
    end
endmodule

module M10K_32_weights(
    output reg [7:0] q,
    input [7:0] d,
    input [5:0] write_address, read_address,
    input we, clk
);

    reg [7:0] mem [32:0]  /* synthesis ramstyle = "no_rw_check, M10K" */;
	 
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

    reg [7:0] mem [512:0]  /* synthesis ramstyle = "no_rw_check, M10K" */;
	 
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

    reg [7:0] mem [32:0]  /* synthesis ramstyle = "no_rw_check, M10K" */;
	 
    always @ (posedge clk) begin
        if (we) begin
            mem[write_address] <= d;
        end
        q <= mem[read_address]; // q doesn't get d in this clock cycle
    end
endmodule

module linear_40960_256(
	input reg [15:0] read_data_weights, //read addr for m10k that stores only one row of weights
	input reg read_data,
	input reset,
	input reg ready, //hps tell fpga finished filling dual port
	input clk, 
	output reg [15:0] read_addr,
	output reg [7:0] write_addr_out,
	output reg [7:0] write_data_out,
	output reg trigger, //fpga tell hps fill new row to dual port
	output reg write_out,
	output reg done
	
);
	
	reg [31:0] counter, out_counter;
	reg [15:0] temp_sum, sum_out, bias; //temp_sum accumalate, sum_out= adding bias
	reg [3:0] state;
	reg buffer, buffer1;
		
	always @ (posedge clk) begin
		if (reset) begin
			state <= 0;
			counter <= 0;
			out_counter <= 0;
			temp_sum <= 0;
			buffer <= 0;
			buffer1 <= 0;
			trigger <= 1;
			sum_out <= 0;
			write_out <= 0;
			done <= 0;
		end
		else if (trigger == 1) 
			trigger <= 0;
		else if (state == 0 && ready) begin //set read address for both weights and inputs
			read_addr <= 32'd_40960; 
			state <= 4'd_1;
			buffer <= 1;
		end
		else if (buffer == 1) begin
			buffer <= 0;
		end
		else if (state == 4'd_1) begin //set read address for both weights and inputs
			bias <= read_data_weights; 
			state <= 2;
		end
		else if (state == 4'd_2) begin //set read address for both weights and inputs
			read_addr <= counter; 
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
			counter <= counter + 1;
			if (counter < 32'd_40960) //increment through all 40960 inputs
				state <= 4'd_2;
			else begin
				write_out <= 1;
				state <= 4'd_4;
			end
		end
		else if (state == 4'd_4) begin //reload next row of weights to intermediate weights m10k
			temp_sum <= temp_sum + bias; //send full row sum to output
			
			if(temp_sum[15] == 1)
				sum_out <= 0;
			else if (temp_sum > 16'b_001_1111111111111)
				sum_out <= 	16'b_001_1111111111111; 
			else
				sum_out <= temp_sum; 
			temp_sum <= 0;
			write_data_out <= sum_out[15:8];
			write_addr_out <= out_counter; //count up next desired output row
			out_counter <= out_counter + 1;
			counter <= 0;
			if (out_counter < 32'd_256) begin //increment through all 256 desired outputs
				state <= 0;
				trigger <= 1;
			end
			else begin
				state <= 4'd_5;
				done <= 1;
			end
		end //011110_00000 == 30; 011_1100;   
		else if (state == 4'd_5) begin //end state
			state <= state;
			write_out <= 0;
			done <= 0;
		end
		else begin
			trigger <= 0;
			state <= state;
		end
	end
endmodule

module linear_512_32(
	input reg [7:0] read_data_weights, //read addr for m10k that stores only one row of weights
	input reg [7:0] read_data,
	input reset,
	input reg ready, //hps tell fpga finished filling dual port
	input clk, 
	output reg [9:0] read_addr,
	output reg [5:0] write_addr_out,
	output reg [7:0] write_data_out,
	output reg trigger, //fpga tell hps fill new row to dual port
	output reg write_out,
	output reg done
	
);
	
	reg [31:0] counter, out_counter;
	reg [15:0] temp_sum; 
	wire [7:0] temp_mult;
	reg [7:0] sum_out, bias; //temp_sum accumalate, sum_out= adding bias
	reg [3:0] state;
	reg buffer, buffer1;
	
	signed_mult mult_512 (temp_mult, read_data_weights, read_data);
	always @ (posedge clk) begin
		if (reset) begin
			state <= 0;
			counter <= 0;
			out_counter <= 0;
			temp_sum <= 0;
			buffer <= 0;
			buffer1 <= 0;
			trigger <= 1;
			sum_out <= 0;
			write_out <= 0;
		end
		else if (trigger == 1) 
			trigger <= 0;
		else if (state == 0 && ready) begin //set read address for both weights and inputs
			read_addr <= 32'd_512; 
			state <= 4'd_1;
			buffer <= 1;
		end
		else if (buffer == 1) begin
			buffer <= 0;
		end
		else if (state == 4'd_1) begin //set read address for both weights and inputs
			bias <= read_data_weights; 
			state <= 2;
		end
		else if (state == 4'd_2) begin //set read address for both weights and inputs
			read_addr <= counter; 
			state <= 4'd_3;
			buffer1 <= 1;
		end
		else if (buffer1 == 1) begin
			buffer1 <= 0;
		end
		else if (state == 4'd_3) begin //multiplying input data by weights
			
			temp_sum <= temp_sum + temp_mult; //accumulating weights for active

			counter <= counter + 1;
			if (counter < 32'd_512) //increment through all 40960 inputs
				state <= 4'd_2;
			else begin
				write_out <= 1;
				state <= 4'd_4;
			end
		end
		else if (state == 4'd_4) begin //reload next row of weights to intermediate weights m10k
			temp_sum <= (temp_sum + {8'b_00000000, bias}); //send full row sum to output
			
			if(temp_sum[15] == 1)
				sum_out <= 0;
			else if (temp_sum > 16'b_00111111)
				sum_out <= 8'b_001_11111;
			else
				sum_out <= temp_sum[7:0]; 
			temp_sum <= 0;
			write_data_out <= sum_out;
			write_addr_out <= out_counter; //count up next desired output row
			out_counter <= out_counter + 1;
			counter <= 0;
			if (out_counter < 32'd_32) begin //increment through all 256 desired outputs
				state <= 0;
				trigger <= 1;
			end
			else begin
				state <= 4'd_5;
				done <= 1;
			end
		end
		else if (state == 4'd_5) begin //end state
			state <= state;
			write_out <= 0;
			done <= 0;
		end
		else begin
			trigger <= 0;
			state <= state;
		end
	end
endmodule

module linear_32_32(
	input reg [7:0] read_data_weights, //read addr for m10k that stores only one row of weights
	input reg [7:0] read_data,
	input reset,
	input reg ready, //hps tell fpga finished filling dual port
	input clk, 
	output reg [5:0] read_addr,
	output reg [5:0] write_addr_out,
	output reg [7:0] write_data_out,
	output reg trigger, //fpga tell hps fill new row to dual port
	output reg write_out,
	output reg done
	
);
	
	reg [31:0] counter, out_counter;
	reg [15:0] temp_sum; 
	wire [7:0] temp_mult;
	reg [7:0] sum_out, bias; //temp_sum accumalate, sum_out= adding bias
	reg [3:0] state;
	reg buffer, buffer1;
	
	signed_mult mult_32a (temp_mult, read_data_weights, read_data);

	always @ (posedge clk) begin
		if (reset) begin
			state <= 0;
			counter <= 0;
			out_counter <= 0;
			temp_sum <= 0;
			buffer <= 0;
			buffer1 <= 0;
			trigger <= 1;
			sum_out <= 0;
			write_out <= 0;
		end
		else if (trigger == 1) 
			trigger <= 0;
		else if (state == 0 && ready) begin //set read address for both weights and inputs
			read_addr <= 32'd_32; 
			state <= 4'd_1;
			buffer <= 1;
		end
		else if (buffer == 1) begin
			buffer <= 0;
		end
		else if (state == 4'd_1) begin //set read address for both weights and inputs
			bias <= read_data_weights; 
			state <= 2;
		end
		else if (state == 4'd_2) begin //set read address for both weights and inputs
			read_addr <= counter; 
			state <= 4'd_3;
			buffer1 <= 1;
		end
		else if (buffer1 == 1) begin
			buffer1 <= 0;
		end
		else if (state == 4'd_3) begin //multiplying input data by weights
			
			temp_sum <= temp_sum + temp_mult; //accumulating weights for active
			
			counter <= counter + 1;
			if (counter < 32'd_32) //increment through all 40960 inputs
				state <= 4'd_2;
			else begin
				write_out <= 1;
				state <= 4'd_4;
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
			write_addr_out <= out_counter; //count up next desired output row
			out_counter <= out_counter + 1;
			counter <= 0;
			if (out_counter < 32'd_32) begin //increment through all 256 desired outputs
				state <= 0;
				trigger <= 1;
			end
			else begin
				state <= 4'd_5;
				done <= 1;
			end
		end
		else if (state == 4'd_5) begin //end state
			state <= state;
			write_out <= 0;
			done <= 0;
		end
		else begin
			trigger <= 0;
			state <= state;
		end
	end
endmodule

module linear_32_1(
	input reg [7:0] read_data_weights, //read addr for m10k that stores only one row of weights
	input reg [7:0] read_data,
	input reset,
	input reg ready, //hps tell fpga finished filling dual port
	input clk, 
	output reg [5:0] read_addr,
	output [31:0] eval
	
);
	
	reg [31:0] counter, out_counter;
	reg [15:0] temp_sum; 
	wire [7:0] temp_mult;
	reg [7:0] sum_out, bias; //temp_sum accumalate, sum_out= adding bias
	reg [3:0] state;
	reg buffer, buffer1;
	
	signed_mult mult_32b (temp_mult, read_data_weights, read_data);

	always @ (posedge clk) begin
		if (reset) begin
			state <= 0;
			counter <= 0;
			temp_sum <= 0;
			buffer <= 0;
			buffer1 <= 0;
			sum_out <= 0;
		end
		else if (state == 0 && ready) begin //set read address for both weights and inputs
			read_addr <= 32'd_32; 
			state <= 4'd_1;
			buffer <= 1;
		end
		else if (buffer == 1) begin
			buffer <= 0;
		end
		else if (state == 4'd_1) begin //set read address for both weights and inputs
			bias <= read_data_weights; 
			state <= 2;
		end
		else if (state == 4'd_2) begin //set read address for both weights and inputs
			read_addr <= counter; 
			state <= 4'd_3;
			buffer1 <= 1;
		end
		else if (buffer1 == 1) begin
			buffer1 <= 0;
		end
		else if (state == 4'd_3) begin //multiplying input data by weights
			
			temp_sum <= temp_sum + temp_mult; //accumulating weights for active
			
			counter <= counter + 1;
			if (counter < 32'd_32) //increment through all 40960 inputs
				state <= 4'd_2;
			else begin
				state <= 4'd_4;
			end
		end
		else if (state == 4'd_4) begin //reload next row of weights to intermediate weights m10k
			temp_sum <= (temp_sum + {8'b_00000000, bias}); //send full row sum to output
			
			sum_out <= temp_sum[7:0]; 

			temp_sum <= 0;
			counter <= 0;
		end
		else begin
			state <= state;
		end
	end
	assign eval = sum_out;
endmodule
