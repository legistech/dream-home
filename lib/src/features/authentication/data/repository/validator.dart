class Validator {
  static bool validateEmail(String email) {
    // Define the regular expression for validating an email address
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    // Use the RegExp's hasMatch method to check if the email matches the pattern
    return emailRegExp.hasMatch(email);
  }

  static bool validatePassword(String password) {
    return password.length > 7;
  }
}
