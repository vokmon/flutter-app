import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage {
  static MaterialPage<dynamic> getErrorPage(
      BuildContext context, GoRouterState state, String location, String errorMessage) {
    return MaterialPage(
      key: ValueKey('errorPage'),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(errorMessage),
                SizedBox(height: 50),
                FilledButton(
                    onPressed: () {
                      context.go(location);
                    },
                    child: Text("Back")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
