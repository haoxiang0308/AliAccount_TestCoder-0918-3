program circle_area
    implicit none
    real, parameter :: pi = 3.141592653589793
    real :: radius, area
    
    write(*,*) 'Enter the radius of the circle:'
    read(*,*) radius
    
    area = pi * radius * radius
    
    write(*,*) 'The area of the circle with radius', radius, 'is:', area
    
end program circle_area