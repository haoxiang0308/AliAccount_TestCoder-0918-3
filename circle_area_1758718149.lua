-- Функция для вычисления площади круга
function calculateCircleArea(radius)
    if radius < 0 then
        print("Радиус не может быть отрицательным")
        return nil
    end
    local area = math.pi * radius * radius
    return area
end

-- Пример использования
local radius = 5
local area = calculateCircleArea(radius)
if area then
    print("Площадь круга с радиусом " .. radius .. " равна " .. area)
end