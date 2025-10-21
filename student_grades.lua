-- Lua table to store student grades
local studentGrades = {
    Alice = 85,
    Bob = 92,
    Charlie = 78,
    Diana = 96,
    Edward = 88,
    Fiona = 91,
    George = 83,
    Hannah = 95
}

-- Function to calculate average grade
local function calculateAverage(grades)
    local sum = 0
    local count = 0
    
    for name, grade in pairs(grades) do
        sum = sum + grade
        count = count + 1
    end
    
    if count > 0 then
        return sum / count
    else
        return 0
    end
end

-- Calculate average
local average = calculateAverage(studentGrades)

-- Print the grades and average
print("Student Grades:")
for name, grade in pairs(studentGrades) do
    print(name .. ": " .. grade)
end

print("\nAverage Grade: " .. string.format("%.2f", average))

-- Export the table and average to a new file with a random name
local randomName = "grades_output_" .. math.random(10000, 99999) .. ".lua"

-- Write the data to the new file
local file = io.open(randomName, "w")
if file then
    file:write("-- Student grades and average\n")
    file:write("local studentGrades = {\n")
    for name, grade in pairs(studentGrades) do
        file:write("    " .. name .. " = " .. grade .. ",\n")
    end
    file:write("}\n\n")
    file:write("local average = " .. string.format("%.2f", average) .. "\n\n")
    file:write("return {grades = studentGrades, average = average}\n")
    file:close()
    
    print("\nData saved to: " .. randomName)
else
    print("Error: Could not create file " .. randomName)
end