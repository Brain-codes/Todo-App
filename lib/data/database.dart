import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/user_object.dart';

class TodoDataBase {
  List toDoList = [];
  Map gottenUserData = {};

  //REFERENCE THE BOX
  final _myBox = Hive.box('myBox');

  //METHOD TO RUN IF ITS THE FIST TIME THE APP IS BEING OPENED
  void createInitialData() {
    toDoList = [
      ['Welcome to Todo', false],
      ['Swipe right', false],
    ];
  }

  //LOAD THE DATA FROM DATABASE
  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  //UPDATE DATABASE
  void updateDataBase() {
    _myBox.put('TODOLIST', toDoList);
  }

  //ONCE UNBOARDING PAGE HAS BEEN DONE DATABASE
  void onBoardingDone() {
    _myBox.put('ONBOARDING', true);
  }

  //GET IF USER HAS CLICKED DONE IN ONBOARDING PAGE
  void onBoardingCheck() {
    toDoList = _myBox.get('ONBOARDING');
  }

  //CREATING A USER DATA
  void creatingUser(Map userData) {
    _myBox.put('USERDATA', userData);
  }

  void getUserData() {
  gottenUserData =   _myBox.get('USERDATA');
  }
}
