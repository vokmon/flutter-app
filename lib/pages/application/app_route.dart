// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/application/home_page.dart';
import 'package:flutter_app/pages/authentication/notify/authentication_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRoute {
  String get initialLocation => '/app/app-home';

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
          return state.namedLocation('app-home');
        }
        return null;
      },
      routes: [
        GoRoute(
          path: 'app-home',
          name: 'app-home',
          builder: (context, state) => HomePage(),
        )
      ]);
}
