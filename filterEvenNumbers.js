const fs = require('fs');
const path = require('path');

/**
 * 过滤数组中的偶数并保存到随机命名的文件中
 * @param {number[]} array - 输入的数字数组
 * @param {string} [outputDir='./'] - 输出目录，默认为当前目录
 * @returns {string} - 生成的文件路径
 */
function filterAndSaveEvenNumbers(array, outputDir = './') {
  // 过滤偶数
  const evenNumbers = array.filter(num => num % 2 === 0);
  
  // 生成随机文件名
  const randomFileName = `even_numbers_${Date.now()}_${Math.floor(Math.random() * 10000)}.json`;
  const filePath = path.join(outputDir, randomFileName);
  
  // 将偶数数组转换为JSON并保存到文件
  const dataToSave = {
    originalArray: array,
    evenNumbers: evenNumbers,
    count: evenNumbers.length
  };
  
  fs.writeFileSync(filePath, JSON.stringify(dataToSave, null, 2));
  
  console.log(`偶数已过滤并保存到文件: ${filePath}`);
  console.log(`原数组: [${array.join(', ')}]`);
  console.log(`偶数: [${evenNumbers.join(', ')}]`);
  console.log(`偶数个数: ${evenNumbers.length}`);
  
  return filePath;
}

// 示例用法
const testArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
const savedFilePath = filterAndSaveEvenNumbers(testArray);

module.exports = { filterAndSaveEvenNumbers };