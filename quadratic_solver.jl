"""
Функция для решения квадратного уравнения ax^2 + bx + c = 0.

# Аргументы
- `a::Float64`: Коэффициент при x^2
- `b::Float64`: Коэффициент при x
- `c::Float64`: Свободный член

# Возвращает
- `Tuple`: Кортеж с двумя корнями (x1, x2) или кортеж с NaN, если корней нет.
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
        # Один действительный корень (или два совпадающих)
        x = -b / (2*a)
        return (x, x)
    else
        # Комплексные корни, возвращаем NaN для действительных чисел
        return (NaN, NaN)
    end
end

# Пример использования
a = 1.0
b = -5.0
c = 6.0
roots = solve_quadratic(a, b, c)
println("Корни уравнения ", a, "x^2 + (", b, ")x + (", c, ") = 0: ", roots)

# Пример с комплексными корнями
a = 1.0
b = 0.0
c = 1.0
roots_complex = solve_quadratic(a, b, c)
println("Корни уравнения ", a, "x^2 + (", b, ")x + (", c, ") = 0: ", roots_complex)