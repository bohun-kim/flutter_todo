import 'package:flutter/material.dart';
import 'package:flutter_todo/database_helper.dart';
import 'package:flutter_todo/screens/taskpage.dart';
import 'package:flutter_todo/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          // symmetric : 수직,수평 으로 패딩 설정 가능
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          // 배경색을 칠해줌
          color: const Color(0xFFF6F6F6),
          // Stack 위젯은 child 들을 중복 가능하게 배치할 수 있다.
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 32, top: 32),
                      child: const Image(
                          image: AssetImage('assets/images/logo.png'))),
                  // 영역을 설정해주지 않고 ListView 만을 이용하면 렌더링이 되지않기 때문에 Expanded 위젯이 있어야한다.
                  // TaskCardWidget 위젯 클래스를 호출할 때 생성자를 호출하여 title 변수에 값을 할당할 수 있도록한다.
                  Expanded(
                    child: FutureBuilder(
                      initialData: [],
                      //future 인자값은 FutureBuilder 가 현재 연결할 비동기 함수
                      future: _dbHelper.getTask(),
                      // snapshot 인자값은 특정 시점에 데이터를 복사해서 보관한다.
                      builder: (context, AsyncSnapshot snapshot) {
                        return ScrollConfiguration(
                          behavior: NoGlowBehaviour(),
                          child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return TaskCardWidget(
                                    title: snapshot.data[index].title,
                                    desc: 'desc');
                              }),
                        );
                      },
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 24,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TaskPage()),
                    ).then((value) {
                      setState() {}
                    });
                  },
                  child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Color(0xFF7349FE), Color(0xFF643FDB)],
                              begin: Alignment(0, -1),
                              end: Alignment(0, 1)),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Image(
                          image: AssetImage("assets/images/add_icon.png"))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
