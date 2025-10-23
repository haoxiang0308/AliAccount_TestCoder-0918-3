// Тестовая плата для D-триггера
module dff_testbench;
  
  // Объявление сигналов
  reg clk;
  reg reset;
  reg d;
  wire q;
  wire q_bar;
  
  // Инстанцирование тестируемого модуля (предполагается, что модуль d_flip_flop уже существует)
  d_flip_flop uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .q_bar(q_bar)
  );
  
  // Генерация тактового сигнала
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Тактовый сигнал с периодом 10
  end
  
  // Процедурная логика теста
  initial begin
    // Инициализация сигналов
    reset = 1;
    d = 0;
    
    // Сброс
    #10;
    reset = 0;
    
    // Тестирование различных состояний
    #10;
    d = 1;
    #10;
    d = 0;
    #10;
    d = 1;
    #10;
    reset = 1;
    #10;
    reset = 0;
    #10;
    d = 0;
    #10;
    d = 1;
    
    // Завершение симуляции
    #20;
    $finish;
  end
  
  // Отображение результатов
  initial begin
    $monitor("Time: %0t | Reset: %b | D: %b | Q: %b | Q_bar: %b", 
             $time, reset, d, q, q_bar);
  end

endmodule