-- Функция для вычисления площади круга
function area_of_circle(radius)
    if radius < 0 then
        error("Радиус не может быть отрицательным")
    end
    return math.pi * radius * radius
end

-- Пример использования
local r = 5
local area = area_of_circle(r)
print("Площадь круга с радиусом " .. r .. " равна " .. area)