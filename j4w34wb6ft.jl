# Julia function to solve quadratic equations
# Solves equations of the form ax^2 + bx + c = 0

function solve_quadratic(a::Float64, b::Float64, c::Float64)
    # Calculate the discriminant
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two real solutions
        x1 = (-b + sqrt(discriminant)) / (2*a)
        x2 = (-b - sqrt(discriminant)) / (2*a)
        return ("Two real solutions", x1, x2)
    elseif discriminant == 0
        # One real solution
        x = -b / (2*a)
        return ("One real solution", x, x)
    else
        # Complex solutions
        real_part = -b / (2*a)
        imaginary_part = sqrt(-discriminant) / (2*a)
        return ("Complex solutions", 
                complex(real_part, imaginary_part), 
                complex(real_part, -imaginary_part))
    end
end

# Example usage
println("Example: solving x^2 - 5x + 6 = 0")
result = solve_quadratic(1.0, -5.0, 6.0)
println(result)

println("\nExample: solving x^2 - 2x + 1 = 0")
result = solve_quadratic(1.0, -2.0, 1.0)
println(result)

println("\nExample: solving x^2 + 1 = 0")
result = solve_quadratic(1.0, 0.0, 1.0)
println(result)