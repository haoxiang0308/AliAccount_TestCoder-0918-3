// Функция для вычисления суммы двух чисел
const calculateSum = (first, second) => {
    // Проверка, что оба параметра являются числами
    if (typeof first !== 'number' || typeof second !== 'number') {
        console.warn('Предупреждение: один или оба параметра не являются числом');
        return NaN;
    }
    
    return first + second;
};

// Экспорт для использования в других модулях
if (typeof module !== 'undefined' && module.exports) {
    module.exports = calculateSum;
}
