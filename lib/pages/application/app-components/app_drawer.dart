import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/list_tile_logout_widget.dart';
import 'package:flutter_app/pages/application/app_route_config.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  final String matchedLocation;
  const AppDrawer({super.key, required this.matchedLocation});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(children: [
          // logo
          DrawerHeader(
              child: Center(
            child: Icon(
              Icons.message,
              size: 40,
            ),
          )),

          ...homeRouteConfig.map((e) => e.isExpanded == true
              ? Expanded(
                  child: Container(),
                )
              : ListTile(
                  title: Text(e.title!),
                  leading: Icon(e.iconData),
                  selected: e.name == matchedLocation,
                  onTap: () {
                    context.goNamed(e.name!);
                    context.pop();
                  },
                )),

          // logout
          ListTileLoutoutWidget(),
          SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }
}
