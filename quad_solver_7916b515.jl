"""
Функция для решения квадратного уравнения ax^2 + bx + c = 0
Возвращает кортеж из двух корней (если они существуют)
"""
function solve_quadratic(a::Float64, b::Float64, c::Float64)
    # Вычисляем дискриминант
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Два различных действительных корня
        sqrt_discriminant = sqrt(discriminant)
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    elseif discriminant == 0
        # Один действительный корень (кратный)
        x = -b / (2*a)
        return (x, x)
    else
        # Комплексные корни
        sqrt_discriminant = sqrt(complex(discriminant))
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    end
end

# Пример использования
println("Примеры решения квадратных уравнений:")
println("x^2 - 5x + 6 = 0: ", solve_quadratic(1.0, -5.0, 6.0))
println("x^2 - 2x + 1 = 0: ", solve_quadratic(1.0, -2.0, 1.0))
println("x^2 + 1 = 0: ", solve_quadratic(1.0, 0.0, 1.0))