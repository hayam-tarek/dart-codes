import 'dart:io';

void main(List<String> args) {
  /**
   * Q1
   */
  print('Enter your name!');
  String? name = stdin.readLineSync();
  print('Hi $name enter your age! ');
  int age = int.parse(stdin.readLineSync()!);
  print('After ${100 - age} years, you will be 100 years old.\n');
  /**
   * Q2
   */
  print('Enter a number ');
  int number = int.parse(stdin.readLineSync()!);
  print('$number is ${number % 2 == 0 ? 'even.' : 'odd.'}\n');
  /**
   * Q3
   */
  List<int> listOfumbers = [];
  List<int> listOf5s = [];
  print('Enter 10 numbers! ');
  for (int i = 0; i < 10; i++) {
    listOfumbers.add(int.parse(stdin.readLineSync()!));
    if (listOfumbers[i] < 5) {
      listOf5s.add(listOfumbers[i]);
    }
  }
  print('Your list is $listOfumbers.');
  print('The elements of the list that are less than 5 is $listOf5s.\n');
  /**
   * Q4
   */
  print('Enter a number! ');
  int num = int.parse(stdin.readLineSync()!);
  List<int> divisor = [];
  for (int i = 2; i < num; i++) {
    if (num % i == 0) {
      divisor.add(i);
    }
  }
  print('The divisors of $num are $divisor.\n');
  /**
   * Q5
   */
  List<int> a = [1, 1, 2, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  List<int> b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 150, 160, 34, 1, 2];
  List<int> maxList = [];
  List<int> minList = [];
  if (a.length > b.length) {
    maxList = a;
    minList = b;
  } else {
    maxList = b;
    minList = a;
  }
  Set<int> commonElements = {};
  for (int i = 0; i < minList.length; i++) {
    if (maxList.contains(minList[i])) {
      commonElements.add(minList[i]);
    }
  }
  print('List 1 is $a.');
  print('List 2 is $b.');
  print('the elements that are common between them $commonElements.\n');
  /**
   * Q6
   */
  print('Enter a String! ');
  String? str = stdin.readLineSync();
  String reversedStr = str!.split('').reversed.join('');
  print('$str is ${str == reversedStr ? 'palindrome.' : 'not palindrome.'}\n');
  /**
   * Q7
   */
  List<int> aList = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100];
  List<int> evenList = [];
  for (int num in aList) {
    if (num.isEven) {
      evenList.add(num);
    }
  }
  print('The list is $aList.');
  print('The even elements of this list are $evenList.\n');
  /**
   * Q8
   */
  bool flag = true;
  do {
    print('P1: Choose 1 for Rock, 2 for Paper and 3 for Scissors!');
    int player1 = int.parse(stdin.readLineSync()!);
    print('P2: Choose 1 for Rock, 2 for Paper and 3 for Scissors!');
    int player2 = int.parse(stdin.readLineSync()!);
    if (player1 == player2) {
      print('Try again! ');
      continue;
    } else {
      flag = false;
      if ((player1 == 1 && player2 == 3) ||
          (player1 == 3 && player2 == 2) ||
          (player1 == 2 && player2 == 1)) {
        print('Player 1 is the winner.');
      } else {
        print('Player 2 is the winner.');
      }
    }
  } while (flag);
}
