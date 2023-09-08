/// [Validator] contains static methods for validating different types of data.
class Validator {
//! To add a new validator, add a static method to this class.

  /// [validateEmail] validates email patterns using regular expressions.
  static bool validateEmail(String email) {
    // Define the regular expression for validating an email address
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    // Use the RegExp's hasMatch method to check if the email matches the pattern
    return emailRegExp.hasMatch(email);
  }

  /// [validatePassword] validates that the
  /// password is at least 8 characters long.
  static bool validatePassword(String password) {
    return password.length > 7;
  }
}
