import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步获取网络数据并保存到随机命名的.dart文件中
/// [url] 网络数据源的URL
/// [directory] 保存文件的目录，默认为当前目录
/// 返回生成的文件名
Future<String> fetchAndSaveNetworkData(String url, {String directory = '.'}) async {
  try {
    // 使用http包进行网络请求
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      // 获取响应数据
      final responseBody = response.body;
      
      // 生成随机文件名
      final randomFileName = _generateRandomFileName();
      final filePath = '$directory/$randomFileName.dart';
      
      // 创建文件并写入数据
      final file = File(filePath);
      await file.writeAsString(responseBody);
      
      print('数据已保存到: $filePath');
      return randomFileName;
    } else {
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('错误: $e');
    rethrow;
  }
}

/// 生成随机文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = Random();
  final buffer = StringBuffer();
  
  // 生成8位随机字符作为文件名
  for (int i = 0; i < 8; i++) {
    buffer.write(chars[random.nextInt(chars.length)]);
  }
  
  return buffer.toString();
}

/// 使用示例
void main() async {
  try {
    // 示例：获取JSONPlaceholder的用户数据
    final fileName = await fetchAndSaveNetworkData(
      'https://jsonplaceholder.typicode.com/users',
      directory: '.'
    );
    print('随机生成的文件名: $fileName.dart');
  } catch (e) {
    print('执行失败: $e');
  }
}