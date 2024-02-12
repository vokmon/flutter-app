import 'package:flutter/material.dart';
import 'package:flutter_app/pages/authentication/login_page.dart';
import 'package:flutter_app/pages/authentication/register_page.dart';
import 'package:go_router/go_router.dart';

const loginPage = LoginPage();
const registerPage = RegisterPage();

class AuthenticationFlow {
  static const initialLocation = '/auth/login';
  
  static var authRoutes = GoRoute(
      path: '/auth',
      name: 'auth',
      redirect: (BuildContext context, GoRouterState state) {
        // if the path either login nor register was not specified
        if (state.matchedLocation == state.fullPath) {
          return state.namedLocation('login');
        }

        // return null to forward requested path
        return null;
      },
      routes: [
        GoRoute(
          path: 'login',
          name: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return loginPage;
          },
        ),
        GoRoute(
          path: 'register',
          name: 'register',
          builder: (BuildContext context, GoRouterState state) {
            return registerPage;
          },
        )
      ]);
}
