module alarm(
    input  wire clk,
    input  wire a_set,
    input  wire [2:0] a_enable, a_reset,
    input  wire [2:0] ain1, //alarm hour tens place
    input  wire [4:0] ain2,	 //alarm units tens place
    input  wire [3:0] ain3, //alarm minute tens place
    input  wire [4:0] ain4, //alarm minute ones place

    input  wire [2:0] a1,
    input  wire [4:0] a2,
    input  wire [3:0] a3,
    input  wire [4:0] a4,

    output reg a_out
);

    int a_timer=60; // alarm timer = 60 sec by default
    int a_c=0;
    int w=0;

    always @(posedge clk) begin
        if(a_set==1) begin
            if(a_enable==1 && ((a1==ain1 && a2==ain2 && a3==ain3 && a4==ain4) || w==1) && a_reset==0) begin
                a_out=1; w=1;
                if(a_c<a_timer) a_c=a_c+1;
                else begin
                    a_c=0; w=0;
                end
            end
            else begin
                a_out=0; a_c=0; w=0;
            end
        end
        else begin
            a_out=0; a_c=0; w=0;
        end
    end
endmodule
