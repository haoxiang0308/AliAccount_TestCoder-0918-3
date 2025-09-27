import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> main() async {
  print('Fetching data from JSONPlaceholder...');

  try {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('Fetched data: $data');

      // Generate a random filename
      final random = DateTime.now().millisecondsSinceEpoch;
      final filename = 'fetched_data_$random.dart';

      // Write the data to the file
      final file = File(filename);
      await file.writeAsString('''
// This file was auto-generated
// Data fetched at: ${DateTime.now()}
const fetchedData = r\'''
$data
\''';
''');

      print('Data saved to $filename');
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
