-- Función para calcular el volumen de una esfera
-- Fórmula: V = (4/3) * π * r³

function calcular_volumen_esfera(radio)
    local pi = math.pi
    local volumen = (4/3) * pi * (radio ^ 3)
    return volumen
end

-- Ejemplo de uso:
-- local radio = 5
-- local volumen = calcular_volumen_esfera(radio)
-- print("El volumen de la esfera con radio " .. radio .. " es: " .. volumen)
