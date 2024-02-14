import 'package:flutter/material.dart';
import 'package:flutter_app/pages/authentication/notify/authentication_provider.dart';
import 'package:flutter_app/services/auth/auth_service.dart';
import 'package:flutter_app/utils/dialog_utils.dart';
import 'package:flutter_app/utils/snackbar_utils.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() async {
      {
        DialogUtils.displayDialog(context, 'Signing out...');
        // auth service
        final authService = AuthService();
        try {
          await authService.signout();
        } catch (e) {
          SnackbarUtils.showErrornSnackBar(e.toString());
        }
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
