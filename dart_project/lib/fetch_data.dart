import 'dart:convert';
import 'package:http/http.dart' as http;

/// An asynchronous function to fetch data from a URL and print it.
/// In a real scenario, you would save this to a file.
Future<void> fetchDataAndSave() async {
  const String url = 'https://jsonplaceholder.typicode.com/posts/1';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      print('Data fetched: $data');

      // Here you would typically write the `data` or `response.body` to a file.
      // For example, using `dart:io`:
      // import 'dart:io';
      // final file = File('path/to/your/file.json');
      // await file.writeAsString(response.body);

      print('Data would be saved to a file in a real execution environment.');
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}

void main() async {
  await fetchDataAndSave();
}