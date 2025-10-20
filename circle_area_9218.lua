-- Функция для вычисления площади круга
function circle_area(radius)
    if radius < 0 then
        error("Радиус не может быть отрицательным")
    end
    return math.pi * radius * radius
end

-- Пример использования функции
local r = 5
local area = circle_area(r)
print("Площадь круга с радиусом " .. r .. " равна " .. area)