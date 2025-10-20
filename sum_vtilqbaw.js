/**
 * Функция для сложения двух чисел
 * @param {number} a - Первое число
 * @param {number} b - Второе число
 * @returns {number} - Сумма двух чисел
 */
function add(a, b) {
    return a + b;
}

// Для использования в Node.js
if (typeof module !== 'undefined' && module.exports) {
    module.exports = add;
}
