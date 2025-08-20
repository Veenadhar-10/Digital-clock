module de(
    input clk,r,s,hour_24,
    input [2:0]a,
    input [4:0]b,d,f,
    input [3:0]c,e,
    input [2:0]ain1,a_enable,a_reset,a_set,
    input [4:0]ain2,ain4,
    input [3:0]ain3,

    output [2:0]h1,
    output [4:0]h0,
    output [3:0]m1,s1,
    output [4:0]m0,s0,
    output am,pm,a_out
);

    wire [2:0] a1;
    wire [4:0] a2;
    wire [3:0] a3,a5;
    wire [4:0] a4,a6;

    clock_core clock_inst(
        .clk(clk),
        .r(r), 
        .s(s), 
        .hour_24(hour_24),
        .a(a), .b(b), .c(c), .d(d), .e(e), .f(f),
        .h1(h1), .h0(h0), .m1(m1), .s1(s1), .m0(m0), .s0(s0),
        .am(am), .pm(pm),
        .a1(a1), .a2(a2), .a3(a3), .a4(a4), .a5(a5), .a6(a6)
    );

    alarm alarm_inst(
        .clk(clk), .a_set(a_set),
        .a_enable(a_enable), .a_reset(a_reset),
        .ain1(ain1), .ain2(ain2), .ain3(ain3), .ain4(ain4),
        .a1(a1), .a2(a2), .a3(a3), .a4(a4),
        .a_out(a_out)
    );
endmodule
