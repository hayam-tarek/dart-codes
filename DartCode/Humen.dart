class Human {
  String? _name;
  String? _hairColor; //_ is a private data
  double? _height;
  double? _weight;
  int? _age;

  Humen() {}

  Human(String name,
      [int age = 20,
      double height = 150,
      double weight = 50,
      String hairColor = 'black']) {
    this._name = name;
    this._age = age;
    this._height = height;
    this._weight = weight;
    this._hairColor = hairColor;
  }

  //eassir
  //Human(this._name,this._age,this._height,this._weight); //بس طبعا كله مطلوب مش اوبشنال

  String? getName() {
    return this._name;
  }

  void setHairColor(String hairColor) {
    this._hairColor = hairColor;
  }

  String? getHairColor() {
    return this._hairColor;
  }

  void setHeight(double height) {
    if (height >= 100 && height <= 200) {
      this._height = height;
    } else {
      print("Invalid Height");
    }
  }

  double? getHeight() {
    return this._height;
  }

  void setweight(double weight) {
    if (weight >= 40 && weight <= 120) {
      this._weight = weight;
    } else {
      print("Invalid weight");
    }
  }

  double? getWeight() {
    return this._weight;
  }

  void description() {
    print(
        "Name: $_name, age: $_age, height: $_height, weight: $_weight, Hair: $_hairColor");
  }

  //شكل تاني للستر
  void setAge(int age) => this._age = age;

  //شكل تاني للستر
  set age(int age) => this._age = age;

  //شكل تاني للجيتر
  int? getAge() => this._age; // without return

  //شكل تاني للجيتر
  //int? get age => this._age; //بس لازم اغير اسمها عشان كده نفس اسم السيت
}
