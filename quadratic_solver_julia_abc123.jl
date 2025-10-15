# Функция для решения квадратного уравнения ax^2 + bx + c = 0
function solve_quadratic(a::Float64, b::Float64, c::Float64)
    discriminant = b^2 - 4*a*c
    if discriminant > 0
        x1 = (-b + sqrt(discriminant)) / (2*a)
        x2 = (-b - sqrt(discriminant)) / (2*a)
        return (x1, x2)
    elseif discriminant == 0
        x = -b / (2*a)
        return (x, x)
    else
        real_part = -b / (2*a)
        imag_part = sqrt(-discriminant) / (2*a)
        return (complex(real_part, imag_part), complex(real_part, -imag_part))
    end
end

# Пример использования
println(solve_quadratic(1.0, -5.0, 6.0)) # (3.0, 2.0)
println(solve_quadratic(1.0, -2.0, 1.0)) # (1.0, 1.0)
println(solve_quadratic(1.0, 0.0, 1.0))  # (0.0 + 1.0im, 0.0 - 1.0im)