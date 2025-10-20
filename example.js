const { filterEvenNumbersAndSave } = require('./filterEvenNumbers');

// 示例1: 基本用法
console.log('示例1: 基本用法');
const numbers1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const filePath1 = filterEvenNumbersAndSave(numbers1);

// 示例2: 包含负数的数组
console.log('\n示例2: 包含负数的数组');
const numbers2 = [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5];
const filePath2 = filterEvenNumbersAndSave(numbers2);

// 示例3: 只有奇数的数组
console.log('\n示例3: 只有奇数的数组');
const numbers3 = [1, 3, 5, 7, 9];
const filePath3 = filterEvenNumbersAndSave(numbers3);

// 示例4: 只有偶数的数组
console.log('\n示例4: 只有偶数的数组');
const numbers4 = [2, 4, 6, 8, 10];
const filePath4 = filterEvenNumbersAndSave(numbers4);