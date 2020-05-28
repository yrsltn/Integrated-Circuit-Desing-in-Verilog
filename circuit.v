module assignment_4(
input [7:0] inp,
input clock,
input reset,
input valid_signal,
output reg done_signal, 
output reg [7: 0] largest_num
);

reg [7:0] temp = 8'b0;
reg [4:0] counter = 5'b10100;

wire buffClk;
buf_1x clokcBuf(
.in(clock),
.out(buffClk)
);

always @(posedge buffClk or posedge reset)
begin
if(reset)
begin
	largest_num <= 8'b0;
	temp <= 8'b0;
	counter <= 5'b10100;
	done_signal <= 1'b0; 
	
end

else if(valid_signal)
begin
	if(counter>5'b00001)
		begin
			if(inp>=temp) begin
				temp <= inp;
				largest_num = temp;
				counter <= counter - 5'b00001; 		
			end
		
		end
end

else if(counter == 5'b00001)
		begin
			done_signal<= 1'b1;
		end
end


endmodule
