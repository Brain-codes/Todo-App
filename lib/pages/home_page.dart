// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/pages/profile_page.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/side_nav.dart';
import 'package:todo_app/util/side_nav_item.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //REFERENCE THE HIVE BOX
  final _myBox = Hive.box('myBox');
  TodoDataBase db = TodoDataBase();
  var userData = {};

  //TEXT CONTROLLER
  final _controller = TextEditingController();

  //GET USERDATA FROM DATABASE
  void getUserDb() {
    db.getUserData();
    userData = db.gottenUserData;
  }

  @override
  void initState() {
    //FIRST TIME EVER OPENING THE APP
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
      getUserDb();
    } else {
      //THERE ALREADY EXIST DATA
      db.loadData();
      getUserDb();
    }

    super.initState();
  }

  // CHECKBOX WAS TAPPED
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  //SAVE NEW TASK
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateDataBase();
    Navigator.of(context).pop();
  }

  //CREATE A NEW TASK
  void createNewTask() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      backgroundColor: Color(0xFF250b5a),
      builder: ((context) {
        return SizedBox(
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              DialogBox(
                controller: _controller,
                onCancel: () => Navigator.of(context).pop(),
                onSave: saveNewTask,
              )
            ],
          ),
        );
      }),
    );
  }

  //DELETE TASK
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  var navItem = [
    ['images/home.png', 'Dashboard'],
    ['images/signal.png', 'Analytics'],
    ['images/message.png', 'Messages'],
    ['images/collection.png', 'Collection'],
    ['images/user.png', 'Users'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF050A18),
      drawer: Drawer(
        child: SideNav(
          userData: [userData],
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.dashboard),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(
                        userData: [userData],
                      ),
                    ),
                  );
                },
                child: Icon(Icons.person)),
          ),
        ],
        centerTitle: true,
        title: Text(
          'T O D O - L I S T',
          style: GoogleFonts.bebasNeue(
            fontSize: 27,
          ),
        ),
        elevation: 0,
        backgroundColor: Color(0xFF050A18),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF250b5a),
        onPressed: createNewTask,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: db.toDoList.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You currently don\'t have any todos at the moment',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Lottie.network(
                      'https://assets3.lottiefiles.com/packages/lf20_z4cshyhf.json'),
                ],
              ),
            )
          : ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  taskName: db.toDoList[index][0],
                  taskCompleted: db.toDoList[index][1],
                  deleteFunction: (context) => deleteTask(index),
                  onChanged: (value) => checkBoxChanged(value, index),
                );
              },
            ),
    );
  }
}
