/**
 * Сложение двух чисел
 * @param {number} x - Первое число
 * @param {number} y - Второе число
 * @returns {number} Результат сложения
 */
function sumNumbers(x, y) {
    // Проверка на корректность входных данных
    if (!Number.isFinite(x) || !Number.isFinite(y)) {
        throw new Error('Оба параметра должны быть конечными числами');
    }
    
    return x + y;
}

// Экспорт функции для различных сред
if (typeof exports !== 'undefined') {
    exports.sumNumbers = sumNumbers;
}
if (typeof window !== 'undefined') {
    window.sumNumbers = sumNumbers;
}
