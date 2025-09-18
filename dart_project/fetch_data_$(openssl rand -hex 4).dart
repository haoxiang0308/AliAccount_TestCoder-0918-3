import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchData(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON.
    return jsonDecode(response.body);
  } else {
    // If the server returns an unsuccessful status code, throw an exception.
    throw Exception('Failed to load data: ${response.statusCode}');
  }
}

// Example usage
void main() async {
  try {
    final data = await fetchData('https://jsonplaceholder.typicode.com/posts/1');
    print(data);
  } catch (error) {
    print('Error: $error');
  }
}