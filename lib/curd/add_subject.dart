import 'dart:convert';

import 'package:http/http.dart' as http;

class AddTaskRequest {

  String name;

  AddTaskRequest({
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'tasks': [], // Assuming tasks should be an empty array for a new task
    };
  }



static  Future<void> addTask(String taskName) async {
    final addTaskRequest = AddTaskRequest(name: taskName);
    final response = await http.post(
      Uri.parse('http://idexpro-001-site3.ctempurl.com/api/Subjects?name=$taskName'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(addTaskRequest.toJson()),
    );
 if (response.statusCode == 400) {
  print('Bad request. Server response: ${response.body}');
} else {
  print('Failed to add task. Status code: ${response.statusCode}');
}
    if (response.statusCode == 201) {
      print('Task added successfully');
    } else {
      print('Failed to add task. Status code: ${response.statusCode}');

    }
  }
}
