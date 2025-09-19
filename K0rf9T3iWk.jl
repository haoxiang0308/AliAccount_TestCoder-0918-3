function solve_quadratic(a, b, c)
    # Calculate the discriminant
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two real roots
        root1 = (-b + sqrt(discriminant)) / (2*a)
        root2 = (-b - sqrt(discriminant)) / (2*a)
        return (root1, root2)
    elseif discriminant == 0
        # One real root
        root = -b / (2*a)
        return (root,)
    else
        # Complex roots
        real_part = -b / (2*a)
        imaginary_part = sqrt(-discriminant) / (2*a)
        return (complex(real_part, imaginary_part), complex(real_part, -imaginary_part))
    end
end

# Example usage:
# roots = solve_quadratic(1, -3, 2)  # x^2 - 3x + 2 = 0
# println(roots)