import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  List toDoList = [];

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
}
