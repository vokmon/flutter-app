import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth/google_auth_provider_service.dart';
import 'package:flutter_app/utils/dialog_utils.dart';
import 'package:flutter_app/utils/snackbar_utils.dart';
import 'package:go_router/go_router.dart';

class LoginGoogleWidget extends StatelessWidget {
  const LoginGoogleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void loginWithGoogleProvider() async {
      try {
        // auth service
        DialogUtils.displayDialog(context, 'Signing in...');
        await GoogleAuthProviderService.signInWithGoogle();
      } catch (e) {
        print(e);
        SnackbarUtils.showErrornSnackBar(e.toString());
      } finally {
        // ignore: use_build_context_synchronously
        context.pop();
      }
    }

    return IconButton(
      onPressed: loginWithGoogleProvider,
      icon: Image.asset(
        'lib/images/Google_Icons-09-512.png',
        height: 72,
      ), // Change for SVG with SvgPicture
    );
  }
}
