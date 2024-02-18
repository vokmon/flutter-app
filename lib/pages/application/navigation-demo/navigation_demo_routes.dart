import 'package:flutter/material.dart';
import 'package:flutter_app/models/routes/route_model.dart';
import 'package:flutter_app/pages/application/navigation-demo/pages/navigation_page_1.dart';
import 'package:flutter_app/pages/application/navigation-demo/pages/navigation_page_2.dart';
import 'package:flutter_app/pages/application/navigation-demo/pages/navigation_page_3.dart';
import 'package:flutter_app/pages/application/navigation-demo/pages/navigation_page_4.dart';

final navigationDemoRouteConfig = <RouteModel>[
  RouteModel(
    name: 'navigation_demo1',
    path: 'navigation_demo1',
    title: 'Naigation Demo 1',
    iconData: Icons.email,
    builder: (context, state) => NavigationPage1(),
  ),
  RouteModel(
    name: 'navigation_demo2',
    path: 'navigation_demo2',
    title: 'Naigation Demo 2',
    iconData: Icons.chair,
    builder: (context, state) => NavigationPage2(),
  ),
  RouteModel(
    name: 'navigation_demo3',
    path: 'navigation_demo3',
    title: 'Naigation Demo 3',
    iconData: Icons.chat,
    builder: (context, state) => NavigationPage3(),
  ),
  RouteModel(
    name: 'navigation_demo4',
    path: 'navigation_demo4',
    title: 'Naigation Demo 4',
    iconData: Icons.email,
    builder: (context, state) => NavigationPage4(),
  ),
];
