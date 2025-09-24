-- math_operations.ads
-- Пакет Ada, определяющий основные математические операции.

package Math_Operations is

   -- Функция для сложения двух целых чисел
   function Add(A, B : Integer) return Integer;

   -- Функция для вычитания двух целых чисел
   function Subtract(A, B : Integer) return Integer;

   -- Функция для умножения двух целых чисел
   function Multiply(A, B : Integer) return Integer;

   -- Функция для деления двух целых чисел (возвращает результат как Integer)
   -- Предусловие: B не равно 0
   function Divide(A, B : Integer) return Integer with
     Pre => B /= 0;

   -- Процедура для вычисления квадрата числа
   procedure Square(X : in out Integer);

end Math_Operations;