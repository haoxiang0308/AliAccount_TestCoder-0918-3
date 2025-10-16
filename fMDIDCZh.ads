-- Ada package for mathematical operations
package fMDIDCZh is

   -- Function to add two integers
   function Add(A, B : Integer) return Integer;
   
   -- Function to subtract two integers
   function Subtract(A, B : Integer) return Integer;
   
   -- Function to multiply two integers
   function Multiply(A, B : Integer) return Integer;
   
   -- Function to divide two integers (with division by zero check)
   function Divide(A, B : Integer) return Float;
   
   -- Function to calculate power of a number
   function Power(Base : Integer; Exponent : Natural) return Integer;
   
   -- Function to calculate the absolute value
   function Absolute_Value(Value : Integer) return Integer;
   
   -- Function to find the maximum of two numbers
   function Maximum(A, B : Integer) return Integer;
   
   -- Function to find the minimum of two numbers
   function Minimum(A, B : Integer) return Integer;

end fMDIDCZh;