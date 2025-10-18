C     Subprogram to calculate the dot product of two vectors
      SUBROUTINE DOT_PRODUCT_VEC(A, B, N, RESULT)
      INTEGER N
      REAL A(N), B(N), RESULT
      INTEGER I
      
      RESULT = 0.0
      DO I = 1, N
         RESULT = RESULT + A(I) * B(I)
      END DO
      
      RETURN
      END
      
C     Example program demonstrating the use of the DOT_PRODUCT_VEC subroutine
      PROGRAM TEST_DOT_PRODUCT
      INTEGER N
      PARAMETER (N = 5)
      REAL VEC1(N), VEC2(N), DOT_RESULT
      INTEGER I
      
C     Initialize test vectors
      DO I = 1, N
         VEC1(I) = REAL(I)
         VEC2(I) = REAL(I * 2)
      END DO
      
C     Calculate dot product
      CALL DOT_PRODUCT_VEC(VEC1, VEC2, N, DOT_RESULT)
      
C     Print result
      PRINT *, 'Dot product result: ', DOT_RESULT
      
      STOP
      END