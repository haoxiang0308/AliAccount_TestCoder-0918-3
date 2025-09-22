import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// Generates a random string of specified length.
String _generateRandomName(int length) {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  Random rnd = Random();
  return String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
}

/// Fetches data from a URL and saves it to a file with a random name.
Future<void> fetchAndSaveData(String url) async {
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Generate a random file name
      String fileName = 'data_${_generateRandomName(8)}.json';
      File file = File(fileName);

      // Write the response body to the file
      await file.writeAsString(response.body);
      print('Data fetched successfully and saved to $fileName');
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}

// Example usage
void main() async {
  String url = 'https://jsonplaceholder.typicode.com/posts/1';
  await fetchAndSaveData(url);
}