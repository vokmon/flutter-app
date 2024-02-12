import 'package:flutter/material.dart';

class DialogUtils {
  static Future<dynamic> displayDialog(BuildContext context, String message) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 30,
          ),
          Text(
            message,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
