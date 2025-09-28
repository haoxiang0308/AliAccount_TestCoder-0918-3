-- math_operations.adb
-- Тело пакета Ada, реализующее базовые математические операции.

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

   function Divide(Numerator, Denominator : Integer) return Integer is
   begin
      if Denominator = 0 then
         raise Constraint_Error with "Деление на ноль недопустимо.";
      end if;
      return Numerator / Denominator;
   end Divide;

end Math_Operations;