import 'package:flutter/material.dart';
import 'package:interface_example1/constants/spacer.dart';
import 'package:interface_example1/helpers/responsivness.dart';

class AutoHorizontalSpacer extends StatelessWidget {
  const AutoHorizontalSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    if (ResponsiveWidget.isSmallScreen(context)) {
      return SizedBox(
        width: _width / SpacerC.smallRateo,
      );
    } else if (ResponsiveWidget.isLargeScreen(context)) {
      return SizedBox(
        width: _width / SpacerC.largeRateo,
      );
    } else if (ResponsiveWidget.isMediumScreen(context)) {
      return SizedBox(
        width: _width / SpacerC.mediumRateo,
      );
    } else if (ResponsiveWidget.isCustomSize(context)) {
      return SizedBox(
        width: _width / SpacerC.largeRateo,
      );
    }
    debugPrint("Failed to build spacer");
    return Container();
  }
}
