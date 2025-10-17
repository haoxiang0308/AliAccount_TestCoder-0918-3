-- Ada package specification for mathematical operations
package Math_Operations is

   function Add(A, B : Integer) return Integer;
   function Subtract(A, B : Integer) return Integer;
   function Multiply(A, B : Integer) return Integer;
   function Divide(A, B : Integer) return Float;
   function Power(Base : Integer; Exponent : Natural) return Integer;

end Math_Operations;