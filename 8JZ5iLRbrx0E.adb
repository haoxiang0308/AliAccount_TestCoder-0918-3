package Math_Package is
   function Add(A, B : Integer) return Integer;
   function Subtract(A, B : Integer) return Integer;
   function Multiply(A, B : Integer) return Integer;
   function Divide(A, B : Integer) return Integer;
   function Power(Base, Exponent : Integer) return Integer;
end Math_Package;

package body Math_Package is
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

   function Power(Base, Exponent : Integer) return Integer is
      Result : Integer := 1;
      Abs_Exponent : Integer := Exponent;
   begin
      if Exponent < 0 then
         raise Constraint_Error with "Negative exponents not supported";
      end if;
      
      for I in 1..Exponent loop
         Result := Result * Base;
      end loop;
      return Result;
   end Power;
end Math_Package;