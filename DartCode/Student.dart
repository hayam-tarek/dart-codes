import 'Humen.dart';

class Student extends Human {
  int? _studentId;

  // Student(String name, int id) : super(name) { //شكل تاني له
  //   this._studentId = id;
  // }
  // Student(String name, this._studentId) : super(name); //شكل تاني له
  Student(super.name, this._studentId); //شكل تاني له

  void setId(int id) => this._studentId = id;

  int? getID() => this._studentId;

  @override
  void description() {
    super.description();
    print("I am a student and my id is $_studentId");
  }
}
