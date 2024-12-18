//import 'package:problem_solving/problem_solving.dart' as problem_solving;
// import 'dart:io';
import 'dart:math';

import 'package:stack/stack.dart'; //dart pub add stack
//import 'dart:collection';

void main(List<String> arguments) {
  // print('enter what you want');
  // String input = stdin.readLineSync()!;
  print((7 / 2).floor());
  print((7 / 2).ceil());
  print((7 / 2).round());
  print(removeStars("leet**cod*e"));
  print(5 ~/ 2);
}

bool uniqueOccurrences(List<int> arr) {
  Map<int, int> map = {};
  for (var element in arr) {
    if (map.containsKey(element)) {
      map[element] = (map[element] ?? 0) + 1;
    } else {
      map[element] = 1;
    }
  }
  Set<int> set = {};
  set.addAll(map.values);
  return set.length == map.keys.length;
}

List<List<int>> findDifference(List<int> nums1, List<int> nums2) {
  List<List<int>> difference = [[], []];
  Set<int> set1 = nums1.toSet();
  Set<int> set2 = nums2.toSet();
  for (var element in set1) {
    if (!set2.contains(element)) {
      difference[0].add(element);
    }
  }
  for (var element in set2) {
    if (!set1.contains(element)) {
      difference[1].add(element);
    }
  }
  return difference;
}

int minEatingSpeed(List<int> piles, int h) {
  int left = 0;
  int right = maxElement(piles);
  int k = left;
  while (left <= right) {
    int mid = left + (right - left) ~/ 2;
    if (hoursCalculation(piles, mid) <= h) {
      k = mid;
      right = mid - 1;
    } else {
      left = mid + 1;
    }
  }
  return k;
}

int hoursCalculation(List<int> pile, int mid) {
  int hours = 0;
  for (int i = 0; i < pile.length; i++) {
    hours += (pile[i] / mid).ceil();
  }
  return hours;
}

int maxElement(List<int> list) {
  int max = -1;
  for (int i = 0; i < list.length; i++) {
    if (list[i] > max) {
      max = list[i];
    }
  }
  return max;
}

int findPeakElement(List<int> nums) {
  List<int> sortedNums = [...nums];
  sortedNums.sort();
  int max = sortedNums.last;
  return nums.indexOf(max);
}

List<int> successfulPairs(List<int> spells, List<int> potions, int success) {
  List<int> pairs = [];
  potions.sort();

  for (int i = 0; i < spells.length; i++) {
    int left = 0;
    int right = potions.length - 1;
    while (left < right) {
      int mid = (left + right) ~/ 2;
      if (spells[i] * potions[mid] >= success) {
        right = mid - 1;
      } else {
        left = mid + 1;
      }
    }
    pairs.add(potions.length - left + 1);
  }
  return pairs;
}

List<int> asteroidCollision(List<int> asteroids) {
  List<int> stack = [];
  for (var i = 0; i < asteroids.length; i++) {
    if (stack.isEmpty || asteroids[i] > 0) {
      stack.add(asteroids[i]);
    } else {
      while (true) {
        int peek = stack.last;
        if (peek < 0) {
          stack.add(asteroids[i]);
          break;
        } else if (peek == -asteroids[i]) {
          stack.removeLast();
          break;
        } else if (peek > -asteroids[i]) {
          break;
        } else if (peek < -asteroids[i]) {
          stack.removeLast();
          if (stack.isEmpty) {
            stack.add(asteroids[i]);
            break;
          }
        }
      }
    }
  }
  return stack;
}

class RecentCounter {
  List<int>? requests;
  RecentCounter() {
    requests = [];
  }

  int ping(int t) {
    requests!.add(t);
    while (requests!.first < (t - 3000)) {
      requests!.removeAt(0);
    }
    return requests!.length;
  }
}

String removeStars(String s) {
  List<String> list = [];
  for (int i = 0; i < s.length; i++) {
    if (s[i] != '*') {
      list.add(s[i]);
    } else if (s[i] == '*') {
      list.removeLast();
    }
  }
  return list.join();
}
// String removeStars(String s) {
//   Stack stack = Stack();
//   for (int i = 0; i < s.length; i++) {
//     if (s[i] != "*") {
//       stack.push(s[i]);
//     } else if (s[i] == "*") {
//       stack.pop();
//     }
//   }
//   String str = "";
//   while (stack.isNotEmpty) {
//     str += stack.pop();
//   }
//   return str.split("").reversed.join("");
// }

