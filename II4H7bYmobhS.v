// Тестовая плата для D-триггера
module d_flipflop_tb;
    reg clk;
    reg rst;
    reg d;
    wire q;

    // Инстанс тестируемого модуля
    d_flipflop uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    // Генерация тактового сигнала (период 10 единиц времени)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Переключение каждые 5 единиц времени
    end

    // Тестовые векторы
    initial begin
        $monitor("Time: %0t | clk: %b | rst: %b | d: %b | q: %b", $time, clk, rst, d, q);

        // Инициализация
        rst = 1;
        d = 0;
        #10;

        // Сброс
        rst = 0; // Отпускание сброса
        #15;

        // Тест 1: d = 1 на следующем фронте
        d = 1;
        #10;

        // Тест 2: d = 0 на следующем фронте
        d = 0;
        #10;

        // Тест 3: d = 1 на следующем фронте
        d = 1;
        #10;

        // Повторный сброс
        rst = 1;
        #8;

        rst = 0;
        #15;

        $display("Тестирование завершено.");
        $finish;
    end

endmodule