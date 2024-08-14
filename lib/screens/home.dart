import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/service/todo_service.dart';
import '../header.dart';
import 'package:todo_app/todoitem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TodoService todoService = TodoService();

    //List<String> todo = ["Study Lessons", "Run 5k", "Go to party"];
    //List<String> completed = ["Do homework", "Dye your hair", "Make breakfast"];
    List<Task> todo = [
      Task(
          type: Tasktype.note,
          title: "Study lessons",
          description: "Study Flutter",
          isCompleted: false),
      Task(
          type: Tasktype.calender,
          title: "Run 5k",
          description: "Run 5 kilometers",
          isCompleted: false),
      Task(
          type: Tasktype.contest,
          title: "Drink water",
          description: "Stay hydrated",
          isCompleted: false),
    ];
    // ignore: unused_local_variable
    List<Task> completed = [
      Task(
          type: Tasktype.note,
          title: "Dye your hair",
          description: "Dye your hair ginger",
          isCompleted: false),
      Task(
          type: Tasktype.calender,
          title: "Make breakfast",
          description: "Eat some cereal",
          isCompleted: false),
    ];

    void addNewTask(Task newTask) {
      setState(() {
        todo.add(newTask);
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(children: [
            //Header
            const Header(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: SingleChildScrollView(
                    child: FutureBuilder(
                        future: todoService.getUncompletedTodos(),
                        builder: (context, snapshot) {
                          // ignore: avoid_print
                          print(snapshot.data);
                          if (snapshot.data == null) {
                            return const CircularProgressIndicator();
                          } else {
                            return ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return TodoItem(task: snapshot.data![index]);
                              },
                            );
                          }
                        })),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Completed",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: SingleChildScrollView(
                    child: FutureBuilder(
                        future: todoService.getCompletedTodos(),
                        builder: (context, snapshot) {
                          // ignore: avoid_print
                          print(snapshot.data);
                          if (snapshot.data == null) {
                            return const CircularProgressIndicator();
                          } else {
                            return ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return TodoItem(task: snapshot.data![index]);
                              },
                            );
                          }
                        })),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor(myGreen)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddNewTaskScreen(
                      addNewTask: (newTask) => addNewTask(newTask),
                    ),
                  ));
                },
                child: const Text(
                  "Add New Task",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
          ]),
        ),
      ),
    );
  }
}
