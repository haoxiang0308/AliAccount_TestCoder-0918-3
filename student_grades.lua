-- Lua表存储学生成绩并计算平均分

-- 创建一个包含学生成绩的表
local student_grades = {
    ["Alice"] = 85,
    ["Bob"] = 92,
    ["Charlie"] = 78,
    ["Diana"] = 96,
    ["Eve"] = 88,
    ["Frank"] = 91
}

-- 计算平均分
local total = 0
local count = 0

for name, grade in pairs(student_grades) do
    total = total + grade
    count = count + 1
    print("学生: " .. name .. ", 成绩: " .. grade)
end

local average = total / count
print("\n总分: " .. total)
print("学生人数: " .. count)
print("平均分: " .. string.format("%.2f", average))

-- 返回结果表（可用于其他脚本导入）
return {
    grades = student_grades,
    total = total,
    count = count,
    average = average
}