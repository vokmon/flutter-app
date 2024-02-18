// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteModel {
  String? path;
  String? name;
  String? title;
  IconData? iconData;
  GoRouterWidgetBuilder? builder;
  bool? isExpanded;
  List<RouteModel>? routes;
  ShellRouteBuilder? shellRouteBuilder;

  RouteModel({
    this.path,
    this.name,
    this.title,
    this.iconData,
    this.builder,
    this.isExpanded,
    this.routes,
    this.shellRouteBuilder,
  });
}
