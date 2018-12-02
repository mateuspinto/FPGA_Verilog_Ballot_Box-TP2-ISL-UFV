module votoValido(votoValido, valido, nulo);

input[1:0] votoValido;
output valido, nulo;

assign valido = votoValido[0] & ~votoValido[1];
assign nulo = votoValido[0] & votoValido[1];

endmodule