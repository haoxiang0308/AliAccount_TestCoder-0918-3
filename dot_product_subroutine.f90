! Fortran subprogram to calculate the dot product of two vectors
subroutine dot_product_vectors(vec1, vec2, n, result)
    implicit none
    
    ! Input parameters
    integer, intent(in) :: n                    ! Size of the vectors
    real, intent(in) :: vec1(n), vec2(n)       ! Input vectors
    real, intent(out) :: result                ! Result of dot product
    
    ! Local variables
    integer :: i
    real :: sum
    
    ! Calculate the dot product
    sum = 0.0
    do i = 1, n
        sum = sum + vec1(i) * vec2(i)
    end do
    
    result = sum
    
end subroutine dot_product_vectors

! Example program to demonstrate the subroutine
program test_dot_product
    implicit none
    
    integer, parameter :: n = 3
    real :: vector1(n) = [1.0, 2.0, 3.0]
    real :: vector2(n) = [4.0, 5.0, 6.0]
    real :: result
    
    ! Call the subroutine
    call dot_product_vectors(vector1, vector2, n, result)
    
    ! Print the result
    print *, 'Dot product result:', result
    
end program test_dot_product