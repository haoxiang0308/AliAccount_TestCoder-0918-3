import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

/// 异步获取网络数据并保存到随机命名的.dart文件中
Future<void> fetchAndSaveData() async {
  const String url = 'https://jsonplaceholder.typicode.com/posts/1';

  try {
    print('正在从 $url 获取数据...');
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('数据获取成功！');

      // 解析JSON数据
      final Map<String, dynamic> data = jsonDecode(response.body);

      // 生成随机文件名
      final String randomFileName = 'data_${DateTime.now().millisecondsSinceEpoch}.dart';

      // 准备要写入文件的内容
      final String fileContent = '''
// 文件由 Dart 异步函数自动生成
// 生成时间: ${DateTime.now()}
// 数据来源: $url

final Map<String, dynamic> networkData = $data;
''';

      // 写入文件
      final file = File(randomFileName);
      await file.writeAsString(fileContent);

      print('数据已保存到文件: ${file.absolute.path}');
    } else {
      print('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('发生错误: $e');
  }
}

void main() async {
  await fetchAndSaveData();
}