import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步函数：获取网络数据并保存到随机命名的.dart文件中
/// 
/// [url] - 要获取数据的网络URL
/// [directory] - 保存文件的目录，默认为当前工作目录
/// 返回生成的文件名
Future<String> fetchNetworkDataAndSave(String url, {String directory = '.'}) async {
  try {
    print('正在获取网络数据: $url');
    
    // 发送HTTP请求获取数据
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode != 200) {
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
    
    // 生成随机文件名
    String randomFileName = _generateRandomFileName();
    String filePath = '$directory/$randomFileName.dart';
    
    // 将获取的数据写入随机命名的.dart文件
    File file = File(filePath);
    await file.writeAsString(response.body);
    
    print('数据已成功保存到: $filePath');
    return randomFileName;
  } catch (e) {
    print('错误: $e');
    rethrow;
  }
}

/// 生成随机文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  
  StringBuffer buffer = StringBuffer();
  for (int i = 0; i < 10; i++) {
    buffer.write(chars[random.nextInt(chars.length)]);
  }
  
  return buffer.toString();
}

/// 示例用法
void main() async {
  // 示例：获取一个公共API的数据并保存
  try {
    // 使用一个更可靠的公共API
    String fileName = await fetchNetworkDataAndSave(
      'https://httpbin.org/get',
      directory: '/workspace'
    );
    print('随机生成的文件名: $fileName.dart');
  } catch (e) {
    print('执行失败: $e');
  }
  
  // 您也可以使用其他URL，例如：
  // await fetchNetworkDataAndSave('https://api.github.com/users/octocat');
  // await fetchNetworkDataAndSave('https://jsonplaceholder.typicode.com/posts/1');
}