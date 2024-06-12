import 'package:evaluation_task_ecommerce/controllers/register_controller.dart';
import 'package:evaluation_task_ecommerce/screens/login_screen.dart';
import 'package:evaluation_task_ecommerce/utils/validation.dart';
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
    return const Text(
      "Create an account",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 56),
      textAlign: TextAlign.start,
    );
  }

  Widget nameField() {
    return TextFormField(
      controller: controller.nameController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          labelText: 'Username',
          hintText: 'Please enter your username.',
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
          labelText: 'Email',
          hintText: 'Please enter your email.',
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
          labelText: 'Password',
          hintText: 'Please enter your password.',
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
          labelText: 'Confirm Password',
          hintText: 'Please confirm your password.',
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

  Widget agreementText() {
    return const Text(
        "By clicking the Register button, you agree to the public offer");
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
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Create Account",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ));
  }

  Widget loginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("I Already Have An Account"),
        TextButton(
            onPressed: () {
              Get.offAll(() => const LoginScreen());
            },
            child: const Text(
              "Login",
              style: TextStyle(decoration: TextDecoration.underline),
            ))
      ],
    );
  }
}
