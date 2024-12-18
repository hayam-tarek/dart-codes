extension on String {
  String get encoded {
    return _code(1);
  }

  String get decoded {
    return _code(-1);
  }

  String _code(int step) {
    final output = StringBuffer();
    for (final codePoint in runes) {
      output.writeCharCode(codePoint + step);
    }
    return output.toString();
  }
}

void main() {
  /**
   * print , strings ,
   */
  String name = 'hayam';
  int age = 24;
  print('hi $name');
  print('my age $age');
  String text1 = r'tab \t tab'; //raw stling ignore special character
  String text2 = 'tab \t tab';
  print(text1);
  print(text2);
  /**
   * num store int, double
   */
  num num1 = 4;
  num num2 = 4.5;
  print('num1: $num1 , num2: $num2');
  /**
   * boolean
   */
  bool flag = 1 > 0 ? true : false;
  /**
   * dynamic data type
   */
  dynamic canStoreAnyType = 'hayam';
  canStoreAnyType = 15;
  canStoreAnyType = true;
  /**
   * var
   */
  //var it is a keyword في الاول بتكون عامة بعدين بتتغير حسب اول قيمة اتحطت فيها
  var username = 'hayam tarek'; //username >> string
  var userage = 24; // userage >> int
  var varToDynamic; // لو مخزنتش في نفس السطر الفار هتتحول لديناميك
  varToDynamic = 'name';
  varToDynamic = 24;

  // at divition use var or double
  var result1 = 10 / 4;
  int result2 = 10 ~/ 4; // قرب لاصغر عدد صحيح
  print(result1);
  print(result2);
  /**
   * Lists []
   */
  //like an array
  List<String> students = ['hayam', 'hayam', 'abdallah', 'mohamed'];
  students.add('ahmed');
  print(students);
  /**
   * Sets {}
   */
  //sets have no repetition
  Set<int> id = {
    1827121,
    1827121,
    1827120,
    1827120,
    1827119,
    1827119,
  };
  print(id);
  /**
   * Maps {}
   */
  //maps is a collection of key/value يعني الاسترينج بالنسبالي هنا كاي او انديكس
  // <index , value>
  Map<String, num> ages = {
    'hayam': 23,
    'abdullah': 27,
    'mohamed': 26,
    'hayam': 24 //overwrite
  };
  ages['habiba'] = 22; //to add a new elements
  print(ages);
  /**
   * null safety
   */
  // any variable in dart is non-nullable by default
  int? number; // nullممكن يحمل ال
  print(number != null ? true : false);

  int? number1;
  print(number1);
  int res = number1 ?? 10; // put num1 in res, but if it is null put 10
  print(res);
  print(res.toDouble());
  print(number1?.toDouble()); // if num1 is null dont call the method
  /**
   * loops
   */
  //for in
  for (var stu in students) {
    print(stu);
  }
  print("\n");
  //for each
  students.forEach((var stu) {
    print(stu);
  });
  print("\n");

  printHelloName('hayam'); // 'hayam' is argument
  print(findPrice(30));
  print(findPrice(30, 50));
  print(findDivide(y: 4, x: 10));
  print(findDivide(x: 10));

  printHello();
  print(sumOfTwoNumbers(1, 2));

  /**
   * late keyword
   * عند تعريفه late لو متاكدة اني هحط قيمة للمتغير قبل استخدامه احط كلمة
   */
  late int z;
  late String zz;
  Genger genger = Genger.female;
  print(genger.name);

  print('abc'.encoded);
  print('abc'.encoded.decoded);
}

//##############################################################################

/**
 * functions
 */
//1- required parameter
void printHelloName(String name) {
  // name parameter
  print('hello $name');
}

//2- optional parameter with default value [] بحطهم بين
double findPrice(double price, [double discount = 0]) {
  return price - (price * discount) / 100;
}

//3- named parameter is also optional parameter  بحطهم بين {} وانده عليها باي ترتيب
//if we need to make a named parameter not optional use -required- keyword
double findDivide({required num x, num y = 1}) {
  return x / y;
}

/**
 * Arrow function
 * is used when only 1 statement wants to be excuted =>
 */
num sumOfTwoNumbers(num n1, num n2) => n1 + n2;
void printHello() => print('hello');

/**
 * Enums
 */
// mainبتتعرف خارج ال
enum Genger { male, female }
