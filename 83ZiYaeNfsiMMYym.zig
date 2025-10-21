// Файл с экземпляром структуры точки с случайным именем
const Point = struct {
    x: f32,
    y: f32,
};

// Экземпляр структуры точки
const point_instance = Point{
    .x = 5.0,
    .y = 8.5,
};
