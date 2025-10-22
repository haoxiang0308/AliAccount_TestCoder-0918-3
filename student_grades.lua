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
function calculateAverage(grades)
    local total = 0
    local count = 0
    
    for name, grade in pairs(grades) do
        total = total + grade
        count = count + 1
    end
    
    if count == 0 then
        return 0
    else
        return total / count
    end
end

-- Calculate and print average
local avg = calculateAverage(studentGrades)
print("Student Grades:")
for name, grade in pairs(studentGrades) do
    print(name .. ": " .. grade)
end

print("\nAverage Grade: " .. string.format("%.2f", avg))

-- Return the table and average for potential use in other scripts
return {
    grades = studentGrades,
    average = avg
}