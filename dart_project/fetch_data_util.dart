import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:math';

/// 异步函数，用于从指定URL获取数据，并将其保存到一个随机命名的.dart文件中。
/// 文件名基于URL和当前时间戳的哈希值生成，确保唯一性。
/// 返回保存文件的绝对路径。
Future<String> fetchDataAndSave(String url) async {
  try {
    // 1. 发起HTTP GET请求
    final HttpClient client = HttpClient();
    final HttpClientRequest request = await client.getUrl(Uri.parse(url));
    final HttpClientResponse response = await request.close();

    // 2. 检查响应状态码
    if (response.statusCode == 200) {
      // 3. 读取响应内容
      final String responseBody = await response.transform(utf8.decoder).join();

      // 4. 生成随机文件名
      final Random random = Random();
      final int randomNumber = random.nextInt(1000000);
      final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final String fileNameSeed = '$url$timestamp$randomNumber';
      final String hashedFileName = sha256.convert(utf8.encode(fileNameSeed)).toString();
      final String fileName = 'data_$hashedFileName.dart';

      // 5. 定义文件路径
      final Directory currentDir = Directory.current;
      final String filePath = '${currentDir.path}/$fileName';

      // 6. 将数据写入文件
      await File(filePath).writeAsString(responseBody);

      // 7. 返回文件路径
      return filePath;
    } else {
      throw HttpException('Failed to load data: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    throw HttpException('Network error: $e');
  } catch (e) {
    throw Exception('An unexpected error occurred: $e');
  }
}