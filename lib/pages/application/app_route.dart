import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/application/app-components/app_container.dart';
import 'package:flutter_app/pages/application/app_route_config.dart';
import 'package:flutter_app/pages/authentication/notify/authentication_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRoute {
  String get initialLocation => '/app/${homeRouteConfig[0].name!}';

  var homeRoute = GoRoute(
      path: '/app',
      name: 'app',
      redirect: (BuildContext context, GoRouterState state) {
        User? user = context.read<AuthenticationProvider>().user;
        if (user == null) {
          return '/';
        }
        // We can redirect the user to the page based on user information and user profie.

        // if the path either login nor register was not specified
        if (state.matchedLocation == state.fullPath) {
          return state.namedLocation(homeRouteConfig[0].name!);
        }
        return null;
      },
      routes: [
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) =>
                AppContainer(state: state, child: child),
            routes: homeRouteConfig
                .where((element) =>
                    element.isExpanded == null || element.isExpanded == false)
                .map((e) =>
                    GoRoute(path: e.path!, name: e.name!, builder: e.builder))
                .toList()),
      ]);
}
