function solve_quadratic(a::Float64, b::Float64, c::Float64)
    """
    Solves a quadratic equation of the form ax^2 + bx + c = 0
    Returns a tuple of the two solutions (real or complex)
    """
    discriminant = b^2 - 4*a*c
    
    if discriminant >= 0
        # Real solutions
        sqrt_discriminant = sqrt(discriminant)
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    else
        # Complex solutions
        sqrt_discriminant = sqrt(complex(discriminant))
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    end
end

# Example usage:
# a, b, c = 1.0, -5.0, 6.0  # x^2 - 5x + 6 = 0
# solutions = solve_quadratic(a, b, c)
# println("Solutions: ", solutions)