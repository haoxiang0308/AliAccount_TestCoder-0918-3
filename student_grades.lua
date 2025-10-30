-- Lua表存储学生成绩并计算平均分

-- 创建一个表存储学生成绩
local studentGrades = {
    {name = "张三", grade = 85},
    {name = "李四", grade = 92},
    {name = "王五", grade = 78},
    {name = "赵六", grade = 88},
    {name = "钱七", grade = 95}
}

-- 计算平均分
local total = 0
local count = 0

for i, student in ipairs(studentGrades) do
    total = total + student.grade
    count = count + 1
    print("学生: " .. student.name .. ", 成绩: " .. student.grade)
end

local average = total / count
print("\n总分: " .. total)
print("学生人数: " .. count)
print("平均分: " .. string.format("%.2f", average))

-- 返回结果表
return {
    students = studentGrades,
    total = total,
    count = count,
    average = average
}