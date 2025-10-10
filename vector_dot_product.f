C This file contains a Fortran function to calculate the dot product of two vectors.
      PROGRAM MAIN
          INTEGER N
          PARAMETER (N=3)
          REAL A(N), B(N), RESULT
          DATA A /1.0, 2.0, 3.0/
          DATA B /4.0, 5.0, 6.0/
          
          CALL DOT_PRODUCT_SUB(A, B, N, RESULT)
          PRINT *, 'The dot product is: ', RESULT
      END
      
      SUBROUTINE DOT_PRODUCT_SUB(VECTOR_A, VECTOR_B, SIZE, RESULT)
          INTEGER SIZE
          REAL VECTOR_A(SIZE), VECTOR_B(SIZE), RESULT
          INTEGER I
          
          RESULT = 0.0
          DO 10 I = 1, SIZE
              RESULT = RESULT + VECTOR_A(I) * VECTOR_B(I)
   10     CONTINUE
          RETURN
      END