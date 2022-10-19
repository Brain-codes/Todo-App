// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, avoid_print, prefer_is_not_empty

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/data/user_object.dart';
import 'package:todo_app/pages/home_page.dart';
import 'dart:convert';
import '../data/database.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AccountEdit extends StatefulWidget {
  const AccountEdit({super.key});

  @override
  State<AccountEdit> createState() => _AccountEditState();
}

class _AccountEditState extends State<AccountEdit> {
  TodoDataBase db = TodoDataBase();

  //CONTROLLER FOR OUR FORM FIELD
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  var loading = false;
  var toContinue = false;
  var validated = false;

  var userData = {};

  //VALIDATION USER INPUT FIELDS

  void validateForm() {
    if (!_nameController.text.isEmpty) {
      setState(() {
        validated = true;
      });
    }
  }

  void setUserDetails() {
    validateForm();
    if (validated) {
      setState(() {
        loading = true;
      });
      userData = {
        'name': _nameController.text,
        'email': _emailController.text.trim(),
        'phone': _phoneController.text.trim(),
        'occupation': dropdownvalue,
        'dob':
            '${_dateTime.month.toString()} / ${_dateTime.day.toString()} / ${_dateTime.year.toString()}'
      };
      // userData = [
      //   [(_nameController.text)],
      //   [(_emailController.text.trim())],
      //   [(_phoneController.text.trim())],
      //   [(dropdownvalue)],
      //   [
      //     '${_dateTime.month.toString()} / ${_dateTime.day.toString()} / ${_dateTime.year.toString()}'
      //   ],
      // ];

      db.creatingUser(userData);
      db.getUserData();
      print(db.gottenUserData);
      Timer(Duration(seconds: 3), () {
        setState(() {
          loading = false;
          toContinue = true;
        });
      });
    } else {
      _emptyFieldDialog(context);
      print(dropdownvalue);
    }
  }

//DROPDOWN VALUE
  String? dropdownvalue;
  var items = [
    'Web Developer',
    'Photographer',
    'Content Writer',
    'Social Media Manager',
    'Content Creator',
  ];

  //DATE TIME VARIABLE
  DateTime _dateTime = DateTime.now();
  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1200),
            lastDate: DateTime(4000))
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF050A18),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Welcome to Todos!',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Input in your details to get started as soon as possible.',
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 170,
                      height: 170,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/sec.jpg'),
                        ),
                        color: Color(0xFF250b5a),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFF250b5a),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Select Avatar',
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 70,
                ),

                //FULLNAME INPUT FIELD
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF250b5a),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.person),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF250b5a),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(133, 255, 255, 255),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: InputBorder.none,
                      hintText: 'Full Name',
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                //EMAIL ADDRESS INPUT FIELD
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF250b5a),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.alternate_email_sharp),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF250b5a),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(133, 255, 255, 255),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: InputBorder.none,
                      hintText: 'Email Address',
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                //EMAIL ADDRESS INPUT FIELD
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF250b5a),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.phone),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF250b5a),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(133, 255, 255, 255),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: InputBorder.none,
                      hintText: 'Phone Number',
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                //DROPDOWN BUTTON
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(0, 255, 255, 255), width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(133, 255, 255, 255), width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Color(0xFF250b5a),
                    hintText: 'Occupation',
                  ),
                  dropdownColor: Color(0xFF250b5a),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),

                SizedBox(
                  height: 20,
                ),

                //DATE OF BIRTH

                GestureDetector(
                  onTap: _showDatePicker,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 22, horizontal: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF250b5a),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date of Birth - [ ${_dateTime.month.toString()} / ${_dateTime.day.toString()} / ${_dateTime.year.toString()} ]',
                          style: TextStyle(
                            color: Color.fromARGB(153, 255, 255, 255),
                            fontSize: 15,
                          ),
                        ),
                        Icon(
                          Icons.calendar_today_outlined,
                          color: Color.fromARGB(153, 255, 255, 255),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),

                toContinue
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 22, horizontal: 15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 11, 90, 19),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Continue',
                              style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: setUserDetails,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 22, horizontal: 15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 11, 90, 19),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: loading == true
                                ? LoadingAnimationWidget.discreteCircle(
                                    color: Colors.white,
                                    size: 25,
                                  )
                                : Text(
                                    'Submit',
                                    style: GoogleFonts.poppins(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),
                      ),

                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// EMPTY FIELD DIAGLOG
Future<void> _emptyFieldDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFF250b5a),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: Text(
              'Ok',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF250b5a),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
        title: Text(
          'User Details',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          'Please, fill out the appropriate input field so as to continue to the next step',
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.w300,
          ),
        ),
      );
    },
  );
}
