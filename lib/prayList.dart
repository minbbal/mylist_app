import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mylist_app/prayDetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayList extends StatefulWidget {
  const PrayList({super.key, required this.title});
  final String title;

  @override
  State<PrayList> createState() => _PrayListState();
}

class _PrayListState extends State<PrayList> {
  // shared preference 인스턴스 생성
  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();
  late Future<int> _prefs_count;

  // 플로팅 액션 버튼 클릭 이벤트
  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    // counter 값이 존재하지 않으면 0으로 저장
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    // 앱의 상태 변경, 클릭시 카운트 +1
    setState(() {
      _prefs_count = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }

  // 상태 위젯 초기화
  @override
  void initState() {
    super.initState();
    _prefs_count =
        _prefs.then((SharedPreferences prefs) => prefs.getInt('counter') ?? 0);
  }

  String strCounter = '';
  List<bool> is_finish = [false, true];

  void _checkUpdate(int i) {
    setState(() {
      is_finish[i] = !is_finish[i];
    });
    // print(is_finish);
  }

  void _test(String title, bool isDel) {
    if (isDel) {
      _showDialog(title);
    } else {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PrayDetail(
                title: '${title}',
              )));
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(
      //         builder: (context) => const PrayList(
      //               title: 'main',
      //             )),
      //     (route) => false);
    }
  }

  Future<Future<String?>> _showDialog(String listName) async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('${listName} 삭제'), // const 사용시 오류
        content: const Text('리스트를 삭제하시겠습니까?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('아니오'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('네'),
          ),
        ],
      ),
    );
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
                              onPressed: () {
                                _test('FIRST', false);
                              },
                            ),
                            SizedBox(width: 8),
                            TextButton(
                              child: const Text('DELETE'),
                              onPressed: () {
                                _test('FIRST', true);
                              },
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
                              onPressed: () {
                                _test('SECOND', false);
                              },
                            ),
                            SizedBox(width: 8),
                            TextButton(
                              child: const Text('DELETE'),
                              onPressed: () {
                                _test('SECOND', true);
                              },
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Card(
                      child: FutureBuilder<int>(
                    future: _prefs_count,
                    // AsyncSnapshot : 완료, 오류, 결과 등의 상태 정보 포함
                    builder:
                        (BuildContext context, AsyncSnapshot<int> snapshot) {
                      // 값을 받아오지 못할 경우
                      if (snapshot.connectionState != ConnectionState.done) {
                        return const CircularProgressIndicator();
                      }
                      // 에러 발생할 경우
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      // 값을 정상적으로 받아올 경우
                      else {
                        return Text(
                          'Button tapped ${snapshot.data} time${snapshot.data == 1 ? '' : 's'}.\n\n'
                          'This should persist across restarts.',
                        );
                      }
                    },
                  ))
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
