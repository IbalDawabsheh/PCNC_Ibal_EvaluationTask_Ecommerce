import 'package:get/get.dart';

class Validation {
  static String? validateName(String? value) {
    value = value?.trim();
    if (value == null || value.isEmpty) {
      return "nameEmpty".tr;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    value = value?.trim();
    if (value == null || value.isEmpty) {
      return "emailEmpty".tr;
    } else if (!GetUtils.isEmail(value)) {
      return "emailInvalid".tr;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "passwordEmpty".tr;
    } else if (value.length < 5) {
      return "passwordLength".tr;
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "passwordEmpty".tr;
    } else if (confirmPassword.length < 5) {
      return "passwordLength".tr;
    } else if (password != confirmPassword) {
      return "passwordsDontMatch".tr;
    }
    return null;
  }
}
