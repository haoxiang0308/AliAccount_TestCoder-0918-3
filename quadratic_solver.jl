function solve_quadratic(a::Float64, b::Float64, c::Float64)
    """
    Solves a quadratic equation of the form ax^2 + bx + c = 0
    Returns a tuple of the two solutions (x1, x2)
    """
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
        imaginary_part = sqrt(-discriminant) / (2*a)
        x1 = complex(real_part, imaginary_part)
        x2 = complex(real_part, -imaginary_part)
        return (x1, x2)
    end
end

# Example usage:
# result = solve_quadratic(1.0, -5.0, 6.0)  # x^2 - 5x + 6 = 0
# println("Solutions: ", result)