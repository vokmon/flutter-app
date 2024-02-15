import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/login_google_widget.dart';

class LoginProvidersWidget extends StatelessWidget {
  const LoginProvidersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Expanded(
                  child: Divider(thickness: 0.5, color: Colors.grey[400]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Or continue with'),
                ),
                Expanded(
                  child: Divider(thickness: 0.5, color: Colors.grey[400]),
                ),
              ],
            )),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            LoginGoogleWidget(),
          ],
        )
      ],
    );
  }
}
