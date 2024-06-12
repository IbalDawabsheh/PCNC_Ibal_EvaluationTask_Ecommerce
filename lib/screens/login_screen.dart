import '/controllers/login_controller.dart';
import '/screens/register_screen.dart';
import '/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    titleText(),
                    const SizedBox(height: 30),
                    emailField(),
                    const SizedBox(height: 30),
                    passwordField(),
                    forgotPassLink(),
                    const SizedBox(height: 30),
                    loginButton(),
                    const SizedBox(height: 30),
                    accountSignUpLink()
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget titleText() {
    return Text(
      "welcome".tr,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 56),
      textAlign: TextAlign.start,
    );
  }

  Widget emailField() {
    return TextFormField(
      controller: controller.emailController,
      decoration: InputDecoration(
          labelText: "userNameLabel".tr,
          hintText: "userNameEmailHint".tr,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/user.png", width: 30, height: 30),
          ),
          contentPadding: const EdgeInsets.all(16),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => Validation.validateEmail(value),
    );
  }

  Widget passwordField() {
    return TextFormField(
      controller: controller.passwordController,
      decoration: InputDecoration(
          labelText: "passwordLabel".tr,
          hintText: "passwordHint".tr,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/password.png",
                width: 30, height: 30),
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.visibility),
            onPressed: () {
              controller.toggleVisibility();
            },
          ),
          contentPadding: const EdgeInsets.all(16),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
      obscureText: controller.passwordInvisible.value,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => Validation.validatePassword(value),
    );
  }

  Widget forgotPassLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(onPressed: () {}, child: Text("forgotPassword".tr)),
      ],
    );
  }

  Widget loginButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Get.theme.primaryColor,
            foregroundColor: Get.theme.colorScheme.onPrimary,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)))),
        onPressed: () {
          controller.login();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "login".tr,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ));
  }

  Widget accountSignUpLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("createAccount".tr),
        TextButton(
            onPressed: () {
              Get.offAll(() => const RegisterScreen());
            },
            child: Text(
              "signUp".tr,
              style: const TextStyle(decoration: TextDecoration.underline),
            ))
      ],
    );
  }
}
