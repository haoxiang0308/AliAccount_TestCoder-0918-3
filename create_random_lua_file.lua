-- Script to create a random-named Lua file with student grades
math.randomseed(os.time()) -- Seed the random number generator

-- Function to generate a random string
function random_string(length)
    local result = {}
    for i = 1, length do
        result[i] = string.char(math.random(97, 122)) -- ASCII 'a' to 'z'
    end
    return table.concat(result)
end

-- Student grades table
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

-- Generate a random filename
local random_name = random_string(10)
local filename = random_name .. ".lua"

-- Create the file content
local file_content = "-- Randomly named Lua file containing student grades\n"
file_content = file_content .. "-- Generated on: " .. os.date("%Y-%m-%d %H:%M:%S") .. "\n\n"

-- Convert the student_grades table to string
file_content = file_content .. "local student_grades = {\n"
for i, student in ipairs(student_grades) do
    file_content = file_content .. "    {name = \"" .. student.name .. "\", grade = " .. student.grade .. "},\n"
end
file_content = file_content .. "}\n\n"

-- Add the average calculation
file_content = file_content .. "-- Average grade: " .. string.format("%.2f", avg_grade) .. "\n\n"

-- Add the calculate_average function
file_content = file_content .. "function calculate_average(grades)\n"
file_content = file_content .. "    local total = 0\n"
file_content = file_content .. "    local count = 0\n"
file_content = file_content .. "    \n"
file_content = file_content .. "    for i, student in ipairs(grades) do\n"
file_content = file_content .. "        total = total + student.grade\n"
file_content = file_content .. "        count = count + 1\n"
file_content = file_content .. "    end\n"
file_content = file_content .. "    \n"
file_content = file_content .. "    if count > 0 then\n"
file_content = file_content .. "        return total / count\n"
file_content = file_content .. "    else\n"
file_content = file_content .. "        return 0\n"
file_content = file_content .. "    end\n"
file_content = file_content .. "end\n\n"

-- Add a print section
file_content = file_content .. "-- Print results\n"
file_content = file_content .. "print(\"Student Grades:\")\n"
file_content = file_content .. "for i, student in ipairs(student_grades) do\n"
file_content = file_content .. "    print(\"Name: \" .. student.name .. \", Grade: \" .. student.grade)\n"
file_content = file_content .. "end\n\n"
file_content = file_content .. "print(\"\\nAverage Grade: \" .. string.format(\"%.2f\", calculate_average(student_grades)))\n\n"

-- Write the content to the file
local file = io.open(filename, "w")
if file then
    file:write(file_content)
    file:close()
    print("Student grades saved to: " .. filename)
    print("Average grade: " .. string.format("%.2f", avg_grade))
else
    print("Error: Could not create file " .. filename)
end