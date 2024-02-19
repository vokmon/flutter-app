import 'package:flutter/material.dart';
import 'package:flutter_app/pages/authentication/notify/authentication_provider.dart';
import 'package:flutter_app/utils/auth_utils.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() async {
      {
        
        // auth service
        AuthUtils.signout(context);
      }
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(context.read<AuthenticationProvider>().user!.email!),
              SizedBox(
                height: 20,
              ),
              FilledButton(onPressed: logout, child: Text("Sign out")),
            ],
          ),
        ),
      ),
    );
  }
}
