import 'Humen.dart';

class Teacher extends Human {
  String? subject;
  Teacher(super.name, this.subject);
  @override
  void description() {
    super.description();
    print('I teach $subject');
  }
}
