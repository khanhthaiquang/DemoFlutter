class Validation {

  static bool isValidateUser(String users) {
    return users != null && users.length > 6 && users.contains("@");
  }

  static bool isValidatePassword(String password) {
    return password != null && password.length > 8;
  }
}
