import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:math';

/// Generates a random Dart file name with a .dart extension.
/// The name is based on a random string, ensuring uniqueness.
String generateRandomFileName() {
  final random = Random();
  final randomString = List<int>.generate(16, (i) => random.nextInt(256)).join();
  final hash = sha256.convert(utf8.encode(randomString));
  return '${hash.toString().substring(0, 16)}.dart';
}

/// Fetches data from a given URL asynchronously.
/// 
/// This function performs an HTTP GET request to the specified [url].
/// It expects a JSON response and returns the decoded data as a Map<String, dynamic>.
/// If the request fails or the response is not valid JSON, it throws an exception.
Future<Map<String, dynamic>> fetchData(String url) async {
  try {
    final httpClient = HttpClient();
    final request = await httpClient.getUrl(Uri.parse(url));
    final response = await request.close();

    if (response.statusCode == HttpStatus.ok) {
      final responseBody = await response.transform(utf8.decoder).join();
      final jsonData = jsonDecode(responseBody);
      if (jsonData is Map<String, dynamic>) {
        return jsonData;
      } else {
        throw Exception('Response JSON is not a Map<String, dynamic>');
      }
    } else {
      throw Exception('Failed to load data: HTTP ${response.statusCode}');
    }
  } on SocketException {
    throw Exception('No internet connection or server unreachable.');
  } on FormatException {
    throw Exception('Failed to parse JSON response.');
  } catch (e) {
    throw Exception('An unexpected error occurred: $e');
  }
}

/// Saves the provided data to a file with a randomly generated name.
/// 
/// This function generates a unique file name, converts the [data] to a 
/// formatted JSON string, and writes it to the file. It prints the path 
/// of the created file upon success.
Future<void> saveDataToFile(Map<String, dynamic> data) async {
  final fileName = generateRandomFileName();
  final filePath = '/workspace/dart_project/$fileName';
  final jsonString = JsonEncoder.withIndent('  ').convert(data);
  await File(filePath).writeAsString(jsonString);
  print('Data saved to $filePath');
}

/// Main function to orchestrate the fetch and save process.
/// 
/// It defines the target URL, calls [fetchData] to get the data,
/// and then calls [saveDataToFile] to persist it.
Future<void> main() async {
  final url = 'https://jsonplaceholder.typicode.com/posts/1';

  try {
    print('Fetching data from $url...');
    final data = await fetchData(url);
    print('Data fetched successfully.');
    await saveDataToFile(data);
  } catch (err) {
    print('Error: $err');
  }
}