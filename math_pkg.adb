package body Math_Pkg is

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

   function Power(Base : Integer; Exponent : Natural) return Integer is
      Result : Integer := 1;
      Temp   : Integer := Base;
      Exp    : Natural := Exponent;
   begin
      while Exp > 0 loop
         if Exp mod 2 = 1 then
            Result := Result * Temp;
         end if;
         Temp := Temp * Temp;
         Exp := Exp / 2;
      end loop;
      return Result;
   end Power;

   function Modulo(A, B : Integer) return Integer is
   begin
      if B = 0 then
         raise Constraint_Error with "Modulo by zero";
      end if;
      return A mod B;
   end Modulo;

   function Factorial(N : Natural) return Integer is
      Result : Integer := 1;
   begin
      for I in 2 .. N loop
         Result := Result * I;
      end loop;
      return Result;
   end Factorial;

end Math_Pkg;