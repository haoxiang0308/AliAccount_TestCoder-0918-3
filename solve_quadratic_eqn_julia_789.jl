function solve_quadratic(a, b, c)
    """
    Решает квадратное уравнение ax^2 + bx + c = 0.
    Возвращает кортеж из двух корней (root1, root2).
    """
    # Вычисляем дискриминант
    discriminant = b^2 - 4*a*c

    # Проверяем знак дискриминанта
    if discriminant > 0
        # Два различных действительных корня
        root1 = (-b + sqrt(discriminant)) / (2*a)
        root2 = (-b - sqrt(discriminant)) / (2*a)
    elseif discriminant == 0
        # Один действительный корень (кратный)
        root = -b / (2*a)
        return (root, root)
    else
        # Комплексные корни
        real_part = -b / (2*a)
        imag_part = sqrt(-discriminant) / (2*a)
        return (complex(real_part, imag_part), complex(real_part, -imag_part))
    end

    return (root1, root2)
end

# Пример использования
a = 1
b = -5
c = 6

roots = solve_quadratic(a, b, c)
println("Корни уравнения $a*x^2 + $b*x + $c = 0: ", roots)