-- Ada package for mathematical operations
package Math_Ops is
   -- Function to add two numbers
   function Add(A, B : in Integer) return Integer;
   
   -- Function to subtract two numbers
   function Subtract(A, B : in Integer) return Integer;
   
   -- Function to multiply two numbers
   function Multiply(A, B : in Integer) return Integer;
   
   -- Function to divide two numbers (with division by zero check)
   function Divide(A, B : in Integer) return Float;
   
   -- Function to calculate power of a number
   function Power(Base : in Integer; Exponent : in Natural) return Integer;
   
   -- Function to calculate absolute value
   function Absolute_Value(Num : in Integer) return Integer;
end Math_Ops;

-- Package body
package body Math_Ops is
   function Add(A, B : in Integer) return Integer is
   begin
      return A + B;
   end Add;
   
   function Subtract(A, B : in Integer) return Integer is
   begin
      return A - B;
   end Subtract;
   
   function Multiply(A, B : in Integer) return Integer is
   begin
      return A * B;
   end Multiply;
   
   function Divide(A, B : in Integer) return Float is
   begin
      if B = 0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return Float(A) / Float(B);
   end Divide;
   
   function Power(Base : in Integer; Exponent : in Natural) return Integer is
      Result : Integer := 1;
      Exp : Natural := Exponent;
   begin
      while Exp > 0 loop
         Result := Result * Base;
         Exp := Exp - 1;
      end loop;
      return Result;
   end Power;
   
   function Absolute_Value(Num : in Integer) return Integer is
   begin
      if Num < 0 then
         return -Num;
      else
         return Num;
      end if;
   end Absolute_Value;
end Math_Ops;