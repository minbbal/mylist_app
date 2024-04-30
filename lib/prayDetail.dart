// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PrayDetail extends StatefulWidget {
  final String title;
  const PrayDetail({super.key, required this.title});

  @override
  State<PrayDetail> createState() => _PrayDetailState();
}

class _PrayDetailState extends State<PrayDetail> {
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
                children: <Widget>[]),
          ],
        ),
      ),
    );
  }
}
