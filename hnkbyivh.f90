program circle_area
    implicit none
    real :: radius, area
    real, parameter :: pi = 3.141592653589793
    
    ! Get radius from user
    print *, "Enter the radius of the circle: "
    read *, radius
    
    ! Calculate area
    area = pi * radius * radius
    
    ! Display result
    print *, "The area of the circle is: ", area
end program circle_area