int pairSum(ListNode? head) {
  // int n = 0;
  // ListNode? count = head;
  // while (count != null) {
  //   n++;
  //   count = count.next;
  // }
  // int maxSum = 0;
  // ListNode? first = head;
  // ListNode? second = head;
  // for (int i = 0; i <= (n / 2) - 1; i++) {
  //   for (int j = i; j < n - 1 - i; j++) {
  //     second = second!.next;
  //   }
  //   if ((first!.val + second!.val) > maxSum) {
  //     maxSum = first.val + second.val;
  //   }
  //   first = first.next;
  //   second = first;
  // }
  // return maxSum;
  List<int> vals = [];
  ListNode? curr = head;
  while (curr != null) {
    vals.add(curr.val);
    curr = curr.next;
  }
  int maxSum = 0;
  int first = 0;
  int second = vals.length - 1;
  while (first < second) {
    if (vals[first] + vals[second] > maxSum) {
      maxSum = vals[first] + vals[second];
    }
    first++;
    second--;
  }
  return maxSum;
}

ListNode? deleteMiddle(ListNode? head) {
  ListNode? prev = head;
  ListNode? curr = prev!.next;
  int n = 0;
  ListNode? count = head;
  while (count != null) {
    n++;
    count = count.next;
  }
  if (n == 1) {
    return null;
  }
  for (var i = 1; i < (n / 2).floor(); i++) {
    prev = curr;
    curr = prev!.next;
  }
  prev!.next = curr?.next;
  return head;
}

