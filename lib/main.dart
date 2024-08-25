import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red).copyWith(surface: Colors.blueGrey),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.w800,
          ),
        ),
        useMaterial3: true,
        extensions: const [MyTheme(themeColor: Color(0xFF0000FF))],
      ),

      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.dark,
        extensions: const [MyTheme(themeColor: Color(0xFFFF0000))],
      ),

      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

 */
class MyApp extends StatefulWidget { const MyApp({super.key});
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> { bool _isDarkMode = false;
void _toggleDarkMode() { setState(() {
  _isDarkMode = !_isDarkMode; });
}
@override
Widget build(BuildContext context) {
  return MaterialApp( title: 'Flutter Demo', theme: ThemeData(
    colorSchemeSeed: Colors.green,
    extensions: const [MyTheme(themeColor: Color(0xFF0000FF))], ),
    darkTheme: ThemeData(
      colorSchemeSeed: Colors.green,
      brightness: Brightness.dark,
      extensions: const [MyTheme(themeColor: Color(0xFFFF0000))],
    ),
    themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light, home: Scaffold(
      body: const Center( child: ThemedWidget(),
      ),
      floatingActionButton: FloatingActionButton( onPressed: () {
        _toggleDarkMode(); },
        child: const Icon(Icons.settings_brightness), ),
    ), );
} }


//アプリ独自のテーマを管理する方法としてTheme Extensionがあります。
class MyTheme extends ThemeExtension<MyTheme> {
  const MyTheme({
    required this.themeColor,
  });

  final Color? themeColor;

  @override
  MyTheme copyWith({Color? themeColor}) {
    return MyTheme(
      themeColor: themeColor ?? this.themeColor,
    );
  }

  @override
  MyTheme lerp(MyTheme? other, double t) {
    if (other is! MyTheme) {
      return this;
    }
    return MyTheme(
      themeColor: Color.lerp(themeColor, other.themeColor, t),
    );
  }
}

//MyTheme クラスのテーマを適用したウィジェットを実装します。 ThemedWidget という正方形を描画するウィジェットです。
class ThemedWidget extends StatelessWidget {
  const ThemedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context); // ❶
    final myTheme = themeData.extension<MyTheme>()!; // ❷
    final color = myTheme.themeColor;

    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
