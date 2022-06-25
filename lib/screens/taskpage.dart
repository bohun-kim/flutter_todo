import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 6),
            child: Column(
              children: [
                Row(
                  children: [
                    // Image(image: AssetImage("assets/images/back_arrow_icon.png"))
                    // 버튼 클릭시 클릭이 됐다는 표시 (잉크가 젖듯)
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                          padding: EdgeInsets.all(24),
                          child: Icon(
                            Icons.arrow_back,
                            size: 30,
                          )),
                    ),
                    const Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          hintText: "할 일을 적어보세요!", border: InputBorder.none),
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF211551),
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
          const TextField(
            decoration: InputDecoration(
                hintText: "Enter Description for the task...",
                border: InputBorder.none,
                //content 는 TextField 의 내용물이며 contentPadding 은 내용물 제외한 나머지 영역의 padding
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 24,
                )),
          )
        ]),
      ),
    );
  }
}
