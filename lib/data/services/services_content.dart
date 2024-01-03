import 'dart:convert';

import 'package:api_test/curd/add_content.dart';
import 'package:api_test/model/task_model.dart';
import 'package:http/http.dart' as http;

class SubTaskApiService {
  static Future<List<SubTask>> fetchSubtasks(int subjectId) async {
   
    final response = await http.get(
      Uri.parse('http://idexpro-001-site3.ctempurl.com/api/Todo?subject=$subjectId'),
      
    );

    if (response.statusCode == 200) { 
      print('in Servicess$subjectId');
      List<dynamic> data = json.decode(response.body);
      return data.map((subtask) => SubTask.fromJson(subtask)).toList();
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
        Uri.parse('http://idexpro-001-site3.ctempurl.com/api/Todo/$subtaskId'));
  }
}
