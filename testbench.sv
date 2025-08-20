`timescale 1ms / 1us

module testbench();
    // clock + alarm control
    reg clk,r,s,hour_24;
    reg [2:0] a,a_enable,a_reset,a_set;
    reg [3:0] c,e;
    reg [4:0] b,d,f;

    // alarm set inputs
    reg [2:0] ain1;
    reg [4:0] ain2,ain4;
    reg [3:0] ain3;

    // outputs
    wire [2:0] h1;
    wire [4:0] h0;
    wire [3:0] m1,s1;
    wire [4:0] m0,s0;
    wire am,pm,a_out;

    // stopwatch
    reg start,pause,restart;
    wire [31:0]count;

    // DUT
    de uut (
        .clk(clk), .r(r), .s(s), .hour_24(hour_24),
        .a(a), .b(b), .c(c), .d(d), .e(e), .f(f),
        .ain1(ain1), .ain2(ain2), .ain3(ain3), .ain4(ain4),
        .a_enable(a_enable), .a_reset(a_reset), .a_set(a_set),
        .h1(h1), .h0(h0), .m1(m1), .s1(s1), .m0(m0), .s0(s0),
        .am(am), .pm(pm), .a_out(a_out)
    );

    stopwatch xx(
        .clk(clk), .start(start), .pause(pause), .restart(restart), .count(count)
    );

    initial begin
     
	 //INPUT THE VALUES HERE
	 //#1 is 1 MILLI SECOND
	 
        $finish;
    end

    // generate clk (1Hz equivalent since timescale=1ms/1us and period=1000ms)
    initial begin
	clk=0;
        forever #500 clk=~clk;   // 1 second period
    end
endmodule
