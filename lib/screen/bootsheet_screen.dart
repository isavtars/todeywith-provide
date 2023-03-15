import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemangementinflutter/models/task_data.dart';

class Addtotask extends StatefulWidget {
  const Addtotask({
    super.key,
  });

  @override
  State<Addtotask> createState() => _AddtotaskState();
}

class _AddtotaskState extends State<Addtotask> {
  final _text = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    String? newTextValue;

    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 228, 223, 223),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 23, 30, 34),
              maxRadius: 42.0,
              child: Icon(
                Icons.list,
                size: 42.0,
                color: Color.fromARGB(255, 253, 252, 252),
              )),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Todoey",
            style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue),
          ),
          const SizedBox(
            height: 10.2,
          ),
          const Text(
            "ADD Task",
            style: TextStyle(
                fontSize: 23,
                color: Color.fromARGB(255, 79, 97, 112),
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10.2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _text,
              onEditingComplete: () {},
              onChanged: (value) {
                newTextValue = value;
              },
              textAlign: TextAlign.center,
              autofocus: true,
              decoration: InputDecoration(
                  hintText: "add task..",
                  errorText: _validate ? " value cannot be empty" : null,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21.0))),
            ),
          ),
          SizedBox(
            height: 60,
            width: 340,
            child: ElevatedButton(
                onPressed: () {
                  _text.text.isNotEmpty
                      ? {
                          Provider.of<TaskData>(context, listen: false)
                              .addnewTask(newTextValue ?? ""),
                          Navigator.pop(context)
                        }
                      : _validate = true;
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
                child: const Text(
                  "Add",
                  style: TextStyle(fontSize: 20.0),
                )),
          ),
          const Spacer(),
        ]),
      ),
    );
  }
}
