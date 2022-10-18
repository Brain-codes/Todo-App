// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

import 'my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        // color: Color(0xFF250b5a),
        // backgroundColor: Color(0xFF250b5a),

        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //GET USER INPUT
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new task',
                ),
              ),

              //BUTTON TO SAVE ---- CANCEL

              Column(
                children: [
                  //SAVE BUTTON
                  MyButton(
                    text: 'Save',
                    onPressed: onSave,
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //CANCEL BUTTON
                  MyButton(
                    text: 'Cancel',
                    onPressed: onCancel,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
