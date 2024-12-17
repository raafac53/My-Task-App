import 'package:flutter/widgets.dart';

class Taskaprovider extends ChangeNotifier {
  List<Taskmodel> tasklist=[
  Taskmodel(title: "Task1", date: "20/4/2024 11:25am", finished: false),
  Taskmodel(title: "Task2", date: "20/4/2024 11:25am", finished: true),
  Taskmodel(title: "Task3", date: "20/4/2024 11:25am", finished: false),
  Taskmodel(title: "Task4", date: "20/4/2024 11:25am", finished: true),



  

]; 
void add(Taskmodel taskmodel){
  tasklist.add(taskmodel);
  notifyListeners();
}
void remove(int index){
  tasklist.removeAt(index);
  notifyListeners();
}

}
class Taskmodel{
  String title;
  String date;
  bool finished;
  Taskmodel({required this.title,required this.date,required this.finished});

}

