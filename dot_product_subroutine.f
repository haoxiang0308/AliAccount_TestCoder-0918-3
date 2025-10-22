C     Fortran subroutine to calculate dot product of two vectors
      SUBROUTINE DOT_PRODUCT_VEC(N, A, B, RESULT)
      INTEGER N
      REAL A(N), B(N), RESULT
      INTEGER I
      
      RESULT = 0.0
      DO I = 1, N
        RESULT = RESULT + A(I) * B(I)
      END DO
      
      RETURN
      END