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
