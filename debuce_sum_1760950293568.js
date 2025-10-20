/**
 * Складывает два числа
 * @param {number} a - Первое число
 * @param {number} b - Второе число
 * @returns {number} Сумма a и b
 */
function addTwoNumbers(a, b) {
    // Проверяем, являются ли аргументы числами
    if (typeof a !== 'number' || typeof b !== 'number') {
        console.error('Ошибка: оба аргумента должны быть числами');
        return undefined;
    }
    
    // Проверяем, являются ли числа допустимыми (не NaN и не бесконечностью)
        console.error('Ошибка: аргументы должны быть конечными числами');
        return undefined;
    }
    
    return a + b;
}

// Экспорт функции для использования в Node.js
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { addTwoNumbers };
}

// Для использования в браузере
if (typeof window !== 'undefined') {
    window.addTwoNumbers = addTwoNumbers;
}
