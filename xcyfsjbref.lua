-- Randomly named Lua file containing student grades
-- Generated on: 2025-10-28 16:00:24

local student_grades = {
    {name = "Alice", grade = 85},
    {name = "Bob", grade = 92},
    {name = "Charlie", grade = 78},
    {name = "Diana", grade = 96},
    {name = "Eve", grade = 88},
}

-- Average grade: 87.80

function calculate_average(grades)
    local total = 0
    local count = 0
    
    for i, student in ipairs(grades) do
        total = total + student.grade
        count = count + 1
    end
    
    if count > 0 then
        return total / count
    else
        return 0
    end
end

-- Print results
print("Student Grades:")
for i, student in ipairs(student_grades) do
    print("Name: " .. student.name .. ", Grade: " .. student.grade)
end

print("\nAverage Grade: " .. string.format("%.2f", calculate_average(student_grades)))

