// Функция для сложения двух чисел
function sumTwoNumbers(firstNumber, secondNumber) {
    if (typeof firstNumber !== 'number' || typeof secondNumber !== 'number') {
        throw new Error('Both arguments must be numbers');
    }
    return firstNumber + secondNumber;
}

// Экспорт функции
if (typeof module !== 'undefined' && module.exports) {
    module.exports = sumTwoNumbers;
} else if (typeof window !== 'undefined') {
    window.sumTwoNumbers = sumTwoNumbers;
}