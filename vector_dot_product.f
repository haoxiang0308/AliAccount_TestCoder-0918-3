program dot_product_main
    implicit none
    integer, parameter :: n = 3
    real, dimension(n) :: vector_a = [1.0, 2.0, 3.0]
    real, dimension(n) :: vector_b = [4.0, 5.0, 6.0]
    real :: result

    call calculate_dot_product(vector_a, vector_b, n, result)
    print *, 'Dot product is: ', result

end program dot_product_main

subroutine calculate_dot_product(a, b, size, result)
    implicit none
    integer, intent(in) :: size
    real, dimension(size), intent(in) :: a, b
    real, intent(out) :: result
    integer :: i

    result = 0.0
    do i = 1, size
        result = result + a(i) * b(i)
    end do
end subroutine calculate_dot_product