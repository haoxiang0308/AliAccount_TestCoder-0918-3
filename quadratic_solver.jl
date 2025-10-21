"""
Function to solve quadratic equations of the form ax^2 + bx + c = 0
Returns the roots of the equation as a tuple
"""
function solve_quadratic(a, b, c)
    # Calculate discriminant
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two real roots
        root1 = (-b + sqrt(discriminant)) / (2*a)
        root2 = (-b - sqrt(discriminant)) / (2*a)
        return (root1, root2)
    elseif discriminant == 0
        # One real root
        root = -b / (2*a)
        return (root, root)
    else
        # Complex roots
        real_part = -b / (2*a)
        imag_part = sqrt(-discriminant) / (2*a)
        return (complex(real_part, imag_part), complex(real_part, -imag_part))
    end
end

# Example usage:
# println(solve_quadratic(1, -5, 6))  # Should return (3.0, 2.0) for x^2 - 5x + 6 = 0