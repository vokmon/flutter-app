import 'package:flutter/material.dart';

class ScreenSizeUtils {
  static Size getDimension(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static bool isMobile(BuildContext context) =>
      getDimension(context).width < 500;
  static bool isTablet(BuildContext context) =>
      getDimension(context).width >= 500 && getDimension(context).width < 1280;
  static bool isDesktop(BuildContext context) =>
      getDimension(context).width >= 1280;
}
