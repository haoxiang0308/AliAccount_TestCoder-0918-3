-- math_operations.ads
-- Пакет Ada для базовых математических операций

package Math_Operations is

   -- Функция для сложения двух целых чисел
   function Add(A, B : Integer) return Integer;

   -- Функция для вычитания двух целых чисел
   function Subtract(A, B : Integer) return Integer;

   -- Функция для умножения двух целых чисел
   function Multiply(A, B : Integer) return Integer;

   -- Функция для деления двух целых чисел (с отсечением дробной части)
   function Divide(A, B : Integer) return Integer;
   
   -- Процедура для вывода приветствия
   procedure Print_Greeting;

end Math_Operations;