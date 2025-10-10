-- Lua script to store student grades and calculate average

-- Define a table to store student names and their grades
local studentGrades = {
    Alice = 85,
    Bob = 78,
    Charlie = 92,
    Diana = 88,
    Edward = 76
}

-- Calculate the average grade
local total = 0
local count = 0
for name, grade in pairs(studentGrades) do
    total = total + grade
    count = count + 1
end

local average = total / count

-- Print the results
print("Student Grades:")
for name, grade in pairs(studentGrades) do
    print(name .. ": " .. grade)
end

print("\nAverage Grade: " .. average)

-- Return the table and average for potential use by other scripts
return {
    grades = studentGrades,
    average = average
}