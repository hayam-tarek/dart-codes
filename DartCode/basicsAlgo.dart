void main() {
  print("linearSearch: ${linearSearch([5, 8, 1, 7, 3, 6, 4, 9, 2], 7)}"); //3
  print("linearSearch: ${linearSearch([5, 8, 1, 7, 3, 6, 4, 9, 2], 2)}"); //8

  print("binarySearch: ${binarySearch([1, 2, 3, 4, 5, 6, 7, 8, 9], 7)}"); //6
  print("binarySearch: ${binarySearch([1, 2, 3, 4, 5, 6, 7, 8, 9], 2)}"); //1

  print("selectionSort: ${selectionSort([5, 8, 1, 7, 3, 6, 4, 9, 2])}");
  print("bubbleSort:    ${bubbleSort([5, 8, 1, 7, 3, 6, 4, 9, 2])}");
  print("insertionSort: ${insertionSort([5, 8, 1, 7, 3, 6, 4, 9, 2])}");

  List<num> arrMerge = [5, 8, 1, 7, 3, 6, 4, 9, 2];
  mergeSort(arrMerge, 0, arrMerge.length - 1);
  print("mergeSort:     ${arrMerge}");
  List<num> arrQuick = [5, 8, 1, 7, 3, 6, 4, 9, 2];
  quickSort(arrQuick, 0, arrQuick.length - 1);
  print("quickSort:     ${arrQuick}");
}

//Time Complexity: O(n) , Space complexity O(1)
num linearSearch(List<num> arr, num number) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == number) {
      return i;
    }
  }
  return -1;
}

//Time Complexity: O(log n) , Space complexity O(1)
num binarySearch(List<num> arr, num number) {
  int left = 0;
  int right = arr.length - 1;
  while (left <= right) {
    int middle = ((left + right) / 2).floor();
    if (arr[middle] > number) {
      right = middle - 1;
    } else if (arr[middle] < number) {
      left = middle + 1;
    } else {
      return middle;
    }
  }
  return -1;
}

//Time Complexity: O(n^2) , Space complexity O(1)
List<num> selectionSort(List<num> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    int minInd = i;
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[minInd]) {
        minInd = j;
      }
    }
    if (minInd != i) {
      num temp = arr[i];
      arr[i] = arr[minInd];
      arr[minInd] = temp;
    }
  }
  return arr;
}

//Time Complexity: O(n^2) , Space complexity O(1)
List<num> bubbleSort(List<num> arr) {
  bool flag = false;
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - 1 - i; j++) {
      if (arr[j] > arr[j + 1]) {
        flag = true;
        num temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
    if (flag == false) {
      break;
    }
  }
  return arr;
}

//Time Complexity: O(n^2) , Space complexity O(1)
List<num> insertionSort(List<num> arr) {
  num key;
  int j;
  for (int i = 1; i < arr.length; i++) {
    key = arr[i];
    j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
  return arr;
}

void merge(List<num> arr, int left, int mid, int right) {
  int i = 0, j = 0, k = left;
  int n1 = mid - left + 1;
  int n2 = right - mid;
  List<num> firstList = [];
  List<num> secondList = [];
  for (int i = 0; i < n1; i++) {
    firstList.add(arr[left + i]);
  }
  for (int j = 0; j < n2; j++) {
    secondList.add(arr[mid + 1 + j]);
  }
  while (i < n1 && j < n2) {
    if (firstList[i] <= secondList[j]) {
      arr[k] = firstList[i];
      i++;
    } else {
      arr[k] = secondList[j];
      j++;
    }
    k++;
  }
  while (i < n1) {
    arr[k] = firstList[i];
    i++;
    k++;
  }
  while (j < n2) {
    arr[k] = secondList[j];
    j++;
    k++;
  }
}

//Time Complexity: O(nlogn) , Space complexity O(n)
void mergeSort(List<num> arr, int l, int r) {
  if (l < r) {
    int m = (l + (r - l) / 2).floor();

    mergeSort(arr, l, m);
    mergeSort(arr, m + 1, r);

    merge(arr, l, m, r);
  }
}

int partition(List<num> arr, int l, int r) {
  int i = l;
  int j = r;
  num pivot = arr[l];
  while (i < j) {
    do {
      i++;
    } while (arr[i] <= pivot && i < r);
    while (arr[j] > pivot) {
      j--;
    }
    if (i < j) {
      num temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }
  num temp = arr[l];
  arr[l] = arr[j];
  arr[j] = temp;
  return j;
}

//Time Complexity: O(nlogn) , Space complexity O(1)
void quickSort(List<num> arr, int l, int r) {
  if (l < r) {
    int piv = partition(arr, l, r);
    quickSort(arr, l, piv);
    quickSort(arr, piv + 1, r);
  }
}
