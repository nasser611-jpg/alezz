import 'package:api_test/data/services/services_subject.dart';
import 'package:api_test/model/task_model.dart';
import 'package:api_test/presentation/screens/content_screen.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late List<Task> tasks;

  @override
  void initState() {
    super.initState();
    fetchData();
    tasks = [];
  }

  Future<void> fetchData() async {
    try {
      final fetchedTasks = await TaskApiService.fetchTasks();
      setState(() {
        tasks = fetchedTasks;
      });
    } catch (error) {
      print('Error fetching tasks: $error');
    }
  }

  Widget taskCard({required Task task}) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(task.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: task.tasks.map((subTask) {
            return Text(subTask.taskContent);
          }).toList(),
        ),
        onTap: () {
          print(task.id);
          // Navigate to SubTaskScreen with the subject ID
          Navigator.push(
            context,
            MaterialPageRoute(
              
              builder: (context) => SubTaskScreen(subjectId: task.id),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
        actions: [
          IconButton(
            onPressed: () async {
              await TaskApiService.addTask('working');
              fetchData(); // Refresh the task list after adding a new task
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              // You can remove this IconButton since the onTap of ListTile is handling navigation now
            },
            icon: const Icon(Icons.screenshot),
          )
        ],
      ),
      body: tasks.isNotEmpty
          ? ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return taskCard(task: tasks[index]);
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
