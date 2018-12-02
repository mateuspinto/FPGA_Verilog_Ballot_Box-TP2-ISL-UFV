module divisorClock(in_clock, out_clock);

input wire in_clock;
output reg out_clock = 0;

reg[31:0] fraclock = 0;

always @(posedge in_clock) begin
fraclock <=  fraclock + 1;
if (fraclock == 50000000) begin
fraclock <= 0;
out_clock <= ~out_clock;
end
end

endmodule