function solve_quadratic(a, b, c)
    # Вычисляем дискриминант
    D = b^2 - 4*a*c

    if D > 0
        # Два различных действительных корня
        x1 = (-b + sqrt(D)) / (2*a)
        x2 = (-b - sqrt(D)) / (2*a)
        return (x1, x2)
    elseif D == 0
        # Один действительный корень (или два совпадающих)
        x = -b / (2*a)
        return (x,)
    else
        # Комплексные корни
        real_part = -b / (2*a)
        imag_part = sqrt(-D) / (2*a)
        x1 = complex(real_part, imag_part)
        x2 = complex(real_part, -imag_part)
        return (x1, x2)
    end
end

# Пример использования
println(solve_quadratic(1, -5, 6))  # (3.0, 2.0)
println(solve_quadratic(1, -2, 1))  # (1.0,)
println(solve_quadratic(1, 0, 1))   # (0.0 + 1.0im, 0.0 - 1.0im)
