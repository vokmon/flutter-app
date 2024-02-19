import 'package:flutter/material.dart';
import 'package:flutter_app/utils/auth_utils.dart';
import 'package:flutter_app/utils/dialog_utils.dart';
import 'package:go_router/go_router.dart';

class ListTileLoutoutWidget extends StatelessWidget {
  const ListTileLoutoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    performLogout() async {
      {
        AuthUtils.signout(context);
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
