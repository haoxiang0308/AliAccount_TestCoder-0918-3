function calculate_circle_area(radius)\n    if radius < 0 then\n        error('Radius cannot be negative')\n    end\n    return math.pi * radius * radius\nend
