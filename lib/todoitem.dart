import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';

import 'package:todo_app/model/todo.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.task});
  final Todo task;
  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.completed! ? Colors.white12 : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /*
            widget.task.type == Tasktype.note
                ? Image.asset("lib/assets/images/Category (3).png")
                : widget.task.type == Tasktype.contest
                    ? Image.asset("lib/assets/images/Category (5).png")
                    : Image.asset("lib/assets/images/Category (4).png"),
                    */
            Image.asset("lib/assets/images/Category (3).png"),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.todo!,
                    style: TextStyle(
                        decoration: widget.task.completed!
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("User: ${widget.task.userId!}"),
                ],
              ),
            ),
            Checkbox(
                activeColor: HexColor(myPink),
                value: isChecked,
                onChanged: (val) => {
                      setState(() {
                        widget.task.completed = !widget.task.completed!;
                        isChecked = val!;
                      })
                    }),
          ],
        ),
      ),
    );
  }
}
