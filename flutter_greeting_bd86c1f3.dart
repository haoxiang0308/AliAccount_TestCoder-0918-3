import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  final String greeting;

  const GreetingWidget({Key? key, this.greeting = 'Hello, Flutter!'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Greeting App'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.waving_hand,
              size: 80,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              greeting,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Greeting',
      home: GreetingWidget(),
    ),
  );
}
