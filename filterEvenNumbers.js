/**
 * 过滤数组中的偶数并保存到随机命名的文件中
 * @param {number[]} array - 输入的数字数组
 * @param {string} [directory="./"] - 保存文件的目录，默认为当前目录
 * @returns {string} 返回生成的文件名
 */
function filterEvenNumbersAndSave(array, directory = "./") {
    // 过滤偶数
    const evenNumbers = array.filter(num => num % 2 === 0);
    
    // 生成随机文件名
    const randomFileName = `even_numbers_${Date.now()}_${Math.floor(Math.random() * 10000)}.json`;
    const filePath = `${directory}/${randomFileName}`;
    
    // 将偶数数组转换为JSON字符串
    const jsonData = JSON.stringify(evenNumbers, null, 2);
    
    // 使用Node.js的fs模块写入文件
    const fs = require('fs');
    
    try {
        fs.writeFileSync(filePath, jsonData);
        console.log(`偶数已过滤并保存到文件: ${filePath}`);
        console.log(`过滤出的偶数:`, evenNumbers);
        return randomFileName;
    } catch (error) {
        console.error('保存文件时出错:', error);
        throw error;
    }
}

// 示例用法
const testArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
const savedFileName = filterEvenNumbersAndSave(testArray);
console.log(`文件名: ${savedFileName}`);