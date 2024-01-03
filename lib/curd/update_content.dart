
import 'package:flutter/material.dart';

import '../data/services/update_service.dart';
import '../model/task_model.dart';
class UpdateContent extends StatelessWidget {
  final SubTask subtask;

  // final Task task;
  // final Task task;
  const UpdateContent({required this.subtask,   } );

  void showUpdateContentDialog(
      BuildContext context, int subtaskId, String currentContent) {
    TextEditingController contentController =
        TextEditingController(text: currentContent);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Content'),
          content: TextField(
            controller: contentController,
            onChanged: (value) {
              // You can update the content in real-time if needed
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Call the updateContent method with the updated content
                final updatedContent = contentController.text;
                SubtaskApiEditionService.updateContent(subtaskId, updatedContent);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    throw UnimplementedError();
  }
  

}
