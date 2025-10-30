-- Function to calculate the area of a circle
function calculateCircleArea(radius)
    if radius < 0 then
        error("Radius cannot be negative")
    end
    return math.pi * radius * radius
end

-- Example usage:
-- local area = calculateCircleArea(5)
-- print("Area of circle with radius 5: " .. area)