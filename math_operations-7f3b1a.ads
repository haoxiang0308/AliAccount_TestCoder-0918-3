-- math_operations.ads
-- Пакет Ada, определяющий базовые математические операции.

package Math_Operations is

   -- Функция для сложения двух целых чисел.
   function Add(A, B : Integer) return Integer;

   -- Функция для вычитания двух целых чисел.
   function Subtract(A, B : Integer) return Integer;

   -- Функция для умножения двух целых чисел.
   function Multiply(A, B : Integer) return Integer;

   -- Функция для деления двух целых чисел.
   -- Выбрасывает исключение Constraint_Error, если делитель равен нулю.
   function Divide(Numerator, Denominator : Integer) return Integer;

end Math_Operations;