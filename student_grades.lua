-- 定义一个存储学生成绩的Lua表
student_grades = {
    Alice = 85,
    Bob = 92,
    Charlie = 78,
    Diana = 96,
    Eve = 88
}

-- 计算平均分的函数
function calculate_average(grades)
    local sum = 0
    local count = 0
    for _, grade in pairs(grades) do
        sum = sum + grade
        count = count + 1
    end
    if count == 0 then
        return 0 -- 避免除以零
    end
    return sum / count
end

-- 调用函数并打印平均分
average_score = calculate_average(student_grades)
print("学生的平均分是: " .. average_score)