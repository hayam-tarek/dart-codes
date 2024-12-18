abstract class Animal {
  String? name;
  int? age;
  Animal({required this.name, required this.age});
  void eat() {
    print("${this.name} is eating");
  }

  bool vegetarian(); //abstract method
}
