import 'dart:convert';
import 'dart:io';
import 'dart:math';

/// 异步函数：从给定的URL获取JSON数据，并将其保存到一个随机命名的.dart文件中。
Future<void> fetchAndSaveData(String url) async {
  try {
    print('正在从 $url 获取数据...');
    // 在真实的Dart环境中，这里会使用 http 包
    // final response = await http.get(Uri.parse(url));
    // if (response.statusCode == 200) {
    //   final data = jsonDecode(response.body);
    // } else {
    //   throw Exception('获取数据失败: ${response.statusCode}');
    // }

    // 为了演示，我们模拟获取的数据
    final data = {'message': '这是一个模拟的网络请求响应', 'status': 'success', 'timestamp': DateTime.now().millisecondsSinceEpoch};

    print('数据获取成功，准备保存...');
    final jsonString = JsonEncoder.withIndent('  ').convert(data);

    // 生成随机文件名
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    final fileName = 'output_${String.fromCharCodes(Iterable.generate(8, (_) => chars.codeUnitAt(random.nextInt(chars.length))))}.dart';

    // 创建文件内容字符串
    final fileContent = '''
// 文件: $fileName
// 生成时间: ${DateTime.now().toIso8601String()}

/// 从网络获取的数据
const networkData = r\'''
$jsonString
\''';

void main() {
  print("数据已保存到: \$fileName");
  print("内容如下:");
  print(networkData);
}
''';

    final file = File(fileName);
    await file.writeAsString(fileContent);

    print('数据已成功保存到文件: $fileName');
  } catch (e) {
    print('发生错误: $e');
  }
}

void main() async {
  // 调用异步函数
  await fetchAndSaveData('https://api.example.com/data');
}