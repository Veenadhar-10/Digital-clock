module stopwatch(
    input  wire clk,
    input  wire start,
    input  wire pause,
    input  wire restart,
    output reg [31:0] count
);

    reg running;

    initial begin
        count   = 0;
        running = 0;
    end

    always @(posedge clk) begin
        if (restart) begin
            count   <= 0;
            running <= 0;
        end
        else if (start) begin
            running <= 1;
        end
        else if (pause) begin
            running <= 0;
        end

        if (running) begin
            count <= count + 1;
        end
    end
endmodule
