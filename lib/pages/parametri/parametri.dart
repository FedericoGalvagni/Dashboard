import 'package:flutter/material.dart';
import 'package:interface_example1/helpers/responsivness.dart';
import 'package:interface_example1/pages/parametri/widget/parametri_large.dart';
import 'package:interface_example1/pages/parametri/widget/parametri_medium.dart';
import 'package:interface_example1/pages/parametri/widget/parametri_small.dart';

class ParametriPage extends StatelessWidget {
  const ParametriPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(
            child: ListView(
          children: [
            if (ResponsiveWidget.isLargeScreen(context) ||
                ResponsiveWidget.isMediumScreen(context))
              if (ResponsiveWidget.isCustomSize(context))
                const ParametriMedium() //medium
              else
                const ParametriLarge() //large

            else
              const ParametriSmall(), //small
          ],
        ))
      ],
    );
  }
}
