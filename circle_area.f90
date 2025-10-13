program circle_area
    implicit none
    real, parameter :: pi = 3.14159265
    real :: radius, area

    write(*,*) 'Enter the radius of the circle:'
    read(*,*) radius

    area = pi * radius**2

    write(*,*) 'The area of the circle is: ', area

end program circle_area