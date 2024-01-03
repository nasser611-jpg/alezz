import 'dart:convert';

import 'package:api_test/model/task_model.dart';
import 'package:http/http.dart' as http;

import '../../model/sub_task_model.dart';

class SubTaskApiService {
  static List<SubTask> _subtasks = []; // List to store fetched subtasks

  static Future<List<SubTask>> fetchSubtasks(int subjectId) async {
    final response = await http.get(
      Uri.parse('http://idexpro-001-site3.ctempurl.com/api/Todo'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      // Filter subtasks based on the condition (e.g., subject ID)
      _subtasks = data
          .where((subtask) => subtask['subject'] == subjectId)
          .map((subtask) => SubTask.fromJson(subtask))
          .toList();

      return _subtasks;
    } else {
      throw Exception('Failed to load subtasks');
    }
  }

  static Future<void> addSubtask(AddSubtaskRequest addSubtaskRequest) async {
    await http.post(
      Uri.parse('http://idexpro-001-site3.ctempurl.com/api/Todo'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(addSubtaskRequest.toJson()),
    );
  }

  static Future<void> deleteSubtask(int subtaskId) async {
    await http.delete(
      Uri.parse('http://idexpro-001-site3.ctempurl.com/api/Todo/$subtaskId'),
    );
  }
}
