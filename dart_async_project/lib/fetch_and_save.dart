import 'dart:io';
import 'dart:convert';
import 'dart:math';

/// 模拟一个异步函数，获取网络数据并将其保存到一个随机命名的.dart文件中。
/// 由于环境中可能没有Dart SDK，此函数使用dart:io模拟网络请求。
Future<void> fetchAndSaveData() async {
  print('Fetching data...');

  // 模拟网络延迟
  await Future.delayed(Duration(seconds: 1));

  // 模拟从网络获取的数据
  final jsonData = {
    'message': 'Hello from the simulated network!',
    'timestamp': DateTime.now().toIso8601String(),
    'randomNumber': Random().nextInt(1000),
  };

  print('Data fetched successfully: ${jsonData.toString()}');

  // 生成随机文件名
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = Random.secure();
  String randomFileName = 'random_output_';
  for (int i = 0; i < 8; i++) {
    randomFileName += chars[random.nextInt(chars.length)];
  }
  randomFileName += '.dart';

  print('Saving data to file: $randomFileName');

  // 将数据写入文件
  final file = File('$randomFileName');
  await file.writeAsString(
    '// Generated file: $randomFileName\n\n'
    'const Map<String, dynamic> networkData = ${jsonEncode(jsonData)};\n',
  );

  print('Data saved successfully to $randomFileName.');
}

void main() async {
  await fetchAndSaveData();
}