import 'dart:convert';
import 'dart:io';
import 'dart:math';

/// Fetches data from a given URL and saves it to a randomly named .dart file.
Future<void> fetchDataAndSave(String url) async {
  try {
    print('Fetching data from $url...');
    // Simulate an HTTP GET request using HttpClient.
    // In a real project, you would typically use the 'http' package.
    final client = HttpClient();
    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close();

    if (response.statusCode == 200) {
      final responseBody = await response.transform(utf8.decoder).join();
      print('Data fetched successfully. Length: ${responseBody.length}');

      // Generate a random filename
      const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
      final random = Random();
      final randomName = List.generate(10, (index) => chars[random.nextInt(chars.length)]).join();
      final fileName = '${randomName}_data.dart';

      // Write the fetched data to the randomly named file
      final file = File('/workspace/dart_async_project/$fileName');
      await file.writeAsString(responseBody);
      print('Data saved to $fileName');

    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}

void main() async {
  // Example usage: Fetch data from a public API
  await fetchDataAndSave('https://httpbin.org/json');
}