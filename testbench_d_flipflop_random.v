// Тестовая плата для D-триггера
module testbench_D_flipflop();
  // Объявление сигналов
  reg clk;
  reg reset;
  reg d;
  wire q;
  wire q_bar;

  // Подключение тестируемого модуля (предполагается, что модуль D_flipflop уже существует)
  D_flipflop uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .q_bar(q_bar)
  );

  // Генерация тактового сигнала
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Тактовый сигнал с периодом 10 (5+5)
  end

  // Инициализация и тестирование
  initial begin
    // Инициализация сигналов
    reset = 1;
    d = 0;
    #10; // Ждем 10 единиц времени
    reset = 0; // Сброс released

    // Подача тестовых данных
    d = 1;
    #20;
    d = 0;
    #20;
    d = 1;
    #20;
    d = 0;
    #20;

    // Завершение симуляции
    $finish;
  end

endmodule

// Простой пример D-триггера для демонстрации. В реальности этот модуль уже будет существовать.
module D_flipflop(
  input clk,
  input reset,
  input d,
  output reg q,
  output wire q_bar
);

  assign q_bar = ~q;

  always @(posedge clk or posedge reset) begin
    if (reset)
      q <= 0;
    else
      q <= d;
  end

endmodule