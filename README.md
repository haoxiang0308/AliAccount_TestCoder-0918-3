# Dart网络数据获取和保存工具

这个项目包含一个Dart异步函数，用于获取网络数据并将其保存到随机命名的.dart文件中。

## 文件说明

- `network_data_fetcher.dart`: 主要的Dart程序文件，包含异步网络请求和文件保存功能
- `pubspec.yaml`: Dart项目的依赖配置文件

## 功能特点

1. **异步网络请求**：使用`http`包发送HTTP GET请求获取网络数据
2. **随机文件命名**：生成随机文件名以避免冲突
3. **自动创建目录**：自动创建输出目录来保存文件
4. **错误处理**：包含完整的错误处理机制

## 代码结构

### 主要函数

- `fetchNetworkDataAndSave(String url)`: 主异步函数，获取网络数据并保存到随机命名的.dart文件
- `_generateRandomFileName()`: 生成随机文件名的辅助函数

### 依赖

项目依赖`http`包来处理HTTP请求，已在`pubspec.yaml`中声明。

## 使用方法

1. 确保已安装Dart SDK
2. 运行 `dart pub get` 安装依赖
3. 运行 `dart network_data_fetcher.dart` 执行程序

## 示例

程序会向 `https://jsonplaceholder.typicode.com/posts/1` 发送请求，并将返回的JSON数据保存到 `output/` 目录下的随机命名.dart文件中。

## 注意事项

- 需要有效网络连接来获取数据
- 输出文件将保存在 `output/` 目录中
- 随机文件名由10个随机字母数字字符组成