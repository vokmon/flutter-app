import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth/auth_service.dart';
import 'package:flutter_app/themes/theme_provider.dart';
import 'package:flutter_app/utils/dialog_utils.dart';
import 'package:flutter_app/utils/snackbar_utils.dart';
import 'package:provider/provider.dart';

class AuthUtils {
  static signout(BuildContext context) async {
    final authService = AuthService();
    try {
      DialogUtils.displayDialog(context, 'Signing out...');
      Function reset = context.read<ThemeProvider>().reset;
      await authService.signout();
      reset();
    } catch (e) {
      SnackbarUtils.showErrornSnackBar(e.toString());
    }
  }
}
