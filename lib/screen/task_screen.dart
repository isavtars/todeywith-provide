import 'package:flutter/material.dart';
import '../models/task_data.dart';
import '../widget/task_list.dart';
import 'bootsheet_screen.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, left: 20, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius: 43.0,
                      child: Icon(
                        Icons.list,
                        size: 42.0,
                        color: Colors.black,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Todoey",
                    style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text("${Provider.of<TaskData>(context).taskCount} tasks",
                      style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 218, 208, 213))),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 29, 52, 80),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),
                  padding: const EdgeInsets.all(20),
                  child: TaskList()),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 0.88,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 248, 6, 6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: const Addtotask(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
