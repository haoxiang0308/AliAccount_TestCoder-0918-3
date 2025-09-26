-- Lua script to store student grades and calculate average

-- Define a table to store student data
local student_grades = {
    { name = "Alice", score = 92 },
    { name = "Bob", score = 85 },
    { name = "Charlie", score = 78 },
    { name = "Diana", score = 96 },
    { name = "Eve", score = 88 }
}

-- Calculate the average score
local total_score = 0
local num_students = #student_grades

for i, student in ipairs(student_grades) do
    total_score = total_score + student.score
end

local average_score = total_score / num_students

-- Print the results
print("Student Grades:")
for i, student in ipairs(student_grades) do
    print("  " .. student.name .. ": " .. student.score)
end

print("\nAverage Score: " .. average_score)

-- Return the data and average if this script is required by another
return {
    grades = student_grades,
    average = average_score
}