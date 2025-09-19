program circle_area
    implicit none
    real :: radius, area, pi
    
    ! Define the value of pi
    pi = 3.14159265359
    
    ! Prompt the user for the radius
    write(*,*) 'Enter the radius of the circle:'
    read(*,*) radius
    
    ! Calculate the area
    area = pi * radius * radius
    
    ! Display the result
    write(*,*) 'The area of the circle is:', area
    
end program circle_area