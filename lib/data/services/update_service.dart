import 'dart:convert';

import 'package:http/http.dart' as http;

class SubtaskApiEditionService {
  static Future<void> updateContent(int subtaskId, String updatedContent,) async {
    final updateContentRequest = {
  "taskContent": updatedContent,

  "subject": 4
};

    try {
      final response = await http.put(
        Uri.parse('http://idexpro-001-site3.ctempurl.com/api/Todo'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(updateContentRequest),
      );

      if (response.statusCode == 200) {
        print('Content updated successfully');
      } else if (response.statusCode == 400) {
        print('Bad request. Server response: ${response.body}');
        throw Exception('Bad request. Server response: ${response.body}');
      } else {
        print('Failed to update content. Status code: ${response.statusCode}');
        throw Exception('Failed to update content. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error updating content: $error');
      throw error;
    }
  }
}
