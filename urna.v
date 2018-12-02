module urna(valid, estado, next_estado, clock, finish, confirma, reset, digit, digito1, digito2, digito3, digito4, candidatoArthur, candidatoLeandro, candidatoMateus, candidatoPablo, candidatoNulo, votoValido);

   input clock, valid, finish, confirma, reset;
   input[3:0] digit;


   output[3:0] digito1, digito2, digito3, digito4;
   output candidatoArthur, candidatoLeandro, candidatoMateus, candidatoPablo, candidatoNulo;
	 output[2:0] estado, next_estado;

    
    reg[3:0] digito1, digito2, digito3, digito4;
    reg[3:0] next_digito1, next_digito2, next_digito3, next_digito4;

    reg[2:0] estado;
    reg[2:0] next_estado;
     
    //Indica se o voto foi válido ou nulo
    output reg[1:0] votoValido;
    reg[1:0] next_votoValido;

    //Esses registradores servem para indicar para quem foi atribuido o voto
    reg candidatoArthur, candidatoLeandro, candidatoMateus, candidatoPablo, candidatoNulo;
    reg next_candidatoArthur, next_candidatoLeandro, next_candidatoMateus, next_candidatoPablo, next_candidatoNulo;
    
    //Matriculas em BCD para fins de comparação
    parameter matriculaArthur =  16'b0011010100000011;
    parameter matriculaLeandro = 16'b0011010100010011;
    parameter matriculaMateus =  16'b0011010010001001;
    parameter matriculaPablo  =  16'b0011010010000000;
    
    //estados
    parameter aguardando1Dig = 3'b000;
    parameter aguardando2Dig = 3'b001;
    parameter aguardando3Dig = 3'b010;
    parameter aguardando4Dig = 3'b011;
    parameter aguardandoConfirma = 3'b100;
	 parameter resetando = 3'b111;

    //Bloco always responsável pela mudança de estado
    always @(posedge clock) begin
        if(~finish) begin
            if(reset) begin
		
                candidatoArthur <= 0;
                candidatoLeandro <= 0;
                candidatoMateus <= 0;
                candidatoPablo <= 0;
                candidatoNulo <= 0;

                digito1 <= 0;
                digito2 <= 0;
                digito3 <= 0;
                digito4 <= 0;

                votoValido <= 0;
                estado <= resetando;

            end

            if(~reset) begin

                candidatoArthur <= next_candidatoArthur;
                candidatoLeandro <= next_candidatoLeandro;
                candidatoMateus <= next_candidatoMateus;
                candidatoPablo <= next_candidatoPablo;
                candidatoNulo <= next_candidatoNulo;
		
		//Atribui nos registradores principais os digitos inseridos pelo usuário
                digito1 <= next_digito1;
                digito2 <= next_digito2;
                digito3 <= next_digito3;
                digito4 <= next_digito4;

                votoValido <= next_votoValido;
                estado <= next_estado;

            end
        end
    end

    //Bloco always responsável por monitorar o input valid. Toda vez que o valid tem borda de subida igual a 1, uma nova ação (novo digito, confirma, reset ou corrige) por parte do usuário foi acionada.
    always @(posedge valid) begin

            case(estado)
		//Toda vez que a urna é resetada esse estado é acionado para resetar os registradores auxiliares
					 resetando: begin
						  next_estado<=aguardando1Dig;
              next_candidatoArthur <= 0;
              next_candidatoLeandro <= 0;
              next_candidatoMateus <= 0;
              next_candidatoPablo <= 0;
              next_candidatoNulo <= 0;

              next_digito1 <= 0;
              next_digito2 <= 0;
              next_digito3 <= 0;
              next_digito4 <= 0;
					 end
		//Além de zerar todos os registradores auxiliares também recebe o primeiro digito
                aguardando1Dig: begin
                    next_candidatoArthur <= 0;
                    next_candidatoLeandro <= 0;
                    next_candidatoMateus <= 0;
                    next_candidatoPablo <= 0;
                    next_candidatoNulo <= 0;


                    next_digito2 <= 0;
                    next_digito3 <= 0;
                    next_digito4 <= 0;
                    next_digito1 <= digit;

						  next_estado <= aguardando2Dig;
                end
		//Recebe o primeiro digito
                aguardando2Dig: begin
                    next_digito2 <= digit;
						  next_estado <= aguardando3Dig;
                end
		//Recebe o terceiro digito
                aguardando3Dig: begin
                    next_digito3 <= digit;
						  next_estado <= aguardando4Dig;
                end
		//Recebe o quarto digito
                aguardando4Dig: begin
                    next_digito4 <= digit;
						  next_estado <= aguardandoConfirma;
                end
		//Caso o confirma tenha sido pressionado ele contabiliza um voto para o candidato com número equivalente ao digitado. Caso o número não seja sememlhante ao de nenhum cadidato o voto é contabilizado comcomo nulo.
                aguardandoConfirma: begin
                    case({digito1, digito2, digito3, digito4})

                        matriculaArthur: begin
                            if(confirma) begin
                                next_candidatoArthur <= 1;
                                next_votoValido <=1;
										  next_estado <= aguardando1Dig;
                            end
                        end

                        matriculaLeandro: begin
                            if(confirma) begin
                                next_candidatoLeandro <= 1;
                                next_votoValido <=1;
										  next_estado <= aguardando1Dig;
                            end
                        end

                        matriculaMateus: begin
                            if(confirma) begin
                                next_candidatoMateus <= 1;
                                next_votoValido <=1;
										  next_estado <= aguardando1Dig;
                            end
                        end

                        matriculaPablo: begin
                            if(confirma) begin
                                next_candidatoPablo <= 1;
                                next_votoValido <=1;
										  next_estado <= aguardando1Dig;
                            end
                        end

                        default: begin
                            if(confirma) begin
                                next_candidatoNulo <= 1;
                                next_votoValido <=3;
										  next_estado <= aguardando1Dig;
                            end
                        end
                    endcase
                end
            endcase
    end


endmodule
