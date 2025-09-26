program circle_area
    implicit none
    real, parameter :: pi = 3.14159265
    real :: radius, area

    write(*,*) 'This program calculates the area of a circle.'
    write(*,*) 'Enter the radius: '
    read(*,*) radius

    area = pi * radius**2

    write(*,*) 'The area of the circle with radius ', radius, ' is ', area

end program circle_area