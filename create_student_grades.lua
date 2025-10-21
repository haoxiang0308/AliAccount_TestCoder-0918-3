#!/usr/bin/env lua

-- 学生成绩表
local studentGrades = {
    {name = "张三", score = 85},
    {name = "李四", score = 92},
    {name = "王五", score = 78},
    {name = "赵六", score = 88},
    {name = "钱七", score = 95}
}

-- 计算平均分
local total = 0
for i, student in ipairs(studentGrades) do
    total = total + student.score
end

local average = total / #studentGrades

-- 打印结果
print("学生成绩列表：")
for i, student in ipairs(studentGrades) do
    print(i .. ". " .. student.name .. ": " .. student.score)
end

print("\n平均分: " .. string.format("%.2f", average))

-- 将结果保存到表中
local result = {
    students = studentGrades,
    average = average
}

return result