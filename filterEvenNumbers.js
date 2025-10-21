// JavaScript函数：过滤数组中的偶数
function filterEvenNumbers(arr) {
    return arr.filter(num => num % 2 === 0);
}

// 使用示例
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(numbers);
console.log("原数组:", numbers);
console.log("偶数:", evenNumbers);

// 将结果保存到随机命名的文件中
const fs = require('fs');
const path = require('path');

// 生成随机文件名
function generateRandomFileName(extension = '.txt') {
    const randomName = Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15);
    return randomName + extension;
}

// 保存到随机命名的文件
const randomFileName = generateRandomFileName('.json');
const filePath = path.join(__dirname, randomFileName);

const dataToSave = {
    originalArray: numbers,
    evenNumbers: evenNumbers,
    timestamp: new Date().toISOString()
};

fs.writeFileSync(filePath, JSON.stringify(dataToSave, null, 2));

console.log(`结果已保存到文件: ${filePath}`);

module.exports = { filterEvenNumbers, generateRandomFileName };