import 'dart:io';
import 'dart:convert';
import 'dart:math';

Future<void> fetchAndSaveData(String url) async {
  try {
    // 1. 获取网络数据
    final client = HttpClient();
    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close();

    if (response.statusCode == 200) {
      final responseBody = await response.transform(utf8.decoder).join();
      print('Data fetched successfully.');

      // 2. 生成随机文件名
      const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
      final random = Random();
      final fileName = 'data_${String.fromCharCodes(Iterable.generate(8, (_) => chars.codeUnitAt(random.nextInt(chars.length))))}.dart';

      // 3. 保存数据到文件
      final file = File(fileName);
      await file.writeAsString(responseBody);
      print('Data saved to $fileName');
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }

    client.close();
  } catch (e) {
    print('An error occurred: $e');
  }
}
