module displayModule (estado, finish, escolhaCandidato, d1, d2, d3, d4, bcd0_0, bcd0_1, bcd0_2, bcd0_3, bcd0_4, bcd0_5, bcd1_0, bcd1_1, bcd1_2, bcd1_3, bcd1_4, bcd1_5, bcd2_0, bcd2_1, bcd2_2, bcd2_3, bcd2_4, bcd2_5, bcd3_0, bcd3_1, bcd3_2, bcd3_3, bcd3_4, bcd3_5, bcd4_0, bcd4_1, bcd4_2, bcd4_3, bcd4_4, bcd4_5, bcdo0, bcdo1, bcdo2, bcdo3, bcdo4, bcdo5, bcdo6, bcdo7, clock);

	output reg[3:0]  bcdo0, bcdo1, bcdo2, bcdo3, bcdo4, bcdo5, bcdo6, bcdo7;

	input[3:0] bcd0_0, bcd0_1, bcd0_2, bcd0_3, bcd0_4, bcd0_5, bcd1_0, bcd1_1, bcd1_2, bcd1_3, bcd1_4, bcd1_5, bcd2_0, bcd2_1, bcd2_2, bcd2_3, bcd2_4, bcd2_5, bcd3_0, bcd3_1, bcd3_2, bcd3_3, bcd3_4, bcd3_5, bcd4_0, bcd4_1, bcd4_2, bcd4_3, bcd4_4, bcd4_5, d1, d2, d3, d4;
	input[2:0] estado, escolhaCandidato;
	input finish;
	input clock;

    parameter aguardando1Dig = 3'b000;
    parameter aguardando2Dig = 3'b001;
    parameter aguardando3Dig = 3'b010;
    parameter aguardando4Dig = 3'b011;
    parameter aguardandoConfirma = 3'b100;
	 parameter resetando = 3'b111;

	 parameter mostrandoArthur = 3'b000;
    parameter mostrandoLeandro = 3'b001;
    parameter mostrandoMateus = 3'b010;
    parameter mostrandoPablo = 3'b011;
    parameter mostrandoNulo = 3'b100;

always @(posedge clock) begin
    if(finish) begin
	 
	 
    // Imprime um C no display (de candidato)
    bcdo0 = 11;
    
        case(escolhaCandidato)
        
            mostrandoArthur:begin
            
                bcdo1 = 0;
                
                bcdo2 = bcd0_5;
                bcdo3 = bcd0_4;
                bcdo4 = bcd0_3;
                bcdo5 = bcd0_2;
					 bcdo6 = bcd0_1;
					 bcdo7 = bcd0_0;
            
            end
            
            mostrandoLeandro:begin
            
                bcdo1 = 1;
                
                bcdo2 = bcd1_5;
                bcdo3 = bcd1_4;
                bcdo4 = bcd1_3;
                bcdo5 = bcd1_2;
					 bcdo6 = bcd1_1;
					 bcdo7 = bcd1_0;
            
            end
            
            mostrandoMateus:begin
            
                bcdo1 = 2;
                
                bcdo2 = bcd2_5;
                bcdo3 = bcd2_4;
                bcdo4 = bcd2_3;
                bcdo5 = bcd2_2;
					 bcdo6 = bcd2_1;
					 bcdo7 = bcd2_0;
            
            end
            
            mostrandoPablo:begin
            
                bcdo1 = 3;
                
                bcdo2 = bcd3_5;
                bcdo3 = bcd3_4;
                bcdo4 = bcd3_3;
                bcdo5 = bcd3_2;
					 bcdo6 = bcd3_1;
					 bcdo7 = bcd3_0;
            
            end
            
            mostrandoNulo:begin
				
					 // Imprime um N no display (de nulo)
				
                bcdo1 = 12;
                
                bcdo2 = bcd4_5;
                bcdo3 = bcd4_4;
                bcdo4 = bcd4_3;
                bcdo5 = bcd4_2;
					 bcdo6 = bcd4_1;
					 bcdo7 = bcd4_0;
            
            end
            
            default:begin
                
                bcdo1 = 10;
                bcdo1 = 10;
                bcdo2 = 10;
                bcdo3 = 10;
					 bcdo4 = 10;
					 bcdo5 = 10;
					 bcdo6 = 10;
					 bcdo7 = 10;
            
            end
        
        endcase
        

    end else begin
    
        case(estado)
            
                    aguardando2Dig:begin
                        
                        bcdo0 = 10;
                        bcdo1 = 10;
                        bcdo2 = 10;
                        bcdo3 = 10;
								bcdo4 = d1;
								bcdo5 = 10;
								bcdo6 = 10;
								bcdo7 = 10;
                        
                    end


                    aguardando3Dig:begin
                        
                        bcdo0 = 10;
                        bcdo1 = 10;
                        bcdo2 = 10;
                        bcdo3 = 10;
								bcdo4 = d1;
								bcdo5 = d2;
								bcdo6 = 10;
								bcdo7 = 10;
                        
                    end
            
                    aguardando4Dig:begin
                        
                        bcdo0 = 10;
                        bcdo1 = 10;
                        bcdo2 = 10;
                        bcdo3 = 10;
								bcdo4 = d1;
								bcdo5 = d2;
								bcdo6 = d3;
								bcdo7 = 10;
                        
                    end
                    
                    aguardandoConfirma:begin
                        
                        bcdo0 = 10;
                        bcdo1 = 10;
                        bcdo2 = 10;
                        bcdo3 = 10;
								bcdo4 = d1;
								bcdo5 = d2;
								bcdo6 = d3;
								bcdo7 = d4;
                        
                    end

                    default:begin
                    
                        bcdo0 = 10;
                        bcdo1 = 10;
                        bcdo2 = 10;
                        bcdo3 = 10;
								bcdo4 = 10;
								bcdo5 = 10;
								bcdo6 = 10;
								bcdo7 = 10;
                    
                    end

            endcase
    
    end

end

endmodule
