// Определение модуля D-триггера
module d_ff (
    input clk,
    input rst,
    input d,
    output reg q
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0; // Сброс в 0
        else
            q <= d;    // Запись данных
    end

endmodule

// Тестовая плата для D-триггера
module d_ff_tb;

    reg clk;
    reg rst;
    reg d;
    wire q;

    // Подключение модуля D-триггера
    d_ff uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    // Генерация тактового сигнала (период 10 единиц)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Основной процесс тестирования
    initial begin
        // Инициализация сигналов
        rst = 1;
        d = 0;
        #10; // Ждем 10 единиц времени

        // Деактивация сброса
        rst = 0;
        #10;

        // Тестирование: подача последовательности на вход d
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 1; #10; // Проверка удержания
        d = 0; #10;

        // Повторный сброс
        rst = 1; #10;
        d = 1;   // Подаем 1 на D при активном сбросе
        #10;

        // Деактивация сброса, проверка что Q=0
        rst = 0; #10;

        // Завершение симуляции
        $display("Simulation finished.");
        $finish;
    end

    // Отслеживание изменений
    initial begin
        $monitor("Time: %0t, clk: %b, rst: %b, d: %b, q: %b", $time, clk, rst, d, q);
    end

endmodule