-- Function to calculate the area of a circle
function circle_area(radius)
    if radius < 0 then
        error("Radius cannot be negative")
    end
    return math.pi * radius * radius
end

-- Example usage:
-- print(circle_area(5)) -- Output: 78.53981633974483