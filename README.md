# Dart 网络数据获取和保存工具

这个Dart程序包含一个异步函数，用于从网络获取数据并保存到随机命名的.dart文件中。

## 功能特点

- 异步获取网络数据
- 生成随机文件名保存数据
- 支持自定义保存目录
- 错误处理机制

## 使用方法

1. 首先确保已安装Dart SDK
2. 在项目根目录运行 `dart pub get` 安装依赖
3. 运行程序 `dart network_data_saver.dart`

## 依赖项

- `http: ^1.1.0` - 用于HTTP请求
- `dart:io` - 文件操作
- `dart:math` - 生成随机数

## 代码说明

`fetchAndSaveNetworkData` 函数接收一个URL参数，异步获取网络数据，然后生成一个随机文件名并将数据保存为.dart文件。

随机文件名生成器使用8位随机字符（包含字母和数字）来创建唯一的文件名。

## 示例

```dart
void main() async {
  try {
    final fileName = await fetchAndSaveNetworkData(
      'https://jsonplaceholder.typicode.com/users',
      directory: '.'
    );
    print('随机生成的文件名: $fileName.dart');
  } catch (e) {
    print('执行失败: $e');
  }
}
```