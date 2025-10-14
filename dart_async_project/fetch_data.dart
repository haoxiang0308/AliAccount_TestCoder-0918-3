/// A sample Dart function to fetch data asynchronously.
/// Since the Dart SDK is not available in this environment, this file is created as specified,
/// but cannot be executed here.
import 'dart:convert';
import 'dart:io';
import 'dart:math';

/// Simulates fetching data from an API.
Future<String> fetchDataFromApi() async {
  // In a real application, you would use an HTTP client like `package:http`.
  // For simulation, we return a mock JSON response after a delay.
  await Future.delayed(const Duration(seconds: 1));
  final mockData = {
    'userId': 1,
    'id': 1,
    'title': 'delectus aut autem',
    'completed': false,
  };
  return jsonEncode(mockData);
}

/// The main asynchronous function that fetches data and saves it to a file.
Future<void> main() async {
  print('Fetching data...');
  try {
    final data = await fetchDataFromApi();
    print('Data fetched successfully: $data');

    // Generate a random filename
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    final randomString = Iterable.generate(8, (_) => chars[random.nextInt(chars.length)]).join();
    final fileName = '${randomString}_data.dart';

    // Write the data to the file
    final file = File(fileName);
    await file.writeAsString(data);
    print('Data saved to $fileName');

  } catch (e) {
    print('An error occurred: $e');
  }
}