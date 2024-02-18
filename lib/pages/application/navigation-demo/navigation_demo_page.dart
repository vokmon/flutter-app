import 'package:flutter/material.dart';
import 'package:flutter_app/components/container/container_with_navigation_widget.dart';
import 'package:flutter_app/pages/application/navigation-demo/navigation_demo_routes.dart';
import 'package:go_router/go_router.dart';

class NavigationDemoPage extends StatelessWidget {
  final BuildContext context;
  final GoRouterState state;
  final Widget child;

  const NavigationDemoPage(
      {super.key,
      required this.context,
      required this.state,
      required this.child});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = navigationDemoRouteConfig
        .indexWhere((element) => state.fullPath!.contains(element.path!));

    return ContainerWithNavigationWidget(
        routes: navigationDemoRouteConfig,
        selectedIndex: selectedIndex,
        child: child);
  }
}
