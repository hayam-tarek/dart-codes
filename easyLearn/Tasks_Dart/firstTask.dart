main() {
  /**
   * Q1
   */
  String helloDart = 'Hello DART';
  print('$helloDart \n');
  /**
   * Q2
   */
  int num1 = 5;
  int num2 = 8;
  print('first variables is $num1 and second variables is $num2 \n');
  /**
   * Q3
   */
  double celsius = 25;
  double fahrenheit = celsius * 1.8 + 32;
  print('${celsius}°C is ${fahrenheit}°F');
  fahrenheit = 86;
  celsius = (fahrenheit - 32) / 1.8;
  print('${fahrenheit}°F is ${celsius}°C \n');
  /**
   * Q4
   */
  int birthYear = 1999;
  int futureYear = 2024;
  print('I will be ${futureYear - birthYear} in $futureYear \n');
  /**
   * Q5
   */
  num number1 = 15;
  num number2 = 5;
  print('$number1 + $number2 = ${number1 + number2}');
  print('$number1 - $number2 = ${number1 - number2}');
  print('$number1 * $number2 = ${number1 * number2}');
  print('$number1 / $number2 = ${number1 / number2}');
}
