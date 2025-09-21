import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  final String greeting;

  const GreetingWidget({super.key, required this.greeting});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Greeting App'),
        ),
        body: Center(
          child: Text(
            greeting,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}