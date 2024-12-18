class Circle {
  double rad;
  int _x = 0;
  int _y = 0;
  //Named parameters can’t start with an underscore.
  Circle(
      {required this.rad,
      required int x,
      required int y}) //Initializer list اللي تحت دا
      : _x = x,
        _y = y;
  //named constractor
  Circle.origin({required this.rad});
  double area() {
    return 3.17 * rad * rad;
  }
}
