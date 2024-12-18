import 'dart:io';

void main(List<String> args) {
  List to_do = [];
  while (true) {
    printTheMenu();
    print("Enter Your Choice! :");
    var choice = stdin.readLineSync()!;
    if (choice == "1") {
      addTask(to_do);
    } else if (choice == "2") {
      removeTask(to_do);
    } else if (choice == "3") {
      viweTasks(to_do);
    } else if (choice == "4") {
      to_do.clear();
      print("To-Do list is empty now.");
    } else if (choice == "5") {
      print("Exiting the application...");
      break;
    } else {
      print("Invalid choice!");
    }

    print("\n");
  }
}

void printTheMenu() {
  print("--- To-Do Application ---");
  print("1. Add Task");
  print("2. Remove Task");
  print("3. Viwe Tasks");
  print("4. Clear");
  print("5. Exit");
}

void addTask(List to_do) {
  print("Enter the task! :");
  var task = stdin.readLineSync()!;
  to_do.add(task);
  print("Task added successfully!");
}

void removeTask(List to_do) {
  print("Enter the task number to remove!");
  int task_number = int.parse(stdin.readLineSync()!);
  if (task_number < 0 || task_number > to_do.length - 1) {
    print("Item does not found.");
    return;
  }
  var item = to_do[task_number - 1];
  to_do.removeAt(task_number - 1);
  print("Task \"$item\" removed successfully!");
}

void viweTasks(List to_do) {
  print("--- Tasks ---");
  if (to_do.isEmpty) {
    print("Empty!");
    return;
  }
  for (var i = 0; i < to_do.length; i++) {
    print("${i + 1}. ${to_do[i]}");
  }
}
