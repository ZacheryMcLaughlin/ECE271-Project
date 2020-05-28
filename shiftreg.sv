module shiftreg
	(input logic reset, shift_in, clk, unload,
	 output logic [13:0] q);
	 logic [13:0] d;
	 
	 always_ff @(posedge clk, posedge reset) begin
		if (reset)begin
			q<=0;
			d<=0;
			end
		else if (unload) q <= d;
		else begin
		//for (i = 0; i<N-1; i++) begin
			//	d[i] = d[i+1];
			//	end
			
			d[13] = d[12];
			d[12] = d[11];
			d[11] = d[10];
			d[9] = d[8];
			d[8] = d[7];
			d[7] = d[6];
			d[6] = d[5];
			d[5] = d[4];
			d[4] = d[3];
			d[3] = d[2];
			d[2] = d[1];
			d[1] = d[0];
			d[0] = shift_in;
			end
		end
		
endmodule
			