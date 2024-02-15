import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/login_providers_widget.dart';
import 'package:flutter_app/components/container/constrainted_mobile_width_container_widget.dart';
import 'package:flutter_app/services/auth/auth_service.dart';
import 'package:flutter_app/utils/dialog_utils.dart';
import 'package:flutter_app/utils/snackbar_utils.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    void registerUser() async {
      bool isValid = _formKey.currentState!.validate();
      if (!isValid) {
        return;
      }

      // auth service
      DialogUtils.displayDialog(context, 'Registering your account...');
      final authService = AuthService();
      try {
        await authService.register(
            email: emailController.text, password: passwordController.text);
      } catch (e) {
        SnackbarUtils.showErrornSnackBar(e.toString());
      } finally {
        // ignore: use_build_context_synchronously
        context.pop();
      }
    }

    return Form(
      key: _formKey,
      child: ConstrainedMobileWidth(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          // logo
          Icon(Icons.message, size: 50),

          SizedBox(height: 40),
          // welcome back message
          Text(
            "Let's create an account",
            style: TextStyle(
                // color: Theme.of(context).colorScheme.primary
                // fontSize: 16,
                ),
          ),

          SizedBox(height: 20),

          // email textfield
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: "Email"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter email';
                }
                if (!EmailValidator.validate(value)) {
                  return 'Please a valid enter email';
                }

                return null;
              },
            ),
          ),

          SizedBox(height: 20),

          // pw textfield
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(hintText: "Password"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                if (value != confirmPasswordController.text) {
                  return 'Password and Confirm Password must be the same';
                }
                return null;
              },
              obscureText: true,
            ),
          ),

          SizedBox(height: 20),

          // pw textfield
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              controller: confirmPasswordController,
              decoration: InputDecoration(hintText: "Confirm Password"),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter confirm password';
                }
                if (value.length < 6) {
                  return 'Confirm password must be at least 6 characters';
                }
                if (value != passwordController.text) {
                  return 'Password and Confirm Password must be the same';
                }
                return null;
              },
            ),
          ),

          // login button
          SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: FilledButton.icon(
              onPressed: registerUser,
              label: Text("Register"),
              icon: Icon(Icons.supervised_user_circle),
              // style: ElevatedButton.styleFrom(
              //   minimumSize: const Size.fromHeight(30), // NEW
            ),
          ),

          // register now
          SizedBox(height: 30),

          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  GestureDetector(
                    onTap: () => {context.pop('/auth/login')},
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  )
                ],
              )),

          SizedBox(height: 30),
          LoginProvidersWidget(),
        ],
      )),
    );
  }
}
