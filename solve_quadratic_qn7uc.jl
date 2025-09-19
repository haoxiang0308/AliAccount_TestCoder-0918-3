function solve_quadratic(a, b, c)
    # Handle the case where a is zero (not a quadratic equation)
    if a == 0
        if b == 0
            if c == 0
                return "Infinite solutions (0 = 0)"
            else
                return "No solution ($c ≠ 0)"
            end
        else
            # Linear equation: bx + c = 0
            return [-c / b]
        end
    end
    
    # Calculate the discriminant
    discriminant = b^2 - 4 * a * c
    
    if discriminant > 0
        # Two distinct real roots
        root1 = (-b + √discriminant) / (2 * a)
        root2 = (-b - √discriminant) / (2 * a)
        return [root1, root2]
    elseif discriminant == 0
        # One repeated real root
        root = -b / (2 * a)
        return [root]
    else
        # Two complex conjugate roots
        real_part = -b / (2 * a)
        imaginary_part = √(-discriminant) / (2 * a)
        root1 = Complex(real_part, imaginary_part)
        root2 = Complex(real_part, -imaginary_part)
        return [root1, root2]
    end
end

# Example usage:
# println(solve_quadratic(1, -3, 2))  # Should print [2.0, 1.0]
# println(solve_quadratic(1, -2, 1))  # Should print [1.0]
# println(solve_quadratic(1, 0, 1))   # Should print complex roots
# println(solve_quadratic(0, 2, -4))  # Should print [2.0] (linear equation)