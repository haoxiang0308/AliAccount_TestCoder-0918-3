// Тестовая плата для D-триггера
`timescale 1ns/1ps

module d_flipflop_tb;

    // Объявление сигналов
    reg clk;
    reg reset;
    reg d;
    wire q;

    // Инстанс модуля для тестирования
    d_flipflop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Генерация тактового сигнала
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Тактовый сигнал с периодом 10 нс
    end

    // Тестовые векторы
    initial begin
        // Инициализация сигналов
        reset = 1;
        d = 0;
        
        // Сброс
        #10;
        reset = 0;
        
        // Тестирование различных значений D
        #10 d = 1;     // q должен стать 1 на следующем фронте
        #10 d = 0;     // q должен стать 0 на следующем фронте
        #10 d = 1;     // q должен стать 1 на следующем фронте
        #10 d = 1;     // q должен остаться 1
        
        // Проверка сброса
        #10 reset = 1; // q должен стать 0 немедленно
        #10 reset = 0;
        #10 d = 1;
        
        // Завершение симуляции
        #20 $finish;
    end

    // Отображение результатов
    initial begin
        $monitor("Time: %0t | Reset: %b | D: %b | Q: %b", $time, reset, d, q);
    end

endmodule