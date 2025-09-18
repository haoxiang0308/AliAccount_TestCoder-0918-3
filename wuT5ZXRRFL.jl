# Function to solve quadratic equations of the form ax^2 + bx + c = 0
# Returns the roots of the equation

function solve_quadratic(a, b, c)
    # Check if it's actually a quadratic equation
    if a == 0
        if b == 0
            if c == 0
                return "Infinite solutions"
            else
                return "No solution"
            end
        else
            # Linear equation: bx + c = 0
            root = -c / b
            return "Linear equation with root: $root"
        end
    end
    
    # Calculate discriminant
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two distinct real roots
        root1 = (-b + sqrt(discriminant)) / (2*a)
        root2 = (-b - sqrt(discriminant)) / (2*a)
        return (root1, root2)
    elseif discriminant == 0
        # One repeated real root
        root = -b / (2*a)
        return (root,)
    else
        # Complex roots
        real_part = -b / (2*a)
        imaginary_part = sqrt(-discriminant) / (2*a)
        root1 = complex(real_part, imaginary_part)
        root2 = complex(real_part, -imaginary_part)
        return (root1, root2)
    end
end

# Example usage:
# roots = solve_quadratic(1, -5, 6)  # Should return (3.0, 2.0)
# println(roots)