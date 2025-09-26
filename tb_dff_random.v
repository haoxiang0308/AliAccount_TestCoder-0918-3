`include "d_flip_flop.v"

module tb_dff_random;

    reg clk;
    reg rst;
    reg d;
    wire q;

    d_flip_flop uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    initial begin
        // Инициализация сигналов
        clk = 0;
        rst = 0;
        d = 0;

        // Сброс
        #10 rst = 1;
        #10 rst = 0;

        // Тестирование
        #10 d = 1;
        #20 d = 0;
        #20 d = 1;
        #20 d = 0;

        // Завершение
        #10 $finish;
    end

    always #5 clk = ~clk; // Тактовый сигнал с периодом 10

endmodule