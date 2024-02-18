import 'package:flutter/material.dart';
import 'package:flutter_app/models/routes/route_model.dart';
import 'package:go_router/go_router.dart';

class RouteUtils {
  static List<RouteBase> buildRoutes(List<RouteModel> routesConfig) {
    List<RouteBase> a = routesConfig
        .where((element) =>
            element.isExpanded == null || element.isExpanded == false)
        .map((e) => e.routes != null && e.routes!.isNotEmpty
            ? GoRoute(
                path: e.path!,
                name: e.name!,
                // builder: e.builder!,
                redirect: (BuildContext context, GoRouterState state) {
                  // if the path either login nor register was not specified
                  if (state.matchedLocation == state.fullPath) {
                    return state.namedLocation(e.routes![0].name!);
                  }
                  return state.fullPath;
                },
                routes: [
                    ShellRoute(
                        builder: e.shellRouteBuilder,
                        routes: buildRoutes(e.routes!))
                  ])
            : GoRoute(path: e.path!, name: e.name!, builder: e.builder))
        .toList();

    return a;
  }
}
