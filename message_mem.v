module message_mem(clk, reset, addr,bit_in, byte_out);

    input clk, reset;
    input [3:0] addr;
    output [7:0] byte_out;
    input [7:0] bit_in;
    reg [7:0] byte_out;
    


    always @(*)
    begin
        if (bit_in == "1")
        begin
            byte_out[addr - 2] = 1'b1;
        end

        else if (bit_in == "0")
        begin
            byte_out[addr - 2] = 1'b0;
        end
    end
endmodule
