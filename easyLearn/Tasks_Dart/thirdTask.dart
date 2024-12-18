import 'dart:math';
import 'dart:io';

void main(List<String> args) {
  /**
   * Q9
   */
  Random random = Random();
  int randomNumber = random.nextInt(100) + 1;
  int input;
  int count = 0;
  do {
    stdout.write('Guess a number between 1 and 100! ');
    input = int.parse(stdin.readLineSync()!);
    if (input > randomNumber) {
      stdout.write('too high.\n');
      count++;
    } else if (input < randomNumber) {
      stdout.write('too low.\n');
      count++;
    } else {
      stdout.write('exactly right.\n');
      count++;
      stdout.write('you tried $count times.\n');
      break;
    }
  } while (input != randomNumber);
  /**
   * Q10
   */
  stdout.write('Enter a number! ');
  int number = int.parse(stdin.readLineSync()!);
  stdout.write('$number is ${isPrime(number) ? 'prime.\n' : 'not prime.\n'}');
  /**
   * Q11
   */
  stdout.write('Enter the length of the list! ');
  int n = int.parse(stdin.readLineSync()!);
  List<num> list = [];
  stdout.write('Enter the elements of the list! ');
  for (int i = 0; i < n; i++) {
    num element = int.parse(stdin.readLineSync()!);
    list.add(element);
  }
  stdout.write(firstAndLastElements(list));
}

bool isPrime(int number) {
  if (number == 0 || number == 1) {
    return false;
  } else {
    for (var i = 2; i <= sqrt(number).round(); i++) {
      if ((number % i) == 0) {
        return false;
      }
    }
    return true;
  }
}

List<num> firstAndLastElements(List<num> list) => [list.first, list.last];
