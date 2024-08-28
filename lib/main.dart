import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => FirstScreen(),
      '/second': (context) => const SecondScreen(),
      '/second/third': (context) => const ThirdScreen(),
    },
  ));
}

// アプリ起動時に表示されるFirstScreenウィジェット
class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

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
            ElevatedButton(
              child: const Text('FirstからSecondへ'),
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
                // Second画面へ遷移する処理を実装
              },
            ),
            ElevatedButton(
              child: const Text('FirstからThirdへ'),
              onPressed: () {
                Navigator.of(context).pushNamed('/second/third');
                // Third画面へ遷移する処理を実装
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

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
              child: const Text('SecondからThirdへ'), onPressed: () {
              Navigator.of(context).pushNamed('/second/third');
            },
            ), ElevatedButton(
              child: const Text('戻る'), onPressed: () {
              Navigator.of(context).pop(); },
            ),
          ],
        ),
      ),
    );
  }
}

// 画面遷移先として用意したThirdScreenウィジェット
class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ThirdScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('戻る'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}