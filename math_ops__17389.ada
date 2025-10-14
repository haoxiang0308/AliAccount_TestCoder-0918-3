package Math_Operations is
   function Add(A, B : Integer) return Integer;
   function Subtract(A, B : Integer) return Integer;
   function Multiply(A, B : Integer) return Integer;
   function Divide(A, B : Integer) return Integer;
end Math_Operations;

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