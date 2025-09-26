program dot_product_example
    implicit none
    integer, parameter :: n = 3
    real, dimension(n) :: vector_a = [1.0, 2.0, 3.0]
    real, dimension(n) :: vector_b = [4.0, 5.0, 6.0]
    real :: result

    call calculate_dot_product(vector_a, vector_b, n, result)

    print *, 'The dot product is: ', result

end program dot_product_example

subroutine calculate_dot_product(a, b, size, dot_product_result)
    implicit none
    integer, intent(in) :: size
    real, dimension(size), intent(in) :: a, b
    real, intent(out) :: dot_product_result
    integer :: i

    dot_product_result = 0.0
    do i = 1, size
        dot_product_result = dot_product_result + a(i) * b(i)
    end do

end subroutine calculate_dot_product