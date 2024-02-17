import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/application/app_route.dart';
import 'package:flutter_app/pages/authentication/authentication_flow.dart';
import 'package:flutter_app/pages/authentication/login_page.dart';
import 'package:flutter_app/pages/authentication/notify/authentication_provider.dart';
import 'package:flutter_app/pages/authentication/register_page.dart';
import 'package:flutter_app/pages/error/error_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

const loginPage = LoginPage();
const registerPage = RegisterPage();
String _initialLocation = AuthenticationFlow.initialLocation;
final _rootNavigatorKey = GlobalKey<NavigatorState>();

var defaultRoutes = <RouteBase>[
  GoRoute(
    path: '/',
    name: 'home',
    redirect: (BuildContext context, GoRouterState state) {
      return '/auth';
    },
  ),
  AuthenticationFlow.authRoutes,
];

class AppRouteBuilder {
  static GoRouter getRoutes(BuildContext context) {
    User? user = context.watch<AuthenticationProvider>().user;

    var routesToUse = defaultRoutes;
    String initialLocation = _initialLocation;

    if (user != null) {
      AppRoute appRoute = AppRoute();
      initialLocation = appRoute.initialLocation;
      routesToUse = [...defaultRoutes, appRoute.homeRoute];
    }
    GoRouter router = GoRouter(
      routes: routesToUse,
      initialLocation: initialLocation,
      navigatorKey: _rootNavigatorKey,
      // errorBuilder: (context, state) => Center(
      //       child: Text('Oops! Something went wrong. ${state.error}'),
      //     )
      errorPageBuilder: (BuildContext context, GoRouterState state) =>
          ErrorPage.getErrorPage(context, state, initialLocation,
              'Please login first.'),
    );
    return router;
  }

/**
 * Example how update routes
 * 
 * static final ValueNotifier<RoutingConfig> routingConfig =
 *    ValueNotifier<RoutingConfig>(
 *  RoutingConfig(
 *    routes: defaultRoutes,
 *  ),
 *);
 *
 * static void updateRoutes() {
 *  // Update route based on user authentication and role.
 *  routingConfig.value = RoutingConfig(
 *    routes: <RouteBase>[
 *      AppRoute().homeRoute,
 *      // GoRoute(path: '/auth', builder: (_, __) => authenticationPage),
 *      // GoRoute(path: '/login2', builder: (_, __) => loginPage),
 *      // GoRoute(path: '/signup2', builder: (_, __) => registerPage),
 *    ],
 *  );
 *}
 */
}
