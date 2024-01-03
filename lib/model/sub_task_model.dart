

class AddSubtaskRequest {

  String taskContent;
  bool isCheched;
  int subject;

  AddSubtaskRequest({
 
    required this.taskContent,
    required this.isCheched,
    required this.subject,
  });

  factory AddSubtaskRequest.fromJson(Map<String, dynamic> json) {
    return AddSubtaskRequest(
   
      taskContent: json['taskContent'],
      isCheched: json['isCheched'],
      subject: json['subject'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
   
      'taskContent': taskContent,
      'isCheched': isCheched,
      'subject': subject,
    };
  }
}
