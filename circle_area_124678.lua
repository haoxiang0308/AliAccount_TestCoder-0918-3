-- Функция для вычисления площади круга
function calculate_circle_area(radius)
    if radius < 0 then
        error("Радиус не может быть отрицательным")
    end
    return math.pi * radius * radius
end

-- Пример использования
local radius = 5
local area = calculate_circle_area(radius)
print("Площадь круга с радиусом " .. radius .. " равна " .. area)