"""
Function to solve quadratic equations of the form ax^2 + bx + c = 0
Returns the solutions as a tuple (x1, x2)
"""
function solve_quadratic(a, b, c)
    # Calculate the discriminant
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two real solutions
        x1 = (-b + sqrt(discriminant)) / (2*a)
        x2 = (-b - sqrt(discriminant)) / (2*a)
        return (x1, x2)
    elseif discriminant == 0
        # One real solution
        x = -b / (2*a)
        return (x, x)
    else
        # Complex solutions
        real_part = -b / (2*a)
        imag_part = sqrt(-discriminant) / (2*a)
        x1 = complex(real_part, imag_part)
        x2 = complex(real_part, -imag_part)
        return (x1, x2)
    end
end

# Example usage:
# println(solve_quadratic(1, -5, 6))  # Should give (3.0, 2.0)
# println(solve_quadratic(1, 0, 1))   # Should give complex solutions
# println(solve_quadratic(1, -2, 1))  # Should give (1.0, 1.0)