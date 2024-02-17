import 'package:flutter/material.dart';
import 'package:flutter_app/models/routes/route_model.dart';
import 'package:flutter_app/pages/application/dashboard/dashboard-page.dart';
import 'package:flutter_app/pages/application/navigation-demo/navigation_demo_page.dart';
import 'package:flutter_app/pages/application/profile/profile_page.dart';
import 'package:flutter_app/pages/application/settings/settings_page.dart';

final homeRouteConfig = <RouteModel>[
  RouteModel(
    name: 'dashboard',
    path: 'dashboard',
    title: 'Dashboard',
    iconData: Icons.dashboard,
    builder: (context, state) => DashboardPage(),
  ),
  RouteModel(
    name: 'navigation-demo',
    path: 'navigation-demo',
    title: 'Navigation Demo',
    iconData: Icons.multiple_stop,
    builder: (context, state) => NavigationDemoPage(),
  ),
  RouteModel(
      name: 'profile',
      path: 'profile',
      title: 'Profile',
      iconData: Icons.nature_outlined,
      builder: (context, state) => ProfilePage()),
  RouteModel(
    isExpanded: true,
  ),
  RouteModel(
    name: 'settings',
    path: 'settings',
    title: 'Settings',
    iconData: Icons.settings,
    builder: (context, state) => SettingsPage(),
  ),
];

// final bottomRouteConfig = <RouteModel>[
//   RouteModel(
//       title: 'Logout',
//       iconData: Icons.logout,
//       builder: (context, state) => ProfilePage()),
// ];
