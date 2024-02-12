import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

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
            "Let's create an account",
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

          SizedBox(height: 25),

          // pw textfield
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(hintText: "Confirm Password"),
              obscureText: true,
            ),
          ),

          // login button
          SizedBox(height: 40),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: FilledButton(onPressed: () => {}, child: Text("Register")
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
                  Text("Already have an account? "),
                  GestureDetector(
                    onTap: () =>
                        {context.pop('/auth/login')},
                    child: Text(
                      "Sign in",
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
