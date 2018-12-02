module contadorBCD(clock, valor, overflow, reset, clockat);
    output reg[3:0] valor;
    output reg overflow;
    input clock, reset, clockat;
	 	 reg[3:0] next_valor;
	 reg next_overflow;

    always @(posedge clockat) begin
        if(reset) begin
            valor = 0;
				overflow = 0;
        end

		  if(~reset) begin
			  valor = next_valor;
			  overflow = next_overflow;
		  end

    end

	always @(posedge clock) begin
	if(valor == 10) begin
	next_valor = 0;
	next_overflow = 1;
	end else begin
	next_valor = valor + 1;
	next_overflow = 0;
	end
	
	
	
	end
endmodule
