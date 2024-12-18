/**
 * Dart doesn't support multiple inheitance, so mixins are the solution for it
 * we cannot inherit from a mixin
 * Mixins can't be instantiated
 * you can restrict a mixin’s use by using the on keyword to specify the required superclass
 * we can use many mixins for a single class ,
 * mixins can be abstract
 */
class Animals {
  bool canBrath = true;
  String? name;
  Animals(this.name) {}
}

mixin Mammal {
  walk() {
    print('can walk');
  }
}
mixin Reptile on Animals {
  craw() {
    print("crawling");
  }
}

class Dog extends Animals with Mammal {
  Dog(super.name);
}

class Snake extends Animals with Reptile {
  Snake(super.name);
}

void main(List<String> args) {
  Dog dog = Dog('dog');
  Snake snake = Snake('snake');
  print('${dog.name}');
  dog.walk();
  print('${snake.name}');
  snake.craw();
}
