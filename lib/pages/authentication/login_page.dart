import 'package:flutter/material.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/utils/DialogUtils.dart';
import 'package:flutter_app/utils/SnackbarUtils.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void login() async {
      // auth service
      DialogUtils.displayDialog(context, 'Signing in...');
      final authService = AuthService();
      try {
        await authService.signInWithEmailPassword(
            emailController.text, passwordController.text);
      } catch (e) {
        SnackbarUtils.showErrornSnackBar(e.toString());
      } finally {
        // ignore: use_build_context_synchronously
        context.pop();
      }
    }

    return Scaffold(
        // Define the color from theme object
        // backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: "Email"),
            ),
          ),

          SizedBox(height: 25),

          // pw textfield
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(hintText: "Password"),
              obscureText: true,
            ),
          ),

          // login button
          SizedBox(height: 40),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: FilledButton.icon(
              onPressed: login, label: Text("Sign in"), icon: Icon(Icons.lock),
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
        ],
      ),
    ));
  }
}
