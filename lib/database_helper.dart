import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'models/task.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      // getDatabasesPath() : 기본 데이터베이스 위치(android:data/data/<package_name>/databases, ios: Documents 디렉토리)를 가져온다.
      // 'todo.db' 는 데이터베이스의 이름
      join(await getDatabasesPath(), 'todo.db'),
      // onCreate : 데이터베이스가 처음 생성될 때, task 클래스를 저장하기 위한 테이블 생성.
      onCreate: (db, version) {
        // 데이터베이스에 CREATE TABLE 수행
        return db.execute(
          "CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT)",
        );
      },
      version: 1,
    );
  }

  // 데이터베이스에 task 추가하는 함수.
  // 1. taskpage.dart 에서 insertTask 를 사용하는데
  // 2. 먼저 새로운 변수에 textField 값이 task.dart 의 멤버변수에 먼저 저장이 되고,
  // 3. 새로운 변수 newTask 를 insertTask(newTask) 인자값으로 들어가면
  // 4. 지금 여기에서 db.insert 에 의해 변수 값이 들어가게 된다.
  Future<void> insertTask(Task task) async {
    Database db = await database();

    // task 를 테이블에 추가한다. 동일한 task 가 두번 추가될 경우를 대비하기 위해 conflictAlgorithm 을 명시한다.
    await db.insert('tasks', task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // getTask 메서드는 현재 데이터베이스 테이블의 모든 task 를 얻는 메서드
  Future<List<Task>> getTask() async {
    Database db = await database();
    List<Map<String, dynamic>> taskMap = await db.query('tasks');

    return List.generate(taskMap.length, (index) {
      return Task(
          id: taskMap[index]['id'],
          title: taskMap[index]['title'],
          description: taskMap[index]['description']);
    });
  }
}
