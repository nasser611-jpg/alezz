import 'dart:convert';

import 'package:api_test/model/task_model.dart';
import 'package:http/http.dart' as http;


class TaskApiService {
  static Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse('http://idexpro-001-site3.ctempurl.com/api/Subjects'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((task) => Task.fromJson(task)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<void> addTask(String taskName) async {
    await http.post(
      Uri.parse('http://idexpro-001-site3.ctempurl.com/api/Subjects'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'name': taskName, 'tasks': []}),
    );
  }
}