-- Пакет Ada для базовых математических операций
package Math_Operations is
   -- Функция для сложения двух чисел
   function Add(A, B : Integer) return Integer;

   -- Функция для вычитания двух чисел
   function Subtract(A, B : Integer) return Integer;

   -- Функция для умножения двух чисел
   function Multiply(A, B : Integer) return Integer;

   -- Функция для деления двух чисел (целочисленное деление)
   function Divide(A, B : Integer) return Integer;
end Math_Operations;

-- Тело пакета
package body Math_Operations is
   function Add(A, B : Integer) return Integer is
   begin
      return A + B;
   end Add;

   function Subtract(A, B : Integer) return Integer is
   begin
      return A - B;
   end Subtract;

   function Multiply(A, B : Integer) return Integer is
   begin
      return A * B;
   end Multiply;

   function Divide(A, B : Integer) return Integer is
   begin
      if B = 0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return A / B;
   end Divide;
end Math_Operations;