-- Package specification for mathematical operations
package Math_Operations is

   -- Function to add two integers
   function Add (A, B : Integer) return Integer;

   -- Function to subtract two integers
   function Subtract (A, B : Integer) return Integer;

   -- Function to multiply two integers
   function Multiply (A, B : Integer) return Integer;

   -- Function to divide two integers
   function Divide (A, B : Integer) return Float;

   -- Function to calculate the factorial of a non-negative integer
   function Factorial (N : Natural) return Natural;

end Math_Operations;

-- Package body for mathematical operations
package body Math_Operations is

   -- Function to add two integers
   function Add (A, B : Integer) return Integer is
   begin
      return A + B;
   end Add;

   -- Function to subtract two integers
   function Subtract (A, B : Integer) return Integer is
   begin
      return A - B;
   end Subtract;

   -- Function to multiply two integers
   function Multiply (A, B : Integer) return Integer is
   begin
      return A * B;
   end Multiply;

   -- Function to divide two integers
   function Divide (A, B : Integer) return Float is
   begin
      if B = 0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return Float(A) / Float(B);
   end Divide;

   -- Function to calculate the factorial of a non-negative integer
   function Factorial (N : Natural) return Natural is
      Result : Natural := 1;
   begin
      for I in 1 .. N loop
         Result := Result * I;
      end loop;
      return Result;
   end Factorial;

end Math_Operations;