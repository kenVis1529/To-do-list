import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Task> tasks = [
    Task(title: "Homework", isDone: false),
    Task(title: "Walk with dog", isDone: false),
    Task(title: "Write some code", isDone: false),
    Task(title: "Have lunch", isDone: false),
    Task(title: "Deadline with GSC", isDone: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: const Text("To-do list"),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),

        /// TODO: Tạo một thanh điền chữ để thêm task, thêm nút xóa task, và thêm chức năng có thể khôi phục task
        child: Column(
          children: [
            ListView.builder(
              itemCount: tasks.length,
              itemBuilder: ((context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CheckboxListTile(
                          title: Text(tasks[index].title),
                          value: tasks[index].isDone,
                          onChanged: (value) async {
                            setState(() {
                              tasks[index].isDone = !tasks[index].isDone;
                              // if (tasks[index].isDone) {
                              //   tasks.remove(tasks[index]);
                              // }
                            });
                          },
                          checkColor: Colors.white,
                          activeColor: Colors.green,
                        ),
                      ],
                    ));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
