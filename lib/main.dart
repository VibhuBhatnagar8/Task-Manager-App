import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class TaskItem {
  String title;
  bool isCompleted;
  TaskItem({required this.title, this.isCompleted = false});
}
class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}
class _TaskScreenState extends State<TaskScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<TaskItem> _tasks = [];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 251, 215),
        appBar: AppBar(
          backgroundColor: Colors.amberAccent ,
          title: const Text('Task Manager'),
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
            
          ),
          
          ),
        body: Center(
          child: Column(
            children: [const Text("\n Add a Task",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )
            ,),
            const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter task name',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),),
            ),
          ),
          const SizedBox(height: 20),
                 FloatingActionButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                setState(() {
                  _tasks.add(TaskItem(title: _controller.text));
                  _controller.clear();
                });
                }
            },
            backgroundColor: Colors.amberAccent,
            child: const Icon(Icons.add),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: task.isCompleted ? Colors.green : Colors.white,
                      foregroundColor: task.isCompleted ? Colors.white : Colors.black87,
                    ),
                    onPressed: () {
                      setState(() {
                        task.isCompleted = !task.isCompleted;
                      });
                    },
                    child: Text(task.title),
                  ),
                );
              },
            ),
          ),
        ], // Closes the Column's children list
      ), 
          )  // Closes the Column widget
    );     // Closes the Scaffold widget
  }        // Closes the build method
}          // Closes the _TaskScreenState class
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskScreen(),
    );
  }
}