C     Fortran subroutine to calculate dot product of two vectors
      SUBROUTINE DOT_PRODUCT(A, B, N, RESULT)
      IMPLICIT NONE
      INTEGER N, I
      REAL A(N), B(N), RESULT
      
      RESULT = 0.0
      DO I = 1, N
        RESULT = RESULT + A(I) * B(I)
      END DO
      
      RETURN
      END