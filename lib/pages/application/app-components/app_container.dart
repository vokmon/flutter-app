import 'package:flutter/material.dart';
import 'package:flutter_app/pages/application/app-components/app_app_bar.dart';
import 'package:flutter_app/pages/application/app-components/app_drawer.dart';
import 'package:go_router/go_router.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  final GoRouterState state;

  const AppContainer({super.key, required this.child, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(title: state.matchedLocation),
      drawer: AppDrawer(matchedLocation: state.matchedLocation),
      body: Center(
        child: child,
      ),
    );
  }
}
