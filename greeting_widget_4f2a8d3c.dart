import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  final String greeting;

  const GreetingWidget({Key? key, required this.greeting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Greeting App'),
      ),
      body: Center(
        child: Text(
          greeting,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}