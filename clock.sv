`timescale 1ms / 1us

module clock_core(
    input  wire clk,
    input  wire r,   // reset
    input  wire s,   // set
    input  wire hour_24,

    input  [2:0] a,   // set hours tens
    input  [4:0] b,   // set hours ones
    input  [3:0] c,   // set minutes tens
    input  [4:0] d,   // set minutes ones
    input  [3:0] e,   // set seconds tens
    input  [4:0] f,   // set seconds ones

    output reg [2:0] h1,
    output reg [4:0] h0,
    output reg [3:0] m1,s1,
    output reg [4:0] m0,s0,
    output reg am,pm,
    output reg [2:0] a1,
    output reg [4:0] a2,
    output reg [3:0] a3,a5,
    output reg [4:0] a4,a6
);

    reg m,n;

    initial begin
        m=0;n=0;
        a1=0;a2=0;a3=0;a4=0;a5=0;a6=0;
    end

    always @(posedge r) m <= 1;
    always @(posedge s) n <= 1;

    always @(posedge clk) begin
        if(r==1 || m==1) begin
            m=0;n=0;
            a1=0;a2=0;a3=0;a4=0;a5=0;a6=0;
        end
        else if(s==1 || n==1) begin
            a1=a; a2=b; a3=c; a4=d; a5=e; a6=f;
            n=0;
        end
        else if(n==0) begin
            a6=(a6+1)%10;
            if(a6==0) a5=(a5+1);
            if(a5==6) begin a4=a4+1; a5=0; end
            if(a4==10) begin a3=a3+1; a4=0; end
            if(a3==6) begin a2=a2+1; a3=0; end
            if(a2==10) begin a1=a1+1; a2=0; end
            if(a1==2 && a2==4) begin
                a1=0;a2=0;a3=0;a4=0;a5=0;a6=0;
            end
        end

        m1=a3; m0=a4;
        s1=a5; s0=a6;
        h1=a1; h0=a2;
        am=1'bx; pm=1'bx;

        if(hour_24==0) begin
            if(a1==0 && a2==0) begin
                h1=1; h0=2; am=1; pm=0;
            end
            else if(a1<1 || (a1==1&& a2<2)) begin
                h1=a1; h0=a2; am=1; pm=0;
            end
            else if(a1==1 && a2==2) begin
                pm=1; h1=a1; h0=a2; am=0;
            end
            else if(a1==2 && a2<2) begin
                h1=0; h0=a2+8; am=0; pm=1;
            end
            else begin
                h1=a1-1; h0=a2-2; pm=1; am=0;
            end
        end
    end
endmodule
