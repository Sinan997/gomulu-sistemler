module single_port_ram
    #(
        parameter veriGenisligi = 8,
        parameter addresGenisligi = 10
    )
    (
        input clock,
        input write_per,
        input [addresGenisligi-1:0] addr,
        input [veriGenisligi-1:0] data_in,
        output reg [veriGenisligi-1:0] data_out
    );
 
    reg [veriGenisligi-1:0] mem [2**addresGenisligi-1:0];
 
    always @ (posedge clock) begin
        if (write_per) begin
            mem[addr] <= data_in;
        end
    end
 
    assign data_out = mem[addr];
 
endmodule