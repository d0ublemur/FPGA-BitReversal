module message_mem(clk, reset, addr,bit_in, byte_out);

    input clk, reset;
    input [3:0] addr;
    output [7:0] byte_out;
    input [7:0] bit_in;
    reg [7:0] byte_out_d, byte_out_q;
    
    assign byte_out = byte_out_q;

    always @(addr) 
    begin
        if (!reset)
        begin
            if (bit_in == "1")
                byte_out_d[addr - 1] = 1'b1;

            else if (bit_in == "0")
                byte_out_d[addr - 1] = 1'b0;
        end
        
        else
            byte_out_d = 8'b0;

    end

    always @(posedge clk)
        byte_out_q <= byte_out_d;

endmodule
