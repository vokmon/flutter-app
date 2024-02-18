import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/list_tile_logout_widget.dart';
import 'package:flutter_app/models/routes/route_model.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  final List<RouteModel> configs;
  final String matchedLocation;
  const AppDrawer(
      {super.key, required this.matchedLocation, required this.configs});

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Drawer(
      child: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              SizedBox(
                height: isPortrait ? null : 100,
                child: DrawerHeader(
                    child: Center(
                  child: Icon(
                    Icons.message,
                    size: 40,
                  ),
                )),
              ),

              ...configs.map((e) => e.isExpanded == true
                  ? Expanded(
                      child: Container(),
                    )
                  : ListTile(
                      title: Text(e.title!),
                      leading: Icon(e.iconData),
                      selected: matchedLocation.contains(e.name!),
                      onTap: () {
                        context.goNamed(e.name!);
                        context.pop();
                      },
                    )),

              // logout
              ListTileLoutoutWidget(),
              SizedBox(height: isPortrait ? 30 : 5),
            ]),
      ),
    );
  }
}
