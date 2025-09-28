C This file contains a Fortran subroutine to calculate the dot product of two vectors.
      SUBROUTINE DOTPROD(A, B, N, RESULT)
      INTEGER N
      REAL A(N), B(N), RESULT
      INTEGER I
      RESULT = 0.0
      DO 10 I = 1, N
         RESULT = RESULT + A(I) * B(I)
   10 CONTINUE
      RETURN
      END