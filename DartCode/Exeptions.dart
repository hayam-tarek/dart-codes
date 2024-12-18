void main(List<String> args) {
  try {
    print(division(denominator: 7, divisor: 0));
  } catch (e) {
    print(e.toString());
    print('The divisor cannot be 0');
  } finally {
    print("Finally block executed");
  }
  print('the end');
}

double division({required int denominator, required int divisor}) {
  try {
    if (divisor == 0) throw 'Error';
    return denominator / divisor;
  } catch (e) {
    rethrow; //rethrowing the exception to higher level
  }
}
