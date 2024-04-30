// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'text pray title',
                        labelStyle: TextStyle(color: Color(0xFF14213D)),
                        hintStyle: TextStyle(color: Color(0xFF14213D)),
                        errorStyle: TextStyle(color: Color(0xFF14213D)),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'text pray detail',
                          labelStyle: TextStyle(color: Color(0xFF14213D)))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {}, child: Text('SAVE')),
                  TextButton(onPressed: () {}, child: Text('CANCEL')),
                ],
              )
            ]),
      ),
    );
  }
}
