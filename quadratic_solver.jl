function solve_quadratic(a, b, c)
    """
    Solves quadratic equation ax² + bx + c = 0
    Returns a tuple of the two solutions (or same value twice if one solution)
    """
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two real solutions
        x1 = (-b + sqrt(discriminant)) / (2a)
        x2 = (-b - sqrt(discriminant)) / (2a)
        return (x1, x2)
    elseif discriminant == 0
        # One real solution
        x = -b / (2a)
        return (x, x)
    else
        # Complex solutions
        real_part = -b / (2a)
        imaginary_part = sqrt(-discriminant) / (2a)
        x1 = complex(real_part, imaginary_part)
        x2 = complex(real_part, -imaginary_part)
        return (x1, x2)
    end
end

# Example usage:
# result = solve_quadratic(1, -5, 6)  # x² - 5x + 6 = 0
# println(result)  # Should output (3.0, 2.0)