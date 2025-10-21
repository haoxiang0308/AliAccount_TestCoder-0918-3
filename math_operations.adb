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

   function Power(Base, Exponent : Integer) return Integer is
      Result : Integer := 1;
      Abs_Exponent : Integer := Exponent;
   begin
      if Exponent < 0 then
         raise Constraint_Error with "Negative exponents not supported";
      end if;
      
      for I in 1..Abs_Exponent loop
         Result := Result * Base;
      end loop;
      return Result;
   end Power;

   function Factorial(N : Integer) return Integer is
      Result : Integer := 1;
   begin
      if N < 0 then
         raise Constraint_Error with "Factorial of negative number not defined";
      end if;
      
      for I in 1..N loop
         Result := Result * I;
      end loop;
      return Result;
   end Factorial;

   function Modulo(A, B : Integer) return Integer is
   begin
      if B = 0 then
         raise Constraint_Error with "Modulo by zero";
      end if;
      return A mod B;
   end Modulo;
end Math_Operations;