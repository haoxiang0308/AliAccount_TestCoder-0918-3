const fs = require('fs');
const path = require('path');

/**
 * 过滤数组中的偶数并保存到随机命名的文件中
 * @param {number[]} array - 输入的数字数组
 * @param {string} [directory='./'] - 保存文件的目录，默认为当前目录
 * @returns {string} - 生成的文件路径
 */
function filterAndSaveEvenNumbers(array, directory = './') {
  // 验证输入参数
  if (!Array.isArray(array)) {
    throw new Error('第一个参数必须是数组');
  }
  
  // 过滤出偶数
  const evenNumbers = array.filter(num => typeof num === 'number' && num % 2 === 0);
  
  // 生成随机文件名
  const randomFileName = `even_numbers_${Date.now()}_${Math.floor(Math.random() * 10000)}.json`;
  const filePath = path.join(directory, randomFileName);
  
  // 将偶数数组转换为JSON并保存到文件
  const dataToSave = {
    originalArray: array,
    evenNumbers: evenNumbers,
    count: evenNumbers.length,
    timestamp: new Date().toISOString()
  };
  
  fs.writeFileSync(filePath, JSON.stringify(dataToSave, null, 2));
  
  console.log(`偶数已过滤并保存到文件: ${filePath}`);
  console.log(`原数组: [${array.join(', ')}]`);
  console.log(`偶数: [${evenNumbers.join(', ')}]`);
  console.log(`偶数个数: ${evenNumbers.length}`);
  
  return filePath;
}

// 示例使用
console.log('=== 示例 1: 包含奇数和偶数的数组 ===');
const sampleArray1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 20, 25, 30];
const savedFilePath1 = filterAndSaveEvenNumbers(sampleArray1);

console.log('\n=== 示例 2: 只包含奇数的数组 ===');
const sampleArray2 = [1, 3, 5, 7, 9, 11];
const savedFilePath2 = filterAndSaveEvenNumbers(sampleArray2);

console.log('\n=== 示例 3: 只包含偶数的数组 ===');
const sampleArray3 = [2, 4, 6, 8, 10, 12];
const savedFilePath3 = filterAndSaveEvenNumbers(sampleArray3);

console.log('\n=== 示例 4: 包含负数的数组 ===');
const sampleArray4 = [-4, -3, -2, -1, 0, 1, 2, 3, 4];
const savedFilePath4 = filterAndSaveEvenNumbers(sampleArray4);

module.exports = { filterAndSaveEvenNumbers };