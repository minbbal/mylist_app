import 'package:flutter/material.dart';
import 'package:mylist_app/prayList.dart';
import 'package:mylist_app/prayDetail.dart';

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
      home: PrayList(title: 'Pray List '),
      routes: <String, WidgetBuilder>{
        '/PrayList': (BuildContext context) => PrayList(title: 'PrayList'),
        '/PrayDetail': (BuildContext context) =>
            PrayDetail(title: 'PrayDetail'),
      },
    );
  }
}
