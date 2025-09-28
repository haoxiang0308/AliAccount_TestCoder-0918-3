function solve_quadratic(a, b, c)
    discriminant = b^2 - 4*a*c
    if discriminant > 0
        root1 = (-b + sqrt(discriminant)) / (2*a)
        root2 = (-b - sqrt(discriminant)) / (2*a)
        return (root1, root2)
    elseif discriminant == 0
        root = -b / (2*a)
        return (root,)
    else
        real_part = -b / (2*a)
        imag_part = sqrt(-discriminant) / (2*a)
        return (complex(real_part, imag_part), complex(real_part, -imag_part))
    end
end
