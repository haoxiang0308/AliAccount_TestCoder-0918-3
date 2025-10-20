/**
 * Функция для сложения двух чисел
 * @param {number} num1 - Первое число
 * @param {number} num2 - Второе число
 * @returns {number} - Сумма двух чисел
 */
const sumOfTwo = (num1, num2) => {
    // Проверка, что оба параметра - числа
    if (typeof num1 !== 'number' || typeof num2 !== 'number' || isNaN(num1) || isNaN(num2)) {
        throw new TypeError('Оба параметра должны быть действительными числами');
    }
    
    return num1 + num2;
};

// Универсальный экспорт для использования в разных средах
(function (global, factory) {
    if (typeof exports !== 'undefined') {
        // Node.js
        module.exports = { sumOfTwo: sumOfTwo };
    } else if (typeof define === 'function' && define.amd) {
        // AMD
        define([], function () { return { sumOfTwo: sumOfTwo }; });
    } else {
        // Браузер
        global.sumOfTwo = sumOfTwo;
    }
})(this, {});
