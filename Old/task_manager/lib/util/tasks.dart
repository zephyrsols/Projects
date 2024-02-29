import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Tasks extends StatelessWidget {
  final String title;
  final String description;
  final String dueDate;
  final int color;
  final bool isCompleted;
  Function(BuildContext)? deleteFunction;
  Function(BuildContext)? completeFunction;

  Tasks(
      {super.key,
      required this.title,
      required this.description,
      required this.dueDate,
      required this.color,
      required this.isCompleted,
      required this.deleteFunction,
      required this.completeFunction
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: Slidable(
        startActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: completeFunction,
              backgroundColor: Colors.green,
              icon: Icons.incomplete_circle,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(color),
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff4530B3)),
              ),
              Text(
                description,
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Due on: $dueDate",
                style: TextStyle(fontSize: 12, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
