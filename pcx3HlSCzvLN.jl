# Function to solve quadratic equations of the form ax^2 + bx + c = 0
function solve_quadratic(a, b, c)
    # Calculate discriminant
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two real roots
        root1 = (-b + sqrt(discriminant)) / (2*a)
        root2 = (-b - sqrt(discriminant)) / (2*a)
        return ("real", root1, root2)
    elseif discriminant == 0
        # One real root
        root = -b / (2*a)
        return ("real", root, root)
    else
        # Complex roots
        real_part = -b / (2*a)
        imaginary_part = sqrt(-discriminant) / (2*a)
        root1 = complex(real_part, imaginary_part)
        root2 = complex(real_part, -imaginary_part)
        return ("complex", root1, root2)
    end
end

# Example usage
println("Example: solving x^2 - 5x + 6 = 0")
result = solve_quadratic(1, -5, 6)
println("Roots: $(result[2]), $(result[3])")