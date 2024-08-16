// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayDetail extends StatefulWidget {
  final String title;
  const PrayDetail({super.key, required this.title});

  @override
  State<PrayDetail> createState() => _PrayDetailState();
}

class _PrayDetailState extends State<PrayDetail> {
  // shared preference 인스턴스 생성
  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();
  late Future<List<String>> _prayTitle;
  late Future<List<String>> _prayDetail;

  // 플로팅 액션 버튼 클릭 이벤트
  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    // counter 값이 존재하지 않으면 0으로 저장
    final List<String> prayTitle = (prefs.getStringList('prayTitle') ?? [""]);
    final List<String> prayDetail =
        (prefs.getStringList('_prayDetail') ?? [""]);

    // 앱의 상태 변경, 클릭시 카운트 +1
    setState(() {
      _prayTitle =
          prefs.setStringList('prayTitle', prayTitle!).then((bool success) {
        return _prayTitle;
      });

      _prayDetail =
          prefs.setStringList('prayDetail', prayDetail!).then((bool success) {
        return _prayDetail;
      });
    });
  }

  // 상태 위젯 초기화
  @override
  void initState() {
    super.initState();
    _prayTitle = _prefs.then(
        (SharedPreferences prefs) => prefs.getStringList('prayTitle') ?? [""]);
    _prayDetail = _prefs.then(
        (SharedPreferences prefs) => prefs.getStringList('prayDetail') ?? [""]);
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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
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
              ),
              Expanded(
                flex: 10,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                    child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            // labelText: 'text pray detail',
                            hintText: 'text pray detail',
                            labelStyle: TextStyle(color: Color(0xFF14213D)),
                            hintStyle: TextStyle(color: Color(0xFF14213D)),
                            errorStyle: TextStyle(color: Color(0xFF14213D)),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none)),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {}, child: Text('SAVE')),
                    TextButton(onPressed: () {}, child: Text('CANCEL')),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
