import 'dart:convert';

import 'package:http/http.dart' as http;
class AddSubtaskRequest {
  String taskContent;
  bool isCheched;
  int subject;

  AddSubtaskRequest({
    required this.taskContent,
    required this.isCheched,
    required this.subject,
  });

  Map<String, dynamic> toJson() {
    return {
      'taskContent': taskContent,
      'isCheched': isCheched,
      'subject': subject,
     
    };
  }
}

class SubtaskApi {
  static Future<void> addSubtask(AddSubtaskRequest subtask) async {
    final response = await http.post(
      Uri.parse('http://idexpro-001-site3.ctempurl.com/api/Todo'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(subtask.toJson()),
    );

    if (response.statusCode == 201) {
      print('Subtask added successfully');
    } else if (response.statusCode == 400) {
      print('Bad request. Server response: ${response.body}');
    } else {
      print('Failed to add subtask. Status code: ${response.statusCode}');
    }
  }
}
