class FooException implements Exception {
  @override
  String toString() {
    return "FooException";
  }
}

class BarException implements Exception {
  @override
  String toString() {
    return "BarException";
  }
}
