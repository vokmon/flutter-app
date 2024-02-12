import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  AuthenticationProvider() {
    // Continuously monitor for authStateChanges
    // per: https://firebase.google.com/docs/auth/flutter/start#authstatechanges
    _subscription =
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
      // if user != null there is a user logged in, however
      // we can just monitor for auth state change and notify
      updateUser(user);
    });
  }

  /// The user of login.
  User? get user => _user;
  User? _user;

  /// Logs in a user.
  void updateUser(User? user) {
    _user = user;
    notifyListeners();
  }

  /// Logs out the current user.
  void logout() {
    _user = null;
    notifyListeners();
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
