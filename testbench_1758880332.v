// Тестовая плата для D-триггера
`timescale 1ns / 1ps

module testbench_dff;
    reg clk;
    reg rst_n;
    reg d;
    wire q;

    // Инстанс D-триггера (предполагается, что модуль называется dff)
    dff uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q)
    );

    // Генерация тактового сигнала
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Тактовый период 10
    end

    // Основной процесс теста
    initial begin
        // Инициализация сигналов
        d = 0;
        rst_n = 0;

        // Сброс
        #15;
        rst_n = 1; // Отпускание сброса

        // Тестирование
        #10;
        d = 1; // Подаем 1 на D
        #10;
        d = 0; // Подаем 0 на D
        #10;
        d = 1; // Подаем 1 на D
        #20;

        // Завершение
        $finish;
    end

    // Мониторинг сигналов
    initial begin
        $monitor("Time: %t, CLK: %b, RST_N: %b, D: %b, Q: %b", $time, clk, rst_n, d, q);
    end

endmodule