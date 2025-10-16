-- Ada package for mathematical operations
package Math_Operations is
   -- Function to add two numbers
   function Add(A, B : in Float) return Float;
   
   -- Function to subtract two numbers
   function Subtract(A, B : in Float) return Float;
   
   -- Function to multiply two numbers
   function Multiply(A, B : in Float) return Float;
   
   -- Function to divide two numbers
   function Divide(A, B : in Float) return Float;
   
   -- Function to calculate power
   function Power(Base, Exponent : in Float) return Float;
   
   -- Function to calculate square root
   function Square_Root(Value : in Float) return Float;
   
   -- Function to find maximum of two numbers
   function Max(A, B : in Float) return Float;
   
   -- Function to find minimum of two numbers
   function Min(A, B : in Float) return Float;
end Math_Operations;

-- Package body
package body Math_Operations is
   function Add(A, B : in Float) return Float is
   begin
      return A + B;
   end Add;
   
   function Subtract(A, B : in Float) return Float is
   begin
      return A - B;
   end Subtract;
   
   function Multiply(A, B : in Float) return Float is
   begin
      return A * B;
   end Multiply;
   
   function Divide(A, B : in Float) return Float is
   begin
      if B = 0.0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return A / B;
   end Divide;
   
   function Power(Base, Exponent : in Float) return Float is
   begin
      return Base ** Exponent;
   end Power;
   
   function Square_Root(Value : in Float) return Float is
   begin
      if Value < 0.0 then
         raise Constraint_Error with "Square root of negative number";
      end if;
      return Value ** 0.5;
   end Square_Root;
   
   function Max(A, B : in Float) return Float is
   begin
      if A > B then
         return A;
      else
         return B;
      end if;
   end Max;
   
   function Min(A, B : in Float) return Float is
   begin
      if A < B then
         return A;
      else
         return B;
      end if;
   end Min;
end Math_Operations;