ListNode? reverseList(ListNode? head) {
  if (head?.next == null) return head;
  // ignore: avoid_init_to_null
  ListNode? prev = null;
  ListNode? curr = head;
  ListNode? next = curr!.next;
  while (next != null) {
    next = curr!.next;
    curr.next = prev;
    prev = curr;
    curr = next;
  }
  head = prev;
  return head;
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

int pivotIndex(List<int> nums) {
  List<int> leftSum = List.filled(nums.length, 0);
  List<int> rightSum = List.filled(nums.length, 0);
  for (int i = 1; i < leftSum.length; i++) {
    leftSum[i] = leftSum[i - 1] + nums[i - 1];
  }
  for (int j = rightSum.length - 2; j >= 0; j--) {
    rightSum[j] = rightSum[j + 1] + nums[j + 1];
  }
  int flag = -1;
  for (int k = 0; k < nums.length; k++) {
    if (leftSum[k] == rightSum[k]) {
      flag = k;
      break;
    }
  }
  return flag;
}

int largestAltitude(List<int> gain) {
  List altitudes = <int>[];
  altitudes.add(0);
  int max = 0;
  for (int i = 0; i < gain.length; i++) {
    altitudes.add(gain[i] + altitudes[i]);
    max = max > altitudes[i + 1] ? max : altitudes[i + 1];
  }
  return max;
}

bool isSubsequence(String s, String t) {
  int j = 0;
  int count = 0;
  for (int i = 0; i < s.length; ++i) {
    while (j < t.length) {
      if (s[i] == t[j]) {
        j++;
        count++;
        break;
      } else {
        j++;
      }
    }
  }
  return count == s.length;
}

void moveZeroes(List<int> nums) {
  int n = nums.length;
  for (int i = 0; i < n; i++) {
    if (nums[i] != 0) {
      continue;
    }
    for (int j = i + 1; j < n; j++) {
      if (nums[j] != 0) {
        nums[i] = nums[j];
        nums[j] = 0;
        break;
      }
    }
  }
}

String gcdOfStrings(String str1, String str2) {
  if (str1 + str2 != str2 + str1) {
    return "";
  }
  int length1 = str1.length;
  int length2 = str2.length;
  int commonLength = gcd(length1, length2);
  return str1.substring(0, commonLength);
}

int gcd(int a, int b) {
  while (b != 0) {
    var temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

int compress(List<String> chars) {
  String finalString = '';
  for (var i = 0; i < chars.length; i++) {
    String curr = chars[i];
    int count = 1;
    for (int j = i + 1; j < chars.length; j++) {
      if (chars[j] == curr) {
        count++;
      } else {
        break;
      }
    }
    if (count > 1) {
      finalString += curr;
      finalString += count.toString();
      i += count - 1;
    } else {
      finalString += curr;
    }
  }
  chars.removeRange(0, chars.length);
  for (int i = 0; i < finalString.length; i++) {
    chars.add(finalString[i]);
  }
  return finalString.length;
}

bool increasingTriplet(List<int> nums) {
  // int n = nums.length;
  // if (n < 3) return false;
  // for (int i = 0, j = 1, k = 2; k < n; i++, j++, k++) {
  //   if (nums[i] < nums[j] && nums[j] < nums[k]) {
  //     return true;
  //   }
  // }
  // return false;
  int n = nums.length;
  if (n < 3) return false;
  int first = (1 << 32) - 1;
  int second = (1 << 32) - 1;
  for (int num in nums) {
    if (num <= first) {
      first = num;
    } else if (num <= second) {
      second = num;
    } else {
      return true;
    }
  }
  return false;
}

List<int> productExceptSelf(List<int> nums) {
  int n = nums.length;
  List<int> leftProducts = List<int>.filled(n, 1);
  List<int> rightProducts = List<int>.filled(n, 1);
  for (int i = 1; i < n; i++) {
    leftProducts[i] = leftProducts[i - 1] * nums[i - 1];
  }
  for (int i = n - 2; i >= 0; i--) {
    rightProducts[i] = rightProducts[i + 1] * nums[i + 1];
  }
  List<int> result = List<int>.filled(n, 0);
  for (int i = 0; i < n; i++) {
    result[i] = leftProducts[i] * rightProducts[i];
  }
  return result;
}

String reverseWords(String s) {
  s = s.trim();
  s = s.replaceAll(RegExp(r'\s+'), ' ');
  List<String> words = s.split(" ");
  return words.reversed.join(" ");
}

String reverseVowels(String s) {
  Set<String> vowels = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'};
  List<String> charList = s.split('');
  int left = 0;
  int right = charList.length - 1;
  while (left < right) {
    while (left < right && !vowels.contains(charList[left])) {
      left++;
    }
    while (left < right && !vowels.contains(charList[right])) {
      right--;
    }
    String temp = charList[left];
    charList[left] = charList[right];
    charList[right] = temp;
    left++;
    right--;
  }
  return charList.join();
}

bool canPlaceFlowers(List<int> flowerbed, int n) {
  if (n == 0) {
    return true;
  }
  if (flowerbed.length == 1) {
    if (!flowerbed.contains(1) && n <= 1) {
      return true;
    } else {
      return false;
    }
  } else if (flowerbed.length == 2) {
    if (!flowerbed.contains(1) && n <= 1) {
      return true;
    } else {
      return false;
    }
  } else {
    if (flowerbed[0] == 0 && flowerbed[1] == 0) {
      n = n > 0 ? n - 1 : n;
      flowerbed[0] = 1;
    }
    if (flowerbed[flowerbed.length - 1] == 0 &&
        flowerbed[flowerbed.length - 2] == 0) {
      n = n > 0 ? n - 1 : n;
      flowerbed[flowerbed.length - 1] = 1;
    }
    for (var i = 1; i < flowerbed.length - 1 && n > 0; i++) {
      if (flowerbed[i] == 0 && flowerbed[i - 1] == 0 && flowerbed[i + 1] == 0) {
        n = n > 0 ? n - 1 : n;
        flowerbed[i] = 1;
      }
    }
  }
  return n == 0;
}

List<bool> kidsWithCandies(List<int> candies, int extraCandies) {
  List<bool> result = [];
  int max = getMax(candies);
  for (var i = 0; i < candies.length; i++) {
    result.add(candies[i] + extraCandies >= max ? true : false);
  }
  return result;
}

int getMax(List<int> list) {
  var maxNum = list[0];
  for (var i = 1; i < list.length; i++) {
    if (list[i] > maxNum) {
      maxNum = list[i];
    }
  }
  return maxNum;
}

List<int> topKFrequent(List<int> nums, int k) {
  nums.sort();
  int larger = nums.last;
  List<int> freqList = List.filled(larger, 0);
  for (var i = 0; i < nums.length; i++) {
    freqList[nums[i] - 1]++;
  }
  List<int> topKFreq = List.filled(k, 0);
  for (var i = 0; i < topKFreq.length; i++) {
    int indxOfLargest = 0;
    for (var j = 0; j < freqList.length; j++) {
      if (freqList[j] > topKFreq[i]) {
        topKFreq[i] = freqList[j];
        indxOfLargest = j;
      }
    }
    topKFreq[i] = indxOfLargest + 1;
    freqList[indxOfLargest] = 0;
  }
  return topKFreq;
}

bool balancedParentheses(String exp) {
  Stack<String> stack = Stack();
  for (int i = 0; i < exp.length; i++) {
    if (exp[i] == "(" || exp[i] == "{" || exp[i] == "[") {
      stack.push(exp[i]);
    } else if (exp[i] == ")" || exp[i] == "}" || exp[i] == "]") {
      if (stack.isEmpty || !arePair(stack.top(), exp[i])) return false;
      stack.pop();
    }
  }
  return stack.isEmpty;
}

bool arePair(String open, String close) {
  if (open == '(' && close == ')') {
    return true;
  } else if (open == '{' && close == '}') {
    return true;
  } else if (open == '[' && close == ']') {
    return true;
  }
  return false;
}

List<int> replaceElements(List<int> arr) {
  for (int i = 0; i < arr.length; i++) {
    if (i == arr.length - 1) {
      arr[i] = -1;
      break;
    }
    arr[i] = 0;
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] > arr[i]) {
        arr[i] = arr[j];
      }
    }
  }
  return arr;
}

