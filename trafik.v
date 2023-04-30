module traffic_lights(
  input clk,
  input rst,
  output reg red,
  output reg blue,
  output reg green
);

  reg [23:0] counter;
  integer saniye;

  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      counter <= 24'd0;
      red <= 1'b1;
      blue <= 1'b0;
      green <= 1'b0;
    end else begin
      if (saniye < 10) begin // Kırmızı ışık 
        red <= 1'b0;
        blue <= 1'b1;
        green <= 1'b1;
      end 

      else if (saniye < 19) begin // Sarı ışık 
        red <= 1'b0;
        blue <= 1'b1;
        green <= 1'b0;
      end 

      else if (saniye < 50) begin // Yeşil ışık 
        red <= 1'b1;
        blue <= 1'b1;
        green <= 1'b0;
      end 
      counter <= counter + 1;
      if (counter == 24'd2400_0000) begin
        counter <= 24'd0;

        saniye <= saniye + 1;
        if (saniye > 60 )begin
        saniye <= 0;
    end
      end
    end
  end
endmodule