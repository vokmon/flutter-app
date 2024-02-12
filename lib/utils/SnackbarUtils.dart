import 'package:flutter/material.dart';

class SnackbarUtils {
  static var messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showInformationSnackBar(String? text) {
    _showSnackBar(text, Colors.blue.shade400);
  }

  static showErrornSnackBar(String? text) {
    _showSnackBar(text, Colors.red.shade400);
  }

  static _showSnackBar(String? text, Color backgroundColor) {
    if (text == null) return;

    final snackBar =
        SnackBar(content: Text(text), backgroundColor: backgroundColor);

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
