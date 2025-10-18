C     Main program to test the dot product subroutine
      PROGRAM TEST_DOT_PRODUCT
      INTEGER N
      PARAMETER (N = 5)
      REAL A(N), B(N), RESULT
      
C     Initialize test vectors
      DATA A /1.0, 2.0, 3.0, 4.0, 5.0/
      DATA B /2.0, 3.0, 4.0, 5.0, 6.0/
      
C     Call the dot product subroutine
      CALL DOT_PRODUCT_VEC(A, B, N, RESULT)
      
C     Print the result
      PRINT *, 'Dot product result: ', RESULT
      
      STOP
      END
      
C     Fortran subroutine to calculate the dot product of two vectors
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