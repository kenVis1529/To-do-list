import 'package:to_do_list/models/task.dart';

class Tasks {
  List<Task> taskList = [
    Task(id: "1", title: "Homework", isDone: false),
    Task(id: "2", title: "Walk with dog", isDone: false),
    Task(id: "3", title: "Write some code", isDone: false),
    Task(id: "4", title: "Have lunch", isDone: false),
    Task(id: "5", title: "Deadline with GSC", isDone: false),
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
  void edit(Task task, String content) {
    task.title = content;
  }
}
