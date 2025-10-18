import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步函数：获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchAndSaveNetworkData(String url) async {
  try {
    print('正在从 $url 获取数据...');
    
    // 发起网络请求
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      // 生成随机文件名
      String randomFileName = _generateRandomFileName();
      
      // 将数据写入随机命名的.dart文件
      File file = File(randomFileName);
      await file.writeAsString(response.body);
      
      print('数据已成功保存到 $randomFileName');
      return randomFileName;
    } else {
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('获取或保存数据时出错: $e');
    rethrow;
  }
}

/// 生成随机文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  
  String randomString = '';
  for (int i = 0; i < 10; i++) {
    randomString += chars[random.nextInt(chars.length)];
  }
  
  return '/workspace/$randomString.dart';
}

/// 示例用法
void main() async {
  try {
    // 示例：获取一个公共API的数据
    String fileName = await fetchAndSaveNetworkData('https://httpbin.org/json');
    print('完成！数据已保存到: $fileName');
  } catch (e) {
    print('主函数执行出错: $e');
  }
}