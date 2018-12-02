module clock1unit(output clk);

reg clk;

initial begin
 clk = 0;
end

always begin
  #1 clk = ~clk;

end

endmodule
