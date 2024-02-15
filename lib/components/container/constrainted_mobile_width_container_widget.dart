import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class ConstrainedMobileWidth extends StatelessWidget {
  final Widget child;

  const ConstrainedMobileWidth({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Define the color from theme object
        // backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
      child: Container(
        color: kIsWeb
            ? Theme.of(context).colorScheme.tertiary
            : Theme.of(context).colorScheme.background,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Theme.of(context).colorScheme.background,
              ),
              child: child,
            ),
          ),
        ),
      ),
    ));
  }
}
