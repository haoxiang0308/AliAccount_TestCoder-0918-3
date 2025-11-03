import 'dart:io';
import 'dart:math';
import 'dart:convert';

void main() {
  // Create a Map to store grades
  Map<String, double> grades = {
    'Mathematics': 8.5,
    'Science': 9.0,
    'English': 7.8,
    'History': 8.2,
    'Art': 9.5,
    'Physical Education': 8.7,
  };

  // Generate a random file name
  String randomFileName = generateRandomFileName();
  
  // Save the grades map to the file
  saveGradesToFile(grades, randomFileName);
  
  print('Grades have been saved to file: $randomFileName');
  print('Grades stored:');
  grades.forEach((subject, grade) {
    print('  $subject: $grade');
  });
}

String generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  
  // Generate a random string of 10 characters
  String randomString = String.fromCharCodes(
    Iterable.generate(10, (_) => chars.codeUnitAt(random.nextInt(chars.length)))
  );
  
  // Add .json extension to make it a proper file
  return '${randomString}_grades.json';
}

void saveGradesToFile(Map<String, double> grades, String fileName) {
  // Convert the map to JSON string
  String jsonString = jsonEncode(grades);
  
  // Write the JSON string to the file
  File(fileName).writeAsStringSync(jsonString);
}