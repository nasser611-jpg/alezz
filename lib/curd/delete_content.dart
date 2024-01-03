import 'package:http/http.dart'as http;

class SubtaskApiDeletion {
  static Future<void> deleteSubtask(int subtaskId) async {
    final response = await http.delete(
      Uri.parse('http://idexpro-001-site3.ctempurl.com/api/Todo/$subtaskId'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 204) {
      print('Subtask deleted successfully');
    } else if (response.statusCode == 404) {
      print('Subtask not found. Status code: ${response.statusCode}');
    } else {
      print('Failed to delete subtask. Status code: ${response.statusCode}');
    }
  }
}
