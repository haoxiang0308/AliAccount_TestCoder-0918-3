C Fortran subprogram to calculate the dot product of two vectors
      SUBROUTINE DOT_PRODUCT_VECTORS(VEC1, VEC2, N, RESULT)
C
      IMPLICIT NONE
C
C     Input parameters
      INTEGER N                    ! Size of the vectors
      REAL VEC1(N), VEC2(N)       ! Input vectors
      REAL RESULT                 ! Result of dot product
C
C     Local variables
      INTEGER I
      REAL SUM
C
C     Calculate the dot product
      SUM = 0.0
      DO 10 I = 1, N
          SUM = SUM + VEC1(I) * VEC2(I)
   10 CONTINUE
C
      RESULT = SUM
C
      END