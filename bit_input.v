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
    assign bits_out[1] = "0";
    assign bits_out[0] = "0";

    localparam  RST = 1,
                RST_N = 0;
               

    always @(*)
    begin 
        bit_out_d = bits_out[addr_q - 1];
        addr_d = addr_q + 1;
    end
    
    always @(negedge reset)
    begin
        addr_d = 4'b0;
        bit_out_d = 8'b0;
        
    end
        
        
    always @(posedge clk)
    begin
        addr_q <= addr_d;
        bit_out_q <= bit_out_d;
    end
        
endmodule
