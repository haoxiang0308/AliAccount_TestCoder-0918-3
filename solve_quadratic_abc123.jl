# Функция для решения квадратного уравнения ax^2 + bx + c = 0
function solve_quadratic(a, b, c)
    # Проверка, является ли a нулем
    if a == 0
        if b == 0
            # Если a и b нули, уравнение не квадратное и не линейное
            if c == 0
                return "Бесконечное количество решений"
            else
                return "Нет решений"
            end
        else
            # Линейное уравнение bx + c = 0
            return [-c / b]
        end
    end

    # Вычисление дискриминанта
    D = b^2 - 4*a*c

    if D > 0
        # Два различных действительных корня
        sqrt_D = sqrt(D)
        x1 = (-b + sqrt_D) / (2*a)
        x2 = (-b - sqrt_D) / (2*a)
        return [x1, x2]
    elseif D == 0
        # Один действительный корень (кратный)
        x = -b / (2*a)
        return [x]
    else
        # Комплексные корни
        sqrt_neg_D = sqrt(-D)
        real_part = -b / (2*a)
        imag_part = sqrt_neg_D / (2*a)
        x1 = complex(real_part, imag_part)
        x2 = complex(real_part, -imag_part)
        return [x1, x2]
    end
end

# Примеры использования:
println("Пример 1: x^2 - 5x + 6 = 0 (a=1, b=-5, c=6)")
println(solve_quadratic(1, -5, 6))

println("\nПример 2: x^2 - 2x + 1 = 0 (a=1, b=-2, c=1)")
println(solve_quadratic(1, -2, 1))

println("\nПример 3: x^2 + 1 = 0 (a=1, b=0, c=1)")
println(solve_quadratic(1, 0, 1))