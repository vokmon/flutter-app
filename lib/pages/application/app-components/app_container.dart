import 'package:flutter/material.dart';
import 'package:flutter_app/pages/application/app-components/app_app_bar.dart';
import 'package:flutter_app/pages/application/app-components/app_drawer.dart';
import 'package:flutter_app/pages/application/app_route_config.dart';
import 'package:go_router/go_router.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  final GoRouterState state;

  const AppContainer({super.key, required this.child, required this.state});

  @override
  Widget build(BuildContext context) {
    String? title = homeRouteConfig
        .where((element) => state.matchedLocation.contains(element.name!))
        .first
        .title;

    return Scaffold(
      appBar: AppAppbar(title: title ?? ""),
      drawer: AppDrawer(
        matchedLocation: state.matchedLocation,
        configs: homeRouteConfig,
      ),
      body: Center(
        child: child,
      ),
    );
  }
}
