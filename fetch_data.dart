import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> fetchAndSaveData() async {
  try {
    // 获取网络数据
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    
    if (response.statusCode == 200) {
      // 解析JSON数据
      final Map<String, dynamic> data = jsonDecode(response.body);
      
      // 生成随机文件名
      final String fileName = 'data_${DateTime.now().millisecondsSinceEpoch}.dart';
      
      // 将数据写入文件
      final file = File(fileName);
      await file.writeAsString('''
// Auto-generated file
const Map<String, dynamic> networkData = ${jsonEncode(data)};
''');
      
      print('数据已保存到 $fileName');
    } else {
      print('请求失败: ${response.statusCode}');
    }
  } catch (e) {
    print('发生错误: $e');
  }
}