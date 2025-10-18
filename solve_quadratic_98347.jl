# Функция для решения квадратного уравнения ax^2 + bx + c = 0
function solve_quadratic(a, b, c)
    discriminant = b^2 - 4a*c
    if discriminant > 0
        root1 = (-b + sqrt(discriminant)) / (2a)
        root2 = (-b - sqrt(discriminant)) / (2a)
        return (root1, root2)
    elseif discriminant == 0
        root = -b / (2a)
        return (root,)
    else
        real_part = -b / (2a)
        imaginary_part = sqrt(-discriminant) / (2a)
        return (complex(real_part, imaginary_part), complex(real_part, -imaginary_part))
    end
end