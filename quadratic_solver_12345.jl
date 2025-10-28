# Julia function to solve quadratic equations
# Solves equations of the form ax^2 + bx + c = 0

function solve_quadratic(a, b, c)
    # Check if it's actually a quadratic equation
    if a == 0
        if b == 0
            if c == 0
                return "Infinite solutions (0 = 0)"
            else
                return "No solution (contradiction)"
            end
        else
            # Linear equation: bx + c = 0
            x = -c / b
            return [x]
        end
    end
    
    # Calculate discriminant
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two real solutions
        sqrt_discriminant = sqrt(discriminant)
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return [x1, x2]
    elseif discriminant == 0
        # One real solution
        x = -b / (2*a)
        return [x]
    else
        # Complex solutions
        real_part = -b / (2*a)
        imaginary_part = sqrt(-discriminant) / (2*a)
        x1 = complex(real_part, imaginary_part)
        x2 = complex(real_part, -imaginary_part)
        return [x1, x2]
    end
end

# Example usage:
# println(solve_quadratic(1, -5, 6))  # Should give [3.0, 2.0] for x^2 - 5x + 6 = 0
# println(solve_quadratic(1, 0, 1))   # Should give complex solutions for x^2 + 1 = 0
# println(solve_quadratic(1, -2, 1))  # Should give [1.0] for x^2 - 2x + 1 = 0