import 'package:evaluation_task_ecommerce/Screens/RegisterScreen.dart';
import 'package:evaluation_task_ecommerce/api/Controller/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordInvisible = true;
  final AuthController controller = Get.put(AuthController(), permanent: true);

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
      ),
    );
  }

  Text titleText() {
    return const Text(
      "Welcome Back!",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 56),
      textAlign: TextAlign.start,
    );
  }

  TextFormField emailField() {
    return TextFormField(
      controller: controller.emailController,
      decoration: const InputDecoration(
          labelText: 'Username or Email',
          hintText: 'Please enter your username or email.',
          prefixIcon: Icon(
            Icons.person_rounded,
            size: 30,
          ),
          contentPadding: EdgeInsets.all(16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
      textInputAction: TextInputAction.next,
    );
  }

  TextFormField passwordField() {
    return TextFormField(
      controller: controller.passwordController,
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Please enter your password.',
          prefixIcon: const Icon(
            Icons.lock,
            size: 30,
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
    );
  }

  Row forgotPassLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(onPressed: () {}, child: const Text("Forgot Password?")),
      ],
    );
  }

  ElevatedButton loginButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Get.theme.primaryColor,
            foregroundColor: Get.theme.colorScheme.onPrimary,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)))),
        onPressed: () {
          controller.login();
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Login",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ));
  }

  Row accountSignUpLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Create an account"),
        TextButton(
            onPressed: () {
              Get.offAll(() => const RegisterScreen());
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(decoration: TextDecoration.underline),
            ))
      ],
    );
  }
}
