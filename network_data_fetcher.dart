import 'dart:convert';
import 'dart:io';
import 'dart:math';

/// 获取网络数据并保存到随机命名的.dart文件中的异步函数
Future<String> fetchAndSaveNetworkData(String url, {String? directory}) async {
  try {
    // 创建HttpClient实例
    HttpClient client = HttpClient();
    
    // 发起GET请求，添加User-Agent头
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    request.headers.set('User-Agent', 'Dart HttpClient');
    HttpClientResponse response = await request.close();
    
    // 检查响应状态
    if (response.statusCode != 200) {
      client.close();
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
    
    // 读取响应数据
    String responseBody = await response.transform(utf8.decoder).join();
    client.close();
    
    // 生成随机文件名
    String randomFileName = _generateRandomFileName();
    String fileExtension = '.dart';
    String fileName = '${randomFileName}${fileExtension}';
    
    // 确定保存目录
    String saveDirectory = directory ?? Directory.current.path;
    
    // 创建完整文件路径
    String filePath = '$saveDirectory/$fileName';
    
    // 创建文件并写入数据
    File file = File(filePath);
    await file.writeAsString(responseBody);
    
    print('网络数据已成功保存到: $filePath');
    return filePath;
  } catch (e) {
    print('获取或保存网络数据时出错: $e');
    rethrow;
  }
}

/// 生成随机文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  StringBuffer buffer = StringBuffer();
  
  // 生成10位随机字符作为文件名
  for (int i = 0; i < 10; i++) {
    buffer.write(chars[random.nextInt(chars.length)]);
  }
  
  return 'data_${buffer.toString()}';
}

/// 主函数示例
void main() async {
  try {
    // 示例：获取HTTPBin API的数据并保存
    String url = 'https://httpbin.org/json';
    String savedFilePath = await fetchAndSaveNetworkData(url);
    print('文件保存路径: $savedFilePath');
  } catch (e) {
    print('执行过程中出现错误: $e');
  }
}