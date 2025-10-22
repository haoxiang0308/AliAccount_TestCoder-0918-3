// Тестовая плата для D-триггера
`timescale 1ns/1ps

module testbench_d_flipflop();

    // Объявление сигналов
    reg clk;
    reg reset;
    reg d;
    wire q;

    // Инстанс D-триггера
    d_flipflop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Генерация тактового сигнала (10 нс период)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Переключение каждые 5 нс, период 10 нс
    end

    // Основной тест
    initial begin
        // Инициализация сигналов
        reset = 1;
        d = 0;
        
        // Сброс
        #10;
        reset = 0;
        
        // Тестирование различных значений D
        #10;
        d = 1;
        #10;
        d = 0;
        #10;
        d = 1;
        #10;
        d = 0;
        
        // Проверка работы сброса
        #10;
        reset = 1;
        #10;
        reset = 0;
        
        // Дополнительные тесты
        d = 1;
        #10;
        d = 0;
        #10;
        
        // Завершение симуляции
        $finish;
    end

    // Отслеживание сигналов
    initial begin
        $monitor("Time: %0t | Reset: %b | D: %b | Q: %b", $time, reset, d, q);
    end

endmodule