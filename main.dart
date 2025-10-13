import 'fetch_data.dart';

void main() async {
  // 调用我们定义的异步函数
  await fetchAndSaveData('https://httpbin.org/json');
}
