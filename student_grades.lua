-- Lua script to store student grades and calculate average

-- Student grades table
local studentGrades = {
    Alice = 92,
    Bob = 85,
    Charlie = 78,
    Diana = 96,
    Edward = 88
}

-- Calculate average grade
local total = 0
local count = 0
for name, grade in pairs(studentGrades) do
    total = total + grade
    count = count + 1
end

local average = total / count

-- Print results
print("Student Grades:")
for name, grade in pairs(studentGrades) do
    print(name .. ": " .. grade)
end

print("\nAverage Grade: " .. average)

-- Return the table and average for potential external use
return {
    grades = studentGrades,
    average = average
}