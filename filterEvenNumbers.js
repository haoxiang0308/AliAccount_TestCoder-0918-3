const fs = require('fs');
const path = require('path');

/**
 * 过滤数组中的偶数并保存到随机命名的文件中
 * @param {number[]} arr - 输入的数字数组
 * @param {string} outputDir - 输出目录，默认为当前目录
 * @returns {string} - 生成的文件路径
 */
function filterEvenNumbersAndSave(arr, outputDir = './') {
  // 过滤出偶数
  const evenNumbers = arr.filter(num => num % 2 === 0);
  
  // 生成随机文件名
  const randomFileName = `even_numbers_${Date.now()}_${Math.floor(Math.random() * 10000)}.json`;
  const filePath = path.join(outputDir, randomFileName);
  
  // 将偶数数组转换为JSON并保存到文件
  const jsonData = JSON.stringify(evenNumbers, null, 2);
  fs.writeFileSync(filePath, jsonData);
  
  console.log(`偶数已过滤并保存到文件: ${filePath}`);
  console.log(`过滤出的偶数: [${evenNumbers.join(', ')}]`);
  
  return filePath;
}

// 示例使用
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
const savedFilePath = filterEvenNumbersAndSave(numbers);

module.exports = { filterEvenNumbersAndSave };