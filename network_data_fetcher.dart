import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchAndSaveNetworkData(String url) async {
  try {
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      // 生成随机文件名
      String randomFileName = _generateRandomFileName();
      
      // 将数据保存到.dart文件中
      File file = File(randomFileName);
      await file.writeAsString(response.body);
      
      print('数据已成功保存到 $randomFileName');
      return randomFileName;
    } else {
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('发生错误: $e');
    rethrow;
  }
}

/// 生成随机.dart文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  
  String randomString = List.generate(10, (index) => chars[random.nextInt(chars.length)]).join();
  
  return '${DateTime.now().millisecondsSinceEpoch}_$randomString.dart';
}

/// 使用dart:io的HttpClient实现的示例
Future<void> main() async {
  // 示例：获取JSONPlaceholder API的数据
  String url = 'https://jsonplaceholder.typicode.com/posts/1';
  
  try {
    String fileName = await fetchAndSaveNetworkData(url);
    print('完成！数据已保存到文件: $fileName');
  } catch (e) {
    print('执行失败: $e');
  }
}

