// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '🙏Pray List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFCA311)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pray List '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String strCounter = '';
  List<bool> is_finish = [false, true];

  void _incrementCounter() {
    setState(() {
      _counter++;
      strCounter = _counter.toString();
    });
  }

  void _checkUpdate(int i) {
    setState(() {
      is_finish[i] = !is_finish[i];
    });
    // print(is_finish);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0xFFFCA311),
        title: Text(
          widget.title,
          style: const TextStyle(
              color: Color(0xFF141414), fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    color: Color(0xFFFFFFFF),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: IconButton(
                              onPressed: () {
                                _checkUpdate(0);
                              },
                              icon: is_finish[0]
                                  ? Icon(Icons.check_box_outlined)
                                  : Icon(
                                      Icons.check_box_outline_blank_outlined)),
                          title: Text(
                            'FIRST',
                            style: TextStyle(
                                color: Color(0xFF14213D),
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            'first pray start 2024.04.10',
                            style: TextStyle(color: Color(0xFF14213D)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              child: const Text('EDIT'),
                              onPressed: _test,
                            ),
                            SizedBox(width: 8),
                            TextButton(
                              child: const Text('DELETE'),
                              onPressed: _test,
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Color(0xFFFFFFFF),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: IconButton(
                              onPressed: () {
                                _checkUpdate(1);
                              },
                              icon: is_finish[1]
                                  ? Icon(Icons.check_box_outlined)
                                  : Icon(
                                      Icons.check_box_outline_blank_outlined)),
                          title: Text(
                            'SECOND',
                            style: TextStyle(
                                color: Color(0xFF14213D),
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            'second pray start 2024.04.10',
                            style: TextStyle(color: Color(0xFF14213D)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              child: const Text('EDIT'),
                              onPressed: _test,
                            ),
                            SizedBox(width: 8),
                            TextButton(
                              child: const Text('DELETE'),
                              onPressed: _test,
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Add List',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

void _test() {
  print('t');
}
