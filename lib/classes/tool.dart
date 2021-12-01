class Tool {
  static bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }
}
