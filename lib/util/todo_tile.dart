// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade700,
              borderRadius: BorderRadius.circular(0),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: 24,
            bottom: 24,
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
              color: Color(0xFF250b5a), borderRadius: BorderRadius.circular(0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,

            // ignore: prefer_const_literals_to_create_immutables
            children: [
              //CHECKBOX
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Color(0xFF9655f8),
              ),

              //TASK NAME
              Expanded(
                child: Text(
                  taskName,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