num maxArea(List<int> height) {
  num maxArea = 0;
  int left = 0;
  int right = height.length - 1;
  while (left < right) {
    int minLine = min(height[left], height[right]);
    maxArea = max(maxArea, minLine * (right - left));
    if (height[left] < height[right]) {
      left++;
    } else {
      right--;
    }
  }
  return maxArea;
}

List<List<String>> groupAnagrams(List<String> strs) {
  if (strs.isEmpty) return [];
  Map<String, List<String>> map = {};
  for (int i = 0; i < strs.length; ++i) {
    String key = sortString(strs[i]);
    map[key] = map[key] ?? [];
    map[key]?.add(strs[i]);
  }
  return map.values.toList();
}

bool isPalindrome(String s) {
  if (s.length == 1) return true;
  String str = '';
  s = s.toLowerCase();
  for (int i = 0; i < s.length; i++) {
    if (s[i].codeUnitAt(0) >= 97 && s[i].codeUnitAt(0) <= 122) {
      str += s[i];
    }
    if (s[i].codeUnitAt(0) >= 48 && s[i].codeUnitAt(0) <= 57) {
      str += s[i];
    }
  }
  String reversedStr = str.split('').reversed.join('');
  return str == reversedStr;
}

List<int> twoSum(List<int> nums, int target) {
  int firstIndex = 0;
  int secondIndex = 0;
  bool flag = false;
  for (var i = 0; i < nums.length; i++) {
    if (flag) break;
    firstIndex = i;
    for (var j = i + 1; j < nums.length; j++) {
      secondIndex = j;
      if (nums[i] + nums[j] == target) {
        flag = true;
        break;
      }
    }
  }
  return [firstIndex, secondIndex];
}

bool isAnagram(String s, String t) {
  if (s.length != t.length) return false;
  s = sortString(s);
  t = sortString(t);
  if (s == t) return true;
  return false;
}

String sortString(String str) {
  List<String> list = str.split('');
  list.sort();
  return list.join('');
}

bool containsDuplicate(List<int> nums) {
  for (var i = 0; i < nums.length; i++) {
    for (var j = i + 1; j < nums.length; j++) {
      if (nums[i] == nums[j]) {
        return true;
      }
    }
  }
  return false;
}
