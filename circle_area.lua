-- Function to calculate the area of a circle
function calculateCircleArea(radius)
    -- Check if the radius is valid
    if radius < 0 then
        error("Radius cannot be negative")
    end
    
    -- Calculate the area using the formula A = π * r^2
    local area = math.pi * radius * radius
    
    return area
end

-- Example usage:
-- local area = calculateCircleArea(5)
-- print("The area of the circle is: " .. area)