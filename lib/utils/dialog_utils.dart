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

  static Future<dynamic> displayConfirmation(
      BuildContext context,
      String title,
      String message,
      String confirmText,
      String cancelText,
      VoidCallback onCancel,
      VoidCallback onConfirm) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
                title: Text(title),
                content: Text(message,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .merge(TextStyle(fontSize: 23))),
                actions: [
                  SizedBox(
                    height: 30,
                  ),
                  FilledButton(
                    onPressed: onCancel,
                    child: Text(cancelText),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FilledButton(
                    onPressed: onConfirm,
                    child: Text(confirmText),
                  ),
                ]));
  }
}
