import 'package:flutter/material.dart';
import 'package:interface_example1/helpers/responsivness.dart';
import 'widgets/overview_cards_large.dart';
import 'widgets/overview_cards_medium.dart';
import 'widgets/overview_cards_small.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*Row(
            children: [
              Container(
                  margin: EdgeInsets.only(
                      top: ResponsiveWidget.isSmallScreen(context) ? 6: 5),
                  child: CustomText(
                    color: onBackground,
                    text: menuController.activeItem.value,
                    size: 24,
                    weight: FontWeight.bold,
                  )),
            ],
          ),*/

        Expanded(
            child: ListView(
          children: [
            if (ResponsiveWidget.isLargeScreen(context) ||
                ResponsiveWidget.isMediumScreen(context))
              if (ResponsiveWidget.isCustomSize(context))
                const OverviewCardsMedium()
              else
                const OverviewCardsLarge()
            else
              const OverviewCardsSmall(),
          ],
        ))
      ],
    );
  }
}
