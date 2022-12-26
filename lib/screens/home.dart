import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/models/tasks.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Tasks tasks = Tasks();
  String newTask = "";

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
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            ///
            /// Adding task bar
            ///
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (content) {
                        setState(() {
                          newTask = content;
                        });
                      },
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(0.0),
                          border: InputBorder
                              .none, // Loại bỏ thanh ngang của TextField
                          hintText: "Add a task",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        /// Nếu task khác rỗng thì có thể thêm task
                        if (newTask != "") {
                          setState(() {
                            tasks.add(Task(title: newTask, isDone: false));
                          });
                        }
                      },
                      child: const Icon(Icons.add))
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),

            ///
            /// To-do list heading
            ///
            const Text(
              "To-do List",
              style: TextStyle(fontSize: 30.0),
            ),

            ///
            /// Tasks list
            ///
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap:
                  true, // Sửa lỗi "Vertical viewport was given unbounded height"
              itemCount: tasks.taskList.length,
              itemBuilder: ((context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Checkbox(
                            value: tasks.taskList[index].isDone,
                            onChanged: (value) {
                              setState(() {
                                tasks.taskList[index].isDone =
                                    !tasks.taskList[index].isDone;
                              });
                              log(tasks.taskList[index].isDone.toString());
                            },
                            activeColor: Colors.green,
                            checkColor: Colors.white,
                          ),
                          title: Text(tasks.taskList[index].title),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    tasks.delete(tasks.taskList[index]);
                                  });
                                },
                              ),
                            ],
                          ),
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
