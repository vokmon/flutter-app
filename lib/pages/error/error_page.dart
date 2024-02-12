import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage {
  static MaterialPage<dynamic> getErrorPage(
      BuildContext context, GoRouterState state, String location) {
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
                Text('An error occurred. Please try again later.'),
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
