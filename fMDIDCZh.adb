-- Ada package body for mathematical operations
package body fMDIDCZh is

   -- Function to add two integers
   function Add(A, B : Integer) return Integer is
   begin
      return A + B;
   end Add;
   
   -- Function to subtract two integers
   function Subtract(A, B : Integer) return Integer is
   begin
      return A - B;
   end Subtract;
   
   -- Function to multiply two integers
   function Multiply(A, B : Integer) return Integer is
   begin
      return A * B;
   end Multiply;
   
   -- Function to divide two integers (with division by zero check)
   function Divide(A, B : Integer) return Float is
   begin
      if B = 0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return Float(A) / Float(B);
   end Divide;
   
   -- Function to calculate power of a number
   function Power(Base : Integer; Exponent : Natural) return Integer is
      Result : Integer := 1;
      Exp : Natural := Exponent;
   begin
      while Exp > 0 loop
         Result := Result * Base;
         Exp := Exp - 1;
      end loop;
      return Result;
   end Power;
   
   -- Function to calculate the absolute value
   function Absolute_Value(Value : Integer) return Integer is
   begin
      if Value < 0 then
         return -Value;
      else
         return Value;
      end if;
   end Absolute_Value;
   
   -- Function to find the maximum of two numbers
   function Maximum(A, B : Integer) return Integer is
   begin
      if A > B then
         return A;
      else
         return B;
      end if;
   end Maximum;
   
   -- Function to find the minimum of two numbers
   function Minimum(A, B : Integer) return Integer is
   begin
      if A < B then
         return A;
      else
         return B;
      end if;
   end Minimum;

end fMDIDCZh;