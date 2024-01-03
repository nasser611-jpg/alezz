class Task {
  int id;
  String name;
  List<SubTask> tasks;

  Task({
    required this.id,
    required this.name,
    required this.tasks,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'],
      tasks: List<SubTask>.from(
          (json['tasks'] as List<dynamic>).map((task) => SubTask.fromJson(task))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'tasks': tasks.map((task) => task.toJson()).toList(),
    };
  }
}


class SubTask {
  int id;
  String taskContent;
  bool isCheched;
  int subject;

  SubTask({
    required this.id,
    required this.taskContent,
    required this.isCheched,
    required this.subject,
  });

  factory SubTask.fromJson(Map<String, dynamic> json) {
    return SubTask(
      id: json['id'],
      taskContent: json['taskContent'],
      isCheched: json['isCheched'],
      subject: json['subject'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskContent': taskContent,
      'isCheched': isCheched,
      'subject': subject,
    };
  }
}
