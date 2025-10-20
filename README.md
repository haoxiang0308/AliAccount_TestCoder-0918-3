# 偶数过滤器

这个JavaScript函数可以过滤数组中的偶数，并将结果保存到一个随机命名的文件中。

## 功能特点

- 过滤输入数组中的所有偶数
- 生成随机命名的JSON文件保存结果
- 保留原始数组、过滤后的偶数数组和偶数计数

## 使用方法

```javascript
const { filterEvenNumbersAndSave } = require('./filterEvenNumbers');

// 示例用法
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const filePath = filterEvenNumbersAndSave(numbers);
```

## 函数参数

- `array` (number[]): 需要过滤的数字数组
- `directory` (string, 可选): 保存文件的目录，默认为 '/workspace'

## 返回值

- `string`: 生成的文件路径

## 输出文件内容

生成的JSON文件包含以下字段：
- `originalArray`: 原始输入数组
- `evenNumbers`: 过滤后的偶数数组
- `count`: 偶数的数量