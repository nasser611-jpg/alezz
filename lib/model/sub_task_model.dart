

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
