const fs = require('fs');
const path = require('path');

/**
 * 过滤数组中的偶数并保存到随机命名的文件中
 * @param {number[]} array - 输入的数字数组
 * @param {string} [directory='/workspace'] - 保存文件的目录
 * @returns {string} - 生成的文件路径
 */
function filterEvenNumbersAndSave(array, directory = '/workspace') {
  // 过滤出偶数
  const evenNumbers = array.filter(num => num % 2 === 0);
  
  // 生成随机文件名
  const randomFileName = `even_numbers_${Date.now()}_${Math.floor(Math.random() * 10000)}.json`;
  const filePath = path.join(directory, randomFileName);
  
  // 将偶数数组转换为JSON字符串并保存到文件
  const dataToSave = {
    originalArray: array,
    evenNumbers: evenNumbers,
    count: evenNumbers.length
  };
  
  fs.writeFileSync(filePath, JSON.stringify(dataToSave, null, 2));
  
  console.log(`偶数过滤完成，结果已保存到: ${filePath}`);
  console.log(`原始数组: [${array.join(', ')}]`);
  console.log(`偶数数组: [${evenNumbers.join(', ')}]`);
  console.log(`偶数个数: ${evenNumbers.length}`);
  
  return filePath;
}

module.exports = { filterEvenNumbersAndSave };