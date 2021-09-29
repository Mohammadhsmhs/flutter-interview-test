class TodoValidator {
  static bool isNotEmpty(String text) {
    return (text.isNotEmpty && text.trim().isNotEmpty);
  }

  static bool containsSpecialCharacters(String text) {
    final validCharacters = RegExp(r'^[a-zA-Z0-9\s]+$');
    if (validCharacters.hasMatch(text)) {
      return false;
    } else {
      return true;
    }
  }
}
