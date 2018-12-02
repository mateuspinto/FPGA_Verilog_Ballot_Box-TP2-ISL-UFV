`include "urna.v"
`include "contadorbcd.v"
`include "clock1unit.v"

module testbench ();

      wire clock;

      clock1unit clock0 (.clock(clock));

      urna urna0 (.clock(clock), .digit(digitar), .valid(valid), .confirma(confirma), .finish(finish), .reset(resetUrna), .next_estado(next_estado), .candidatoArthur(candidatoArthur), .estado(estado),
      				.candidatoPablo(candidatoPablo), .candidatoMateus(candidatoMateus), .candidatoNulo(candidatoNulo), .candidatoLeandro(candidatoLeandro), .digito1(digito1), .digito2(digito2), .digito3(digito3),
      				.digito4(digito4), .votoValido(votoValido));

      contadorBCD bcdModule0_0 (.clock(candidatoArthur), .valor(bcd0_0), .overflow(bcdOver0_0_1), .reset(reset));
      contadorBCD bcdModule0_1 (.clock(bcdOver0_0_1), .valor(bcd0_1), .overflow(bcdOver0_1_2), .reset(reset));
      contadorBCD bcdModule0_2 (.clock(bcdOver0_1_2), .valor(bcd0_2), .overflow(bcdOver0_2_3), .reset(reset));
      contadorBCD bcdModule0_3 (.clock(bcdOver0_2_3), .valor(bcd0_3), .overflow(bcdOver0_3_4), .reset(reset));
      contadorBCD bcdModule0_4 (.clock(bcdOver0_3_4), .valor(bcd0_4), .overflow(bcdOver0_4_5), .reset(reset));
      contadorBCD bcdModule0_5 (.clock(bcdOver0_4_5), .valor(bcd0_5), .overflow(), .reset(reset));

      contadorBCD bcdModule1_0 (.clock(candidatoLeandro), .valor(bcd1_0), .overflow(bcdOver1_0_1), .reset(reset));
      contadorBCD bcdModule1_1 (.clock(bcdOver1_0_1), .valor(bcd1_1), .overflow(bcdOver1_1_2), .reset(reset));
      contadorBCD bcdModule1_2 (.clock(bcdOver1_1_2), .valor(bcd1_2), .overflow(bcdOver1_2_3), .reset(reset));
      contadorBCD bcdModule1_3 (.clock(bcdOver1_2_3), .valor(bcd1_3), .overflow(bcdOver1_3_4), .reset(reset));
      contadorBCD bcdModule1_4 (.clock(bcdOver1_3_4), .valor(bcd1_4), .overflow(bcdOver1_4_5), .reset(reset));
      contadorBCD bcdModule1_5 (.clock(bcdOver1_4_5), .valor(bcd1_5), .overflow(), .reset(reset));

      contadorBCD bcdModule2_0 (.clock(candidatoMateus), .valor(bcd2_0), .overflow(bcdOver2_0_1), .reset(reset));
      contadorBCD bcdModule2_1 (.clock(bcdOver2_0_1), .valor(bcd2_1), .overflow(bcdOver2_1_2), .reset(reset));
      contadorBCD bcdModule2_2 (.clock(bcdOver2_1_2), .valor(bcd2_2), .overflow(bcdOver2_2_3), .reset(reset));
      contadorBCD bcdModule2_3 (.clock(bcdOver2_2_3), .valor(bcd2_3), .overflow(bcdOver2_3_4), .reset(reset));
      contadorBCD bcdModule2_4 (.clock(bcdOver2_3_4), .valor(bcd2_4), .overflow(bcdOver2_4_5), .reset(reset));
      contadorBCD bcdModule2_5 (.clock(bcdOver2_4_5), .valor(bcd2_5), .overflow(), .reset(reset));

      contadorBCD bcdModule3_0 (.clock(candidatoPablo), .valor(bcd3_0), .overflow(bcdOver3_0_1), .reset(reset));
      contadorBCD bcdModule3_1 (.clock(bcdOver3_0_1), .valor(bcd3_1), .overflow(bcdOver3_1_2), .reset(reset));
      contadorBCD bcdModule3_2 (.clock(bcdOver3_1_2), .valor(bcd3_2), .overflow(bcdOver3_2_3), .reset(reset));
      contadorBCD bcdModule3_3 (.clock(bcdOver3_2_3), .valor(bcd3_3), .overflow(bcdOver3_3_4), .reset(reset));
      contadorBCD bcdModule3_4 (.clock(bcdOver3_3_4), .valor(bcd3_4), .overflow(bcdOver3_4_5), .reset(reset));
      contadorBCD bcdModule3_5 (.clock(bcdOver3_4_5), .valor(bcd3_5), .overflow(), .reset(reset));

      contadorBCD bcdModule4_0 (.clock(candidatoNulo), .valor(bcd4_0), .overflow(bcdOver4_0_1), .reset(reset));
      contadorBCD bcdModule4_1 (.clock(bcdOver4_0_1), .valor(bcd4_1), .overflow(bcdOver4_1_2), .reset(reset));
      contadorBCD bcdModule4_2 (.clock(bcdOver4_1_2), .valor(bcd4_2), .overflow(bcdOver4_2_3), .reset(reset));
      contadorBCD bcdModule4_3 (.clock(bcdOver4_2_3), .valor(bcd4_3), .overflow(bcdOver4_3_4), .reset(reset));
      contadorBCD bcdModule4_4 (.clock(bcdOver4_3_4), .valor(bcd4_4), .overflow(bcdOver4_4_5), .reset(reset));
      contadorBCD bcdModule4_5 (.clock(bcdOver4_4_5), .valor(bcd4_5), .overflow(), .reset(reset));

      initial begin
            $dumpfile("urnaEletronica.vcd");
            $dumpvars(0, testbench);

            $finish;

end

endmodule
