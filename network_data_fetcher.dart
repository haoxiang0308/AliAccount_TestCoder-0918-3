import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步函数：获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchNetworkDataAndSave(String url) async {
  try {
    // 发送HTTP请求获取网络数据
    http.Response response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      // 生成随机文件名
      String randomFileName = _generateRandomFileName();
      String filePath = 'output/$randomFileName.dart';
      
      // 确保输出目录存在
      await Directory('output').create(recursive: true);
      
      // 将数据保存到随机命名的.dart文件中
      File file = File(filePath);
      await file.writeAsString(response.body);
      
      print('数据已保存到: $filePath');
      return filePath;
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
  String chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  Random random = Random();
  String randomString = '';
  
  for (int i = 0; i < 10; i++) {
    randomString += chars[random.nextInt(chars.length)];
  }
  
  return 'data_$randomString';
}

void main() async {
  // 使用示例
  try {
    // 使用实际URL时，请替换为有效的网络地址
    String url = 'https://jsonplaceholder.typicode.com/posts/1';
    String savedFilePath = await fetchNetworkDataAndSave(url);
    print('文件已成功保存: $savedFilePath');
  } catch (e) {
    print('执行过程中发生错误: $e');
  }
}