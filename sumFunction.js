function sum(a, b) {
    return a + b;
}

// Экспорт функции для возможного использования в других модулях
if (typeof module !== 'undefined' && module.exports) {
    module.exports = sum;
}