# NOTE: This file requires Julia to run.
# This function solves the quadratic equation ax^2 + bx + c = 0
function solve_quadratic(a, b, c)
    # Calculate the discriminant
    D = b^2 - 4*a*c

    if D > 0
        # Two real roots
        x1 = (-b + sqrt(D)) / (2*a)
        x2 = (-b - sqrt(D)) / (2*a)
        return (x1, x2)
    elseif D == 0
        # One real root
        x = -b / (2*a)
        return (x,)
    else
        # Complex roots
        real_part = -b / (2*a)
        imag_part = sqrt(-D) / (2*a)
        x1 = complex(real_part, imag_part)
        x2 = complex(real_part, -imag_part)
        return (x1, x2)
    end
end

# Example usage:
# roots = solve_quadratic(1, -5, 6)
# println(roots)  # Should print (3.0, 2.0)