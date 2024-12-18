import 'Cat.dart';
import 'Circle.dart';
import 'Humen.dart';
import 'Lion.dart';
import 'animal.dart';
import 'student.dart';
import 'teacher.dart';

void main(List<String> args) {
  Human hayam = Human('hayam');
  hayam.setAge(24);
  hayam.description();
  Human abdullah = Human('abdullah', 27, 170, 70, 'yellow');
  abdullah.description();

  Student haya = Student('haya', 1827119);
  haya.description();

  Teacher ahmed = Teacher('ahmed', 'math');
  ahmed.setAge(30);
  ahmed.setHeight(180);
  ahmed.setweight(80);
  ahmed.description();

  List<Human> list = [haya, ahmed, hayam, abdullah]; //polymorphism
  for (var item in list) {
    print('${item.getName()} , ${item}');
  }
  print('\n');
  Animal cat = Cat();
  Animal lion = Lion();
  List<Animal> ani = [cat, lion];
  for (var element in ani) {
    element.eat();
    print('vegetarian ${element.vegetarian()}');
  }

  Circle c1 = Circle(rad: 5, x: -11, y: -11);
  Circle c2 = Circle.origin(rad: 6);
  print('c1 area : ${c1.area()} , c2 area : ${c2.area()}\n');
}
