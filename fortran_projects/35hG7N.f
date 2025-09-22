! This program calculates the dot product of two vectors.
program dot_product_example
    implicit none
    real, dimension(5) :: a = [1.0, 2.0, 3.0, 4.0, 5.0]
    real, dimension(5) :: b = [2.0, 3.0, 4.0, 5.0, 6.0]
    real :: result
    integer :: i

    ! Calculate dot product
    result = 0.0
    do i = 1, 5
        result = result + a(i) * b(i)
    end do

    ! Print the result
    print *, 'Vector a:', a
    print *, 'Vector b:', b
    print *, 'Dot product:', result

end program dot_product_example