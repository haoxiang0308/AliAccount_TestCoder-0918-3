-- Lua script to store student grades and calculate average
local student_grades = {
    {name = "Alice", grade = 85},
    {name = "Bob", grade = 92},
    {name = "Charlie", grade = 78},
    {name = "Diana", grade = 96},
    {name = "Eve", grade = 88}
}

-- Function to calculate average grade
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

-- Calculate average
local avg_grade = calculate_average(student_grades)

-- Print results
print("Student Grades:")
for i, student in ipairs(student_grades) do
    print("Name: " .. student.name .. ", Grade: " .. student.grade)
end

print("\nAverage Grade: " .. string.format("%.2f", avg_grade))

-- Return the table and average for potential use elsewhere
return {
    students = student_grades,
    average = avg_grade
}