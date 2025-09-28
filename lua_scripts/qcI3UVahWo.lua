-- Функция для вычисления площади круга
function calculate_circle_area(radius)
    local pi = 3.14159
    return pi * radius * radius
end

-- Пример использования
local r = 5
local area = calculate_circle_area(r)
print("Площадь круга с радиусом " .. r .. " равна " .. area)