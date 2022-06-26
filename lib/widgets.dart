import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String title;
  final String desc;

  const TaskCardWidget({Key? key, required this.title, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 24,
      ),
      margin: const EdgeInsets.only(
        bottom: 20,
      ),

      // color 속성과 decoration 속성은 동시에 가질 수 없기 때문에 항상 decoration 속성 안쪽에 넣도록 해야한다
      // BoxDecoration 은 Container 위젯 크기의 박스형태를 만들어준다.
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            // ?? 는 앞에 title 변수가 null 일 경우를 의미한다.
            title ?? "(Unnamed Task)",
            style: const TextStyle(
              color: Color(0xFF211551),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              desc ?? "No Description Added",
              style: const TextStyle(
                  fontSize: 16, color: Color(0xFF868290), height: 1.5),
            ),
          )
        ],
      ),
    );
  }
}

class TodoWidget extends StatelessWidget {
  final String text;
  final bool isDone;

  const TodoWidget({Key? key, required this.text, required this.isDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(children: [
        Container(
          width: 20,
          height: 20,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              color: isDone ? const Color(0xFF7349FE) : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: isDone
                  ? null
                  : Border.all(color: const Color(0xFF86829D), width: 1.5)),
          child: const Image(image: AssetImage("assets/images/check_icon.png")),
        ),
        Text(
          text ?? '할일이 없습니까?',
          style: TextStyle(
              color: isDone ? const Color(0xFF211551) : const Color(0xFF86829D),
              fontSize: 16,
              fontWeight: isDone ? FontWeight.bold : FontWeight.w500),
        )
      ]),
    );
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
