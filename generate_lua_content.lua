-- This script creates a Lua table for student scores, calculates the average, and prints the Lua code to define it.
-- We will generate the content and then write it to a file with a random name using bash.

-- Define the student data
local student_scores = {
    { name = "Alice", score = 95 },
    { name = "Bob", score = 87 },
    { name = "Charlie", score = 92 },
    { name = "Diana", score = 88 },
    { name = "Eve", score = 94 }
}

-- Calculate the average score
local total_score = 0
for i, student in ipairs(student_scores) do
    total_score = total_score + student.score
end
local average_score = total_score / #student_scores

-- Print the Lua table definition that would recreate this data and average
print("local student_data = {")
for i, student in ipairs(student_scores) do
    print(string.format('    { name = "%s", score = %d },', student.name, student.score))
end
print("}")
print(string.format("local average_score = %.2f", average_score))
