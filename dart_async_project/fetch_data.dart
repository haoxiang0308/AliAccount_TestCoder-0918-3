import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchDataAndSave() async {
  try {
    print('正在获取网络数据...');
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('数据获取成功，正在保存...');

      // 生成一个随机文件名
      final randomFileName = 'data_${DateTime.now().millisecondsSinceEpoch}.dart';

      final file = File('/workspace/dart_async_project/$randomFileName');
      await file.writeAsString('''
// 这个文件是通过 fetch_data.dart 生成的
// 生成时间: ${DateTime.now().toString()}
// 数据来源: https://jsonplaceholder.typicode.com/posts/1

final dynamicData = ${jsonEncode(data)};
''');

      print('数据已保存到 $randomFileName');
    } else {
      print('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('发生错误: $e');
  }
}

void main() async {
  await fetchDataAndSave();
}