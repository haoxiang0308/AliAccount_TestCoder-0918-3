# Функция для решения квадратного уравнения ax² + bx + c = 0
function solve_quadratic(a, b, c)
    # Проверка, что a ≠ 0 (иначе это не квадратное уравнение)
    if a == 0
        error("Коэффициент 'a' не должен быть равен нулю для квадратного уравнения")
    end
    
    # Вычисление дискриминанта
    discriminant = b^2 - 4*a*c
    
    # Определение количества корней на основе дискриминанта
    if discriminant > 0
        # Два различных действительных корня
        sqrt_discriminant = sqrt(discriminant)
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return ("Два действительных корня", x1, x2)
    elseif discriminant == 0
        # Один действительный корень (кратный корень)
        x = -b / (2*a)
        return ("Один действительный корень", x, x)
    else
        # Комплексные корни
        real_part = -b / (2*a)
        imaginary_part = sqrt(-discriminant) / (2*a)
        x1 = complex(real_part, imaginary_part)
        x2 = complex(real_part, -imaginary_part)
        return ("Комплексные корни", x1, x2)
    end
end

# Пример использования функции
println("Примеры решения квадратных уравнений:")
println("Уравнение: x² - 5x + 6 = 0")
result1 = solve_quadratic(1, -5, 6)
println(result1)

println("\nУравнение: x² - 2x + 1 = 0")
result2 = solve_quadratic(1, -2, 1)
println(result2)

println("\nУравнение: x² + 1 = 0")
result3 = solve_quadratic(1, 0, 1)
println(result3)