import 'package:flutter/material.dart';
import 'package:mylist_app/prayDetail.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

class PrayList extends StatefulWidget {
  const PrayList({super.key, required this.title});
  final String title;

  @override
  State<PrayList> createState() => _PrayListState();
}

class _PrayListState extends State<PrayList> {
  /*
  final TextEditingController _textFieldController = TextEditingController();
  List<Map<String, dynamic>> _dataList = [];

  // 데이터베이스 초기화 및 데이터 로딩
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // 데이터베이스 초기화
  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();0
    final path = join(dbPath, 'example.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE example(id INTEGER PRIMARY KEY, name TEXT)',
        );
      },
    );
  }

  // 데이터 로딩
  Future<void> _loadData() async {
    final db = await _initDB();
    final dataList = await db.query('example');
    setState(() {
      _dataList = dataList;
    });
  }

  // 데이터 추가
  Future<void> _addData(String name) async {
    final db = await _initDB();
    await db.insert(
      'example',
      {
        'name': name,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    _textFieldController.clear();
    _loadData();
  }

  // 데이터 수정
  Future<void> _editData(int id, String name) async {
    final db = await _initDB();
    await db.update(
      'example',
      {
        'name': name,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
    _loadData();
  }

  // 데이터 삭제
  Future<void> _deleteData(int id) async {
    final db = await _initDB();
    await db.delete(
      'example',
      where: 'id = ?',
      whereArgs: [id],
    );
    _loadData();
  }
*/
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
        title: const Text('${listName} 삭제'),
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
