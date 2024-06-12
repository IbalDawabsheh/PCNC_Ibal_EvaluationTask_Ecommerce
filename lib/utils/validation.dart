import 'package:get/get.dart';

class Validation {
  static String? validateName(String? value) {
    value = value?.trim();
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    value = value?.trim();
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty.';
    } else if (!GetUtils.isEmail(value)) {
      return 'Email is invalid';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    value = value?.trim();
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty.';
    } else if (value.length < 5) {
      return 'Password should be at least 5 characters.';
    }
    return null;
  }
}
