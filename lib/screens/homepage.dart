import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/taskpage.dart';
import 'package:flutter_todo/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    child: ListView(children: const [
                      TaskCardWidget(
                          title: '오늘 할 일을 작성해보세요.',
                          desc:
                              "안녕하세요 사용자님! 투두앱을 사용해주셔서 감사합니다. 이것은 할일의 세부사항을 적는 곳입니다."),
                      TaskCardWidget(title: '1', desc: "2"),
                      TaskCardWidget(title: '1', desc: "2"),
                      TaskCardWidget(title: '1', desc: "2"),
                      TaskCardWidget(title: '1', desc: "2"),
                      TaskCardWidget(title: '1', desc: "2"),
                    ]),
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
                        MaterialPageRoute(
                            builder: (context) => const TaskPage()));
                  },
                  child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: const Color(0xFF7349FE),
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
