import '/controllers/register_controller.dart';
import '/screens/login_screen.dart';
import '/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _passwordInvisible = true;
  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                titleText(),
                const SizedBox(height: 30),
                nameField(),
                const SizedBox(height: 30),
                emailField(),
                const SizedBox(height: 30),
                passwordField(),
                const SizedBox(height: 30),
                confirmPasswordField(),
                const SizedBox(height: 10),
                agreementText(),
                const SizedBox(height: 30),
                registerButton(),
                const SizedBox(height: 30),
                loginLink()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget titleText() {
    return Text(
      "createAccount".tr,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 56),
      textAlign: TextAlign.start,
    );
  }

  Widget nameField() {
    return TextFormField(
      controller: controller.nameController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          labelText: "userName".tr,
          hintText: "userNameHint".tr,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/user.png", width: 30, height: 30),
          ),
          contentPadding: const EdgeInsets.all(16),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => Validation.validateName(value),
    );
  }

  Widget emailField() {
    return TextFormField(
      controller: controller.emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "emailLabel".tr,
          hintText: "emailHint".tr,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Image.asset("assets/images/email.png", width: 30, height: 30),
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
              setState(() {
                _passwordInvisible = !_passwordInvisible;
              });
            },
          ),
          contentPadding: const EdgeInsets.all(16),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
      obscureText: _passwordInvisible,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => Validation.validatePassword(value),
    );
  }

  Widget confirmPasswordField() {
    return TextFormField(
      controller: controller.passwordConfirmController,
      decoration: InputDecoration(
          labelText: "passwordConfirmLabel".tr,
          hintText: "passwordConfirmHint".tr,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/password.png",
                width: 30, height: 30),
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.visibility),
            onPressed: () {
              setState(() {
                _passwordInvisible = !_passwordInvisible;
              });
            },
          ),
          contentPadding: const EdgeInsets.all(16),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
      obscureText: _passwordInvisible,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => Validation.validateConfirmPassword(
          controller.passwordController.text, value),
    );
  }

  Widget agreementText() {
    return Text("registerAgreement".tr);
  }

  Widget registerButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Get.theme.primaryColor,
            foregroundColor: Get.theme.colorScheme.onPrimary,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)))),
        onPressed: () {
          controller.register();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "createAccount".tr,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ));
  }

  Widget loginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("alreadyHaveAccount".tr),
        TextButton(
            onPressed: () {
              Get.offAll(() => LoginScreen());
            },
            child: Text(
              "login".tr,
              style: const TextStyle(decoration: TextDecoration.underline),
            ))
      ],
    );
  }
}
