import 'dart:collection';

void main(List<String> args) {
  List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  print(list);
  list.removeWhere((int num) => num % 2 == 0);
  print(list);
  List dyList1 = ['hayam', 24]; //this is a dynamic list
  List dyList2 = [
    ...dyList1,
    'ahmed',
    26
  ]; //take the content of this list and put it here
  List dyList3 = [dyList1, 'mado', 24]; //put this list here
  print(dyList2);
  print(dyList3);
  var dyList = []; //dynamic list
  var listOfString = <String>[]; //<String> makes the list string list
  /**
   **********************************SETS***************************************
   */

  /**
   * Hash set: is best suited when the insertion order is unimportant, and you want to store unique values.
   */
  Set<int> hashSet = HashSet();
  hashSet.add(1);
  hashSet.add(3);
  hashSet.add(2);
  hashSet.add(0);
  print(hashSet);
  /**
   * Linked hash set: this set stores the data based on the order in which the items are inserted.
   */
  Set<int> linkedHashSet = LinkedHashSet(); // = Set<int> linkedHashSet = {};
  linkedHashSet.add(1);
  linkedHashSet.add(3);
  linkedHashSet.add(2);
  linkedHashSet.add(0);
  print(linkedHashSet);
  /**
   * Splay tree set: is to store data that is comparable. For instance, if you insert numeric values, the SplayTreeSet orders them by default; inserting a string and a numeric value will throw an error because it cannot compare them to each other.
   */
  Set<int> splayTreeSet = SplayTreeSet();
  splayTreeSet.add(1);
  splayTreeSet.add(3);
  splayTreeSet.add(2);
  splayTreeSet.add(0);
  print(splayTreeSet);

  Set<String> splayTreeSet2 = SplayTreeSet();
  splayTreeSet2.add('b');
  splayTreeSet2.add('a');
  splayTreeSet2.add('c');
  print(splayTreeSet2);
}
