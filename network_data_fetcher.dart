import 'dart:convert';
import 'dart:io';
import 'dart:math';

/// 异步获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchAndSaveNetworkData(String url) async {
  try {
    // 导入http包
    // 注意：在实际使用中，需要添加 http: ^0.13.5 或更高版本到 pubspec.yaml
    var httpClient = HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    
    // 读取响应数据
    var responseBody = await response.transform(utf8.decoder).join();
    
    // 生成随机文件名
    String randomFileName = _generateRandomFileName();
    
    // 将数据写入随机命名的.dart文件
    File file = File(randomFileName);
    await file.writeAsString(responseBody);
    
    print('数据已成功保存到: $randomFileName');
    
    // 关闭HTTP客户端
    httpClient.close();
    
    return randomFileName;
  } catch (e) {
    print('获取网络数据时发生错误: $e');
    rethrow;
  }
}

/// 使用dart:io的HttpClient获取网络数据并保存
Future<String> fetchAndSaveNetworkDataWithHttpClient(String url) async {
  try {
    var httpClient = HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    
    // 检查状态码
    if (response.statusCode != 200) {
      throw HttpException('请求失败，状态码: ${response.statusCode}');
    }
    
    // 读取响应数据
    var responseBody = await response.transform(utf8.decoder).join();
    
    // 生成随机文件名
    String randomFileName = _generateRandomFileName();
    
    // 将数据写入随机命名的.dart文件
    File file = File(randomFileName);
    await file.writeAsString(responseBody);
    
    print('数据已成功保存到: $randomFileName');
    print('文件大小: ${file.lengthSync()} 字节');
    
    // 关闭HTTP客户端
    httpClient.close();
    
    return randomFileName;
  } catch (e) {
    print('获取网络数据时发生错误: $e');
    rethrow;
  }
}

/// 生成随机.dart文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  
  // 生成10位随机字符作为文件名
  String randomString = List.generate(10, (index) => chars[random.nextInt(chars.length)]).join();
  
  return '${randomString}_data.dart';
}

/// 示例使用
void main() async {
  // 示例：获取JSONPlaceholder的API数据
  String url = 'https://jsonplaceholder.typicode.com/posts/1';
  
  try {
    String fileName = await fetchAndSaveNetworkDataWithHttpClient(url);
    print('完成！数据已保存到文件: $fileName');
    
    // 验证文件内容
    File file = File(fileName);
    if (await file.exists()) {
      print('文件存在，内容预览（前200个字符）:');
      String content = await file.readAsString();
      print(content.length > 200 ? '${content.substring(0, 200)}...' : content);
    }
  } catch (e) {
    print('程序执行失败: $e');
  }
}