import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: FirstScreen(),
  ));
}

// アプリ起動時に表示されるFirstScreenウィジェット
class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _number = 0; // ❶

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FirstScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'number = $_number',
            ),
            ElevatedButton(
              onPressed: () async {
                final newNumber = await Navigator.of(context).push<int>(
                  MaterialPageRoute(
                    builder: (_) => SecondScreen(number: _number), // ❸
                  ),
                );
                setState(() {
                  if (newNumber != null) {
                    _number = newNumber; // ❹
                  }
                });
              }, // ❷
              child: const Text('Secondへ'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, required this.number}); // ❺

  final int number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IncrementScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Increment'),
              onPressed: () {
                Navigator.of(context).pop(number + 1); // ❻
              },
            ),
            ElevatedButton(
              child: const Text('Decrement'),
              onPressed: () {
                Navigator.of(context).pop(number - 1); // ❼
              },
            ),
          ],
        ),
      ),
    );
  }
}