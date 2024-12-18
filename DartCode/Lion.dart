import 'animal.dart';

class Lion extends Animal {
  Lion() : super(name: 'lion', age: 1);
  @override
  bool vegetarian() {
    return false;
  }
}
