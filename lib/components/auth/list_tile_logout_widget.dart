import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth/auth_service.dart';
import 'package:flutter_app/utils/dialog_utils.dart';
import 'package:flutter_app/utils/snackbar_utils.dart';
import 'package:go_router/go_router.dart';

class ListTileLoutoutWidget extends StatelessWidget {
  const ListTileLoutoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    performLogout() async {
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

    showLogoutConfirm() async {
      DialogUtils.displayConfirmation(context, "Logout",
          "Are you sure you want to logout?", "Logout", "Cancel", () {
        context.pop();
      }, performLogout);
    }

    return ListTile(
      title: Text("Logout"),
      leading: Icon(Icons.logout),
      onTap: showLogoutConfirm,
    );
  }
}
