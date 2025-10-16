import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步获取网络数据并保存到随机命名的.dart文件中
/// 
/// [url] 是要获取数据的网络地址
/// [directory] 是保存文件的目录，默认为当前目录
/// 返回生成的文件路径
Future<String> fetchAndSaveNetworkData(String url, {String directory = '.'}) async {
  try {
    print('正在从 $url 获取数据...');
    
    // 设置请求头，包含用户代理
    final request = http.Request('GET', Uri.parse(url));
    request.headers['User-Agent'] = 'Dart/NetworkDataSaver';
    
    // 发起网络请求
    final response = await http.Client().send(request);
    final responseBody = await response.stream.bytesToString();
    
    if (response.statusCode == 200) {
      // 生成随机文件名
      String randomFileName = _generateRandomFileName();
      String filePath = '$directory/$randomFileName.dart';
      
      // 将数据写入文件
      File file = File(filePath);
      await file.writeAsString(responseBody);
      
      print('数据已成功保存到: $filePath');
      return filePath;
    } else {
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('发生错误: $e');
    rethrow;
  }
}

/// 生成随机文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  String randomString = List.generate(10, (index) => chars[random.nextInt(chars.length)]).join();
  return 'data_$randomString';
}

/// 示例用法
void main() async {
  // 示例：获取JSONPlaceholder的数据并保存
  try {
    String savedFilePath = await fetchAndSaveNetworkData(
      'https://api.github.com/users/octocat',
      directory: '.'
    );
    print('文件已保存: $savedFilePath');
  } catch (e) {
    print('执行过程中出现错误: $e');
  }
}