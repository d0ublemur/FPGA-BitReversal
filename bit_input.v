module bit_input(clk, bit_out, reset, addr);
    
    input clk, reset;
    output [7:0] bit_out;
    output [3:0] addr;

    wire [7:0] bits_out [7:0]; 
    reg [7:0] bit_out_d, bit_out_q;
    reg [3:0] addr_d, addr_q;

    assign bit_out = bit_out_q;
    assign addr    = addr_q;

    assign bits_out[7] = "1";
    assign bits_out[6] = "1";
    assign bits_out[5] = "1";
    assign bits_out[4] = "1";
    assign bits_out[3] = "0";
    assign bits_out[2] = "0";
    assign bits_out[1] = "1";
    assign bits_out[0] = "0";


/*
* This is to simulate the "random" times input would come from
* the keyboard.
*/
    
    initial
    begin
        #10 bit_out_d=bits_out[0];
        #4 bit_out_d=bits_out[1];
        #1 bit_out_d=bits_out[2];
        #8 bit_out_d=bits_out[3];
        #6 bit_out_d=bits_out[4];
        #2 bit_out_d=bits_out[5];
        #6 bit_out_d=bits_out[6];
        #7 bit_out_d=bits_out[7];
    end
 

/*
* I am trying to iterate address only when a new input from the keyboard is
* accepted, but if two bits have the same value, it will not see that as a
* as a change. I will have to work on this some more.
*/
  
    always @(bit_out_q)
    begin
        if (addr_q >= 4'd7)
            addr_d = 4'b0;
        else
            addr_d = addr_q + 1;
    end
    
    always @(negedge reset)
        addr_d = 4'b0;
        
    always @(posedge clk)
    begin
        addr_q <= addr_d;
        bit_out_q <= bit_out_d;
    end
        
endmodule
