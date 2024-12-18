import 'animal.dart';

class Cat extends Animal {
  Cat() : super(name: 'cat', age: 1);
  @override
  bool vegetarian() {
    return true;
  }
}
