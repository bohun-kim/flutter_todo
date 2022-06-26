import 'package:flutter/material.dart';
import 'package:flutter_todo/database_helper.dart';
import 'package:flutter_todo/screens/homepage.dart';
import 'package:flutter_todo/widgets.dart';
import 'package:flutter_todo/models/task.dart';

import '../models/task.dart';

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
        child: Container(
          child: Stack(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                          Expanded(
                              child: TextField(
                            // onSubmitted 인자 value 는 TextField 의 값을 입력하면 그 값이 value 에 저장된다.
                            onSubmitted: (value) async{
                              if (value != "") {
                                DatabaseHelper dbHelper = DatabaseHelper();

                                Task newTask = Task(title: value);

                                await dbHelper.insertTask(newTask);
                                
                                print("새로운 할 일이 생성됐습니다.");
                              }
                            },

                            decoration: const InputDecoration(
                                hintText: "할 일을 적어보세요!",
                                border: InputBorder.none),
                            style: const TextStyle(
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
                const Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter Description for the task...",
                        border: InputBorder.none,
                        //content 는 TextField 의 내용물이며 contentPadding 은 내용물 제외한 나머지 영역의 padding
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24,
                        )),
                  ),
                ),
                const TodoWidget(
                  text: '첫번째 할 일',
                  isDone: true,
                ),
                const TodoWidget(
                  text: '두번째 할 일',
                  isDone: false,
                ),
              ]),
              Positioned(
                bottom: 24,
                right: 24,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: const Color(0xfffe3577),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Image(
                          image: AssetImage("assets/images/delete_icon.png"))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
