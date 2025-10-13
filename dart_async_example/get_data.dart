import 'dart:io';
import 'dart:convert';
import 'dart:math';

Future<void> fetchAndSaveData() async {
  final url = 'https://httpbin.org/json'; // A public API for testing
  final client = HttpClient();

  try {
    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close();

    if (response.statusCode == 200) {
      final responseBody = await response.transform(utf8.decoder).join();
      final jsonData = responseBody; // Temporarily use raw body to see full response

      // Generate a random filename
      const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
      final random = Random();
      final randomName = 'data_${List.generate(8, (index) => chars[random.nextInt(chars.length)]).join()}.dart';

      // Create the content for the new file
      final fileContent = '''
// Data fetched from $url
// Generated on ${DateTime.now()}

final Map<String, dynamic> fetchedData = $jsonData;

void printData() {
  print('Fetched Data: \$fetchedData');
}
''';

      // Write the content to the new file
      final file = File(randomName);
      await file.writeAsString(fileContent);

      print('Data fetched and saved to \$randomName');
    } else {
      print('Failed to load data. Status code: \${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: \$e');
  } finally {
    client.close();
  }
}

void main() async {
  await fetchAndSaveData();
}