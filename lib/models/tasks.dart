import 'package:to_do_list/models/task.dart';

class Tasks {
  List<Task> taskList = [
    Task(title: "Homework", isDone: false),
    Task(title: "Walk with dog", isDone: false),
    Task(title: "Write some code", isDone: false),
    Task(title: "Have lunch", isDone: false),
    Task(title: "Deadline with GSC", isDone: false),
  ];

  // Thêm
  void add(Task task) {
    taskList.add(task);
  }

  // Xóa
  void delete(Task task) {
    taskList.remove(task);
  }

  // Sửa

}
