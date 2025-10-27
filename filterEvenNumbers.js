/**
 * 过滤数组中的偶数
 * @param {number[]} arr - 输入的数字数组
 * @returns {number[]} - 返回只包含偶数的新数组
 */
function filterEvenNumbers(arr) {
    return arr.filter(num => num % 2 === 0);
}

/**
 * 将过滤后的偶数数组保存到文件中
 * @param {number[]} arr - 输入的数字数组
 * @param {string} filename - 要保存的文件名
 */
function saveEvenNumbersToFile(arr, filename) {
    const evenNumbers = filterEvenNumbers(arr);
    const fs = require('fs');
    
    fs.writeFileSync(filename, JSON.stringify(evenNumbers), 'utf8');
    console.log(`偶数数组已保存到文件: ${filename}`);
    console.log('偶数数组:', evenNumbers);
}

// 生成随机文件名
function generateRandomFilename() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    let filename = 'even_numbers_';
    
    for (let i = 0; i < 8; i++) {
        filename += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    
    filename += '.json';
    return filename;
}

// 示例使用
const testArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
const randomFilename = generateRandomFilename();

saveEvenNumbersToFile(testArray, randomFilename);