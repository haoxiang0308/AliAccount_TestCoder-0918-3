! Fortran subprogram to calculate dot product of two vectors
subroutine vector_dot_product(vec1, vec2, n, result)
    implicit none
    
    ! Input parameters
    integer, intent(in) :: n
    real, intent(in) :: vec1(n), vec2(n)
    real, intent(out) :: result
    
    ! Local variables
    integer :: i
    
    ! Initialize result
    result = 0.0
    
    ! Calculate dot product
    do i = 1, n
        result = result + vec1(i) * vec2(i)
    end do
    
end subroutine vector_dot_product

! Example program to demonstrate the subroutine
program test_dot_product
    implicit none
    
    integer, parameter :: n = 3
    real :: vector1(n) = [1.0, 2.0, 3.0]
    real :: vector2(n) = [4.0, 5.0, 6.0]
    real :: dot_result
    
    ! Call the subroutine
    call vector_dot_product(vector1, vector2, n, dot_result)
    
    ! Print the result
    print *, 'Vector 1: ', vector1
    print *, 'Vector 2: ', vector2
    print *, 'Dot product: ', dot_result
    
end program test_dot_product