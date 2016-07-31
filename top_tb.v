module top_tb;

    reg rst = 0;
    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0,top_tb);
        # 1 rst = 1;
        # 4 rst = 0; 
        # 50 $finish;
    end

    wire clk;
    wire [7:0] input_bit;
    wire [7:0] reversed_bits;
    wire [3:0] addr;
    wire [7:0] original_byte;
    wire [7:0] reversed_byte;


    //Assigning the clock to the clock wire.
    clock clk1(.clk(clk));

    //Takes clk input,
    bit_input bit_in(.clk(clk), .bit_out(input_bit), .addr(addr), .reset(rst));
    reverse_bits rev_bit(.clk(clk), .original_bits(original_byte),.reversed_bits(reversed_byte));

    message_mem message_mem1(.clk(clk), .addr(addr), .bit_in(input_bit), .byte_out(original_byte), .reset(rst));

endmodule

    

    
