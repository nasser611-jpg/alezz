
import 'package:api_test/curd/update_content.dart';
import 'package:api_test/data/services/services_content.dart';
import 'package:api_test/model/task_model.dart';
import 'package:flutter/material.dart';

import '../../model/sub_task_model.dart';

class SubTaskScreen extends StatefulWidget {
  final int subjectId;
  const SubTaskScreen({Key? key, required this.subjectId,}) : super(key: key);

  @override
  _SubTaskScreenState createState() => _SubTaskScreenState(subjectId: subjectId);
}

class _SubTaskScreenState extends State<SubTaskScreen> {
  final int subjectId;
  late List<SubTask> subtasks;

  _SubTaskScreenState({required this.subjectId});

  @override
  void initState() {
    super.initState();
    fetchData();
    subtasks = [];
  }

  Future<void> fetchData() async {
    try {
      final fetchedSubtasks = await SubTaskApiService.fetchSubtasks(widget.subjectId);
      setState(() {
        subtasks = fetchedSubtasks;
      });
    } catch (error) {
      print('Error fetching subtasks: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SubTask List'),
      ),
      body: subtasks.isNotEmpty
          ? ListView.builder(
              itemCount: subtasks.length,
              itemBuilder: (context, index) {
                return SubTaskCard(subtask: subtasks[index]);
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          SubTaskApiService.addSubtask(AddSubtaskRequest(
            taskContent: 'add from app',
            isCheched: false,
            subject: subjectId,

          ));
          fetchData(); // Refresh the subtask list after adding a new subtask
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SubTaskCard extends StatelessWidget {
  final SubTask subtask;

  const SubTaskCard({Key? key, required this.subtask}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(subtask.taskContent),
        subtitle: Text('Is Checked: ${subtask.isCheched}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                UpdateContent(subtask: subtask).showUpdateContentDialog(
                  context, subtask.id, subtask.taskContent);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                SubTaskApiService.deleteSubtask(subtask.id);
                // Optionally, you can refresh the subtask list after deletion
                // fetchData();
              },
            ),
          ],
        ),
      ),
    );
  }
}

