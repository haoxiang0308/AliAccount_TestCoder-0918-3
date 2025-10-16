function calculateCircleArea(radius)
    if radius < 0 then
        error("Радиус не может быть отрицательным")
    end
    local pi = math.pi
    return pi * radius * radius
end

-- Пример использования:
-- print(calculateCircleArea(5))