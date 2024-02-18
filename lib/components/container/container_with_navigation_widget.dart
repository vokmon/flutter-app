import 'package:flutter/material.dart';
import 'package:flutter_app/models/routes/route_model.dart';
import 'package:flutter_app/utils/screen_size_utils.dart';
import 'package:go_router/go_router.dart';

class ContainerWithNavigationWidget extends StatelessWidget {
  final List<RouteModel> routes;
  final Widget child;
  final int selectedIndex;

  const ContainerWithNavigationWidget(
      {super.key,
      required this.routes,
      required this.child,
      required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    if (ScreenSizeUtils.isMobile(context)) {
      return Scaffold(
        body: Center(
          child: child,
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              context.pushNamed(routes[index].name!);
            },
            items: routes
                .map((e) => BottomNavigationBarItem(
                    icon: Icon(e.iconData!), label: e.title))
                .toList()),
      );
    }

    return Scaffold(
        body: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...routes.map((e) => ListTile(
                  minLeadingWidth: 0,
                  title: Text(e.title!),
                  leading: Icon(e.iconData),
                  selected: routes[selectedIndex].name!.contains(e.name!),
                  onTap: () {
                    context.goNamed(e.name!);
                    context.pop();
                  },
                )),
          ],
        ),
      ),
      Expanded(child: child),
    ]));
  }
}
