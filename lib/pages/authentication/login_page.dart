import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/login_providers_widget.dart';
import 'package:flutter_app/components/container/constrainted_mobile_width_container_widget.dart';
import 'package:flutter_app/services/auth/auth_service.dart';
import 'package:flutter_app/utils/dialog_utils.dart';
import 'package:flutter_app/utils/snackbar_utils.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void login() async {
      bool isValid = _formKey.currentState!.validate();
      if (!isValid) {
        return;
      }
      // auth service
      DialogUtils.displayDialog(context, 'Signing in...');
      final authService = AuthService();
      try {
        await authService.signInWithEmailPassword(
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
          SizedBox(
            height: 15,
          ),
          // logo
          Icon(Icons.message, size: 60),

          SizedBox(height: 50),
          // welcome back message
          Text(
            "Welcome back, you've been missed",
            style: TextStyle(
                // color: Theme.of(context).colorScheme.primary
                // fontSize: 16,
                ),
          ),

          SizedBox(height: 25),

          // email textfield
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: "Email"),
              // The validator receives the text that the user has entered.
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

          SizedBox(height: 25),

          // pw textfield
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(hintText: "Password"),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
            ),
          ),

          // login button
          SizedBox(height: 40),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: FilledButton.icon(
              onPressed: login, label: Text("Sign in"),
              icon: Icon(Icons.lock),
              // style: ElevatedButton.styleFrom(
              //   minimumSize: const Size.fromHeight(30), // NEW
            ),
          ),

          // register now
          SizedBox(height: 40),

          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Not a member? "),
                  GestureDetector(
                    onTap: () => {context.push('/auth/register')},
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  )
                ],
              )),

          SizedBox(height: 30),
          LoginProvidersWidget(),
          SizedBox(
            height: 15,
          )
        ],
      )),
    );
  }
}
